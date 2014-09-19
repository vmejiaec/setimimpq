
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
using System;
namespace FEL.FIS
{
    /// <summary>
    /// Acceso a los Web Services WS_FIS
    /// Modulo: Fiscalizaci
    /// Tabla: Fis_Catalogo
    /// </summary>
    [DataObject]
    public class BO_Fis_Catalogo
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
        public List<Fis_Catalogo> Get(string sortExpression, Scope s)
        {
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>(Adapter.Fis_Catalogo_Get(s));
            lista.Sort(new Fis_Catalogo_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>(Adapter.Fis_Catalogo_GetByCodigo(s, Codigo));
            lista.Sort(new Fis_Catalogo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo> GetByEmpresa(string sortExpression, Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
        {
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>(Adapter.Fis_Catalogo_GetByEmpresa(s,Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Fecha_Publicacion_Desde,Fecha_Publicacion_Hasta, Nombre));
            lista.Sort(new Fis_Catalogo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_GetByEmpresa(s, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Fecha_Publicacion_Desde, Fecha_Publicacion_Hasta, Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>(Adapter.Fis_Catalogo_GetById(s, Id));
            lista.Sort(new Fis_Catalogo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Catalogo> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
        {
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>(Adapter.Fis_Catalogo_GetByLikeNombre(s, Nombre));
            lista.Sort(new Fis_Catalogo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Fis_Catalogo_GetByLikeNombre(s, Nombre));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
        {
            return Adapter.Fis_Catalogo_TotalPaginas(s, Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Fecha_Publicacion_Desde,Fecha_Publicacion_Hasta,Nombre);
        }
        #endregion
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Fis_Catalogo
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Fis_Catalogo o, Fis_Catalogo original)
        {
            return Adapter.Fis_Catalogo_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo o = new Fis_Catalogo();
            Fis_Catalogo original = new Fis_Catalogo();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Fis_Catalogo o)
        {
            return Adapter.Fis_Catalogo_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo o = new Fis_Catalogo();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Fis_Catalogo
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Fis_Catalogo o)
        {
            return Adapter.Fis_Catalogo_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Fis_Catalogo original = new Fis_Catalogo();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Fis_Catalogo_Comparar : IComparer<Fis_Catalogo>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Catalogo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Catalogo x, Fis_Catalogo y)
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
