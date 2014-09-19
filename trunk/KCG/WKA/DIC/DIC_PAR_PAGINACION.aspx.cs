using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.DIC;
using Koala.KoalaWebControls;
using System.Drawing;

public partial class DIC_DIC_PAR_PAGINACION : PaginaBaseKCG
{
    //Variables Globales
    Color bad = Color.Red;

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Dic_Par_Paginacion); }
    }

    protected override GridView Gv
    {
        get { return KGrid1; }
    }

    protected override FormView Fv
    {
        get { return fvDicParPaginacion; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvDicParPaginacion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvDicParPaginacion; }
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
        get { return "DIC_PAR_PAGINACION"; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void bntGenerar_Click(object sender, EventArgs e)
    {
        string parServidorId = Fv.DataKey.Values["Par_Servidor_Id"].ToString();
        string dicObjetoId = Fv.DataKey.Values["Dic_Objeto_Id"].ToString();
        string dicObjetoNombre = Fv.DataKey.Values["Dic_Objeto_Nombre"].ToString();

        int limiteRegistros = Convert.ToInt32(Fv.DataKey.Values["Limite_registros"]);
        int numeroUsuarios = Convert.ToInt32(Fv.DataKey.Values["Numero_usuarios"]);

        BO_Dic_Paginacion boDicPaginacion = new BO_Dic_Paginacion();
        int borrado = 0;

        try
        {
            borrado  = boDicPaginacion.DeleteServidorObjeto((Scope) Session["Scope"], parServidorId, dicObjetoId);
        }
        catch
        {
            AsignarMensaje("No se pudo borrar registro", bad);
        }

        if( borrado == 0)
            AsignarMensaje("Ningun registro eliminado", bad);

        string strTipoObjeto = "FEL." + dicObjetoNombre.Substring(0, 3).ToUpper() + "." + "BO_" + DarFormatoNombreObjeto(dicObjetoNombre);

        IList lista = EjecutarMetodo(strTipoObjeto, "Get", "", (Scope)Session["Scope"]) as IList;

        int totalRegistros = lista.Count;

        double tamanioPaginacion = limiteRegistros/numeroUsuarios;

        int totalPaginas = (int)Math.Round( totalRegistros / tamanioPaginacion );

        int excedente = totalRegistros - (int)tamanioPaginacion * totalPaginas;

        if (excedente < Convert.ToInt32(Fv.DataKey.Values["Umbral"]) && totalPaginas > 0)
        {
            totalPaginas--;
        }

        if (totalPaginas == 0)
            totalPaginas = 1;

        long rangos = (999999999999 / totalPaginas);
        long inicial = 0;
        long final = rangos;

        int objetoNumero = ObtenerObjeto(dicObjetoId).Numero;

        string strNumeroObjeto = NormalizarTamanio(objetoNumero.ToString(), 5);

        for ( int i = 1; i <= totalPaginas; i++)
        {
            if (i == totalPaginas)
                final = 999999999999;

            Dic_Paginacion dicPaginacion = new Dic_Paginacion();
            dicPaginacion.Dic_Objeto_Id = dicObjetoId;
            dicPaginacion.Id_Inicial = strNumeroObjeto + NormalizarTamanio(inicial.ToString(),12);
            dicPaginacion.Id_Final = strNumeroObjeto + NormalizarTamanio(final.ToString(),12);
            dicPaginacion.Secuencia = i;
            dicPaginacion.Par_Servidor_Id = parServidorId;
            boDicPaginacion.Insert((Scope) Session["Scope"], dicPaginacion);
            inicial = final + 1;
            final += rangos;
        }

    }

    private string NormalizarTamanio(string str, int tamanio)
    {
        if (str.Length < tamanio)
        {
            int faltante = tamanio - str.Length;
            return Math.Pow(10.0, faltante).ToString().Substring(1) + str;
        }
        return str;
    }

    private Dic_Objeto ObtenerObjeto (string IdObjeto)
    {
        BO_Dic_Objeto boDicObjeto = new BO_Dic_Objeto();
        return boDicObjeto.GetById("", (Scope) Session["Scope"], IdObjeto)[0];
    }

    private string DarFormatoNombreObjeto(string nombreObjeto)
    {
        StringBuilder stbNombreObjeto = new StringBuilder();
        nombreObjeto = nombreObjeto.ToLower();
        
        for (int i = 0; i < nombreObjeto.Length; i++)
        {
            if(i == 0)
            {
                stbNombreObjeto.Append(nombreObjeto[i].ToString().ToUpper());
                continue;
            }

            if(nombreObjeto[i-1] == '_')
            {
                stbNombreObjeto.Append(nombreObjeto[i].ToString().ToUpper());
                continue;
            }

            stbNombreObjeto.Append(nombreObjeto[i]);
        }

        return stbNombreObjeto.ToString();
    }

    private const string BO_ASSEMBLY = "FEL";

    private Type ObtenerTipo(string typeName)      
    {
        Type type = null;
        Assembly assembly = System.Reflection.Assembly.Load(BO_ASSEMBLY);
        
        if(assembly == null)
            throw new Exception("No se encuetar Assembly");
        
        type = assembly.GetType(typeName);
        
        if(type == null)
            throw new Exception("No se puede encontrar tipo");

        return type;      
    }


    public object EjecutarMetodo(string typeName, string method, params object[] arguments) 
    {
        object returnObject = null;
        Type type = ObtenerTipo(typeName);
        try
        {
            object o = Activator.CreateInstance(type);
            returnObject = type.InvokeMember(method, BindingFlags.Default | BindingFlags.InvokeMethod,
                null, o, arguments);
        }             
        catch{
            //Do some custom exception handling here.
            throw;             
        }
        return returnObject;      
    }
}
