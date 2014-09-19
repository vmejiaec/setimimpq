
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
    /// Tabla: Par_Razon_Social
    /// </summary>
    [DataObject]
    public class BO_Par_Razon_Social
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
        public List<Par_Razon_Social> Get(string sortExpression, Scope s)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_Get(s));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetByCodigo(s, Codigo));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetByEmpresa(string sortExpression, Scope s)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetByEmpresa(s));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetByEmpresa(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetById(string sortExpression, Scope s, string Id)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetById(s, Id));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetByLikeNombre(string sortExpression, Scope s, string Par_Tipo_Identificacion_Id, string Nombre)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetByLikeNombre(s, Par_Tipo_Identificacion_Id, Nombre));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Par_Tipo_Identificacion_Id, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetByLikeNombre(s, Par_Tipo_Identificacion_Id, Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetByLikeNumero(string sortExpression, Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetByLikeNumero(s, Par_Tipo_Identificacion_Id, Numero));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetByLikeNumero(s, Par_Tipo_Identificacion_Id, Numero));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Par_Razon_Social> GetByTipoNumero(string sortExpression, Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>(Adapter.Par_Razon_Social_GetByTipoNumero(s, Par_Tipo_Identificacion_Id, Numero));
            lista.Sort(new Par_Razon_Social_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByTipoNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            return EntidadDT.GetDT(Adapter.Par_Razon_Social_GetByTipoNumero(s, Par_Tipo_Identificacion_Id, Numero));
        }

        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Par_Razon_Social
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Par_Razon_Social o, Par_Razon_Social original)
        {
            return Adapter.Par_Razon_Social_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Razon_Social o = new Par_Razon_Social();
            Par_Razon_Social original = new Par_Razon_Social();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Par_Razon_Social
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Par_Razon_Social o)
        {
            return Adapter.Par_Razon_Social_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Razon_Social o = new Par_Razon_Social();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Par_Razon_Social
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Par_Razon_Social o)
        {
            return Adapter.Par_Razon_Social_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Par_Razon_Social original = new Par_Razon_Social();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Par_Razon_Social_Comparar : IComparer<Par_Razon_Social>
        {
            private string _sortColumn;
            private bool _reverse;
            public Par_Razon_Social_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Par_Razon_Social x, Par_Razon_Social y)
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
