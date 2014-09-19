using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CEL.FIS;
using System.Data;
using BEL;
using AEL.FIS;

namespace REL.FIS
{
    [DataObject]
    public class RO_Fis_Fiscalizacion
    {
        #region Adapter

        private static DO_Fis_Fiscalizacion _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Fiscalizacion Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Fiscalizacion();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            s.Pagina_Actual = 1;
            s.Numero_Registros = 10000;
            return EntidadDT.GetDT(Adapter.GetBySucursal (s, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, Nombre_Proyecto, Estado, Contratista, Fiscalizador));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id));
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Fiscalizacion> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>(Adapter.GetById(s, Id));
            return lista;
        }

        #endregion
    }
}
