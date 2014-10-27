using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using BEL;
using CEL.PLA;

namespace REL.PLA
{
    public class RO_Pla_Mov
    {
        #region Adapter
        private static DO_Pla_Mov _Adapter;
        public static DO_Pla_Mov Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Pla_Mov();
                return _Adapter;
            }
        }
        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Pla_Mov> Get(Scope s)
        {
            List<REL_Pla_Mov> res = new List<REL_Pla_Mov>();
            var lista = Adapter.Get(s);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Mov(fila));
            }
            return res;
        }

        #endregion
    }
}
