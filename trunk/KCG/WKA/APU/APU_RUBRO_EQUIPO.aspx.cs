using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Globalization;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.APU;

public partial class APU_APU_RUBRO_EQUIPO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btn_Apu_rubro_equipo_rubro.Click += new EventHandler(btn_Apu_rubro_equipo_rubro_Click);
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    void btn_Apu_rubro_equipo_rubro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_RUBRO.aspx?Apu_Rubro_Id=" + Request.QueryString["Apu_Rubro_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if(Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox cantidad = (TextBox)Fv.FindControl("Cantidad");
            if (cantidad.Text == string.Empty)
                cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            
            TextBox costo_hora_x_cantidad = (TextBox)Fv.FindControl("costo_hora_x_cantidad");
            if (costo_hora_x_cantidad.Text == string.Empty)
                costo_hora_x_cantidad.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            
            TextBox costo_x_rendimiento_hora = (TextBox)Fv.FindControl("costo_x_rendimiento_hora");
            if (costo_x_rendimiento_hora.Text == string.Empty)
                costo_x_rendimiento_hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            
            TextBox costo_hora = (TextBox)Fv.FindControl("costo_hora");
            if (costo_hora.Text == string.Empty)
                costo_hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
           
        }
    }



    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Rubro_Equipo); }
    }

    protected override GridView Gv
    {
        get { return  GvApuRubroEquipo; }
    }

    protected override FormView Fv
    {
        get { return FvApuRubroEquipo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuRubroEquipo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuRubroEquipo; }
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
        get { return "APU_RUBRO_EQUIPO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }
    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", Server.UrlDecode(Request.QueryString["Apu_Rubro_Nombre"])));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", Request.QueryString["Apu_Rubro_Unidad"]));
            param.Add(new DictionaryEntry("apu_rubro_rendimiento_Equipo_hora", Request.QueryString["apu_rubro_rendimiento_Equipo_hora"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetEquipo(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Equipo boApuEquipo = new BO_Apu_Equipo();
        List<Apu_Equipo> litApuEquipo = boApuEquipo.GetByLikeNombre("Nombre", s, prefixText + "%", s.Int_Sucursal_Id);

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuEquipo.Count && i < count; i++)
        {
            string value = litApuEquipo[i].Id + "||" +
                           litApuEquipo[i].Codigo + "||" +
                           litApuEquipo[i].Costo_Hora.ToString();

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuEquipo[i].Nombre, value));
        }
        return opciones.ToArray();
    }
}
