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
using FEL.INT;
using AjaxControlToolkit;
using System.Web.Services;
using System.Collections.Generic;
using System.Globalization;

public partial class PAR_PAR_IVA : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Fv_Par_Iva.DataBound += new EventHandler(Fv_Par_Iva_DataBound);
    }

    void Fv_Par_Iva_DataBound(object sender, EventArgs e)
    {
        if (Fv_Par_Iva.CurrentMode == FormViewMode.Insert)
        {
            TextBox Valor = (TextBox)Fv_Par_Iva.FindControl("Valor");
            if(Valor.Text == string.Empty)
                Valor.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
        }
    }    
  
    //[WebMethod]
    //static public string[] Get_Cuenta(string prefixText, int count)
    //{
    //    if (count == 0) count = 10;

    //    Scope s = (Scope)HttpContext.Current.Session["Scope"];

    //    FEL.INT.BO_Int_Cuenta boIntCuenta = new BO_Int_Cuenta();

    //    //CuentaMayorDST DST_IntCuenta = new CuentaMayorDST();
    //    DataRow[] _table = boIntCuenta.GetByLikeCuentasMayor(s);
    //    DataRow[] dt = _table[count].Table.Select("CuentaNombre LIKE '" + prefixText + "%" + "'");
    //    List<string> opciones = new List<string>();
    //    int Maximo = (count < dt.Length) ? count : dt.Length;
    //    for (int i = 0; i < Maximo; i++)
    //    {

    //        DataRow Row = dt[i];
    //        if (Row["Nivel"].ToString() == "8")
    //        {
    //            string valores = Row["CodigoCuenta"].ToString();

    //            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Row["CuentaNombre"].ToString(), valores));
    //        }
    //    }
    //    return opciones.ToArray();
    //}

    //[WebMethod]
    //static public string[] Get_Tipo_Auxiliar(string prefixText, int count)
    //{
    //    if (count == 0) count = 10;

    //    Scope s = (Scope)HttpContext.Current.Session["Scope"];

    //    FEL.INT.BO_Int_Cuenta boIntCuenta = new BO_Int_Cuenta();

    //    CuentaMayorDST DST_IntCuenta = new CuentaMayorDST();
    //    DataRow[] dt = boIntCuenta.GetByLikeListarTipoAuxiliar(prefixText + "%");
    //    List<string> opciones = new List<string>();
    //    int Maximo = (count < dt.Length) ? count : dt.Length;
    //    for (int i = 0; i < Maximo; i++)
    //    {

    //        DataRow Row = dt[i];
    //        string valores = Row["IdAuxiliar"].ToString();

    //        opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Row["IdAuxiliarDescripcion"].ToString(), valores));
    //    }
    //    return opciones.ToArray();
    //}

    //[WebMethod]
    //static public string[] Get_Auxiliar(string prefixText, string contextKey, int count)
    //{
    //    if (count == 0) count = 10;

    //    Scope s = (Scope)HttpContext.Current.Session["Scope"];

    //    FEL.INT.BO_Int_Cuenta boIntCuenta = new BO_Int_Cuenta();

    //    CuentaMayorDST DST_IntCuenta = new CuentaMayorDST();
    //    DataRow[] dt = boIntCuenta.GetByLikeListarCuentasAuxiliar(contextKey);
    //    List<string> opciones = new List<string>();
    //    int Maximo = (count < dt.Length) ? count : dt.Length;
    //    for (int i = 0; i < Maximo; i++)
    //    {

    //        DataRow Row = dt[i];
    //        string valores = Row["Codigo"].ToString();

    //        opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(Row["CodigoNombre"].ToString(), valores));
    //    }
    //    return opciones.ToArray();
    //}


    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Par_Iva); }
    }

    protected override GridView Gv
    {
        get { return Gv_Par_Iva; }
    }

    protected override FormView Fv
    {
        get { return Fv_Par_Iva; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGv_Par_Iva; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Par_Iva; }
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
        get { return "PAR_IVA"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }    
}
