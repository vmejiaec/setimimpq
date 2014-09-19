
using System.ComponentModel;
using System.Data;
using BEL;
using System.Collections.Generic;

namespace REL.INT
{
    public class RO_Int_Empresa
    {
        #region Adapter
        private CEL.INT.DO_Int_Empresa _adapter;
        public CEL.INT.DO_Int_Empresa adapter
        {
            get
            {
                if (_adapter == null)
                    _adapter = new CEL.INT.DO_Int_Empresa();
                return _adapter;
            }
        }
        #endregion

        #region Extraer datos
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id)
        {
            return EntidadDT.GetDT(adapter.GetById(s, Id));
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<AEL.INT.Int_Empresa> GetById_(Scope s, string Id)
        {
            return adapter.GetById(s, Id);
        }
        #endregion
    }
}
