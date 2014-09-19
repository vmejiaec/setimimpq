/*
KOALA SOLUTION 
 
PaginaBaseGridKCG     - Página base de pantallas solo Grid
ver 2.0

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: KoalaFramework Asp.Net              
							
NOTAS DE DISEÑO
 * Versiones anteriores
   - 
 * Version 2.0
   - Las pantallas que en Dic_Contenedor tengan el campo
     Filtro = "S" deben presentar el filtro sin hacer la consulta
     Get del Grid.
   - Si un ods para grid se configura cache, debe ponerse la propiedad
     CacheKeyDependency.
   - La actualización de cache se maneja por el clic de un boton
     y de su indice en Cache (CacheKeyDependency).
     
HISTORIA     					 
 * Versiones anteriores
   - 
 * Version 2.0
   - Presentación de filtro en el inicio (Dic_Contenedor, Filtro = "S")
   - Manejo de cache.

TRABAJO FUTURO
   - 

ÚLTIMA FECHA DE MODIFICACIÓN
03-07-2008 12H39

*/


using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.Services.Protocols;
using System.Web.UI.WebControls;
using System.Xml;
using FEL.DIC;
using HER;
using Koala.KoalaWebControls;

public abstract class PaginaBaseGridKCG : KPagina

{
    #region Atributos

    protected Color bien = Color.WhiteSmoke;
    protected Color mal = Color.WhiteSmoke;
    protected abstract string Contenedor { get; }

    //[KPropiedadPersistente("ParametrosFiltro")]
    protected abstract KFiltro KftFiltro { get; }

    protected abstract GridView Gv { get; }

    protected abstract ObjectDataSource OdsGv { get; }

    protected virtual Button RefrescarCache
    {
        get { return null; }
    }

    protected virtual Type TipoObjeto
    {
        get { return null; }
    }

    #endregion

    #region Inicializa página

    private const string _IndiceSessionScope = "Scope";

    protected Scope Scope
    {
        get { return (Scope) Session[_IndiceSessionScope]; }
    }

    public bool MostrarFiltro
    {
        get { return ConsultarMostrarFiltro(); }
    }

    protected override void OnInit(EventArgs e)
    {
        if (KftFiltro != null)
        {
            KftFiltro.MedatosConsultados += KftFiltro_MedatosConsultados;
            KftFiltro.ErrorEncontrado += KftFiltro_ErrorEncontrado;
        }

        if (RefrescarCache != null)
        {
            RefrescarCache.Click += new EventHandler(RefrescarCache_Click);
        }

        OdsGv.Selecting += new ObjectDataSourceSelectingEventHandler(OdsGv_Selecting);
        base.OnInit(e);
    }

