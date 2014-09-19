/*
 KOALA SOLUTION
 
 Programador: Adrián Armijos
 
 Version 1.1:
 
     * Soporte para traer campos que no obedecen a la lógica de nombres
       del zoom. (Parámetro Obtener) 
     * Mejora en implemetación de la función ObtenerFiltroParaDestino.
 
 Última fecha de modificación: 12-06-2008 12H50 
*/


using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;
using System.Collections;

namespace HER
{
    public class ParametrosZoom
    {
        private FormViewMode _modoRequerimiento;
        private List<DictionaryEntry> _parametros;
        private List<string> _parametrosFiltro;
        private List<string> _parametrosEliminar;
        private Dictionary<string, string> _filtro;
        private Dictionary<string, string> _parametrosObtener; 

        private bool _filtroGenerado;
        private bool _insertarConMemoria;
        private List<DictionaryEntry> _parametrosInsertarConMemoria;
        private string _alias;

        public string Alias
        {
            get { return _alias; }
            set { _alias = value; }
        }

        public Dictionary<string, string> ParametrosObtener
        {
            get { return _parametrosObtener; }
            set { _parametrosObtener = value; }
        }

        public ParametrosZoom()
        {
            _parametros = new List<DictionaryEntry>();
            _filtro = new Dictionary<string, string>();
            _filtroGenerado = false;
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _alias = string.Empty;

        }

        public ParametrosZoom(FormViewMode modoRequerimiento, IEnumerable<string> parametrosFiltro, 
            IEnumerable<string> parametrosEliminar, string alias, Dictionary<string, string> parametrosObtener)
        {
            _modoRequerimiento = modoRequerimiento;
            
            _parametrosFiltro = new List<string>();
            
            _parametrosEliminar = new List<string>();
            
            _parametros = new List<DictionaryEntry>();

            if (parametrosFiltro != null)
                _parametrosFiltro.AddRange(parametrosFiltro);

            if (parametrosEliminar != null)
            _parametrosEliminar.AddRange(parametrosEliminar);
            
            _filtro = new Dictionary<string, string>();
            _filtroGenerado = false;
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _alias = alias;

            _parametrosObtener = new Dictionary<string, string>();
            if (parametrosObtener != null)
            _parametrosObtener = parametrosObtener;


        }

        public ParametrosZoom(FormViewMode modoRequerimiento, IEnumerable<string> parametrosFiltro, string alias)
        {
            _modoRequerimiento = modoRequerimiento;
            _parametrosFiltro = new List<string>();
            _parametrosEliminar = new List<string>();
            _parametros = new List<DictionaryEntry>();
            _parametrosFiltro.AddRange(parametrosFiltro);
            _filtro = new Dictionary<string, string>();
            _filtroGenerado = false;
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _alias = alias;

        }

        public ParametrosZoom(FormViewMode modoRequerimiento)
        {
            _modoRequerimiento = modoRequerimiento;
            _parametrosFiltro = new List<string>();
            _parametrosEliminar = new List<string>();
            _parametros = new List<DictionaryEntry>();
            _filtro = new Dictionary<string, string>();
            _filtroGenerado = false;
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _alias = string.Empty;

        }

        public ParametrosZoom(FormViewMode modoRequerimiento, List<DictionaryEntry> parametros)
        {
            _modoRequerimiento = modoRequerimiento;
            _parametros = parametros;
            _filtro = new Dictionary<string, string>();
            _filtroGenerado = false;
            _insertarConMemoria = false;
            _parametrosInsertarConMemoria = new List<DictionaryEntry>();
            _alias = string.Empty;

        }

        public bool InsertarConMemoria
        {
            get { return _insertarConMemoria; }
            set { _insertarConMemoria = value; }
        }

        public List<DictionaryEntry> ParametrosInsertarConMemoria
        {
            get { return _parametrosInsertarConMemoria; }
            set { _parametrosInsertarConMemoria = value; }
        }

        internal bool FiltroGenerado
        {
            get { return _filtroGenerado; }
            set { _filtroGenerado = value; }
        }

        internal Dictionary<string, string> Filtro
        {
            get { return _filtro; }
            set { _filtro = value; }
        }

        public FormViewMode ModoRequerimiento
        {
            get { return _modoRequerimiento; }
            set { _modoRequerimiento = value; }
        }

        public List<DictionaryEntry> Parametros
        {
            get { return _parametros; }
            set { _parametros = value; }
        }

