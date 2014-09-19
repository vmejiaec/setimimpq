using System;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using HER;
using System.Collections.Generic;

namespace DEL.APU
{
    public class DO_Apu_Rubro
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Rubro _adpApu_Rubro;
        private static CEL.APU.DO_Apu_Rubro adpApu_Rubro
        {
            get
            {
                if (_adpApu_Rubro == null)
                    _adpApu_Rubro = new CEL.APU.DO_Apu_Rubro();
                return _adpApu_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Rubro_Tecnica _adpApu_Rubro_Tecnica;
        private static CEL.APU.DO_Apu_Rubro_Tecnica adpApu_Rubro_Tecnica
        {
            get
            {
                if (_adpApu_Rubro_Tecnica == null)
                    _adpApu_Rubro_Tecnica = new CEL.APU.DO_Apu_Rubro_Tecnica();
                return _adpApu_Rubro_Tecnica;
            }
        }
        #endregion
        #region Operaciones
        public static  string Insert(Scope s, Apu_Rubro oApu_Rubro)
        {
            // Graba los datos
            string resultado;
            try
            {
                //adpApu_Rubro.Adapter.BeginTransaction();
                //adpApu_Rubro_Tecnica.Adapter.Transaction = adpApu_Rubro.Adapter.Transaction;


                // Inserta Apu_Rubro
                resultado = adpApu_Rubro.Insert(s, oApu_Rubro);
                // Inserta Apu_Rubro_Tecnica
                Apu_Rubro_Tecnica oApu_Rubro_Tecnica = new Apu_Rubro_Tecnica();
                oApu_Rubro_Tecnica.Apu_Rubro_Id = oApu_Rubro.Id;
                adpApu_Rubro_Tecnica.Insert(s, oApu_Rubro_Tecnica);

                //adpApu_Rubro.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                //adpApu_Rubro.Adapter.RollbackTransaction();
                throw (e);
            }
            // Retorna el id de la tabla principal
            return resultado;
        }
        #endregion
    }
}