
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
    public class RO_Apu_Rubro_Equipo
    {
        #region  Adapter
        private static DO_Apu_Rubro_Equipo _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public static DO_Apu_Rubro_Equipo Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Rubro_Equipo();
                return _Adapter;
            }
        }

        #endregion

        # region Obtener datos para Reportes
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByRubro(Scope s, string Apu_Rubro_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByRubro(s, Apu_Rubro_Id));
        }

        #endregion
    }
}