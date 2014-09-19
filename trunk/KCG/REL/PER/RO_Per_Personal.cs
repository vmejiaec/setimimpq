using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.PER;
using System.Data;
using BEL;

namespace REL.PER
{
    [DataObject]
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
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByEmpresa(Scope s)
        {
            return EntidadDT.GetDT(Adapter.GetByEmpresa(s));
        }

        #endregion
    }
}
