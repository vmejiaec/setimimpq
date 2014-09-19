
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
    /// Tabla: Fis_Planilla_Resumen
    /// </summary>
    [DataObject]
    public class BO_Fis_Planilla_Resumen
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
        public List<Fis_Planilla_Resumen> Get(string sortExpression, Scope s)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.Fis_Planilla_Resumen_Get(s));
            lista.Sort(new Fis_Planilla_Resumen_Comparar(sortExpression));
            return lista;
        }
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Resumen_Get(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Resumen> GetById(string sortExpression, Scope s, string Fis_Planilla_Id)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.Fis_Planilla_Resumen_GetById(s, Fis_Planilla_Id));
            lista.Sort(new Fis_Planilla_Resumen_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Fis_Planilla_Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Resumen_GetById(s, Fis_Planilla_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Resumen> GetByPresupuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.Fis_Planilla_Resumen_GetByPresupuesto(s, Apu_Presupuesto_Id));
            lista.Sort(new Fis_Planilla_Resumen_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return EntidadDT.GetDT(Adapter.Fis_Planilla_Resumen_GetByPresupuesto(s, Apu_Presupuesto_Id));
        }


      
        #endregion

        #region Ordenar la lista
        class Fis_Planilla_Resumen_Comparar : IComparer<Fis_Planilla_Resumen>
        {
            private string _sortColumn;
            private bool _reverse;
            public Fis_Planilla_Resumen_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Fis_Planilla_Resumen x, Fis_Planilla_Resumen y)
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
