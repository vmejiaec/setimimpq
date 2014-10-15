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
        public List<Pla_Cta> Get(Scope s)
        {
            List<Pla_Cta> lista = new List<Pla_Cta>(Adapter.Pla_Cta_Get(s));            
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
		public List<Pla_Cta> GetByAnio(Scope s , string p_Anio)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnio(s,  p_Anio));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioArbolPla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioArbolPla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioLikeCodigo(Scope s , string p_Anio, string p_Codigo)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioLikeCodigo(s,  p_Anio, p_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByAnioLikeNombre(s,  p_Anio, p_Nombre));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByLikeCodigo(Scope s , string p_Codigo)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByLikeCodigo(s,  p_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Cta> GetByLikeNombre(Scope s , string p_Nombre)
        {
			List<Pla_Cta> lista = new List<Pla_Cta>(
				Adapter.Pla_Cta_GetByLikeNombre(s,  p_Nombre));
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
}
