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

public partial class AUD_AUD_PAR_AUDITORIA :PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Aud_Par_Auditoria); }
    }

    protected override GridView Gv
    {
        get { return gvAudParAuditoria; }
    }

    protected override FormView Fv
    {
        get { return fvAudParAuditoria; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVAudParAuditoria; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVAudParAuditoria; }
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
        get { return "AUD_PAR_AUDITORIA"; }
        
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
   
}
