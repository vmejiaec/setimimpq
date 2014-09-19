using System.Data;
using BEL;
using CEL.PER;

namespace REL.APU
{
    public class RO_Per_Personal
    {
        #region Adapter

        private static DO_Per_Personal _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Per_Personal Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Per_Personal();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        public static DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id).ToArray());
        }

        public static DataTable GetByJefeCostos(Scope s)
        {
            return EntidadDT.GetDT(Adapter.GetByJefeCostos(s).ToArray());
        }

        #endregion
    }
}