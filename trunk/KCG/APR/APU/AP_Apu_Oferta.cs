using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using CEL.APU;
using HER;

namespace APR
{
    public class AP_APU_OFERTA : IAPR
    {
        #region Adapter

        private CEL.APU.DO_Apu_Oferta _adpApu_Oferta;
        private DO_Apu_Oferta adpApu_Oferta
        {
            get
            {
                if (_adpApu_Oferta == null)
                    _adpApu_Oferta = new CEL.APU.DO_Apu_Oferta();
                return _adpApu_Oferta;
            }
        }

        #endregion

        #region Operacion de datos

        public bool Adelante(Scope s, object p_Objeto, string p_Proceso)
        {
            SqlTransaction PTransaction;
            bool resultado_ins;
            Apu_Oferta p_Objeto_ = (Apu_Oferta)p_Objeto;

            if (p_Objeto_.Estado == "BOR" && p_Proceso == "DIS")
            {
                try
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Oferta.Adapter.BeginTransaction();
                    PTransaction = adpApu_Oferta.Adapter.Transaction;
                    resultado_ins = DEL.APU.DO_Apu_Presupuesto.Insert_Oferta(s, p_Objeto_, PTransaction, "OFE");

                    if (resultado_ins == true)
                    {
                        Apu_Oferta p_Objeto_Nuevo = new Apu_Oferta(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Oferta.Adapter.CommitTransaction();
                    }
                    else
                    {
                        adpApu_Oferta.Adapter.RollbackTransaction();
                    }

                }
                catch (Exception e)
                {
                    adpApu_Oferta.Adapter.RollbackTransaction();
                    if (e.Message.StartsWith("MSJ"))
                    {
                        throw (e);
                    }
                    else
                    { Error.EmitirExcepcion(TXT_Mensajes._MSJ14, e.Message); }
                }
            }
            return true;
        }

        // Ir al estado anterior
        public bool Atras(Scope s, object p_Objeto, string p_Proceso)
        {
            SqlTransaction PTransaction;
            bool resultado_del;

            Apu_Oferta p_Objeto_ = (Apu_Oferta)p_Objeto;

            if (p_Objeto_.Estado == "DIS" && p_Objeto_.Apu_Presupuesto_Estado=="DIS"  && p_Proceso == "BOR")
            {
                try
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Oferta.Adapter.BeginTransaction();

                    PTransaction = adpApu_Oferta.Adapter.Transaction;
                    resultado_del = DEL.APU.DO_Apu_Presupuesto.Delete_Presupuesto(s, p_Objeto_, PTransaction,"OFE");

                    if (resultado_del == true)
                    {
                        Apu_Oferta p_Objeto_Nuevo = new Apu_Oferta(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Oferta.Adapter.CommitTransaction();
                    }
                    else
                    {
                        adpApu_Oferta.Adapter.RollbackTransaction();
                    }
                }
                catch (Exception e)
                {
                    adpApu_Oferta.Adapter.RollbackTransaction();
                    if (e.Message.StartsWith("MSJ"))
                    {
                        throw (e);
                    }
                    else
                    { Error.EmitirExcepcion(TXT_Mensajes._MSJ14, e.Message); }
                }
            }
            return true;
        }

        public bool Actualizar(Scope s, object p_Objeto_Original, object p_Objeto)
        {
            Apu_Oferta v_Objeto_ = (Apu_Oferta)p_Objeto;
            Apu_Oferta v_Objeto_Original_ = (Apu_Oferta)p_Objeto_Original;
            adpApu_Oferta.Update(s, v_Objeto_, v_Objeto_Original_);
            return true;
        }

        public bool Permiso(Scope s, object p_Objeto, string p_Proceso)
        {
            throw new NotImplementedException();
        }





        #endregion

        #region Obtener datos

        public object GetById(Scope s, string p_Id)
        {
            List<Apu_Oferta> resultado = new List<Apu_Oferta>(1);
            try
            {
                resultado = adpApu_Oferta.GetById(s, p_Id);
            }
            catch
            {
                Error.EmitirExcepcion(TXT_Mensajes._MSJ47, p_Id);
            }

            if (resultado.Count == 0)
                Error.EmitirExcepcion(TXT_Mensajes._MSJ47, p_Id);

            return resultado[0];
        }

        #endregion
    }
}