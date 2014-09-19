
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
    /// Tabla: Dic_Contenedor
    /// </summary>
    [DataObject]
    public class BO_Dic_Contenedor
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
        public List<Dic_Contenedor> Get(string sortExpression, Scope s)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_Get(s));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByCodigo(s, Codigo));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetById(string sortExpression, Scope s, string Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetById(s, Id));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByMantenimiento(string sortExpression, Scope s, string int_empresa_Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByMantenimiento(s, int_empresa_Id));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByMantenimiento(Scope s, string int_empresa_Id)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByMantenimiento(s, int_empresa_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByModulo(string sortExpression, Scope s, string Dic_Modulo_Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByModulo(s, Dic_Modulo_Id));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByModulo(Scope s, string Dic_Modulo_Id)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByModulo(s, Dic_Modulo_Id));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByNombre(s, Nombre));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByNombre(s, Nombre));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByLikeNombre(s, Nombre));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByLikeNombre(s, Nombre));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Dic_Contenedor> GetByLikeNombreMenu(string sortExpression, Scope s, string Nombre)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>(Adapter.Dic_Contenedor_GetByLikeNombreMenu(s, Nombre));
            lista.Sort(new Dic_Contenedor_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombreMenu(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Dic_Contenedor_GetByLikeNombreMenu(s, Nombre));
        }
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Dic_Contenedor
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Dic_Contenedor o, Dic_Contenedor original)
        {
            return Adapter.Dic_Contenedor_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Contenedor o = new Dic_Contenedor();
            Dic_Contenedor original = new Dic_Contenedor();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Dic_Contenedor
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Dic_Contenedor o)
        {
            return Adapter.Dic_Contenedor_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Contenedor o = new Dic_Contenedor();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Dic_Contenedor
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Dic_Contenedor o)
        {
            return Adapter.Dic_Contenedor_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Dic_Contenedor original = new Dic_Contenedor();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Dic_Contenedor_Comparar : IComparer<Dic_Contenedor>
        {
            private string _sortColumn;
            private bool _reverse;
            public Dic_Contenedor_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Dic_Contenedor x, Dic_Contenedor y)
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
