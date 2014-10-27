using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER; 

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Poa
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
        public int Insert(Pla_Poa n)
        {            
            return Adapter.Pla_Poa_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Poa o)
        {            
            return Adapter.Pla_Poa_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Poa o, Pla_Poa n)
        {            
            return Adapter.Pla_Poa_Update(o, n);
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
		 // Insert_Con_Pla_Mov_SaldoInicialINT
				public int Pla_Poa_Insert_Con_Pla_Mov_SaldoInicialINT(Scope s , string Codigo, Int32 Pla_Tarea_Id, Int32 Pla_Partida_Id, Decimal Valor_Inicial, string Estado)
        {
			int res = 
				Adapter.Pla_Poa_Insert_Con_Pla_Mov_SaldoInicialINT(s,  Codigo, Pla_Tarea_Id, Pla_Partida_Id, Valor_Inicial, Estado);
            return res;
        }
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Poa n)
        {            
            return Adapter.Pla_Poa_InsertINT(n);
        }
		 // Update_Con_Pla_Mov_SaldoInicialINT
				public int Pla_Poa_Update_Con_Pla_Mov_SaldoInicialINT(Scope s , string Codigo, Int32 Pla_Tarea_Id, Int32 Pla_Partida_Id, string Estado, Int32 Original_Id, string Original_Codigo, Int32 Original_Pla_Tarea_Id, Int32 Original_Pla_Partida_Id, string Original_Estado, Int32 Id, Decimal Valor_Inicial)
        {
			int res = 
				Adapter.Pla_Poa_Update_Con_Pla_Mov_SaldoInicialINT(s,  Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado, Original_Id, Original_Codigo, Original_Pla_Tarea_Id, Original_Pla_Partida_Id, Original_Estado, Id, Valor_Inicial);
            return res;
        }
		#endregion
		#endregion
    }
}
