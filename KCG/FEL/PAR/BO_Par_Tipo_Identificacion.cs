
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.PAR
{
    /// <summary>
    /// Acceso a los Web Services WS_PAR
    /// Modulo: Parametros
    /// Tabla: Par_Tipo_Identificacion
    /// </summary>
    [DataObject]
    public class BO_Par_Tipo_Identificacion
    {
        #region  Adapter
        private WS_PAR _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_PAR Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_PAR();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Tipo_Identificacion> Get(string sortExpression, Scope s)
        {
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>(Adapter.Par_Tipo_Identificacion_Get(s));
            lista.Sort(new Par_Tipo_Identificacion_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Par_Tipo_Identificacion_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Tipo_Identificacion> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>(Adapter.Par_Tipo_Identificacion_GetByCodigo(s, Codigo));
            lista.Sort(new Par_Tipo_Identificacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Par_Tipo_Identificacion_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Tipo_Identificacion> GetByEmpresa(string sortExpression, Scope s)
        {
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>(Adapter.Par_Tipo_Identificacion_GetByEmpresa(s));
            lista.Sort(new Par_Tipo_Identificacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Par_Tipo_Identificacion_GetByEmpresa(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Tipo_Identificacion> GetById(string sortExpression, Scope s, string Id)
        {
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>(Adapter.Par_Tipo_Identificacion_GetById(s, Id));
            lista.Sort(new Par_Tipo_Identificacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Par_Tipo_Identificacion_GetById(s, Id));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Tipo_Identificacion> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>(Adapter.Par_Tipo_Identificacion_GetByLikeNombre(s, Nombre));
            lista.Sort(new Par_Tipo_Identificacion_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Par_Tipo_Identificacion_GetByLikeNombre(s, Nombre));
        }
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Par_Tipo_Identificacion
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Par_Tipo_Identificacion o, Par_Tipo_Identificacion original)
        {
            return Adapter.Par_Tipo_Identificacion_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Tipo_Identificacion o = new Par_Tipo_Identificacion();
            Par_Tipo_Identificacion original = new Par_Tipo_Identificacion();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Par_Tipo_Identificacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Par_Tipo_Identificacion o)
        {
            return Adapter.Par_Tipo_Identificacion_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Tipo_Identificacion o = new Par_Tipo_Identificacion();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Par_Tipo_Identificacion
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Par_Tipo_Identificacion o)
        {
            return Adapter.Par_Tipo_Identificacion_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Tipo_Identificacion original = new Par_Tipo_Identificacion();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Par_Tipo_Identificacion_Comparar : IComparer<Par_Tipo_Identificacion>
        {
            private string _sortColumn;
            private bool _reverse;
            public Par_Tipo_Identificacion_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Par_Tipo_Identificacion x, Par_Tipo_Identificacion y)
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
