using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace FEL.VAR
{
    [DataObject]
    public class BO_Com_Contrato_Info
    {
        #region Adaptador
        private WS_VAR _Adapter;
        public WS_VAR Adapter
        {
            get
            {
                if (_Adapter == null) _Adapter = new WS_VAR();
                return _Adapter;
            }
        }
        #endregion

        // Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<DO_Com_Contrato_Info> GetByCom_Contrato_Id(int p_Com_Contrato_Id)
        {
            List<DO_Com_Contrato_Info> lista = new List<DO_Com_Contrato_Info>(
                Adapter.Com_Contrato_Info_GetByCom_Contrato_Id(p_Com_Contrato_Id));
            return lista;
        }
        
        //Obtiene los campos disponible para Contrato_Info
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<DO_Com_Contrato_Info> GetCampos()
        {
            List<DO_Com_Contrato_Info> lista = new List<DO_Com_Contrato_Info>(
                Adapter.Com_Contrato_Infor_GetCampos());
            return lista;
        }
    }
}
