using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using FEL.APU;
using System.Web.UI.HtmlControls;
using HER;

public partial class APU_APU_OFERTA_RUBRO : PaginaBaseKCG
{
    public Apu_Oferta ApuOferta_Actual
    {
        get
        {
            if (ViewState["APU_OFERTA"] == null)
                ViewState["APU_OFERTA"] = ObtenerApuOferta();
            return (Apu_Oferta)ViewState["APU_OFERTA"];
        }
    }


    Apu_Oferta ObtenerApuOferta()
    {
        //FEL.APU.BO_Apu_Oferta datos = new BO_Apu_Oferta();
        //return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["Apu_Oferta_Id"])[0];
        Apu_Oferta tmpOferta = new Apu_Oferta();
        tmpOferta.Estado = "BOR";
        tmpOferta.Apu_Presupuesto_Estado = "PEN";
        return tmpOferta;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga("Apu_Oferta_Rubro_Id");                        
        cargarBotones();
        if (gvapu_oferta_rubro.SelectedIndex > -1)
        {
            btnequipos.Enabled = true;
            btnmanodeobra.Enabled = true;
            btnmateriales.Enabled = true;
            btntransporte.Enabled = true;
        }
        else
        {
            btnequipos.Enabled = false;
            btnmanodeobra.Enabled = false;
            btnmateriales.Enabled = false;
            btntransporte.Enabled = false;
        }
        gvapu_oferta_rubro.DataBound += new EventHandler(gvapu_oferta_rubro_DataBound);
        Fv.DataBound += new EventHandler(Fv_DataBound);
        //Fv.DataBound += new EventHandler(Fv_DataBoundApuOfertaRubro);
    }    

    private void cargarBotones()
    {
        btnequipos.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_EquipoRecursoKCG.Text").ToString();
        btnequipos.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_EquipoRecursoKCG.ToolTip").ToString();
        btnmanodeobra.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Mano_ObraRecursoKCG.Text").ToString();
        btnmanodeobra.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_Mano_ObraRecursoKCG.ToolTip").ToString();
        btnmateriales.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_MaterialRecursoKCG.Text").ToString();
        btnmateriales.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_MaterialRecursoKCG.ToolTip").ToString();
        btntransporte.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_TransporteRecursoKCG.Text").ToString();
        btntransporte.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_TransporteRecursoKCG.ToolTip").ToString();
        OfertaButton.Text = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_OfertaRecursoKCG.Text").ToString();
        OfertaButton.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_Rubro_OfertaRecursoKCG.ToolTip").ToString();        
        lblcostototal.Text = GetLocalResourceObject("Lab_Costo_TotalRecursoKCG.Text").ToString();
        lblfecha.Text = GetLocalResourceObject("Lab_FechaRecursoKCG.Text").ToString();
        lblc.Text = "$";
        lbld.Text = "$";
        lble.Text = "$";
        lblf.Text = "$";
              
    }

    void gvapu_oferta_rubro_DataBound(object sender, EventArgs e)
    {
        if (gvapu_oferta_rubro.SelectedIndex < gvapu_oferta_rubro.Rows.Count)
        {
            if (gvapu_oferta_rubro.SelectedIndex != -1)
            {
                btnequipos.Enabled = true;
                btnmanodeobra.Enabled = true;
                btnmateriales.Enabled = true;
                btntransporte.Enabled = true;
                EquipoCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Equipo_costo_total"].ToString();
                EquipoUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Equipo_ultima_fecha_update"].ToString();
                ManoObraCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Mano_obra_costo_total"].ToString();
                ManoObraUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Mano_obra_ultima_fecha_update"].ToString();
                MaterialCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Material_costo_total"].ToString();
                MaterialUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Material_ultima_fecha_update"].ToString();
                TransporteCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Transporte_costo_total"].ToString();
                TransporteUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Transporte_ultima_fecha_update"].ToString();
            }
            else
            {
                btnequipos.Enabled = false;
                btnmanodeobra.Enabled = false;
                btnmateriales.Enabled = false;
                btntransporte.Enabled = false;
                EquipoCostoTotal.Text = "";
                EquipoUltimaFechaUpdate.Text = "";
                ManoObraCostoTotal.Text = "";
                ManoObraUltimaFechaUpdate.Text = "";
                MaterialCostoTotal.Text = "";
                MaterialUltimaFechaUpdate.Text = "";
                TransporteCostoTotal.Text = "";
                TransporteUltimaFechaUpdate.Text = "";
            }
        }
    }

