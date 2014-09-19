using System;
using System.Collections.Generic;
using System.Text;
using BEL;
using AEL.APU;

namespace DEL.APU
{
    public class DO_Apu_Material
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Material _adpApu_Material;
        private static CEL.APU.DO_Apu_Material adpApu_Material
        {
            get
            {
                if (_adpApu_Material == null)
                    _adpApu_Material = new CEL.APU.DO_Apu_Material();
                return _adpApu_Material;
            }
        }
        #endregion

        #region Operaciones
        public static string Insert(Scope s, Apu_Material o)
        {
            // Inserto los objetos
            string resultado;
            DO_Apu_Material dMat = new DO_Apu_Material();
            CEL.APU.DO_Apu_Secuencia dSec = new CEL.APU.DO_Apu_Secuencia();
            List<Apu_Material> lstMats = new List<Apu_Material>();
            try
            {
                if (o.Disponible == "S")
                    resultado = adpApu_Material.Insert(s, o);
                else
                {
                    String sNombre = o.Nombre + " .";
                    lstMats = adpApu_Material.GetByNombre(s, sNombre, s.Int_Sucursal_Id);
                    if (lstMats.Count > 0)
                    {
                        resultado = lstMats[0].Id;
                    }
                    else
                    {
                        List<APU_Secuencia> lstSecs = new List<APU_Secuencia>();
                        lstSecs = dSec.Get(s, "APU_Material");
                        o.Codigo = lstSecs[0].Secuencia;
                        o.Nombre = sNombre;
                        resultado = adpApu_Material.Insert(s, o);
                    }
                }
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
