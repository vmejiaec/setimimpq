﻿using System;
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
        public List<Pla_Poa> Get(Scope s,string sortExpression="")
        {
            List<Pla_Poa> lista = new List<Pla_Poa>(Adapter.Pla_Poa_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Poa_Comparar(sortExpression));
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
		public List<Pla_Poa> GetByAnio(Scope s , string p_Anio, string sortExpression="")
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetByAnio(s,  p_Anio));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Poa_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Poa_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetByPla_Partida_Id(Scope s , Int32 p_Pla_Partida_Id, string sortExpression="")
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetByPla_Partida_Id(s,  p_Pla_Partida_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Poa_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Poa> GetByPla_Tarea_Id(Scope s , Int32 p_Pla_Tarea_Id, string sortExpression="")
        {
			List<Pla_Poa> lista = new List<Pla_Poa>(
				Adapter.Pla_Poa_GetByPla_Tarea_Id(s,  p_Pla_Tarea_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_Poa_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // Delete_Con_Pla_Mov_y_Pla_DocINT
				public int Pla_Poa_Delete_Con_Pla_Mov_y_Pla_DocINT(Scope s , Int32 Original_Id, string Original_Codigo, Int32 Original_Pla_Tarea_Id, Int32 Original_Pla_Partida_Id, string Original_Estado)
        {
			int res = 
				Adapter.Pla_Poa_Delete_Con_Pla_Mov_y_Pla_DocINT(s,  Original_Id, Original_Codigo, Original_Pla_Tarea_Id, Original_Pla_Partida_Id, Original_Estado);
            return res;
        }
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

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Poa_Comparar : IComparer<Pla_Poa>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Poa_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Poa x, Pla_Poa y)
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
                case "Pla_Tarea_Id":
                    retVal =  x.Pla_Tarea_Id - y.Pla_Tarea_Id ;
                    break;
              // System.Int32
                case "Pla_Partida_Id":
                    retVal =  x.Pla_Partida_Id - y.Pla_Partida_Id ;
                    break;
				// System.String
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
				// System.String
                case "Pla_Tarea_Codigo":
                    retVal =  string.Compare(x.Pla_Tarea_Codigo, y.Pla_Tarea_Codigo);
                    break;
				// System.String
                case "Pla_Tarea_Nombre":
                    retVal =  string.Compare(x.Pla_Tarea_Nombre, y.Pla_Tarea_Nombre);
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
                case "Pla_Partida_Codigo":
                    retVal =  string.Compare(x.Pla_Partida_Codigo, y.Pla_Partida_Codigo);
                    break;
				// System.String
                case "Pla_Partida_Nombre":
                    retVal =  string.Compare(x.Pla_Partida_Nombre, y.Pla_Partida_Nombre);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
