using System;
using System.Collections.Generic;
using System.Text;
using AEL.APU;
using BEL;
using HER;
using System.Data.SqlClient;


namespace DEL.APU
{

    public class DO_Apu_Proyecto_Rubro
    {
        #region Adapters

        private static CEL.APU.DO_Apu_Proyecto_Rubro _adpApu_Proyecto_Rubro;
        private static CEL.APU.DO_Apu_Rubro_Documento _adpApu_Rubro_Documento;
        private static CEL.APU.DO_Apu_Rubro_Equipo _adpApu_Rubro_Equipo;
        private static CEL.APU.DO_Apu_Rubro_Mano_Obra _adpApu_Rubro_Mano_Obra ;
        private static CEL.APU.DO_Apu_Rubro_Material _adpApu_Rubro_Material ;
        private static CEL.APU.DO_Apu_Rubro_Tecnica _apdApu_Rubro_Tecnica ;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Documento _adpApu_Proyecto_Rubro_Documento ;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Tecnica _adpApu_Proyecto_Rubro_Tecnica ;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Material _adpApu_Proyecto_Rubro_Material;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra _apuApu_Proyecto_Rubro_Mano_Obra;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo _adpApu_Proyecto_Rubro_Equipo;
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

        public static CEL.APU.DO_Apu_Proyecto_Rubro adpApu_Proyecto_Rubro
        {
            get
            {
                if (_adpApu_Proyecto_Rubro == null)
                    _adpApu_Proyecto_Rubro = new CEL.APU.DO_Apu_Proyecto_Rubro();
                return _adpApu_Proyecto_Rubro;
            }
        }
        public static CEL.APU.DO_Apu_Rubro_Documento adpApu_Rubro_Documento
        {
            get
            {
                if (_adpApu_Rubro_Documento == null)
                    _adpApu_Rubro_Documento = new CEL.APU.DO_Apu_Rubro_Documento();
                return _adpApu_Rubro_Documento;
            }
        }
        public static CEL.APU.DO_Apu_Rubro_Equipo adpApu_Rubro_Equipo
        {
            get
            {
                if (_adpApu_Rubro_Equipo == null)
                    _adpApu_Rubro_Equipo = new CEL.APU.DO_Apu_Rubro_Equipo();
                return _adpApu_Rubro_Equipo;
            }
        }
        public static CEL.APU.DO_Apu_Rubro_Mano_Obra adpApu_Rubro_Mano_Obra
        {
            get
            {
                if (_adpApu_Rubro_Mano_Obra == null)
                    _adpApu_Rubro_Mano_Obra = new CEL.APU.DO_Apu_Rubro_Mano_Obra();
                return _adpApu_Rubro_Mano_Obra;
            }
        }
        public static CEL.APU.DO_Apu_Rubro_Material adpApu_Rubro_Material
        {
            get
            {
                if (_adpApu_Rubro_Material == null)
                    _adpApu_Rubro_Material = new CEL.APU.DO_Apu_Rubro_Material();
                return _adpApu_Rubro_Material;
            }
        }
        public static CEL.APU.DO_Apu_Rubro_Tecnica apdApu_Rubro_Tecnica
        {
            get
            {
                if (_apdApu_Rubro_Tecnica == null)
                    _apdApu_Rubro_Tecnica = new CEL.APU.DO_Apu_Rubro_Tecnica();
                return _apdApu_Rubro_Tecnica;
            }
        }
        public static CEL.APU.DO_Apu_Proyecto_Rubro_Documento adpApu_Proyecto_Rubro_Documento
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Documento == null)
                    _adpApu_Proyecto_Rubro_Documento = new CEL.APU.DO_Apu_Proyecto_Rubro_Documento();
                return _adpApu_Proyecto_Rubro_Documento;
            }
        }
        public static CEL.APU.DO_Apu_Proyecto_Rubro_Tecnica adpApu_Proyecto_Rubro_Tecnica
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Tecnica == null)
                    _adpApu_Proyecto_Rubro_Tecnica = new CEL.APU.DO_Apu_Proyecto_Rubro_Tecnica();
                return _adpApu_Proyecto_Rubro_Tecnica;
            }
        }
        public static CEL.APU.DO_Apu_Proyecto_Rubro_Material adpApu_Proyecto_Rubro_Material
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Material == null)
                    _adpApu_Proyecto_Rubro_Material = new CEL.APU.DO_Apu_Proyecto_Rubro_Material();
                return _adpApu_Proyecto_Rubro_Material;
            }
        }
        public static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra apuApu_Proyecto_Rubro_Mano_Obra
        {
            get
            {
                if (_apuApu_Proyecto_Rubro_Mano_Obra == null)
                    _apuApu_Proyecto_Rubro_Mano_Obra = new CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra();
                return _apuApu_Proyecto_Rubro_Mano_Obra;
            }
        }
        public static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo adpApu_Proyecto_Rubro_Equipo
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Equipo == null)
                    _adpApu_Proyecto_Rubro_Equipo = new CEL.APU.DO_Apu_Proyecto_Rubro_Equipo();
                return _adpApu_Proyecto_Rubro_Equipo;
            }
        }

        #endregion

        #region operaciones
        public static string Insert(Scope s, Apu_Proyecto_Rubro o)
        {
            string resultado;
            try
            {
                SqlTransaction PTransaction;
                adpApu_Proyecto_Rubro.Adapter.BeginTransaction();
                adpApu_Proyecto_Rubro_Documento.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Tecnica.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                apuApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Material.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                PTransaction = adpApu_Proyecto_Rubro.Adapter.Transaction;

                // Consulta los insumos del rubro
                List<Apu_Rubro_Material> rubMateriales =
                    adpApu_Rubro_Material.GetByRubro(s, o.Apu_Rubro_Id);
                List<Apu_Rubro_Mano_Obra> rubManos =
                    adpApu_Rubro_Mano_Obra.GetByRubro(s, o.Apu_Rubro_Id);
                List<Apu_Rubro_Equipo> rubEquipos =
                    adpApu_Rubro_Equipo.GetByRubro(s, o.Apu_Rubro_Id);
                List<Apu_Rubro_Documento> rubDocs =
                    adpApu_Rubro_Documento.GetByRubro(s, o.Apu_Rubro_Id, s.Par_Servidor_Id);
                List<Apu_Rubro_Tecnica> rubTecs =
                    apdApu_Rubro_Tecnica.GetByRubro(s, o.Apu_Rubro_Id, s.Par_Servidor_Id);
                // Inserta el rubro en el proyecto
                resultado = adpApu_Proyecto_Rubro.Insert(s, o);
                // Inserta los insumos del rubro en el proyecto
                foreach (Apu_Rubro_Material rubMaterial in rubMateriales)
                {
                    DO_Apu_Proyecto_Rubro_Material.Insert_Transaccion(s,
                        APU_Factory.Make_Apu_Proyecto_Rubro_Material(o, rubMaterial),PTransaction);
                }
                foreach (Apu_Rubro_Mano_Obra rubMano in rubManos)
                {
                    DO_Apu_Proyecto_Rubro_Mano_Obra.Insert_Transaccion(s,
                        APU_Factory.Make_Apu_Proyecto_Rubro_Mano_Obra(o, rubMano),PTransaction);
                }
                foreach (Apu_Rubro_Equipo rubEquipo in rubEquipos)
                {
                    DO_Apu_Proyecto_Rubro_Equipo.Insert_Transaccion (s,
                        APU_Factory.Make_Apu_Proyecto_Rubro_Equipo(o, rubEquipo),PTransaction);
                }
                foreach (Apu_Rubro_Documento rubDoc in rubDocs)
                {
                    adpApu_Proyecto_Rubro_Documento.Insert(s,
                        APU_Factory.Make_Apu_Proyecto_Rubro_Documento(o, rubDoc));
                }
                foreach (Apu_Rubro_Tecnica rubTec in rubTecs)
                {
                    adpApu_Proyecto_Rubro_Tecnica.Insert(s,
                        APU_Factory.Make_Apu_Proyecto_Rubro_Tecnica(o, rubTec));
                }
                
                //JPU Actualizacion de los Costos en Apu_Proyecto
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, o.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                adpApu_Proyecto_Rubro.Adapter.CommitTransaction();    

            }catch(Exception e)
            {
                adpApu_Proyecto_Rubro.Adapter.RollbackTransaction();
                throw (e);
            }
            
            return resultado;
        }

        public static int Delete(Scope s,  Apu_Proyecto_Rubro o)
        {
            int resultado = 0;
            try
            {
                SqlTransaction PTransaction;
                adpApu_Proyecto_Rubro.Adapter.BeginTransaction();
                PTransaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Material.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                apuApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;

                adpApu_Proyecto_Rubro_Documento.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro_Tecnica.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto_Rubro.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;
                adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;

                // Consulta los insumos del rubro en el proyecto
                List<Apu_Proyecto_Rubro_Material> proyRubMats =
                    adpApu_Proyecto_Rubro_Material.GetByProyectoRubro(s, o.Id);
                List<Apu_Proyecto_Rubro_Mano_Obra> proyRubMans =
                    apuApu_Proyecto_Rubro_Mano_Obra.GetByRubro(s, o.Id); // Ojo, posible problema
                List<Apu_Proyecto_Rubro_Equipo> proyRubEqus =
                    adpApu_Proyecto_Rubro_Equipo.GetByRubro(s, o.Id); // Ojo, posible problema
                List<Apu_Proyecto_Rubro_Documento> proyRubDocs =
                    adpApu_Proyecto_Rubro_Documento.GetByRubro(s, o.Apu_Rubro_Id, s.Par_Servidor_Id);
                List<Apu_Proyecto_Rubro_Tecnica> proyRubTecs =
                    adpApu_Proyecto_Rubro_Tecnica.GetByProyectoRubro(s, s.Par_Servidor_Id, o.Id);
                // Borra los insumos del rubro en el proyecto
                foreach (Apu_Proyecto_Rubro_Material proyRubMat in proyRubMats)
                {
                    DO_Apu_Proyecto_Rubro_Material.Delete_Transaccion(s, proyRubMat,PTransaction);
                }
                foreach (Apu_Proyecto_Rubro_Mano_Obra proyRubMan in proyRubMans)
                {
                    DO_Apu_Proyecto_Rubro_Mano_Obra.Delete_Transaccion(s, proyRubMan,PTransaction);
                }
                foreach (Apu_Proyecto_Rubro_Equipo proyRubEqu in proyRubEqus)
                {
                    DO_Apu_Proyecto_Rubro_Equipo.Delete_Transaccion(s, proyRubEqu,PTransaction);
                }
                foreach (Apu_Proyecto_Rubro_Documento proyRubDoc in proyRubDocs)
                {
                    adpApu_Proyecto_Rubro_Documento.Delete(s, proyRubDoc);
                }
                foreach (Apu_Proyecto_Rubro_Tecnica proyRubTec in proyRubTecs)
                {
                    adpApu_Proyecto_Rubro_Tecnica.Delete(s, proyRubTec);
                }
                // Borra el rubro del proyecto
                resultado = adpApu_Proyecto_Rubro.Delete(s, o);


                //JPU Actualizacion de los Costos en Apu_Proyecto
                Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetByIdResumido(s, o.Apu_Proyecto_Id)[0];
                Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);
                adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                adpApu_Proyecto_Rubro.Adapter.CommitTransaction();

            }
            catch (Exception e)
            {
                adpApu_Proyecto_Rubro.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }

        public static int Update(Scope s, Apu_Proyecto_Rubro o, Apu_Proyecto_Rubro original)
        {
           int resultado = 0;
             try
             {
              

                 adpApu_Proyecto_Rubro.Adapter.BeginTransaction();
                 adpApu_Proyecto.Adapter.Transaction = adpApu_Proyecto_Rubro.Adapter.Transaction;

                 Apu_Proyecto v_Apu_Proyecto = adpApu_Proyecto.GetById(s, o.Apu_Proyecto_Id)[0];
                 Apu_Proyecto v_Apu_Proyecto_2 = new Apu_Proyecto(v_Apu_Proyecto);

                 resultado= adpApu_Proyecto_Rubro.Update(s, o, original);

                 adpApu_Proyecto.Update(s, v_Apu_Proyecto, v_Apu_Proyecto_2);

                 adpApu_Proyecto_Rubro.Adapter.CommitTransaction();

             }
             catch (Exception e)
             {
                 adpApu_Proyecto_Rubro.Adapter.RollbackTransaction();
                 throw (e);
             }
             return resultado;
        }

    
        #endregion

        
    }

  
}
