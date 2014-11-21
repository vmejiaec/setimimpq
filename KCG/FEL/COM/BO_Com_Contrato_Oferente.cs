using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using HER;
 
namespace FEL.COM
{
    [DataObject]
    public partial class BO_Com_Contrato_Oferente
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
        public List<Com_Contrato_Oferente> Get(Scope s,string sortExpression="")
        {
            List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>(Adapter.Com_Contrato_Oferente_Get(s));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Oferente_Comparar(sortExpression));
            return lista;
        }
        #endregion
        #region Insert, Update, Delete
		// Insert
        [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
        public int Insert(Com_Contrato_Oferente n)
        {            
            return Adapter.Com_Contrato_Oferente_Insert(n);
        }
		// Delete
        [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
        public int Delete(Com_Contrato_Oferente o)
        {            
            return Adapter.Com_Contrato_Oferente_Delete(o);
        }
		// Update
        [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
        public int Update(Com_Contrato_Oferente o, Com_Contrato_Oferente n)
        {            
            return Adapter.Com_Contrato_Oferente_Update(o, n);
        }
        #endregion
        #region Procedimientos Get
		// Procedimientos Get
		#region Métodos Get
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Oferente> GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id, string sortExpression="")
        {
			List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>(
				Adapter.Com_Contrato_Oferente_GetByCom_Contrato_Id(s,  p_Com_Contrato_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Oferente_Comparar(sortExpression));
            return lista;
        }
		[DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
		public List<Com_Contrato_Oferente> GetById(Scope s , Int32 p_Id, string sortExpression="")
        {
			List<Com_Contrato_Oferente> lista = new List<Com_Contrato_Oferente>(
				Adapter.Com_Contrato_Oferente_GetById(s,  p_Id));
			if (!string.IsNullOrEmpty(sortExpression))
				lista.Sort(new Com_Contrato_Oferente_Comparar(sortExpression));
            return lista;
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		 // InsertINT
		[DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
		public int InsertINT(Com_Contrato_Oferente n)
        {            
            return Adapter.Com_Contrato_Oferente_InsertINT(n);
        }
		#endregion
		#endregion
    }

	// Clase para ordenar las listas
	#region Ordenar la lista
    class Com_Contrato_Oferente_Comparar : IComparer<Com_Contrato_Oferente>
    {
        private bool _reverse;
        private string _sortColumn;

        public Com_Contrato_Oferente_Comparar(string sortExpression)
        {
            _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
            if (_reverse)
                _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
            else
                _sortColumn = sortExpression;
        }

        public int Compare(Com_Contrato_Oferente x, Com_Contrato_Oferente y)
        {
            int retVal = 0;
            switch (_sortColumn)
            {
              // System.Int32
                case "Id":
                    retVal =  x.Id - y.Id ;
                    break;
				// System.String
                case "Nombre":
                    retVal =  string.Compare(x.Nombre, y.Nombre);
                    break;
			   // System.DateTime
                case "Fecha_Recepcion":
                    retVal =  DateTime.Compare(x.Fecha_Recepcion, y.Fecha_Recepcion);
                    break;
              // System.Int32
                case "Com_Contrato_Id":
                    retVal =  x.Com_Contrato_Id - y.Com_Contrato_Id ;
                    break;
				// System.String
                case "Per_Personal_Id_Recibe":
                    retVal =  string.Compare(x.Per_Personal_Id_Recibe, y.Per_Personal_Id_Recibe);
                    break;
				// System.String
                case "Comentario":
                    retVal =  string.Compare(x.Comentario, y.Comentario);
                    break;
            }
            return (retVal * (_reverse ? -1 : 1));
        }
    }
    #endregion
}
