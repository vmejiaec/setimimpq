
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services;
using AEL.DIC;
using HER;
using BEL;
using CEL.DIC;
namespace EWS
{
    /// <summary>
    /// Summary description for WS_DIC
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_DIC : WebService
    {
        // Posible problema con static y nuevas consultas a la base
        // se debería optimizar la llamada a los objeto DO, 
        // para que esté creado desde el momento de la llamada
        // o
        // que problema existe en concurrencia??
        #region Servicios para Dic_Campo
        // Objeto permanente para acceso a DO_Dic_Campo
        private DO_Dic_Campo _Dic_Campo;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Campo
        /// </summary>
        public DO_Dic_Campo Dic_Campo
        {
            get
            {
                if (_Dic_Campo == null)
                    _Dic_Campo = new DO_Dic_Campo();
                return _Dic_Campo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Campo> Dic_Campo_Get(Scope s)
        {
            return Dic_Campo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Campo
        /// </summary>
        /// <returns>Todos los registros de Dic_Campo </returns>

        [WebMethod]
        public List<Dic_Campo> Dic_Campo_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Campo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Campo> Dic_Campo_GetById(Scope s, string Id)
        {
            return Dic_Campo.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Campo> Dic_Campo_GetByObjeto(Scope s, string Dic_Objeto_Id)
        {
            return Dic_Campo.GetByObjeto(s, Dic_Objeto_Id);
        }
        [WebMethod]
        public List<Dic_Campo> Dic_Campo_GetByLikeNombre(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            return Dic_Campo.GetByLikeNombre(s, Dic_Objeto_Id, Nombre);
        }
        [WebMethod]
        public List<Dic_Campo> Dic_Campo_GetByLikeObjeto(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            return Dic_Campo.GetByLikeObjeto(s, Dic_Objeto_Id, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Campo
        /// <summary>
        /// Borra el objeto de Dic_Campo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Campo_Delete(Scope s, Dic_Campo o)
        {
            try
            {
                return Dic_Campo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Campo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Campo_Insert(Scope s, Dic_Campo o)
        {
            try
            {
                return Dic_Campo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Campo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Campo_Update(Scope s, Dic_Campo o, Dic_Campo original)
        {
            try
            {
                return Dic_Campo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Con_Campo
        // Objeto permanente para acceso a DO_Dic_Con_Campo
        private DO_Dic_Con_Campo _Dic_Con_Campo;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Con_Campo
        /// </summary>
        public DO_Dic_Con_Campo Dic_Con_Campo
        {
            get
            {
                if (_Dic_Con_Campo == null)
                    _Dic_Con_Campo = new DO_Dic_Con_Campo();
                return _Dic_Con_Campo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Con_Campo> Dic_Con_Campo_Get(Scope s)
        {
            return Dic_Con_Campo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Con_Campo
        /// </summary>
        /// <returns>Todos los registros de Dic_Con_Campo </returns>

        [WebMethod]
        public List<Dic_Con_Campo> Dic_Con_Campo_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Con_Campo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Con_Campo> Dic_Con_Campo_GetByConObjeto(Scope s, string Dic_Con_Objeto_Id, string int_usuario_id)
        {
            return Dic_Con_Campo.GetByConObjeto(s, Dic_Con_Objeto_Id, int_usuario_id);
        }
        [WebMethod]
        public List<Dic_Con_Campo> Dic_Con_Campo_GetById(Scope s, string Id)
        {
            return Dic_Con_Campo.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Con_Campo> Dic_Con_Campo_GetByObjeto(Scope s, string con_Objeto_id)
        {
            return Dic_Con_Campo.GetByObjeto(s, con_Objeto_id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Con_Campo
        /// <summary>
        /// Borra el objeto de Dic_Con_Campo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Con_Campo_Delete(Scope s, Dic_Con_Campo o)
        {
            try
            {
                return Dic_Con_Campo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Con_Campo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Con_Campo_Insert(Scope s, Dic_Con_Campo o)
        {
            try
            {
                return Dic_Con_Campo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Con_Campo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Con_Campo_Update(Scope s, Dic_Con_Campo o, Dic_Con_Campo original)
        {
            try
            {
                return Dic_Con_Campo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Contenedor
        // Objeto permanente para acceso a DO_Dic_Contenedor
        private DO_Dic_Contenedor _Dic_Contenedor;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Contenedor
        /// </summary>
        public DO_Dic_Contenedor Dic_Contenedor
        {
            get
            {
                if (_Dic_Contenedor == null)
                    _Dic_Contenedor = new DO_Dic_Contenedor();
                return _Dic_Contenedor;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_Get(Scope s)
        {
            return Dic_Contenedor.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Contenedor
        /// </summary>
        /// <returns>Todos los registros de Dic_Contenedor </returns>

        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Contenedor.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetById(Scope s, string Id)
        {
            return Dic_Contenedor.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByMantenimiento(Scope s, string int_empresa_Id)
        {
            return Dic_Contenedor.GetByMantenimiento(s, int_empresa_Id);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByModulo(Scope s, string Dic_Modulo_Id)
        {
            return Dic_Contenedor.GetByModulo(s, Dic_Modulo_Id);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByNombre(Scope s, string Nombre)
        {
            return Dic_Contenedor.GetByNombre(s, Nombre);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByLikeNombreMenu(Scope s, string Nombre)
        {
            return Dic_Contenedor.GetByLikeNombreMenu(s, Nombre);
        }
        [WebMethod]
        public List<Dic_Contenedor> Dic_Contenedor_GetByLikeNombre(Scope s, string Nombre)
        {
            return Dic_Contenedor.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Contenedor
        /// <summary>
        /// Borra el objeto de Dic_Contenedor
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Contenedor_Delete(Scope s, Dic_Contenedor o)
        {
            try
            {
                return Dic_Contenedor.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Contenedor
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Contenedor_Insert(Scope s, Dic_Contenedor o)
        {
            try
            {
                return Dic_Contenedor.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Contenedor
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Contenedor_Update(Scope s, Dic_Contenedor o, Dic_Contenedor original)
        {
            try
            {
                return Dic_Contenedor.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_General
        // Objeto permanente para acceso a DO_Dic_General
        private DO_Dic_General _Dic_General;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_General
        /// </summary>
        public DO_Dic_General Dic_General
        {
            get
            {
                if (_Dic_General == null)
                    _Dic_General = new DO_Dic_General();
                return _Dic_General;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_General> Dic_General_Get(Scope s)
        {
            return Dic_General.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_General
        /// </summary>
        /// <returns>Todos los registros de Dic_General </returns>

        [WebMethod]
        public List<Dic_General> Dic_General_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_General.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_General> Dic_General_GetById(Scope s, string Id)
        {
            return Dic_General.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_General> Dic_General_GetByTipo(Scope s, string Tipo)
        {
            return Dic_General.GetByTipo(s, Tipo);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_General
        /// <summary>
        /// Borra el objeto de Dic_General
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_General_Delete(Scope s, Dic_General o)
        {
            try
            {
                return Dic_General.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_General
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_General_Insert(Scope s, Dic_General o)
        {
            try
            {
                return Dic_General.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_General
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_General_Update(Scope s, Dic_General o, Dic_General original)
        {
            try
            {
                return Dic_General.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Modulo
        // Objeto permanente para acceso a DO_Dic_Modulo
        private DO_Dic_Modulo _Dic_Modulo;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Modulo
        /// </summary>
        public DO_Dic_Modulo Dic_Modulo
        {
            get
            {
                if (_Dic_Modulo == null)
                    _Dic_Modulo = new DO_Dic_Modulo();
                return _Dic_Modulo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Modulo> Dic_Modulo_Get(Scope s)
        {
            return Dic_Modulo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Modulo
        /// </summary>
        /// <returns>Todos los registros de Dic_Modulo </returns>

        [WebMethod]
        public List<Dic_Modulo> Dic_Modulo_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Modulo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Modulo> Dic_Modulo_GetById(Scope s, string Id)
        {
            return Dic_Modulo.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Modulo> Dic_Modulo_GetByLikeNombre(Scope s, string Nombre)
        {
            return Dic_Modulo.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Modulo
        /// <summary>
        /// Borra el objeto de Dic_Modulo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Modulo_Delete(Scope s, Dic_Modulo o)
        {
            try
            {
                return Dic_Modulo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Modulo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Modulo_Insert(Scope s, Dic_Modulo o)
        {
            try
            {
                return Dic_Modulo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Modulo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Modulo_Update(Scope s, Dic_Modulo o, Dic_Modulo original)
        {
            try
            {
                return Dic_Modulo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Rotulo
        // Objeto permanente para acceso a DO_Dic_Rotulo
        private DO_Dic_Rotulo _Dic_Rotulo;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Rotulo
        /// </summary>
        public DO_Dic_Rotulo Dic_Rotulo
        {
            get
            {
                if (_Dic_Rotulo == null)
                    _Dic_Rotulo = new DO_Dic_Rotulo();
                return _Dic_Rotulo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Rotulo> Dic_Rotulo_Get(Scope s)
        {
            return Dic_Rotulo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Rotulo
        /// </summary>
        /// <returns>Todos los registros de Dic_Rotulo </returns>

        [WebMethod]
        public List<Dic_Rotulo> Dic_Rotulo_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Rotulo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Rotulo> Dic_Rotulo_GetById(Scope s, string Id)
        {
            return Dic_Rotulo.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Rotulo> Dic_Rotulo_GetByMantenimiento(Scope s)
        {
            return Dic_Rotulo.GetByMantenimiento(s);
        }
        [WebMethod]
        public List<Dic_Rotulo> Dic_Rotulo_GetByLikeNombre(Scope s, string Nombre)
        {
            return Dic_Rotulo.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Rotulo
        /// <summary>
        /// Borra el objeto de Dic_Rotulo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Rotulo_Delete(Scope s, Dic_Rotulo o)
        {
            try
            {
                return Dic_Rotulo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Rotulo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Rotulo_Insert(Scope s, Dic_Rotulo o)
        {
            try
            {
                return Dic_Rotulo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Rotulo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Rotulo_Update(Scope s, Dic_Rotulo o, Dic_Rotulo original)
        {
            try
            {
                return Dic_Rotulo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Secuencia
        // Objeto permanente para acceso a DO_Dic_Secuencia
        private DO_Dic_Secuencia _Dic_Secuencia;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Secuencia
        /// </summary>
        public DO_Dic_Secuencia Dic_Secuencia
        {
            get
            {
                if (_Dic_Secuencia == null)
                    _Dic_Secuencia = new DO_Dic_Secuencia();
                return _Dic_Secuencia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Secuencia> Dic_Secuencia_Get(Scope s)
        {
            return Dic_Secuencia.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Secuencia
        /// </summary>
        /// <returns>Todos los registros de Dic_Secuencia </returns>

        [WebMethod]
        public List<Dic_Secuencia> Dic_Secuencia_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Secuencia.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Secuencia> Dic_Secuencia_GetById(Scope s, string Id)
        {
            return Dic_Secuencia.GetById(s, Id);
        }
        #endregion
        #region Procedimientos
        [WebMethod]
        public int Dic_Secuencia_BloquearId(Scope s, string p_Id)
        {
            return Dic_Secuencia.BloquearId(s, p_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Secuencia
        /// <summary>
        /// Borra el objeto de Dic_Secuencia
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Secuencia_Delete(Scope s, Dic_Secuencia o)
        {
            try
            {
                return Dic_Secuencia.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Secuencia
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Secuencia_Insert(Scope s, Dic_Secuencia o)
        {
            try
            {
                return Dic_Secuencia.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Secuencia
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Secuencia_Update(Scope s, Dic_Secuencia o, Dic_Secuencia original)
        {
            try
            {
                return Dic_Secuencia.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Dominio
        // Objeto permanente para acceso a DO_Dic_Dominio
        private DO_Dic_Dominio _Dic_Dominio;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Dominio
        /// </summary>
        public DO_Dic_Dominio Dic_Dominio
        {
            get
            {
                if (_Dic_Dominio == null)
                    _Dic_Dominio = new DO_Dic_Dominio();
                return _Dic_Dominio;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Dominio> Dic_Dominio_Get(Scope s)
        {
            return Dic_Dominio.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Dominio
        /// </summary>
        /// <returns>Todos los registros de Dic_Dominio </returns>

        [WebMethod]
        public List<Dic_Dominio> Dic_Dominio_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Dominio.GetByCodigo(s, Codigo);
        }
        
        [WebMethod]
        public List<Dic_Dominio> Dic_Dominio_GetById(Scope s, string Id)
        {
            return Dic_Dominio.GetById(s, Id);
        }

        [WebMethod]
        public List<Dic_Dominio> Dic_Dominio_GetByObjetoCampo(Scope s, string Objeto_Nombre, string Campo_Nombre)
        {
            return Dic_Dominio.GetByObjetoCampo(s, Objeto_Nombre, Campo_Nombre);
        }

        [WebMethod]
        public List<Dic_Dominio> Dic_Dominio_GetByMantenimiento(Scope s)
        {
            return Dic_Dominio.GetByMantenimiento(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Dominio
        /// <summary>
        /// Borra el objeto de Dic_Dominio
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Dominio_Delete(Scope s, Dic_Dominio o)
        {
            try
            {
                return Dic_Dominio.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Dominio
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Dominio_Insert(Scope s, Dic_Dominio o)
        {
            try
            {
                return Dic_Dominio.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Dominio
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Dominio_Update(Scope s, Dic_Dominio o, Dic_Dominio original)
        {
            try
            {
                return Dic_Dominio.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Objeto
        // Objeto permanente para acceso a DO_Dic_Objeto
        private DO_Dic_Objeto _Dic_Objeto;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Objeto
        /// </summary>
        public DO_Dic_Objeto Dic_Objeto
        {
            get
            {
                if (_Dic_Objeto == null)
                    _Dic_Objeto = new DO_Dic_Objeto();
                return _Dic_Objeto;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_Get(Scope s)
        {
            return Dic_Objeto.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Objeto
        /// </summary>
        /// <returns>Todos los registros de Dic_Objeto </returns>

        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Objeto.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetById(Scope s, string Id)
        {
            return Dic_Objeto.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetByMantenimiento(Scope s, string int_empresa_id)
        {
            return Dic_Objeto.GetByMantenimiento(s, int_empresa_id);
        }
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetByMantenimiento1(Scope s)
        {
            return Dic_Objeto.GetByMantenimiento1(s);
        }
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetByNombre(Scope s, string Nombre)
        {
            return Dic_Objeto.GetByNombre(s, Nombre);
        }
        [WebMethod]
        public List<Dic_Objeto> Dic_Objeto_GetByLikeNombre(Scope s, string Nombre)
        {
            return Dic_Objeto.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Objeto
        /// <summary>
        /// Borra el objeto de Dic_Objeto
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Objeto_Delete(Scope s, Dic_Objeto o)
        {
            try
            {
                return Dic_Objeto.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Objeto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Objeto_Insert(Scope s, Dic_Objeto o)
        {
            try
            {
                return Dic_Objeto.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Objeto
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Objeto_Update(Scope s, Dic_Objeto o, Dic_Objeto original)
        {
            try
            {
                return Dic_Objeto.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }

        }
        #endregion
        #endregion

        #region Servicios para Dic_Con_Objeto
        // Objeto permanente para acceso a DO_Dic_Con_Objeto
        private DO_Dic_Con_Objeto _Dic_Con_Objeto;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Con_Objeto
        /// </summary>
        public DO_Dic_Con_Objeto Dic_Con_Objeto
        {
            get
            {
                if (_Dic_Con_Objeto == null)
                    _Dic_Con_Objeto = new DO_Dic_Con_Objeto();
                return _Dic_Con_Objeto;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Con_Objeto> Dic_Con_Objeto_Get(Scope s)
        {
            return Dic_Con_Objeto.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Con_Objeto
        /// </summary>
        /// <returns>Todos los registros de Dic_Con_Objeto </returns>

        [WebMethod]
        public List<Dic_Con_Objeto> Dic_Con_Objeto_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Con_Objeto.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Con_Objeto> Dic_Con_Objeto_GetByContenedorObjetoOrden(Scope s, string dic_contenedor_nombre, string dic_objeto_nombre, int Orden)
        {
            return Dic_Con_Objeto.GetByContenedorObjetoOrden(s, dic_contenedor_nombre, dic_objeto_nombre, Orden);
        }
        [WebMethod]
        public List<Dic_Con_Objeto> Dic_Con_Objeto_GetById(Scope s, string Id)
        {
            return Dic_Con_Objeto.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Con_Objeto> Dic_Con_Objeto_GetByLikeNombre(Scope s, string Dic_Contenedor_Id, string Dic_Objeto_Id, string Nombre)
        {
            return Dic_Con_Objeto.GetByLikeNombre(s, Dic_Contenedor_Id, Dic_Objeto_Id, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Con_Objeto
        /// <summary>
        /// Borra el objeto de Dic_Con_Objeto
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Con_Objeto_Delete(Scope s, Dic_Con_Objeto o)
        {
            try
            {
                return Dic_Con_Objeto.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Con_Objeto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Con_Objeto_Insert(Scope s, Dic_Con_Objeto o)
        {
            try
            {
                return Dic_Con_Objeto.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Con_Objeto
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Con_Objeto_Update(Scope s, Dic_Con_Objeto o, Dic_Con_Objeto original)
        {
            try
            {
                return Dic_Con_Objeto.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Codigo
        // Objeto permanente para acceso a DO_Dic_Codigo
        private DO_Dic_Codigo _Dic_Codigo;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Codigo
        /// </summary>
        public DO_Dic_Codigo Dic_Codigo
        {
            get
            {
                if (_Dic_Codigo == null)
                    _Dic_Codigo = new DO_Dic_Codigo();
                return _Dic_Codigo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Codigo> Dic_Codigo_Get(Scope s)
        {
            return Dic_Codigo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Codigo
        /// </summary>
        /// <returns>Todos los registros de Dic_Codigo </returns>

        [WebMethod]
        public List<Dic_Codigo> Dic_Codigo_GetByCampo(Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
        {
            return Dic_Codigo.GetByCampo(s, Dic_Objeto_Nombre, Dic_Campo_Nombre);
        }
        [WebMethod]
        public List<Dic_Codigo> Dic_Codigo_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Codigo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Codigo> Dic_Codigo_GetById(Scope s, string Id)
        {
            return Dic_Codigo.GetById(s, Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Codigo
        /// <summary>
        /// Borra el objeto de Dic_Codigo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Codigo_Delete(Scope s, Dic_Codigo o)
        {
            try
            {
                return Dic_Codigo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Codigo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Codigo_Insert(Scope s, Dic_Codigo o)
        {
            try
            {
                return Dic_Codigo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Codigo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Codigo_Update(Scope s, Dic_Codigo o, Dic_Codigo original)
        {
            try
            {
                return Dic_Codigo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Paginacion
        // Objeto permanente para acceso a DO_Dic_Paginacion
        private DO_Dic_Paginacion _Dic_Paginacion;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Paginacion
        /// </summary>
        public DO_Dic_Paginacion Dic_Paginacion
        {
            get
            {
                if (_Dic_Paginacion == null)
                    _Dic_Paginacion = new DO_Dic_Paginacion();
                return _Dic_Paginacion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Paginacion> Dic_Paginacion_Get(Scope s)
        {
            return Dic_Paginacion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Paginacion
        /// </summary>
        /// <returns>Todos los registros de Dic_Paginacion </returns>

        [WebMethod]
        public List<Dic_Paginacion> Dic_Paginacion_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Paginacion.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Paginacion> Dic_Paginacion_GetById(Scope s, string Id)
        {
            return Dic_Paginacion.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Paginacion> Dic_Paginacion_GetByServidorObjeto(Scope s, string Par_Servidor_Id, string dic_objeto_Id)
        {
            return Dic_Paginacion.GetByServidorObjeto(s, Par_Servidor_Id, dic_objeto_Id);
        }
        #endregion
        #region Procedimientos
        [WebMethod]
        public int Dic_Paginacion_DeleteServidorObjeto(Scope s,
                                                       string p_Par_Servidor_Id,
                                                       string p_Dic_Objeto_Id)
        {
            return Dic_Paginacion.DeleteServidorObjeto(s,
                                                        p_Par_Servidor_Id,
                                                        p_Dic_Objeto_Id
                                                       );
        }
        [WebMethod]
        public int Dic_Paginacion_NumeroSecciones(Scope s, string p_Par_Servidor_Id, string p_Dic_Objeto_Id)
        {
            return Dic_Paginacion.NumeroSecciones(s, p_Par_Servidor_Id, p_Dic_Objeto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Paginacion
        /// <summary>
        /// Borra el objeto de Dic_Paginacion
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Paginacion_Delete(Scope s, Dic_Paginacion o)
        {
            try
            {
                return Dic_Paginacion.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Paginacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Paginacion_Insert(Scope s, Dic_Paginacion o)
        {
            try
            {
                return Dic_Paginacion.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Paginacion
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Paginacion_Update(Scope s, Dic_Paginacion o, Dic_Paginacion original)
        {
            try
            {
                return Dic_Paginacion.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Par_Paginacion
        // Objeto permanente para acceso a DO_Dic_Par_Paginacion
        private DO_Dic_Par_Paginacion _Dic_Par_Paginacion;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Par_Paginacion
        /// </summary>
        public DO_Dic_Par_Paginacion Dic_Par_Paginacion
        {
            get
            {
                if (_Dic_Par_Paginacion == null)
                    _Dic_Par_Paginacion = new DO_Dic_Par_Paginacion();
                return _Dic_Par_Paginacion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Par_Paginacion> Dic_Par_Paginacion_Get(Scope s)
        {
            return Dic_Par_Paginacion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Par_Paginacion
        /// </summary>
        /// <returns>Todos los registros de Dic_Par_Paginacion </returns>

        [WebMethod]
        public List<Dic_Par_Paginacion> Dic_Par_Paginacion_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Par_Paginacion.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Par_Paginacion> Dic_Par_Paginacion_GetById(Scope s, string Id)
        {
            return Dic_Par_Paginacion.GetById(s, Id);
        }
        #endregion
        #region Procedimientos
        [WebMethod]
        public int Dic_Par_Paginacion_NumeroRegistros(Scope s, string p_dic_objeto_nombre)
        {
            return Dic_Par_Paginacion.NumeroRegistros(s, p_dic_objeto_nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Par_Paginacion
        /// <summary>
        /// Borra el objeto de Dic_Par_Paginacion
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Par_Paginacion_Delete(Scope s, Dic_Par_Paginacion o)
        {
            try
            {
                return Dic_Par_Paginacion.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Par_Paginacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Par_Paginacion_Insert(Scope s, Dic_Par_Paginacion o)
        {
            try
            {
                return Dic_Par_Paginacion.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Par_Paginacion
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Par_Paginacion_Update(Scope s, Dic_Par_Paginacion o, Dic_Par_Paginacion original)
        {
            try
            {
                return Dic_Par_Paginacion.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Pantalla
        // Objeto permanente para acceso a DO_Dic_Pantalla
        private DO_Dic_Pantalla _Dic_Pantalla;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Pantalla
        /// </summary>
        public DO_Dic_Pantalla Dic_Pantalla
        {
            get
            {
                if (_Dic_Pantalla == null)
                    _Dic_Pantalla = new DO_Dic_Pantalla();
                return _Dic_Pantalla;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Pantalla> Dic_Pantalla_Get(Scope s)
        {
            return Dic_Pantalla.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Pantalla
        /// </summary>
        /// <returns>Todos los registros de Dic_Pantalla </returns>

        [WebMethod]
        public List<Dic_Pantalla> Dic_Pantalla_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Pantalla.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Pantalla> Dic_Pantalla_GetById(Scope s, string Id)
        {
            return Dic_Pantalla.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Pantalla> Dic_Pantalla_GetByLikeEtiqueta(Scope s, string nombre)
        {
            return Dic_Pantalla.GetByLikeEtiqueta(s, nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Pantalla
        /// <summary>
        /// Borra el objeto de Dic_Pantalla
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Pantalla_Delete(Scope s, Dic_Pantalla o)
        {
            return Dic_Pantalla.Delete(s, o);
        }
        /// <summary>
        /// Inserta el objeto en Dic_Pantalla
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Pantalla_Insert(Scope s, Dic_Pantalla o)
        {
            try
            {
                return Dic_Pantalla.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Pantalla
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Pantalla_Update(Scope s, Dic_Pantalla o, Dic_Pantalla original)
        {
            try
            {
                return Dic_Pantalla.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Dic_Con_Elemento
        // Objeto permanente para acceso a DO_Dic_Con_Elemento
        private DO_Dic_Con_Elemento _Dic_Con_Elemento;
        /// <summary>
        /// La propiedad para acceso a DO_Dic_Con_Elemento
        /// </summary>
        public DO_Dic_Con_Elemento Dic_Con_Elemento
        {
            get
            {
                if (_Dic_Con_Elemento == null)
                    _Dic_Con_Elemento = new DO_Dic_Con_Elemento();
                return _Dic_Con_Elemento;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Dic_Con_Elemento> Dic_Con_Elemento_Get(Scope s)
        {
            return Dic_Con_Elemento.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Dic_Con_Elemento
        /// </summary>
        /// <returns>Todos los registros de Dic_Con_Elemento </returns>

        [WebMethod]
        public List<Dic_Con_Elemento> Dic_Con_Elemento_GetByCodigo(Scope s, string Codigo)
        {
            return Dic_Con_Elemento.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Dic_Con_Elemento> Dic_Con_Elemento_GetByContenedor(Scope s, string dic_Contenedor_id)
        {
            return Dic_Con_Elemento.GetByContenedor(s, dic_Contenedor_id);
        }
        [WebMethod]
        public List<Dic_Con_Elemento> Dic_Con_Elemento_GetById(Scope s, string Id)
        {
            return Dic_Con_Elemento.GetById(s, Id);
        }
        [WebMethod]
        public List<Dic_Con_Elemento> Dic_Con_Elemento_GetByTipoLikeEtiqueta(Scope s, string Tipo, string Nombre)
        {
            return Dic_Con_Elemento.GetByTipoLikeEtiqueta(s, Tipo, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Dic_Con_Elemento
        /// <summary>
        /// Borra el objeto de Dic_Con_Elemento
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Dic_Con_Elemento_Delete(Scope s, Dic_Con_Elemento o)
        {
            try
            {
                return Dic_Con_Elemento.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Dic_Con_Elemento
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Dic_Con_Elemento_Insert(Scope s, Dic_Con_Elemento o)
        {
            try
            {
                return Dic_Con_Elemento.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Dic_Con_Elemento
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Dic_Con_Elemento_Update(Scope s, Dic_Con_Elemento o, Dic_Con_Elemento original)
        {
            try
            {
                return Dic_Con_Elemento.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

    }
}