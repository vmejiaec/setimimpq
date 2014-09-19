using System;
using System.Collections.Generic;
using AEL.APU;
using BEL;
using System.Data.SqlClient;

namespace DEL.APU
{
    public class DO_Apu_Proyecto_Rubro_Material
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Material _adpApu_Material;
        private static CEL.APU.DO_Apu_Material adpApu_Material
        {
            get
            {
                if(_adpApu_Material == null)
                    _adpApu_Material = 
                        new CEL.APU.DO_Apu_Material();
                return _adpApu_Material;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Material _adpApu_Proyecto_Material;
        private static CEL.APU.DO_Apu_Proyecto_Material adpApu_Proyecto_Material
        {
            get
            {
                if(_adpApu_Proyecto_Material==null)
                    _adpApu_Proyecto_Material = 
                        new CEL.APU.DO_Apu_Proyecto_Material();
                return _adpApu_Proyecto_Material;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Material _adpApu_Proyecto_Rubro_Material;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Material adpApu_Proyecto_Rubro_Material
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Material == null)
                    _adpApu_Proyecto_Rubro_Material =
                        new CEL.APU.DO_Apu_Proyecto_Rubro_Material();
                return _adpApu_Proyecto_Rubro_Material;
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

        #endregion

        #region Operaciones
        /// <summary>
        /// Inserta el material en el rubro y en el proyecto, si fuera el caso
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Material"></param>
        /// <returns></returns>
        public static string Insert(Scope s, Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material)
        {

            string resultado;
            try
            {


              //  adpApu_Proyecto_Rubro_Material.Adapter.BeginTransaction();
              //  adpApu_Proyecto_Material.Adapter.Transaction = adpApu_Proyecto_Rubro_Material.Adapter.Transaction;
                // Averigua si debe añadir el material al proyecto
                List<Apu_Material> listApu_Material = adpApu_Material.
                    GetByProyectoRubroMaterial(
                        s,
                        oApu_Proyecto_Rubro_Material.Apu_Proyecto_Rubro_Id,
                        oApu_Proyecto_Rubro_Material.Apu_Material_Id);
                if (listApu_Material.Count == 1)
                {
                    Apu_Proyecto_Material oApu_Proyecto_Material =
                        new Apu_Proyecto_Material();
                    oApu_Proyecto_Material.Apu_Material_Id =
                        listApu_Material[0].Id;
                    oApu_Proyecto_Material.Apu_Proyecto_Id =
                        oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id;
                    oApu_Proyecto_Material.Costo_Parcial =
                        listApu_Material[0].Costo_Parcial;
                    oApu_Proyecto_Material.Costo_Otros =
                        listApu_Material[0].Costo_Otros;
                    oApu_Proyecto_Material.Costo_Transporte =
                        listApu_Material[0].Costo_Transporte;
                    adpApu_Proyecto_Material.
                        Insert(s, oApu_Proyecto_Material);
                }
                // Inserta el material en el rubro del proyecto

                resultado = adpApu_Proyecto_Rubro_Material.
                    Insert(s, oApu_Proyecto_Rubro_Material);
                //adpApu_Proyecto_Rubro_Material.Adapter.CommitTransaction();

                // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);


            }catch(Exception e)
            {
                //adpApu_Proyecto_Rubro_Material.Adapter.RollbackTransaction();
                throw (e);
            }
            
            return resultado;
        }

        public static string Insert_Transaccion(Scope s, Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material, SqlTransaction PTransaction)
        {

            string resultado;
            try
            {


                adpApu_Proyecto_Rubro_Material.Adapter.Transaction = PTransaction;
                adpApu_Proyecto_Material.Adapter.Transaction = PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;
                adpApu_Material.Adapter.Transaction = PTransaction;


                // Averigua si debe añadir el material al proyecto
                List<Apu_Material> listApu_Material = adpApu_Material.
                    GetByProyectoRubroMaterial(
                        s,
                        oApu_Proyecto_Rubro_Material.Apu_Proyecto_Rubro_Id,
                        oApu_Proyecto_Rubro_Material.Apu_Material_Id);
                if (listApu_Material.Count == 1)
                {
                    Apu_Proyecto_Material oApu_Proyecto_Material =
                        new Apu_Proyecto_Material();
                    oApu_Proyecto_Material.Apu_Material_Id =
                        listApu_Material[0].Id;
                    oApu_Proyecto_Material.Apu_Proyecto_Id =
                        oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id;
                    oApu_Proyecto_Material.Costo_Parcial =
                        listApu_Material[0].Costo_Parcial;
                    oApu_Proyecto_Material.Costo_Otros =
                        listApu_Material[0].Costo_Otros;
                    oApu_Proyecto_Material.Costo_Transporte =
                        listApu_Material[0].Costo_Transporte;
                    adpApu_Proyecto_Material.
                        Insert(s, oApu_Proyecto_Material);
                }
                // Inserta el material en el rubro del proyecto

                resultado = adpApu_Proyecto_Rubro_Material.
                    Insert(s, oApu_Proyecto_Rubro_Material);
                //adpApu_Proyecto_Rubro_Material.Adapter.CommitTransaction();

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id)[0];
                //Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                //adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);


            }
            catch (Exception e)
            {
                //adpApu_Proyecto_Rubro_Material.Adapter.RollbackTransaction();
                throw (e);
            }

            return resultado;
        }

        public static int Update(Scope s, Apu_Proyecto_Rubro_Material o, Apu_Proyecto_Rubro_Material original)
        {
            int resultado = 0;
            try
            {

                adpApu_Proyecto_Rubro_Material.Adapter.BeginTransaction();
                adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro_Material.Adapter.Transaction;

                //Actualizacion de Costos en Apu_Proyecto
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, o.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                resultado = adpApu_Proyecto_Rubro_Material.Update(s, o, original);

                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                adpApu_Proyecto_Rubro_Material.Adapter.CommitTransaction();

            }
            catch (Exception e)
            {
                adpApu_Proyecto_Rubro_Material.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;

        }


        /// <summary>
        /// Borra el material del rubro y del proyecto, si fuera el caso
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Material"></param>
        /// <returns></returns>
        public static int Delete(Scope s, Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material)
        {
            // Borra el material del rubro del proyecto
            int resultado;
            try
            {
                //adpApu_Proyecto_Rubro_Material.Adapter.BeginTransaction();
                //adpApu_Proyecto_Material.Adapter.Transaction = adpApu_Proyecto_Rubro_Material.Adapter.Transaction;

            resultado = adpApu_Proyecto_Rubro_Material.
                Delete(s, oApu_Proyecto_Rubro_Material);
            int existeMaterial = adpApu_Proyecto_Rubro_Material.
                ExisteMaterial(s,
                               oApu_Proyecto_Rubro_Material.Apu_Material_Id,
                               oApu_Proyecto_Rubro_Material.Apu_Proyecto_Rubro_Id);
            if(existeMaterial==0)
            {
                
                List<Apu_Proyecto_Material> listApu_Proyecto_Material =
                    adpApu_Proyecto_Material.GetByProyectoMaterial
                             (s, 
                              oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id,
                              oApu_Proyecto_Rubro_Material.Apu_Material_Id);
                if (listApu_Proyecto_Material.Count == 1)
                    adpApu_Proyecto_Material.
                        Delete(s, listApu_Proyecto_Material[0]);
            }
            //adpApu_Proyecto_Rubro_Material.Adapter.CommitTransaction();

            // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
            Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id)[0];
            Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
            adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);
        }
        catch (Exception e)
        {
            //adpApu_Proyecto_Rubro_Material.Adapter.RollbackTransaction();
            throw (e);
        }
            return resultado;
        }

        public static int Delete_Transaccion(Scope s, Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material,SqlTransaction PTransaction)
        {
            // Borra el material del rubro del proyecto
            int resultado;
            try
            {
                adpApu_Proyecto_Rubro_Material.Adapter.Transaction = PTransaction;
                adpApu_Proyecto_Material.Adapter.Transaction = PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;


                resultado = adpApu_Proyecto_Rubro_Material.
                    Delete(s, oApu_Proyecto_Rubro_Material);
                int existeMaterial = adpApu_Proyecto_Rubro_Material.
                    ExisteMaterial(s,
                                   oApu_Proyecto_Rubro_Material.Apu_Material_Id,
                                   oApu_Proyecto_Rubro_Material.Apu_Proyecto_Rubro_Id);
                if (existeMaterial == 0)
                {

                    List<Apu_Proyecto_Material> listApu_Proyecto_Material =
                        adpApu_Proyecto_Material.GetByProyectoMaterial
                                 (s,
                                  oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id,
                                  oApu_Proyecto_Rubro_Material.Apu_Material_Id);
                    if (listApu_Proyecto_Material.Count == 1)
                        adpApu_Proyecto_Material.
                            Delete(s, listApu_Proyecto_Material[0]);
                }

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id)[0];
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
