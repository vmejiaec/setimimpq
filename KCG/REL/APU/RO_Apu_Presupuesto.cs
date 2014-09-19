using System.ComponentModel;
using System.Data;
using System.Collections.Generic;
using System.Text;
using BEL;
using CEL.APU;

namespace REL.APU
{
    [DataObject]
    public class RO_Apu_Presupuesto
    {
        #region Adapter
        private static DO_Apu_Presupuesto _Adapter;
        public static DO_Apu_Presupuesto Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Presupuesto();
                return _Adapter;
            }
        }
        #endregion

        #region Obtencion de Datos
        
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Get(s));
        }
        
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByOrigen(s, Apu_Origen_Id));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetByTipoOrigen(Scope s, string Apu_Tipo_Origen)
        {
            return EntidadDT.GetDT(Adapter.GetByTipoOrigen(s, Apu_Tipo_Origen));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetBySucursal(Scope s)
        {
            return EntidadDT.GetDT(Adapter.GetBySucursal(s));
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable GetById(Scope s, string Id,string Estado)
        {
            return EntidadDT.GetDT(Adapter.GetById(s, Id,Estado));
        }

        #endregion
    }

}
