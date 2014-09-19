using System.ComponentModel;
using System.Data;
using System.Collections.Generic;
using System.Text;
using BEL;
using CEL.APU;


namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Presupuesto_Cuadrilla
    {
        #region Adapter

        private static DO_Apu_Presupuesto_Cuadrilla _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Presupuesto_Cuadrilla Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Presupuesto_Cuadrilla();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos
        
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Get(s));
        }
        
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id,string Estado)
        {
            return EntidadDT.GetDT(Adapter.GetByPresupuesto(s, Apu_Presupuesto_Id,Estado));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPlanilla(Scope s, string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
        {
            return EntidadDT.GetDT(Adapter.GetByPlanilla(s, Apu_Presupuesto_Id, Fis_Planilla_Id, Estado));
        }

        #endregion
    }
}
