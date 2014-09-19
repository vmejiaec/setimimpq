using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.FIS;
using BEL;
using HER;

namespace DEL.FIS
{
    public class DO_Fis_Catalogo
    {

        #region Adapters

        private static CEL.FIS.DO_Fis_Catalogo _adpFis_Catalogo;
        private static CEL.FIS.DO_Fis_Catalogo adpFis_Catalogo
        {
            get
            {
                if (_adpFis_Catalogo == null)
                    _adpFis_Catalogo = new CEL.FIS.DO_Fis_Catalogo();
                return _adpFis_Catalogo;
            }
        }

        private static CEL.FIS.DO_Fis_Catalogo_Indice _adpFis_Catalogo_Indice;
        private static CEL.FIS.DO_Fis_Catalogo_Indice adpFis_Catalogo_Indice
        {
            get
            {
                if (_adpFis_Catalogo_Indice == null)
                    _adpFis_Catalogo_Indice = new CEL.FIS.DO_Fis_Catalogo_Indice();
                return _adpFis_Catalogo_Indice;
            }
        }

        private static CEL.FIS.DO_Fis_Catalogo_Mano_Obra _adpFis_Catalogo_Mano_Obra;
        private static CEL.FIS.DO_Fis_Catalogo_Mano_Obra adpFis_Catalogo_Mano_Obra
        {
            get
            {
                if (_adpFis_Catalogo_Mano_Obra == null)
                    _adpFis_Catalogo_Mano_Obra = new CEL.FIS.DO_Fis_Catalogo_Mano_Obra();
                return _adpFis_Catalogo_Mano_Obra;
            }
        }


        private static CEL.FIS.DO_Fis_Catalogo_Categoria _adpFis_Catalogo_Categoria;
        private static CEL.FIS.DO_Fis_Catalogo_Categoria adpFis_Catalogo_Categoria
        {
            get
            {
                if (_adpFis_Catalogo_Categoria == null)
                    _adpFis_Catalogo_Categoria = new CEL.FIS.DO_Fis_Catalogo_Categoria();
                return _adpFis_Catalogo_Categoria;
            }
        }
        #endregion
        #region Operaciones

        public static string Insert(Scope s, Fis_Catalogo oFis_Catalogo)
        {
            string Fis_Catalogo_Id, resultado1, resultado2, resultado3, Id = oFis_Catalogo.Id;

            try
            {
                adpFis_Catalogo.Adapter.BeginTransaction();
                adpFis_Catalogo_Indice.Adapter.Transaction = adpFis_Catalogo.Adapter.Transaction;
                adpFis_Catalogo_Categoria.Adapter.Transaction = adpFis_Catalogo.Adapter.Transaction;
                adpFis_Catalogo_Mano_Obra.Adapter.Transaction = adpFis_Catalogo.Adapter.Transaction;

                
                if (oFis_Catalogo.Id == null)
                {
                    Fis_Catalogo_Id = adpFis_Catalogo.Insert(s, oFis_Catalogo);
                }
                else
                {
                    // Inserta Fis_Catalogo
                    Fis_Catalogo_Id = adpFis_Catalogo.Insert(s, oFis_Catalogo);

                    List<Fis_Catalogo_Categoria> LstFis_Catalogo_Categoria = adpFis_Catalogo_Categoria.GetByCatalogoReporte(s,Id);
                    List<Fis_Catalogo_Indice> LstFis_Catalogo_Indice = adpFis_Catalogo_Indice.GetByCatalogoReporte(s,Id);
                    List<Fis_Catalogo_Mano_Obra> LstFis_Catalogo_Mano_Obra = adpFis_Catalogo_Mano_Obra.GetByCatalogoReporte(s,Id);


                    foreach (Fis_Catalogo_Indice oFis_Catalogo_Indice in LstFis_Catalogo_Indice)
                    {
                        Fis_Catalogo_Indice oFis_Cat_Ind = new Fis_Catalogo_Indice();

                        oFis_Cat_Ind.Estado = oFis_Catalogo_Indice.Estado;
                        oFis_Cat_Ind.Descripcion = oFis_Catalogo_Indice.Descripcion;
                        oFis_Cat_Ind.Fis_Catalogo_Id = Fis_Catalogo_Id;
                        oFis_Cat_Ind.Apu_Indice_Id = oFis_Catalogo_Indice.Apu_Indice_Id;
                        oFis_Cat_Ind.Valor = oFis_Catalogo_Indice.Valor;
                        resultado1 = adpFis_Catalogo_Indice.Insert(s, oFis_Cat_Ind);

                    }


                    foreach (Fis_Catalogo_Categoria oFis_Catalogo_Categoria in LstFis_Catalogo_Categoria)
                    {
                        Fis_Catalogo_Categoria oFis_Cat_Cat = new Fis_Catalogo_Categoria();

                        oFis_Cat_Cat.Estado = oFis_Catalogo_Categoria.Estado;
                        oFis_Cat_Cat.Descripcion = oFis_Catalogo_Categoria.Descripcion;
                        oFis_Cat_Cat.Fis_Catalogo_Id = Fis_Catalogo_Id;
                        oFis_Cat_Cat.Apu_Categoria_Id = oFis_Catalogo_Categoria.Apu_Categoria_Id;
                        oFis_Cat_Cat.Valor = oFis_Catalogo_Categoria.Valor;
                        resultado2 = adpFis_Catalogo_Categoria.Insert(s, oFis_Cat_Cat);

                    }

                    foreach (Fis_Catalogo_Mano_Obra oFis_Catalogo_Mano_Obra in LstFis_Catalogo_Mano_Obra)
                    {
                        Fis_Catalogo_Mano_Obra oFis_Cat_MO = new Fis_Catalogo_Mano_Obra();

                        oFis_Cat_MO.Estado = oFis_Catalogo_Mano_Obra.Estado;
                        oFis_Cat_MO.Descripcion = oFis_Catalogo_Mano_Obra.Descripcion;
                        oFis_Cat_MO.Fis_Catalogo_Id = Fis_Catalogo_Id;
                        oFis_Cat_MO.Apu_Categoria_Id = oFis_Catalogo_Mano_Obra.Apu_Categoria_Id;
                        oFis_Cat_MO.Apu_Mano_Obra_Id = oFis_Catalogo_Mano_Obra.Apu_Mano_Obra_Id;
                        oFis_Cat_MO.Valor = oFis_Catalogo_Mano_Obra.Valor;
                        resultado3 = adpFis_Catalogo_Mano_Obra.Insert(s, oFis_Cat_MO);
                    }
                }              
                adpFis_Catalogo.Adapter.CommitTransaction();
            
            }
            catch (Exception e)
            {
                adpFis_Catalogo.Adapter.RollbackTransaction(); 
                throw (e);
            }
            return Fis_Catalogo_Id;
        }
       
        #endregion
    }
}
