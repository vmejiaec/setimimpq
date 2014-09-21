using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public class BO_Pla_Mov
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
        public List<Pla_Mov> Get(Scope s)
        {
            List<Pla_Mov> lista = new List<Pla_Mov>(Adapter.Pla_Mov_Get(s));            
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
		public List<Pla_Mov> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Mov> GetByPla_Doc_Id(Scope s , Int32 p_Pla_Doc_Id)
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetByPla_Doc_Id(s,  p_Pla_Doc_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Mov> GetByPla_Poa_Id(Scope s , Int32 p_Pla_Poa_Id)
        {
			List<Pla_Mov> lista = new List<Pla_Mov>(
				Adapter.Pla_Mov_GetByPla_Poa_Id(s,  p_Pla_Poa_Id));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
    }
}
