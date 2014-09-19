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

public partial class APU_APU_PRESUPUESTO_PROVISIONAL : PaginaBaseGridKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Gv_Apu_Presupuesto_Provisional.DataBound += new EventHandler(Gv_Apu_Presupuesto_Provisional_DataBound);
    }

    void Gv_Apu_Presupuesto_Provisional_DataBound(object sender, EventArgs e)
    {
        if (Gv_Apu_Presupuesto_Provisional.SelectedIndex > -1)
        {
            Btn_Presupuesto.Enabled = true;
            Btn_Formula_Polimnomica.Enabled = true;
            Btn_Cuadrilla.Enabled = true;
        }
        else
        {
            Btn_Presupuesto.Enabled = false;
            Btn_Formula_Polimnomica.Enabled = false;
            Btn_Cuadrilla.Enabled = false;
        }
    }

    protected override string Contenedor
    {
        get { return "APU_PRESUPUESTO_PROVISIONAL"; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override GridView Gv
    {
        get { return Gv_Apu_Presupuesto_Provisional; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Apu_Presupuesto_Provisional; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(Apu_Presupuesto); }
    }

    protected void Btn_Presupuesto_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string Presupuesto_Id = Gv_Apu_Presupuesto_Provisional.DataKeys[Gv_Apu_Presupuesto_Provisional.SelectedIndex].Values["Id"].ToString();
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                        + "APU/R_APU_PRESUPUESTO_RUBRO.aspx"
                                        + Scope_Factory.Get_QueryString(s)
                                        + string.Format("&Apu_Presupuesto_Id={0}", Presupuesto_Id),
                                        "_blank", "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Formula_Polimnomica_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string Presupuesto_Id = Gv_Apu_Presupuesto_Provisional.DataKeys[Gv_Apu_Presupuesto_Provisional.SelectedIndex].Values["Id"].ToString();
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                        + "APU/R_APU_PRESUPUESTO_INDICE.aspx"
                                        + Scope_Factory.Get_QueryString(s)
                                        + string.Format("&Apu_Presupuesto_Id={0}", Presupuesto_Id),
                                        "_blank", "scrollbars=yes, resizable=yes");
    }

    protected void Btn_Cuadrilla_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        string Origen_Id = Gv_Apu_Presupuesto_Provisional.DataKeys[Gv_Apu_Presupuesto_Provisional.SelectedIndex].Values["Id"].ToString();
        string servidor_reporte = ConfigurationManager.AppSettings["URL_Servidor_Reportes"];
        HER.ResponseHelper.Redirect(servidor_reporte
                                        + "APU/R_APU_PRESUPUESTO_CUADRILLA.aspx"
                                        + Scope_Factory.Get_QueryString(s)
                                        + string.Format("&Apu_Presupuesto_Id={0}", Origen_Id),
                                        "_blank", "scrollbars=yes, resizable=yes");
    }
}
