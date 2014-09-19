using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using HER;

namespace DEL.APU
{
    public class DO_Apu_Oferta
    {
        #region Adapters

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

        private static CEL.APU.DO_Apu_Oferta_Categoria _adpApu_Oferta_Categoria;
        private static CEL.APU.DO_Apu_Oferta_Categoria adpApu_Oferta_Categoria
        {
            get
            {
                if (_adpApu_Oferta_Categoria == null)
                    _adpApu_Oferta_Categoria = new CEL.APU.DO_Apu_Oferta_Categoria();
                return _adpApu_Oferta_Categoria;
            }
        }

        #endregion

        #region Operaciones

        // Crea un clon tomando como base otra oferta ya creada
        public static string Clonar(Scope s, String pApu_Oferta_Id)
        {
            String sApu_Oferta_Id="";
            Apu_Oferta oApu_Oferta = new Apu_Oferta();
            CEL.APU.DO_Apu_Oferta_Rubro celApu_Oferta_Rubro = 
                new CEL.APU.DO_Apu_Oferta_Rubro();
            CEL.APU.DO_Apu_Oferta_Rubro_Equipo celApu_Oferta_Rubro_Equipo =
                new CEL.APU.DO_Apu_Oferta_Rubro_Equipo();
            CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra celApu_Oferta_Rubro_Mano_Obra =
                new CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra();
            CEL.APU.DO_Apu_Oferta_Rubro_Material celApu_Oferta_Rubro_Material =
                new CEL.APU.DO_Apu_Oferta_Rubro_Material();
            // Crea la cabecera de la oferta
            List<Apu_Oferta> lstApu_Oferta = adpApu_Oferta.GetById(s, pApu_Oferta_Id);
            if (lstApu_Oferta.Count > 0)
            {
                // Llena de rubros la oferta
                oApu_Oferta = new Apu_Oferta();
                oApu_Oferta.Codigo = null;
                oApu_Oferta.Nombre = "CLON DE LA OFERTA " 
                    + lstApu_Oferta[0].Codigo 
                    + " - "
                    + lstApu_Oferta[0].Nombre;
                oApu_Oferta.Apu_Lugar_Id = lstApu_Oferta[0].Apu_Lugar_Id;
                oApu_Oferta.Area = lstApu_Oferta[0].Area;
                oApu_Oferta.Porcentaje_Costo_Indirecto = lstApu_Oferta[0].Porcentaje_Costo_Indirecto;
                oApu_Oferta.Porcentaje_Costo_Otros = lstApu_Oferta[0].Porcentaje_Costo_Otros;
                oApu_Oferta.Contratista = lstApu_Oferta[0].Contratista;
                oApu_Oferta.Tecnico_Per_Personal_Id = s.Per_Personal_Id;
                oApu_Oferta.Etapa = "BOR";
                oApu_Oferta.Tipo_Contrato = "PRI";
                oApu_Oferta.Apu_provincia_id = lstApu_Oferta[0].Apu_provincia_id;
                oApu_Oferta.Int_Sucursal_Id = s.Int_Sucursal_Id;
                oApu_Oferta.Int_Moneda_Id = s.Int_Moneda_Id;
                sApu_Oferta_Id = DEL.APU.DO_Apu_Oferta.Insert(s, oApu_Oferta);
                // Inserta los rubros
                List<Apu_Oferta_Rubro> lstApu_Oferta_Rubro =
                    celApu_Oferta_Rubro.GetByOferta(s, pApu_Oferta_Id);
                foreach (Apu_Oferta_Rubro cApu_Oferta_Rubro in lstApu_Oferta_Rubro)
                {
                    Apu_Oferta_Rubro oApu_Oferta_Rubro = new Apu_Oferta_Rubro();
                    oApu_Oferta_Rubro.Apu_Oferta_Id = sApu_Oferta_Id;
                    oApu_Oferta_Rubro.Apu_Rubro_Id = cApu_Oferta_Rubro.Apu_Rubro_Id;
                    oApu_Oferta_Rubro.Cantidad = cApu_Oferta_Rubro.Cantidad;
                    DEL.APU.DO_Apu_Oferta_Rubro.Insert(s, oApu_Oferta_Rubro);
                    // Insertamos el equipo
                    List<Apu_Oferta_Rubro_Equipo> lstApu_Oferta_Rubro_Equipo =
                        celApu_Oferta_Rubro_Equipo.GetByOfertaRubro(s, cApu_Oferta_Rubro.Id);
                    foreach (Apu_Oferta_Rubro_Equipo cApu_Oferta_Rubro_Equipo in lstApu_Oferta_Rubro_Equipo)
                    {
                        Apu_Oferta_Rubro_Equipo oApu_Oferta_Rubro_Equipo = new Apu_Oferta_Rubro_Equipo();
                        oApu_Oferta_Rubro_Equipo.Apu_Oferta_Id = sApu_Oferta_Id;
                        oApu_Oferta_Rubro_Equipo.Apu_Oferta_Rubro_Id = oApu_Oferta_Rubro.Id;
                        oApu_Oferta_Rubro_Equipo.Apu_Equipo_Id = cApu_Oferta_Rubro_Equipo.Apu_Equipo_Id;
                        oApu_Oferta_Rubro_Equipo.Costo = cApu_Oferta_Rubro_Equipo.Costo;
                        DEL.APU.DO_Apu_Oferta_Rubro_Equipo.Insert(s, oApu_Oferta_Rubro_Equipo);
                    }
                    // Insertamos la mano de obra
                    List<Apu_Oferta_Rubro_Mano_Obra> lstApu_Oferta_Rubro_Mano_Obra =
                        celApu_Oferta_Rubro_Mano_Obra.GetByOfertaRubro(s, cApu_Oferta_Rubro.Id);
                    foreach (Apu_Oferta_Rubro_Mano_Obra cApu_Oferta_Rubro_Mano_Obra in lstApu_Oferta_Rubro_Mano_Obra)
                    {
                        Apu_Oferta_Rubro_Mano_Obra oApu_Oferta_Rubro_Mano_Obra = new Apu_Oferta_Rubro_Mano_Obra();
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Id = sApu_Oferta_Id;
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Rubro_Id = oApu_Oferta_Rubro.Id;
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id = cApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id;
                        oApu_Oferta_Rubro_Mano_Obra.Costo = cApu_Oferta_Rubro_Mano_Obra.Costo;
                        DEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra.Insert(s, oApu_Oferta_Rubro_Mano_Obra);
                    }
                    // Insertamos el material y transporte
                    List<Apu_Oferta_Rubro_Material> lstApu_Oferta_Rubro_Material =
                        celApu_Oferta_Rubro_Material.GetByOfertaRubro(s, cApu_Oferta_Rubro.Id);
                    foreach (Apu_Oferta_Rubro_Material cApu_Oferta_Rubro_Material in lstApu_Oferta_Rubro_Material)
                    {
                        Apu_Oferta_Rubro_Material oApu_Oferta_Rubro_Material = new Apu_Oferta_Rubro_Material();
                        oApu_Oferta_Rubro_Material.Apu_Oferta_Id = sApu_Oferta_Id;
                        oApu_Oferta_Rubro_Material.Apu_Oferta_Rubro_Id = oApu_Oferta_Rubro.Id;
                        oApu_Oferta_Rubro_Material.Apu_Material_Id = cApu_Oferta_Rubro_Material.Apu_Material_Id;
                        oApu_Oferta_Rubro_Material.Costo = cApu_Oferta_Rubro_Material.Costo;
                        oApu_Oferta_Rubro_Material.Costo_Transporte = cApu_Oferta_Rubro_Material.Costo_Transporte;
                        DEL.APU.DO_Apu_Oferta_Rubro_Material.Insert(s, oApu_Oferta_Rubro_Material);
                    }
                }
            }
            else
            {
                Exception e = new Exception("xx1",
                    new Exception("No se ha seleccionado una oferta para clonar."));
            }
            return oApu_Oferta.Codigo;
        }

