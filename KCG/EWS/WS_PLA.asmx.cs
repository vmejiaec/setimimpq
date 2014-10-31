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
		public List<Pla_Cta> Pla_Cta_GetByAnioArbolPla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo)
        {
            return Pla_Cta.GetByAnioArbolPla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByAnioArbolPla_Cta_Id(Scope s , Int32 p_Pla_Cta_Id)
        {
            return Pla_Cta.GetByAnioArbolPla_Cta_Id(s,  p_Pla_Cta_Id);
        }
		[WebMethod]
		public List<Pla_Cta> Pla_Cta_GetByAnioArbolPla_Tarea_Id(Scope s , Int32 p_Pla_Tarea_Id)
        {
            return Pla_Cta.GetByAnioArbolPla_Tarea_Id(s,  p_Pla_Tarea_Id);
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
		public List<Pla_Poa> Pla_Poa_GetByAnio(Scope s , string p_Anio)
        {
            return Pla_Poa.GetByAnio(s,  p_Anio);
        }
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
				[WebMethod]
		public int Pla_Poa_Delete_Con_Pla_Mov_y_Pla_DocINT(Scope s , Int32 Original_Id, string Original_Codigo, Int32 Original_Pla_Tarea_Id, Int32 Original_Pla_Partida_Id, string Original_Estado)
        {
            return Pla_Poa.Delete_Con_Pla_Mov_y_Pla_DocINT(s,  Original_Id, Original_Codigo, Original_Pla_Tarea_Id, Original_Pla_Partida_Id, Original_Estado);
        }
				[WebMethod]
		public int Pla_Poa_Insert_Con_Pla_Mov_SaldoInicialINT(Scope s , string Codigo, Int32 Pla_Tarea_Id, Int32 Pla_Partida_Id, Decimal Valor_Inicial, string Estado)
        {
            return Pla_Poa.Insert_Con_Pla_Mov_SaldoInicialINT(s,  Codigo, Pla_Tarea_Id, Pla_Partida_Id, Valor_Inicial, Estado);
        }
				[WebMethod]
        public int Pla_Poa_InsertINT(Pla_Poa n)
        {
            return Pla_Poa.InsertINT(n);
        }
				[WebMethod]
		public int Pla_Poa_Update_Con_Pla_Mov_SaldoInicialINT(Scope s , string Codigo, Int32 Pla_Tarea_Id, Int32 Pla_Partida_Id, string Estado, Int32 Original_Id, string Original_Codigo, Int32 Original_Pla_Tarea_Id, Int32 Original_Pla_Partida_Id, string Original_Estado, Int32 Id, Decimal Valor_Inicial)
        {
            return Pla_Poa.Update_Con_Pla_Mov_SaldoInicialINT(s,  Codigo, Pla_Tarea_Id, Pla_Partida_Id, Estado, Original_Id, Original_Codigo, Original_Pla_Tarea_Id, Original_Pla_Partida_Id, Original_Estado, Id, Valor_Inicial);
        }
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
		public List<Pla_Tarea> Pla_Tarea_GetByAnioLikePla_Cta_Codigo(Scope s , string p_Anio, string p_Pla_Cta_Codigo)
        {
            return Pla_Tarea.GetByAnioLikePla_Cta_Codigo(s,  p_Anio, p_Pla_Cta_Codigo);
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
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByArea_Codigo_RangoFecha_Solicita(Scope s , string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
            return Pla_Doc.GetByArea_Codigo_RangoFecha_Solicita(s,  p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByCodigo(Scope s , string p_Codigo)
        {
            return Pla_Doc.GetByCodigo(s,  p_Codigo);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Doc.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByRangoFecha_Solicita(Scope s , DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
            return Pla_Doc.GetByRangoFecha_Solicita(s,  p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByTipo_Area_Codigo_Codigo(Scope s , string p_Tipo, string p_Area_Codigo, string p_Codigo)
        {
            return Pla_Doc.GetByTipo_Area_Codigo_Codigo(s,  p_Tipo, p_Area_Codigo, p_Codigo);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByTipo_Area_Codigo_LikeDescripcion(Scope s , string p_Tipo, string p_Area_Codigo, string p_Descripcion)
        {
            return Pla_Doc.GetByTipo_Area_Codigo_LikeDescripcion(s,  p_Tipo, p_Area_Codigo, p_Descripcion);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita(Scope s , string p_Tipo, string p_Area_Codigo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
            return Pla_Doc.GetByTipo_Area_Codigo_RangoFecha_Solicita(s,  p_Tipo, p_Area_Codigo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByTipo_RangoFecha_Solicita(Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin)
        {
            return Pla_Doc.GetByTipo_RangoFecha_Solicita(s,  p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin);
        }
		[WebMethod]
		public List<Pla_Doc> Pla_Doc_GetByTipo_RangoFecha_Solicita_LikeDescripcion(Scope s , string p_Tipo, DateTime p_Fecha_Solicita_Ini, DateTime p_Fecha_Solicita_Fin, string p_Descripcion)
        {
            return Pla_Doc.GetByTipo_RangoFecha_Solicita_LikeDescripcion(s,  p_Tipo, p_Fecha_Solicita_Ini, p_Fecha_Solicita_Fin, p_Descripcion);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
				[WebMethod]
        public int Pla_Doc_InsertINT(Pla_Doc n)
        {
            return Pla_Doc.InsertINT(n);
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
				[WebMethod]
        public int Pla_Mov_InsertINT(Pla_Mov n)
        {
            return Pla_Mov.InsertINT(n);
        }
		#endregion
		#endregion
	    #region Servicios para Pla_Param
        private DO_Pla_Param _Pla_Param;
        public DO_Pla_Param Pla_Param {
            get {
                if (_Pla_Param == null)
                    _Pla_Param = new DO_Pla_Param();
                return _Pla_Param;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Param> Pla_Param_Get(Scope s)
        {
            return Pla_Param.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Param_Insert(Pla_Param n)
        {
            return Pla_Param.Insert(n);
        }
		[WebMethod]
        public int Pla_Param_Delete(Pla_Param o)
        {
            return Pla_Param.Delete(o);
        }
		[WebMethod]
        public int Pla_Param_Update(Pla_Param o,Pla_Param n)
        {
            return Pla_Param.Update(o, n);
        }
		#endregion
		#region Métodos Get
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
	    #region Servicios para Pla_PersonalDatos
        private DO_Pla_PersonalDatos _Pla_PersonalDatos;
        public DO_Pla_PersonalDatos Pla_PersonalDatos {
            get {
                if (_Pla_PersonalDatos == null)
                    _Pla_PersonalDatos = new DO_Pla_PersonalDatos();
                return _Pla_PersonalDatos;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_PersonalDatos> Pla_PersonalDatos_Get(Scope s)
        {
            return Pla_PersonalDatos.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_PersonalDatos_Insert(Pla_PersonalDatos n)
        {
            return Pla_PersonalDatos.Insert(n);
        }
		[WebMethod]
        public int Pla_PersonalDatos_Delete(Pla_PersonalDatos o)
        {
            return Pla_PersonalDatos.Delete(o);
        }
		[WebMethod]
        public int Pla_PersonalDatos_Update(Pla_PersonalDatos o,Pla_PersonalDatos n)
        {
            return Pla_PersonalDatos.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_PersonalDatos> Pla_PersonalDatos_GetById(Scope s , Int32 p_Id)
        {
            return Pla_PersonalDatos.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_PersonalDatos> Pla_PersonalDatos_GetByLikePer_Personal_Nombre(Scope s , string p_Per_Personal_Nombre)
        {
            return Pla_PersonalDatos.GetByLikePer_Personal_Nombre(s,  p_Per_Personal_Nombre);
        }
		[WebMethod]
		public List<Pla_PersonalDatos> Pla_PersonalDatos_GetByPer_Personal_Id(Scope s , string p_Per_Personal_Id)
        {
            return Pla_PersonalDatos.GetByPer_Personal_Id(s,  p_Per_Personal_Id);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
	    #region Servicios para Pla_Procedimiento
        private DO_Pla_Procedimiento _Pla_Procedimiento;
        public DO_Pla_Procedimiento Pla_Procedimiento {
            get {
                if (_Pla_Procedimiento == null)
                    _Pla_Procedimiento = new DO_Pla_Procedimiento();
                return _Pla_Procedimiento;
            }
        }

		#region Select
		[WebMethod]
        public List<Pla_Procedimiento> Pla_Procedimiento_Get(Scope s)
        {
            return Pla_Procedimiento.Get(s);
        }
		#endregion
		#region Insert, Delete, Update
		[WebMethod]
        public int Pla_Procedimiento_Insert(Pla_Procedimiento n)
        {
            return Pla_Procedimiento.Insert(n);
        }
		[WebMethod]
        public int Pla_Procedimiento_Delete(Pla_Procedimiento o)
        {
            return Pla_Procedimiento.Delete(o);
        }
		[WebMethod]
        public int Pla_Procedimiento_Update(Pla_Procedimiento o,Pla_Procedimiento n)
        {
            return Pla_Procedimiento.Update(o, n);
        }
		#endregion
		#region Métodos Get
		[WebMethod]
		public List<Pla_Procedimiento> Pla_Procedimiento_GetById(Scope s , Int32 p_Id)
        {
            return Pla_Procedimiento.GetById(s,  p_Id);
        }
		[WebMethod]
		public List<Pla_Procedimiento> Pla_Procedimiento_GetByLikeNombre(Scope s , string p_Nombre)
        {
            return Pla_Procedimiento.GetByLikeNombre(s,  p_Nombre);
        }
		#endregion
		#region Métodos Genéricos retornan un escalar
		#endregion
		#endregion
		}
}
