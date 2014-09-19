
using System.Data;
using System.ComponentModel;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto
    {
        #region Adapter

        private static DO_Apu_Proyecto _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Apu_Proyecto Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]

        public static DataTable GetByCodigo(Scope s, string Codigo)
        {
           return EntidadDT.GetDT(Adapter.GetByCodigo(s,Codigo));
        }

  
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id));
        }

        #endregion
    }
}