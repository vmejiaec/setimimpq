
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services;
using AEL.PAR;
using BEL;
using CEL.PAR;
using HER;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_PAR
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_PAR : WebService
    {
        // Posible problema con static y nuevas consultas a la base
        // se debería optimizar la llamada a los objeto DO, 
        // para que esté creado desde el momento de la llamada
        // o
        // que problema existe en concurrencia??
        #region Servicios para Par_Mensajeria
        // Objeto permanente para acceso a DO_Par_Mensajeria
        private DO_Par_Mensajeria _Par_Mensajeria;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Mensajeria
        /// </summary>
        public DO_Par_Mensajeria Par_Mensajeria
        {
            get
            {
                if (_Par_Mensajeria == null)
                    _Par_Mensajeria = new DO_Par_Mensajeria();
                return _Par_Mensajeria;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Mensajeria> Par_Mensajeria_Get(Scope s)
        {
            return Par_Mensajeria.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Mensajeria
        /// </summary>
        /// <returns>Todos los registros de Par_Mensajeria </returns>

        [WebMethod]
        public List<Par_Mensajeria> Par_Mensajeria_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Mensajeria.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Mensajeria> Par_Mensajeria_GetById(Scope s, string Id)
        {
            return Par_Mensajeria.GetById(s, Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Mensajeria
        /// <summary>
        /// Borra el objeto de Par_Mensajeria
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Mensajeria_Delete(Scope s, Par_Mensajeria o)
        {
            try
            {
                return Par_Mensajeria.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Mensajeria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Mensajeria_Insert(Scope s, Par_Mensajeria o)
        {
            try
            {
                return Par_Mensajeria.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Mensajeria
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Mensajeria_Update(Scope s, Par_Mensajeria o, Par_Mensajeria original)
        {
            try
            {
                return Par_Mensajeria.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Servidor
        // Objeto permanente para acceso a DO_Par_Servidor
        private DO_Par_Servidor _Par_Servidor;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Servidor
        /// </summary>
        public DO_Par_Servidor Par_Servidor
        {
            get
            {
                if (_Par_Servidor == null)
                    _Par_Servidor = new DO_Par_Servidor();
                return _Par_Servidor;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Servidor> Par_Servidor_Get(Scope s)
        {
            return Par_Servidor.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Servidor
        /// </summary>
        /// <returns>Todos los registros de Par_Servidor </returns>

        [WebMethod]
        public List<Par_Servidor> Par_Servidor_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Servidor.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Servidor> Par_Servidor_GetById(Scope s, string Id)
        {
            return Par_Servidor.GetById(s, Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Servidor
        /// <summary>
        /// Borra el objeto de Par_Servidor
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Servidor_Delete(Scope s, Par_Servidor o)
        {
            try
            {
                return Par_Servidor.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Servidor
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Servidor_Insert(Scope s, Par_Servidor o)
        {
            try
            {
                return Par_Servidor.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Servidor
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Servidor_Update(Scope s, Par_Servidor o, Par_Servidor original)
        {
            try
            {
                return Par_Servidor.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Servidor_Det
        // Objeto permanente para acceso a DO_Par_Servidor_Det
        private DO_Par_Servidor_Det _Par_Servidor_Det;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Servidor_Det
        /// </summary>
        public DO_Par_Servidor_Det Par_Servidor_Det
        {
            get
            {
                if (_Par_Servidor_Det == null)
                    _Par_Servidor_Det = new DO_Par_Servidor_Det();
                return _Par_Servidor_Det;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Servidor_Det> Par_Servidor_Det_Get(Scope s)
        {
            return Par_Servidor_Det.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Servidor_Det
        /// </summary>
        /// <returns>Todos los registros de Par_Servidor_Det </returns>

        [WebMethod]
        public List<Par_Servidor_Det> Par_Servidor_Det_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Servidor_Det.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Servidor_Det> Par_Servidor_Det_GetByContenedor(Scope s, string dic_contenedor_id)
        {
            return Par_Servidor_Det.GetByContenedor(s, dic_contenedor_id);
        }
        [WebMethod]
        public List<Par_Servidor_Det> Par_Servidor_Det_GetById(Scope s, string Id)
        {
            return Par_Servidor_Det.GetById(s, Id);
        }
        [WebMethod]
        public List<Par_Servidor_Det> Par_Servidor_Det_GetByReferencia(Scope s, string Referencia)
        {
            return Par_Servidor_Det.GetByReferencia(s, Referencia);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Servidor_Det
        /// <summary>
        /// Borra el objeto de Par_Servidor_Det
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Servidor_Det_Delete(Scope s, Par_Servidor_Det o)
        {
            try
            {
                return Par_Servidor_Det.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Servidor_Det
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Servidor_Det_Insert(Scope s, Par_Servidor_Det o)
        {
            try
            {
                return Par_Servidor_Det.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Servidor_Det
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Servidor_Det_Update(Scope s, Par_Servidor_Det o, Par_Servidor_Det original)
        {
            try
            {
                return Par_Servidor_Det.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Mensaje
        // Objeto permanente para acceso a DO_Par_Mensaje
        private DO_Par_Mensaje _Par_Mensaje;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Mensaje
        /// </summary>
        public DO_Par_Mensaje Par_Mensaje
        {
            get
            {
                if (_Par_Mensaje == null)
                    _Par_Mensaje = new DO_Par_Mensaje();
                return _Par_Mensaje;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Mensaje> Par_Mensaje_Get(Scope s)
        {
            return Par_Mensaje.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Mensaje
        /// </summary>
        /// <returns>Todos los registros de Par_Mensaje </returns>

        [WebMethod]
        public List<Par_Mensaje> Par_Mensaje_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Mensaje.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Mensaje> Par_Mensaje_GetById(Scope s, string Id)
        {
            return Par_Mensaje.GetById(s, Id);
        }
        [WebMethod]
        public List<Par_Mensaje> Par_Mensaje_GetByMantenimiento(Scope s)
        {
            return Par_Mensaje.GetByMantenimiento(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Mensaje
        /// <summary>
        /// Borra el objeto de Par_Mensaje
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Mensaje_Delete(Scope s, Par_Mensaje o)
        {
            try
            {
                return Par_Mensaje.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Mensaje
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Mensaje_Insert(Scope s, Par_Mensaje o)
        {
            try
            {
                return Par_Mensaje.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Mensaje
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Mensaje_Update(Scope s, Par_Mensaje o, Par_Mensaje original)
        {
            try
            {
                return Par_Mensaje.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Recursos
        // Objeto permanente para acceso a DO_Par_Recursos
        private DO_Par_Recursos _Par_Recursos;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Recursos
        /// </summary>
        public DO_Par_Recursos Par_Recursos
        {
            get
            {
                if (_Par_Recursos == null)
                    _Par_Recursos = new DO_Par_Recursos();
                return _Par_Recursos;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Recursos> Par_Recursos_GetByContenedor(Scope s, string dic_contenedor_id)
        {
            return Par_Recursos.GetByContenedor(s, dic_contenedor_id);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Recursos
        /// </summary>
        /// <returns>Todos los registros de Par_Recursos </returns>

        #endregion

        #endregion

        #region Servicios para Par_Recursos_Base
        // Objeto permanente para acceso a DO_Par_Recursos_Base
        private DO_Par_Recursos_Base _Par_Recursos_Base;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Recursos_Base
        /// </summary>
        public DO_Par_Recursos_Base Par_Recursos_Base
        {
            get
            {
                if (_Par_Recursos_Base == null)
                    _Par_Recursos_Base = new DO_Par_Recursos_Base();
                return _Par_Recursos_Base;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Recursos_Base> Par_Recursos_Base_GetBase(Scope s)
        {
            return Par_Recursos_Base.GetBase(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Recursos_Base
        /// </summary>
        /// <returns>Todos los registros de Par_Recursos_Base </returns>

        #endregion

        #endregion

        #region Servicios para Par_Filtro
        // Objeto permanente para acceso a DO_Par_Filtro
        private DO_Par_Filtro _Par_Filtro;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Filtro
        /// </summary>
        public DO_Par_Filtro Par_Filtro
        {
            get
            {
                if (_Par_Filtro == null)
                    _Par_Filtro = new DO_Par_Filtro();
                return _Par_Filtro;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Filtro> Par_Filtro_Get(Scope s)
        {
            return Par_Filtro.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Filtro
        /// </summary>
        /// <returns>Todos los registros de Par_Filtro </returns>

        [WebMethod]
        public List<Par_Filtro> Par_Filtro_GetByConObjetoUsuario(Scope s, string dic_con_objeto_id, string int_usuario_id)
        {
            return Par_Filtro.GetByConObjetoUsuario(s, dic_con_objeto_id, int_usuario_id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Filtro
        /// <summary>
        /// Borra el objeto de Par_Filtro
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Filtro_Delete(Scope s, Par_Filtro o)
        {
            try
            {
                return Par_Filtro.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Filtro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Filtro_Insert(Scope s, Par_Filtro o)
        {
            try
            {
                return Par_Filtro.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Filtro
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Filtro_Update(Scope s, Par_Filtro o, Par_Filtro original)
        {
            try
            {
                return Par_Filtro.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Tipo_Identificacion
        // Objeto permanente para acceso a DO_Par_Tipo_Identificacion
        private DO_Par_Tipo_Identificacion _Par_Tipo_Identificacion;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Tipo_Identificacion
        /// </summary>
        public DO_Par_Tipo_Identificacion Par_Tipo_Identificacion
        {
            get
            {
                if (_Par_Tipo_Identificacion == null)
                    _Par_Tipo_Identificacion = new DO_Par_Tipo_Identificacion();
                return _Par_Tipo_Identificacion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Tipo_Identificacion> Par_Tipo_Identificacion_Get(Scope s)
        {
            return Par_Tipo_Identificacion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Tipo_Identificacion
        /// </summary>
        /// <returns>Todos los registros de Par_Tipo_Identificacion </returns>

        [WebMethod]
        public List<Par_Tipo_Identificacion> Par_Tipo_Identificacion_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Tipo_Identificacion.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Tipo_Identificacion> Par_Tipo_Identificacion_GetByEmpresa(Scope s)
        {
            return Par_Tipo_Identificacion.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Par_Tipo_Identificacion> Par_Tipo_Identificacion_GetById(Scope s, string Id)
        {
            return Par_Tipo_Identificacion.GetById(s, Id);
        }
        [WebMethod]
        public List<Par_Tipo_Identificacion> Par_Tipo_Identificacion_GetByLikeNombre(Scope s, string Nombre)
        {
            return Par_Tipo_Identificacion.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Tipo_Identificacion
        /// <summary>
        /// Borra el objeto de Par_Tipo_Identificacion
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Tipo_Identificacion_Delete(Scope s, Par_Tipo_Identificacion o)
        {
            try
            {
                return Par_Tipo_Identificacion.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Tipo_Identificacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Tipo_Identificacion_Insert(Scope s, Par_Tipo_Identificacion o)
        {
            try
            {
                return Par_Tipo_Identificacion.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Tipo_Identificacion
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Tipo_Identificacion_Update(Scope s, Par_Tipo_Identificacion o, Par_Tipo_Identificacion original)
        {
            try
            {
                return Par_Tipo_Identificacion.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Razon_Social
        // Objeto permanente para acceso a DO_Par_Razon_Social
        private DO_Par_Razon_Social _Par_Razon_Social;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Razon_Social
        /// </summary>
        public DO_Par_Razon_Social Par_Razon_Social
        {
            get
            {
                if (_Par_Razon_Social == null)
                    _Par_Razon_Social = new DO_Par_Razon_Social();
                return _Par_Razon_Social;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_Get(Scope s)
        {
            return Par_Razon_Social.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Razon_Social
        /// </summary>
        /// <returns>Todos los registros de Par_Razon_Social </returns>

        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Razon_Social.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetByEmpresa(Scope s)
        {
            return Par_Razon_Social.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetById(Scope s, string Id)
        {
            return Par_Razon_Social.GetById(s, Id);
        }
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetByLikeNombre(Scope s, string Par_Tipo_Identificacion_Id, string Nombre)
        {
            return Par_Razon_Social.GetByLikeNombre(s, Par_Tipo_Identificacion_Id, Nombre);
        }
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetByLikeNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            return Par_Razon_Social.GetByLikeNumero(s, Par_Tipo_Identificacion_Id, Numero);
        }
        [WebMethod]
        public List<Par_Razon_Social> Par_Razon_Social_GetByTipoNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            return Par_Razon_Social.GetByTipoNumero(s, Par_Tipo_Identificacion_Id, Numero);
        }

        #endregion
        #region  Operaciones con datos de la tabla Par_Razon_Social
        /// <summary>
        /// Borra el objeto de Par_Razon_Social
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Razon_Social_Delete(Scope s, Par_Razon_Social o)
        {
            try
            {
                return Par_Razon_Social.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Razon_Social
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Razon_Social_Insert(Scope s, Par_Razon_Social o)
        {
            try
            {
                return DEL.PAR.DO_Par_Razon_Social.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Razon_Social
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Razon_Social_Update(Scope s, Par_Razon_Social o, Par_Razon_Social original)
        {
            try
            {
                return DEL.PAR.DO_Par_Razon_Social.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Iva
        // Objeto permanente para acceso a DO_Par_Iva
        private DO_Par_Iva _Par_Iva;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Iva
        /// </summary>
        public DO_Par_Iva Par_Iva
        {
            get
            {
                if (_Par_Iva == null)
                    _Par_Iva = new DO_Par_Iva();
                return _Par_Iva;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Iva> Par_Iva_Get(Scope s)
        {
            return Par_Iva.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Iva
        /// </summary>
        /// <returns>Todos los registros de Par_Iva </returns>

        [WebMethod]
        public List<Par_Iva> Par_Iva_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Iva.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Iva> Par_Iva_GetByEmpresa(Scope s)
        {
            return Par_Iva.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Par_Iva> Par_Iva_GetById(Scope s, string Id)
        {
            return Par_Iva.GetById(s, Id);
        }
        [WebMethod]
        public List<Par_Iva> Par_Iva_GetByLikeNombre(Scope s, string Nombre)
        {
            return Par_Iva.GetByLikeNombre(s, Nombre);
        }
        [WebMethod]
        public List<Par_Iva> Par_Iva_GetByValor(Scope s, decimal Valor)
        {
            return Par_Iva.GetByValor(s, Valor);
        }
        #endregion
        #region  Operaciones con datos de la tabla Par_Iva
        /// <summary>
        /// Borra el objeto de Par_Iva
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Iva_Delete(Scope s, Par_Iva o)
        {
            try
            {
                return Par_Iva.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Iva
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Iva_Insert(Scope s, Par_Iva o)
        {
            try
            {
                return Par_Iva.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Iva
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Iva_Update(Scope s, Par_Iva o, Par_Iva original)
        {
            try
            {
                return Par_Iva.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Par_Retencion
        // Objeto permanente para acceso a DO_Par_Retencion
        private DO_Par_Retencion _Par_Retencion;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Retencion
        /// </summary>
        public DO_Par_Retencion Par_Retencion
        {
            get
            {
                if (_Par_Retencion == null)
                    _Par_Retencion = new DO_Par_Retencion();
                return _Par_Retencion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Par_Retencion> Par_Retencion_Get(Scope s)
        {
            return Par_Retencion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Par_Retencion
        /// </summary>
        /// <returns>Todos los registros de Par_Retencion </returns>

        [WebMethod]
        public List<Par_Retencion> Par_Retencion_GetByCodigo(Scope s, string Codigo)
        {
            return Par_Retencion.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Par_Retencion> Par_Retencion_GetByEmpresa(Scope s)
        {
            return Par_Retencion.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Par_Retencion> Par_Retencion_GetById(Scope s, string Id)
        {
            return Par_Retencion.GetById(s, Id);
        }

        [WebMethod]
        public List<Par_Retencion> Par_Retencion_GetByLikeNombre(Scope s, string Nombre)
        {
            return Par_Retencion.GetByLikeNombre(s, Nombre);
        }


        #endregion
        #region  Operaciones con datos de la tabla Par_Retencion
        /// <summary>
        /// Borra el objeto de Par_Retencion
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Par_Retencion_Delete(Scope s, Par_Retencion o)
        {
            try
            {
                return Par_Retencion.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Par_Retencion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Par_Retencion_Insert(Scope s, Par_Retencion o)
        {
            try
            {
                return Par_Retencion.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Par_Retencion
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Par_Retencion_Update(Scope s, Par_Retencion o, Par_Retencion original)
        {
            try
            {
                return Par_Retencion.Update(s, o, original);
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