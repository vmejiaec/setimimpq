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

public partial class APU_APU_LUGAR : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fvApuLugar.DataBound += new EventHandler(fvApuLugar_DataBound);
    }

    void fvApuLugar_DataBound(object sender, EventArgs e)
    {
        if (fvApuLugar.CurrentMode == FormViewMode.Insert)
        {
            TextBox Predeterminada = (TextBox)fvApuLugar.FindControl("Predeterminada");
            DropDownList DropDownList1 = (DropDownList)fvApuLugar.FindControl("DropDownList1");
            if (Predeterminada.Text == string.Empty)
                Predeterminada.Text = DropDownList1.SelectedValue;
        }
    }

    protected void Predeterminada_DataBound(object sender, EventArgs e)
    {
        DropDownList DropDownList1 = (DropDownList)sender;

        DropDownList1.Attributes.Add("onchange", "checkSelectedValuePredeterminada()");

        TextBox Predeterminada = (TextBox)fvApuLugar.FindControl("Predeterminada");
        DropDownList1.SelectedValue = Predeterminada.Text;

        //if (fvApuLugar.CurrentMode == FormViewMode.Insert)
        //    DropDownList1.SelectedValue = "NAT";
    }


    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Lugar); }
    }

    protected override GridView Gv
    {
        get { return gvApuLugar; }
    }

    protected override FormView Fv
    {
        get { return fvApuLugar; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuLugar; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuLugar; }
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
        get { return "APU_LUGAR"; }
    }


    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
}
