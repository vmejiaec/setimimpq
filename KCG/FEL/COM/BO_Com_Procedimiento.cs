using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Procedimiento
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
        public List<Com_Procedimiento> Get(Scope s,string sortExpression="")
        {
            List<Com_Procedimiento> lista = new List<Com_Procedimiento>(Adapter.Com_Procedimiento_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Procedimiento_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Procedimiento n)
        {            
            return Adapter.Com_Procedimiento_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Procedimiento o)
        {            
            return Adapter.Com_Procedimiento_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Procedimiento o, Com_Procedimiento n)
        {            
            return Adapter.Com_Procedimiento_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Procedimiento> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>(
				Adapter.Com_Procedimiento_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Procedimiento> GetByLikeNombre(Scope s , string p_Nombre, string sortExpression="")
        {
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>(
				Adapter.Com_Procedimiento_GetByLikeNombre(s,  p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Procedimiento> GetByLikeValor(Scope s , Decimal p_Valor, string sortExpression="")
        {
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>(
				Adapter.Com_Procedimiento_GetByLikeValor(s,  p_Valor));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Procedimiento n)
        {            
            return Adapter.Com_Procedimiento_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Procedimiento_Comparar : IComparer<Com_Procedimiento>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Procedimiento_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Procedimiento x, Com_Procedimiento y)
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
                case "Tipo":
                    retVal =  string.Compare(x.Tipo, y.Tipo);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
