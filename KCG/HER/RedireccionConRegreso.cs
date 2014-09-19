/*
KOALA SOLUTION 
 
KPagina          - pagina base
RegresoManager   - historial de retorno (Eliminado Version 2.0) 
KUbicacionUrl    - item en el historial de retorno
KRutaNavegacion  - almacena la ruta de navegación del usuario

KPaginaViewState      - Manager estado de vista de la pagina
KColeccionViewState   - Colección de estado en una página
KViewState            - Estado de un control
KPropiedadPersistente - Atributo para manejo de estado

ver 3.0

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: Página con historial de navegación y estados de vista
            permanentes entre redirecciones
							
NOTAS DE DISEÑO
 * Version 1.0
   - RegresoManager se puede configurar para comparación completa
     de path de retorno (path relativo + query) o solo comparar
     path relativo.
 * Version 2.0
   - Soporte navegación atras y adelante
 * Version 3.0
   - Las propiedades que un control puede mantener entre redirecciones
     es configurable (KPropiedadPersistente).
   - Dependiendo del control, algunas propiedades son de solo lectura,
     por tando deberan ser asignadas por otro mecanismo y pueden ser
     recuperadas por medio del método ObtenerEstadoPropiedad de KPagina.
   - Se basa en el artículo http://www.codeproject.com/KB/session/PersistAttribute.aspx
     de Fábio Batista.
	
HISTORIA     					 
 * Version 1.0
   - Tambien se incluye un boton de retorno en el proyecto KoalaWebControls (Eliminado Version 2.0) 
   - Redirrecionar con regreso 
   - RedireccionarUrlAnterior
 * Version 1.1
   - Problema de regreso con un boton no KButonAtras
 * Version 2.0
   - Se elimino la clase RegresoManager
 * Version 3.0
   - Soporte a controles con memeria en redirecciones.

ÚLTIMA FECHA DE MODIFICACIÓN
25-06-2008 12H53

*/

using System;
using System.Collections.Generic;
using System.Reflection;
using System.Web;
using System.Web.UI;

namespace HER
{
    public class KPagina : Page
    {
        //Indices en Session 
        private const string _IndiceSessionRegresoManager = "RutaNavegacionManager";
        private const string _IndiceSessionViewStateManager = "ViewStateManage";

        //Banderas para bscar propiedades
        private const BindingFlags FieldBindingFlags =
            BindingFlags.Instance | BindingFlags.NonPublic;

        //Ubicaión de la pagina en ejecución
        private KUbicacionUrl _ubicacion;

        //Managers
        private KPaginaViewState _viewStateManager;
        private KRutaNavegacion _rutaNavegacionManager;

        public KRutaNavegacion RutaNavegacionManager
        {
            get
            {
                if (_rutaNavegacionManager != null)
                    return _rutaNavegacionManager;
                _rutaNavegacionManager = (KRutaNavegacion) Session[_IndiceSessionRegresoManager];
                if (_rutaNavegacionManager != null)
                    return _rutaNavegacionManager;
                _rutaNavegacionManager = new KRutaNavegacion();
                Session[_IndiceSessionRegresoManager] = _rutaNavegacionManager;
                return _rutaNavegacionManager;
            }
        }

        private KPaginaViewState ViewStateManager
        {
            get
            {
                if (_viewStateManager != null)
                    return _viewStateManager;
                _viewStateManager = (KPaginaViewState) Session[_IndiceSessionViewStateManager];
                if (_viewStateManager != null)
                    return _viewStateManager;
                _viewStateManager = new KPaginaViewState();
                Session[_IndiceSessionViewStateManager] = _viewStateManager;
                return _viewStateManager;
            }
        }

        protected KViewState ObtenerEstadoPropiedad(string nombrePropiedad)
        {
            if (string.IsNullOrEmpty(nombrePropiedad)) return null;
            PropertyInfo pi = GetType().GetProperty(nombrePropiedad, FieldBindingFlags);
            if(pi == null) return null;
            KPropiedadPersistente attr = KPropiedadPersistente.GetAttribute(pi);
            if (attr == null) return null;
            return ViewStateManager.ObtenerViewState(this, _ubicacion, pi);
        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (!IsPostBack)
            {
                if (!RutaNavegacionManager.SeUtilizoRedireccionLocal)
                    RutaNavegacionManager.AgregarSalto(new KUbicacionUrl(AppRelativeVirtualPath, Request.Url.Query));
            }
            RutaNavegacionManager.SeUtilizoRedireccionLocal = false;
        }

