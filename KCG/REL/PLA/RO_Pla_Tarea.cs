using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CEL.PLA;
using System.ComponentModel;
using BEL;

namespace REL.PLA
{
    public class RO_Pla_Tarea
    {
        #region Adapter
        private static DO_Pla_Tarea _Adapter;
        public static DO_Pla_Tarea Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Pla_Tarea();
                return _Adapter;
            }
        }
        #endregion

        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Pla_Tarea> Get(Scope s, string p_Anio)
        {
            List<REL_Pla_Tarea> res = new List<REL_Pla_Tarea>();
            var lista = Adapter.GetByAnio(s,p_Anio);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Tarea(fila));
            }
            return res;
        }

        #endregion
    }
}
