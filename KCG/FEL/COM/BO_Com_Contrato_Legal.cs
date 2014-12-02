using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;

namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato_Legal
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
        public List<Com_Contrato_Legal> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>(Adapter.Com_Contrato_Legal_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Legal_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato_Legal n)
        {            
            return Adapter.Com_Contrato_Legal_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato_Legal o)
        {            
            return Adapter.Com_Contrato_Legal_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato_Legal o, Com_Contrato_Legal n)
        {            
            return Adapter.Com_Contrato_Legal_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Legal> GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id, string sortExpression="")
        {
			List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>(
				Adapter.Com_Contrato_Legal_GetByCom_Contrato_Id(s,  p_Com_Contrato_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Legal_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Legal> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato_Legal> lista = new List<Com_Contrato_Legal>(
				Adapter.Com_Contrato_Legal_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Legal_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato_Legal n)
        {            
            return Adapter.Com_Contrato_Legal_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_Legal_Comparar : IComparer<Com_Contrato_Legal>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_Legal_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato_Legal x, Com_Contrato_Legal y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
              // System.Int32
                case "Com_Contrato_Id":
                    retVal =  x.Com_Contrato_Id - y.Com_Contrato_Id ;
                    break;
              // System.Int32
                case "Com_Contrato_Tipo_Id":
                    retVal =  x.Com_Contrato_Tipo_Id - y.Com_Contrato_Tipo_Id ;
                    break;
				// System.String
                case "URL_Contrato_Word":
                    retVal =  string.Compare(x.URL_Contrato_Word, y.URL_Contrato_Word);
                    break;
				// System.String
                case "URL_Contrato_Scan":
                    retVal =  string.Compare(x.URL_Contrato_Scan, y.URL_Contrato_Scan);
                    break;
				// System.String
                case "Desc_Alerta_1":
                    retVal =  string.Compare(x.Desc_Alerta_1, y.Desc_Alerta_1);
                    break;
				// System.String
                case "Desc_Alerta_2":
                    retVal =  string.Compare(x.Desc_Alerta_2, y.Desc_Alerta_2);
                    break;
				// System.String
                case "Desc_Alerta_3":
                    retVal =  string.Compare(x.Desc_Alerta_3, y.Desc_Alerta_3);
                    break;
			   // System.DateTime
                case "Fecha_Firma_Contrato":
                    retVal =  DateTime.Compare(x.Fecha_Firma_Contrato, y.Fecha_Firma_Contrato);
                    break;
			   // System.DateTime
                case "Fecha_Contrato":
                    retVal =  DateTime.Compare(x.Fecha_Contrato, y.Fecha_Contrato);
                    break;
              // System.Int32
                case "Pla_Doc_Id":
                    retVal =  x.Pla_Doc_Id - y.Pla_Doc_Id ;
                    break;
              // System.Int32
                case "Plazo_Contrato":
                    retVal =  x.Plazo_Contrato - y.Plazo_Contrato ;
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
                case "Par_Razon_Social_Id_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Id_Contratista, y.Par_Razon_Social_Id_Contratista);
                    break;
				// System.String
                case "Par_Razon_Social_Nombre_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Nombre_Contratista, y.Par_Razon_Social_Nombre_Contratista);
                    break;
				// System.String
                case "Par_Razon_Social_Numero_Contratista":
                    retVal =  string.Compare(x.Par_Razon_Social_Numero_Contratista, y.Par_Razon_Social_Numero_Contratista);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
