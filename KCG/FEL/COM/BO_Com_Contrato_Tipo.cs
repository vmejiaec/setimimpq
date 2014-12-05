using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato_Tipo
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
        public List<Com_Contrato_Tipo> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>(Adapter.Com_Contrato_Tipo_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato_Tipo n)
        {            
            return Adapter.Com_Contrato_Tipo_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato_Tipo o)
        {            
            return Adapter.Com_Contrato_Tipo_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato_Tipo o, Com_Contrato_Tipo n)
        {            
            return Adapter.Com_Contrato_Tipo_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Tipo> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>(
				Adapter.Com_Contrato_Tipo_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Tipo> GetByLikeNombre(Scope s , string p_Nombre, string sortExpression="")
        {
			List<Com_Contrato_Tipo> lista = new List<Com_Contrato_Tipo>(
				Adapter.Com_Contrato_Tipo_GetByLikeNombre(s,  p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Tipo_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato_Tipo n)
        {            
            return Adapter.Com_Contrato_Tipo_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_Tipo_Comparar : IComparer<Com_Contrato_Tipo>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_Tipo_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato_Tipo x, Com_Contrato_Tipo y)
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
				// System.String
                case "URL_Plantilla_Word":
                    retVal =  string.Compare(x.URL_Plantilla_Word, y.URL_Plantilla_Word);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
