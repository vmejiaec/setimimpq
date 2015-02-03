using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER; 

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato
    {
        #region Adaptador
        private WS_COM _Adapter;
        public WS_COM Adapter
        {
            get {
                if (_Adapter == null) _Adapter = new WS_COM();
                return _Adapter; }
        }
        #endregion
        #region Select
		// Select
        [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
        public List<Com_Contrato> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato> lista = new List<Com_Contrato>(Adapter.Com_Contrato_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato n)
        {            
            return Adapter.Com_Contrato_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato o)
        {            
            return Adapter.Com_Contrato_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato o, Com_Contrato n)
        {            
            return Adapter.Com_Contrato_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetByCodigo_Sercop(Scope s , string p_Codigo_Sercop, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetByCodigo_Sercop(s,  p_Codigo_Sercop));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetByLikePla_Tarea_Nombre(Scope s , string p_Pla_Tarea_Nombre, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetByLikePla_Tarea_Nombre(s,  p_Pla_Tarea_Nombre));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetByPla_Doc_Codigo(Scope s , string p_Pla_Doc_Codigo, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetByPla_Doc_Codigo(s,  p_Pla_Doc_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetByPla_Tarea_Codigo(Scope s , string p_Pla_Tarea_Codigo, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetByPla_Tarea_Codigo(s,  p_Pla_Tarea_Codigo));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato> GetByRangoFecha_Crea(Scope s , DateTime p_Fecha_Crea_Ini, DateTime p_Fecha_Crea_Fin, string sortExpression="")
        {
			List<Com_Contrato> lista = new List<Com_Contrato>(
				Adapter.Com_Contrato_GetByRangoFecha_Crea(s,  p_Fecha_Crea_Ini, p_Fecha_Crea_Fin));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato n)
        {            
            return Adapter.Com_Contrato_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_Comparar : IComparer<Com_Contrato>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato x, Com_Contrato y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
              // System.Int32
                case "Pla_Doc_Id":
                    retVal =  x.Pla_Doc_Id - y.Pla_Doc_Id ;
                    break;
				// System.String
                case "Estado":
                    retVal =  string.Compare(x.Estado, y.Estado);
                    break;
              // System.Int32
                case "Com_Procedimiento_Id":
                    retVal =  x.Com_Procedimiento_Id - y.Com_Procedimiento_Id ;
                    break;
              // System.Int32
                case "Plazo_Ref":
                    retVal =  x.Plazo_Ref - y.Plazo_Ref ;
                    break;
				// System.String
                case "Codigo_Sercop":
                    retVal =  string.Compare(x.Codigo_Sercop, y.Codigo_Sercop);
                    break;
				// System.String
                case "Per_Personal_Resp_Exp":
                    retVal =  string.Compare(x.Per_Personal_Resp_Exp, y.Per_Personal_Resp_Exp);
                    break;
			   // System.DateTime
                case "Fecha_Cierre_Rec_Ofertas":
                    retVal =  DateTime.Compare(x.Fecha_Cierre_Rec_Ofertas, y.Fecha_Cierre_Rec_Ofertas);
                    break;
				// System.String
                case "Par_Razon_Social_Id_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Id_Contratista, y.Par_Razon_Social_Id_Contratista);
                    break;
              // System.Int32
                case "Plazo_Contrato":
                    retVal =  x.Plazo_Contrato - y.Plazo_Contrato ;
                    break;
			   // System.DateTime
                case "Fecha_Inicio_Contrato":
                    retVal =  DateTime.Compare(x.Fecha_Inicio_Contrato, y.Fecha_Inicio_Contrato);
                    break;
				// System.String
                case "Per_Personal_Id_Admin":
                    retVal =  string.Compare(x.Per_Personal_Id_Admin, y.Per_Personal_Id_Admin);
                    break;
				// System.String
                case "Desc_Contrata":
                    retVal =  string.Compare(x.Desc_Contrata, y.Desc_Contrata);
                    break;
			   // System.DateTime
                case "Fecha_Crea":
                    retVal =  DateTime.Compare(x.Fecha_Crea, y.Fecha_Crea);
                    break;
              // System.Int32
                case "Pla_Tarea_Id":
                    retVal =  x.Pla_Tarea_Id - y.Pla_Tarea_Id ;
                    break;
				// System.String
                case "Pla_Tarea_Codigo":
                    retVal =  string.Compare(x.Pla_Tarea_Codigo, y.Pla_Tarea_Codigo);
                    break;
				// System.String
                case "Pla_Tarea_Nombre":
                    retVal =  string.Compare(x.Pla_Tarea_Nombre, y.Pla_Tarea_Nombre);
                    break;
				// System.String
                case "Per_Personal_Nombre_Admin":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Admin, y.Per_Personal_Nombre_Admin);
                    break;
				// System.String
                case "Com_Procedimiento_Tipo":
                    retVal =  string.Compare(x.Com_Procedimiento_Tipo, y.Com_Procedimiento_Tipo);
                    break;
				// System.String
                case "Com_Procedimiento_Nombre":
                    retVal =  string.Compare(x.Com_Procedimiento_Nombre, y.Com_Procedimiento_Nombre);
                    break;
				// System.String
                case "Per_Personal_Nombre_Resp_Exp":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Resp_Exp, y.Per_Personal_Nombre_Resp_Exp);
                    break;
				// System.String
                case "Per_Personal_Id_Solicita":
                    retVal =  string.Compare(x.Per_Personal_Id_Solicita, y.Per_Personal_Id_Solicita);
                    break;
				// System.String
                case "Per_Personal_Nombre_Solicita":
                    retVal =  string.Compare(x.Per_Personal_Nombre_Solicita, y.Per_Personal_Nombre_Solicita);
                    break;
				// System.String
                case "Par_Razon_Social_Nombre_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Nombre_Contratista, y.Par_Razon_Social_Nombre_Contratista);
                    break;
				// System.String
                case "Par_Razon_Social_Numero_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Numero_Contratista, y.Par_Razon_Social_Numero_Contratista);
                    break;
				// System.String
                case "Pla_Doc_Cedula_Presup_Codigo":
                    retVal =  string.Compare(x.Pla_Doc_Cedula_Presup_Codigo, y.Pla_Doc_Cedula_Presup_Codigo);
                    break;
				// System.String
                case "Pla_Doc_CPC_Codigo":
                    retVal =  string.Compare(x.Pla_Doc_CPC_Codigo, y.Pla_Doc_CPC_Codigo);
                    break;
				// System.String
                case "Pla_Doc_PAC_Linea":
                    retVal =  string.Compare(x.Pla_Doc_PAC_Linea, y.Pla_Doc_PAC_Linea);
                    break;
				// System.String
                case "Pla_Doc_Codigo":
                    retVal =  string.Compare(x.Pla_Doc_Codigo, y.Pla_Doc_Codigo);
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
                case "Com_Procedimiento_Desc":
                    retVal =  string.Compare(x.Com_Procedimiento_Desc, y.Com_Procedimiento_Desc);
                    break;
				// System.String
                case "Estado_Portal":
                    retVal =  string.Compare(x.Estado_Portal, y.Estado_Portal);
                    break;
				// System.String
                case "Estado_Contratacion":
                    retVal =  string.Compare(x.Estado_Contratacion, y.Estado_Contratacion);
                    break;
			   // System.DateTime
                case "Fecha_Inicio_Elabora_Pliegos":
                    retVal =  DateTime.Compare(x.Fecha_Inicio_Elabora_Pliegos, y.Fecha_Inicio_Elabora_Pliegos);
                    break;
			   // System.DateTime
                case "Fecha_Publicacion_Portal":
                    retVal =  DateTime.Compare(x.Fecha_Publicacion_Portal, y.Fecha_Publicacion_Portal);
                    break;
			   // System.DateTime
                case "Fecha_Calificaciones":
                    retVal =  DateTime.Compare(x.Fecha_Calificaciones, y.Fecha_Calificaciones);
                    break;
			   // System.DateTime
                case "Fecha_Estimada_Adjudicacion":
                    retVal =  DateTime.Compare(x.Fecha_Estimada_Adjudicacion, y.Fecha_Estimada_Adjudicacion);
                    break;
			   // System.DateTime
                case "Fecha_Adjudicacion":
                    retVal =  DateTime.Compare(x.Fecha_Adjudicacion, y.Fecha_Adjudicacion);
                    break;
			   // System.DateTime
                case "Fecha_Juridico":
                    retVal =  DateTime.Compare(x.Fecha_Juridico, y.Fecha_Juridico);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
