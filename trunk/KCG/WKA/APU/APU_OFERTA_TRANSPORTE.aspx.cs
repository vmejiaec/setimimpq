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
using Koala.KoalaWebControls;

public partial class APU_APU_OFERTA_TRANSPORTE : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Btn_Apu_Oferta_Transporte_Formula.Click += new EventHandler(Btn_Apu_Oferta_Transporte_Formula_Click);
        Btn_Apu_Oferta_Transporte_Oferta_Listado.Click += new EventHandler(Btn_Apu_Oferta_Transporte_Oferta_Listado_Click);
        fvMaestroApuOferta.DataBound += new EventHandler(fvMaestroApuOferta_DataBound);
        fvDetalleApuOfertaTransporteIndice.DataBound += new EventHandler(fvDetalleApuOfertaTransporteIndice_DataBound);
        Fv.DataBound += new EventHandler(Fv_DataBound);
    }

    void Fv_DataBound(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox Porcentaje = (TextBox)Fv.FindControl("Porcentaje");
            Porcentaje.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            TextBox Costo_Indice = (TextBox)Fv.FindControl("Costo_Indice");
            Costo_Indice.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }

    void Btn_Apu_Oferta_Transporte_Oferta_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void Btn_Apu_Oferta_Transporte_Formula_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_OFERTA_INDICE.aspx" +
            "?Apu_Oferta_Id=" + Request.QueryString["Apu_Oferta_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void fvDetalleApuOfertaTransporteIndice_DataBound(object sender, EventArgs e)
    {
        //AsignarAccesoEtapa();
        string estado = Request.QueryString["Estado"];
        string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
        if (estado == "BOR" || presupuesto_estado == "PEN")
            HabilitarControl("InsertButton");
        else
            DeshabilitarControl("InsertButton");
    }
    
    private void HabilitarControl(string idControl)
    {
        Control control = fvDetalleApuOfertaTransporteIndice.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
    }

    private void AsignarAccesoEtapa()
    {
        if (Request.QueryString["Apu_Oferta_Etapa"] == "CON")
        {
            switch (fvDetalleApuOfertaTransporteIndice.CurrentMode)
            {
                case FormViewMode.Insert:
                    DeshabilitarControl("InsertButton");
                    DeshabilitarControl("InsertCancelButton");
                    EstablecerTextBoxEnReadOnly("Porcentaje");
                    EstablecerTextBoxEnReadOnly("Apu_Indice_Nombre");
                    break;
                case FormViewMode.ReadOnly:
                    DeshabilitarControl("EditButton");
                    DeshabilitarControl("DeleteButton");
                    DeshabilitarControl("NewButton");
                    break;
            }
        }
    }

    private void EstablecerTextBoxEnReadOnly(string idTextBox)
    {
        Control control = Fv.FindControl(idTextBox);
        TextBox txbControl = (TextBox)control;
        txbControl.ReadOnly = true;
        txbControl.CssClass = "";
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }
    }


    void fvMaestroApuOferta_DataBound(object sender, EventArgs e)
    {
        SumaPorcentajeIndiceTransporte.Text = fvMaestroApuOferta.DataKey["Suma_Porcentaje_Indice_Transporte"].ToString();
    }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta_Transporte_Indice); }
    }

    protected override GridView Gv
    {
        get { return gvDetalleApuOfertaTransporteIndice; }
    }

    protected override FormView Fv
    {
        get { return fvDetalleApuOfertaTransporteIndice; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvDetalleApuOfertaTransporteIndice; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvDetalleApuOfertaTransporteIndice; }
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
        get { return "APU_OFERTA_TRANSPORTE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {
        param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));
        param.Add(new DictionaryEntry("Costo_Total", fvMaestroApuOferta.DataKey["Costo_Transporte"].ToString()));
        base.DefinirParametrosFijosDeInsercion(param);
    }

    [WebMethod]
    static public string[] GetIndiceEquipo(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Indice_Equipo boApuIndiceEquipo = new FEL.APU.BO_Apu_Indice_Equipo();
        List<Apu_Indice_Equipo> litApuIndiceEquipo = boApuIndiceEquipo.GetByLikeNombre("Nombre", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuIndiceEquipo.Count && i < count; i++)
        {
            string value = litApuIndiceEquipo[i].Apu_Indice_Id + "||" +
                           litApuIndiceEquipo[i].Codigo + "||" +
                           litApuIndiceEquipo[i].Porcentaje.ToString("N2", NumberFormatInfo.CurrentInfo);

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuIndiceEquipo[i].Apu_Indice_Nombre, value));
        }
        return opciones.ToArray();
    }
}
