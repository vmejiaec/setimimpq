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
using System.Collections.Generic;
using System.Reflection;
using HER;
using System.Globalization;

public partial class DIC_DIC_CODIGO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
           // base.Page_Load(sender, e);
            
            Fv.DataBound += new EventHandler(fvDicCodigo_DataBound);
   }

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Codigo); }
    }

    protected override GridView Gv
    {
        get { return gvDicCodigo; }
    }

    protected override FormView Fv
    {
        get { return fvDicCodigo; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGVDicCodigo; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFVDicCodigo; }
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
        get { return "DIC_CODIGO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Tipo_SelectedIndexChanged(object sender, EventArgs e)
    {        
        valoresConservar = CopiarValoresDeControles(Fv, TipoObjeto);
        if( ((DropDownList)sender).SelectedValue == "REF")
        {
            int i = BuscarControl("Act_Dic_Campo_Id");
            valoresConservar.RemoveAt(i);
        }                
    }

    private int BuscarControl(object key)
    {
        if (valoresConservar.Count == 0) return -1;

        for (int i = 0; i < valoresConservar.Count; i++)
        {
            if (valoresConservar[i].Key.ToString() == key.ToString())
                return i;
        }
        return -1;
    }

    bool visiblePanelSecuencia = false;
    bool visiblePanelReferencia = false;
    bool visiblePanelConstante = false;
    bool visiblePanelFuncion = false;
    bool visiblePanelPrincipal = false;

    List<DictionaryEntry> valoresConservar = new List<DictionaryEntry>();
    string strDicObjetoId = string.Empty;

    protected void fvDicCodigo_DataBound(object sender, EventArgs e)
    {  
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList ddlTipo = (DropDownList)fvDicCodigo.FindControl("Tipo");
            ddlTipo.SelectedValue = "SEC";

            TextBox orden = (TextBox)Fv.FindControl("Orden");
            if (orden.Text == string.Empty)
                orden.Text = 1.ToString();
        }
        if(valoresConservar.Count > 0)
            PegarValoresEnControlesOrigen(Fv, valoresConservar);

        Control Tipo = fvDicCodigo.FindControl("Tipo");
        Panel pnlPanelPrincipal = (Panel)fvDicCodigo.FindControl("pnlPrincipal");
        
        TextBox dic_objeto_id = (TextBox)fvDicCodigo.FindControl("Dic_Objeto_Id");
        if (dic_objeto_id.Text != "")
        {
            visiblePanelPrincipal = true;
            pnlPanelPrincipal.Visible = visiblePanelPrincipal;
        }
        else
        {
            visiblePanelPrincipal = false;
            pnlPanelPrincipal.Visible = visiblePanelPrincipal;
        }
        if (Tipo != null)
        {
            if (Tipo is DropDownList)
            {
                EstablecerEstadoDePaneles(((DropDownList)Tipo).SelectedValue);
            }

            else if (Tipo is TextBox)
            {
                EstablecerEstadoDePaneles(((TextBox)Tipo).Text);                
            }
                
        }

    }

    //private List<DictionaryEntry> CopiarValoresDeControles(Control contenedor, Type tipoObjeto)
    //{
    //    PropertyInfo[] propiedades = tipoObjeto.GetProperties();
    //    List<DictionaryEntry> parametros = new List<DictionaryEntry>(propiedades.Length);
    //    foreach (PropertyInfo propiedad in propiedades)
    //    {
    //        string valor = Navegacion.ObtenerValorControl(contenedor.FindControl(propiedad.Name));
    //        parametros.Add(new DictionaryEntry(propiedad.Name, valor));
    //    }
    //    return parametros;
    //}
  
    //private void PegarValoresEnControlesOrigen(Control contenedor, List<DictionaryEntry> parametros)
    //{
    //    for (int i = 0; i < parametros.Count; i++)
    //    {
    //        if (parametros[i].Value != null)
    //        {
    //            Navegacion.AsignarValorDeControl(
    //                contenedor.FindControl(parametros[i].Key.ToString()),
    //                parametros[i].Value.ToString());
    //        }
    //    }
    //}
 
    private void EstablecerEstadoDePaneles(string tipo)
    {
        switch (tipo)
        {
            case "SEC":
            {
                visiblePanelSecuencia = true;
                visiblePanelConstante = false;
                visiblePanelFuncion = false;
                visiblePanelReferencia = false;
                break;
            }
            case "CON":
            {
                visiblePanelSecuencia = false;
                visiblePanelConstante = true;
                visiblePanelFuncion = false;
                visiblePanelReferencia = false;
                break;
            }
            case "FUN":
            {
                visiblePanelSecuencia = false;
                visiblePanelConstante = false;
                visiblePanelFuncion = true;
                visiblePanelReferencia = false;
                break;
            }
            case "REF":
            {
                visiblePanelSecuencia = false;
                visiblePanelConstante = false;
                visiblePanelFuncion = false;
                visiblePanelReferencia = true;
                break;
            }
        }

        Panel pnldDatosSecuencia = (Panel)fvDicCodigo.FindControl("pnlDatos1");
        Panel pnldDatosConstante = (Panel)fvDicCodigo.FindControl("pnlDatos2");
        Panel pnldDatosFuncion = (Panel)fvDicCodigo.FindControl("pnlDatos3");
        Panel pnldDatosReferencia = (Panel)fvDicCodigo.FindControl("pnlDatos4");
        

        pnldDatosSecuencia.Visible = visiblePanelSecuencia;
        pnldDatosConstante.Visible = visiblePanelConstante;
        pnldDatosFuncion.Visible = visiblePanelFuncion;
        pnldDatosReferencia.Visible = visiblePanelReferencia;
        
    }

    protected void odsreferencia_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        bool atendido = false;


       
        if (!string.IsNullOrEmpty(strDicObjetoId))
        {
            atendido = true;
            e.InputParameters["Dic_Objeto_Id"] = strDicObjetoId;
        }


        if (valoresConservar.Count > 0 && !atendido)
        {
            atendido = true; 
            e.InputParameters["Dic_Objeto_Id"] = valoresConservar[BuscarControl("Dic_Objeto_Id")].Value;
        }

        if (!atendido)
        {
            string idObjeto = Zoom.ObtenerValorPropiedadDeParametros(this.AppRelativeVirtualPath, "Dic_Objeto_Id");
            e.InputParameters["Dic_Objeto_Id"] = idObjeto;
        }
   
    }


    
    protected void fvDicCodigo_ModeChanging(object sender, FormViewModeEventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.ReadOnly
            && e.NewMode == FormViewMode.Edit)
        {

            TextBox txbDicObjetoId = (TextBox)Fv.FindControl("Dic_Objeto_Id");

            if (txbDicObjetoId != null)
            {
                strDicObjetoId = txbDicObjetoId.Text;
            }

        }
    }
}
