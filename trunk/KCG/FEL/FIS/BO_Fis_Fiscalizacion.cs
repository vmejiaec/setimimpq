
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.FIS
{
    /// <summary>
    /// Acceso a los Web Services WS_FIS
    /// Modulo: Fiscalizaci
    /// Tabla: Fis_Fiscalizacion
    /// </summary>
    [DataObject]
    public class BO_Fis_Fiscalizacion
    {
        #region  Adapter
        private WS_FIS _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_FIS Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_FIS();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Fiscalizacion> Get(string sortExpression, Scope s)
        {
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>(Adapter.Fis_Fiscalizacion_Get(s));
            lista.Sort(new Fis_Fiscalizacion_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Fiscalizacion_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Fiscalizacion> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>(Adapter.Fis_Fiscalizacion_GetById(s, Id));
            lista.Sort(new Fis_Fiscalizacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Fiscalizacion_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Fiscalizacion> GetBySucursal(string sortExpression, Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>(Adapter.Fis_Fiscalizacion_GetBySucursal(s,Codigo_Desde,Codigo_Hasta,Codigo_Institucion,Nombre_Proyecto,Estado,Contratista,Fiscalizador));
            lista.Sort(new Fis_Fiscalizacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            return EntidadDT.GetDT(Adapter.Fis_Fiscalizacion_GetBySucursal(s,Codigo_Desde,Codigo_Hasta,Codigo_Institucion,Nombre_Proyecto,Estado,Contratista,Fiscalizador));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Fiscalizacion> GetByFiscalizacion(string sortExpression, Scope s, string Id)
        {
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>(Adapter.Fis_Fiscalizacion_GetByFiscalizacion(s, Id));
            lista.Sort(new Fis_Fiscalizacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByFiscalizacion(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Fiscalizacion_GetByFiscalizacion(s, Id));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            return Adapter.Fis_Fiscalizacion_TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Codigo_Institucion,Nombre_Proyecto,Estado,Contratista,Fiscalizador);
        }
        #endregion
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Fiscalizacion
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Fiscalizacion o, Fis_Fiscalizacion original)
        {
            return Adapter.Fis_Fiscalizacion_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Fiscalizacion o = new Fis_Fiscalizacion();
            Fis_Fiscalizacion original = new Fis_Fiscalizacion();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        
        #endregion
        #region Ordenar la lista
        class Fis_Fiscalizacion_Comparar : IComparer<Fis_Fiscalizacion>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Fiscalizacion_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Fiscalizacion x, Fis_Fiscalizacion y)
            {
                int retVal = 0;
                switch (_sortColumn)
                {
                    case "Id":
                        retVal = string.Compare(x.Id, y.Id);
                        break;
                    case "Nombre":
                        retVal = string.Compare(x.Nombre, y.Nombre);
                        break;
                    case "Codigo":
                        retVal = string.Compare(x.Codigo, y.Codigo);
                        break;
                    case "Estado":
                        retVal = string.Compare(x.Estado, y.Estado);
                        break;
                }
                return (retVal * (_reverse ? -1 : 1));
            }
        }
        #endregion
    }
}
