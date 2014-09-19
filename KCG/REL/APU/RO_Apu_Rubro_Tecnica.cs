
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Rubro_Tecnica
    {
        # region Adapter
        private static DO_Apu_Rubro_Tecnica _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public static DO_Apu_Rubro_Tecnica Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Rubro_Tecnica();
                return _Adapter;
            }
        }

        #endregion

        # region Obtener datos para el reporte
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByRubro(s, Apu_Rubro_Id, par_servidor_Id));
        }
        
        #endregion
    }
}
