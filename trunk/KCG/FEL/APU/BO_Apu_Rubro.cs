
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.APU
{
    /// <summary>
    /// Acceso a los Web Services WS_APU
    /// Modulo: Apu target
    /// Tabla: Apu_Rubro
    /// </summary>
    [DataObject]
    public class BO_Apu_Rubro
    {
        #region  Adapter
        private WS_APU _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_APU Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_APU();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> Get(string sortExpression, Scope s)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_Get(s));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByCodigo(s, Codigo));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByEmpresa(string sortExpression, Scope s, string Int_Empresa_Id)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByEmpresa(s, s.Int_Empresa_Id));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByEmpresa(s, s.Int_Empresa_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetById(string sortExpression, Scope s, string Id)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetById(s, Id));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByLikeNombre(string sortExpression, Scope s, string Nombre, string Int_Sucursal_Id)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByLikeNombre(s, Nombre));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string Nombre)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByLikeNombre(s, Nombre));
        }
        
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByLikeCodigo(string sortExpression, Scope s, string Codigo, string int_sucursal_Id)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByLikeCodigo(s, Codigo, s.Int_Sucursal_Id));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigo(Scope s, string Codigo, string int_sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByLikeCodigo(s, Codigo, s.Int_Sucursal_Id));
        } 

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByNombre(string sortExpression, Scope s, string Nombre, string int_sucursal_Id)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByNombre(s, Nombre, s.Int_Sucursal_Id));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByNombre(s, Nombre, s.Int_Sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetBySucursal(string sortExpression, Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde,
                                             string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde,
                                             string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde,
                                                                                        Apu_Subtitulo_Codigo_Hasta, Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde,
                                                                                        Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde,
                                       string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde,
                                       string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde,
                                                                   Apu_Subtitulo_Codigo_Hasta, Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde,
                                                                   Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByLikeCodigoDesde(string sortExpression, Scope s, string desde_Codigo)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByLikeCodigoDesde(s, desde_Codigo));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByLikeCodigoDesde(s, desde_Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByLikeCodigoDesdeHasta(string sortExpression, Scope s, string desde_Codigo, string hasta_Codigo)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro> GetByLikeCodigoHasta(string sortExpression, Scope s, string hasta_Codigo)
        {
            List<Apu_Rubro> lista = new List<Apu_Rubro>(Adapter.Apu_Rubro_GetByLikeCodigoHasta(s, hasta_Codigo));
            lista.Sort(new Apu_Rubro_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_GetByLikeCodigoHasta(s, hasta_Codigo));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde, 
                                string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde, 
                                string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            return Adapter.Apu_Rubro_TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde, 
                                                  Apu_Subtitulo_Codigo_Hasta, Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde, 
                                                  Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre);
        }
        #endregion
        #endregion
        #region Operacion entre datos
        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Rubro o, Apu_Rubro original)
        {
            o.Fecha_Update = DateTime.Now;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            return Adapter.Apu_Rubro_Update(s, o, original);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro o = new Apu_Rubro();
            Apu_Rubro original = new Apu_Rubro();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }
        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Rubro o)
        {
            o.Int_Sucursal_Id = s.Int_Sucursal_Id;
            o.Int_Moneda_Id = s.Int_Moneda_Id;
            o.Fecha_Creacion = DateTime.Now;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Update = DateTime.Now;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            return Adapter.Apu_Rubro_Insert(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro o = new Apu_Rubro();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }
        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Rubro o)
        {
            return Adapter.Apu_Rubro_Delete(s, o);
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Rubro original = new Apu_Rubro();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }
        #endregion
        #region Ordenar la lista
        class Apu_Rubro_Comparar : IComparer<Apu_Rubro>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Rubro_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Rubro x, Apu_Rubro y)
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