        public List<string> ParametrosFiltro
        {
            get { return _parametrosFiltro; }
        }

        public List<string> ParametrosEliminar
        {
            get { return _parametrosEliminar; }
        }

    }

    public class ZoomManager
    {
        // < ruta destino , ruta origen >
        private Dictionary<string, string> _requeriminetos;

        // < ruta origen, parametros del requerimiento>
        private Dictionary<string, ParametrosZoom> _parametrosRequerimineto;

        public ZoomManager()
        {
            _requeriminetos = new Dictionary<string, string>();
            _parametrosRequerimineto = new Dictionary<string, ParametrosZoom>();
        }

        public bool ContieneRequerimientoOrigen(string rutaOrigen)
        {
            return _requeriminetos.ContainsValue(rutaOrigen);
        }

        public bool ContieneRequerimientoDestino(string rutaDestino)
        {
            return _requeriminetos.ContainsKey(rutaDestino);
        }

        public string ObtenerRutaOrigen(string rutaDestino)
        {
            return _requeriminetos[rutaDestino];
        }

        public FormViewMode ObtenerModoDeRequerimiento(string rutaOrigen)
        {
            return _parametrosRequerimineto[rutaOrigen].ModoRequerimiento;
        }

        public List<DictionaryEntry> ObtenerParametrosRequerimiento(string rutaOrigen)
        {
            return _parametrosRequerimineto[rutaOrigen].Parametros;
        }

        public ParametrosZoom ObtenerParametrosZoom(string rutaOrigen)
        {
            return _parametrosRequerimineto[rutaOrigen];
        }

        public bool AgregarRequerimiento(string rutaOrigen, string rutaDestino, FormViewMode modoRequerimiento, List<DictionaryEntry> parametros)
        {
            if (_requeriminetos.ContainsValue(rutaOrigen) ||
                _requeriminetos.ContainsKey(rutaDestino))
            {
                return false;
            }
            _requeriminetos.Add(rutaDestino, rutaOrigen);
            _parametrosRequerimineto.Add(rutaOrigen, new ParametrosZoom(modoRequerimiento, parametros));
            return true;
        }

        public bool AgregarRequerimiento(string rutaOrigen, string rutaDestino, FormViewMode modoRequerimiento)
        {
            if (_requeriminetos.ContainsValue(rutaOrigen) ||
                _requeriminetos.ContainsKey(rutaDestino))
            {
                return false;
            }
            _requeriminetos.Add(rutaDestino, rutaOrigen);
            _parametrosRequerimineto.Add(rutaOrigen, new ParametrosZoom(modoRequerimiento));
            return true;
        }

        public bool AgregarRequerimiento(string rutaOrigen, FormViewMode modoRequerimiento, string parametrosZoom)
        {
            parametrosZoom = NormalizarParametros(parametrosZoom);
            Dictionary<string, string> dicParametrosZoom = 
                ObtenerParametros(parametrosZoom, new char[] {';', ':'}, true);
            
            string rutaDestino = dicParametrosZoom["RUTADESTINO"];

            //bool agregarRequerimineto = false;
            
            if (_requeriminetos.ContainsValue(rutaOrigen) ||
                _requeriminetos.ContainsKey(rutaDestino))
            {
                return false;
            }

            

            string alias = string.Empty;

            if(dicParametrosZoom.ContainsKey("ALIAS"))
                alias = dicParametrosZoom["ALIAS"];

            Dictionary<string, string> parametrosObtener = null;

            if (dicParametrosZoom.ContainsKey("OBTENER"))
            {
                parametrosObtener = ObtenerParametros(dicParametrosZoom["OBTENER"], new char[] { '|', ',' }, false);
            }

            IEnumerable<string> parametrosFiltro = null;;

            if (dicParametrosZoom.ContainsKey("FILTRO"))
            {
                parametrosFiltro = dicParametrosZoom["FILTRO"].Split('|');
            }

            IEnumerable<string> parametrosNoGuardar = null;;
            if (dicParametrosZoom.ContainsKey("NOGUARDAR"))
            {
                parametrosNoGuardar = dicParametrosZoom["NOGUARDAR"].Split('|');
            }

            ParametrosZoom parametros = new ParametrosZoom(modoRequerimiento, parametrosFiltro, parametrosNoGuardar, alias,  parametrosObtener);

            _requeriminetos.Add(rutaDestino, rutaOrigen);
            _parametrosRequerimineto.Add(rutaOrigen, parametros);

            return true;
        }

