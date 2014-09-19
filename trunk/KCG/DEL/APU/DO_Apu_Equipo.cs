using System;
using System.Collections.Generic;
using System.Text;
using AEL.APU;
using BEL;

namespace DEL.APU
{
    public class DO_Apu_Equipo
    {
        #region Adapters
        private static CEL.APU.DO_Apu_Equipo _adpApu_Equipo;
        private static CEL.APU.DO_Apu_Equipo adpApu_Equipo
        {
            get
            {
                if (_adpApu_Equipo == null)
                    _adpApu_Equipo = new CEL.APU.DO_Apu_Equipo();
                return _adpApu_Equipo;
            }
        }
        #endregion

        #region Operaciones
        public static string Insert(Scope s, Apu_Equipo o)
        {
            // Inserto los objetos
            string resultado;
            DO_Apu_Equipo dEqu = new DO_Apu_Equipo();
            CEL.APU.DO_Apu_Secuencia dSec = new CEL.APU.DO_Apu_Secuencia();
            List<Apu_Equipo> lstEqus = new List<Apu_Equipo>();
            try
            {
                if (o.Disponible == "S")
                    resultado = adpApu_Equipo.Insert(s, o);
                else
                {
                    String sNombre = o.Nombre + " .";
                    lstEqus = adpApu_Equipo.GetByNombre(s, sNombre, s.Int_Sucursal_Id);
                    if (lstEqus.Count > 0)
                    {
                        resultado = lstEqus[0].Id;
                    }
                    else
                    {
                        List<APU_Secuencia> lstSecs = new List<APU_Secuencia>();
                        lstSecs = dSec.Get(s, "APU_Equipo");
                        o.Codigo = lstSecs[0].Secuencia;
                        o.Nombre = sNombre;
                        resultado = adpApu_Equipo.Insert(s, o);
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
