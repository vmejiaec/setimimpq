using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Cta
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
        public List<Pla_Cta> Get(Scope s,string sortExpression="")
        {
            List<Pla_Cta> lista = new List<Pla_Cta>(Adapter.Pla_Cta_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Cta n)
        {            
            return Adapter.Pla_Cta_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Cta o)
        {            
            return Adapter.Pla_Cta_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Cta o, Pla_Cta n)
        {            
            return Adapter.Pla_Cta_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnio(Scope s , string p_Anio, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnio(s,  p_Anio));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioArbolPla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioArbolPla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioArbolPla_Cta_Id(Scope s , Int32 p_Pla_Cta_Id, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioArbolPla_Cta_Id(s,  p_Pla_Cta_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioArbolPla_Tarea_Id(Scope s , Int32 p_Pla_Tarea_Id, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioArbolPla_Tarea_Id(s,  p_Pla_Tarea_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioLikeCodigo(Scope s , string p_Anio, string p_Codigo, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioLikeCodigo(s,  p_Anio, p_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioLikeNombre(s,  p_Anio, p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByLikeCodigo(Scope s , string p_Codigo, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByLikeCodigo(s,  p_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByLikeNombre(Scope s , string p_Nombre, string sortExpression="")
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByLikeNombre(s,  p_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Cta_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Cta n)
        {            
            return Adapter.Pla_Cta_InsertINT(n);
        }
		 // Max_FechaDTM
				public DateTime? Pla_Cta_Max_FechaDTM(Scope s , string p_Area_Solicita)
        {
			DateTime? res = 
				Adapter.Pla_Cta_Max_FechaDTM(s,  p_Area_Solicita);
            return res;
        }
		 // SelNoRegistrosINT
				public int Pla_Cta_SelNoRegistrosINT(Scope s , string p_Anio)
        {
			int res = 
				Adapter.Pla_Cta_SelNoRegistrosINT(s,  p_Anio);
            return res;
        }
		 // SelTareasSTR
				public string Pla_Cta_SelTareasSTR(Scope s , string p_Anio, Int32 p_Pla_Cta_Id, DateTime p_Fecha)
        {
			string res = 
				Adapter.Pla_Cta_SelTareasSTR(s,  p_Anio, p_Pla_Cta_Id, p_Fecha);
            return res;
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Cta_Comparar : IComparer<Pla_Cta>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Cta_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Cta x, Pla_Cta y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Anio":
                    retVal =  string.Compare(x.Anio, y.Anio);
                    break;
				// System.String
                case "Codigo":
                    retVal =  string.Compare(x.Codigo, y.Codigo);
                    break;
				// System.String
                case "Nivel":
                    retVal =  string.Compare(x.Nivel, y.Nivel);
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
				// System.String
                case "Descripcion":
                    retVal =  string.Compare(x.Descripcion, y.Descripcion);
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