        // Inserta una oferta
        public static string Insert(Scope s, Apu_Oferta oApu_Oferta)
        {
            // Inserto los objetos
            string resultado;

            try
            {
                adpApu_Oferta.Adapter.BeginTransaction();
                adpApu_Oferta_Mano_Obra.Adapter.Transaction = adpApu_Oferta.Adapter.Transaction;
                adpApu_Oferta_Categoria.Adapter.Transaction = adpApu_Oferta.Adapter.Transaction;
                adpApu_Categoria.Adapter.Transaction = adpApu_Oferta.Adapter.Transaction;
                adpApu_Parametros.Adapter.Transaction = adpApu_Oferta.Adapter.Transaction;
                adpApu_Mano_Obra.Adapter.Transaction = adpApu_Oferta.Adapter.Transaction;

                // Inserta la Oferta
                resultado = adpApu_Oferta.Insert(s, oApu_Oferta);

                //Inserta las categorias a la oferta
                List<Apu_Categoria> listApu_Categoria =
                    adpApu_Categoria.GetByEmpresa(s, s.Int_Sucursal_Id);
                foreach (Apu_Categoria oApu_Categoria in listApu_Categoria)
                {
                    Apu_Oferta_Categoria oApu_Oferta_Categoria =
                        new Apu_Oferta_Categoria();
                    oApu_Oferta_Categoria.Apu_Oferta_Id =
                        oApu_Oferta.Id;
                    oApu_Oferta_Categoria.Apu_Categoria_Id =
                        oApu_Categoria.Id;
                    oApu_Oferta_Categoria.Costo_Diario =
                        oApu_Categoria.Costo_Diario;
                    adpApu_Oferta_Categoria.
                        Insert(s, oApu_Oferta_Categoria);
                }
               
                // Busca en parámetros la mano de obra a insertar
                List<Apu_Parametros> listApu_Parametros =
                    adpApu_Parametros.GetBySucursal(s);

                if (listApu_Parametros.Count != 1)
                {
                    Exception eCaso = new Exception(
                        string.Format("Sucursal Id = {0} sin parámetros",
                                      s.Int_Sucursal_Id));
                    throw new Exception(TXT_Mensajes._MSJ111, eCaso);
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

                //Insertar en Apu_Oferta_Mano_Obra
                Apu_Oferta_Mano_Obra oApu_Oferta_Mano_Obra = new Apu_Oferta_Mano_Obra();

                oApu_Oferta_Mano_Obra.Apu_Indice_Id =    listApu_Parametros[0].ManoObra_Apu_Indice_Id;
                oApu_Oferta_Mano_Obra.Apu_Oferta_Id =    oApu_Oferta.Id;
                oApu_Oferta_Mano_Obra.Costo_Diario =     listApu_Mano_Obra[0].Costo_Diario;
                oApu_Oferta_Mano_Obra.Apu_Categoria_Id = listApu_Mano_Obra[0].Apu_Categoria_Id;
                oApu_Oferta_Mano_Obra.Apu_Mano_Obra_Id = listApu_Mano_Obra[0].Id;

                adpApu_Oferta_Mano_Obra.Insert(s, oApu_Oferta_Mano_Obra);

                adpApu_Oferta.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpApu_Oferta.Adapter.RollbackTransaction(); 
                throw (e);
            }
            return resultado;
        }
        #endregion

        #region Obtencion de Datos

        static public List<Apu_Oferta> GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
        {
            ParametrosGet parametrosGet;
            MetodosGet metodoGet;
            string filtroParaCEL;

            Filtrado.AnalizarExpresionDeFiltrado(s.Expresion_De_Filtrado, out parametrosGet, out metodoGet, out filtroParaCEL);

            s.Expresion_De_Filtrado = filtroParaCEL;
            List<Apu_Oferta> resultado;
            resultado = adpApu_Oferta.GetBySucursal(s,Codigo_Desde, Codigo_Hasta, Estado, Nombre,  Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre,Apu_Presupuesto_Estado);
            return resultado;
        }

        #endregion
    }
}
