using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.FIS;
using System.Data;
using BEL;

namespace REL.FIS
{
    [DataObject]
    public class RO_Fis_Catalogo
    {
        #region Adapter

        private static DO_Fis_Catalogo _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Catalogo Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Catalogo();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id));
        }
        #endregion
    }
}
