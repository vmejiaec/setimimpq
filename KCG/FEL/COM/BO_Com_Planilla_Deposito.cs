using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER; 

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Planilla_Deposito
    {
        #region Adaptador
        private WS_COM _Adapter;
        public WS_COM Adapter
        {
            get {
                if (_Adapter == null) _Adapter = new WS_COM();
                return _Adapter; }
        }
        #endregion
        #region Select
		// Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Com_Planilla_Deposito> Get(Scope s,string sortExpression="")
        {
            List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>(Adapter.Com_Planilla_Deposito_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Deposito_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Planilla_Deposito n)
        {            
            return Adapter.Com_Planilla_Deposito_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Planilla_Deposito o)
        {            
            return Adapter.Com_Planilla_Deposito_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Planilla_Deposito o, Com_Planilla_Deposito n)
        {            
            return Adapter.Com_Planilla_Deposito_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Planilla_Deposito> GetByFis_Planilla_Id(Scope s , string p_Fis_Planilla_Id, string sortExpression="")
        {
			List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>(
				Adapter.Com_Planilla_Deposito_GetByFis_Planilla_Id(s,  p_Fis_Planilla_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Deposito_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Planilla_Deposito> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Planilla_Deposito> lista = new List<Com_Planilla_Deposito>(
				Adapter.Com_Planilla_Deposito_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Deposito_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Planilla_Deposito n)
        {            
            return Adapter.Com_Planilla_Deposito_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Planilla_Deposito_Comparar : IComparer<Com_Planilla_Deposito>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Planilla_Deposito_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Planilla_Deposito x, Com_Planilla_Deposito y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Fis_Planilla_Id":
                    retVal =  string.Compare(x.Fis_Planilla_Id, y.Fis_Planilla_Id);
                    break;
				// System.String
                case "Codigo_Deposito":
                    retVal =  string.Compare(x.Codigo_Deposito, y.Codigo_Deposito);
                    break;
			   // System.DateTime
                case "Fecha_Deposito":
                    retVal =  DateTime.Compare(x.Fecha_Deposito, y.Fecha_Deposito);
                    break;
				// System.String
                case "Comprobante_Ctbl":
                    retVal =  string.Compare(x.Comprobante_Ctbl, y.Comprobante_Ctbl);
                    break;
				// System.String
                case "Descripcion":
                    retVal =  string.Compare(x.Descripcion, y.Descripcion);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
