using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace FEL.VAR
{
    [DataObject]
    public class BO_V_INT_Area
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
        // Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Area> Get(Scope s)
        {
            List<V_INT_Area> lista = new List<V_INT_Area>(
                Adapter.V_INT_Area_Get(s));
            return lista;
        }
        // Select by Codigo
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<V_INT_Area> GetByCodigo(Scope s, string Codigo)
        {
            List<V_INT_Area> lista = new List<V_INT_Area>(
                Adapter.V_INT_Area_GetByCodigo(s,Codigo));
            return lista;
        }
        #endregion
    }
}
