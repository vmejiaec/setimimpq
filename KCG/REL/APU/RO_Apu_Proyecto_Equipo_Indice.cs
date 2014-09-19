using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Equipo_Indice
    {
        # region Adapter

        private static DO_Apu_Proyecto_Equipo_Indice _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto_Equipo_Indice Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Equipo_Indice();
                return _Adapter;
            }
        }

        #endregion

        # region Obtener datos para el reporte

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByProyecto(s, Apu_Proyecto_Id));
        }

        #endregion 
    }
}
