using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using CEL.APU;
using HER;

namespace APR
{
    public class AP_APU_PROYECTO : IAPR
    {
        #region Adapter

        private CEL.APU.DO_Apu_Proyecto _adpApu_Proyecto;
        private DO_Apu_Proyecto adpApu_Proyecto
        {
            get
            {
                if (_adpApu_Proyecto == null)
                    _adpApu_Proyecto = new CEL.APU.DO_Apu_Proyecto();
                return _adpApu_Proyecto;
            }
        }

        #endregion

        #region Operacion de datos

        public bool Adelante(Scope s, object p_Objeto, string p_Proceso)
        {
            SqlTransaction PTransaction;
            bool resultado_ins;
            Apu_Proyecto p_Objeto_ = (Apu_Proyecto)p_Objeto;

            if (p_Objeto_.Estado == "BOR" && p_Proceso == "DIS")
            {
                try
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Proyecto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Proyecto.Adapter.Transaction;
                    resultado_ins = DEL.APU.DO_Apu_Presupuesto.Insert_Proyecto(s, p_Objeto_, PTransaction,"PRO");

                    if (resultado_ins == true)
                    {
                        Apu_Proyecto p_Objeto_Nuevo = new Apu_Proyecto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Proyecto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        adpApu_Proyecto.Adapter.RollbackTransaction();
                    }

                }
                catch (Exception e)
                {
                    adpApu_Proyecto.Adapter.RollbackTransaction();
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

            Apu_Proyecto p_Objeto_ = (Apu_Proyecto)p_Objeto;

            if (p_Objeto_.Estado == "DIS" && p_Objeto_.Apu_Presupuesto_Estado=="DIS" && p_Proceso == "BOR")
            {
                try
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Proyecto.Adapter.BeginTransaction();

                    PTransaction = adpApu_Proyecto.Adapter.Transaction;
                    resultado_del = DEL.APU.DO_Apu_Presupuesto.Delete_Presupuesto(s, p_Objeto_, PTransaction,"PRO");

                    if (resultado_del == true)
                    {
                        Apu_Proyecto p_Objeto_Nuevo = new Apu_Proyecto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Proyecto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        adpApu_Proyecto.Adapter.RollbackTransaction();
                    }
                }
                catch (Exception e)
                {
                    adpApu_Proyecto.Adapter.RollbackTransaction();
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
            Apu_Proyecto v_Objeto_ = (Apu_Proyecto)p_Objeto;
            Apu_Proyecto v_Objeto_Original_ = (Apu_Proyecto)p_Objeto_Original;
            adpApu_Proyecto.Update(s, v_Objeto_, v_Objeto_Original_);
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
            List<Apu_Proyecto> resultado = new List<Apu_Proyecto>(1);
            try
            {
                resultado = adpApu_Proyecto.GetById(s, p_Id);
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