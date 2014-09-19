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

public partial class FIS_FIS_PLANILLA_RESUMEN : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string planillaId = Request.QueryString["Fis_Planilla_Id"];
        if (!IsPostBack)
        {
            if (planillaId != null)
            {
                Fv_Fis_Planilla_Resumen.ChangeMode(FormViewMode.ReadOnly);
                Fv_Fis_Planilla_Resumen.DefaultMode = FormViewMode.ReadOnly;
            }
        }
        pnl_Proyecto.DataBind();
        pnl_Contrato.DataBind();
        pnl_Planilla.DataBind();
        Fv_Fis_Planilla_Resumen.DataBound += new EventHandler(Fv_Fis_Planilla_Resumen_DataBound);
    }

    void Fv_Fis_Planilla_Resumen_DataBound(object sender, EventArgs e)
    {
        string fiscalizacionId = Request.QueryString["Fis_Fiscalizacion_Id"];
        string planillaId = Request.QueryString["Fis_Planilla_Id"];
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        FEL.FIS.BO_Fis_Fiscalizacion fisFiscalizacion = new BO_Fis_Fiscalizacion();
        List<Fis_Fiscalizacion> lstFiscalizacion = fisFiscalizacion.GetByFiscalizacion("", s, fiscalizacionId);
        if (lstFiscalizacion.Count > 0)
        {
            Apu_Origen_Codigo.Text = lstFiscalizacion[0].Apu_Origen_Codigo;
            Codigo_Institucion.Text = lstFiscalizacion[0].Codigo_Institucion;
            Fecha_Ini_Contrato.Text = lstFiscalizacion[0].Fecha_Ini_Contrato.ToString("dd/MM/yyyy");
            Plazo_Contrato.Text = lstFiscalizacion[0].Plazo_Ampliacion.ToString();
            Fecha_Fin_Contrato.Text = lstFiscalizacion[0].Fecha_Final_Ampliacion.ToString("dd/MM/yyyy");
            Estado_Nombre.Text = lstFiscalizacion[0].Estado_Nombre;
            Apu_Origen_Nombre.Text = lstFiscalizacion[0].Apu_Origen_Nombre;
            Costo_Total.Text = lstFiscalizacion[0].Costo_Total.ToString("N2");                        
            Valor_Anticipo.Text = lstFiscalizacion[0].Valor_Anticipo.ToString("N2");                                                
        }

        FEL.FIS.BO_Fis_Planilla fisPlanilla = new BO_Fis_Planilla();
        List<Fis_Planilla> lstPlanilla = fisPlanilla.GetById("", s, planillaId);
        if (lstPlanilla.Count > 0)
        {
            Numero_Planilla.Text = lstPlanilla[0].Numero_Planilla;
            Fecha_Ultimo_Ingreso.Text = lstPlanilla[0].Fecha_Ultimo_Ingreso.ToString("dd/MM/yyyy");
            Total.Text = lstPlanilla[0].Total.ToString("N2");
            Tipo_Nombre.Text = lstPlanilla[0].Tipo_Nombre;
        }

        FEL.FIS.BO_Fis_Planilla_Resumen fisPlanillaR = new BO_Fis_Planilla_Resumen();
        List<Fis_Planilla_Resumen> lstPlanillaR = fisPlanillaR.GetById("", s, planillaId);
        if (lstPlanillaR.Count > 0)
        {
            Monto_Acumulado.Text = lstPlanillaR[0].Sum_Importe_Total.ToString("N2");
            Porcentaje_Incremento.Text = lstPlanillaR[0].Porcentaje_Incremento.ToString();
            Monto_Planillas_Cmp.Text = lstPlanillaR[0].Total_Costo_Mas_Porcentaje.ToString();
            Porcentaje_Monto_Planillas_Cmp.Text = lstPlanillaR[0].Porcentaje_Costo_Mas_Porcentaje.ToString();
            Sum_Importe_Total_Anticipo.Text = lstPlanillaR[0].Sum_Importe_Total_Anticipo.ToString("N2");
            Anticipo_por_Devengar.Text = lstPlanillaR[0].Anticipo_por_Devengar.ToString("N2");
        }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Planilla_Resumen); }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Planilla_Resumen; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Planilla_Resumen; }
    }

    protected override string Contenedor
    {
        get { return "FIS_PLANILLA_RESUMEN"; }
    }

    protected void Btn_Proyecto_Click(object sender, EventArgs e)
    {
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        Response.Redirect("~/FIS/FIS_FISCALIZACION.aspx?Fis_Fiscalizacion_Id=" + Fiscalizacion_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Planillas_Proyecto_Click(object sender, EventArgs e)
    {
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        //string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA.aspx?Apu_Presupuesto_Id=" + Fiscalizacion_Id +
            "&Fis_Planilla_Id=" + Request.QueryString["Fis_Planilla_Id"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Detalle_Planilla_Click(object sender, EventArgs e)
    {
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
        Response.Redirect("~/FIS/FIS_PLANILLA_DET.aspx?Fis_Fiscalizacion_Id=" + Fiscalizacion_Id + "&Fis_Planilla_Id=" + Planilla_Id + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Reporte_Planilla_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];

        HER.ResponseHelper.Redirect(servidor_reporte
                                + "FIS/R_FIS_PLANILLA_DET.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&Fis_Planilla_Id={0}", Planilla_Id)
                                + string.Format("&Fis_Fiscalizacion_Id={0}", Fiscalizacion_Id),
                                "_blank",
                                "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Reporte_Reajuste_Prov_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];

        HER.ResponseHelper.Redirect(servidor_reporte
                                + "FIS/R_FIS_PLANILLA_REAJUSTE_DIS.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&Fis_Planilla_Id={0}", Planilla_Id)
                                + string.Format("&Fis_Fiscalizacion_Id={0}", Fiscalizacion_Id),
                                "_blank",
                                "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Reporte_Reajuste_Def_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];

        HER.ResponseHelper.Redirect(servidor_reporte
                                + "FIS/R_FIS_PLANILLA_REAJUSTE_REA.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&Fis_Planilla_Id={0}", Planilla_Id)
                                + string.Format("&Fis_Fiscalizacion_Id={0}", Fiscalizacion_Id),
                                "_blank",
                                "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Reporte_Planilla_Fiscalizador_Click(object sender, EventArgs e)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
            string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
            string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];

            HER.ResponseHelper.Redirect(servidor_reporte
                                    + "FIS/R_FIS_PLANILLA_FISCALIZADOR.aspx"
                                    + Scope_Factory.Get_QueryString(s)
                                    + string.Format("&Fis_Planilla_Id={0}", Planilla_Id)
                                    + string.Format("&Fis_Fiscalizacion_Id={0}", Fiscalizacion_Id),
                                    "_blank",
                                    "scrollbars=yes, resizable=yes");
        }

    protected void Btn_Reporte_Planilla_Reajuste_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        string Planilla_Id = Request.QueryString["Fis_Planilla_Id"];
        string Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];

        HER.ResponseHelper.Redirect(servidor_reporte
                                + "FIS/R_FIS_PLANILLA_REAJUSTE.aspx"
                                + Scope_Factory.Get_QueryString(s)
                                + string.Format("&Fis_Planilla_Id={0}", Planilla_Id)
                                + string.Format("&Apu_Presupuesto_Id={0}", Fiscalizacion_Id),
                                "_blank",
                                "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Planilla_Per_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FIS/FIS_PLANILLA_PERIODO.aspx?Fecha_Inicial=" + Request.QueryString["Fecha_I"] +
            "&Fecha_Final=" + Request.QueryString["Fecha_F"]);
    }
}
