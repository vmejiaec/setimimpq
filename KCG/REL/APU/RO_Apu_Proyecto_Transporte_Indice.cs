using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Transporte_Indice
    {
        # region Adapter

        private static DO_Apu_Proyecto_Transporte_Indice _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto_Transporte_Indice Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Transporte_Indice();
                return _Adapter;
            }
        }

        #endregion

        # region Obtener datos para el reporte

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByProyecto(s, apu_proyecto_Id));
        }

        #endregion
    }
}
