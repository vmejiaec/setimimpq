
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using AEL.APU;
   using BEL;
   using CEL.APU;

namespace REL.APU
{

    [DataObject]
    public class RO_Apu_Rubro
    {
        #region  Adapter
        private static DO_Apu_Rubro _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public static DO_Apu_Rubro Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Apu_Rubro();
                return _Adapter;
            }
        }
        #endregion

        #region  Obtener datos para reportes
        // Retorna un data table de objetos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            return EntidadDT.GetDT(Adapter.GetByEmpresa(s,Int_Empresa_Id));
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public static DataTable GetByCodigo (Scope s ,string Apu_Rubro_Codigo)
        {
            return EntidadDT.GetDT(Adapter.GetByCodigo(s, Apu_Rubro_Codigo));
        }

        #endregion
    }
}