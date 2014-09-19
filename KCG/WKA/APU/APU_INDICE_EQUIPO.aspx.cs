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
using System.Globalization;

public partial class APU_APU_INDICE_EQUIPO : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Fv.DataBound += new EventHandler(Fv_DataBoundApuEquipoIndice);
    }

    void Fv_DataBoundApuEquipoIndice(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox porcentaje = (TextBox)Fv.FindControl("Porcentaje");
            porcentaje.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Indice_Equipo); }
    }

    protected override GridView Gv
    {
        get { return gvapu_indice_equipos; }
    }

    protected override FormView Fv
    {
        get { return fv_apu_indice_equipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_indice_equipos; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_indice_equipo; }
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
        get { return "APU_INDICE_EQUIPO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

}
