


using System.Data;
using System.ComponentModel;
using BEL;
using CEL.APU;
using System.Collections.Generic;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Oferta_Cuadrilla_Diferencia
    {
        #region Adapter

        private static DO_Apu_Oferta_Cuadrilla_Diferencia _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Oferta_Cuadrilla_Diferencia Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Oferta_Cuadrilla_Diferencia();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]

        public DataTable GetByOferta(Scope s,string apu_oferta_id)
        {
            return EntidadDT.GetDT(Adapter.GetByOferta(s, apu_oferta_id));
        }

        #endregion

    }
}
