
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using HER;
namespace FEL.INT
{
    /// <summary>
    /// Acceso a los Web Services WS_INT
    /// Modulo: Interface 
    /// Tabla: Int_Subproyecto
    /// </summary>
    [DataObject]
    public class BO_Int_Subproyecto
    {
        #region  Adapter
        private WS_INT _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_INT Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_INT();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Int_Subproyecto> Get(string sortExpression, Scope s)
        {
            List<Int_Subproyecto> lista = new List<Int_Subproyecto>(Adapter.Int_Subproyecto_Get(s));
            lista.Sort(new Int_Subproyecto_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Int_Subproyecto_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Int_Subproyecto> GetByLikeCodigoInstitucional(string sortExpression, Scope s, string Codigo_Institucional)
        {
            List<Int_Subproyecto> lista = new List<Int_Subproyecto>(Adapter.Int_Subproyecto_GetByLikeCodigoInstitucional(s, Codigo_Institucional));
            lista.Sort(new Int_Subproyecto_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByLikeCodigoInstitucional(Scope s, string Codigo_Institucional)
        {
            return EntidadDT.GetDT(Adapter.Int_Subproyecto_GetByLikeCodigoInstitucional(s, Codigo_Institucional));
        }
        #endregion
        #region Ordenar la lista
        class Int_Subproyecto_Comparar : IComparer<Int_Subproyecto>
        {
            private string _sortColumn;
            private bool _reverse;
            public Int_Subproyecto_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Int_Subproyecto x, Int_Subproyecto y)
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
