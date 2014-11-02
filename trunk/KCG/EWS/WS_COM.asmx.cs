using System;
using System.Collections.Generic;
using System.Web.Services;

using CEL.COM; // datos.xsdNombreIniciales
using AEL.COM;
using BEL;

namespace EWS
{
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WS_COM : System.Web.Services.WebService
    {
	    #region Servicios para Com_Procedimiento
        private DO_Com_Procedimiento _Com_Procedimiento;
        public DO_Com_Procedimiento Com_Procedimiento {
            get {
                if (_Com_Procedimiento == null)
                    _Com_Procedimiento = new DO_Com_Procedimiento();
                return _Com_Procedimiento;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Procedimiento> Com_Procedimiento_Get(Scope s)
        {
            return Com_Procedimiento.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Procedimiento_Insert(Com_Procedimiento n)
        {
            return Com_Procedimiento.Insert(n);
        }
		[WebMethod]
        public int Com_Procedimiento_Delete(Com_Procedimiento o)
        {
            return Com_Procedimiento.Delete(o);
        }
		[WebMethod]
        public int Com_Procedimiento_Update(Com_Procedimiento o,Com_Procedimiento n)
        {
            return Com_Procedimiento.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Procedimiento> Com_Procedimiento_GetById(Scope s , Int32 p_Id)
        {
            return Com_Procedimiento.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Com_Procedimiento> Com_Procedimiento_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Com_Procedimiento.GetByLikeNombre(s,  p_Nombre);
        }
		[WebMethod]
		public List<Com_Procedimiento> Com_Procedimiento_GetByLikeValor(Scope s , Decimal p_Valor)
        {
            return Com_Procedimiento.GetByLikeValor(s,  p_Valor);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Procedimiento_InsertINT(Com_Procedimiento n)
        {
            return Com_Procedimiento.InsertINT(n);
        }
		#endregion
		#endregion
		}
}
