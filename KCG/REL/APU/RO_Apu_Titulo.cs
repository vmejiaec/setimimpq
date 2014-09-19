using System.ComponentModel;
using System.Data;
using BEL;
using CEL.APU;

namespace REL.APU
{

    [DataObject]
    public class RO_Apu_Titulo
    {
        #region  Adapter

        private DO_Apu_Titulo _Adapter;

        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public DO_Apu_Titulo Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Titulo();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Get(s).ToArray());
        }

        #endregion
    }
}