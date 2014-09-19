using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.FIS;
using BEL;
using System.Data;

namespace REL.FIS
{
    [DataObject]
    public class RO_Fis_Catalogo_Indice
    {
        #region Adapter

        private static DO_Fis_Catalogo_Indice _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Catalogo_Indice Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Catalogo_Indice();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByCatalogo(Scope s, string Fis_Catalogo_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByCatalogoReporte(s, Fis_Catalogo_Id));
        }
        #endregion
    }
}
