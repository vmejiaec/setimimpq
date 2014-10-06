using System;
using System.Collections.Generic;
using System.Web.Services;

using CEL.PLA; // datos.xsdNombreIniciales
using AEL.PLA;
using BEL;

namespace EWS
{
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WS_PLA : System.Web.Services.WebService
    {
	    #region Servicios para Pla_Cta
        private DO_Pla_Cta _Pla_Cta;
        public DO_Pla_Cta Pla_Cta {
            get {
                if (_Pla_Cta == null)
                    _Pla_Cta = new DO_Pla_Cta();
                return _Pla_Cta;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Cta> Pla_Cta_Get(Scope s)
        {
            return Pla_Cta.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Cta_Insert(Pla_Cta n)
        {
            return Pla_Cta.Insert(n);
        }
		[WebMethod]
        public int Pla_Cta_Delete(Pla_Cta o)
        {
            return Pla_Cta.Delete(o);
        }
		[WebMethod]
        public int Pla_Cta_Update(Pla_Cta o,Pla_Cta n)
        {
            return Pla_Cta.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByAnio(Scope s , string p_Anio)
        {
            return Pla_Cta.GetByAnio(s,  p_Anio);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByAnioLikeCodigo(Scope s , string p_Anio, string p_Codigo)
        {
            return Pla_Cta.GetByAnioLikeCodigo(s,  p_Anio, p_Codigo);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre)
        {
            return Pla_Cta.GetByAnioLikeNombre(s,  p_Anio, p_Nombre);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Cta.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByLikeCodigo(Scope s , string p_Codigo)
        {
            return Pla_Cta.GetByLikeCodigo(s,  p_Codigo);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Pla_Cta.GetByLikeNombre(s,  p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Pla_Cta_InsertINT(Pla_Cta n)
        {
            return Pla_Cta.InsertINT(n);
        }
				[WebMethod]
		public DateTime? Pla_Cta_Max_FechaDTM(Scope s , string p_Area_Solicita)
        {
            return Pla_Cta.Max_FechaDTM(s,  p_Area_Solicita);
        }
				[WebMethod]
		public int Pla_Cta_SelNoRegistrosINT(Scope s , string p_Anio)
        {
            return Pla_Cta.SelNoRegistrosINT(s,  p_Anio);
        }
				[WebMethod]
		public string Pla_Cta_SelTareasSTR(Scope s , string p_Anio, Int32 p_Pla_Cta_Id, DateTime p_Fecha)
        {
            return Pla_Cta.SelTareasSTR(s,  p_Anio, p_Pla_Cta_Id, p_Fecha);
        }
		#endregion
		#endregion
	    #region Servicios para Pla_Doc
        private DO_Pla_Doc _Pla_Doc;
        public DO_Pla_Doc Pla_Doc {
            get {
                if (_Pla_Doc == null)
                    _Pla_Doc = new DO_Pla_Doc();
                return _Pla_Doc;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Doc> Pla_Doc_Get(Scope s)
        {
            return Pla_Doc.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Doc_Insert(Pla_Doc n)
        {
            return Pla_Doc.Insert(n);
        }
		[WebMethod]
        public int Pla_Doc_Delete(Pla_Doc o)
        {
            return Pla_Doc.Delete(o);
        }
		[WebMethod]
        public int Pla_Doc_Update(Pla_Doc o,Pla_Doc n)
        {
            return Pla_Doc.Update(o, n);
        }
		#endregion
		#region Métodos Get
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
	    #region Servicios para Pla_Tarea
        private DO_Pla_Tarea _Pla_Tarea;
        public DO_Pla_Tarea Pla_Tarea {
            get {
                if (_Pla_Tarea == null)
                    _Pla_Tarea = new DO_Pla_Tarea();
                return _Pla_Tarea;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Tarea> Pla_Tarea_Get(Scope s)
        {
            return Pla_Tarea.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Tarea_Insert(Pla_Tarea n)
        {
            return Pla_Tarea.Insert(n);
        }
		[WebMethod]
        public int Pla_Tarea_Delete(Pla_Tarea o)
        {
            return Pla_Tarea.Delete(o);
        }
		[WebMethod]
        public int Pla_Tarea_Update(Pla_Tarea o,Pla_Tarea n)
        {
            return Pla_Tarea.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Tarea> Pla_Tarea_GetByAnio(Scope s , string p_Anio)
        {
            return Pla_Tarea.GetByAnio(s,  p_Anio);
        }
		[WebMethod]
		public List<Pla_Tarea> Pla_Tarea_GetByAnioLikeNombre(Scope s , string p_Anio, string p_Nombre)
        {
            return Pla_Tarea.GetByAnioLikeNombre(s,  p_Anio, p_Nombre);
        }
		[WebMethod]
		public List<Pla_Tarea> Pla_Tarea_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Tarea.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Tarea> Pla_Tarea_GetByPla_Cta_Id(Scope s , Int32 p_Pla_Cta_Id)
        {
            return Pla_Tarea.GetByPla_Cta_Id(s,  p_Pla_Cta_Id);
        }
		[WebMethod]
		public List<Pla_Tarea> Pla_Tarea_GetByPla_Cta_IdLikeNombre(Scope s , Int32 p_Pla_Cta_Id, string p_Nombre)
        {
            return Pla_Tarea.GetByPla_Cta_IdLikeNombre(s,  p_Pla_Cta_Id, p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Pla_Tarea_InsertINT(Pla_Tarea n)
        {
            return Pla_Tarea.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Pla_Mov
        private DO_Pla_Mov _Pla_Mov;
        public DO_Pla_Mov Pla_Mov {
            get {
                if (_Pla_Mov == null)
                    _Pla_Mov = new DO_Pla_Mov();
                return _Pla_Mov;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Mov> Pla_Mov_Get(Scope s)
        {
            return Pla_Mov.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Mov_Insert(Pla_Mov n)
        {
            return Pla_Mov.Insert(n);
        }
		[WebMethod]
        public int Pla_Mov_Delete(Pla_Mov o)
        {
            return Pla_Mov.Delete(o);
        }
		[WebMethod]
        public int Pla_Mov_Update(Pla_Mov o,Pla_Mov n)
        {
            return Pla_Mov.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Mov> Pla_Mov_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Mov.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Mov> Pla_Mov_GetByPla_Doc_Id(Scope s , Int32 p_Pla_Doc_Id)
        {
            return Pla_Mov.GetByPla_Doc_Id(s,  p_Pla_Doc_Id);
        }
		[WebMethod]
		public List<Pla_Mov> Pla_Mov_GetByPla_Poa_Id(Scope s , Int32 p_Pla_Poa_Id)
        {
            return Pla_Mov.GetByPla_Poa_Id(s,  p_Pla_Poa_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
	    #region Servicios para Pla_Poa
        private DO_Pla_Poa _Pla_Poa;
        public DO_Pla_Poa Pla_Poa {
            get {
                if (_Pla_Poa == null)
                    _Pla_Poa = new DO_Pla_Poa();
                return _Pla_Poa;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Poa> Pla_Poa_Get(Scope s)
        {
            return Pla_Poa.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Poa_Insert(Pla_Poa n)
        {
            return Pla_Poa.Insert(n);
        }
		[WebMethod]
        public int Pla_Poa_Delete(Pla_Poa o)
        {
            return Pla_Poa.Delete(o);
        }
		[WebMethod]
        public int Pla_Poa_Update(Pla_Poa o,Pla_Poa n)
        {
            return Pla_Poa.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Poa> Pla_Poa_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Poa.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Poa> Pla_Poa_GetByPla_Partida_Id(Scope s , Int32 p_Pla_Partida_Id)
        {
            return Pla_Poa.GetByPla_Partida_Id(s,  p_Pla_Partida_Id);
        }
		[WebMethod]
		public List<Pla_Poa> Pla_Poa_GetByPla_Tarea_Id(Scope s , Int32 p_Pla_Tarea_Id)
        {
            return Pla_Poa.GetByPla_Tarea_Id(s,  p_Pla_Tarea_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
	    #region Servicios para Pla_Partida
        private DO_Pla_Partida _Pla_Partida;
        public DO_Pla_Partida Pla_Partida {
            get {
                if (_Pla_Partida == null)
                    _Pla_Partida = new DO_Pla_Partida();
                return _Pla_Partida;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Partida> Pla_Partida_Get(Scope s)
        {
            return Pla_Partida.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Partida_Insert(Pla_Partida n)
        {
            return Pla_Partida.Insert(n);
        }
		[WebMethod]
        public int Pla_Partida_Delete(Pla_Partida o)
        {
            return Pla_Partida.Delete(o);
        }
		[WebMethod]
        public int Pla_Partida_Update(Pla_Partida o,Pla_Partida n)
        {
            return Pla_Partida.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Partida> Pla_Partida_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Partida.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Partida> Pla_Partida_GetByLikeCodigo(Scope s , string p_Codigo)
        {
            return Pla_Partida.GetByLikeCodigo(s,  p_Codigo);
        }
		[WebMethod]
		public List<Pla_Partida> Pla_Partida_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Pla_Partida.GetByLikeNombre(s,  p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Pla_Partida_InsertINT(Pla_Partida n)
        {
            return Pla_Partida.InsertINT(n);
        }
		#endregion
		#endregion
		}
}
