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

public partial class APU_APU_PROYECTO_FORMULA_TRANSPORTE : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fvDetalleApuProyectoTransporteIndice.DataBound += new EventHandler(fvDetalleApuProyectoTransporteIndice_DataBound);
        fvMaestroApuProyecto.DataBound += new EventHandler(fvMaestroApuProyecto_DataBound);
        btnFormula.Click += new EventHandler(btnFormula_Click);
        btnApuListadoProyecto.Click += new EventHandler(btnApuListadoProyecto_Click);
    }

    protected void btnFormula_Click(object sender, EventArgs e )
    {
        Response.Redirect("~/APU/APU_PROYECTO_INDICE.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btnApuListadoProyecto_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_LISTADO_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void fvMaestroApuProyecto_DataBound(object sender, EventArgs e)
    {
        SumaPorcentajeIndiceTransporte.Text = fvMaestroApuProyecto.DataKey["Suma_Porcentaje_Indice_Transporte"].ToString();
    }

    void fvDetalleApuProyectoTransporteIndice_DataBound(object sender, EventArgs e)
    {
        string estado = Request.QueryString["Estado"];
        string presupuesto_estado = Request.QueryString["Apu_Presupuesto_Estado"];
        if (fvDetalleApuProyectoTransporteIndice.CurrentMode == FormViewMode.Insert)
        {
            if (estado == "BOR" || presupuesto_estado == "PEN")
            {
                HabilitarControl("InsertButton");
                HabilitarControl("InsertCancelButton");
            }
            else if (estado == "DIS")
            {
                if (fvDetalleApuProyectoTransporteIndice.CurrentMode == FormViewMode.Insert && fvDetalleApuProyectoTransporteIndice.DataItemCount == 0)
                {
                    DeshabilitarControl("InsertButton");
                    DeshabilitarControl("InsertCancelButton");
                    //EstablecerTextBoxEnReadOnly("Porcentaje");
                    //EstablecerTextBoxEnReadOnly("Apu_Indice_Nombre");
                }
            }            
        }
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


    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Transporte_Indice); }
    }

    protected override GridView Gv
    {
        get { return gvDetalleApuProyectoTransporteIndice; }
    }

    protected override FormView Fv
    {
        get { return fvDetalleApuProyectoTransporteIndice; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsDetalleGvApuProyectoTransporteIndice; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsDetalleFvApuProyectoTransporteIndice; }
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
        get { return "APU_PROYECTO_FORMULA_TRANSPORTE"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(List<DictionaryEntry> param)
    {

        param.Add(new DictionaryEntry("Apu_Proyecto_Id", fvMaestroApuProyecto.DataKey["Id"]));
        param.Add(new DictionaryEntry("Costo_Total", fvMaestroApuProyecto.DataKey["Costo_Transporte"]));
      
        base.DefinirParametrosFijosDeInsercion(param);
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

    private void HabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = true;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = true;
        }
    }
}
