
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services;
using HER;
using AEL.FIS;
using BEL;
using CEL.FIS;
using System;
namespace EWS
{
    /// <summary>
    /// Summary description for WS_FIS
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_FIS : WebService
    {
        // Posible problema con static y nuevas consultas a la base
        // se debería optimizar la llamada a los objeto DO, 
        // para que esté creado desde el momento de la llamada
        // o
        // que problema existe en concurrencia??
        #region Servicios para Fis_Multa
        // Objeto permanente para acceso a DO_Fis_Multa
        private DO_Fis_Multa _Fis_Multa;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Multa
        /// </summary>
        public DO_Fis_Multa Fis_Multa
        {
            get
            {
                if (_Fis_Multa == null)
                    _Fis_Multa = new DO_Fis_Multa();
                return _Fis_Multa;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Multa> Fis_Multa_Get(Scope s)
        {
            return Fis_Multa.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Multa
        /// </summary>
        /// <returns>Todos los registros de Fis_Multa </returns>

        [WebMethod]
        public List<Fis_Multa> Fis_Multa_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Multa.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Multa> Fis_Multa_GetById(Scope s, string Id)
        {
            return Fis_Multa.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Multa> Fis_Multa_GetByLikeNombre(Scope s, string Nombre)
        {
            return Fis_Multa.GetByLikeNombre(s, Nombre);
        }
        [WebMethod]
        public List<Fis_Multa> Fis_Multa_GetByEmpresa(Scope s)
        {
            return Fis_Multa.GetByEmpresa(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Fis_Multa
        /// <summary>
        /// Borra el objeto de Fis_Multa
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Multa_Delete(Scope s, Fis_Multa o)
        {
            try
            {
                return Fis_Multa.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Multa
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Multa_Insert(Scope s, Fis_Multa o)
        {
            try
            {
                return Fis_Multa.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Multa
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Multa_Update(Scope s, Fis_Multa o, Fis_Multa original)
        {
            try
            {
                return Fis_Multa.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Catalogo
        // Objeto permanente para acceso a DO_Fis_Catalogo
        private DO_Fis_Catalogo _Fis_Catalogo;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Catalogo
        /// </summary>
        public DO_Fis_Catalogo Fis_Catalogo
        {
            get
            {
                if (_Fis_Catalogo == null)
                    _Fis_Catalogo = new DO_Fis_Catalogo();
                return _Fis_Catalogo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Catalogo> Fis_Catalogo_Get(Scope s)
        {
            return Fis_Catalogo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Catalogo
        /// </summary>
        /// <returns>Todos los registros de Fis_Catalogo </returns>

        [WebMethod]
        public List<Fis_Catalogo> Fis_Catalogo_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Catalogo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Catalogo> Fis_Catalogo_GetByEmpresa(Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
        {
            return Fis_Catalogo.GetByEmpresa(s, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Fecha_Publicacion_Desde, Fecha_Publicacion_Hasta, Nombre);
        }
        [WebMethod]
        public List<Fis_Catalogo> Fis_Catalogo_GetById(Scope s, string Id)
        {
            return Fis_Catalogo.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Catalogo> Fis_Catalogo_GetByLikeNombre(Scope s, string Nombre)
        {
            return Fis_Catalogo.GetByLikeNombre(s, Nombre);
        }
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Catalogo_TotalPaginas(Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
        {
            return Fis_Catalogo.TotalPaginas(s, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Fecha_Publicacion_Desde, Fecha_Publicacion_Hasta, Nombre);
        }
        #endregion

        #endregion
        #region  Operaciones con datos de la tabla Fis_Catalogo
        /// <summary>
        /// Borra el objeto de Fis_Catalogo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Catalogo_Delete(Scope s, Fis_Catalogo o)
        {
            try
            {
                return Fis_Catalogo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Catalogo_Insert(Scope s, Fis_Catalogo o)
        {
            try
            {
                return DEL.FIS.DO_Fis_Catalogo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Catalogo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Catalogo_Update(Scope s, Fis_Catalogo o, Fis_Catalogo original)
        {
            try
            {
                return Fis_Catalogo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Catalogo_Indice
        // Objeto permanente para acceso a DO_Fis_Catalogo_Indice
        private DO_Fis_Catalogo_Indice _Fis_Catalogo_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Catalogo_Indice
        /// </summary>
        public DO_Fis_Catalogo_Indice Fis_Catalogo_Indice
        {
            get
            {
                if (_Fis_Catalogo_Indice == null)
                    _Fis_Catalogo_Indice = new DO_Fis_Catalogo_Indice();
                return _Fis_Catalogo_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Catalogo_Indice> Fis_Catalogo_Indice_Get(Scope s)
        {
            return Fis_Catalogo_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Catalogo_Indice
        /// </summary>
        /// <returns>Todos los registros de Fis_Catalogo_Indice </returns>

        [WebMethod]
        public List<Fis_Catalogo_Indice> Fis_Catalogo_Indice_GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Indice_Codigo_Desde, string Apu_Indice_Codigo_Hasta, string Apu_Indice_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return Fis_Catalogo_Indice.GetByCatalogo(s, Fis_Catalogo_Id, Apu_Indice_Codigo_Desde, Apu_Indice_Codigo_Hasta, Apu_Indice_Nombre, Valor_Desde, Valor_Hasta);
        }
        [WebMethod]
        public List<Fis_Catalogo_Indice> Fis_Catalogo_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Catalogo_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Catalogo_Indice> Fis_Catalogo_Indice_GetById(Scope s, string Id)
        {
            return Fis_Catalogo_Indice.GetById(s, Id);
        }
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Catalogo_Indice_TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Indice_Codigo_Desde, string Apu_Indice_Codigo_Hasta, string Apu_Indice_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return Fis_Catalogo_Indice.TotalPaginas(s, Fis_Catalogo_Id, Apu_Indice_Codigo_Desde, Apu_Indice_Codigo_Hasta, Apu_Indice_Nombre, Valor_Desde, Valor_Hasta);
        }
        #endregion

        #endregion
        #region  Operaciones con datos de la tabla Fis_Catalogo_Indice
        /// <summary>
        /// Borra el objeto de Fis_Catalogo_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Catalogo_Indice_Delete(Scope s, Fis_Catalogo_Indice o)
        {
            try
            {
                return Fis_Catalogo_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Catalogo_Indice_Insert(Scope s, Fis_Catalogo_Indice o)
        {
            try
            {
                return Fis_Catalogo_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Catalogo_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Catalogo_Indice_Update(Scope s, Fis_Catalogo_Indice o, Fis_Catalogo_Indice original)
        {
            try
            {
                return Fis_Catalogo_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Catalogo_Mano_Obra
        // Objeto permanente para acceso a DO_Fis_Catalogo_Mano_Obra
        private DO_Fis_Catalogo_Mano_Obra _Fis_Catalogo_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Catalogo_Mano_Obra
        /// </summary>
        public DO_Fis_Catalogo_Mano_Obra Fis_Catalogo_Mano_Obra
        {
            get
            {
                if (_Fis_Catalogo_Mano_Obra == null)
                    _Fis_Catalogo_Mano_Obra = new DO_Fis_Catalogo_Mano_Obra();
                return _Fis_Catalogo_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Catalogo_Mano_Obra> Fis_Catalogo_Mano_Obra_Get(Scope s)
        {
            return Fis_Catalogo_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Fis_Catalogo_Mano_Obra </returns>

        [WebMethod]
        public List<Fis_Catalogo_Mano_Obra> Fis_Catalogo_Mano_Obra_GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde,
                                                                                 string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre,
                                                                                 string Apu_Mano_Obra_Codigo_Desde, string Apu_Mano_Obra_Codigo_Hasta,
                                                                                 string Apu_Mano_Obra_Nombre, decimal Fis_Catalogo_CMO_Valor_Desde,
                                                                                 decimal Fis_Catalogo_CMO_Valor_Hasta)
        {
            return Fis_Catalogo_Mano_Obra.GetByCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta,
                                                        Apu_Categoria_Nombre, Apu_Mano_Obra_Codigo_Desde, Apu_Mano_Obra_Codigo_Hasta,
                                                        Apu_Mano_Obra_Nombre, Fis_Catalogo_CMO_Valor_Desde, Fis_Catalogo_CMO_Valor_Hasta);
        }
        [WebMethod]
        public List<Fis_Catalogo_Mano_Obra> Fis_Catalogo_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Catalogo_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Catalogo_Mano_Obra> Fis_Catalogo_Mano_Obra_GetById(Scope s, string Id)
        {
            return Fis_Catalogo_Mano_Obra.GetById(s, Id);
        }
        #endregion
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Catalogo_Mano_Obra_TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde,
                                                       string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre,
                                                       string Apu_Mano_Obra_Codigo_Desde, string Apu_Mano_Obra_Codigo_Hasta,
                                                       string Apu_Mano_Obra_Nombre, decimal Fis_Catalogo_CMO_Valor_Desde,
                                                       decimal Fis_Catalogo_CMO_Valor_Hasta)
        {
            return Fis_Catalogo_Mano_Obra.TotalPaginas(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta,
                                                       Apu_Categoria_Nombre, Apu_Mano_Obra_Codigo_Desde, Apu_Mano_Obra_Codigo_Hasta,
                                                       Apu_Mano_Obra_Nombre, Fis_Catalogo_CMO_Valor_Desde, Fis_Catalogo_CMO_Valor_Hasta);
        }
        #endregion
        #region  Operaciones con datos de la tabla Fis_Catalogo_Mano_Obra
        /// <summary>
        /// Borra el objeto de Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Catalogo_Mano_Obra_Delete(Scope s, Fis_Catalogo_Mano_Obra o)
        {
            try
            {
                return Fis_Catalogo_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Catalogo_Mano_Obra_Insert(Scope s, Fis_Catalogo_Mano_Obra o)
        {
            try
            {
                return Fis_Catalogo_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Catalogo_Mano_Obra_Update(Scope s, Fis_Catalogo_Mano_Obra o, Fis_Catalogo_Mano_Obra original)
        {
            try
            {
                return Fis_Catalogo_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Catalogo_Categoria
        // Objeto permanente para acceso a DO_Fis_Catalogo_Categoria
        private DO_Fis_Catalogo_Categoria _Fis_Catalogo_Categoria;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Catalogo_Categoria
        /// </summary>
        public DO_Fis_Catalogo_Categoria Fis_Catalogo_Categoria
        {
            get
            {
                if (_Fis_Catalogo_Categoria == null)
                    _Fis_Catalogo_Categoria = new DO_Fis_Catalogo_Categoria();
                return _Fis_Catalogo_Categoria;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Catalogo_Categoria> Fis_Catalogo_Categoria_Get(Scope s)
        {
            return Fis_Catalogo_Categoria.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Catalogo_Categoria
        /// </summary>
        /// <returns>Todos los registros de Fis_Catalogo_Categoria </returns>

        [WebMethod]
        public List<Fis_Catalogo_Categoria> Fis_Catalogo_Categoria_GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return Fis_Catalogo_Categoria.GetByCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Valor_Desde, Valor_Hasta);
        }
        [WebMethod]
        public List<Fis_Catalogo_Categoria> Fis_Catalogo_Categoria_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Catalogo_Categoria.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Catalogo_Categoria> Fis_Catalogo_Categoria_GetById(Scope s, string Id)
        {
            return Fis_Catalogo_Categoria.GetById(s, Id);
        }
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Catalogo_Categoria_TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            return Fis_Catalogo_Categoria.TotalPaginas(s, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Valor_Desde, Valor_Hasta);
        }
        #endregion

        #endregion
        #region  Operaciones con datos de la tabla Fis_Catalogo_Categoria
        /// <summary>
        /// Borra el objeto de Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Catalogo_Categoria_Delete(Scope s, Fis_Catalogo_Categoria o)
        {
            try
            {
                return Fis_Catalogo_Categoria.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Catalogo_Categoria_Insert(Scope s, Fis_Catalogo_Categoria o)
        {
            try
            {
                return Fis_Catalogo_Categoria.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Catalogo_Categoria_Update(Scope s, Fis_Catalogo_Categoria o, Fis_Catalogo_Categoria original)
        {
            try
            {
                return Fis_Catalogo_Categoria.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Fiscalizacion
        // Objeto permanente para acceso a DO_Fis_Fiscalizacion
        private DO_Fis_Fiscalizacion _Fis_Fiscalizacion;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Fiscalizacion
        /// </summary>
        public DO_Fis_Fiscalizacion Fis_Fiscalizacion
        {
            get
            {
                if (_Fis_Fiscalizacion == null)
                    _Fis_Fiscalizacion = new DO_Fis_Fiscalizacion();
                return _Fis_Fiscalizacion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Fiscalizacion> Fis_Fiscalizacion_Get(Scope s)
        {
            return Fis_Fiscalizacion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Fiscalizacion
        /// </summary>
        /// <returns>Todos los registros de Fis_Fiscalizacion </returns>

        [WebMethod]
        public List<Fis_Fiscalizacion> Fis_Fiscalizacion_GetById(Scope s, string Id)
        {
            return Fis_Fiscalizacion.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Fiscalizacion> Fis_Fiscalizacion_GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            return Fis_Fiscalizacion.GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, Nombre_Proyecto, Estado, Contratista, Fiscalizador);
        }
        [WebMethod]
        public List<Fis_Fiscalizacion> Fis_Fiscalizacion_GetByFiscalizacion(Scope s, string Id)
        {
            return Fis_Fiscalizacion.GetByFiscalizacion(s, Id);
        }

        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Fiscalizacion_TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string Nombre_Proyecto, string Estado, string Contratista, string Fiscalizador)
        {
            return Fis_Fiscalizacion.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, Nombre_Proyecto, Estado, Contratista, Fiscalizador);
        }
        #endregion

        #endregion
        #region  Operaciones con datos de la tabla Fis_Fiscalizacion
        [WebMethod]
        public int Fis_Fiscalizacion_Update(Scope s, Fis_Fiscalizacion o, Fis_Fiscalizacion original)
        {
            try
            {
                return Fis_Fiscalizacion.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Ampliacion
        // Objeto permanente para acceso a DO_Fis_Ampliacion
        private DO_Fis_Ampliacion _Fis_Ampliacion;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Ampliacion
        /// </summary>
        public DO_Fis_Ampliacion Fis_Ampliacion
        {
            get
            {
                if (_Fis_Ampliacion == null)
                    _Fis_Ampliacion = new DO_Fis_Ampliacion();
                return _Fis_Ampliacion;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Ampliacion> Fis_Ampliacion_Get(Scope s)
        {
            return Fis_Ampliacion.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Ampliacion
        /// </summary>
        /// <returns>Todos los registros de Fis_Ampliacion </returns>

        [WebMethod]
        public List<Fis_Ampliacion> Fis_Ampliacion_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Ampliacion.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Ampliacion> Fis_Ampliacion_GetById(Scope s, string Id)
        {
            return Fis_Ampliacion.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Ampliacion> Fis_Ampliacion_GetByPresuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return Fis_Ampliacion.GetByPresuesto(s, Apu_Presupuesto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Fis_Ampliacion
        /// <summary>
        /// Borra el objeto de Fis_Ampliacion
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Ampliacion_Delete(Scope s, Fis_Ampliacion o)
        {
            try
            {
                return Fis_Ampliacion.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Ampliacion
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Ampliacion_Insert(Scope s, Fis_Ampliacion o)
        {
            try
            {
                return Fis_Ampliacion.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Ampliacion
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Ampliacion_Update(Scope s, Fis_Ampliacion o, Fis_Ampliacion original)
        {
            try
            {
                return Fis_Ampliacion.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Planilla
        // Objeto permanente para acceso a DO_Fis_Planilla
        private DO_Fis_Planilla _Fis_Planilla;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Planilla
        /// </summary>
        public DO_Fis_Planilla Fis_Planilla
        {
            get
            {
                if (_Fis_Planilla == null)
                    _Fis_Planilla = new DO_Fis_Planilla();
                return _Fis_Planilla;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Planilla> Fis_Planilla_Get(Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
        {
            return Fis_Planilla.Get(s, Apu_Presupuesto_Codigo_Institucional,Apu_Presupuesto_Nombre,Contratista_Per_Personal_Nombre,Numero_Planilla_Desde,Numero_Planilla_Hasta,Fecha_Inicial_Desde,Fecha_Final_Hasta,Tipo_Planilla,Total_Desde,Total_Hasta,Fecha_Pago_Desde,Fecha_Pago_Hasta);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Planilla
        /// </summary>
        /// <returns>Todos los registros de Fis_Planilla </returns>

        [WebMethod]
        public List<Fis_Planilla> Fis_Planilla_GetById(Scope s, string Id)
        {
            return Fis_Planilla.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Planilla> Fis_Planilla_GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return Fis_Planilla.GetByPresupuesto(s, Apu_Presupuesto_Id);
        }
        [WebMethod]
        public List<Fis_Planilla> Fis_Planilla_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Planilla.GetByCodigo(s, Codigo);
        }
         #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Fis_Planilla_TotalPaginas(Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
        {
            return Fis_Planilla.TotalPaginas(s,Apu_Presupuesto_Codigo_Institucional,Apu_Presupuesto_Nombre,Contratista_Per_Personal_Nombre,Numero_Planilla_Desde,Numero_Planilla_Hasta,Fecha_Inicial_Desde,Fecha_Final_Hasta,Tipo_Planilla,Total_Desde,Total_Hasta,Fecha_Pago_Desde,Fecha_Pago_Hasta);
        }
        #endregion
        #endregion
        #region  Operaciones con datos de la tabla Fis_Planilla
        /// <summary>
        /// Borra el objeto de Fis_Planilla
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Planilla_Delete(Scope s, Fis_Planilla o)
        {
            try
            {
                return Fis_Planilla.Delete(s, o);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(Parametros[0], e), Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Planilla
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Planilla_Insert(Scope s, Fis_Planilla o)
        {
            try
            {
                return Fis_Planilla.Insert(s, o);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(Parametros[0], e), Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Planilla
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Planilla_Update(Scope s, Fis_Planilla o, Fis_Planilla original)
        {
            try
            {
                return Fis_Planilla.Update(s, o, original);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(Parametros[0], e), Context.Request.Url.AbsoluteUri);

            }
        }

        [WebMethod]
        public int Fis_PlanillaPago_Update(Scope s, String Id, String EstadoPago)
        {
            try
            {
                return Fis_Planilla.UpdateEstadoPago(s, Id, EstadoPago);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(Parametros[0], e), Context.Request.Url.AbsoluteUri);

            }
        }

        #endregion
        #endregion

        #region Servicios para Fis_Planilla_Det
        // Objeto permanente para acceso a DO_Fis_Planilla_Det
        private DO_Fis_Planilla_Det _Fis_Planilla_Det;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Planilla_Det
        /// </summary>
        public DO_Fis_Planilla_Det Fis_Planilla_Det
        {
            get
            {
                if (_Fis_Planilla_Det == null)
                    _Fis_Planilla_Det = new DO_Fis_Planilla_Det();
                return _Fis_Planilla_Det;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Planilla_Det> Fis_Planilla_Det_Get(Scope s)
        {
            return Fis_Planilla_Det.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Planilla_Det
        /// </summary>
        /// <returns>Todos los registros de Fis_Planilla_Det </returns>

        [WebMethod]
        public List<Fis_Planilla_Det> Fis_Planilla_Det_GetById(Scope s, string Id)
        {
            return Fis_Planilla_Det.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Planilla_Det> Fis_Planilla_Det_GetByLikePrespRub(Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre)
        {
            return Fis_Planilla_Det.GetByLikePrespRub(s, Apu_Presupuesto_Id, Apu_Rubro_Nombre);
        }
        [WebMethod]
        public List<Fis_Planilla_Det> Fis_Planilla_Det_GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            return Fis_Planilla_Det.GetByPlanilla(s, Fis_Planilla_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Fis_Planilla_Det
        /// <summary>
        /// Borra el objeto de Fis_Planilla_Det
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Planilla_Det_Delete(Scope s, Fis_Planilla_Det o)
        {
            try
            {
                return Fis_Planilla_Det.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Planilla_Det
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Planilla_Det_Insert(Scope s, Fis_Planilla_Det o)
        {
            try
            {
                return Fis_Planilla_Det.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Planilla_Det
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Planilla_Det_Update(Scope s, Fis_Planilla_Det o, Fis_Planilla_Det original)
        {
            try
            {
                return Fis_Planilla_Det.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Planilla_Multa
        // Objeto permanente para acceso a DO_Fis_Planilla_Multa
        private DO_Fis_Planilla_Multa _Fis_Planilla_Multa;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Planilla_Multa
        /// </summary>
        public DO_Fis_Planilla_Multa Fis_Planilla_Multa
        {
            get
            {
                if (_Fis_Planilla_Multa == null)
                    _Fis_Planilla_Multa = new DO_Fis_Planilla_Multa();
                return _Fis_Planilla_Multa;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Planilla_Multa> Fis_Planilla_Multa_Get(Scope s)
        {
            return Fis_Planilla_Multa.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Planilla_Multa
        /// </summary>
        /// <returns>Todos los registros de Fis_Planilla_Multa </returns>

        [WebMethod]
        public List<Fis_Planilla_Multa> Fis_Planilla_Multa_GetByCodigo(Scope s, string Codigo)
        {
            return Fis_Planilla_Multa.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Fis_Planilla_Multa> Fis_Planilla_Multa_GetById(Scope s, string Id)
        {
            return Fis_Planilla_Multa.GetById(s, Id);
        }
        [WebMethod]
        public List<Fis_Planilla_Multa> Fis_Planilla_Multa_GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            return Fis_Planilla_Multa.GetByPlanilla(s, Fis_Planilla_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Fis_Planilla_Multa
        /// <summary>
        /// Borra el objeto de Fis_Planilla_Multa
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Fis_Planilla_Multa_Delete(Scope s, Fis_Planilla_Multa o)
        {
            try
            {
                return Fis_Planilla_Multa.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Fis_Planilla_Multa
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Fis_Planilla_Multa_Insert(Scope s, Fis_Planilla_Multa o)
        {
            try
            {
                return Fis_Planilla_Multa.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Fis_Planilla_Multa
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Fis_Planilla_Multa_Update(Scope s, Fis_Planilla_Multa o, Fis_Planilla_Multa original)
        {
            try
            {
                return Fis_Planilla_Multa.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Fis_Planilla_Resumen
        // Objeto permanente para acceso a DO_Fis_Planilla_Resumen
        private DO_Fis_Planilla_Resumen _Fis_Planilla_Resumen;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Planilla_Resumen
        /// </summary>
        public DO_Fis_Planilla_Resumen Fis_Planilla_Resumen
        {
            get
            {
                if (_Fis_Planilla_Resumen == null)
                    _Fis_Planilla_Resumen = new DO_Fis_Planilla_Resumen();
                return _Fis_Planilla_Resumen;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Planilla_Resumen> Fis_Planilla_Resumen_Get(Scope s)
        {
            return Fis_Planilla_Resumen.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Planilla_Resumen
        /// </summary>
        /// <returns>Todos los registros de Fis_Planilla_Resumen </returns>

        [WebMethod]
        public List<Fis_Planilla_Resumen> Fis_Planilla_Resumen_GetById(Scope s, string Fis_Planilla_Id)
        {
            return Fis_Planilla_Resumen.GetById(s, Fis_Planilla_Id);
        }

        [WebMethod]
        public List<Fis_Planilla_Resumen> Fis_Planilla_Resumen_GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            return Fis_Planilla_Resumen.GetByPresupuesto(s, Apu_Presupuesto_Id);
        }

        #endregion

        #endregion

        #region Servicios para Fis_Planilla_Det_Reporte
        // Objeto permanente para acceso a DO_Fis_Planilla_Det_Reporte
        private DO_Fis_Planilla_Det_Reporte _Fis_Planilla_Det_Reporte;
        /// <summary>
        /// La propiedad para acceso a DO_Fis_Planilla_Det_Reporte
        /// </summary>
        public DO_Fis_Planilla_Det_Reporte Fis_Planilla_Det_Reporte
        {
            get
            {
                if (_Fis_Planilla_Det_Reporte == null)
                    _Fis_Planilla_Det_Reporte = new DO_Fis_Planilla_Det_Reporte();
                return _Fis_Planilla_Det_Reporte;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Fis_Planilla_Det_Reporte> Fis_Planilla_Det_Reporte_Get(Scope s)
        {
            return Fis_Planilla_Det_Reporte.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Fis_Planilla_Det_Reporte
        /// </summary>
        /// <returns>Todos los registros de Fis_Planilla_Det_Reporte </returns>

        [WebMethod]
        public List<Fis_Planilla_Det_Reporte> Fis_Planilla_Det_Reporte_GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            return Fis_Planilla_Det_Reporte.GetByPlanilla(s, Fis_Planilla_Id);
        }
        #endregion
      
        #endregion
    }
}