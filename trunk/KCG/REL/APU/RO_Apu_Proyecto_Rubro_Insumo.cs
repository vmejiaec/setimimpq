using System.ComponentModel;
using System.Data;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Rubro_Insumo
    {
        #region Adapters

        private static DO_Apu_Proyecto_Rubro_Insumo _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto_Rubro_Insumo Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Rubro_Insumo();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByProyecto(Scope s, string Apu_proyecto_codigo)
        {
            return EntidadDT.GetDT(Adapter.GetByProyecto(s, Apu_proyecto_codigo).ToArray());
        }

        #endregion
    }
}