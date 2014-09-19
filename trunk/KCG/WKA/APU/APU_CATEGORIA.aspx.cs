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
using Koala.KoalaWebControls;

public partial class APU_APU_CATEGORIA : PaginaBaseKCG 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Fv.DataBound += new EventHandler(Fv_DataBoundApuCategoria);
    }

    void Fv_DataBoundApuCategoria(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox txtCostoDiario = (TextBox)Fv.FindControl("Costo_Diario");
            txtCostoDiario.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Hora = (TextBox)Fv.FindControl("Costo_Hora");
            Costo_Hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);

        }
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Categoria); }
    }

    protected override GridView Gv
    {
        get { return gvapu_categoria; }
    }

    protected override FormView Fv
    {
        get { return fvapu_categoria; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvapu_categoria; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsapu_categoria; }
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
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_CATEGORIA"; }
    }
    
    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

}
