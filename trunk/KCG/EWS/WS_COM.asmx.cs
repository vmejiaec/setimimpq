﻿using System;
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
	    #region Servicios para Com_Contrato
        private DO_Com_Contrato _Com_Contrato;
        public DO_Com_Contrato Com_Contrato {
            get {
                if (_Com_Contrato == null)
                    _Com_Contrato = new DO_Com_Contrato();
                return _Com_Contrato;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato> Com_Contrato_Get(Scope s)
        {
            return Com_Contrato.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_Insert(Com_Contrato n)
        {
            return Com_Contrato.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_Delete(Com_Contrato o)
        {
            return Com_Contrato.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_Update(Com_Contrato o,Com_Contrato n)
        {
            return Com_Contrato.Update(o, n);
        }
		#endregion
		#region Métodos Get
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_InsertINT(Com_Contrato n)
        {
            return Com_Contrato.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Contrato_DocTec
        private DO_Com_Contrato_DocTec _Com_Contrato_DocTec;
        public DO_Com_Contrato_DocTec Com_Contrato_DocTec {
            get {
                if (_Com_Contrato_DocTec == null)
                    _Com_Contrato_DocTec = new DO_Com_Contrato_DocTec();
                return _Com_Contrato_DocTec;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato_DocTec> Com_Contrato_DocTec_Get(Scope s)
        {
            return Com_Contrato_DocTec.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_DocTec_Insert(Com_Contrato_DocTec n)
        {
            return Com_Contrato_DocTec.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_DocTec_Delete(Com_Contrato_DocTec o)
        {
            return Com_Contrato_DocTec.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_DocTec_Update(Com_Contrato_DocTec o,Com_Contrato_DocTec n)
        {
            return Com_Contrato_DocTec.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Contrato_DocTec> Com_Contrato_DocTec_GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id)
        {
            return Com_Contrato_DocTec.GetByCom_Contrato_Id(s,  p_Com_Contrato_Id);
        }
		[WebMethod]
		public List<Com_Contrato_DocTec> Com_Contrato_DocTec_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato_DocTec.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_DocTec_InsertINT(Com_Contrato_DocTec n)
        {
            return Com_Contrato_DocTec.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Contrato_Oferente
        private DO_Com_Contrato_Oferente _Com_Contrato_Oferente;
        public DO_Com_Contrato_Oferente Com_Contrato_Oferente {
            get {
                if (_Com_Contrato_Oferente == null)
                    _Com_Contrato_Oferente = new DO_Com_Contrato_Oferente();
                return _Com_Contrato_Oferente;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato_Oferente> Com_Contrato_Oferente_Get(Scope s)
        {
            return Com_Contrato_Oferente.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_Oferente_Insert(Com_Contrato_Oferente n)
        {
            return Com_Contrato_Oferente.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_Oferente_Delete(Com_Contrato_Oferente o)
        {
            return Com_Contrato_Oferente.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_Oferente_Update(Com_Contrato_Oferente o,Com_Contrato_Oferente n)
        {
            return Com_Contrato_Oferente.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Contrato_Oferente> Com_Contrato_Oferente_GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id)
        {
            return Com_Contrato_Oferente.GetByCom_Contrato_Id(s,  p_Com_Contrato_Id);
        }
		[WebMethod]
		public List<Com_Contrato_Oferente> Com_Contrato_Oferente_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato_Oferente.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_Oferente_InsertINT(Com_Contrato_Oferente n)
        {
            return Com_Contrato_Oferente.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_DocTec
        private DO_Com_DocTec _Com_DocTec;
        public DO_Com_DocTec Com_DocTec {
            get {
                if (_Com_DocTec == null)
                    _Com_DocTec = new DO_Com_DocTec();
                return _Com_DocTec;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_DocTec> Com_DocTec_Get(Scope s)
        {
            return Com_DocTec.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_DocTec_Insert(Com_DocTec n)
        {
            return Com_DocTec.Insert(n);
        }
		[WebMethod]
        public int Com_DocTec_Delete(Com_DocTec o)
        {
            return Com_DocTec.Delete(o);
        }
		[WebMethod]
        public int Com_DocTec_Update(Com_DocTec o,Com_DocTec n)
        {
            return Com_DocTec.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_DocTec> Com_DocTec_GetById(Scope s , Int32 p_Id)
        {
            return Com_DocTec.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Com_DocTec> Com_DocTec_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Com_DocTec.GetByLikeNombre(s,  p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_DocTec_InsertINT(Com_DocTec n)
        {
            return Com_DocTec.InsertINT(n);
        }
		#endregion
		#endregion
		}
}