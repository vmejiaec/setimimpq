using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Tarea
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
        public List<Pla_Tarea> Get(Scope s,string sortExpression="")
        {
            List<Pla_Tarea> lista = new List<Pla_Tarea>(Adapter.Pla_Tarea_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Tarea n)
        {            
            return Adapter.Pla_Tarea_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Tarea o)
        {            
            return Adapter.Pla_Tarea_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Tarea o, Pla_Tarea n)
        {            
            return Adapter.Pla_Tarea_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByAnio(Scope s , string p_Anio, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnio(s,  p_Anio));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnioLikeNombre(s,  p_Anio, p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByAnioLikePla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnioLikePla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByPla_Cta_Id(Scope s , Int32 p_Pla_Cta_Id, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByPla_Cta_Id(s,  p_Pla_Cta_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByPla_Cta_IdLikeNombre(Scope s , Int32 p_Pla_Cta_Id, string p_Nombre, string sortExpression="")
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByPla_Cta_IdLikeNombre(s,  p_Pla_Cta_Id, p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Tarea_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Tarea n)
        {            
            return Adapter.Pla_Tarea_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Tarea_Comparar : IComparer<Pla_Tarea>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Tarea_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Tarea x, Pla_Tarea y)
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
                case "Pla_Cta_Nivel":
                    retVal =  string.Compare(x.Pla_Cta_Nivel, y.Pla_Cta_Nivel);
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
			   // System.DateTime
                case "Fecha_Ini":
                    retVal =  DateTime.Compare(x.Fecha_Ini, y.Fecha_Ini);
                    break;
			   // System.DateTime
                case "Fecha_Fin":
                    retVal =  DateTime.Compare(x.Fecha_Fin, y.Fecha_Fin);
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
