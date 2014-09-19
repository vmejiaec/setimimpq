using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;
using System.Web.Services;
using System.Collections.Generic;
using System.Globalization;
using Koala.KoalaWebControls;

public partial class APU_APU_PROYECTO_RUBRO : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga("Apu_Proyecto_Rubro_Id");                        
        string strApu_Proyecto_Rubro_Id = Request.QueryString["Apu_Proyecto_Rubro_Id"];                       
        if (!string.IsNullOrEmpty(strApu_Proyecto_Rubro_Id))
        {
            AsignarParametrosDataSourceDeatailsView(strApu_Proyecto_Rubro_Id);
            Fv.DefaultMode = FormViewMode.ReadOnly;
        }
        cargarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBound);
        gvapu_proyecto_rubro.DataBound += new EventHandler(gvapu_proyecto_rubro_DataBound);
    }

    void gvapu_proyecto_rubro_DataBound(object sender, EventArgs e)
    {
        if (gvapu_proyecto_rubro.SelectedIndex > -1)
            Especificacion.Enabled = true;
        else
            Especificacion.Enabled = false;
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox cantidad = (TextBox)Fv.FindControl("Cantidad");
            cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Unitario = (TextBox)Fv.FindControl("Costo_Unitario");
            Costo_Unitario.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Total = (TextBox)Fv.FindControl("Costo_Total");
            Costo_Total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Rendimiento_Equipo = (TextBox)Fv.FindControl("Rendimiento_Equipo");
            Rendimiento_Equipo.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Rendimiento_Mano_Obra = (TextBox)Fv.FindControl("Rendimiento_Mano_Obra");
            Rendimiento_Mano_Obra.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Equipo_costo_total = (TextBox)Fv.FindControl("Equipo_costo_total");
            Equipo_costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Mano_obra_costo_total = (TextBox)Fv.FindControl("Mano_obra_costo_total");
            Mano_obra_costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Material_costo_total = (TextBox)Fv.FindControl("Material_costo_total");
            Material_costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Transporte_costo_total = (TextBox)Fv.FindControl("Transporte_costo_total");
            Transporte_costo_total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

            string estado = Request.QueryString["Estado"];
            string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
            if (estado == "BOR" || presupuesto_estado == "PEN")
                HabilitarControl("InsertButton");
            else
                DeshabilitarControl("InsertButton");
        }
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvapu_proyecto_rubro.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }        
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvapu_proyecto_rubro.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }


    private void cargarBotones()
    {
        Especificacion.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TecnicaRecursoKCG.Text").ToString();
        Especificacion.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_TecnicaRecursoKCG.ToolTip").ToString();
        BtnProyecto.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_ProyectoRecursoKCG.Text").ToString();
        BtnProyecto.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_ProyectoRecursoKCG.ToolTip").ToString();
    }        
    
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro); }
    }

    protected override GridView Gv
    {
        get { return gvapu_proyecto_rubro; }
    }

    protected override FormView Fv
    {
        get { return fvapu_proyecto_rubro; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_proyecto_rubro; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_proyecto_rubro; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_RUBRO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Id", Request.QueryString["Apu_Proyecto_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", Request.QueryString["Apu_Proyecto_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", Request.QueryString["Apu_Proyecto_Nombre"]));
        }       

        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetProyectoRubrotest(string codigo)
    {
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Rubro boApuRubro = new BO_Apu_Rubro();

        List<Apu_Rubro> litApuRubro = boApuRubro.GetByCodigo("", s, codigo);

        return new string[] { litApuRubro[0].Id, litApuRubro[0].Nombre, litApuRubro[0].Unidad, litApuRubro[0].Costo_Total.ToString(),  
                            litApuRubro[0].Rendimiento_Mano_Obra.ToString(), litApuRubro[0].Rendimiento_Equipo.ToString(), 
                            litApuRubro[0].Apu_Subtitulo_id, litApuRubro[0].Apu_rubro_equipo_costo_total.ToString(), 
                            litApuRubro[0].Apu_rubro_mano_obra_costo_total.ToString(), litApuRubro[0].Apu_rubro_material_costo_total.ToString(), 
                            litApuRubro[0].Apu_rubro_transporte_costo_total.ToString()};        
    }

    protected void Especificacion_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");     
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        TextBox ProyectoEtapa = (TextBox)Fv.FindControl("Apu_Proyecto_Etapa");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        //string RubroId = gvapu_proyecto_rubro.DataKeys[gvapu_proyecto_rubro.SelectedIndex].Values["Apu_Rubro_Id"].ToString();
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad"); 
        //Response.Redirect("~/APU/APU_PROYECTO_RUBRO_TECNICA.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + "&Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Proyecto_Etapa=" + ProyectoEtapa.Text + "&Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + RubroNombre.Text + "&Apu_Rubro_Unidad=" + RubroUnidad.Text);
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_TECNICA.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + "&Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Proyecto_Etapa=" + ProyectoEtapa.Text + "&Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + " " + "&Apu_Rubro_Unidad=" + RubroUnidad.Text + "&Estado=" + Request.QueryString["Estado"] + "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }   

    protected void BtnEquipo_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");        
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");        
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];        
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_EQUIPO.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + 
            "&Apu_Proyecto_Id=" + ProyectoId.Text +             
            "&Apu_Rubro_Id=" + RubroId.Text +             
            "&Estado=" + estado + 
            "&Apu_Presupuesto_Estado=" + presupuestoEstado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }
    protected void BtnManoObra_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");        
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");       
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_MANO_OBRA.aspx?Apu_Proyecto_Rubro_Id=" + 
            ProyectoRubroId.Text + 
            "&Apu_Proyecto_Id=" + ProyectoId.Text +             
            "&Apu_Rubro_Id=" + RubroId.Text +             
            "&Estado=" + estado + 
            "&Apu_Presupuesto_Estado=" + presupuestoEstado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]); 
    }

    protected void InvalidarCache(string indiceCache)
    {
        if (Cache[indiceCache] != null)
        {
            Cache[indiceCache] = new object();
        }
    }

    //protected void IniciarCache()
    //{
    //    if (!string.IsNullOrEmpty(OdsGv.CacheKeyDependency))
    //    {
    //        if (Cache[OdsGv.CacheKeyDependency] == null)
    //        {
    //            Cache[OdsGv.CacheKeyDependency] = new object();
    //        }
    //    }
    //}   

    protected void BtnMateriales_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");        
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");        
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_MATERIAL.aspx?Apu_Proyecto_Rubro_Id=" + 
            ProyectoRubroId.Text + 
            "&Apu_Proyecto_Id=" + ProyectoId.Text +             
            "&Apu_Rubro_Id=" + RubroId.Text +            
            "&Estado=" + estado + 
            "&Apu_Presupuesto_Estado=" + presupuestoEstado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);  
    }

    protected void BtnTransporte_Click(object sender, EventArgs e)
    {
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");       
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");       
        string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_TRANSPORTE.aspx?Apu_Proyecto_Rubro_Id=" + 
            ProyectoRubroId.Text + 
            "&Apu_Proyecto_Id=" + ProyectoId.Text +            
            "&Apu_Rubro_Id=" + RubroId.Text +            
            "&Estado=" + Request.QueryString["Estado"] + 
            "&Apu_Presupuesto_Estado=" + presupuestoEstado + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]); 
    }

    protected void BtnProyecto_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + 
            ProyectoId.Text + 
            "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + 
            "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + 
            "&Estado=" + Request.QueryString["Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }  
}
