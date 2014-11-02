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
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