    //void Fv_DataBoundApuOfertaRubro(object sender, EventArgs e)
    //{
    //    AsignarAcceso(ApuOferta_Actual.Etapa);
    //    Gv.DataBind();
    //}

    //private void AsignarAcceso(string Apu_Oferta_Etapa )
    //{
    //    switch (Apu_Oferta_Etapa)
    //    {
    //        case "BOR":
    //            break;

    //        case "DEF":
    //            if (Fv.CurrentMode == FormViewMode.Insert)
    //            {
    //                /*Button btnInsert = (Button)Fv.FindControl("InsertButton");
    //                Button btnCancelInsert = (Button)Fv.FindControl("InsertCancelButton");
    //                btnInsert.Enabled = false;
    //                btnCancelInsert.Enabled = false;*/
    //                Panel Panel2 = (Panel)Fv.FindControl("Panel2");                   
    //                Panel2.Enabled = false;                    
                   
    //            }
    //            else if (Fv.CurrentMode == FormViewMode.ReadOnly)
    //            {
    //                Button btnEdit = (Button)Fv.FindControl("EditButton");
    //                Button btnDelete = (Button)Fv.FindControl("DeleteButton");
    //                Button btnNew = (Button)Fv.FindControl("NewButton");
    //                btnEdit.Enabled = true;
    //                btnDelete.Enabled = false;
    //                btnNew.Enabled = false;

    //            }
    //            else if (Fv.CurrentMode == FormViewMode.Edit)
    //            {
    //                TextBox txbApuRubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
    //                txbApuRubroNombre.ReadOnly = true;
    //                txbApuRubroNombre.CssClass = "";
    //            }
    //            break;

    //        case "CON":
    //            if (Fv.CurrentMode == FormViewMode.Insert)
    //            {
    //                /*Button btnInsert = (Button)Fv.FindControl("InsertButton");
    //                Button btnCancelInsert = (Button)Fv.FindControl("InsertCancelButton");
    //                btnInsert.Enabled = false;
    //                btnCancelInsert.Enabled = false;*/
    //                Panel Panel2 = (Panel)Fv.FindControl("Panel2");                   
    //                Panel2.Enabled = false;                  
    //            }
    //            else if (Fv.CurrentMode == FormViewMode.ReadOnly)
    //            {
    //                Button btnEdit = (Button)Fv.FindControl("EditButton");
    //                Button btnDelete = (Button)Fv.FindControl("DeleteButton");
    //                Button btnNew = (Button)Fv.FindControl("NewButton");
    //                btnEdit.Enabled = false;
    //                btnDelete.Enabled = false;
    //                btnNew.Enabled = false;
    //            }
    //            /*else
    //            {
    //                goto case "DEF";
    //            }*/
    //            break;

    //    }

    //}

    void Fv_DataBound(object sender, EventArgs e)
    {        
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox Cantidad = (TextBox)Fv.FindControl("Cantidad");
            Cantidad.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Total = (TextBox)Fv.FindControl("Costo_Total");
            Costo_Total.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Unitario = (TextBox)Fv.FindControl("Costo_Unitario");
            Costo_Unitario.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);

