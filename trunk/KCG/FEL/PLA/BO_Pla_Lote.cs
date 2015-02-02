using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Lote
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
        public List<Pla_Lote> Get(Scope s,string sortExpression="")
        {
            List<Pla_Lote> lista = new List<Pla_Lote>(Adapter.Pla_Lote_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Lote_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Lote n)
        {            
            return Adapter.Pla_Lote_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Lote o)
        {            
            return Adapter.Pla_Lote_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Lote o, Pla_Lote n)
        {            
            return Adapter.Pla_Lote_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Lote> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Lote> lista = new List<Pla_Lote>(
				Adapter.Pla_Lote_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Lote_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Lote> GetByPla_Lote_Tipo_Id(Scope s , Int32 p_Pla_Lote_Tipo_Id, string sortExpression="")
        {
			List<Pla_Lote> lista = new List<Pla_Lote>(
				Adapter.Pla_Lote_GetByPla_Lote_Tipo_Id(s,  p_Pla_Lote_Tipo_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Lote_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Lote n)
        {            
            return Adapter.Pla_Lote_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Lote_Comparar : IComparer<Pla_Lote>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Lote_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Lote x, Pla_Lote y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Codigo":
                    retVal =  string.Compare(x.Codigo, y.Codigo);
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
				// System.String
                case "URL_Archivo_IN":
                    retVal =  string.Compare(x.URL_Archivo_IN, y.URL_Archivo_IN);
                    break;
              // System.Int32
                case "Pla_Lote_Tipo_Id":
                    retVal =  x.Pla_Lote_Tipo_Id - y.Pla_Lote_Tipo_Id ;
                    break;
				// System.String
                case "Resultado":
                    retVal =  string.Compare(x.Resultado, y.Resultado);
                    break;
				// System.String
                case "URL_Archivo_OUT":
                    retVal =  string.Compare(x.URL_Archivo_OUT, y.URL_Archivo_OUT);
                    break;
				// System.String
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
			   // System.DateTime
                case "Lote_Fecha":
                    retVal =  DateTime.Compare(x.Lote_Fecha, y.Lote_Fecha);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
