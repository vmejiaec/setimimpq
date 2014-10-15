﻿using System;
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
        public List<Pla_Tarea> Get(Scope s)
        {
            List<Pla_Tarea> lista = new List<Pla_Tarea>(Adapter.Pla_Tarea_Get(s));            
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
		public List<Pla_Tarea> GetByAnio(Scope s , string p_Anio)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnio(s,  p_Anio));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnioLikeNombre(s,  p_Anio, p_Nombre));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByAnioLikePla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByAnioLikePla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetById(Scope s , Int32 p_Id)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetById(s,  p_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByPla_Cta_Id(Scope s , Int32 p_Pla_Cta_Id)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByPla_Cta_Id(s,  p_Pla_Cta_Id));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Tarea> GetByPla_Cta_IdLikeNombre(Scope s , Int32 p_Pla_Cta_Id, string p_Nombre)
        {
			List<Pla_Tarea> lista = new List<Pla_Tarea>(
				Adapter.Pla_Tarea_GetByPla_Cta_IdLikeNombre(s,  p_Pla_Cta_Id, p_Nombre));
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
}