            string estado = ApuOferta_Actual.Estado;
            string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
            if (estado == "BOR" || presupuesto_estado == "PEN")
                HabilitarControl("InsertButton");
            else
                DeshabilitarControl("InsertButton");
            
        }

        if (fvapu_oferta_rubro.CurrentMode == FormViewMode.Edit || fvapu_oferta_rubro.CurrentMode == FormViewMode.Insert)
        {
            TextBox Apu_RNombre = (TextBox)fvapu_oferta_rubro.FindControl("Apu_Rubro_Nombre");
            string Apu_Rubro_Nombre = (Apu_RNombre.Text).Trim();        
        }

        if (gvapu_oferta_rubro.SelectedIndex < gvapu_oferta_rubro.Rows.Count)
        {
            if (gvapu_oferta_rubro.SelectedIndex != -1)
            {
                btnequipos.Enabled = true;
                btnmanodeobra.Enabled = true;
                btnmateriales.Enabled = true;
                btntransporte.Enabled = true;
                if (gvapu_oferta_rubro.SelectedDataKey != null)
                {
                    EquipoCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Equipo_costo_total"].ToString();
                    EquipoUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Equipo_ultima_fecha_update"].ToString();
                    ManoObraCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Mano_obra_costo_total"].ToString();
                    ManoObraUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Mano_obra_ultima_fecha_update"].ToString();
                    MaterialCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Material_costo_total"].ToString();
                    MaterialUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Material_ultima_fecha_update"].ToString();
                    TransporteCostoTotal.Text = gvapu_oferta_rubro.SelectedDataKey["Transporte_costo_total"].ToString();
                    TransporteUltimaFechaUpdate.Text = gvapu_oferta_rubro.SelectedDataKey["Transporte_ultima_fecha_update"].ToString();
                }
                else
                {
                    btnequipos.Enabled = false;
                    btnmanodeobra.Enabled = false;
                    btnmateriales.Enabled = false;
                    btntransporte.Enabled = false;
                    EquipoCostoTotal.Text = "";
                    EquipoUltimaFechaUpdate.Text = "";
                    ManoObraCostoTotal.Text = "";
                    ManoObraUltimaFechaUpdate.Text = "";
                    MaterialCostoTotal.Text = "";
                    MaterialUltimaFechaUpdate.Text = "";
                    TransporteCostoTotal.Text = "";
                    TransporteUltimaFechaUpdate.Text = "";
                }
            }            
        }
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = fvapu_oferta_rubro.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = fvapu_oferta_rubro.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Rubro); }
    }

    [KPropiedadPersistente("PageSize")]
    protected override GridView Gv
    {
        get { return gvapu_oferta_rubro; }        
    }

    protected override FormView Fv
    {
        get { return fvapu_oferta_rubro; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_oferta_rubro; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvapu_oferta_rubro; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }


    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_OFERTA_RUBRO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOferta_Actual.Codigo));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOferta_Actual.Nombre));
           
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetMaterial(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Rubro boApu_rubro = new BO_Apu_Rubro();
        List<Apu_Rubro> litApuOfetaRubro = boApu_rubro.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuOfetaRubro.Count && i < count; i++)
        {
            string value = litApuOfetaRubro[i].Id + "||" +
                           litApuOfetaRubro[i].Codigo + "||" +
                           litApuOfetaRubro[i].Unidad + "||" +
                           litApuOfetaRubro[i].Costo_Total.ToString();                           

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuOfetaRubro[i].Nombre, value));
        }

        return opciones.ToArray();
    }

    protected void btnequipos_Click(object sender, EventArgs e)
    {
        TextBox OfertaRubroId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        //TextBox OfertaCodigo = (TextBox)Fv.FindControl("Apu_Oferta_Codigo");
        //TextBox OfertaNombre = (TextBox)Fv.FindControl("Apu_Oferta_Nombre");
        //TextBox OfertaEtapa = (TextBox)Fv.FindControl("Apu_Oferta_Etapa");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        //TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        //TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        //TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //string presupuestoEstado = ApuOferta_Actual.Apu_Presupuesto_Estado;// Request.QueryString["Apu_Presupuesto_Estado"];
        //string estado = ApuOferta_Actual.Estado;// Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_RUBRO_EQUIPO.aspx?Apu_Oferta_Rubro_Id=" + OfertaRubroId.Text + 
            "&Apu_Oferta_Id=" + OfertaId.Text + 
            //"&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            //"&Apu_Oferta_Nombre=" + OfertaNombre.Text + 
            //"&Apu_Oferta_Etapa=" + OfertaEtapa.Text + 
            "&Apu_Rubro_Id=" + RubroId.Text + 
            //"&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            //"&Apu_Rubro_Nombre=" + RubroNombre.Text +
            //"&Apu_Rubro_Unidad=" + RubroUnidad.Text + 
            //"&Estado=" + estado +
            //"&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }

    protected void btnmanodeobra_Click(object sender, EventArgs e)
    {
        TextBox OfertaRubroId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        //TextBox OfertaCodigo = (TextBox)Fv.FindControl("Apu_Oferta_Codigo");
        //TextBox OfertaNombre = (TextBox)Fv.FindControl("Apu_Oferta_Nombre");
        //TextBox OfertaEtapa = (TextBox)Fv.FindControl("Apu_Oferta_Etapa");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        //TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        //TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        //TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        //string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_RUBRO_MANO_OBRA.aspx?Apu_Oferta_Rubro_Id=" + OfertaRubroId.Text + 
            "&Apu_Oferta_Id=" + OfertaId.Text + 
            //"&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            //"&Apu_Oferta_Nombre=" + OfertaNombre.Text + 
            //"&Apu_Oferta_Etapa=" + OfertaEtapa.Text + 
            "&Apu_Rubro_Id=" + RubroId.Text + 
            //"&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            //"&Apu_Rubro_Nombre=" + RubroNombre.Text +
            //"&Apu_Rubro_Unidad=" + RubroUnidad.Text + 
            //"&Estado=" + estado +
            //"&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }

    protected void btnmateriales_Click(object sender, EventArgs e)
    {
        TextBox OfertaRubroId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        //TextBox OfertaCodigo = (TextBox)Fv.FindControl("Apu_Oferta_Codigo");
        //TextBox OfertaNombre = (TextBox)Fv.FindControl("Apu_Oferta_Nombre");
        //TextBox OfertaEtapa = (TextBox)Fv.FindControl("Apu_Oferta_Etapa");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        //TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        //TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        //TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        //string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_RUBRO_MATERIAL.aspx?Apu_Oferta_Rubro_Id=" + OfertaRubroId.Text + 
            "&Apu_Oferta_Id=" + OfertaId.Text + 
            //"&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            //"&Apu_Oferta_Nombre=" + OfertaNombre.Text + 
            //"&Apu_Oferta_Etapa=" + OfertaEtapa.Text + 
            "&Apu_Rubro_Id=" + RubroId.Text + 
            //"&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            //"&Apu_Rubro_Nombre=" + RubroNombre.Text +
            //"&Apu_Rubro_Unidad=" + RubroUnidad.Text + 
            //"&Estado=" + estado +
            //"&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }

    protected void btntransporte_Click(object sender, EventArgs e)
    {
        TextBox OfertaRubroId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");
        //TextBox OfertaCodigo = (TextBox)Fv.FindControl("Apu_Oferta_Codigo");
        //TextBox OfertaNombre = (TextBox)Fv.FindControl("Apu_Oferta_Nombre");
        //TextBox OfertaEtapa = (TextBox)Fv.FindControl("Apu_Oferta_Etapa");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        //TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        //TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        //TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //string presupuestoEstado = Request.QueryString["Apu_Presupuesto_Estado"];
        //string estado = Request.QueryString["Estado"];
        Response.Redirect("~/APU/APU_OFERTA_RUBRO_TRANSPORTE.aspx?Apu_Oferta_Rubro_Id=" + OfertaRubroId.Text + 
            "&Apu_Oferta_Id=" + OfertaId.Text + 
            //"&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            //"&Apu_Oferta_Nombre=" + OfertaNombre.Text + 
            //"&Apu_Oferta_Etapa=" + OfertaEtapa.Text + 
            "&Apu_Rubro=Id=" + RubroId.Text + 
            //"&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            //"&Apu_Rubro_Nombre=" + RubroNombre.Text +
            //"&Apu_Rubro_Unidad=" + RubroUnidad.Text + 
            //"&Estado=" + estado +
            //"&Apu_Presupuesto_Estado=" + presupuestoEstado +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

    }


    protected void OfertaButton_Click(object sender, EventArgs e)
    {
        TextBox OfertaRubroId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaId = (TextBox)Fv.FindControl("Apu_Oferta_Id");        
        Response.Redirect("~/APU/APU_OFERTA.aspx?Apu_Oferta_Rubro_Id=" + OfertaRubroId.Text +
            "&Apu_Oferta_Id=" + OfertaId.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);   

    }



}
