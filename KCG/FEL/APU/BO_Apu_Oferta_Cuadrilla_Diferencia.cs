
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
    /// Tabla: Apu_Oferta_Cuadrilla_Diferencia
    /// </summary>
    [DataObject]
    public class BO_Apu_Oferta_Cuadrilla_Diferencia
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
        #region Obtenci�n de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Oferta_Cuadrilla_Diferencia> Get(string sortExpression, Scope s)
        {
            List<Apu_Oferta_Cuadrilla_Diferencia> lista = new List<Apu_Oferta_Cuadrilla_Diferencia>(Adapter.Apu_Oferta_Cuadrilla_Diferencia_Get(s));
            lista.Sort(new Apu_Oferta_Cuadrilla_Diferencia_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Apu_Oferta_Cuadrilla_Diferencia_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Apu_Oferta_Cuadrilla_Diferencia> GetByOferta(string sortExpression, Scope s, string Apu_Oferta_Id)
        {
            List<Apu_Oferta_Cuadrilla_Diferencia> lista = new List<Apu_Oferta_Cuadrilla_Diferencia>(Adapter.Apu_Oferta_Cuadrilla_Diferencia_GetByOferta(s, Apu_Oferta_Id));
            lista.Sort(new Apu_Oferta_Cuadrilla_Diferencia_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return EntidadDT.GetDT(Adapter.Apu_Oferta_Cuadrilla_Diferencia_GetByOferta(s,Apu_Oferta_Id));
        }
        #endregion
     
        #region Ordenar la lista
        class Apu_Oferta_Cuadrilla_Diferencia_Comparar : IComparer<Apu_Oferta_Cuadrilla_Diferencia>
        {
            private string _sortColumn;
            private bool _reverse;
            public Apu_Oferta_Cuadrilla_Diferencia_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Apu_Oferta_Cuadrilla_Diferencia x, Apu_Oferta_Cuadrilla_Diferencia y)
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
