
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.DIC
{
    /// <summary>
    /// Acceso a los Web Services WS_DIC
    /// Modulo: Diccionario
    /// Tabla: Dic_Campo
    /// </summary>
    [DataObject]
    public class BO_Dic_Campo
    {
        #region  Adapter
        private WS_DIC _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_DIC Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_DIC();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> Get(string sortExpression, Scope s)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_Get(s));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_GetByCodigo(s, Codigo));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> GetById(string sortExpression, Scope s, string Id)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_GetById(s, Id));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> GetByObjeto(string sortExpression, Scope s, string Dic_Objeto_Id)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_GetByObjeto(s, Dic_Objeto_Id));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByObjeto(Scope s, string Dic_Objeto_Id)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_GetByObjeto(s, Dic_Objeto_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> GetByLikeNombre(string sortExpression, Scope s, string Dic_Objeto_Id, string Nombre)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_GetByLikeNombre(s, Dic_Objeto_Id, Nombre));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_GetByLikeNombre(s, Dic_Objeto_Id, Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Campo> GetByLikeObjeto(string sortExpression, Scope s, string Dic_Objeto_Id, string Nombre)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>(Adapter.Dic_Campo_GetByLikeObjeto(s, Dic_Objeto_Id, Nombre));
            lista.Sort(new Dic_Campo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeObjeto(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Dic_Campo_GetByLikeObjeto(s, Dic_Objeto_Id, Nombre));
        }
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Dic_Campo
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Dic_Campo o, Dic_Campo original)
        {
            return Adapter.Dic_Campo_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Campo o = new Dic_Campo();
            Dic_Campo original = new Dic_Campo();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Dic_Campo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Dic_Campo o)
        {
            return Adapter.Dic_Campo_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Campo o = new Dic_Campo();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Dic_Campo
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Dic_Campo o)
        {
            return Adapter.Dic_Campo_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Campo original = new Dic_Campo();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Dic_Campo_Comparar : IComparer<Dic_Campo>
        {
            private string _sortColumn;
            private bool _reverse;
            public Dic_Campo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Dic_Campo x, Dic_Campo y)
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
