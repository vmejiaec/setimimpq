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
using System.Globalization;
using FEL.FIS;

public partial class FIS_FIS_PLANILLA_MULTA : PaginaBaseKCG
{
    public Fis_Planilla FisPlanilla_Actual
    {
        get
        {
            if (ViewState["FIS_PLANILLA"] == null)
                ViewState["FIS_PLANILLA"] = ObtenerFis_Planilla();
            return (Fis_Planilla)ViewState["FIS_PLANILLA"];
        }
    }

    Fis_Planilla ObtenerFis_Planilla()
    {
        FEL.FIS.BO_Fis_Planilla datos = new BO_Fis_Planilla();
        return datos.GetById("", Scope, Request.QueryString["Fis_Planilla_Id"])[0];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        pnl_Proyecto.DataBind();
        pnl_Facilidad.DataBind();
        Fv_Fis_Planilla_Multa.DataBound += new EventHandler(Fv_Fis_Planilla_Multa_DataBound);
    }

    void Fv_Fis_Planilla_Multa_DataBound(object sender, EventArgs e)
    {
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];
        string Fiscalizador_Id = null;
        string estado = null;
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
            Monto_Contrato.Text = lstFiscalizacion[0].Costo_Total.ToString("N2");
            Fiscalizador_Id = lstFiscalizacion[0].Fiscalizador_Per_Personal_Id;
            estado = lstFiscalizacion[0].Estado;
        }

        TextBox FisPlaNumPlan = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Fis_Planilla_Numero_Planilla");
        TextBox FisPlaFecUltIng = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Fis_Planilla_Fecha_Ultimo_Ingreso");
        TextBox FisPlaTot = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Fis_Planilla_Total");
        TextBox FisPlaTipNom = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Fis_Planilla_Tipo_Nombre");
        string FisPlanillaId = Request.QueryString["Fis_Planilla_Id"];
        if (!string.IsNullOrEmpty(FisPlanillaId))
        {
            FisPlaNumPlan.Text = FisPlanilla_Actual.Numero_Planilla;
            DateTime Fis_PlaFecUltIng = FisPlanilla_Actual.Fecha_Ultimo_Ingreso;
            FisPlaFecUltIng.Text = Fis_PlaFecUltIng.ToString("dd/MM/yyyy");
            Decimal Fis_PlaTot = FisPlanilla_Actual.Total;
            FisPlaTot.Text = Fis_PlaTot.ToString("N2");
            FisPlaTipNom.Text = FisPlanilla_Actual.Tipo_Nombre;
            Decimal ValorPlanilla = FisPlanilla_Actual.Total;
            Valor_Planilla.Text = ValorPlanilla.ToString("N2");
        }

        if (Nro_Dias.Text == string.Empty)
            Nro_Dias.Text = 1.ToString("N0", NumberFormatInfo.CurrentInfo);

        if (Fraccion_Mil.Text == string.Empty)
            Fraccion_Mil.Text = 2.ToString("N2", NumberFormatInfo.CurrentInfo);

        if (Fv_Fis_Planilla_Multa.CurrentMode == FormViewMode.Insert)
        {
            TextBox Valor = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Valor");
            if (Valor.Text == string.Empty)
                Valor.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);

            TextBox Fecha = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Fecha");
            Fecha.Text = DateTime.Now.ToShortDateString();
            Button btnInsertar = (Button)Fv_Fis_Planilla_Multa.FindControl("InsertButton");
            if (Fiscalizador_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")
                btnInsertar.Enabled = true;
            else
                btnInsertar.Enabled = false;

        }
        if (Fv_Fis_Planilla_Multa.CurrentMode == FormViewMode.ReadOnly)
        {

            Button btnEditar = (Button)Fv_Fis_Planilla_Multa.FindControl("EditButton");
            Button btnEliminar = (Button)Fv_Fis_Planilla_Multa.FindControl("DeleteButton");
            Button btnNuevo = (Button)Fv_Fis_Planilla_Multa.FindControl("NewButton");
            if (Fiscalizador_Id == s.Per_Personal_Id && estado != "DIS" && estado != "LIQ")
            {                
                btnEditar.Enabled = true;
                btnEliminar.Enabled = true;
                btnNuevo.Enabled = true;
            }
            else
            {
                btnEditar.Enabled = false;
                btnEliminar.Enabled = false;
                btnNuevo.Enabled = false;
            }
        }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Fis_Planilla_Id", Request.QueryString["Fis_Planilla_Id"]));
        }
    }

    [WebMethod]
    static public string[] Get_FisMulNom(string prefixText, int count)
    {
        if (count == 0) count = 10;
        
        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.FIS.BO_Fis_Multa boFisMulta = new FEL.FIS.BO_Fis_Multa();
        List<Fis_Multa> litFisMulta = boFisMulta.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litFisMulta.Count && i < count; i++)
        {
            string value = litFisMulta[i].Id;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litFisMulta[i].Nombre, value));
        }
        return opciones.ToArray();
    }

    protected void Btn_Fis_Planilla_Multa_Fiscalizacion_Click(object sender, EventArgs e)
    {
        string FisId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + FisId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Fis_Planilla_Multas_Planilla_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Planilla_Multa.FindControl("Id");
        //string FisFiscalizacionId = Request.QueryString["Apu_Presupuesto_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA.aspx?Apu_Presupuesto_Id=" + Request.QueryString["Apu_Presupuesto_Id"] + 
            "&Fis_Planilla_Id=" + Request.QueryString["Fis_Planilla_Id"] + 
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
        get { return typeof(global::Fis_Planilla_Multa); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Planilla_Multa; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Planilla_Multa; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Planilla_Multa; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Planilla_Multa; }
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
        get { return "FIS_PLANILLA_MULTA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
