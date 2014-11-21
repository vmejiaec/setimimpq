using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Mov
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
        public List<Pla_Mov> Get(Scope s,string sortExpression="")
        {
            List<Pla_Mov> lista = new List<Pla_Mov>(Adapter.Pla_Mov_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Mov_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Mov n)
        {            
            return Adapter.Pla_Mov_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Mov o)
        {            
            return Adapter.Pla_Mov_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Mov o, Pla_Mov n)
        {            
            return Adapter.Pla_Mov_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Mov> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Mov_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Mov> GetByPla_Doc_Id(Scope s , Int32 p_Pla_Doc_Id, string sortExpression="")
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetByPla_Doc_Id(s,  p_Pla_Doc_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Mov_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Mov> GetByPla_Poa_Id(Scope s , Int32 p_Pla_Poa_Id, string sortExpression="")
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetByPla_Poa_Id(s,  p_Pla_Poa_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Mov_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Mov n)
        {            
            return Adapter.Pla_Mov_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Mov_Comparar : IComparer<Pla_Mov>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Mov_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Mov x, Pla_Mov y)
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
              // System.Int32
                case "Pla_Poa_Id":
                    retVal =  x.Pla_Poa_Id - y.Pla_Poa_Id ;
                    break;
              // System.Int32
                case "Pla_Doc_Id":
                    retVal =  x.Pla_Doc_Id - y.Pla_Doc_Id ;
                    break;
              // System.Int32
                case "Orden":
                    retVal =  x.Orden - y.Orden ;
                    break;
				// System.String
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
				// System.String
                case "Tipo":
                    retVal =  string.Compare(x.Tipo, y.Tipo);
                    break;
              // System.Int32
                case "Pla_Tarea_Id":
                    retVal =  x.Pla_Tarea_Id - y.Pla_Tarea_Id ;
                    break;
				// System.String
                case "Pla_Tarea_Nombre":
                    retVal =  string.Compare(x.Pla_Tarea_Nombre, y.Pla_Tarea_Nombre);
                    break;
              // System.Int32
                case "Pla_Partida_Id":
                    retVal =  x.Pla_Partida_Id - y.Pla_Partida_Id ;
                    break;
				// System.String
                case "Pla_Partida_Codigo":
                    retVal =  string.Compare(x.Pla_Partida_Codigo, y.Pla_Partida_Codigo);
                    break;
				// System.String
                case "Pla_Partida_Nombre":
                    retVal =  string.Compare(x.Pla_Partida_Nombre, y.Pla_Partida_Nombre);
                    break;
				// System.String
                case "Pla_Doc_Tipo":
                    retVal =  string.Compare(x.Pla_Doc_Tipo, y.Pla_Doc_Tipo);
                    break;
			   // System.DateTime
                case "Pla_Doc_Fecha":
                    retVal =  DateTime.Compare(x.Pla_Doc_Fecha, y.Pla_Doc_Fecha);
                    break;
				// System.String
                case "Pla_Doc_Codigo":
                    retVal =  string.Compare(x.Pla_Doc_Codigo, y.Pla_Doc_Codigo);
                    break;
              // System.Int32
                case "Pla_Cta_Id":
                    retVal =  x.Pla_Cta_Id - y.Pla_Cta_Id ;
                    break;
				// System.String
                case "Pla_Cta_Codigo":
                    retVal =  string.Compare(x.Pla_Cta_Codigo, y.Pla_Cta_Codigo);
                    break;
				// System.String
                case "Pla_Cta_Nombre":
                    retVal =  string.Compare(x.Pla_Cta_Nombre, y.Pla_Cta_Nombre);
                    break;
				// System.String
                case "Pla_Tarea_Codigo":
                    retVal =  string.Compare(x.Pla_Tarea_Codigo, y.Pla_Tarea_Codigo);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