        protected override void OnPreLoad(EventArgs e)
        {
            _ubicacion = new KUbicacionUrl(AppRelativeVirtualPath, Request.Url.Query);

            foreach (PropertyInfo propiedadInfo in GetType().GetProperties(FieldBindingFlags))
            {
                KPropiedadPersistente atributo = KPropiedadPersistente.GetAttribute(propiedadInfo);
                if (atributo != null)
                {
                    ViewStateManager.IntentarDarValor(this,
                                                      _ubicacion,
                                                      propiedadInfo);
                }
            }
            base.OnPreLoad(e);
        }

        protected override void OnUnload(EventArgs e)
        {
            base.OnUnload(e);

            foreach (PropertyInfo propiedadInfo in GetType().GetProperties(FieldBindingFlags))
            {
                KPropiedadPersistente atributo = KPropiedadPersistente.GetAttribute(propiedadInfo);
                if (atributo != null)
                {
                    ViewStateManager.IntentarGuardarValor(this,
                                                          _ubicacion,
                                                          propiedadInfo, atributo.PropiedadesPersistentes);
                }
            }
        }
    }


    public class KRutaNavegacion
    {
        private int _indiceActual;
        private List<KUbicacionUrl> _saltosUrl;
        private bool _seUtilizoRedireccionLocal;

        public KRutaNavegacion()
        {
            _saltosUrl = new List<KUbicacionUrl>();
            _indiceActual = -1;
            _seUtilizoRedireccionLocal = false;
        }

        internal bool SeUtilizoRedireccionLocal
        {
            get { return _seUtilizoRedireccionLocal; }
            set { _seUtilizoRedireccionLocal = value; }
        }

        public KUbicacionUrl UbicacionActual
        {
            get
            {
                if (_indiceActual == -1)
                    return null;
                return _saltosUrl[_indiceActual];
            }
        }

        public int IndiceActual
        {
            get { return _indiceActual; }
        }

        public bool ExisteSaltoAtras
        {
            get { return _indiceActual > 0; }
        }

        public bool ExiteSaltoAdelante
        {
            get { return _indiceActual < _saltosUrl.Count - 1; }
        }

        public KUbicacionUrl this[int indice]
        {
            get { return _saltosUrl[indice]; }
        }

        internal void AgregarSalto(KUbicacionUrl itemNavegacion)
        {
            BorrarSaltosAdelante();

            if (_indiceActual == -1)
            {
                _saltosUrl.Add(itemNavegacion);
                _indiceActual++;
            }

            if (!itemNavegacion.Equals(_saltosUrl[_indiceActual]))
            {
                _saltosUrl.Add(itemNavegacion);
                _indiceActual++;
            }
        }

        private void BorrarSaltosAdelante()
        {
            int _indiceBoraraDesde = _indiceActual + 1;
            if (_indiceBoraraDesde > _saltosUrl.Count - 1)
                return;
            int _longitudBorrado = _saltosUrl.Count - _indiceActual - 1;
            if (_longitudBorrado < 1)
                return;
            _saltosUrl.RemoveRange(_indiceBoraraDesde, _longitudBorrado);
        }

        public void IrAdelante()
        {
            if (ExiteSaltoAdelante)
            {
                _seUtilizoRedireccionLocal = true;
                _indiceActual++;
                HttpContext.Current.Response.Redirect(_saltosUrl[_indiceActual].PathCompleto);
            }
        }

        public void IrAtras()
        {
            if (ExisteSaltoAtras)
            {
                _seUtilizoRedireccionLocal = true;
                _indiceActual--;
                HttpContext.Current.Response.Redirect(_saltosUrl[_indiceActual].PathCompleto);
            }
        }
    }

    public class KUbicacionUrl : IEquatable<KUbicacionUrl>
    {
        private string _pathRelativo;
        private string _query;

        private KUbicacionUrl(string pathRelativo, string query, bool urlDencode)
        {
            query = query ?? string.Empty;

            if (urlDencode)
            {
                _pathRelativo = pathRelativo;
                _query = HttpContext.Current.Server.UrlDecode(query);
            }
            else
            {
                _pathRelativo = pathRelativo;
                _query = query;
            }
        }

        public KUbicacionUrl(string pathRelativo, string query) :
            this(pathRelativo, query, true)
        {
        }

        public KUbicacionUrl(KUbicacionUrl ubicacionUrl)
            : this(ubicacionUrl._pathRelativo, ubicacionUrl._query, false)
        {
        }