        public bool AgregarRequerimiento(string rutaOrigen, FormViewMode modoRequerimiento)
        {
            if (_requeriminetos.ContainsValue(rutaOrigen))
            {
                return false;
            }
            _requeriminetos.Add("-no-", rutaOrigen);
            _parametrosRequerimineto.Add(rutaOrigen, new ParametrosZoom(modoRequerimiento));
            return true;
        }


        public string ObtenerRutaDestino(string rutaOrigen)
        {
            string rutaDestino = string.Empty;
            foreach (KeyValuePair<string, string> requerimiento in _requeriminetos)
            {
                if (requerimiento.Value == rutaOrigen)
                {
                    rutaDestino = requerimiento.Key;
                    break;
                }
            }
            return rutaDestino;
        }


        public void RemoverRequerimiento(string rutaOrigen)
        {
            string rutaDestino = ObtenerRutaDestino(rutaOrigen);

            if (string.IsNullOrEmpty(rutaDestino))
                return;

            _parametrosRequerimineto.Remove(rutaOrigen);
            _requeriminetos.Remove(rutaDestino);

        }

        public string ObtenerIdDeParametros(string rutaOrigen)
        {
            string id = string.Empty;
            foreach (DictionaryEntry parametro in _parametrosRequerimineto[rutaOrigen].Parametros)
            {
                if (parametro.Key.ToString() == "Id")
                {
                    id = parametro.Value.ToString();
                    break;
                }
            }
            return id;
        }

        public string ObtenerValorPropiedadDeParametros(string rutaOrigen, string propiedad)
        {
            string id = string.Empty;

            if (!_parametrosRequerimineto.ContainsKey(rutaOrigen))
                return id;

            foreach (DictionaryEntry parametro in _parametrosRequerimineto[rutaOrigen].Parametros)
            {
                if (parametro.Key.ToString() == propiedad)
                {
                    id = parametro.Value.ToString();
                    break;
                }
            }
            return id;
        }



