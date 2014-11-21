using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.PLA
{
    [DataObject]
    public partial class BO_Pla_PersonalDatos
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
        public List<Pla_PersonalDatos> Get(Scope s,string sortExpression="")
        {
            List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>(Adapter.Pla_PersonalDatos_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_PersonalDatos_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Pla_PersonalDatos n)
        {            
            return Adapter.Pla_PersonalDatos_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Pla_PersonalDatos o)
        {            
            return Adapter.Pla_PersonalDatos_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Pla_PersonalDatos o, Pla_PersonalDatos n)
        {            
            return Adapter.Pla_PersonalDatos_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_PersonalDatos> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>(
				Adapter.Pla_PersonalDatos_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_PersonalDatos_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_PersonalDatos> GetByLikePer_Personal_Nombre(Scope s , string p_Per_Personal_Nombre, string sortExpression="")
        {
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>(
				Adapter.Pla_PersonalDatos_GetByLikePer_Personal_Nombre(s,  p_Per_Personal_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_PersonalDatos_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_PersonalDatos> GetByPer_Personal_Id(Scope s , string p_Per_Personal_Id, string sortExpression="")
        {
			List<Pla_PersonalDatos> lista = new List<Pla_PersonalDatos>(
				Adapter.Pla_PersonalDatos_GetByPer_Personal_Id(s,  p_Per_Personal_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Pla_PersonalDatos_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_PersonalDatos_Comparar : IComparer<Pla_PersonalDatos>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_PersonalDatos_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_PersonalDatos x, Pla_PersonalDatos y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Per_Personal_Id":
                    retVal =  string.Compare(x.Per_Personal_Id, y.Per_Personal_Id);
                    break;
				// System.String
                case "Pie_Firma_Nombre":
                    retVal =  string.Compare(x.Pie_Firma_Nombre, y.Pie_Firma_Nombre);
                    break;
				// System.String
                case "Pie_Firma_Cargo":
                    retVal =  string.Compare(x.Pie_Firma_Cargo, y.Pie_Firma_Cargo);
                    break;
				// System.String
                case "Email_Inst":
                    retVal =  string.Compare(x.Email_Inst, y.Email_Inst);
                    break;
				// System.String
                case "Per_Personal_Nombre":
                    retVal =  string.Compare(x.Per_Personal_Nombre, y.Per_Personal_Nombre);
                    break;
				// System.String
                case "Per_Personal_NumeroDoc":
                    retVal =  string.Compare(x.Per_Personal_NumeroDoc, y.Per_Personal_NumeroDoc);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
