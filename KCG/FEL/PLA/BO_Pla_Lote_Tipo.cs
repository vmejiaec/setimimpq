using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Lote_Tipo
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
        public List<Pla_Lote_Tipo> Get(Scope s,string sortExpression="")
        {
            List<Pla_Lote_Tipo> lista = new List<Pla_Lote_Tipo>(Adapter.Pla_Lote_Tipo_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Lote_Tipo_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Lote_Tipo n)
        {            
            return Adapter.Pla_Lote_Tipo_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Lote_Tipo o)
        {            
            return Adapter.Pla_Lote_Tipo_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Lote_Tipo o, Pla_Lote_Tipo n)
        {            
            return Adapter.Pla_Lote_Tipo_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Lote_Tipo> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Lote_Tipo> lista = new List<Pla_Lote_Tipo>(
				Adapter.Pla_Lote_Tipo_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Lote_Tipo_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Lote_Tipo n)
        {            
            return Adapter.Pla_Lote_Tipo_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Lote_Tipo_Comparar : IComparer<Pla_Lote_Tipo>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Lote_Tipo_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Lote_Tipo x, Pla_Lote_Tipo y)
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
                case "Archivo_Tipo":
                    retVal =  string.Compare(x.Archivo_Tipo, y.Archivo_Tipo);
                    break;
				// System.String
                case "Clase":
                    retVal =  string.Compare(x.Clase, y.Clase);
                    break;
				// System.String
                case "Metodo":
                    retVal =  string.Compare(x.Metodo, y.Metodo);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
