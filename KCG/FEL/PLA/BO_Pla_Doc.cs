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
        public List<Pla_Doc> Get(Scope s,string sortExpression="")
        {
            List<Pla_Doc> lista = new List<Pla_Doc>(Adapter.Pla_Doc_Get(s));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
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
		public List<Pla_Doc> GetByArea_Codigo_RangoFecha_Solicita(Scope s , string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByArea_Codigo_RangoFecha_Solicita(s,  p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByCodigo(Scope s , string p_Codigo, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByCodigo(s,  p_Codigo));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetById(s,  p_Id));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByRangoFecha_Solicita(Scope s , DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByRangoFecha_Solicita(s,  p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_Area_Codigo_Codigo(Scope s , string p_Tipo, string p_Area_Codigo, string p_Codigo, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_Area_Codigo_Codigo(s,  p_Tipo, p_Area_Codigo, p_Codigo));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_Area_Codigo_LikeDescripcion(Scope s , string p_Tipo, string p_Area_Codigo, string p_Descripcion, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_Area_Codigo_LikeDescripcion(s,  p_Tipo, p_Area_Codigo, p_Descripcion));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_Area_Codigo_RangoFecha_Solicita(Scope s , string p_Tipo, string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita(s,  p_Tipo, p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_RangoFecha_Solicita(Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_RangoFecha_Solicita(s,  p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Pla_Doc> GetByTipo_RangoFecha_Solicita_LikeDescripcion(Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string p_Descripcion, string sortExpression="")
        {
			List<Pla_Doc> lista = new List<Pla_Doc>(
				Adapter.Pla_Doc_GetByTipo_RangoFecha_Solicita_LikeDescripcion(s,  p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin, p_Descripcion));
			lista.Sort(new Pla_Doc_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Pla_Doc n)
        {            
            return Adapter.Pla_Doc_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Pla_Doc_Comparar : IComparer<Pla_Doc>
    {
        private bool _reverse;
        private string _sortColumn;

        public Pla_Doc_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Pla_Doc x, Pla_Doc y)
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
				// System.String
                case "Tipo":
                    retVal =  string.Compare(x.Tipo, y.Tipo);
                    break;
			   // System.DateTime
                case "Fecha_Solicita":
                    retVal =  DateTime.Compare(x.Fecha_Solicita, y.Fecha_Solicita);
                    break;
				// System.String
                case "Per_Personal_Id_Solicita":
                    retVal =  string.Compare(x.Per_Personal_Id_Solicita, y.Per_Personal_Id_Solicita);
                    break;
				// System.String
                case "Area_Codigo_Solicita":
                    retVal =  string.Compare(x.Area_Codigo_Solicita, y.Area_Codigo_Solicita);
                    break;
				// System.String
                case "Descripcion":
                    retVal =  string.Compare(x.Descripcion, y.Descripcion);
                    break;
				// System.String
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
				// System.String
                case "Per_Personal_Id_Crea":
                    retVal =  string.Compare(x.Per_Personal_Id_Crea, y.Per_Personal_Id_Crea);
                    break;
				// System.String
                case "Per_Personal_Id_Modifica":
                    retVal =  string.Compare(x.Per_Personal_Id_Modifica, y.Per_Personal_Id_Modifica);
                    break;
				// System.String
                case "Per_Personal_Id_Planifica":
                    retVal =  string.Compare(x.Per_Personal_Id_Planifica, y.Per_Personal_Id_Planifica);
                    break;
				// System.String
                case "Esta_Planificada":
                    retVal =  string.Compare(x.Esta_Planificada, y.Esta_Planificada);
                    break;
				// System.String
                case "Per_Personal_Id_Contrata":
                    retVal =  string.Compare(x.Per_Personal_Id_Contrata, y.Per_Personal_Id_Contrata);
                    break;
				// System.String
                case "Esta_Contratada":
                    retVal =  string.Compare(x.Esta_Contratada, y.Esta_Contratada);
                    break;
				// System.String
                case "PAC_Linea":
                    retVal =  string.Compare(x.PAC_Linea, y.PAC_Linea);
                    break;
				// System.String
                case "CPC_Codigo":
                    retVal =  string.Compare(x.CPC_Codigo, y.CPC_Codigo);
                    break;
			   // System.DateTime
                case "Fecha_Contrata":
                    retVal =  DateTime.Compare(x.Fecha_Contrata, y.Fecha_Contrata);
                    break;
			   // System.DateTime
                case "Fecha_Planifica":
                    retVal =  DateTime.Compare(x.Fecha_Planifica, y.Fecha_Planifica);
                    break;
				// System.String
                case "Per_Personal_Nombre_Solicita":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Solicita, y.Per_Personal_Nombre_Solicita);
                    break;
				// System.String
                case "Area_Nombre_Solicita":
                    retVal =  string.Compare(x.Area_Nombre_Solicita, y.Area_Nombre_Solicita);
                    break;
				// System.String
                case "Per_Personal_Nombre_Crea":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Crea, y.Per_Personal_Nombre_Crea);
                    break;
				// System.String
                case "Per_Personal_Nombre_Modifica":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Modifica, y.Per_Personal_Nombre_Modifica);
                    break;
				// System.String
                case "Per_Personal_Nombre_Planifica":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Planifica, y.Per_Personal_Nombre_Planifica);
                    break;
				// System.String
                case "Per_Personal_Nombre_Contrata":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Contrata, y.Per_Personal_Nombre_Contrata);
                    break;
				// System.String
                case "Cedula_Presup_Codigo":
                    retVal =  string.Compare(x.Cedula_Presup_Codigo, y.Cedula_Presup_Codigo);
                    break;
				// System.String
                case "Contrata_Desc":
                    retVal =  string.Compare(x.Contrata_Desc, y.Contrata_Desc);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
