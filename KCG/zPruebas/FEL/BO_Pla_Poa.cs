using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public class BO_Pla_Poa
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
        public List<Pla_Poa> Get(Scope s)
        {
            List<Pla_Poa> lista = new List<Pla_Poa>(Adapter.Pla_Poa_Get(s));            
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Scope s, Pla_Poa n)
        {            
            return Adapter.Pla_Poa_Insert(s, n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Scope s, Pla_Poa o)
        {            
            return Adapter.Pla_Poa_Delete(s, o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Scope s, Pla_Poa o, Pla_Poa n)
        {            
            return Adapter.Pla_Poa_Update(s, o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetByPla_Partida_Id(Scope s , Int32 p_Pla_Partida_Id)
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetByPla_Partida_Id(s,  p_Pla_Partida_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetByPla_Tarea_Id(Scope s , Int32 p_Pla_Tarea_Id)
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetByPla_Tarea_Id(s,  p_Pla_Tarea_Id));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
    }
}
