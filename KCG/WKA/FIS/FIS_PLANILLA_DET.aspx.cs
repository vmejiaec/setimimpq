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
using Koala.KoalaWebControls;
using System.Web.Services;
using FEL.FIS;
using System.Collections.Generic;
using FEL.APU;
using AjaxControlToolkit;
using System.Drawing;
using System.Globalization;

public partial class FIS_FIS_PLANILLA_DET : PaginaBaseKCG
{
    //variables globales
    public string Tipo_Planilla = "";
    public string Presupuesto_Id = "";
    private Color aux = Color.LemonChiffon;

    protected void Page_Load(object sender, EventArgs e)
    {
       SeleccionarItemEnCarga(null);
        Fv_Fis_Planilla_Det.DataBound += new EventHandler(Fv_Fis_Planilla_Det_DataBound);
        //pnl_Fisca.DataBind();
        pnl_Planilla.DataBind();
    }

    void Fv_Fis_Planilla_Det_DataBound(object sender, EventArgs e)
    {
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string estado = null;
        TextBox Apu_Rubro_Nombre = (TextBox)Fv_Fis_Planilla_Det.FindControl("Apu_Rubro_Nombre") ;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        FEL.FIS.BO_Fis_Fiscalizacion fisFiscalizacion = new BO_Fis_Fiscalizacion();
        List<Fis_Fiscalizacion> lstFiscalizacion = fisFiscalizacion.GetById("", s, Fiscalizacion_Id);
        if (lstFiscalizacion.Count > 0)
        {
            Apu_Origen_Codigo.Text = lstFiscalizacion[0].Apu_Origen_Codigo;
            Codigo_Institucional.Text = lstFiscalizacion[0].Codigo_Institucion;
            Fecha_Ini_Contrato.Text = lstFiscalizacion[0].Fecha_Ini_Contrato.ToString();
            Plazo_Contrato.Text = lstFiscalizacion[0].Plazo_Ampliacion.ToString();
            Fecha_Fin_Contrato.Text = lstFiscalizacion[0].Fecha_Final_Ampliacion.ToString();
            lbl_Estado.Text = lstFiscalizacion[0].Estado_Nombre;
            Apu_Origen_Nombre.Text = lstFiscalizacion[0].Apu_Origen_Nombre;
            Fiscalizador_Id.Text = lstFiscalizacion[0].Fiscalizador_Per_Personal_Id;
            estado = lstFiscalizacion[0].Estado;
        }
        FEL.FIS.BO_Fis_Planilla fisPlanilla = new BO_Fis_Planilla();
        List<Fis_Planilla> lstPlanilla = fisPlanilla.GetById("", s, Planilla_Id);
        if (lstPlanilla.Count > 0)
        {
            Numero_Planilla.Text = lstPlanilla[0].Numero_Planilla;
            Fecha_Ultimo_Ingreso.Text = lstPlanilla[0].Fecha_Ultimo_Ingreso.ToString();
            Total.Text = lstPlanilla[0].Total.ToString("N2");
            Tipo_Nombre.Text = lstPlanilla[0].Tipo_Nombre;
            Tipo_Planilla = lstPlanilla[0].Tipo_Planilla;
            Presupuesto_Id = lstPlanilla[0].Apu_Presupuesto_Id;
            txt_Tipo_Planilla.Text = Tipo_Planilla;
            Apu_Presupuesto_Id.Text = Presupuesto_Id;            
        }

        if (Fv_Fis_Planilla_Det.CurrentMode == FormViewMode.Insert || Fv_Fis_Planilla_Det.CurrentMode == FormViewMode.Edit)
        {
            ((AutoCompleteExtender)Fv_Fis_Planilla_Det.FindControl("AutoCo_Rubro_Nombre")).ContextKey = txt_Tipo_Planilla.Text + "||" + Presupuesto_Id + "||" + Planilla_Id;

            if (Fv_Fis_Planilla_Det.CurrentMode == FormViewMode.Insert)
            {
                Button InsertButton = (Button)Fv_Fis_Planilla_Det.FindControl("InsertButton");        
                TextBox Fis_Planilla_Id = (TextBox)Fv_Fis_Planilla_Det.FindControl("Fis_Planilla_Id");
                TextBox Cantidad = (TextBox)Fv_Fis_Planilla_Det.FindControl("Cantidad");
                if (Cantidad.Text == string.Empty)
                    Cantidad.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
                Fis_Planilla_Id.Text = Request.QueryString["Fis_Planilla_Id"];
                
                if (lstFiscalizacion[0].Fiscalizador_Per_Personal_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")                
                    InsertButton.Enabled = true;
                else
                    InsertButton.Enabled = false;
            }

            if (Fv_Fis_Planilla_Det.CurrentMode == FormViewMode.Edit)
            {
                TextBox Apu_Rubro_Codigo = (TextBox)Fv_Fis_Planilla_Det.FindControl("Apu_Rubro_Codigo");
                TextBox Apu_Rubro_Unidad = (TextBox)Fv_Fis_Planilla_Det.FindControl("Apu_Rubro_Unidad");
                TextBox Cantidad = (TextBox)Fv_Fis_Planilla_Det.FindControl("Cantidad");
                TextBox Costo = (TextBox)Fv_Fis_Planilla_Det.FindControl("Costo");
                if (txt_Tipo_Planilla.Text == "AVA")
                {                    
                    Apu_Rubro_Codigo.Enabled = false;
                    Apu_Rubro_Unidad.Enabled = false;
                    Cantidad.Enabled = true;
                    Costo.Enabled = false;
                }
                else if (txt_Tipo_Planilla.Text == "COS")
                {
                    Apu_Rubro_Codigo.Enabled = true;
                    Apu_Rubro_Unidad.Enabled = true;
                    Cantidad.Enabled = true;
                    Costo.Enabled = true;
                }
            }
            if (txt_Tipo_Planilla.Text == "COS")
                Apu_Rubro_Nombre.BackColor = aux;
        }

        if (Fv_Fis_Planilla_Det.CurrentMode == FormViewMode.ReadOnly)
        {
            Button EditButton = (Button)Fv_Fis_Planilla_Det.FindControl("EditButton");
            Button DeleteButton = (Button)Fv_Fis_Planilla_Det.FindControl("DeleteButton");
            Button NewButton = (Button)Fv_Fis_Planilla_Det.FindControl("NewButton");
            if (lstFiscalizacion[0].Fiscalizador_Per_Personal_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")
            {
                EditButton.Enabled = true;
                DeleteButton.Enabled = true;
                NewButton.Enabled = true;
            }
            else
            {
                EditButton.Enabled = false;
                DeleteButton.Enabled = false;
                NewButton.Enabled = false;
            }           
        }
    }

    [WebMethod]
    static public string[] Get_Apu_Rubro_Nombre(string prefixText, int count, string contextKey)
    {

        if (count == 0) count = 10;
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        List<string> opciones = new List<string>();

        string[] Parametros = contextKey.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);
        
        if (Parametros[0] == "AVA")
        {
            FEL.APU.BO_Apu_Presupuesto_Rubro presupuestoRubro = new BO_Apu_Presupuesto_Rubro();
            List<Apu_Presupuesto_Rubro> lstPresupuesto = presupuestoRubro.GetByLikePresupuestoPlanilla("", s, Parametros[1], prefixText + "%", "DIS", Parametros[2]);
            //List<string> opciones = new List<string>();
            for (int i = 0; i < lstPresupuesto.Count; i++)
            {
                string value = lstPresupuesto[i].Apu_Rubro_Codigo + "||" +
                                lstPresupuesto[i].Id + "||" +
                                lstPresupuesto[i].Apu_Rubro_Unidad + "||" +                                
                string.Format("{0:N2}", lstPresupuesto[i].Costo_Unitario);

                opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstPresupuesto[i].Apu_Rubro_Nombre, value));
            }
        }
        //if (Parametros[0] == "COS")
        //{
        //    FEL.FIS.BO_Fis_Planilla_Det planillaDet = new BO_Fis_Planilla_Det();
        //    List<Fis_Planilla_Det> lstPlanillaDet = planillaDet.GetByLikePrespRub("", s, Parametros[1], prefixText + "%");
        //    for (int i = 0; i < lstPlanillaDet.Count; i++)
        //    {
        //        string value = lstPlanillaDet[i].Apu_Rubro_Codigo + "||" +
        //                       lstPlanillaDet[i].Id + "||" + 
        //                       lstPlanillaDet[i].Apu_Rubro_Unidad + "||" +
        //                       lstPlanillaDet[i].Cantidad + "||" +
        //        string.Format("{0:N2}", lstPlanillaDet[i].Costo);
        //        opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstPlanillaDet[i].Apu_Rubro_Nombre, value));
        //    }
        //}
        return opciones.ToArray();
    }

    protected void Btn_Proyecto_Click(object sender, EventArgs e)
    {
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + Fiscalizacion_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Planilla_Proyecto_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FIS/FIS_PLANILLA.aspx?Apu_Presupuesto_Id=" + Apu_Presupuesto_Id.Text + 
            "&Fiscalizador_Per_Personal_Id=" + Fiscalizador_Id.Text +
            "&Fis_Planilla_Id=" + Request.QueryString["Fis_Planilla_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Resumen_Planilla_Click(object sender, EventArgs e)
    {
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA_RESUMEN.aspx?Fis_Planilla_Id=" + Planilla_Id + 
            "&Fis_Fiscalizacion_Id=" + Fiscalizacion_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Fis_Planilla_Periodo_Click(object sender, EventArgs e)
    {
        string fechaInicio = Request.QueryString["Fecha_Inicial"];
        string fechaFin = Request.QueryString["Fecha_Final"];
        Response.Redirect("~/FIS/FIS_PLANILLA_PERIODO.aspx?Fecha_Inicial=" + fechaInicio + "&Fecha_Final=" + fechaFin);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; ; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Planilla_Det); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Planilla_Det; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Planilla_Det; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Planilla_Det; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Planilla_Det; }
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
        get { return KFiltro; }
    }

    protected override string Contenedor
    {
        get { return "FIS_PLANILLA_DET"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
