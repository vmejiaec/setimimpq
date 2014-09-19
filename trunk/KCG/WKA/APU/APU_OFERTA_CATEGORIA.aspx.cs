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
using FEL.APU;

public partial class APU_APU_OFERTA_CATEGORIA : PaginaBaseKCG
{
    public Apu_Oferta ApuOfertaActual
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
        FEL.APU.BO_Apu_Oferta datos = new BO_Apu_Oferta();
        return datos.GetById("", (Scope)Session["Scope"], Request.QueryString["apu_oferta_Id"])[0];
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SeleccionarItemEnCarga(null);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["apu_oferta_Id"]));
            param.Add(new DictionaryEntry("Apu_Oferta_Codigo", ApuOfertaActual.Codigo));
            param.Add(new DictionaryEntry("Apu_Oferta_Nombre", ApuOfertaActual.Nombre));
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Categoria); }
    }

    protected override GridView Gv
    {
        get { return Gv_Apu_Oferta_Categoria; }
    }

    protected override FormView Fv
    {
        get { return Fv_Apu_Oferta_Categoria; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Apu_Oferta_Categoria; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Apu_Oferta_Categoria; }
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
        get { return "APU_OFERTA_CATEGORIA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
