
using System.Data;
using System.ComponentModel;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Oferta
    {
        #region Adapter

        private static DO_Apu_Oferta _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Oferta Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Oferta();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]

        public static DataTable GetByCodigo(Scope s, string Id)
        {
           return EntidadDT.GetDT(Adapter.GetByCodigo(s,Id).ToArray());
        }

        #endregion
    }
}