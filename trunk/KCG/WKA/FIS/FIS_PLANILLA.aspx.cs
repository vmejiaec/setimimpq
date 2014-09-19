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
using System.Web.Services;
using System.Collections.Generic;
using FEL.PAR;
using FEL.PER;
using FEL.FIS;
using System.Globalization;

public partial class FIS_FIS_PLANILLA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga("Fis_Planilla_Id");
        Fv_Fis_Planilla.DataBound += new EventHandler(Fv_Fis_Planilla_DataBound);
        pnl_Proyecto.DataBind();
    }

    void Fv_Fis_Planilla_DataBound(object sender, EventArgs e)
    {
        TextBox Tipo_Planilla = (TextBox)Fv_Fis_Planilla.FindControl("Tipo_Planilla");
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];
        string Fiscalizador_Id = null, estado = null;
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        FEL.FIS.BO_Fis_Fiscalizacion boFiscalizacion = new BO_Fis_Fiscalizacion();
        List<Fis_Fiscalizacion> lstFiscalizacion = boFiscalizacion.GetById("", s, ApuPresupuestoId);
        if (lstFiscalizacion.Count > 0)
        {
            Proy_Codigo.Text = lstFiscalizacion[0].Apu_Origen_Codigo;
            Proy_CodInst.Text = lstFiscalizacion[0].Codigo_Institucion;
            Proy_FechaI.Text = Convert.ToString(lstFiscalizacion[0].Fecha_Ini_Contrato);
            Proy_Plazo.Text = Convert.ToString(lstFiscalizacion[0].Plazo_Ampliacion);
            Proy_FechaF.Text = Convert.ToString(lstFiscalizacion[0].Fecha_Final_Ampliacion);
            Proy_Estado.Text = Convert.ToString(lstFiscalizacion[0].Estado_Nombre);
            Proy_Proyecto.Text = lstFiscalizacion[0].Apu_Origen_Nombre;
            Fiscalizador_Id = lstFiscalizacion[0].Fiscalizador_Per_Personal_Id;
            estado = lstFiscalizacion[0].Estado; 
        }

        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.Insert)
        {
            Button btnInsertar = (Button)Fv_Fis_Planilla.FindControl("InsertButton");            
            DropDownList ddl_Tipo_Planilla = (DropDownList)Fv_Fis_Planilla.FindControl("ddl_Tipo_Planilla");            
            if (Tipo_Planilla.Text == string.Empty)
                Tipo_Planilla.Text = ddl_Tipo_Planilla.SelectedValue;
            else
                ddl_Tipo_Planilla.SelectedValue = Tipo_Planilla.Text;
            Btn_Fis_Planilla_Def.Enabled = false;
            TextBox Apu_Presupuesto_Id = (TextBox)Fv_Fis_Planilla.FindControl("Apu_Presupuesto_Id");
            Apu_Presupuesto_Id.Text = Request.QueryString["Apu_Presupuesto_Id"];
            TextBox Anticipo_Devengar = (TextBox)Fv_Fis_Planilla.FindControl("Anticipo_Devengar");
            Anticipo_Devengar.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);

            if (Fiscalizador_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")            
                btnInsertar.Enabled = true;            
            else
                btnInsertar.Enabled = false;            
        }

        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.ReadOnly)
        {                                                
            //FEL.PER.BO_Per_Personal boPerPersonal = new BO_Per_Personal();
            //List<Per_Personal> litPerPersonal = boPerPersonal.GetById("", s, s.Int_Usuario_Id);
            //if (litPerPersonal.Count > 0)
            //{
            //    string JefeF = litPerPersonal[0].Jefe_Fiscalizacion;
            //    if (JefeF == "S")
            //    {
            //        EditButton.Enabled = true;
            //        DeleteButton.Enabled = true;
            //        NewButton.Enabled = true;
            //    }
            //    else
            //    {
            //        EditButton.Enabled = false;
            //        DeleteButton.Enabled = false;
            //        NewButton.Enabled = false;
            //    }
            //}  

            if (Fiscalizador_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")
            {                                                    
                HabilitarControl("EditButton");
                HabilitarControl("DeleteButton");
                HabilitarControl("NewButton");
            }
            else
            {
                DesabilitarControl("EditButton");
                DesabilitarControl("DeleteButton");
                DesabilitarControl("NewButton");
            }
        }

        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.Edit || Fv_Fis_Planilla.CurrentMode == FormViewMode.ReadOnly)
        {
            if (Tipo_Planilla.Text == "AVA" || Tipo_Planilla.Text == "COS")
                Btn_Fis_Planilla_Def.Enabled = true;
            else
                Btn_Fis_Planilla_Def.Enabled = false;
        }

        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.Edit || Fv_Fis_Planilla.CurrentMode == FormViewMode.Insert)
        {
            TextBox Anticipo_Devengar = (TextBox)Fv_Fis_Planilla.FindControl("Anticipo_Devengar");            
            if (Tipo_Planilla.Text == "ANT")
                Anticipo_Devengar.Enabled = false;
            else
                Anticipo_Devengar.Enabled = true;
        }
        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.Edit)
        {
            DropDownList ddl_Tipo_Planilla = (DropDownList)Fv_Fis_Planilla.FindControl("ddl_Tipo_Planilla");
            ddl_Tipo_Planilla.SelectedValue = Tipo_Planilla.Text;
        }
    }

    private void HabilitarControl(string idControl)
    {
        Control control = Fv_Fis_Planilla.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }        
    }

    private void DesabilitarControl(string idControl)
    {
        Control control = Fv_Fis_Planilla.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }


    protected void Tipo_Planilla_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl_Tipo_Planilla = (DropDownList)sender;

        ddl_Tipo_Planilla.Attributes.Add("onchange", "checkSelectedValue_Tipo_Planilla()");

        TextBox Tipo_Planilla = (TextBox)Fv_Fis_Planilla.FindControl("Tipo_Planilla");
        ddl_Tipo_Planilla.SelectedValue = Tipo_Planilla.Text;
        string asd = ddl_Tipo_Planilla.SelectedItem.Text;

        if (Fv_Fis_Planilla.CurrentMode == FormViewMode.Insert)
                ddl_Tipo_Planilla.SelectedValue = "ANT";
    }

    [WebMethod]
    static public string[] Get_Porcentaje_Iva(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.PAR.BO_Par_Iva boParIva= new BO_Par_Iva();
        List<Par_Iva> litParIva = boParIva.GetByEmpresa("Valor", s);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litParIva.Count && i < count; i++)
        {
            string value = Convert.ToString(litParIva[i].Valor);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Convert.ToString(litParIva[i].Valor), value));
        }
        return opciones.ToArray();
    }

    [WebMethod]
    static public string[] Get_PorRet(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.PAR.BO_Par_Retencion boParRetencio = new BO_Par_Retencion();
        List<Par_Retencion> litParRetencion = boParRetencio.GetByEmpresa("Valor", s);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litParRetencion.Count && i < count; i++)
        {
            string value = Convert.ToString(litParRetencion[i].Valor);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Convert.ToString(litParRetencion[i].Valor), value));
        }
        return opciones.ToArray();
    }

    protected void Btn_Fis_Fiscalizacion_Click(object sender, EventArgs e)
    {
        string FisId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + FisId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Fis_Planilla_Def_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Planilla.FindControl("Id");
        string FisFiscalizacionId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA_DET.aspx?Fis_Fiscalizacion_Id=" + FisFiscalizacionId + "&Fis_Planilla_Id=" + Id_.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Fis_Planilla_Resumen_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Planilla.FindControl("Id");
        string Fiscalizacion_Id = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA_RESUMEN.aspx?Fis_Planilla_Id=" + Id_.Text + "&Fis_Fiscalizacion_Id=" + Fiscalizacion_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Fis_Planilla_Multas_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Planilla.FindControl("Id");
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA_MULTA.aspx?Apu_Presupuesto_Id=" + ApuPresupuestoId + 
            "&Fis_Planilla_Id=" + Id_.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Planilla); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Planilla; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Planilla; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Planilla; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Planilla; }
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
        get { return "FIS_PLANILLA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
