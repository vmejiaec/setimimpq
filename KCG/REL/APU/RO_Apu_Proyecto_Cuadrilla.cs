using System.ComponentModel;
using System.Data;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Cuadrilla
    {
        #region Adapter

        private static DO_Apu_Proyecto_Cuadrilla _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto_Cuadrilla Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Cuadrilla();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.Get(s, Apu_Proyecto_Id));
        }
    }

    #endregion
}