using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using AEL.FIS;
using BEL;
using CEL.APU;
using CEL.FIS;
using HER;


namespace APR
{
    public class AP_APU_PRESUPUESTO : IAPR
    {

        #region Adapter

        private CEL.APU.DO_Apu_Presupuesto _adpApu_Presupuesto;
        private DO_Apu_Presupuesto adpApu_Presupuesto
        {
            get
            {
                if (_adpApu_Presupuesto == null)
                    _adpApu_Presupuesto = new CEL.APU.DO_Apu_Presupuesto();
                return _adpApu_Presupuesto;
            }
        }

        private CEL.FIS.DO_Fis_Planilla _adpFis_Planilla;
        private DO_Fis_Planilla adpFis_Planilla
        {
            get
            {
                if (_adpFis_Planilla == null)
                    _adpFis_Planilla = new CEL.FIS.DO_Fis_Planilla();
                return _adpFis_Planilla;
            }
        }

        private CEL.FIS.DO_Fis_Ampliacion _adpFis_Ampliacion;
        private DO_Fis_Ampliacion adpFis_Ampliacion
        {
            get
            {
                if (_adpFis_Ampliacion == null)
                    _adpFis_Ampliacion = new CEL.FIS.DO_Fis_Ampliacion();
                return _adpFis_Ampliacion;
            }
        }

   

        #endregion
        #region Operacion de datos

        public bool Adelante(Scope s, object p_Objeto, string p_Proceso)
        {
            SqlTransaction PTransaction;
            Apu_Presupuesto p_Objeto_ = (Apu_Presupuesto)p_Objeto;
            bool resultado_ins ;

            try
            {
                if (p_Objeto_.Estado == "DIS" && p_Proceso == "EJE")
                {
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Jefe_Fiscalizacion == "S")
                    {
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Jefe Fiscalización");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }


                if (p_Objeto_.Estado == "EJE" && p_Proceso == "PEN")
                {
                    //Si estado DIS se puede cambiar a EJE directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Per_Personal_Id == p_Objeto_.Fiscalizador_Per_Personal_Id)
                    {

                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Fiscalizador");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }


                if (p_Objeto_.Estado == "PEN" && p_Proceso == "REA")
                {
                    //Si estado DIS se puede cambiar a EJE directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Per_Personal_Id == p_Objeto_.Fiscalizador_Per_Personal_Id)
                    {
                        resultado_ins = DEL.APU.DO_Apu_Presupuesto.Actualiza_Presupuesto(s, p_Objeto_, PTransaction, "PRE");
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Fiscalizador");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }
                }

                if (p_Objeto_.Estado == "REA" && p_Proceso == "LIQ")
                {
                    //Si estado DIS se puede cambiar a EJE directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Jefe_Fiscalizacion == "S")
                    {
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Jefe Fiscalización");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }

            }
            catch (Exception e)
            {
                adpApu_Presupuesto.Adapter.RollbackTransaction();
                if (e.Message.StartsWith("MSJ"))
                {
                    throw (e);
                }
                else
                { Error.EmitirExcepcion(TXT_Mensajes._MSJ14, e.Message); }
            }

            return true;
        }




        // Ir al estado anterior
        public bool Atras(Scope s, object p_Objeto, string p_Proceso)
        {
            SqlTransaction PTransaction;
            Apu_Presupuesto p_Objeto_ = (Apu_Presupuesto)p_Objeto;
            bool resultado_del;
            try
            {
                if (p_Objeto_.Estado == "LIQ" && p_Proceso == "REA")
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Jefe_Fiscalizacion == "S")
                    {
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();

                    }
                    else
                    {
                        Exception eCaso = new Exception("Jefe Fiscalización");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }

                if (p_Objeto_.Estado == "REA" && p_Proceso == "PEN")
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Per_Personal_Id == p_Objeto_.Fiscalizador_Per_Personal_Id)
                    {
                        resultado_del = DEL.APU.DO_Apu_Presupuesto.Delete_Presupuesto_Reajuste(s, p_Objeto_, PTransaction, "PRE");

                        if (resultado_del )
                        {
                            Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                            p_Objeto_Nuevo.Estado = p_Proceso;
                            p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                            Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                            adpApu_Presupuesto.Adapter.CommitTransaction();
                        }
                        else
                        {
                            Exception eCaso = new Exception(" ");
                            throw new Exception(TXT_Mensajes._MSJ14, eCaso);
                        }
                    }
                    else
                    {
                        Exception eCaso = new Exception("Fiscalizador");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }


                }

                if (p_Objeto_.Estado == "PEN" && p_Proceso == "EJE")
                {
                    //Si estado BOR se puede cambiar a DIS directamente
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (s.Per_Personal_Id==p_Objeto_.Fiscalizador_Per_Personal_Id)
                    {
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Fiscalizador");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }

                if (p_Objeto_.Estado == "EJE" && p_Proceso == "DIS")
                {
                    adpApu_Presupuesto.Adapter.BeginTransaction();
                    PTransaction = adpApu_Presupuesto.Adapter.Transaction;
                    if (Registros_Relacionados(s, p_Objeto_) == true && s.Per_Personal_Id== p_Objeto_.Fiscalizador_Per_Personal_Id )
                    {
                        Apu_Presupuesto p_Objeto_Nuevo = new Apu_Presupuesto(p_Objeto_);
                        p_Objeto_Nuevo.Estado = p_Proceso;
                        p_Objeto_Nuevo.Fecha_Update = DateTime.Now;
                        Actualizar(s, p_Objeto_, p_Objeto_Nuevo);
                        adpApu_Presupuesto.Adapter.CommitTransaction();
                    }
                    else
                    {
                        Exception eCaso = new Exception("Fiscalizador");
                        throw new Exception(TXT_Mensajes._MSJ112, eCaso);
                    }

                }
            }
            catch (Exception e)
            {
                adpApu_Presupuesto.Adapter.RollbackTransaction();
                if (e.Message.StartsWith("MSJ"))
                {
                    throw (e);
                }
                else
                { Error.EmitirExcepcion(TXT_Mensajes._MSJ14, e.Message); }
            }

            return true;
        }

        public bool Actualizar(Scope s, object p_Objeto_Original, object p_Objeto)
        {
            Apu_Presupuesto v_Objeto_ = (Apu_Presupuesto)p_Objeto;
            Apu_Presupuesto v_Objeto_Original_ = (Apu_Presupuesto)p_Objeto_Original;
            adpApu_Presupuesto.Update(s, v_Objeto_, v_Objeto_Original_);
            return true;
        }

        public bool Permiso(Scope s, object p_Objeto, string p_Proceso)
        {
            throw new NotImplementedException();
        }

        private bool Registros_Relacionados(Scope s,Apu_Presupuesto oApu_Presupuesto )
        {
            bool resultado=true;
            try
            {
                List<Fis_Planilla> lstFis_Planilla = adpFis_Planilla.GetByPresupuesto(s,oApu_Presupuesto.Id);
                List<Fis_Ampliacion> lstFis_Ampliacion = adpFis_Ampliacion.GetByPresuesto(s,oApu_Presupuesto.Id);
                if (lstFis_Planilla.Count > 0 || lstFis_Ampliacion.Count > 0)
                {
                    Exception eCaso = new Exception("");
                    throw new Exception(TXT_Mensajes._MSJ111, eCaso);
                }
            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;
        }

           #endregion

        #region Obtener datos

        public object GetById(Scope s, string p_Id)
        {
            List<Apu_Presupuesto> resultado = new List<Apu_Presupuesto>(1);
            try
            {
                resultado = adpApu_Presupuesto.GetById(s, p_Id,"%");
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
