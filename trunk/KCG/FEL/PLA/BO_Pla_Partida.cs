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
        public List<Pla_Partida> Get(Scope s)
        {
            List<Pla_Partida> lista = new List<Pla_Partida>(Adapter.Pla_Partida_Get(s));            
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
		public List<Pla_Partida> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Partida> GetByLikeCodigo(Scope s , string p_Codigo)
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetByLikeCodigo(s,  p_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Partida> GetByLikeNombre(Scope s , string p_Nombre)
        {
			List<Pla_Partida> lista = new List<Pla_Partida>(
				Adapter.Pla_Partida_GetByLikeNombre(s,  p_Nombre));
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
}
