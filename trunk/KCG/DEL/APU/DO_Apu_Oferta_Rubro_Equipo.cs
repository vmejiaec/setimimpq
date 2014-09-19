using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using AEL.APU;
using BEL;

namespace DEL.APU
{
    public class DO_Apu_Oferta_Rubro_Equipo
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Oferta_Rubro_Equipo _doApuOfertaRubroEquipo;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Equipo DoApuOfertaRubroEquipo
        {
            get
            {
                if (_doApuOfertaRubroEquipo == null)
                    _doApuOfertaRubroEquipo = new CEL.APU.DO_Apu_Oferta_Rubro_Equipo();
                return _doApuOfertaRubroEquipo;
            }
        }

        private static CEL.APU.DO_Apu_Equipo _doApuEquipo;
        private static CEL.APU.DO_Apu_Equipo DoApuEquipo
        {
            get
            {
                if (_doApuEquipo == null)
                    _doApuEquipo = new CEL.APU.DO_Apu_Equipo();
                return _doApuEquipo;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Equipo _doApuOfertaEquipo;
        private static CEL.APU.DO_Apu_Oferta_Equipo DoApuOfertaEquipo
        {
            get
            {
                if (_doApuOfertaEquipo == null)
                    _doApuOfertaEquipo = new CEL.APU.DO_Apu_Oferta_Equipo();
                return _doApuOfertaEquipo;
            }
        }

        #endregion

        #region Operaciones
        public static string Insert (Scope s, Apu_Oferta_Rubro_Equipo oApuOfertaRubroEquipo)
        {
            string strIdApuOfertaRubroId;
            try
            {
                //DoApuOfertaRubroEquipo.Adapter.BeginTransaction();
                //DoApuOfertaEquipo.Adapter.Transaction = DoApuOfertaRubroEquipo.Adapter.Transaction;

                strIdApuOfertaRubroId = DoApuOfertaRubroEquipo.Insert(s, oApuOfertaRubroEquipo);
                List<Apu_Equipo> lstApuEquipo =
                DoApuEquipo.GetByOfertaRubroEquipo(s, oApuOfertaRubroEquipo.Apu_Oferta_Rubro_Id,
                                                   oApuOfertaRubroEquipo.Apu_Equipo_Id);
                if (lstApuEquipo.Count == 1)
                {
                Apu_Oferta_Equipo oApuOfertaEquipo = new Apu_Oferta_Equipo();
                oApuOfertaEquipo.Apu_Equipo_Id = lstApuEquipo[0].Id;
                oApuOfertaEquipo.Apu_Oferta_Id = oApuOfertaRubroEquipo.Apu_Oferta_Id;
                DoApuOfertaEquipo.Insert(s, oApuOfertaEquipo);
                }
                //DoApuOfertaRubroEquipo.Adapter.CommitTransaction();
            }catch(Exception e)
            {
                //DoApuOfertaRubroEquipo.Adapter.RollbackTransaction();
                throw (e);
            }

            return strIdApuOfertaRubroId;
        }

        public static int Delete (Scope s, Apu_Oferta_Rubro_Equipo oApuOfertaRubroEquipo)
        {
            int intRespuestaDelete;
            try
            {
                //DoApuOfertaRubroEquipo.Adapter.BeginTransaction();
                //DoApuOfertaEquipo.Adapter.Transaction = DoApuOfertaRubroEquipo.Adapter.Transaction;
               
            intRespuestaDelete = DoApuOfertaRubroEquipo.Delete(s, oApuOfertaRubroEquipo);
            if( intRespuestaDelete == 1 )
            {
                int intExisteEquipo =
                    DoApuOfertaRubroEquipo.ExisteEquipo(s, oApuOfertaRubroEquipo.Apu_Equipo_Id,
                                                        oApuOfertaRubroEquipo.Apu_Oferta_Rubro_Id);
                if( intExisteEquipo == 0 )
                {
                    //Ely
                    List<Apu_Oferta_Equipo> lstApuOfertaEquipo = 
                        DoApuOfertaEquipo.GetByOfertaEquipo(s,oApuOfertaRubroEquipo.Apu_Oferta_Id, oApuOfertaRubroEquipo.Apu_Equipo_Id);
                    if( lstApuOfertaEquipo.Count == 1)
                    {
                        Apu_Oferta_Equipo oApuOfertaEquipo = new Apu_Oferta_Equipo();
                        oApuOfertaEquipo.Id = lstApuOfertaEquipo[0].Id;
                        oApuOfertaEquipo.Codigo = lstApuOfertaEquipo[0].Codigo;
                        oApuOfertaEquipo.Apu_Oferta_Id = lstApuOfertaEquipo[0].Apu_Oferta_Id;
                        oApuOfertaEquipo.Apu_Equipo_Id = lstApuOfertaEquipo[0].Apu_Equipo_Id;
                        oApuOfertaEquipo.Estado = lstApuOfertaEquipo[0].Estado;
                        DoApuOfertaEquipo.Delete(s, oApuOfertaEquipo);
                    }
                }
            }
            //DoApuOfertaRubroEquipo.Adapter.CommitTransaction();
            }catch(Exception e)
            {
                //DoApuOfertaRubroEquipo.Adapter.RollbackTransaction();
                throw (e); 
            }

            
            return intRespuestaDelete;
        }
        #endregion
    }
}
