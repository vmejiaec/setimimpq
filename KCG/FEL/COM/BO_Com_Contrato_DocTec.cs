using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER; 

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato_DocTec
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
        public List<Com_Contrato_DocTec> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>(Adapter.Com_Contrato_DocTec_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_DocTec_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato_DocTec n)
        {            
            return Adapter.Com_Contrato_DocTec_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato_DocTec o)
        {            
            return Adapter.Com_Contrato_DocTec_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato_DocTec o, Com_Contrato_DocTec n)
        {            
            return Adapter.Com_Contrato_DocTec_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_DocTec> GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id, string sortExpression="")
        {
			List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>(
				Adapter.Com_Contrato_DocTec_GetByCom_Contrato_Id(s,  p_Com_Contrato_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_DocTec_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_DocTec> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>(
				Adapter.Com_Contrato_DocTec_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_DocTec_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato_DocTec n)
        {            
            return Adapter.Com_Contrato_DocTec_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_DocTec_Comparar : IComparer<Com_Contrato_DocTec>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_DocTec_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato_DocTec x, Com_Contrato_DocTec y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
              // System.Int32
                case "Com_Contrato_Id":
                    retVal =  x.Com_Contrato_Id - y.Com_Contrato_Id ;
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
				// System.String
                case "Tiene":
                    retVal =  string.Compare(x.Tiene, y.Tiene);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
