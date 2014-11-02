using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Partida
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
        public List<Pla_Partida> Get(Scope s,string sortExpression="")
        {
            List<Pla_Partida> lista = new List<Pla_Partida>(Adapter.Pla_Partida_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Partida_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Partida n)
        {            
            return Adapter.Pla_Partida_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Partida o)
        {            
            return Adapter.Pla_Partida_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Partida o, Pla_Partida n)
        {            
            return Adapter.Pla_Partida_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Partida> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Partida_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Partida> GetByLikeCodigo(Scope s , string p_Codigo, string sortExpression="")
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetByLikeCodigo(s,  p_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Partida_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Partida> GetByLikeNombre(Scope s , string p_Nombre, string sortExpression="")
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetByLikeNombre(s,  p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Partida_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Partida n)
        {            
            return Adapter.Pla_Partida_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Partida_Comparar : IComparer<Pla_Partida>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Partida_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Partida x, Pla_Partida y)
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
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
