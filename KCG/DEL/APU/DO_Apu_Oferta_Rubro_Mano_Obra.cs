using System;
using System.Collections.Generic;
using System.Text;
using AEL.APU;
using BEL;

namespace DEL.APU
{
    public class DO_Apu_Oferta_Rubro_Mano_Obra
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
        private static CEL.APU.DO_Apu_Oferta_Mano_Obra _adpApu_Oferta_Mano_Obra;
        private static CEL.APU.DO_Apu_Oferta_Mano_Obra adpApu_Oferta_Mano_Obra
        {
            get
            {
                if (_adpApu_Oferta_Mano_Obra == null)
                    _adpApu_Oferta_Mano_Obra =
                        new CEL.APU.DO_Apu_Oferta_Mano_Obra();
                return _adpApu_Oferta_Mano_Obra;
            }
        }
        private static CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra _adpApu_Oferta_Rubro_Mano_Obra;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra adpApu_Oferta_Rubro_Mano_Obra
        {
            get
            {
                if (_adpApu_Oferta_Rubro_Mano_Obra == null)
                    _adpApu_Oferta_Rubro_Mano_Obra =
                        new CEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra();
                return _adpApu_Oferta_Rubro_Mano_Obra;
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

        #endregion

        #region Operaciones
        
        public static string Insert(Scope s, Apu_Oferta_Rubro_Mano_Obra oApu_Oferta_Rubro_Mano_Obra)
        {
            string resultado;
            try
            {
                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.BeginTransaction();
                //adpApu_Oferta_Mano_Obra.Adapter.Transaction = adpApu_Oferta_Rubro_Mano_Obra.Adapter.Transaction;

                // Consulta si debe añadir la mano de obra a la Oferta
                List<Apu_Mano_Obra> listApu_Mano_Obra =
                    adpApu_Mano_Obra.GetByOfertaRubroManoObra(
                        s,
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Rubro_Id,
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id);

                // Inserta la mano de obra a la Oferta
                if (listApu_Mano_Obra.Count == 1)
                {
                    // Consultar en parámetros el índice de mano de obra
                    List<Apu_Parametros> listaApu_Parametros =
                        adpApu_Parametros.GetBySucursal(
                            s);
                    // Inserta la mano de obra
                    Apu_Oferta_Mano_Obra oApu_Oferta_Mano_Obra =
                        new Apu_Oferta_Mano_Obra();
                    oApu_Oferta_Mano_Obra.Apu_Indice_Id =
                        listaApu_Parametros[0].ManoObra_Apu_Indice_Id;
                    oApu_Oferta_Mano_Obra.Apu_Mano_Obra_Id =
                        listApu_Mano_Obra[0].Id;
                    oApu_Oferta_Mano_Obra.Apu_Oferta_Id =
                        oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Id;
                    oApu_Oferta_Mano_Obra.Apu_Categoria_Id =
                        listApu_Mano_Obra[0].Apu_Categoria_Id;
                    oApu_Oferta_Mano_Obra.Costo_Diario = listApu_Mano_Obra[0].Costo_Diario;
                    adpApu_Oferta_Mano_Obra.
                        Insert(s, oApu_Oferta_Mano_Obra);
                }
                // Inserta la mano de obra en el rubro de la Oferta

                resultado = adpApu_Oferta_Rubro_Mano_Obra.
                    Insert(s, oApu_Oferta_Rubro_Mano_Obra);

                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.CommitTransaction();  
            }catch(Exception e)
            {
                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.RollbackTransaction();
                throw (e);
            }
            
            return resultado;
        }

        public static int Delete(Scope s, Apu_Oferta_Rubro_Mano_Obra oApu_Oferta_Rubro_Mano_Obra)
        {
            // Borra la mano de obra del rubro
            int resultado;
            try
            {
                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.BeginTransaction();
                //adpApu_Oferta_Mano_Obra.Adapter.Transaction = adpApu_Oferta_Rubro_Mano_Obra.Adapter.Transaction;
 
                resultado = adpApu_Oferta_Rubro_Mano_Obra.
                Delete(s, oApu_Oferta_Rubro_Mano_Obra);

                // Compara la mano de obra con el parámetro
                List<Apu_Parametros> listApu_Parametros = adpApu_Parametros.GetBySucursal(s);

                if (oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id != listApu_Parametros[0].Apu_Mano_Obra_Id)
                {
                    // Consulta si existe la mano de obra
                    int existeManoObra = adpApu_Oferta_Rubro_Mano_Obra.ExisteManoObra(s,
                                     oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id,
                                     oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Rubro_Id);

                    // La mano de obra no esta en ningun rubro de la Oferta
                    if (existeManoObra == 0)
                    {
                       
                        List<Apu_Oferta_Mano_Obra> listApu_Oferta_Mano_Obra =
                            adpApu_Oferta_Mano_Obra.GetByOfertaManoObra(
                                s,
                                oApu_Oferta_Rubro_Mano_Obra.Apu_Oferta_Id,
                                oApu_Oferta_Rubro_Mano_Obra.Apu_Mano_Obra_Id);

                        // Borra la referencia de la mano de obra de la Oferta
                        adpApu_Oferta_Mano_Obra.Delete( s,listApu_Oferta_Mano_Obra[0]);
                    }
                }
                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.CommitTransaction();
            }catch(Exception e)
            {
                //adpApu_Oferta_Rubro_Mano_Obra.Adapter.RollbackTransaction();
                throw (e);

            }
            
            return resultado;
        }
        #endregion
    }
}