        public Dictionary<string, string> ObtenerFiltroParaDestino(string rutaDestino, string nombreObjetoDestino)
        {
            string rutaOrigen = ObtenerRutaOrigen(rutaDestino);

            ParametrosZoom parametrosZoom = ObtenerParametrosZoom(rutaOrigen);

            // se obtiene el filtro si ya se ha generado
            if (parametrosZoom.FiltroGenerado)
                return parametrosZoom.Filtro;

            List<string> parametrosFiltrado = ObtenerParametrosZoom(
                rutaOrigen).ParametrosFiltro;

            Dictionary<string, string> filtro = new Dictionary<string, string>();

            if(parametrosFiltrado.Count == 0)
            {
                parametrosZoom.FiltroGenerado = true;
                return filtro;
            }

            List<DictionaryEntry> parametrosOrigen = ObtenerParametrosRequerimiento(rutaOrigen);

            string alias = parametrosZoom.Alias;

            string prefijoParametro = string.Empty;
            
            if (alias == string.Empty)
                prefijoParametro = nombreObjetoDestino.ToUpper() + "_";
            else
                prefijoParametro = alias + "_" + nombreObjetoDestino + "_";

            for (int i = 0; i < parametrosFiltrado.Count; i++ )
            {
                string valorFiltro = BuscarEntradaParametro(parametrosFiltrado[i], parametrosOrigen);
                if( string.IsNullOrEmpty(valorFiltro) )continue;
                string nombreFiltro = parametrosFiltrado[i];
                IntentarObtenerNombreParametro(ref nombreFiltro, prefijoParametro);
                filtro.Add(nombreFiltro, valorFiltro);
            }

            parametrosZoom.FiltroGenerado = true;

            if (filtro.Count > 0)
            {
                parametrosZoom.Filtro = filtro;
            }

            return filtro;





            /*string rutaOrigen = ObtenerRutaOrigen(rutaDestino);

            if (ObtenerParametrosZoom(rutaOrigen).FiltroGenerado)
                return ObtenerParametrosZoom(rutaOrigen).Filtro;

            Dictionary<string, string> filtro = new Dictionary<string, string>();

            List<string> parametrosFiltrado = ObtenerParametrosZoom(
                rutaOrigen).ParametrosFiltro;

            List<DictionaryEntry> parametrosOrigen = ObtenerParametrosRequerimiento(rutaOrigen);

            string alias = ObtenerParametrosZoom(rutaOrigen).Alias;
           
            //codigo para el zoom
            for (int i = 0; i < parametrosOrigen.Count; i++)
            {
                if (string.IsNullOrEmpty(parametrosOrigen[i].Value.ToString()))
                    continue;

                for (int j = 0; j < parametrosFiltrado.Count; j++)
                {
                    string prefijoParametro = string.Empty;
                    if (alias == string.Empty)
                        prefijoParametro = nombreObjetoDestino.ToUpper() + "_";
                    else
                        prefijoParametro = alias + "_" + nombreObjetoDestino.ToUpper() + "_";

                    if (parametrosOrigen[i].Key.ToString().ToUpper().Contains(prefijoParametro.ToUpper()))
                    {
                        string nombreParametro = parametrosOrigen[i].Key.ToString().ToUpper();
                        if(alias == string.Empty)
                            nombreParametro = nombreParametro.Replace(nombreObjetoDestino.ToUpper() + "_", "");
                        else
                            nombreParametro = nombreParametro.Replace(alias + "_" + nombreObjetoDestino.ToUpper() + "_", "");


                        switch (nombreParametro)
                        {
                            case "CODIGO":
                                {
                                    filtro.Add("Codigo",
                                        parametrosOrigen[i].Value.ToString());
                                    break;
                                }
                            case "NOMBRE":
                                {
                                    filtro.Add("Nombre",
                                        parametrosOrigen[i].Value.ToString());
                                    break;
                                }
                            case "ID":
                                {
                                    if (ObtenerModoDeRequerimiento(rutaOrigen) == FormViewMode.ReadOnly)
                                        filtro.Add("Id", parametrosOrigen[i].Value.ToString());
                                    break;
                                }
                        }
                        break;
                    }
                    else if (parametrosOrigen[i].Key.ToString() == parametrosFiltrado[j])
                    {
                        if (alias == string.Empty)
                        {
                            filtro.Add(parametrosOrigen[i].Key.ToString(),
                                       parametrosOrigen[i].Value.ToString());
                        }
                        else
                        {
                            filtro.Add(parametrosOrigen[i].Key.ToString().Replace(alias + "_", ""),
                                       parametrosOrigen[i].Value.ToString());
                        }
                        break;
                    }
                }
            }

            ObtenerParametrosZoom(rutaOrigen).FiltroGenerado = true;

            if (filtro.Count > 0)
            {
                this.ObtenerParametrosZoom(rutaOrigen).Filtro = filtro;
            }

            return filtro;*/
        }

        bool IntentarObtenerNombreParametro(ref string nombreOrigen, string prefijoDestino)
        {
            switch( nombreOrigen.ToUpper().Replace(prefijoDestino.ToUpper(), ""))
            {
                case "CODIGO":
                    {
                        nombreOrigen = "Codigo";
                        return true;
                    }
                case "NOMBRE":
                    {
                        nombreOrigen = "Nombre";
                        return true;
                    }
                case "ID":
                    {
                        nombreOrigen = "Id";
                        return true;
                    }
                default :
                    {
                        return false;
                    }
            }
        }

        private string BuscarEntradaParametro (string claveEntrada, IList<DictionaryEntry> parametros)
        {
            for(int i = 0; i < parametros.Count; i++)
            {
                if ( claveEntrada == parametros[i].Key.ToString() )
                {
                    return parametros[i].Value.ToString();
                }
            }
            return null;
        }



        public static string NormalizarParametros(string parametros)
        {
            //quitar punto y coma final, espacios y saltos de linea
            //18-11-2009 Se agrego Replace("\r", ""), por que no estaba filtrando bien 
            return parametros.TrimEnd(';').Replace("\n", "").Replace(" ", "").Replace("\r", "");

        }


        public static Dictionary<string, string> ObtenerParametros(string parametros, char[] separacion, bool convertirMayusculas)
        {
            string[] param = parametros.Split(separacion);
            Dictionary<string, string> dicParametros = new Dictionary<string, string>();
            for (int i = 0; i < param.Length; i += 2)
            {
                if (convertirMayusculas)
                    dicParametros.Add(param[i].ToUpper(), param[i + 1]);
                else
                    dicParametros.Add(param[i], param[i + 1]);
            }
            return dicParametros;
        }
    }
}
