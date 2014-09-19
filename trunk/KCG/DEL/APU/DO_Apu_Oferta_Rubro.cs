using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using HER;

namespace DEL.APU
{
    public class DO_Apu_Oferta_Rubro
    {
        #region Adapters

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

        private static CEL.APU.DO_Apu_Rubro _adpApu_Rubro;
        private static CEL.APU.DO_Apu_Rubro adpApu_Rubro
        {
            get
            {
                if (_adpApu_Rubro == null)
                    _adpApu_Rubro = new CEL.APU.DO_Apu_Rubro();
                return _adpApu_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Subtitulo _adpApu_Subtitulo;
        private static CEL.APU.DO_Apu_Subtitulo adpApu_Subtitulo
        {
            get
            {
                if (_adpApu_Subtitulo == null)
                    _adpApu_Subtitulo = new CEL.APU.DO_Apu_Subtitulo();
                return _adpApu_Subtitulo;
            }
        }

        #endregion

        # region Operaciones

        //Metodo Insert 
        public static string Insert(Scope s, Apu_Oferta_Rubro oApu_Oferta_Rubro)
        {
            string resultado;
            try
            {
                adpApu_Oferta_Rubro.Adapter.BeginTransaction();
                adpApu_Subtitulo.Adapter.Transaction = adpApu_Oferta_Rubro.Adapter.Transaction;
                adpApu_Rubro.Adapter.Transaction = adpApu_Oferta_Rubro.Adapter.Transaction;

                if (string.IsNullOrEmpty(oApu_Oferta_Rubro.Apu_Rubro_Id) &&
                    !string.IsNullOrEmpty(oApu_Oferta_Rubro.Apu_Rubro_Nombre) &&
                    !string.IsNullOrEmpty(oApu_Oferta_Rubro.Apu_Rubro_Unidad))
                {
                   
                    List<Apu_Subtitulo> lstApuSubtitulo = adpApu_Subtitulo.GetByOnlyPredeterminadaOfertaRubro(s);

                    Apu_Rubro nuevoRubro = new Apu_Rubro();
                    nuevoRubro.Nombre = oApu_Oferta_Rubro.Apu_Rubro_Nombre;
                    nuevoRubro.Unidad = oApu_Oferta_Rubro.Apu_Rubro_Unidad;
                    nuevoRubro.Apu_Subtitulo_id = lstApuSubtitulo[0].Id;
                    nuevoRubro.Especial = "N";
                    nuevoRubro.Disponible = "S";

                    string nuevoRubroId = adpApu_Rubro.Insert(s, nuevoRubro);

                    oApu_Oferta_Rubro.Apu_Rubro_Id = nuevoRubroId;
                }
                resultado = adpApu_Oferta_Rubro.Insert(s, oApu_Oferta_Rubro);
                adpApu_Oferta_Rubro.Adapter.CommitTransaction();
               
            }
            catch (Exception e)
            {
                adpApu_Oferta_Rubro.Adapter.RollbackTransaction();
                throw (e);
            }

            return resultado;
        }

        #endregion
    }
}