        public KUbicacionUrl(string pathCompleto)
            : this(SepararUrlQuery(pathCompleto))
        {
        }

        public string PathRelativo
        {
            get { return _pathRelativo; }
        }

        public string Query
        {
            get { return _query; }
        }

        public string PathCompleto
        {
            get { return PathRelativo + Query; }
        }

        #region IEquatable<KUbicacionUrl> Members

        public bool Equals(KUbicacionUrl other)
        {
            if (ReferenceEquals(this, other))
                return true;
            if (other == null)
                return false;
            return _pathRelativo == other._pathRelativo && _query == other._query;
        }

        #endregion

        public static KUbicacionUrl SepararUrlQuery(string urlCompleto)
        {
            int indiceDeQuery = urlCompleto.IndexOf('?');
            return (indiceDeQuery == -1)
                       ?
                           new KUbicacionUrl(urlCompleto, string.Empty)
                       :
                           new KUbicacionUrl(urlCompleto.Substring(0, indiceDeQuery),
                                             urlCompleto.Substring(indiceDeQuery));
        }

        #region Nested type: CompararPathRelativo

        public class CompararPathRelativo : IEqualityComparer<KUbicacionUrl>
        {
            #region IEqualityComparer<KUbicacionUrl> Members

            public bool Equals(KUbicacionUrl x, KUbicacionUrl y)
            {
                if (ReferenceEquals(x, y))
                    return true;
                if (x == null || y == null)
                    return false;
                return x._pathRelativo == y._pathRelativo;
            }

            public int GetHashCode(KUbicacionUrl x)
            {
                return x._pathRelativo.GetHashCode();
            }

            #endregion
        }

        #endregion

        #region Nested type: CompararPathRelativoYQuery

        public class CompararPathRelativoYQuery : IEqualityComparer<KUbicacionUrl>
        {
            #region IEqualityComparer<KUbicacionUrl> Members

            public bool Equals(KUbicacionUrl x, KUbicacionUrl y)
            {
                if (ReferenceEquals(x, y))
                    return true;
                if (x == null || y == null)
                    return false;
                return x._pathRelativo == y._pathRelativo && x._query == y._query;
            }

            public int GetHashCode(KUbicacionUrl x)
            {
                return x._query.GetHashCode() ^ x._pathRelativo.GetHashCode();
            }

            #endregion
        }

        #endregion
    }

    public class KPaginaViewState : Dictionary<KUbicacionUrl, KColeccionViewState>
    {
        public KPaginaViewState() : base(new KUbicacionUrl.CompararPathRelativo())
        {
        }

        internal KViewState ObtenerViewState(Page pagina, KUbicacionUrl ubicacion, PropertyInfo propiedadInfo)
        {
            KColeccionViewState paginaEstado;
            bool existePaginaEstado = TryGetValue(ubicacion, out paginaEstado);
            if (existePaginaEstado)
            {
                string nombrePropiedad = propiedadInfo.Name;
                KViewState propiedadEstado;
                bool existePropiedadEstado = paginaEstado.TryGetValue(nombrePropiedad, out propiedadEstado);
                if (existePropiedadEstado)
                {
                    return propiedadEstado;
                }
            }
            return null;
        }

        public void IntentarDarValor(Page pagina, KUbicacionUrl ubicacion, PropertyInfo propiedadInfo)
        {
            KColeccionViewState paginaEstado;
            bool existePaginaEstado = TryGetValue(ubicacion, out paginaEstado);
            if (existePaginaEstado)
            {
                string nombrePropiedad = propiedadInfo.Name;
                KViewState propiedadEstado;
                bool existePropiedadEstado = paginaEstado.TryGetValue(nombrePropiedad, out propiedadEstado);
                if (existePropiedadEstado)
                {
                    KViewState.AsignarValor(propiedadInfo, pagina, propiedadEstado);
                }
            }
        }

        public void IntentarGuardarValor(Page pagina, KUbicacionUrl ubicacion, PropertyInfo propiedadInfo,
                                         string[] propiedadesPersistentes)
        {
            object constrol = propiedadInfo.GetValue(pagina, null);
            if (propiedadesPersistentes == null) return;
            if (propiedadesPersistentes.Length == 0) return;

            KColeccionViewState paginaEstado;
            bool existePaginaEstado = TryGetValue(ubicacion, out paginaEstado);
            if (!existePaginaEstado)
            {
                paginaEstado = new KColeccionViewState();
                this[ubicacion] = paginaEstado;
            }
            KViewState propiedadEstado;
            propiedadEstado = new KViewState(constrol, propiedadesPersistentes);
            paginaEstado[propiedadInfo.Name] = propiedadEstado;
        }
    }


