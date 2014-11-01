using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Procedimiento
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
        public List<Pla_Procedimiento> Get(Scope s,string sortExpression="")
        {
            List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>(Adapter.Pla_Procedimiento_Get(s));
			lista.Sort(new Pla_Procedimiento_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Procedimiento n)
        {            
            return Adapter.Pla_Procedimiento_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Procedimiento o)
        {            
            return Adapter.Pla_Procedimiento_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Procedimiento o, Pla_Procedimiento n)
        {            
            return Adapter.Pla_Procedimiento_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Procedimiento> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>(
				Adapter.Pla_Procedimiento_GetById(s,  p_Id));
			lista.Sort(new Pla_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Procedimiento> GetByLikeNombre(Scope s , string p_Nombre, string sortExpression="")
        {
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>(
				Adapter.Pla_Procedimiento_GetByLikeNombre(s,  p_Nombre));
			lista.Sort(new Pla_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Procedimiento> GetByLikeValor(Scope s , Decimal p_Valor, string sortExpression="")
        {
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>(
				Adapter.Pla_Procedimiento_GetByLikeValor(s,  p_Valor));
			lista.Sort(new Pla_Procedimiento_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Procedimiento n)
        {            
            return Adapter.Pla_Procedimiento_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Procedimiento_Comparar : IComparer<Pla_Procedimiento>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Procedimiento_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Procedimiento x, Pla_Procedimiento y)
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
