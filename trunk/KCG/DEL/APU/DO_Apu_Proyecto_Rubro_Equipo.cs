using System;
using System.Collections.Generic;
using AEL.APU;
using BEL;
using System.Data.SqlClient;

namespace DEL.APU
{
    public class DO_Apu_Proyecto_Rubro_Equipo
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Equipo _adpApu_Equipo;
        private static CEL.APU.DO_Apu_Equipo adpApu_Equipo
        {
            get
            {
                if (_adpApu_Equipo == null)
                    _adpApu_Equipo =
                        new CEL.APU.DO_Apu_Equipo();
                return _adpApu_Equipo;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Equipo _adpApu_Proyecto_Equipo;
        private static CEL.APU.DO_Apu_Proyecto_Equipo adpApu_Proyecto_Equipo
        {
            get
            {
                if (_adpApu_Proyecto_Equipo == null)
                    _adpApu_Proyecto_Equipo =
                        new CEL.APU.DO_Apu_Proyecto_Equipo();
                return _adpApu_Proyecto_Equipo;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo _adpApu_Proyecto_Rubro_Equipo;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo adpApu_Proyecto_Rubro_Equipo
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Equipo == null )
                    _adpApu_Proyecto_Rubro_Equipo =
                        new CEL.APU.DO_Apu_Proyecto_Rubro_Equipo();
                return _adpApu_Proyecto_Rubro_Equipo;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto _adpApu_Proyecto;

        public static CEL.APU.DO_Apu_Proyecto adpApu_Proyecto
        {
            get
            {
                if (_adpApu_Proyecto == null)
                    _adpApu_Proyecto = new CEL.APU.DO_Apu_Proyecto();
                return _adpApu_Proyecto;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Equipo_Indice _adpApu_Proyecto_Equipo_Indice;
        public static CEL.APU.DO_Apu_Proyecto_Equipo_Indice adpApu_Proyecto_Equipo_Indice
        {
            get
            {
                if (_adpApu_Proyecto_Equipo_Indice == null)
                    _adpApu_Proyecto_Equipo_Indice = new CEL.APU.DO_Apu_Proyecto_Equipo_Indice();
                return _adpApu_Proyecto_Equipo_Indice;
            }
        }


        #endregion

        #region Operaciones 
        /// <summary>
        /// Insertar Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Equipo"></param>
        /// <returns></returns>
        public static string Insert(Scope s, Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo)
        {
            string resultado;
            try
            {
                //adpApu_Proyecto_Rubro_Equipo.Adapter.BeginTransaction();
                //adpApu_Proyecto_Equipo.Adapter.Transaction = adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction;

                // Consulta si debe añadir el equipo al proyecto
                List<Apu_Equipo> listApu_Equipo =
                    adpApu_Equipo.GetByProyectoRubroEquipo(
                        s,
                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Rubro_Id,
                        oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id);
                // Inserta el equipo al proyecto
                if (listApu_Equipo.Count == 1)
                {
                    Apu_Proyecto_Equipo oApu_Proyecto_Equipo =
                        new Apu_Proyecto_Equipo();
                    oApu_Proyecto_Equipo.Apu_Equipo_Id =
                        listApu_Equipo[0].Id;
                    oApu_Proyecto_Equipo.Apu_Proyecto_Id =
                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id;
                    oApu_Proyecto_Equipo.Costo_Combustible =
                        listApu_Equipo[0].Costo_Combustible;
                    oApu_Proyecto_Equipo.Costo_Repuesto =
                        listApu_Equipo[0].Costo_Repuesto;
                    oApu_Proyecto_Equipo.Costo_Alquiler =
                        listApu_Equipo[0].Costo_Alquiler;
                    oApu_Proyecto_Equipo.Costo_Otros =
                        listApu_Equipo[0].Costo_Otros;
                    adpApu_Proyecto_Equipo.
                        Insert(s, oApu_Proyecto_Equipo);
                }
                // Inserta el equipo en el rubro del proyecto

                resultado = adpApu_Proyecto_Rubro_Equipo.
                                Insert(s, oApu_Proyecto_Rubro_Equipo);
                //adpApu_Proyecto_Rubro_Equipo.Adapter.CommitTransaction(); 

                // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);


            }catch(Exception e)
            {
                //adpApu_Proyecto_Rubro_Equipo.Adapter.RollbackTransaction();
                throw (e);
            }


           
            return resultado;
        }

        public static string Insert_Transaccion(Scope s, Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo, SqlTransaction PTransaction)
        {
            string resultado;
            try
            {

                adpApu_Proyecto_Equipo.Adapter.Transaction=PTransaction;
                adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction=PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;
                adpApu_Equipo.Adapter.Transaction = PTransaction;

                // Consulta si debe añadir el equipo al proyecto
                List<Apu_Equipo> listApu_Equipo =
                    adpApu_Equipo.GetByProyectoRubroEquipo(
                        s,
                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Rubro_Id,
                        oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id);
                // Inserta el equipo al proyecto
                if (listApu_Equipo.Count == 1)
                {
                    Apu_Proyecto_Equipo oApu_Proyecto_Equipo =
                        new Apu_Proyecto_Equipo();
                    oApu_Proyecto_Equipo.Apu_Equipo_Id =
                        listApu_Equipo[0].Id;
                    oApu_Proyecto_Equipo.Apu_Proyecto_Id =
                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id;
                    oApu_Proyecto_Equipo.Costo_Combustible =
                        listApu_Equipo[0].Costo_Combustible;
                    oApu_Proyecto_Equipo.Costo_Repuesto =
                        listApu_Equipo[0].Costo_Repuesto;
                    oApu_Proyecto_Equipo.Costo_Alquiler =
                        listApu_Equipo[0].Costo_Alquiler;
                    oApu_Proyecto_Equipo.Costo_Otros =
                        listApu_Equipo[0].Costo_Otros;
                    adpApu_Proyecto_Equipo.
                        Insert(s, oApu_Proyecto_Equipo);
                }
                // Inserta el equipo en el rubro del proyecto

                resultado = adpApu_Proyecto_Rubro_Equipo.
                                Insert(s, oApu_Proyecto_Rubro_Equipo);

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id)[0];
                //Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                //adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);


            }
            catch (Exception e)
            {
                throw (e);
            }

            return resultado;
        }

        /// <summary>
        /// Borrado de Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Equipo"></param>
        /// <returns></returns>
        /// 
        public static int Update(Scope s, Apu_Proyecto_Rubro_Equipo o, Apu_Proyecto_Rubro_Equipo original)
        {
            int resultado = 0;
            try
            {

                adpApu_Proyecto_Rubro_Equipo.Adapter.BeginTransaction();
                adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction;

                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, o.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);

                resultado = adpApu_Proyecto_Rubro_Equipo.Update(s, o, original);

                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                adpApu_Proyecto_Rubro_Equipo.Adapter.CommitTransaction();

            }
            catch (Exception e)
            {
                adpApu_Proyecto_Rubro_Equipo.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;

        }

        public static int Delete(Scope s, Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo)
        {
            // Borra el equipo del rubro
            int resultado;
            try
            {
                //adpApu_Proyecto_Rubro_Equipo.Adapter.BeginTransaction();
                //adpApu_Proyecto_Equipo.Adapter.Transaction = adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction;
                int existeEquipo_Indice;
                resultado = adpApu_Proyecto_Rubro_Equipo.
                    Delete(s, oApu_Proyecto_Rubro_Equipo);
                // Consulta si existe el equipo 
                int existeEquipo = adpApu_Proyecto_Rubro_Equipo.
                    ExisteEquipo(s,
                                 oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id,
                                 oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Rubro_Id);
                if (existeEquipo == 0)
                {

                 

                    List<Apu_Proyecto_Equipo> listApu_Proyecto_Equipo =
                        adpApu_Proyecto_Equipo.
                            GetByProyectoEquipo(s,
                                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id,
                                        oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id);
                    if (listApu_Proyecto_Equipo.Count == 1)
                    {
                        List<Apu_Proyecto_Equipo_Indice> listApu_Proyecto_Equipo_Indice = adpApu_Proyecto_Equipo_Indice.GetByProyectoEquipo(s, listApu_Proyecto_Equipo[0].Id);
                        foreach (Apu_Proyecto_Equipo_Indice oApu_Proyecto_Equipo_Indice in listApu_Proyecto_Equipo_Indice)
                        {
                            adpApu_Proyecto_Equipo_Indice.Delete(s, oApu_Proyecto_Equipo_Indice);
                        }

                        adpApu_Proyecto_Equipo.Delete(s, listApu_Proyecto_Equipo[0]);
                    }
                }
                //adpApu_Proyecto_Rubro_Equipo.Adapter.CommitTransaction();

                // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);
            }
            catch (Exception e)
            {
                //adpApu_Proyecto_Rubro_Equipo.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }

        public static int Delete_Transaccion(Scope s, Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo,SqlTransaction PTransaccion)
        {
            // Borra el equipo del rubro
            int resultado;
            try
            {
                adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction=PTransaccion;
                adpApu_Proyecto_Equipo.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Equipo_Indice.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto.Adapter.Transaction = PTransaccion;
                
                int existeEquipo_Indice;
                resultado = adpApu_Proyecto_Rubro_Equipo.
                    Delete(s, oApu_Proyecto_Rubro_Equipo);
                // Consulta si existe el equipo 
                int existeEquipo = adpApu_Proyecto_Rubro_Equipo.
                    ExisteEquipo(s,
                                 oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id,
                                 oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Rubro_Id);
                if (existeEquipo == 0)
                {

                    List<Apu_Proyecto_Equipo> listApu_Proyecto_Equipo =
                        adpApu_Proyecto_Equipo.
                            GetByProyectoEquipo(s,
                                        oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id,
                                        oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id);
                    if (listApu_Proyecto_Equipo.Count == 1)
                    {
                        List<Apu_Proyecto_Equipo_Indice> listApu_Proyecto_Equipo_Indice = adpApu_Proyecto_Equipo_Indice.GetByProyectoEquipo(s, listApu_Proyecto_Equipo[0].Id);
                        foreach (Apu_Proyecto_Equipo_Indice oApu_Proyecto_Equipo_Indice in listApu_Proyecto_Equipo_Indice)
                        {
                            adpApu_Proyecto_Equipo_Indice.Delete(s, oApu_Proyecto_Equipo_Indice);
                        }

                        adpApu_Proyecto_Equipo.Delete(s, listApu_Proyecto_Equipo[0]);
                    }
                }

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id)[0];
                //Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                //adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);
            }
            catch (Exception e)
            {
                throw (e);
            }
            return resultado;
        }
        #endregion
    }
}