    private void RefrescarCache_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(OdsGv.CacheKeyDependency))
        {
            if (Cache[OdsGv.CacheKeyDependency] != null)
            {
                Cache[OdsGv.CacheKeyDependency] = new object();
                Gv.DataBind();
            }
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        //if (BResponderZoom != null)
        //    VerificarBotonRegreso();

        //if (BRegreso != null)
        //    VerificarBotonResponderZoom();

        //AsignarTextosBotones();

        if (!IsPostBack)
        {
            AsignarContenedorAScope();
            EtiquetarBotonRefrescarCache();
        }
        if (KftFiltro != null)
        {
            //VerificarFiltroZoom();
            PrecisarValoresDeFiltradoFijo(KftFiltro.ParametrosFiltro);
            KftFiltro.AplicarFiltro();
            if (MostrarFiltro)
            {
                KftFiltro.Mostrar();
            }
        }
        base.OnLoad(e);
    }

    protected void IniciarCache()
    {
        if (!string.IsNullOrEmpty(OdsGv.CacheKeyDependency))
        {
            if (Cache[OdsGv.CacheKeyDependency] == null)
            {
                Cache[OdsGv.CacheKeyDependency] = new object();
            }
        }
    }


    protected virtual void EtiquetarBotonRefrescarCache()
    {
        if (RefrescarCache != null)
        {
            RefrescarCache.Text = "Refrescar";
        }
    }

    private void OdsGv_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        e.Cancel = MostrarFiltro;
        Scope.Expresion_De_Filtrado = OdsGv.FilterExpression;
    }

    private bool ConsultarMostrarFiltro()
    {
        // Descomentar si se implementa Zoom a las paginas solo grid.
        if (IsPostBack
            /*||
            Zoom.ContieneRequerimientoDestino(pathActual) ||
            Zoom.ContieneRequerimientoOrigen(pathActual)*/)
            return false;
        BO_Dic_Contenedor boDicContenedor = new BO_Dic_Contenedor();
        List<Dic_Contenedor> lstContenedor = null;
        try
        {
            lstContenedor = boDicContenedor.GetByNombre("", Scope, Contenedor);
        }
        catch
        {
            return false;
        }

        if (lstContenedor.Count != 1)
            return false;
        string strMostrarFiltro = lstContenedor[0].Filtro;
        bool bolMostrarFiltro = false;
        if (strMostrarFiltro.Trim() == "S")
            bolMostrarFiltro = true;
        return bolMostrarFiltro;
    }

    protected virtual void PrecisarValoresDeFiltradoFijo(Dictionary<string, KItemFiltro> parametrosFiltrado)
    {
        KViewState estadogrid = ObtenerEstadoPropiedad("KftFiltro");
        if (estadogrid != null && !IsPostBack)
        {
            Dictionary<string, KItemFiltro> filtroDiccionario =
                (Dictionary<string, KItemFiltro>) estadogrid["ParametrosFiltro"];
            if (filtroDiccionario != null)
            {
                foreach (KeyValuePair<string, KItemFiltro> filtroItem in filtroDiccionario)
                {
                    if (parametrosFiltrado[filtroItem.Key].Visible && !filtroItem.Value.FiltroVacio)
                        parametrosFiltrado[filtroItem.Key].EstablecerValoresDeFiltrado(filtroItem.Key,
                                                                                       filtroItem.Value.Valor);
                }
            }
        }
    }

    protected override void InitializeCulture()
    {
        if (Session["lenguaje"] != null)
        {
            UICulture = (string) Session["lenguaje"];
        }
        base.InitializeCulture();
    }

    #endregion

    #region Funciones para manejar eventos de KFiltro

    #region KftFiltro_MedatosConsultados

    private void KftFiltro_MedatosConsultados(object sender, KControlEventArgs e)
    {
        if (e.Excepcion != null)
        {
            e.ExcepcionManejada = true;
        }
    }

    #endregion

    #region KftFiltro_ErrorEncontrado

    // V 1.7
    // Función para manejar el error al insertar
    // en Par_Filtro dentro del objeto KFiltro
    private void KftFiltro_ErrorEncontrado(object sender, KControlEventArgs e)
    {
        if (e.Excepcion != null)
        {
            SoapException ex = (SoapException) e.Excepcion;
            string mensaje = ObtenerMensajeError(ex.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
            Exception exe = new Exception(mensaje);
            throw exe;
        }
    }

    #endregion

    #endregion

    #region Object Data Source

    protected void OdsGv_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (OdsGv.FilterParameters.Count == 0 || OdsGv.FilterExpression.Length > 0) return;
        StringBuilder filtro = new StringBuilder();
        int count = OdsGv.FilterParameters.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 0)
                filtro.Append("AND ");
            filtro.Append(OdsGv.FilterParameters[i].DefaultValue);
        }
        OdsGv.FilterExpression = filtro.ToString();
    }

    #endregion

    #region Utilitarios

    protected void SeleccionarItemGridView(object id)
    {
        DataView lista = (DataView) OdsGv.Select();
        OrdenarDataView(lista, Gv.SortExpression, Gv.SortDirection); if (lista == null) return;

        int iTotal = BuscarObjetoPorID(id, lista);

        if (iTotal == -1) return;

        int iPagina;
        int iFila;

        CalcularPaginaYFilaDeSeleccion(out iPagina, out iFila, iTotal, Gv.PageSize);

        Gv.PageIndex = iPagina;
        Gv.SelectedIndex = iFila;
        Gv.DataBind();
    }


    protected void OrdenarDataView(DataView lista, string expresionOrdenado, SortDirection direccionOrdenado)
    {
        if (!string.IsNullOrEmpty(expresionOrdenado))
        {
            string direccionSort = "ASC";
            if (direccionOrdenado == SortDirection.Descending)
                direccionSort = "DESC";
            lista.Sort = expresionOrdenado + " " + direccionSort;
        }
    }

    protected void CalcularPaginaYFilaDeSeleccion(out int indicePagina, out int indiceFila, int indiceTotal,
                                                  int longuitudPagina)
    {
        int tempIndiceTotal = indiceTotal + 1;
        indicePagina = Convert.ToInt32(Math.DivRem(tempIndiceTotal, longuitudPagina, out indiceFila));
        indiceFila--;
        if (indiceFila == -1)
        {
            indicePagina--;
            indiceFila = longuitudPagina - 1;
        }
    }

    protected int BuscarObjetoPorID(object id, DataView lista)
    {
        for (int i = 0; i < lista.Count; i++)
        {
            object valor = lista[i]["Id"];
            if (valor.Equals(id))
                return i;
        }
        return -1;
    }


    protected void AsignarContenedorAScope()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope) Session["Scope"];
        s.Dic_Contenedor_Nombre = Contenedor;
    }

    protected bool VerificarExistenciaParametroFiltrado(string nombreParametro)
    {
        if (OdsGv.FilterParameters.Count == 0)
            return false;
        for (int i = 0; i < OdsGv.FilterParameters.Count; i++)
        {
            if (OdsGv.FilterParameters[i].Name == nombreParametro)
                return true;
        }
        return false;
    }

    protected void AsignarMensaje(string mensaje, Color color)
    {
        ((Label) Master.FindControl("LabelError")).Text = mensaje;
        ((Label) Master.FindControl("LabelError")).Visible = true;
        ((Label) Master.FindControl("LabelError")).ForeColor = color;
    }

    private string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
        }
        string pre_mensaje =
            HttpContext.
                GetLocalResourceObject("~/KOALA.master",
                                       CodigoError + "RecursoKCG.Text").ToString();
        pre_mensaje = string.Format(pre_mensaje, MensajeError);
        return pre_mensaje;
    }

    #endregion
}