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
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetByCodigo_Sercop(Scope s , string p_Codigo_Sercop)
        {
            return Com_Contrato.GetByCodigo_Sercop(s,  p_Codigo_Sercop);
        }
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetByLikePla_Tarea_Nombre(Scope s , string p_Pla_Tarea_Nombre)
        {
            return Com_Contrato.GetByLikePla_Tarea_Nombre(s,  p_Pla_Tarea_Nombre);
        }
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetByPla_Doc_Codigo(Scope s , string p_Pla_Doc_Codigo)
        {
            return Com_Contrato.GetByPla_Doc_Codigo(s,  p_Pla_Doc_Codigo);
        }
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetByPla_Tarea_Codigo(Scope s , string p_Pla_Tarea_Codigo)
        {
            return Com_Contrato.GetByPla_Tarea_Codigo(s,  p_Pla_Tarea_Codigo);
        }
		[WebMethod]
		public List<Com_Contrato> Com_Contrato_GetByRangoFecha_Crea(Scope s , DateTime p_Fecha_Crea_Ini, DateTime p_Fecha_Crea_Fin)
        {
            return Com_Contrato.GetByRangoFecha_Crea(s,  p_Fecha_Crea_Ini, p_Fecha_Crea_Fin);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_InsertINT(Com_Contrato n)
        {
            return Com_Contrato.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Contrato_Tipo
        private DO_Com_Contrato_Tipo _Com_Contrato_Tipo;
        public DO_Com_Contrato_Tipo Com_Contrato_Tipo {
            get {
                if (_Com_Contrato_Tipo == null)
                    _Com_Contrato_Tipo = new DO_Com_Contrato_Tipo();
                return _Com_Contrato_Tipo;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato_Tipo> Com_Contrato_Tipo_Get(Scope s)
        {
            return Com_Contrato_Tipo.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_Tipo_Insert(Com_Contrato_Tipo n)
        {
            return Com_Contrato_Tipo.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_Tipo_Delete(Com_Contrato_Tipo o)
        {
            return Com_Contrato_Tipo.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_Tipo_Update(Com_Contrato_Tipo o,Com_Contrato_Tipo n)
        {
            return Com_Contrato_Tipo.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Contrato_Tipo> Com_Contrato_Tipo_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato_Tipo.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Com_Contrato_Tipo> Com_Contrato_Tipo_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Com_Contrato_Tipo.GetByLikeNombre(s,  p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_Tipo_InsertINT(Com_Contrato_Tipo n)
        {
            return Com_Contrato_Tipo.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Contrato_Tipo_Marca
        private DO_Com_Contrato_Tipo_Marca _Com_Contrato_Tipo_Marca;
        public DO_Com_Contrato_Tipo_Marca Com_Contrato_Tipo_Marca {
            get {
                if (_Com_Contrato_Tipo_Marca == null)
                    _Com_Contrato_Tipo_Marca = new DO_Com_Contrato_Tipo_Marca();
                return _Com_Contrato_Tipo_Marca;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato_Tipo_Marca> Com_Contrato_Tipo_Marca_Get(Scope s)
        {
            return Com_Contrato_Tipo_Marca.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_Tipo_Marca_Insert(Com_Contrato_Tipo_Marca n)
        {
            return Com_Contrato_Tipo_Marca.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_Tipo_Marca_Delete(Com_Contrato_Tipo_Marca o)
        {
            return Com_Contrato_Tipo_Marca.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_Tipo_Marca_Update(Com_Contrato_Tipo_Marca o,Com_Contrato_Tipo_Marca n)
        {
            return Com_Contrato_Tipo_Marca.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Contrato_Tipo_Marca> Com_Contrato_Tipo_Marca_GetByCom_Contrato_Tipo_Id(Scope s , Int32 p_Com_Contrato_Tipo_Id)
        {
            return Com_Contrato_Tipo_Marca.GetByCom_Contrato_Tipo_Id(s,  p_Com_Contrato_Tipo_Id);
        }
		[WebMethod]
		public List<Com_Contrato_Tipo_Marca> Com_Contrato_Tipo_Marca_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato_Tipo_Marca.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
		public int Com_Contrato_Tipo_Marca_DelByCom_Contrato_Tipo_IdINT(Scope s , Int32 p_Com_Contrato_Tipo_Id)
        {
            return Com_Contrato_Tipo_Marca.DelByCom_Contrato_Tipo_IdINT(s,  p_Com_Contrato_Tipo_Id);
        }
				[WebMethod]
        public int Com_Contrato_Tipo_Marca_InsertINT(Com_Contrato_Tipo_Marca n)
        {
            return Com_Contrato_Tipo_Marca.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Contrato_Legal
        private DO_Com_Contrato_Legal _Com_Contrato_Legal;
        public DO_Com_Contrato_Legal Com_Contrato_Legal {
            get {
                if (_Com_Contrato_Legal == null)
                    _Com_Contrato_Legal = new DO_Com_Contrato_Legal();
                return _Com_Contrato_Legal;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Contrato_Legal> Com_Contrato_Legal_Get(Scope s)
        {
            return Com_Contrato_Legal.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Contrato_Legal_Insert(Com_Contrato_Legal n)
        {
            return Com_Contrato_Legal.Insert(n);
        }
		[WebMethod]
        public int Com_Contrato_Legal_Delete(Com_Contrato_Legal o)
        {
            return Com_Contrato_Legal.Delete(o);
        }
		[WebMethod]
        public int Com_Contrato_Legal_Update(Com_Contrato_Legal o,Com_Contrato_Legal n)
        {
            return Com_Contrato_Legal.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Contrato_Legal> Com_Contrato_Legal_GetByCom_Contrato_Id(Scope s , Int32 p_Com_Contrato_Id)
        {
            return Com_Contrato_Legal.GetByCom_Contrato_Id(s,  p_Com_Contrato_Id);
        }
		[WebMethod]
		public List<Com_Contrato_Legal> Com_Contrato_Legal_GetById(Scope s , Int32 p_Id)
        {
            return Com_Contrato_Legal.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Contrato_Legal_InsertINT(Com_Contrato_Legal n)
        {
            return Com_Contrato_Legal.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Planilla_Pago
        private DO_Com_Planilla_Pago _Com_Planilla_Pago;
        public DO_Com_Planilla_Pago Com_Planilla_Pago {
            get {
                if (_Com_Planilla_Pago == null)
                    _Com_Planilla_Pago = new DO_Com_Planilla_Pago();
                return _Com_Planilla_Pago;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Planilla_Pago> Com_Planilla_Pago_Get(Scope s)
        {
            return Com_Planilla_Pago.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Planilla_Pago_Insert(Com_Planilla_Pago n)
        {
            return Com_Planilla_Pago.Insert(n);
        }
		[WebMethod]
        public int Com_Planilla_Pago_Delete(Com_Planilla_Pago o)
        {
            return Com_Planilla_Pago.Delete(o);
        }
		[WebMethod]
        public int Com_Planilla_Pago_Update(Com_Planilla_Pago o,Com_Planilla_Pago n)
        {
            return Com_Planilla_Pago.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Planilla_Pago> Com_Planilla_Pago_GetByFis_Planilla_Id(Scope s , string p_Fis_Planilla_Id)
        {
            return Com_Planilla_Pago.GetByFis_Planilla_Id(s,  p_Fis_Planilla_Id);
        }
		[WebMethod]
		public List<Com_Planilla_Pago> Com_Planilla_Pago_GetById(Scope s , Int32 p_Id)
        {
            return Com_Planilla_Pago.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Planilla_Pago_InsertINT(Com_Planilla_Pago n)
        {
            return Com_Planilla_Pago.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Com_Planilla_Deposito
        private DO_Com_Planilla_Deposito _Com_Planilla_Deposito;
        public DO_Com_Planilla_Deposito Com_Planilla_Deposito {
            get {
                if (_Com_Planilla_Deposito == null)
                    _Com_Planilla_Deposito = new DO_Com_Planilla_Deposito();
                return _Com_Planilla_Deposito;
            }
        }

		#region Select
		[WebMethod]
        public List<Com_Planilla_Deposito> Com_Planilla_Deposito_Get(Scope s)
        {
            return Com_Planilla_Deposito.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Com_Planilla_Deposito_Insert(Com_Planilla_Deposito n)
        {
            return Com_Planilla_Deposito.Insert(n);
        }
		[WebMethod]
        public int Com_Planilla_Deposito_Delete(Com_Planilla_Deposito o)
        {
            return Com_Planilla_Deposito.Delete(o);
        }
		[WebMethod]
        public int Com_Planilla_Deposito_Update(Com_Planilla_Deposito o,Com_Planilla_Deposito n)
        {
            return Com_Planilla_Deposito.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Com_Planilla_Deposito> Com_Planilla_Deposito_GetByFis_Planilla_Id(Scope s , string p_Fis_Planilla_Id)
        {
            return Com_Planilla_Deposito.GetByFis_Planilla_Id(s,  p_Fis_Planilla_Id);
        }
		[WebMethod]
		public List<Com_Planilla_Deposito> Com_Planilla_Deposito_GetById(Scope s , Int32 p_Id)
        {
            return Com_Planilla_Deposito.GetById(s,  p_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Com_Planilla_Deposito_InsertINT(Com_Planilla_Deposito n)
        {
            return Com_Planilla_Deposito.InsertINT(n);
        }
		#endregion
		#endregion
		}
}
