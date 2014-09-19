using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using HER;

namespace DEL.APU
{
    public class DO_Apu_Presupuesto_Formula
    {
        #region Adapters

        private static CEL.APU.DO_Apu_Presupuesto_Formula _adpApu_Presupuesto_Formula;
        private static CEL.APU.DO_Apu_Presupuesto_Formula adpApu_Presupuesto_Formula
        {
            get
            {
                if (_adpApu_Presupuesto_Formula == null)
                    _adpApu_Presupuesto_Formula = new CEL.APU.DO_Apu_Presupuesto_Formula();
                return _adpApu_Presupuesto_Formula;
            }
        }

        private static CEL.APU.DO_Apu_Presupuesto_Cuadrilla _adpApu_Presupuesto_Cuadrilla;
        private static CEL.APU.DO_Apu_Presupuesto_Cuadrilla adpApu_Presupuesto_Cuadrilla
        {
            get
            {
                if (_adpApu_Presupuesto_Cuadrilla == null)
                    _adpApu_Presupuesto_Cuadrilla = new CEL.APU.DO_Apu_Presupuesto_Cuadrilla();
                return _adpApu_Presupuesto_Cuadrilla;
            }
        }

        #endregion

        #region Operaciones
        public static Boolean Obtener_Publicacion(Scope s, string Apu_Presupuesto_Id,string Estado )
        {
            
            try
            {
                SqlTransaction PTransaccion;
                adpApu_Presupuesto_Formula.Adapter.BeginTransaction();
                PTransaccion = adpApu_Presupuesto_Formula.Adapter.Transaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaccion;

                List<Apu_Presupuesto_Formula> lstPresupuesto_Formula = adpApu_Presupuesto_Formula.GetByPresupuesto( s, Apu_Presupuesto_Id, Estado);
                List<Apu_Presupuesto_Cuadrilla> lstPresupuesto_Cuadrilla = adpApu_Presupuesto_Cuadrilla.GetByPresupuesto( s, Apu_Presupuesto_Id, Estado);

                if (lstPresupuesto_Cuadrilla.Count > 0)
                    adpApu_Presupuesto_Cuadrilla.Update(s, lstPresupuesto_Cuadrilla[0], lstPresupuesto_Cuadrilla[0]);

                if (lstPresupuesto_Formula.Count > 0)
                    adpApu_Presupuesto_Formula.Update(s, lstPresupuesto_Formula[0], lstPresupuesto_Formula[0]);
                
                adpApu_Presupuesto_Formula.Adapter.CommitTransaction();
                return true;
            }
            catch (Exception ex)
            {
                adpApu_Presupuesto_Formula.Adapter.RollbackTransaction();
                throw (ex);
            }
        }
        #endregion

    }
}
