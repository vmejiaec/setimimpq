using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato_Tipo_Marca
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
        public List<Com_Contrato_Tipo_Marca> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>(Adapter.Com_Contrato_Tipo_Marca_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Marca_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato_Tipo_Marca n)
        {            
            return Adapter.Com_Contrato_Tipo_Marca_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato_Tipo_Marca o)
        {            
            return Adapter.Com_Contrato_Tipo_Marca_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato_Tipo_Marca o, Com_Contrato_Tipo_Marca n)
        {            
            return Adapter.Com_Contrato_Tipo_Marca_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Tipo_Marca> GetByCom_Contrato_Tipo_Id(Scope s , Int32 p_Com_Contrato_Tipo_Id, string sortExpression="")
        {
			List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>(
				Adapter.Com_Contrato_Tipo_Marca_GetByCom_Contrato_Tipo_Id(s,  p_Com_Contrato_Tipo_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Marca_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Tipo_Marca> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato_Tipo_Marca> lista = new List<Com_Contrato_Tipo_Marca>(
				Adapter.Com_Contrato_Tipo_Marca_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Marca_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // DelByCom_Contrato_Tipo_IdINT
				public int Com_Contrato_Tipo_Marca_DelByCom_Contrato_Tipo_IdINT(Scope s , Int32 p_Com_Contrato_Tipo_Id)
        {
			int res = 
				Adapter.Com_Contrato_Tipo_Marca_DelByCom_Contrato_Tipo_IdINT(s,  p_Com_Contrato_Tipo_Id);
            return res;
        }
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato_Tipo_Marca n)
        {            
            return Adapter.Com_Contrato_Tipo_Marca_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_Tipo_Marca_Comparar : IComparer<Com_Contrato_Tipo_Marca>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_Tipo_Marca_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato_Tipo_Marca x, Com_Contrato_Tipo_Marca y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
              // System.Int32
                case "Com_Contrato_Tipo_Id":
                    retVal =  x.Com_Contrato_Tipo_Id - y.Com_Contrato_Tipo_Id ;
                    break;
				// System.String
                case "Origen":
                    retVal =  string.Compare(x.Origen, y.Origen);
                    break;
				// System.String
                case "Descripcion":
                    retVal =  string.Compare(x.Descripcion, y.Descripcion);
                    break;
				// System.String
                case "Com_Contrato_Tipo_Nombre":
                    retVal =  string.Compare(x.Com_Contrato_Tipo_Nombre, y.Com_Contrato_Tipo_Nombre);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
