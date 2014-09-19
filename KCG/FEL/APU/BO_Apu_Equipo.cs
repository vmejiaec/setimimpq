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
    /// Tabla: Apu_Equipo
    /// </summary>
    [DataObject]
    public class BO_Apu_Equipo
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
        public List<Apu_Equipo> Get(string sortExpression, Scope s)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_Get(s));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByCodigo(string sortExpression, Scope s, string Codigo)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByCodigo(s, Codigo));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByCodigo(Scope s, string Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByCodigo(s, Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetById(string sortExpression, Scope s, string Id)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetById(s, Id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByLikeNombre(string sortExpression, Scope s, string nombre, string int_sucursal_Id)
        {
            List<Apu_Equipo> lista =
                new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByLikeNombre(s, nombre, int_sucursal_Id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByLikeNombre(s, nombre, int_sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByNombre(string sortExpression, Scope s, string nombre, string int_sucursal_Id)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByNombre(s, nombre, int_sucursal_Id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByNombre(s, nombre, int_sucursal_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByProyectoRubroEquipo(string sortExpression, Scope s, string Apu_Proyecto_Rubro_id,
                                                         string Apu_Equipo_Id)
        {
            List<Apu_Equipo> lista =
                new List<Apu_Equipo>(
                    Adapter.Apu_Equipo_GetByProyectoRubroEquipo(s, Apu_Proyecto_Rubro_id, Apu_Equipo_Id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByProyectoRubroEquipo(Scope s, string Apu_Proyecto_Rubro_id, string Apu_Equipo_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByProyectoRubroEquipo(s, Apu_Proyecto_Rubro_id, Apu_Equipo_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetBySucursal(string sortExpression, Scope s, string Int_Sucursal_id)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetBySucursal(s, Int_Sucursal_id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s, string Int_Sucursal_id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetBySucursal(s, Int_Sucursal_id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByOfertaRubroEquipo(string sortExpression, string Apu_Oferta_Rubro_id, Scope s, string Apu_Equipo_Id)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByOfertaRubroEquipo(s, Apu_Oferta_Rubro_id, Apu_Equipo_Id));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOfertaRubroEquipo(Scope s, string Apu_Oferta_Rubro_id, string Apu_Equipo_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByOfertaRubroEquipo(s, Apu_Oferta_Rubro_id, Apu_Equipo_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByLikeCodigoDesde(string sortExpression, Scope s, string desde_Codigo)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByLikeCodigoDesde(s, desde_Codigo));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByLikeCodigoDesde(s, desde_Codigo));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByLikeCodigoDesdeHasta(string sortExpression, Scope s, string desde_Codigo, string hasta_Codigo)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByLikeCodigoDesdeHasta(s, desde_Codigo,hasta_Codigo));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Equipo> GetByLkeCodigoHasta(string sortExpression, Scope s, string hasta_Codigo)
        {
            List<Apu_Equipo> lista = new List<Apu_Equipo>(Adapter.Apu_Equipo_GetByLkeCodigoHasta(s, hasta_Codigo));
            lista.Sort(new Apu_Equipo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLkeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return EntidadDT.GetDT(Adapter.Apu_Equipo_GetByLkeCodigoHasta(s, hasta_Codigo));
        }
        #endregion

        #region Operacion entre datos

        // Actualiza
        /// <summary>
        /// Actualiza la tabla Apu_Equipo
        /// </summary>
        /// <param name="o">Objeto que contiene la informacion a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Apu_Equipo o, Apu_Equipo original)
        {
            o.Fecha_Update = DateTime.Now;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            if (!string.IsNullOrEmpty(o.Nombre))
                o.Nombre = o.Nombre.ToUpper();
            return Adapter.Apu_Equipo_Update(s, o, original);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Equipo o = new Apu_Equipo();
            Apu_Equipo original = new Apu_Equipo();
            Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
            return Update(s, o, original);
        }

        // Inserta
        /// <summary>
        /// Inserta el objeto en Apu_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, Apu_Equipo o)
        {
            o.Int_Sucursal_Id = s.Int_Sucursal_Id;
            o.Int_Moneda_Id = s.Int_Moneda_Id;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Update = DateTime.Now;
            o.Fecha_Creacion = DateTime.Now;
            if (!string.IsNullOrEmpty(o.Nombre))
                o.Nombre = o.Nombre.ToUpper();
            return Adapter.Apu_Equipo_Insert(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public string Insert(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Equipo o = new Apu_Equipo();
            Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
            return Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto en  Apu_Equipo
        /// </summary>
        /// <param name="o">Objeto a borrar</param>
        /// <returns></returns>
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Apu_Equipo o)
        {
            return Adapter.Apu_Equipo_Delete(s, o);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, List<DictionaryEntry> parametros)
        {
            Apu_Equipo original = new Apu_Equipo();
            Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
            return Delete(s, original);
        }

        #endregion

        #region Ordenar la lista

        private class Apu_Equipo_Comparar : IComparer<Apu_Equipo>
        {
            private bool _reverse;
            private string _sortColumn;

            public Apu_Equipo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }

            #region IComparer<Apu_Equipo> Members

            public int Compare(Apu_Equipo x, Apu_Equipo y)
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