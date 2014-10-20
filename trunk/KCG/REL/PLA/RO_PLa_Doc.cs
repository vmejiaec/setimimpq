using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using BEL;
using CEL.PLA;

namespace REL.PLA
{
    //[DataObject]
    public class RO_PLa_Doc
    {
        #region Adapter

        private static DO_Pla_Doc _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static DO_Pla_Doc Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Pla_Doc();
                return _Adapter;
            }
        }

        #endregion
        #region Obtención de datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]
        public static List<REL_Pla_Doc> Get(Scope s, int p_Id)
        {
            List<REL_Pla_Doc> res = new List<REL_Pla_Doc>();
            var lista = Adapter.GetById(s, p_Id);
            foreach (var fila in lista)
            {
                res.Add(new REL_Pla_Doc(fila));
            }
            return res;
        }

        #endregion
    }
}