using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;

namespace FEL.PER
{
    /// <summary>
    /// Acceso a los Web Services WS_PER
    /// Modulo: Personal t
    /// Tabla: Per_Personal
    /// </summary>
    [DataObject]
    public class BO_Per_Personal
    {
        #region  Adapter

        private WS_PER _Adapter;

        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_PER Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_PER();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> Get(string sortExpression, Scope s)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_Get(s));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_GetByCodigo(s, Codigo));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> GetById(string sortExpression, Scope s, string Id)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_GetById(s, Id));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> GetByJefeCostos(string sortExpression, Scope s)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_GetByJefeCostos(s));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByJefeCostos(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_GetByJefeCostos(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_GetByLikeNombre(s, Nombre));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_GetByLikeNombre(s, Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Per_Personal> GetByLikeFiscalizacion(string sortExpression, Scope s, string Nombre)
        {
            List<Per_Personal> lista = new List<Per_Personal>(Adapter.Per_Personal_GetByLikeFiscalizacion(s, Nombre));
            lista.Sort(new Per_Personal_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeFiscalizacion(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Per_Personal_GetByLikeFiscalizacion(s, Nombre));
        }

        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Per_Personal
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Per_Personal o, Per_Personal original)
        {
            return Adapter.Per_Personal_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Per_Personal o = new Per_Personal();
            Per_Personal original = new Per_Personal();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Per_Personal
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Per_Personal o)
        {
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            o.Jefe_Costos = "N";
            return Adapter.Per_Personal_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Per_Personal o = new Per_Personal();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Per_Personal
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Per_Personal o)
        {
            return Adapter.Per_Personal_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Per_Personal original = new Per_Personal();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Per_Personal_Comparar : IComparer<Per_Personal>
        {
            private bool _reverse;
            private string _sortColumn;

            public Per_Personal_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Per_Personal> Members

            public int Compare(Per_Personal x, Per_Personal y)
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
                return (retVal*(_reverse ? -1 : 1));
            }

            #endregion
        }

        #endregion
    }
}