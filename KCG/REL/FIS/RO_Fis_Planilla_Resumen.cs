
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
    public class RO_Fis_Planilla_Resumen
    {
        #region Adapter

        private static DO_Fis_Planilla_Resumen _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Fis_Planilla_Resumen Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Fis_Planilla_Resumen();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de Datos

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Resumen> GetById(string sortExpression, Scope s, string Fis_Planilla_Id)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.GetById(s, Fis_Planilla_Id));
            return lista;
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Fis_Planilla_Id)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Fis_Planilla_Id));
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.GetByPresupuesto(s, Apu_Presupuesto_Id));
            foreach (Fis_Planilla_Resumen oFis_Planilla_Resumen in lista)
            {
                Fis_Planilla_Resumen oFis_Planilla_Resumen_Id = Adapter.GetById(s, oFis_Planilla_Resumen.Id)[0];
                oFis_Planilla_Resumen.Valor_Reajuste_Provisional = oFis_Planilla_Resumen_Id.Valor_Reajuste_Provisional;
                oFis_Planilla_Resumen.Valor_Retencion_Provisional = oFis_Planilla_Resumen_Id.Valor_Retencion_Provisional;
                oFis_Planilla_Resumen.Valor_Iva_Provisional = oFis_Planilla_Resumen_Id.Valor_Iva_Provisional;
                oFis_Planilla_Resumen.Valor_A_Pagar_Provisional = oFis_Planilla_Resumen_Id.Valor_A_Pagar_Provisional;

                oFis_Planilla_Resumen.Valor_Reajuste_Definitivo = oFis_Planilla_Resumen_Id.Valor_Reajuste_Definitivo;
                oFis_Planilla_Resumen.Valor_Retencion_Definitivo = oFis_Planilla_Resumen_Id.Valor_Retencion_Definitivo;
                oFis_Planilla_Resumen.Valor_Iva_Definitivo = oFis_Planilla_Resumen_Id.Valor_Iva_Definitivo;
                oFis_Planilla_Resumen.Valor_A_Pagar_Definitivo = oFis_Planilla_Resumen_Id.Valor_A_Pagar_Definitivo;

            }

            return EntidadDT.GetDT(lista);
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Fis_Planilla_Resumen> GetByPresupuesto_(Scope s, string Apu_Presupuesto_Id)
        {
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>(Adapter.GetByPresupuesto(s, Apu_Presupuesto_Id));
            foreach (Fis_Planilla_Resumen oFis_Planilla_Resumen in lista)
            {
                Fis_Planilla_Resumen oFis_Planilla_Resumen_Id = Adapter.GetById(s, oFis_Planilla_Resumen.Id)[0];
                oFis_Planilla_Resumen.Valor_Reajuste_Provisional = oFis_Planilla_Resumen_Id.Valor_Reajuste_Provisional;
                oFis_Planilla_Resumen.Valor_Retencion_Provisional = oFis_Planilla_Resumen_Id.Valor_Retencion_Provisional;
                oFis_Planilla_Resumen.Valor_Iva_Provisional = oFis_Planilla_Resumen_Id.Valor_Iva_Provisional;
                oFis_Planilla_Resumen.Valor_A_Pagar_Provisional = oFis_Planilla_Resumen_Id.Valor_A_Pagar_Provisional;

                oFis_Planilla_Resumen.Valor_Reajuste_Definitivo = oFis_Planilla_Resumen_Id.Valor_Reajuste_Definitivo;
                oFis_Planilla_Resumen.Valor_Retencion_Definitivo = oFis_Planilla_Resumen_Id.Valor_Retencion_Definitivo;
                oFis_Planilla_Resumen.Valor_Iva_Definitivo = oFis_Planilla_Resumen_Id.Valor_Iva_Definitivo;
                oFis_Planilla_Resumen.Valor_A_Pagar_Definitivo = oFis_Planilla_Resumen_Id.Valor_A_Pagar_Definitivo;

            }
            return lista;
        }




        #endregion
    }
}

