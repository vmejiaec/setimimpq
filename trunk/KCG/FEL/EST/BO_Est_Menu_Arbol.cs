using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Data;
using HER;

namespace FEL.EST
{
    [DataObject]
    public class BO_Est_Menu_Arbol
    {
        # region Adapter
        private WS_EST _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_EST Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_EST();
                return _Adapter;
            }
        }
        #endregion
        # region Obtencion de Datos
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Est_Menu_Arbol> Get(string sortExpression, Scope s)
        {
            List<Est_Menu_Arbol> lista = new List<Est_Menu_Arbol>(Adapter.Est_Menu_Arbol_Get(s));
            lista.Sort(new Est_Menu_Arbol_Comparar(sortExpression));
            return lista;
        }
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public DataTable Get(Scope s)
        {
            return EntidadDT.GetDT(Adapter.Est_Menu_Arbol_Get(s));
        }
        #endregion
        #region Ordenar la lista
        class Est_Menu_Arbol_Comparar : IComparer<Est_Menu_Arbol>
        {
            private string _sortColumn;
            private bool _reverse;
            public Est_Menu_Arbol_Comparar(string sortExpression)
            {
                _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
                if (_reverse)
                    _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
                else
                    _sortColumn = sortExpression;
            }
            public int Compare(Est_Menu_Arbol x, Est_Menu_Arbol y)
            {
                int retVal = 0;
                switch (_sortColumn)
                {
                    case "Id":
                        retVal = string.Compare(x.Id, y.Id);
                        break;
                    case "Padre_Id":
                        retVal = string.Compare(x.Padre_Id, y.Padre_Id);
                        break;
                    case "Etiqueta_Menu":
                        retVal = string.Compare(x.Etiqueta_Menu, y.Etiqueta_Menu);
                        break;
                    case "Contenedor":
                        retVal = string.Compare(x.Contenedor, y.Contenedor);
                        break;
                }
                return (retVal * (_reverse ? -1 : 1));
            }
        }
        #endregion
    }
}
