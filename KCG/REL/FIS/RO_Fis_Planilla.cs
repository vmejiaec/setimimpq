
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
    public class RO_Fis_Planilla
    {
        #region Adapter

        private static DO_Fis_Planilla _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Planilla Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Planilla();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> GetById(string sortExpression, Scope s, string Id)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.GetById(s, Id));
            return lista;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla> GetByPresupuesto(string sortExpression, Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Planilla> lista = new List<Fis_Planilla>(Adapter.GetByPresupuesto(s, Apu_Presupuesto_Id));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByPresupuesto(s, Apu_Presupuesto_Id));
        }


        #endregion
    }
}
