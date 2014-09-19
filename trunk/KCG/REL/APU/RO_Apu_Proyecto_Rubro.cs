using System.Collections.Generic;
using System.Data;
using System.ComponentModel;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Proyecto_Rubro
    {
        #region Adapter

        private DO_Apu_Proyecto_Rubro _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public DO_Apu_Proyecto_Rubro Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Proyecto_Rubro();
                return _Adapter;
            }
        }
       
        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
         public DataTable GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByProyecto(s, Apu_Proyecto_Id).ToArray());
        }

       
        #endregion
    }
}