    public class KColeccionViewState : Dictionary<string, KViewState>
    {
    }


    public class KViewState : Dictionary<string, object>
    {
        public KViewState(object control, IEnumerable<string> propiedadesPersistentes)
        {
            if (propiedadesPersistentes == null) return;
            foreach (string s in propiedadesPersistentes)
            {
                PropertyInfo propiedadInfo = control.GetType().GetProperty(s);
                if (propiedadInfo.CanRead)
                    Add(s, propiedadInfo.GetValue(control, null));
            }
        }

        public static void AsignarValor(PropertyInfo propiedadInfo, object pagina, KViewState propiedadEstado)
        {
            object constrol = propiedadInfo.GetValue(pagina, null);
            foreach (KeyValuePair<string, object> pair in propiedadEstado)
            {
                PropertyInfo pii = constrol.GetType().GetProperty(pair.Key);
                if (pii.CanWrite)
                    pii.SetValue(constrol, pair.Value, null);
            }
        }
    }


    [AttributeUsage(AttributeTargets.Property)]
    public class KPropiedadPersistente : Attribute
    {
        private string[] propiedades;

        public KPropiedadPersistente(string propiedadesPersistentes)
        {
            propiedades = propiedadesPersistentes.Split(';');
        }

        public string[] PropiedadesPersistentes
        {
            get { return propiedades; }
        }

        public static KPropiedadPersistente GetAttribute(MemberInfo mi)
        {
            return (KPropiedadPersistente) GetCustomAttribute(mi,
                                                             typeof (KPropiedadPersistente));
        }
    }


    /*public class RegresoManager : Dictionary<KUbicacionUrl, KUbicacionUrl>
    {
        public RegresoManager()
            : base(new KUbicacionUrl.CompararPathRelativoYQuery())
        {
        }

        public RegresoManager(IEqualityComparer<KUbicacionUrl> equalityComparer)
            : base(equalityComparer)
        {
        }

        public void AgregarRegreso(KUbicacionUrl urlPartida, KUbicacionUrl urlLlegada)
        {
            if (ContainsKey(urlLlegada))
                this[urlLlegada] = urlPartida;
            else
                Add(urlLlegada, urlPartida);   
        }

        public void AgregarRegreso(string urlPartida, string urlLlegada)
        {
            AgregarRegreso(new KUbicacionUrl(urlPartida), new KUbicacionUrl(urlLlegada));
        }

        public void AgregarRegreso(string pathRelativoPartida, string queryPartida, string urlLlegada)
        {
            AgregarRegreso(new KUbicacionUrl(pathRelativoPartida, queryPartida), new KUbicacionUrl(urlLlegada));
        }

        public KUbicacionUrl ObtenerUrlPartida(KUbicacionUrl ubicacionLlegada)
        {
            KUbicacionUrl ubicacionPartida;
            TryGetValue(ubicacionLlegada, out ubicacionPartida);
            return ubicacionPartida;
        }

        public KUbicacionUrl ObtenerUrlPartida(string urlLlegada)
        {
            return ObtenerUrlPartida(new KUbicacionUrl(urlLlegada));
        }

        public KUbicacionUrl ObtenerUrlPartida(string pathRelativoLlegada, string queryLlegada)
        {
            return ObtenerUrlPartida(new KUbicacionUrl(pathRelativoLlegada, queryLlegada));
        }

        public KUbicacionUrl SacarUrlPartida(KUbicacionUrl ubicacionLlegada)
        {
            KUbicacionUrl tempUbicacionPartida = ObtenerUrlPartida(ubicacionLlegada);
            if (tempUbicacionPartida != null)
                Remove(new KUbicacionUrl(ubicacionLlegada));
            return tempUbicacionPartida;
        }

        public KUbicacionUrl SacarUrlPartida(string urlLlegada)
        {
            return SacarUrlPartida(new KUbicacionUrl(urlLlegada));
        }

        public KUbicacionUrl SacarUrlPartida(string pathRelativoLlegada, string queryLlegada)
        {
            return SacarUrlPartida(new KUbicacionUrl(pathRelativoLlegada, queryLlegada));
        }
    }*/
}