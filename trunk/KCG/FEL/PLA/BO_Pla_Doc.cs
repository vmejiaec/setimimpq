using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_Doc
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
        public List<Pla_Doc> Get(Scope s)
        {
            List<Pla_Doc> lista = new List<Pla_Doc>(Adapter.Pla_Doc_Get(s));            
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_Doc n)
        {            
            return Adapter.Pla_Doc_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_Doc o)
        {            
            return Adapter.Pla_Doc_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_Doc o, Pla_Doc n)
        {            
            return Adapter.Pla_Doc_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByArea_Codigo_RangoFecha_Solicita(Scope s , string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByArea_Codigo_RangoFecha_Solicita(s,  p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByCodigo(Scope s , string p_Codigo)
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByCodigo(s,  p_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByRangoFecha_Solicita(Scope s , DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByRangoFecha_Solicita(s,  p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_Area_Codigo_RangoFecha_Solicita(Scope s , string p_Tipo, string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita(s,  p_Tipo, p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
    }
}
