using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Param
    {
        #region Adaptador
        private WS_PLA _Adapter;
        public WS_PLA Adapter
        {
            get {
                if (_Adapter == null) _Adapter = new WS_PLA();
                return _Adapter; }
        }
        #endregion
        #region Select
		// Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Pla_Param> Get(Scope s,string sortExpression="")
        {
            List<Pla_Param> lista = new List<Pla_Param>(Adapter.Pla_Param_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Param_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Param n)
        {            
            return Adapter.Pla_Param_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Param o)
        {            
            return Adapter.Pla_Param_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Param o, Pla_Param n)
        {            
            return Adapter.Pla_Param_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Param_Comparar : IComparer<Pla_Param>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Param_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Param x, Pla_Param y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Rep_Legal_Pie_Firma_Nombre":
                    retVal =  string.Compare(x.Rep_Legal_Pie_Firma_Nombre, y.Rep_Legal_Pie_Firma_Nombre);
                    break;
				// System.String
                case "Rep_Legal_Pie_Firma_Cargo":
                    retVal =  string.Compare(x.Rep_Legal_Pie_Firma_Cargo, y.Rep_Legal_Pie_Firma_Cargo);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
