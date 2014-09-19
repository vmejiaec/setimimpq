using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using HER;

namespace DEL.APU
{
    public class DO_Apu_Proyecto
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Proyecto _adpApu_Proyecto;
        private static CEL.APU.DO_Apu_Proyecto adpApu_Proyecto
        {
            get
            {
                if (_adpApu_Proyecto == null)
                    _adpApu_Proyecto = new CEL.APU.DO_Apu_Proyecto();
                return _adpApu_Proyecto;
            }
        }

        private static CEL.APU.DO_Apu_Categoria _adpApu_Categoria;
        private static CEL.APU.DO_Apu_Categoria adpApu_Categoria
        {
            get
            {
                if (_adpApu_Categoria==null)
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

        private static CEL.APU.DO_Apu_Mano_Obra _adpApu_Mano_Obra;
        private static CEL.APU.DO_Apu_Mano_Obra adpApu_Mano_Obra
        {
            get
            {
                if (_adpApu_Mano_Obra == null)
                    _adpApu_Mano_Obra = new CEL.APU.DO_Apu_Mano_Obra();
                return _adpApu_Mano_Obra;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Mano_Obra _adpApu_Proyecto_Mano_Obra;
        private static CEL.APU.DO_Apu_Proyecto_Mano_Obra adpApu_Proyecto_Mano_Obra
        {
            get
            {
                if (_adpApu_Proyecto_Mano_Obra == null)
                    _adpApu_Proyecto_Mano_Obra = new CEL.APU.DO_Apu_Proyecto_Mano_Obra();
                return _adpApu_Proyecto_Mano_Obra;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Equipo _adpApu_Proyecto_Equipo;
        private static CEL.APU.DO_Apu_Proyecto_Equipo adpApu_Proyecto_Equipo
        {
            get
            {
                if (_adpApu_Proyecto_Equipo == null)
                    _adpApu_Proyecto_Equipo = new CEL.APU.DO_Apu_Proyecto_Equipo();
                return _adpApu_Proyecto_Equipo;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Material _adpApu_Proyecto_Material;
        private static CEL.APU.DO_Apu_Proyecto_Material adpApu_Proyecto_Material
        {
            get
            {
                if (_adpApu_Proyecto_Material == null)
                    _adpApu_Proyecto_Material = new CEL.APU.DO_Apu_Proyecto_Material();
                return _adpApu_Proyecto_Material;
            }
        }

        // Adaptadores utilizados en la Transferencia hacia una Oferta

        private static CEL.APU.DO_Apu_Oferta _adpApu_Oferta;
        private static CEL.APU.DO_Apu_Oferta adpApu_Oferta
        {
            get
            {
                if (_adpApu_Oferta == null)
                    _adpApu_Oferta = new CEL.APU.DO_Apu_Oferta();
                return _adpApu_Oferta;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Rubro _adpApu_Proyecto_Rubro;
        private static CEL.APU.DO_Apu_Proyecto_Rubro adpApu_Proyecto_Rubro
        {
            get
            {
                if (_adpApu_Proyecto_Rubro == null)
                    _adpApu_Proyecto_Rubro = new CEL.APU.DO_Apu_Proyecto_Rubro();
                return _adpApu_Proyecto_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo _adpApu_Proyecto_Rubro_Equipo;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Equipo adpApu_Proyecto_Rubro_Equipo
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Equipo == null)
                    _adpApu_Proyecto_Rubro_Equipo = new CEL.APU.DO_Apu_Proyecto_Rubro_Equipo();
                return _adpApu_Proyecto_Rubro_Equipo;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra _adpApu_Proyecto_Rubro_Mano_Obra;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra adpApu_Proyecto_Rubro_Mano_Obra
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Mano_Obra == null)
                    _adpApu_Proyecto_Rubro_Mano_Obra = new CEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra();
                return _adpApu_Proyecto_Rubro_Mano_Obra;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Rubro_Material _adpApu_Proyecto_Rubro_Material;
        private static CEL.APU.DO_Apu_Proyecto_Rubro_Material adpApu_Proyecto_Rubro_Material
        {
            get
            {
                if (_adpApu_Proyecto_Rubro_Material == null)
                    _adpApu_Proyecto_Rubro_Material = new CEL.APU.DO_Apu_Proyecto_Rubro_Material();
                return _adpApu_Proyecto_Rubro_Material;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Rubro _adpApu_Oferta_Rubro;
        private static CEL.APU.DO_Apu_Oferta_Rubro adpApu_Oferta_Rubro
        {
            get
            {
                if (_adpApu_Oferta_Rubro == null)
                    _adpApu_Oferta_Rubro = new CEL.APU.DO_Apu_Oferta_Rubro();
                return _adpApu_Oferta_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Rubro_Equipo _adpApu_Oferta_Rubro_Equipo;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Equipo adpApu_Oferta_Rubro_Equipo
        {
            get
            {
                if (_adpApu_Oferta_Rubro_Equipo == null)
                    _adpApu_Oferta_Rubro_Equipo = new CEL.APU.DO_Apu_Oferta_Rubro_Equipo();
                return _adpApu_Oferta_Rubro_Equipo;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra _adpApu_Oferta_Rubro_Mano_Obra;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra adpApu_Oferta_Rubro_Mano_Obra
        {
            get
            {
                if (_adpApu_Oferta_Rubro_Mano_Obra == null)
                    _adpApu_Oferta_Rubro_Mano_Obra = new CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra();
                return _adpApu_Oferta_Rubro_Mano_Obra;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Rubro_Material _adpApu_Oferta_Rubro_Material;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Material adpApu_Oferta_Rubro_Material
        {
            get
            {
                if (_adpApu_Oferta_Rubro_Material == null)
                    _adpApu_Oferta_Rubro_Material = new CEL.APU.DO_Apu_Oferta_Rubro_Material();
                return _adpApu_Oferta_Rubro_Material;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Equipo _adpApu_Oferta_Equipo;
        private static CEL.APU.DO_Apu_Oferta_Equipo adpApu_Oferta_Equipo
        {
            get
            {
                if (_adpApu_Oferta_Equipo == null)
                    _adpApu_Oferta_Equipo = new CEL.APU.DO_Apu_Oferta_Equipo();
                return _adpApu_Oferta_Equipo;
            }
        }


        private static CEL.APU.DO_Apu_Oferta_Mano_Obra _adpApu_Oferta_Mano_Obra;
        private static CEL.APU.DO_Apu_Oferta_Mano_Obra adpApu_Oferta_Mano_Obra
        {
            get
            {
                if (_adpApu_Oferta_Mano_Obra == null)
                    _adpApu_Oferta_Mano_Obra = new CEL.APU.DO_Apu_Oferta_Mano_Obra();
                return _adpApu_Oferta_Mano_Obra;
            }
        }


        private static CEL.APU.DO_Apu_Oferta_Material _adpApu_Oferta_Material;
        private static CEL.APU.DO_Apu_Oferta_Material adpApu_Oferta_Material
        {
            get
            {
                if (_adpApu_Oferta_Material == null)
                    _adpApu_Oferta_Material = new CEL.APU.DO_Apu_Oferta_Material();
                return _adpApu_Oferta_Material;
            }
        }



        #endregion

        #region Operaciones
        public static string Insert(Scope s, Apu_Proyecto oApu_Proyecto)
        {
            // Inserto los objetos
            string resultado;
            try
            {
                adpApu_Proyecto.Adapter.BeginTransaction();
                adpApu_Proyecto_Categoria.Adapter.Transaction = adpApu_Proyecto.Adapter.Transaction;
                adpApu_Proyecto_Mano_Obra.Adapter.Transaction = adpApu_Proyecto.Adapter.Transaction;
                
                //Inserta el proyecto
                resultado = adpApu_Proyecto.Insert(s, oApu_Proyecto);
                //Inserta las categorias al proyecto
                List<Apu_Categoria> listApu_Categoria =
                    adpApu_Categoria.GetByEmpresa(s, s.Int_Sucursal_Id);
                foreach (Apu_Categoria oApu_Categoria in listApu_Categoria)
                {
                    Apu_Proyecto_Categoria oApu_Proyecto_Categoria = 
                        new Apu_Proyecto_Categoria();
                    oApu_Proyecto_Categoria.Apu_Proyecto_Id = 
                        oApu_Proyecto.Id;
                    oApu_Proyecto_Categoria.Apu_Categoria_Id =
                        oApu_Categoria.Id;
                    oApu_Proyecto_Categoria.Costo_Diario = 
                        oApu_Categoria.Costo_Diario;
                    adpApu_Proyecto_Categoria.
                        Insert(s, oApu_Proyecto_Categoria);
                }
                // Inserta una mano de obra
                List<Apu_Parametros> listApu_Parametros =
                    adpApu_Parametros.GetBySucursal(s);

                if (listApu_Parametros.Count != 1)
                {
                    Exception eCaso = new Exception(
                        string.Format("Sucursal Id = {0} sin parámetros", 
                                      s.Int_Sucursal_Id));
                    throw new Exception("MSJ32",eCaso);
                }
                
                List<Apu_Mano_Obra> listApu_Mano_Obra =
                    adpApu_Mano_Obra.GetById(s, listApu_Parametros[0].Apu_Mano_Obra_Id);

                if (listApu_Mano_Obra.Count != 1)
                {
                    Exception eCaso = new Exception(
                        string.Format("No existe la mano de obra Id = {0}", 
                                      listApu_Parametros[0].Apu_Mano_Obra_Id));
                    throw new Exception("MSJ32", eCaso);
                }

                // Consultar en parámetros el índice de mano de obra
                List<Apu_Parametros> listaApu_Parametros =
                    adpApu_Parametros.GetBySucursal(s);
                
                Apu_Proyecto_Mano_Obra oApu_Proyecto_Mano_Obra = 
                    new Apu_Proyecto_Mano_Obra();
                oApu_Proyecto_Mano_Obra.Apu_Indice_Id =
                    listaApu_Parametros[0].ManoObra_Apu_Indice_Id; 
                oApu_Proyecto_Mano_Obra.Apu_Proyecto_Id = 
                    oApu_Proyecto.Id;
                oApu_Proyecto_Mano_Obra.Costo_Diario = 
                    listApu_Mano_Obra[0].Costo_Diario;
                oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id = 
                    listApu_Mano_Obra[0].Id;
                oApu_Proyecto_Mano_Obra.Apu_Categoria_Id = 
                    listApu_Mano_Obra[0].Apu_Categoria_Id;
                adpApu_Proyecto_Mano_Obra.
                    Insert(s, oApu_Proyecto_Mano_Obra);
                adpApu_Proyecto.Adapter.CommitTransaction(); 
            }
            catch(Exception e)
            {
                adpApu_Proyecto.Adapter.RollbackTransaction(); 
                throw (e);
            }          
            return resultado;
        }

        public static bool Update_Costo(Scope s, Apu_Proyecto oApu_Proyecto)
        {
            bool resultado=true;
            try
            {
                adpApu_Proyecto_Equipo.Adapter.BeginTransaction();
                adpApu_Proyecto_Mano_Obra.Adapter.Transaction = adpApu_Proyecto_Equipo.Adapter.Transaction;
                adpApu_Proyecto_Material.Adapter.Transaction = adpApu_Proyecto_Equipo.Adapter.Transaction;

                adpApu_Proyecto_Equipo.GetByUpdateCosto(s, oApu_Proyecto.Id);
                adpApu_Proyecto_Mano_Obra.GetByUpdateCosto(s, oApu_Proyecto.Id);
                adpApu_Proyecto_Material.GetByUpdateCosto(s, oApu_Proyecto.Id);

                adpApu_Proyecto_Equipo.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpApu_Proyecto_Equipo.Adapter.RollbackTransaction();
                resultado = false;
                throw(e);
            }
            return resultado;

        }

        public static bool Transferir_Oferta(Scope s, Apu_Proyecto oApu_Proyecto, string Apu_Oferta_Id)
        {
            bool resultado = true;
            string v_Apu_Oferta_Rubro_Id;
            SqlTransaction PTransaccion;
            string v_Param_Apu_Mano_Obra_Id;
    
            try
            {
                adpApu_Proyecto_Rubro.Adapter.BeginTransaction();
                PTransaccion = adpApu_Proyecto_Rubro.Adapter.Transaction;

                adpApu_Parametros.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Equipo.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Mano_Obra.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Material.Adapter.Transaction = PTransaccion;

                adpApu_Oferta_Equipo.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Mano_Obra.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Material.Adapter.Transaction = PTransaccion;

                
                adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction = PTransaccion;
                adpApu_Proyecto_Rubro_Material.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Rubro.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Rubro_Equipo.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Rubro_Mano_Obra.Adapter.Transaction = PTransaccion;
                adpApu_Oferta_Rubro_Material.Adapter.Transaction = PTransaccion;
                
                //Determinar la mano de obra que se copia al crear la oferta para ya no insertarla en Apu_Proyecto_Mano_Obra
                Apu_Parametros oApu_Parametros = adpApu_Parametros.GetByEmpresa(s)[0];
                v_Param_Apu_Mano_Obra_Id = oApu_Parametros.Apu_Mano_Obra_Id;
                
                //Copia de los Equipos del Proyecto a la Oferta. Si el Equipo ya Existe no se volvera a copiarlo.

                List<Apu_Proyecto_Equipo> lstApu_Proyecto_Equipo = adpApu_Proyecto_Equipo.GetByProyecto_Oferta(s, oApu_Proyecto.Id,Apu_Oferta_Id);
                foreach (Apu_Proyecto_Equipo oApu_Proyecto_Equipo in lstApu_Proyecto_Equipo)
                {

                    Apu_Oferta_Equipo oApu_Oferta_Equipo = new Apu_Oferta_Equipo();
                    oApu_Oferta_Equipo.Apu_Oferta_Id = Apu_Oferta_Id;
                    oApu_Oferta_Equipo.Apu_Equipo_Id = oApu_Proyecto_Equipo.Apu_Equipo_Id;
                    oApu_Oferta_Equipo.Estado = oApu_Proyecto_Equipo.Estado;
                    adpApu_Oferta_Equipo.Insert(s, oApu_Oferta_Equipo);
                }

                //Copia de la Mano de Obra del Proyecto a la Oferta
                List<Apu_Proyecto_Mano_Obra> lstApu_Proyecto_Mano_Obra = adpApu_Proyecto_Mano_Obra.GetByProyecto_Oferta(s, oApu_Proyecto.Id,Apu_Oferta_Id);
                foreach (Apu_Proyecto_Mano_Obra oApu_Proyecto_Mano_Obra in lstApu_Proyecto_Mano_Obra)
                {
                    if (v_Param_Apu_Mano_Obra_Id != oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id)
                    {
                        Apu_Oferta_Mano_Obra oApu_Oferta_Mano_Obra = new Apu_Oferta_Mano_Obra();
                        oApu_Oferta_Mano_Obra.Apu_Oferta_Id = Apu_Oferta_Id;
                        oApu_Oferta_Mano_Obra.Apu_Mano_Obra_Id = oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id;
                        oApu_Oferta_Mano_Obra.Apu_Categoria_Id = oApu_Proyecto_Mano_Obra.Apu_Categoria_Id;
                        oApu_Oferta_Mano_Obra.Apu_Indice_Id = oApu_Proyecto_Mano_Obra.Apu_Indice_Id;
                        oApu_Oferta_Mano_Obra.Estado = oApu_Proyecto_Mano_Obra.Estado;
                        oApu_Oferta_Mano_Obra.Costo_Diario = oApu_Proyecto_Mano_Obra.Costo_Diario;
                        adpApu_Oferta_Mano_Obra.Insert(s, oApu_Oferta_Mano_Obra);
                    }
                }

                //Copia del Material del Proyecto a la Oferta
                List<Apu_Proyecto_Material> lstApu_Proyecto_Material = adpApu_Proyecto_Material.GetByProyecto_Oferta(s, oApu_Proyecto.Id, Apu_Oferta_Id);
                foreach (Apu_Proyecto_Material oApu_Proyecto_Material in lstApu_Proyecto_Material)
                {
                    Apu_Oferta_Material oApu_Oferta_Material = new Apu_Oferta_Material();
                    oApu_Oferta_Material.Apu_Oferta_Id = Apu_Oferta_Id;
                    //oApu_Oferta_Material.Apu_Indice_Id = oApu_Proyecto_Material.Apu_Indice_Id;
                    oApu_Oferta_Material.Apu_Material_Id = oApu_Proyecto_Material.Apu_Material_Id;
                    oApu_Oferta_Material.Estado = oApu_Proyecto_Material.Estado;
                    adpApu_Oferta_Material.Insert(s, oApu_Oferta_Material);
                }


                //Copia de los rubros del Proyecto a la Oferta
                List<Apu_Proyecto_Rubro> lstApu_Proyecto_Rubro = adpApu_Proyecto_Rubro.GetByProyecto_Oferta(s, oApu_Proyecto.Id, Apu_Oferta_Id);
                foreach (Apu_Proyecto_Rubro oApu_Proyecto_Rubro in lstApu_Proyecto_Rubro)
                {
                    Apu_Oferta_Rubro oApu_Oferta_Rubro = new Apu_Oferta_Rubro();
                    oApu_Oferta_Rubro.Apu_Oferta_Id = Apu_Oferta_Id;
                    oApu_Oferta_Rubro.Apu_Rubro_Id = oApu_Proyecto_Rubro.Apu_Rubro_Id;
                    oApu_Oferta_Rubro.Cantidad = oApu_Proyecto_Rubro.Cantidad;
                    oApu_Oferta_Rubro.Estado = oApu_Proyecto_Rubro.Estado;
                    v_Apu_Oferta_Rubro_Id= adpApu_Oferta_Rubro.Insert(s, oApu_Oferta_Rubro);

                    //Copia de los insumos de Equipo del Proyecto a la Oferta
                    List<Apu_Proyecto_Rubro_Equipo> lstApu_Proyecto_Rubro_Equipo = adpApu_Proyecto_Rubro_Equipo.GetByRubro(s,oApu_Proyecto_Rubro.Id);
                    foreach (Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo in lstApu_Proyecto_Rubro_Equipo)
                    {

                        Apu_Oferta_Rubro_Equipo oApu_Oferta_Rubro_Equipo = new Apu_Oferta_Rubro_Equipo();
                        oApu_Oferta_Rubro_Equipo.Apu_Oferta_Rubro_Id = v_Apu_Oferta_Rubro_Id;
                        oApu_Oferta_Rubro_Equipo.Apu_Equipo_Id = oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id;
                        oApu_Oferta_Rubro_Equipo.Costo = oApu_Proyecto_Rubro_Equipo.costo_x_rendimiento_hora;
                        oApu_Oferta_Rubro_Equipo.Estado = oApu_Proyecto_Rubro_Equipo.Estado;
                        adpApu_Oferta_Rubro_Equipo.Insert(s, oApu_Oferta_Rubro_Equipo);
                    }

                    //Copia de los insumos de Mano de Obra del Proyecto a la Oferta
                    List<Apu_Proyecto_Rubro_Mano_Obra> lstApu_Proyecto_Rubro_Mano_Obra = adpApu_Proyecto_Rubro_Mano_Obra.GetByRubro(s,oApu_Proyecto_Rubro.Id);
                    foreach (Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra in lstApu_Proyecto_Rubro_Mano_Obra)
                    {
                        Apu_Oferta_Rubro_Mano_Obra oApu_Oferta_Rubro_Mano_Obra = new Apu_Oferta_Rubro_Mano_Obra();
                        oApu_Oferta_Rubro_Mano_Obra.Costo = oApu_Proyecto_Rubro_Mano_Obra.costo_x_rendimiento_hora;
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Rubro_Id = v_Apu_Oferta_Rubro_Id;
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id;
                        oApu_Oferta_Rubro_Mano_Obra.Estado = oApu_Proyecto_Rubro_Mano_Obra.Estado;
                        adpApu_Oferta_Rubro_Mano_Obra.Insert(s, oApu_Oferta_Rubro_Mano_Obra);
                    }

                    //Copia de los insumos de Material del Proyecto a la Oferta
                    List<Apu_Proyecto_Rubro_Material> lstApu_Proyecto_Rubro_Material = adpApu_Proyecto_Rubro_Material.GetByProyectoRubro(s,oApu_Proyecto_Rubro.Id);
                    foreach (Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material in lstApu_Proyecto_Rubro_Material)
                    {
                        Apu_Oferta_Rubro_Material oApu_Oferta_Rubro_Material = new Apu_Oferta_Rubro_Material();
                        oApu_Oferta_Rubro_Material.Apu_Oferta_Rubro_Id = v_Apu_Oferta_Rubro_Id;
                        oApu_Oferta_Rubro_Material.Apu_Material_Id = oApu_Proyecto_Rubro_Material.Apu_Material_Id;
                        oApu_Oferta_Rubro_Material.Costo = oApu_Proyecto_Rubro_Material.costo_total;
                        oApu_Oferta_Rubro_Material.Costo_Transporte = oApu_Proyecto_Rubro_Material.costo_total_transporte;
                        oApu_Oferta_Rubro_Material.Estado = oApu_Proyecto_Rubro_Material.Estado;
                        adpApu_Oferta_Rubro_Material.Insert(s, oApu_Oferta_Rubro_Material);
                    }

                }

                adpApu_Proyecto_Rubro.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpApu_Proyecto_Rubro.Adapter.RollbackTransaction();
                resultado = false;
                throw (e);
            }
            return resultado;

        }

        #endregion

        #region Obtencion de Datos

        static public List<Apu_Proyecto> GetBySucursal(Scope s, string Int_sucursal_id,string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado )
        {
            ParametrosGet parametrosGet;
            MetodosGet metodoGet;
            string filtroParaCEL;

            Filtrado.AnalizarExpresionDeFiltrado(s.Expresion_De_Filtrado, out parametrosGet, out metodoGet, out filtroParaCEL);

            s.Expresion_De_Filtrado = filtroParaCEL;
            List<Apu_Proyecto> resultado;
            //switch (metodoGet)
            //{
            //    case MetodosGet.GetByLikeCodigoDesde:
            //        resultado = adpApu_Proyecto.GetByLikeCodigoDesde(s, parametrosGet["desde_Codigo"]);
            //        break;
            //    case MetodosGet.GetByLikeCodigoHasta:
            //        resultado = adpApu_Proyecto.GetByLikeCodigoHasta(s, parametrosGet["hasta_Codigo"]);
            //        break;
            //    case MetodosGet.GetByLikeCodigoDesdeHasta:
            //        resultado = adpApu_Proyecto.GetByLikeCodigoDesdeHasta(s, parametrosGet["desde_Codigo"], parametrosGet["hasta_Codigo"]);
            //        break;
            //    case MetodosGet.GetByLikeNombre:
            //        resultado = adpApu_Proyecto.GetByLikeNombre(s, parametrosGet["nombre"]);
            //        break;
            //    default:
            //        resultado = adpApu_Proyecto.GetBySucursal(s, Int_sucursal_id, Codigo_Desde,  Codigo_Hasta, Etapa, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre);
            //      //  resultado = adpApu_Proyecto.GetBySucursal(s, Int_sucursal_id, null, null, null, null , DateTime.Today, DateTime.Today, null, null, null, null);
            //        break;
            //}

            if (String.IsNullOrEmpty(Apu_Lugar_Nombre) || Apu_Lugar_Nombre=="[%]")
                Apu_Lugar_Nombre = null;

            resultado = adpApu_Proyecto.GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);

            return resultado;
        }

        #endregion
    }
}
