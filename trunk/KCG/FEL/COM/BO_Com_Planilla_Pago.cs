using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Planilla_Pago
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
        public List<Com_Planilla_Pago> Get(Scope s,string sortExpression="")
        {
            List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>(Adapter.Com_Planilla_Pago_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Pago_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Planilla_Pago n)
        {            
            return Adapter.Com_Planilla_Pago_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Planilla_Pago o)
        {            
            return Adapter.Com_Planilla_Pago_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Planilla_Pago o, Com_Planilla_Pago n)
        {            
            return Adapter.Com_Planilla_Pago_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Planilla_Pago> GetByFis_Planilla_Id(Scope s , string p_Fis_Planilla_Id, string sortExpression="")
        {
			List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>(
				Adapter.Com_Planilla_Pago_GetByFis_Planilla_Id(s,  p_Fis_Planilla_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Pago_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Planilla_Pago> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Planilla_Pago> lista = new List<Com_Planilla_Pago>(
				Adapter.Com_Planilla_Pago_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Planilla_Pago_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Planilla_Pago n)
        {            
            return Adapter.Com_Planilla_Pago_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Planilla_Pago_Comparar : IComparer<Com_Planilla_Pago>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Planilla_Pago_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Planilla_Pago x, Com_Planilla_Pago y)
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
			   // System.DateTime
                case "Fecha_Pago":
                    retVal =  DateTime.Compare(x.Fecha_Pago, y.Fecha_Pago);
                    break;
				// System.String
                case "Comprobante_Pago":
                    retVal =  string.Compare(x.Comprobante_Pago, y.Comprobante_Pago);
                    break;
				// System.String
                case "Factura_Memo_Pago":
                    retVal =  string.Compare(x.Factura_Memo_Pago, y.Factura_Memo_Pago);
                    break;
			   // System.DateTime
                case "Fecha_Pago_Confirmada":
                    retVal =  DateTime.Compare(x.Fecha_Pago_Confirmada, y.Fecha_Pago_Confirmada);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
