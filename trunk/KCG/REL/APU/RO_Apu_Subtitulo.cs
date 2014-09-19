using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using AEL.APU;
using BEL;
using CEL.APU;

namespace REL.APU
{

    [DataObject]
    public class RO_Apu_Subtitulo
    {
        #region  Adapter

        private DO_Apu_Subtitulo _Adapter;

        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public DO_Apu_Subtitulo Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Subtitulo();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByTitulo(Scope s, string Apu_Titulo_Id)
        {
           
            return EntidadDT.GetDT(Adapter.GetByTitulo(s, Apu_Titulo_Id).ToArray());
        }

        #endregion
    }
}