
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
    /// Tabla: Fis_Catalogo_Categoria
    /// </summary>
    [DataObject]
    public class BO_Fis_Catalogo_Categoria
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
        public List<Fis_Catalogo_Categoria> Get(string sortExpression, Scope s)
        {
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>(Adapter.Fis_Catalogo_Categoria_Get(s));
            lista.Sort(new Fis_Catalogo_Categoria_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_Categoria_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo_Categoria> GetByCatalogo(string sortExpression, Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>(Adapter.Fis_Catalogo_Categoria_GetByCatalogo(s,Fis_Catalogo_Id,Apu_Categoria_Codigo_Desde,Apu_Categoria_Codigo_Hasta,Apu_Categoria_Nombre,Valor_Desde,Valor_Hasta));
            lista.Sort(new Fis_Catalogo_Categoria_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_Categoria_GetByCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Valor_Desde, Valor_Hasta));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo_Categoria> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>(Adapter.Fis_Catalogo_Categoria_GetByCodigo(s, Codigo));
            lista.Sort(new Fis_Catalogo_Categoria_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_Categoria_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo_Categoria> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>(Adapter.Fis_Catalogo_Categoria_GetById(s, Id));
            lista.Sort(new Fis_Catalogo_Categoria_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_Categoria_GetById(s, Id));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return Adapter.Fis_Catalogo_Categoria_TotalPaginas(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Valor_Desde, Valor_Hasta );
        }
        #endregion
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Catalogo_Categoria o, Fis_Catalogo_Categoria original)
        {
            return Adapter.Fis_Catalogo_Categoria_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo_Categoria o = new Fis_Catalogo_Categoria();
            Fis_Catalogo_Categoria original = new Fis_Catalogo_Categoria();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Fis_Catalogo_Categoria o)
        {
            return Adapter.Fis_Catalogo_Categoria_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo_Categoria o = new Fis_Catalogo_Categoria();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Fis_Catalogo_Categoria o)
        {
            return Adapter.Fis_Catalogo_Categoria_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo_Categoria original = new Fis_Catalogo_Categoria();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Fis_Catalogo_Categoria_Comparar : IComparer<Fis_Catalogo_Categoria>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Catalogo_Categoria_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Catalogo_Categoria x, Fis_Catalogo_Categoria y)
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
