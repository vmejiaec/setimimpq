using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.FIS;
using System.Data;
using BEL;
namespace REL.FIS
{
    public class RO_Fis_Planilla_Multa
    {
        #region Adapter

        private static DO_Fis_Planilla_Multa _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Planilla_Multa Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Planilla_Multa();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByPlanilla(s, Fis_Planilla_Id));
        }

        #endregion
    }
}
