using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.FIS;
using System.Data;
using BEL;
using AEL.FIS;

namespace REL.FIS
{
    [DataObject]
    public class RO_Fis_Ampliacion
    {
        #region Adapter

        private static DO_Fis_Ampliacion _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Ampliacion Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Ampliacion();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos
     

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByPresuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByPresuesto(s, Apu_Presupuesto_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Ampliacion> GetByPresuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>(Adapter.GetByPresuesto(s, Apu_Presupuesto_Id));
            return lista;
        }

        #endregion
    }
}
