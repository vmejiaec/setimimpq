
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
    /// Tabla: Apu_Rubro_Insumo
    /// </summary>
    [DataObject]
    public class BO_Apu_Rubro_Insumo
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
        public List<Apu_Rubro_Insumo> Get(string sortExpression, Scope s)
        {
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>(Adapter.Apu_Rubro_Insumo_Get(s));
            lista.Sort(new Apu_Rubro_Insumo_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Insumo_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Insumo> GetByRubro(string sortExpression, Scope s, string apu_rubro_id)
        {
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>(Adapter.Apu_Rubro_Insumo_GetByRubro(s, apu_rubro_id));
            lista.Sort(new Apu_Rubro_Insumo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByRubro(Scope s, string apu_rubro_id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Insumo_GetByRubro(s, apu_rubro_id));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Rubro_Insumo> GetBySucursal(string sortExpression, Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre,
                                                    string Apu_Insumo_Nombre, string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            List<Apu_Rubro_Insumo> lista = new List<Apu_Rubro_Insumo>(Adapter.Apu_Rubro_Insumo_GetBySucursal(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre,
                                                                                                             Apu_Insumo_Nombre, Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre));
            lista.Sort(new Apu_Rubro_Insumo_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre,
                                       string Apu_Insumo_Nombre, string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            return EntidadDT.GetDT(Adapter.Apu_Rubro_Insumo_GetBySucursal(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre,
                                                                          Apu_Insumo_Nombre, Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre));
        }

        #region Procedimiento Select  UNI  denominado TotalPaginas
        public int TotalPaginas(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre, 
                                string Apu_Insumo_Nombre, string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            return Adapter.Apu_Rubro_Insumo_TotalPaginas(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre, 
                                                         Apu_Insumo_Nombre, Tipo, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);
        }
        #endregion
        #endregion
        #region Ordenar la lista
        class Apu_Rubro_Insumo_Comparar : IComparer<Apu_Rubro_Insumo>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Rubro_Insumo_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Rubro_Insumo x, Apu_Rubro_Insumo y)
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
