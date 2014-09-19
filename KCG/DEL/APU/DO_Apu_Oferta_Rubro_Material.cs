using System;
using System.Collections.Generic;
using AEL.APU;
using BEL;

namespace DEL.APU
{
    public class DO_Apu_Oferta_Rubro_Material
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
        private static CEL.APU.DO_Apu_Oferta_Material _adpApu_Oferta_Material;
        private static CEL.APU.DO_Apu_Oferta_Material adpApu_Oferta_Material
        {
            get
            {
                if(_adpApu_Oferta_Material==null)
                    _adpApu_Oferta_Material = 
                        new CEL.APU.DO_Apu_Oferta_Material();
                return _adpApu_Oferta_Material;
            }
        }
        private static CEL.APU.DO_Apu_Oferta_Rubro_Material _adpApu_Oferta_Rubro_Material;
        private static CEL.APU.DO_Apu_Oferta_Rubro_Material adpApu_Oferta_Rubro_Material
        {
            get
            {
                if (_adpApu_Oferta_Rubro_Material == null)
                    _adpApu_Oferta_Rubro_Material =
                        new CEL.APU.DO_Apu_Oferta_Rubro_Material();
                return _adpApu_Oferta_Rubro_Material;
            }
        }
        #endregion

        #region Operaciones

        public static string Insert(Scope s, Apu_Oferta_Rubro_Material oApu_Oferta_Rubro_Material)
        {
            string resultado;
            try
            {
                //adpApu_Oferta_Rubro_Material.Adapter.BeginTransaction();
                //adpApu_Oferta_Material.Adapter.Transaction = adpApu_Oferta_Rubro_Material.Adapter.Transaction;
               
                // Averigua si debe añadir el material a la oferta
            List<Apu_Material> listApu_Material = adpApu_Material.
                GetByOfertaRubroMaterial( 
                    s,
                    oApu_Oferta_Rubro_Material.Apu_Oferta_Rubro_Id,
                    oApu_Oferta_Rubro_Material.Apu_Material_Id);
            if(listApu_Material.Count==1)
            {
                adpApu_Oferta_Material.
                    Insert(s, 
                        APU_Factory.Make_Apu_Oferta_Material(oApu_Oferta_Rubro_Material));
            }
            // Inserta el material en el rubro de la oferta
            
            resultado = adpApu_Oferta_Rubro_Material.
                Insert(s, oApu_Oferta_Rubro_Material);

            //adpApu_Oferta_Rubro_Material.Adapter.CommitTransaction();     
            }catch(Exception e)
            {
                //adpApu_Oferta_Rubro_Material.Adapter.RollbackTransaction();
                throw (e);
                
            }
            
            return resultado;
        }

        public static int Delete(Scope s, Apu_Oferta_Rubro_Material oApu_Oferta_Rubro_Material)
        {

            // Borra el material del rubro de la oferta
            int resultado;
            try
            {
                //adpApu_Oferta_Rubro_Material.Adapter.BeginTransaction();
                //adpApu_Oferta_Material.Adapter.Transaction = adpApu_Oferta_Rubro_Material.Adapter.Transaction;

                resultado = adpApu_Oferta_Rubro_Material.
                Delete(s, oApu_Oferta_Rubro_Material);
                // Averigua si debe borrar de la oferta
                int existeMaterial = adpApu_Oferta_Rubro_Material.
                ExisteMaterial(s,
                           oApu_Oferta_Rubro_Material.Apu_Material_Id,
                           oApu_Oferta_Rubro_Material.Apu_Oferta_Rubro_Id);
                if(existeMaterial==0)
                {
                List<Apu_Oferta_Material> listApu_Oferta_Material =
                    
                adpApu_Oferta_Material.GetByOfertaMaterial
                                (s, 
                                 oApu_Oferta_Rubro_Material.Apu_Oferta_Id,
                                 oApu_Oferta_Rubro_Material.Apu_Material_Id);
                if (listApu_Oferta_Material.Count == 1)
                adpApu_Oferta_Material.
                    Delete(s, listApu_Oferta_Material[0]);
                }
                //adpApu_Oferta_Rubro_Material.Adapter.CommitTransaction();   
            }catch(Exception e)
            {
                //adpApu_Oferta_Rubro_Material.Adapter.RollbackTransaction();
                throw (e);

            }
            
            return resultado;
        }
        #endregion
    }

    
}
