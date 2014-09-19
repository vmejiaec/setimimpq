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

public partial class APU_APU_PARAMETROS : PaginaBaseFormView
{
    public bool zoom = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                Auxiliar_Id.Text = Session["sNombre"].ToString();
            }
            catch
            {
            }
        }
        BO_Apu_Parametros apuParametros = new BO_Apu_Parametros();
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        int listaApuParametros = apuParametros.ExisteRegistros(s, s.Int_Sucursal_Id);
        if (listaApuParametros != 0)
        {
            fvApuParametros.DefaultMode = FormViewMode.ReadOnly;
        }
        fvApuParametros.DataBound += new EventHandler(fvApuParametros_DataBound);
        odsFvApuParametros.Updated += new ObjectDataSourceStatusEventHandler(odsFvApuParametros_Updated);

        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            zoom = true;
        }
    }

    void odsFvApuParametros_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Auxiliar_Id.Text = "";
        Session.Remove("sNombre");
    }

    void fvApuParametros_DataBound(object sender, EventArgs e)
    {
        if (fvApuParametros.CurrentMode == FormViewMode.Insert)
        {
            TextBox Codigo = (TextBox)fvApuParametros.FindControl("Codigo");
            Codigo.Text = string.Empty;
        }

        if (fvApuParametros.CurrentMode == FormViewMode.Edit)
        {
            if (zoom && Auxiliar_Id.Text == "1")
            {
                TextBox Nombre = (TextBox)fvApuParametros.FindControl("Nombre");
                TextBox Apu_Subtitulo_Id_Oferta_Rubro_Pred = (TextBox)fvApuParametros.FindControl("Apu_Subtitulo_Id_Oferta_Rubro_Pred");
                Apu_Subtitulo_Id_Oferta_Rubro_Pred.Text = Nombre.Text;
                Nombre.Text = "";
            }
        }
    }

    protected override void AsignarParametrosDataSourceDeatailsView(string id)
    {
        
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Auxiliar_Id.Text = "1";
        Button _ValorZomm_Estado = (Button)sender;
        string Argumentos_ = _ValorZomm_Estado.CommandArgument;
        Argumentos_ = Argumentos_.Replace("~/APU/APU_SUBTITULO.aspx", "~/APU/APU_SUBTITULO.aspx?valorZoom=" + Auxiliar_Id.Text);
        _ValorZomm_Estado.CommandArgument = Argumentos_;
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Parametros); }
    }

    protected override FormView Fv
    {
        get { return fvApuParametros; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuParametros; }
    }

    protected override string Contenedor
    {
        get { return "APU_PARAMETROS"; }
    }
}
