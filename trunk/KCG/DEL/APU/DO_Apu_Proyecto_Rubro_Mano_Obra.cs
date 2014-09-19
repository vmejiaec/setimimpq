
using System;
using System.Collections.Generic;
using AEL.APU;
using BEL;
using System.Data.SqlClient;

namespace DEL.APU
{
    public class DO_Apu_Proyecto_Rubro_Mano_Obra
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Mano_Obra _adpApu_Mano_Obra;
        private static CEL.APU.DO_Apu_Mano_Obra adpApu_Mano_Obra
        {
            get
            {
                if (_adpApu_Mano_Obra == null)
                    _adpApu_Mano_Obra =
                        new CEL.APU.DO_Apu_Mano_Obra();
                return _adpApu_Mano_Obra;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Mano_Obra _adpApu_Proyecto_Mano_Obra;
        private static CEL.APU.DO_Apu_Proyecto_Mano_Obra adpApu_Proyecto_Mano_Obra
        {
            get
            {
                if (_adpApu_Proyecto_Mano_Obra == null)
                    _adpApu_Proyecto_Mano_Obra =
                        new CEL.APU.DO_Apu_Proyecto_Mano_Obra();
                return _adpApu_Proyecto_Mano_Obra;
            }
        }
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra _adpApu_Proyecto_Rubro_Mano_Obra;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra adpApu_Proyecto_Rubro_Mano_Obra
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Mano_Obra == null)
                    _adpApu_Proyecto_Rubro_Mano_Obra =
                        new CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra();
                return _adpApu_Proyecto_Rubro_Mano_Obra;
            }
        }
        private static CEL.APU.DO_Apu_Parametros _adpApu_Parametros;
        private static CEL.APU.DO_Apu_Parametros adpApu_Parametros
        {
            get
            {
                if (_adpApu_Parametros == null)
                    _adpApu_Parametros = new CEL.APU.DO_Apu_Parametros();
                return _adpApu_Parametros;
            }
        }

        private static CEL.APU.DO_Apu_Categoria _adpApu_Categoria;
        private static CEL.APU.DO_Apu_Categoria adpApu_Categoria
        {
            get
            {
                if (_adpApu_Categoria == null)
                    _adpApu_Categoria = new CEL.APU.DO_Apu_Categoria();
                return _adpApu_Categoria;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Categoria _adpApu_Proyecto_Categoria;
        private static CEL.APU.DO_Apu_Proyecto_Categoria adpApu_Proyecto_Categoria
        {
            get
            {
                if (_adpApu_Proyecto_Categoria == null)
                    _adpApu_Proyecto_Categoria = new CEL.APU.DO_Apu_Proyecto_Categoria();
                return _adpApu_Proyecto_Categoria;
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
        /// Inserta la mano de obra en el rubro de un proyecto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Mano_Obra"></param>
        /// <returns></returns>
        public static string Insert(Scope s, Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra)
        {
            string resultado;
            try
            {
                //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.BeginTransaction();
                //adpApu_Proyecto_Mano_Obra.Adapter.Transaction = adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction;
                // Consulta si debe añadir la mano de obra al proyecto
            List<Apu_Mano_Obra> listApu_Mano_Obra =
                adpApu_Mano_Obra.GetByProyectoRubroMano_Obra(
                    s,
                    oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Rubro_Id,
                    oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id);

            // Inserta la mano de obra al proyecto
            if (listApu_Mano_Obra.Count == 1)
            {
                // Consultar en parámetros el índice de mano de obra
                List<Apu_Parametros> listaApu_Parametros =
                    adpApu_Parametros.GetBySucursal(
                        s);
                // Inserta la mano de obra
                Apu_Proyecto_Mano_Obra oApu_Proyecto_Mano_Obra =
                    new Apu_Proyecto_Mano_Obra();
                oApu_Proyecto_Mano_Obra.Apu_Indice_Id =
                    listaApu_Parametros[0].ManoObra_Apu_Indice_Id; 
                oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id =
                    listApu_Mano_Obra[0].Id;
                oApu_Proyecto_Mano_Obra.Apu_Proyecto_Id =
                    oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id;
                oApu_Proyecto_Mano_Obra.Apu_Categoria_Id =
                    listApu_Mano_Obra[0].Apu_Categoria_Id;

                oApu_Proyecto_Mano_Obra.Costo_Diario =
                    listApu_Mano_Obra[0].Costo_Diario;
                adpApu_Proyecto_Mano_Obra.
                    Insert(s, oApu_Proyecto_Mano_Obra);
            }
            // Inserta la mano de obra en el rubro del proyecto
            
            resultado = adpApu_Proyecto_Rubro_Mano_Obra.
                Insert(s, oApu_Proyecto_Rubro_Mano_Obra);

            //Inserta en Apu_Proyecto_Categoria

            if (listApu_Mano_Obra.Count == 1)
            {
                if (listApu_Mano_Obra[0].Apu_Categoria_Id != null)
                {
                    List<Apu_Proyecto_Categoria> listaApu_Proyecto_Categoria = adpApu_Proyecto_Categoria.GetByProyectoCategoria(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id, listApu_Mano_Obra[0].Apu_Categoria_Id);
                    if (listaApu_Proyecto_Categoria.Count == 0)
                    {
                        Apu_Categoria oApu_Categoria = adpApu_Categoria.GetById(s, listApu_Mano_Obra[0].Apu_Categoria_Id, s.Int_Sucursal_Id)[0];
                        Apu_Proyecto_Categoria oApu_Proyecto_Categoria = new Apu_Proyecto_Categoria();
                        oApu_Proyecto_Categoria.Apu_Proyecto_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id;
                        oApu_Proyecto_Categoria.Apu_Categoria_Id = listApu_Mano_Obra[0].Apu_Categoria_Id;
                        oApu_Proyecto_Categoria.Costo_Diario = oApu_Categoria.Costo_Diario;
                        adpApu_Proyecto_Categoria.Insert(s, oApu_Proyecto_Categoria);

                    }

                }
            }

            // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
            Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id)[0];
            Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
            adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);



            //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.CommitTransaction();
        }
        catch (Exception e)
        {
            //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.RollbackTransaction();
            throw (e);
        }
             return resultado;
        }

        public static string Insert_Transaccion(Scope s, Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra, SqlTransaction PTransaction)
        {
            string resultado;
            try
            {
                adpApu_Proyecto_Mano_Obra.Adapter.Transaction=PTransaction;
                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction=PTransaction;
                adpApu_Proyecto_Categoria.Adapter.Transaction=PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;
                adpApu_Mano_Obra.Adapter.Transaction = PTransaction;
                adpApu_Categoria.Adapter.Transaction = PTransaction;
                adpApu_Parametros.Adapter.Transaction = PTransaction;

                // Consulta si debe añadir la mano de obra al proyecto
                List<Apu_Mano_Obra> listApu_Mano_Obra =
                    adpApu_Mano_Obra.GetByProyectoRubroMano_Obra(
                        s,
                        oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Rubro_Id,
                        oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id);

                // Inserta la mano de obra al proyecto
                if (listApu_Mano_Obra.Count == 1)
                {
                    // Consultar en parámetros el índice de mano de obra
                    List<Apu_Parametros> listaApu_Parametros =
                        adpApu_Parametros.GetBySucursal(
                            s);
                    // Inserta la mano de obra
                    Apu_Proyecto_Mano_Obra oApu_Proyecto_Mano_Obra =
                        new Apu_Proyecto_Mano_Obra();
                    oApu_Proyecto_Mano_Obra.Apu_Indice_Id =
                        listaApu_Parametros[0].ManoObra_Apu_Indice_Id;
                    oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id =
                        listApu_Mano_Obra[0].Id;
                    oApu_Proyecto_Mano_Obra.Apu_Proyecto_Id =
                        oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id;
                    oApu_Proyecto_Mano_Obra.Apu_Categoria_Id =
                        listApu_Mano_Obra[0].Apu_Categoria_Id;

                    oApu_Proyecto_Mano_Obra.Costo_Diario =
                        listApu_Mano_Obra[0].Costo_Diario;
                    adpApu_Proyecto_Mano_Obra.
                        Insert(s, oApu_Proyecto_Mano_Obra);
                }
                // Inserta la mano de obra en el rubro del proyecto

                resultado = adpApu_Proyecto_Rubro_Mano_Obra.
                    Insert(s, oApu_Proyecto_Rubro_Mano_Obra);

                //Inserta en Apu_Proyecto_Categoria

                if (listApu_Mano_Obra.Count == 1)
                {
                    if (listApu_Mano_Obra[0].Apu_Categoria_Id != null)
                    {
                        List<Apu_Proyecto_Categoria> listaApu_Proyecto_Categoria = adpApu_Proyecto_Categoria.GetByProyectoCategoria(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id, listApu_Mano_Obra[0].Apu_Categoria_Id);
                        if (listaApu_Proyecto_Categoria.Count == 0)
                        {
                            Apu_Categoria oApu_Categoria = adpApu_Categoria.GetById(s, listApu_Mano_Obra[0].Apu_Categoria_Id, s.Int_Sucursal_Id)[0];
                            Apu_Proyecto_Categoria oApu_Proyecto_Categoria = new Apu_Proyecto_Categoria();
                            oApu_Proyecto_Categoria.Apu_Proyecto_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id;
                            oApu_Proyecto_Categoria.Apu_Categoria_Id = listApu_Mano_Obra[0].Apu_Categoria_Id;
                            oApu_Proyecto_Categoria.Costo_Diario = oApu_Categoria.Costo_Diario;
                            adpApu_Proyecto_Categoria.Insert(s, oApu_Proyecto_Categoria);

                        }
                    }
                }

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id)[0];
                //Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                //adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);


            }
            catch (Exception e)
            {
                throw (e);
            }
            return resultado;
        }


        public static int Update(Scope s, Apu_Proyecto_Rubro_Mano_Obra o, Apu_Proyecto_Rubro_Mano_Obra original)
        {

            int resultado = 0;
            try
            {

                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.BeginTransaction();
                adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction;

                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, o.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);

                resultado = adpApu_Proyecto_Rubro_Mano_Obra.Update(s, o, original);

                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.CommitTransaction();

            }
            catch (Exception e)
            {
                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;


        }

        /// <summary>
        /// Borra la mano de obra de un rubro de un proyecto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="oApu_Proyecto_Rubro_Mano_Obra"></param>
        /// <returns></returns>
        public static int Delete(Scope s, Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra)
        {
            // Borra la mano de obra del rubro
            int resultado;
            try
            {
               //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.BeginTransaction();
               //adpApu_Proyecto_Mano_Obra.Adapter.Transaction = adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction;

            resultado = adpApu_Proyecto_Rubro_Mano_Obra.
                Delete(s, oApu_Proyecto_Rubro_Mano_Obra);
            // Compara la mano de obra con el par'ametro
            List<Apu_Parametros> listApu_Parametros = 
                adpApu_Parametros.GetBySucursal(s);
            if(oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id 
                != listApu_Parametros[0].Apu_Mano_Obra_Id)
            {
                // Consulta si existe el equipo 
                int existeManoObra = adpApu_Proyecto_Rubro_Mano_Obra.
                    ExisteManoObra(s,
                                 oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id,
                                 oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Rubro_Id);
                if (existeManoObra == 0) // La mano de obra no esta en ningun rubro del proyeco
                {
                    // Ely 
                    List<Apu_Proyecto_Mano_Obra> listApu_Proyecto_Mano_Obra = 
                        adpApu_Proyecto_Mano_Obra.GetByProyectoManoObra(
                            s,
                            oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id,
                            oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id);
                    // Borra la referencia de la mano de obra del proyecto
                    adpApu_Proyecto_Mano_Obra.Delete(
                        s,
                        listApu_Proyecto_Mano_Obra[0]);
                }
            }
                //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.CommitTransaction();

            // Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
            Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id)[0];
            Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
            adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);
        }
        catch (Exception e)
        {
            //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.RollbackTransaction();
            throw (e);
        }
          return resultado;
        }

        public static int Delete_Transaccion(Scope s, Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra,SqlTransaction PTransaction)
        {
            // Borra la mano de obra del rubro
            int resultado;
            try
            {
                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction = PTransaction;
                adpApu_Parametros.Adapter.Transaction = PTransaction;
                adpApu_Proyecto_Mano_Obra.Adapter.Transaction = PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;

                resultado = adpApu_Proyecto_Rubro_Mano_Obra.
                    Delete(s, oApu_Proyecto_Rubro_Mano_Obra);
                // Compara la mano de obra con el par'ametro
                List<Apu_Parametros> listApu_Parametros =
                    adpApu_Parametros.GetBySucursal(s);
                if (oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id
                    != listApu_Parametros[0].Apu_Mano_Obra_Id)
                {
                    // Consulta si existe el equipo 
                    int existeManoObra = adpApu_Proyecto_Rubro_Mano_Obra.
                        ExisteManoObra(s,
                                     oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id,
                                     oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Rubro_Id);
                    if (existeManoObra == 0) // La mano de obra no esta en ningun rubro del proyeco
                    {
                        // Ely 
                        List<Apu_Proyecto_Mano_Obra> listApu_Proyecto_Mano_Obra =
                            adpApu_Proyecto_Mano_Obra.GetByProyectoManoObra(
                                s,
                                oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id,
                                oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id);

                        if (listApu_Proyecto_Mano_Obra.Count > 0)
                        {
                            // Borra la referencia de la mano de obra del proyecto
                            adpApu_Proyecto_Mano_Obra.Delete(
                                s,
                                listApu_Proyecto_Mano_Obra[0]);
                        }
                    }
                }
                //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.CommitTransaction();

                //// Actualizacion  de Costos en Apu_Proyecto Costo_Directo, Costo_Indirecto, Costo_Total, Costo_Otros
                //Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id)[0];
                //Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                //adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);
            }
            catch (Exception e)
            {
                //adpApu_Proyecto_Rubro_Mano_Obra.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }

        #endregion
    }
}
