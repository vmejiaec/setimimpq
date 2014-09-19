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
using FEL.FIS;
using System.Collections.Generic;
using System.Globalization;

public partial class FIS_FIS_AMPLIACION : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
        Fv_Fis_Ampliacion.DataBound += new EventHandler(Fv_Fis_Ampliacion_DataBound);
        pnl_Proyecto.DataBind();
    }

    void Fv_Fis_Ampliacion_DataBound(object sender, EventArgs e)
    {
        TextBox Plazo_Total_Prorroga = (TextBox)Fv_Fis_Ampliacion.FindControl("Plazo_Total_Prorroga");
        TextBox Fecha_Final_Prorroga = (TextBox)Fv_Fis_Ampliacion.FindControl("Fecha_Final_Prorroga");
        string ApuPresupuestoId = Request.QueryString["Apu_Presupuesto_Id"];
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        FEL.FIS.BO_Fis_Fiscalizacion boFiscalizacion = new BO_Fis_Fiscalizacion();
        List<Fis_Fiscalizacion> lstFiscalizacion = boFiscalizacion.GetById("", s, ApuPresupuestoId);
        if (lstFiscalizacion.Count > 0)
        {
            Proy_Codigo.Text = lstFiscalizacion[0].Apu_Origen_Codigo;
            Proy_Cod_Inst.Text = lstFiscalizacion[0].Codigo_Institucion;
            Proy_Estado.Text = lstFiscalizacion[0].Estado_Nombre;
            Proy_FechI.Text = Convert.ToString(lstFiscalizacion[0].Fecha_Ini_Contrato);
            Proy_Plazo.Text = Convert.ToString(lstFiscalizacion[0].Plazo_Ampliacion);
            Proy_FechF.Text = Convert.ToString(lstFiscalizacion[0].Fecha_Final_Ampliacion);
            Proy_Proyecto.Text = lstFiscalizacion[0].Apu_Origen_Nombre;            
        }
        Proy_Plazo_Total_Prorroga.Text = Plazo_Total_Prorroga.Text;
        Proy_Fecha_Final_Prorroga.Text = Fecha_Final_Prorroga.Text;

        if (Fv_Fis_Ampliacion.CurrentMode == FormViewMode.Insert)
        {
            string ApuPreId = Request.QueryString["Apu_Presupuesto_Id"];
            TextBox Apu_Presupuesto_Id = (TextBox)Fv_Fis_Ampliacion.FindControl("Apu_Presupuesto_Id");
            Apu_Presupuesto_Id.Text = ApuPreId;
            TextBox FechaAut = (TextBox)Fv_Fis_Ampliacion.FindControl("Fecha_Autorizacion");
            if (FechaAut.Text == string.Empty)
                FechaAut.Text = DateTime.Now.ToShortDateString();
            TextBox PlazoDias = (TextBox)Fv_Fis_Ampliacion.FindControl("Plazo_Dias");
            if (PlazoDias.Text == string.Empty)
                PlazoDias.Text = 0.ToString("N0", NumberFormatInfo.CurrentInfo);

            Button btnInsertar = (Button)Fv_Fis_Ampliacion.FindControl("InsertButton");
            if (lstFiscalizacion[0].Fiscalizador_Per_Personal_Id == s.Per_Personal_Id && lstFiscalizacion[0].Estado != "DIS" && lstFiscalizacion[0].Estado != "LIQ")
                btnInsertar.Enabled = true;
            else
                btnInsertar.Enabled = false;
        }

        if (Fv_Fis_Ampliacion.CurrentMode == FormViewMode.ReadOnly)
        {

            Button btnEditar = (Button)Fv_Fis_Ampliacion.FindControl("EditButton");
            Button btnEliminar = (Button)Fv_Fis_Ampliacion.FindControl("DeleteButton");
            Button btnNuevo = (Button)Fv_Fis_Ampliacion.FindControl("NewButton");
            if (lstFiscalizacion[0].Fiscalizador_Per_Personal_Id == s.Per_Personal_Id && lstFiscalizacion[0].Estado != "DIS" && lstFiscalizacion[0].Estado != "LIQ")
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

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Ampliacion); }
    }

    protected override GridView Gv
    {
        get { return Gv_Fis_Ampliacion; }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Ampliacion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Fis_Ampliacion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Ampliacion; }
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
        get { return "FIS_AMPLIACION"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Btn_Fis_Ampliacion_Fiscalizacion_Click(object sender, EventArgs e)
    {
        string Fis_Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + Fis_Fiscalizacion_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
