using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.Services;
using AEL.APU;
using HER;
using BEL;
using CEL.APU;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_APU
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_APU : WebService
    {
        // Posible problema con static y nuevas consultas a la base
        // se debería optimizar la llamada a los objeto DO, 
        // para que esté creado desde el momento de la llamada
        // o
        // que problema existe en concurrencia??
        #region Servicios para Apu_Categoria
        // Objeto permanente para acceso a DO_Apu_Categoria
        private DO_Apu_Categoria _Apu_Categoria;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Categoria
        /// </summary>
        public DO_Apu_Categoria Apu_Categoria
        {
            get
            {
                if (_Apu_Categoria == null)
                    _Apu_Categoria = new DO_Apu_Categoria();
                return _Apu_Categoria;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_Get(Scope s)
        {
            return Apu_Categoria.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Categoria
        /// </summary>
        /// <returns>Todos los registros de Apu_Categoria </returns>

        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_GetByCodigo(Scope s, string codigo, string Int_Sucursal_Id)
        {
            return Apu_Categoria.GetByCodigo(s, codigo, Int_Sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_GetByEmpresa(Scope s, string Int_Sucursal_Id)
        {
            return Apu_Categoria.GetByEmpresa(s, Int_Sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_GetById(Scope s, string Id, string Int_Sucursal_Id)
        {
            return Apu_Categoria.GetById(s, Id, Int_Sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Categoria.GetByLikeNombre(s, Nombre);
        }

        [WebMethod]
        public List<Apu_Categoria> Apu_Categoria_GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Nombre)
        {
            return Apu_Categoria.GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Categoria_Nombre);
        }
    
        #endregion
        #region  Operaciones con datos de la tabla Apu_Categoria
        /// <summary>
        /// Borra el objeto de Apu_Categoria
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Categoria_Delete(Scope s, Apu_Categoria o)
        {
            try
            {
                return Apu_Categoria.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Categoria_Insert(Scope s, Apu_Categoria o)
        {
            try
            {
                return Apu_Categoria.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Categoria
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Categoria_Update(Scope s, Apu_Categoria o, Apu_Categoria original)
        {
            try
            {
                return Apu_Categoria.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Equipo
        // Objeto permanente para acceso a DO_Apu_Equipo
        private DO_Apu_Equipo _Apu_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Equipo
        /// </summary>
        public DO_Apu_Equipo Apu_Equipo
        {
            get
            {
                if (_Apu_Equipo == null)
                    _Apu_Equipo = new DO_Apu_Equipo();
                return _Apu_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_Get(Scope s)
        {
            return Apu_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Equipo </returns>

        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByLikeNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            return Apu_Equipo.GetByLikeNombre(s, nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            return Apu_Equipo.GetByNombre(s, nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByProyectoRubroEquipo(Scope s, string Apu_Proyecto_Rubro_id, string Apu_Equipo_Id)
        {
            return Apu_Equipo.GetByProyectoRubroEquipo(s, Apu_Proyecto_Rubro_id, Apu_Equipo_Id);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetBySucursal(Scope s, string Int_Sucursal_id)
        {
            return Apu_Equipo.GetBySucursal(s, Int_Sucursal_id);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByOfertaRubroEquipo(Scope s, string Apu_Oferta_Rubro_id, string Apu_Equipo_Id)
        {
            return Apu_Equipo.GetByOfertaRubroEquipo(s, Apu_Oferta_Rubro_id, Apu_Equipo_Id);
        }

        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return Apu_Equipo.GetByLikeCodigoDesde(s, desde_Codigo);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return Apu_Equipo.GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Equipo> Apu_Equipo_GetByLkeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return Apu_Equipo.GetByLkeCodigoHasta(s, hasta_Codigo);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Equipo_Delete(Scope s, Apu_Equipo o)
        {
            try
            {
                return Apu_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Equipo_Insert(Scope s, Apu_Equipo o)
        {
            try
            {
                //return Apu_Equipo.Insert(s, o);
                return DEL.APU.DO_Apu_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Equipo_Update(Scope s, Apu_Equipo o, Apu_Equipo original)
        {
            try
            {
                return Apu_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Lugar
        // Objeto permanente para acceso a DO_Apu_Lugar
        private DO_Apu_Lugar _Apu_Lugar;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Lugar
        /// </summary>
        public DO_Apu_Lugar Apu_Lugar
        {
            get
            {
                if (_Apu_Lugar == null)
                    _Apu_Lugar = new DO_Apu_Lugar();
                return _Apu_Lugar;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Lugar> Apu_Lugar_Get(Scope s)
        {
            return Apu_Lugar.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Lugar
        /// </summary>
        /// <returns>Todos los registros de Apu_Lugar </returns>

        [WebMethod]
        public List<Apu_Lugar> Apu_Lugar_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Lugar.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Lugar> Apu_Lugar_GetByEmpresa(Scope s)
        {
            return Apu_Lugar.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Lugar> Apu_Lugar_GetById(Scope s, string Id)
        {
            return Apu_Lugar.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Lugar> Apu_Lugar_GetByPredeterminadaS(Scope s)
        {
            return Apu_Lugar.GetByPredeterminadaS(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Lugar
        /// <summary>
        /// Borra el objeto de Apu_Lugar
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Lugar_Delete(Scope s, Apu_Lugar o)
        {
            try
            {
                return Apu_Lugar.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Lugar
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Lugar_Insert(Scope s, Apu_Lugar o)
        {
            try
            {
                return Apu_Lugar.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Lugar
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Lugar_Update(Scope s, Apu_Lugar o, Apu_Lugar original)
        {
            try
            {
                return Apu_Lugar.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Provincia
        // Objeto permanente para acceso a DO_Apu_Provincia
        private DO_Apu_Provincia _Apu_Provincia;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Provincia
        /// </summary>
        public DO_Apu_Provincia Apu_Provincia
        {
            get
            {
                if (_Apu_Provincia == null)
                    _Apu_Provincia = new DO_Apu_Provincia();
                return _Apu_Provincia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Provincia> Apu_Provincia_Get(Scope s)
        {
            return Apu_Provincia.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Provincia
        /// </summary>
        /// <returns>Todos los registros de Apu_Provincia </returns>

        [WebMethod]
        public List<Apu_Provincia> Apu_Provincia_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Provincia.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Provincia> Apu_Provincia_GetByEmpresa(Scope s)
        {
            return Apu_Provincia.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Provincia> Apu_Provincia_GetById(Scope s, string Id)
        {
            return Apu_Provincia.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Provincia> Apu_Provincia_GetByPredeterminadaS(Scope s)
        {
            return Apu_Provincia.GetByPredeterminadaS(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Provincia
        /// <summary>
        /// Borra el objeto de Apu_Provincia
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Provincia_Delete(Scope s, Apu_Provincia o)
        {
            try
            {
                return Apu_Provincia.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Provincia
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Provincia_Insert(Scope s, Apu_Provincia o)
        {
            try
            {
                return Apu_Provincia.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Provincia
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Provincia_Update(Scope s, Apu_Provincia o, Apu_Provincia original)
        {
            try
            {
                return Apu_Provincia.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Subtitulo
        // Objeto permanente para acceso a DO_Apu_Subtitulo
        private DO_Apu_Subtitulo _Apu_Subtitulo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Subtitulo
        /// </summary>
        public DO_Apu_Subtitulo Apu_Subtitulo
        {
            get
            {
                if (_Apu_Subtitulo == null)
                    _Apu_Subtitulo = new DO_Apu_Subtitulo();
                return _Apu_Subtitulo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_Get(Scope s)
        {
            return Apu_Subtitulo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Subtitulo
        /// </summary>
        /// <returns>Todos los registros de Apu_Subtitulo </returns>

        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Subtitulo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            return Apu_Subtitulo.GetByEmpresa(s, Int_Empresa_Id);
        }
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetById(Scope s, string Id)
        {
            return Apu_Subtitulo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetByTitulo(Scope s, string Apu_Titulo_Id)
        {
            return Apu_Subtitulo.GetByTitulo(s, Apu_Titulo_Id);
        }
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetByLikeNombre(Scope s, string Apu_Titulo_Id, string nombre)
        {
            return Apu_Subtitulo.GetByLikeNombre(s, Apu_Titulo_Id, nombre);
        }
        [WebMethod]
        public List<Apu_Subtitulo> Apu_Subtitulo_GetByOnlyPredeterminadaOfertaRubro(Scope s)
        {
            return Apu_Subtitulo.GetByOnlyPredeterminadaOfertaRubro(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Subtitulo
        /// <summary>
        /// Borra el objeto de Apu_Subtitulo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Subtitulo_Delete(Scope s, Apu_Subtitulo o)
        {
            try
            {
                return Apu_Subtitulo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Subtitulo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Subtitulo_Insert(Scope s, Apu_Subtitulo o)
        {
            try
            {
                return Apu_Subtitulo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Subtitulo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Subtitulo_Update(Scope s, Apu_Subtitulo o, Apu_Subtitulo original)
        {
            try
            {
                return Apu_Subtitulo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Titulo
        // Objeto permanente para acceso a DO_Apu_Titulo
        private DO_Apu_Titulo _Apu_Titulo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Titulo
        /// </summary>
        public DO_Apu_Titulo Apu_Titulo
        {
            get
            {
                if (_Apu_Titulo == null)
                    _Apu_Titulo = new DO_Apu_Titulo();
                return _Apu_Titulo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Titulo> Apu_Titulo_Get(Scope s)
        {
            return Apu_Titulo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Titulo
        /// </summary>
        /// <returns>Todos los registros de Apu_Titulo </returns>

        [WebMethod]
        public List<Apu_Titulo> Apu_Titulo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Titulo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Titulo> Apu_Titulo_GetByEmpresa(Scope s)
        {
            return Apu_Titulo.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Titulo> Apu_Titulo_GetById(Scope s, string Id)
        {
            return Apu_Titulo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Titulo> Apu_Titulo_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Titulo.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Titulo
        /// <summary>
        /// Borra el objeto de Apu_Titulo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Titulo_Delete(Scope s, Apu_Titulo o)
        {
            try
            {
                return Apu_Titulo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Titulo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Titulo_Insert(Scope s, Apu_Titulo o)
        {
            try
            {
                return Apu_Titulo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Titulo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Titulo_Update(Scope s, Apu_Titulo o, Apu_Titulo original)
        {
            try
            {
                return Apu_Titulo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Material
        // Objeto permanente para acceso a DO_Apu_Material
        private DO_Apu_Material _Apu_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Material
        /// </summary>
        public DO_Apu_Material Apu_Material
        {
            get
            {
                if (_Apu_Material == null)
                    _Apu_Material = new DO_Apu_Material();
                return _Apu_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Material> Apu_Material_Get(Scope s)
        {
            return Apu_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Material </returns>

        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByEmpresa(Scope s)
        {
            return Apu_Material.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetById(Scope s, string Id)
        {
            return Apu_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByLikeNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return Apu_Material.GetByLikeNombre(s, Nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return Apu_Material.GetByNombre(s, Nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByOfertaRubroMaterial(Scope s, string Nombre, string Apu_Material_Id)
        {
            return Apu_Material.GetByOfertaRubroMaterial(s, Nombre, Apu_Material_Id);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByProyectoRubroMaterial(Scope s, string Apu_proyecto_Rubro_id, string Apu_Material_Id)
        {
            return Apu_Material.GetByProyectoRubroMaterial(s, Apu_proyecto_Rubro_id, Apu_Material_Id);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetBySucursal(Scope s, string Int_Sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
        {
            return Apu_Material.GetBySucursal(s, Int_Sucursal_id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible);
        }

        [WebMethod]
        public int Apu_Material_TotalPaginas(Scope s, string Int_Sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
        {
            return Apu_Material.TotalPaginas(s, Int_Sucursal_id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible);
        }


        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return Apu_Material.GetByLikeCodigoDesde(s, desde_Codigo);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return Apu_Material.GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Material> Apu_Material_GeByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return Apu_Material.GeByLikeCodigoHasta(s, hasta_Codigo);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Material
        /// <summary>
        /// Borra el objeto de Apu_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Material_Delete(Scope s, Apu_Material o)
        {
            try
            {
                return Apu_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Material_Insert(Scope s, Apu_Material o)
        {
            try
            {
                //return Apu_Material.Insert(s, o);
                return DEL.APU.DO_Apu_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Material_Update(Scope s, Apu_Material o, Apu_Material original)
        {
            try
            {
                return Apu_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Indice_Equipo
        // Objeto permanente para acceso a DO_Apu_Indice_Equipo
        private DO_Apu_Indice_Equipo _Apu_Indice_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Indice_Equipo
        /// </summary>
        public DO_Apu_Indice_Equipo Apu_Indice_Equipo
        {
            get
            {
                if (_Apu_Indice_Equipo == null)
                    _Apu_Indice_Equipo = new DO_Apu_Indice_Equipo();
                return _Apu_Indice_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Indice_Equipo> Apu_Indice_Equipo_Get(Scope s)
        {
            return Apu_Indice_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Indice_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Indice_Equipo </returns>

        [WebMethod]
        public List<Apu_Indice_Equipo> Apu_Indice_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Indice_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Indice_Equipo> Apu_Indice_Equipo_GetByEmpresa(Scope s)
        {
            return Apu_Indice_Equipo.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Indice_Equipo> Apu_Indice_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Indice_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Indice_Equipo> Apu_Indice_Equipo_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Indice_Equipo.GetByLikeNombre(s, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Indice_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Indice_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Indice_Equipo_Delete(Scope s, Apu_Indice_Equipo o)
        {
            try
            {
                return Apu_Indice_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Indice_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Indice_Equipo_Insert(Scope s, Apu_Indice_Equipo o)
        {
            try
            {
                return Apu_Indice_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Indice_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Indice_Equipo_Update(Scope s, Apu_Indice_Equipo o, Apu_Indice_Equipo original)
        {
            try
            {
                return Apu_Indice_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Parametros
        // Objeto permanente para acceso a DO_Apu_Parametros
        private DO_Apu_Parametros _Apu_Parametros;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Parametros
        /// </summary>
        public DO_Apu_Parametros Apu_Parametros
        {
            get
            {
                if (_Apu_Parametros == null)
                    _Apu_Parametros = new DO_Apu_Parametros();
                return _Apu_Parametros;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Parametros> Apu_Parametros_Get(Scope s)
        {
            return Apu_Parametros.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Parametros
        /// </summary>
        /// <returns>Todos los registros de Apu_Parametros </returns>

        #region Procedimientos Select UNI  denominado ExisteRegistros
        [WebMethod]
        public int Apu_Parametros_ExisteRegistros(Scope s, string int_sucursal_id)
        {
            return Apu_Parametros.ExisteRegistros(s, int_sucursal_id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Parametros> Apu_Parametros_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Parametros.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Parametros> Apu_Parametros_GetByEmpresa(Scope s)
        {
            return Apu_Parametros.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Parametros> Apu_Parametros_GetById(Scope s, string Id)
        {
            return Apu_Parametros.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Parametros> Apu_Parametros_GetBySucursal(Scope s)
        {
            return Apu_Parametros.GetBySucursal(s);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Parametros
        /// <summary>
        /// Borra el objeto de Apu_Parametros
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Parametros_Delete(Scope s, Apu_Parametros o)
        {
            try
            {
                return Apu_Parametros.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Parametros
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Parametros_Insert(Scope s, Apu_Parametros o)
        {
            try
            {
                return Apu_Parametros.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Parametros
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Parametros_Update(Scope s, Apu_Parametros o, Apu_Parametros original)
        {
            try
            {
                return Apu_Parametros.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Mano_Obra
        private DO_Apu_Mano_Obra _Apu_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Mano_Obra
        /// </summary>
        public DO_Apu_Mano_Obra Apu_Mano_Obra
        {
            get
            {
                if (_Apu_Mano_Obra == null)
                    _Apu_Mano_Obra = new DO_Apu_Mano_Obra();
                return _Apu_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_Get(Scope s)
        {
            return Apu_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Mano_Obra </returns>

        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByEmpresa(Scope s)
        {
            return Apu_Mano_Obra.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByLikeNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return Apu_Mano_Obra.GetByLikeNombre(s, Nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return Apu_Mano_Obra.GetByNombre(s, Nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByOfertaRubroManoObra(Scope s, string Apu_oferta_Rubro_Id, string Apu_Mano_Obra_Id)
        {
            return Apu_Mano_Obra.GetByOfertaRubroManoObra(s, Apu_oferta_Rubro_Id, Apu_Mano_Obra_Id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByProyectoRubroMano_Obra(Scope s, string Apu_oferta_Rubro_Id, string Apu_Mano_Obra_Id)
        {
            return Apu_Mano_Obra.GetByProyectoRubroMano_Obra(s, Apu_oferta_Rubro_Id, Apu_Mano_Obra_Id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetBySucursal(Scope s, string Int_Sucursal_id)
        {
            return Apu_Mano_Obra.GetBySucursal(s, Int_Sucursal_id);
        }
        [WebMethod]
        public List<Apu_Mano_Obra> Apu_Mano_Obra_GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Nombre)
        {
            return Apu_Mano_Obra.GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Nombre);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Mano_Obra_Delete(Scope s, Apu_Mano_Obra o)
        {
            try
            {
                return Apu_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Mano_Obra_Insert(Scope s, Apu_Mano_Obra o)
        {
            try
            {
                return Apu_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Mano_Obra_Update(Scope s, Apu_Mano_Obra o, Apu_Mano_Obra original)
        {
            try
            {
                return Apu_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro
        // Objeto permanente para acceso a DO_Apu_Rubro
        private DO_Apu_Rubro _Apu_Rubro;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro
        /// </summary>
        public DO_Apu_Rubro Apu_Rubro
        {
            get
            {
                if (_Apu_Rubro == null)
                    _Apu_Rubro = new DO_Apu_Rubro();
                return _Apu_Rubro;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_Get(Scope s)
        {
            return Apu_Rubro.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro </returns>

        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Rubro.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            return Apu_Rubro.GetByEmpresa(s, Int_Empresa_Id);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetById(Scope s, string Id)
        {
            return Apu_Rubro.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Rubro.GetByLikeNombre(s, Nombre);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByLikeCodigo(Scope s, string Codigo, string int_sucursal_Id)
        {
            return Apu_Rubro.GetByLikeCodigo(s, Codigo, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            return Apu_Rubro.GetByNombre(s, Nombre, int_sucursal_Id);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde,
                                                       string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde,
                                                       string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            try
            {
                return Apu_Rubro.GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde, Apu_Subtitulo_Codigo_Hasta,
                                               Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde, Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return Apu_Rubro.GetByLikeCodigoDesde(s, desde_Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return Apu_Rubro.GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro> Apu_Rubro_GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return Apu_Rubro.GetByLikeCodigoHasta(s, hasta_Codigo);
        }
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Apu_Rubro_TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde, 
                                          string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde, 
                                          string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            try
            {
                return Apu_Rubro.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde, Apu_Subtitulo_Codigo_Hasta,
                                              Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde, Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro
        /// <summary>
        /// Borra el objeto de Apu_Rubro
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Delete(Scope s, Apu_Rubro o)
        {
            try
            {
                return Apu_Rubro.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Insert(Scope s, Apu_Rubro o)
        {
            try
            {
                return DEL.APU.DO_Apu_Rubro.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Update(Scope s, Apu_Rubro o, Apu_Rubro original)
        {
            try
            {
                return Apu_Rubro.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Documento
        // Objeto permanente para acceso a DO_Apu_Rubro_Documento
        private DO_Apu_Rubro_Documento _Apu_Rubro_Documento;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Documento
        /// </summary>
        public DO_Apu_Rubro_Documento Apu_Rubro_Documento
        {
            get
            {
                if (_Apu_Rubro_Documento == null)
                    _Apu_Rubro_Documento = new DO_Apu_Rubro_Documento();
                return _Apu_Rubro_Documento;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Documento> Apu_Rubro_Documento_Get(Scope s, string par_servidor_Id)
        {
            return Apu_Rubro_Documento.Get(s, par_servidor_Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Documento
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Documento </returns>

        [WebMethod]
        public List<Apu_Rubro_Documento> Apu_Rubro_Documento_GetByCodigo(Scope s, string Codigo, string par_servidor_Id)
        {
            return Apu_Rubro_Documento.GetByCodigo(s, Codigo, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Documento> Apu_Rubro_Documento_GetById(Scope s, string Id, string par_servidor_Id)
        {
            return Apu_Rubro_Documento.GetById(s, Id, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Documento> Apu_Rubro_Documento_GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            return Apu_Rubro_Documento.GetByRubro(s, Apu_Rubro_Id, par_servidor_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro_Documento
        /// <summary>
        /// Borra el objeto de Apu_Rubro_Documento
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Documento_Delete(Scope s, Apu_Rubro_Documento o)
        {
            try
            {
                return Apu_Rubro_Documento.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Documento
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Documento_Insert(Scope s, Apu_Rubro_Documento o)
        {
            try
            {
                return Apu_Rubro_Documento.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro_Documento
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Documento_Update(Scope s, Apu_Rubro_Documento o, Apu_Rubro_Documento original)
        {
            try
            {
                return Apu_Rubro_Documento.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Tecnica
        // Objeto permanente para acceso a DO_Apu_Rubro_Tecnica
        private DO_Apu_Rubro_Tecnica _Apu_Rubro_Tecnica;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Tecnica
        /// </summary>
        public DO_Apu_Rubro_Tecnica Apu_Rubro_Tecnica
        {
            get
            {
                if (_Apu_Rubro_Tecnica == null)
                    _Apu_Rubro_Tecnica = new DO_Apu_Rubro_Tecnica();
                return _Apu_Rubro_Tecnica;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Tecnica> Apu_Rubro_Tecnica_Get(Scope s, string par_servidor_id)
        {
            return Apu_Rubro_Tecnica.Get(s, par_servidor_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Tecnica
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Tecnica </returns>

        [WebMethod]
        public List<Apu_Rubro_Tecnica> Apu_Rubro_Tecnica_GetByCodigo(Scope s, string codigo, string par_servidor_Id)
        {
            return Apu_Rubro_Tecnica.GetByCodigo(s, codigo, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Tecnica> Apu_Rubro_Tecnica_GetById(Scope s, string Id, string par_servidor_Id)
        {
            return Apu_Rubro_Tecnica.GetById(s, Id, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Tecnica> Apu_Rubro_Tecnica_GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            return Apu_Rubro_Tecnica.GetByRubro(s, Apu_Rubro_Id, par_servidor_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro_Tecnica
        /// <summary>
        /// Borra el objeto de Apu_Rubro_Tecnica
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Tecnica_Delete(Scope s, Apu_Rubro_Tecnica o)
        {
            try
            {
                return Apu_Rubro_Tecnica.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Tecnica
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Tecnica_Insert(Scope s, Apu_Rubro_Tecnica o)
        {
            try
            {
                return Apu_Rubro_Tecnica.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro_Tecnica
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Tecnica_Update(Scope s, Apu_Rubro_Tecnica o, Apu_Rubro_Tecnica original)
        {
            try
            {
                return Apu_Rubro_Tecnica.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Material
        // Objeto permanente para acceso a DO_Apu_Rubro_Material
        private DO_Apu_Rubro_Material _Apu_Rubro_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Material
        /// </summary>
        public DO_Apu_Rubro_Material Apu_Rubro_Material
        {
            get
            {
                if (_Apu_Rubro_Material == null)
                    _Apu_Rubro_Material = new DO_Apu_Rubro_Material();
                return _Apu_Rubro_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Material> Apu_Rubro_Material_Get(Scope s)
        {
            return Apu_Rubro_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Material </returns>

        [WebMethod]
        public List<Apu_Rubro_Material> Apu_Rubro_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Rubro_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro_Material> Apu_Rubro_Material_GetById(Scope s, string Id)
        {
            return Apu_Rubro_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Material> Apu_Rubro_Material_GetByRubro(Scope s, string Apu_Rubro_Id)
        {
            return Apu_Rubro_Material.GetByRubro(s, Apu_Rubro_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro_Material
        /// <summary>
        /// Borra el objeto de Apu_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Material_Delete(Scope s, Apu_Rubro_Material o)
        {
            try
            {
                return Apu_Rubro_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Material_Insert(Scope s, Apu_Rubro_Material o)
        {
            try
            {
                return Apu_Rubro_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Material_Update(Scope s, Apu_Rubro_Material o, Apu_Rubro_Material original)
        {
            try
            {
                return Apu_Rubro_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Equipo
        // Objeto permanente para acceso a DO_Apu_Rubro_Equipo
        private DO_Apu_Rubro_Equipo _Apu_Rubro_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Equipo
        /// </summary>
        public DO_Apu_Rubro_Equipo Apu_Rubro_Equipo
        {
            get
            {
                if (_Apu_Rubro_Equipo == null)
                    _Apu_Rubro_Equipo = new DO_Apu_Rubro_Equipo();
                return _Apu_Rubro_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Equipo> Apu_Rubro_Equipo_Get(Scope s)
        {
            return Apu_Rubro_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Equipo </returns>

        [WebMethod]
        public List<Apu_Rubro_Equipo> Apu_Rubro_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Rubro_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro_Equipo> Apu_Rubro_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Rubro_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Equipo> Apu_Rubro_Equipo_GetByRubro(Scope s, string Apu_Rubro_Id)
        {
            return Apu_Rubro_Equipo.GetByRubro(s, Apu_Rubro_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Equipo_Delete(Scope s, Apu_Rubro_Equipo o)
        {
            try
            {
                return Apu_Rubro_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Equipo_Insert(Scope s, Apu_Rubro_Equipo o)
        {
            try
            {
                return Apu_Rubro_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Equipo_Update(Scope s, Apu_Rubro_Equipo o, Apu_Rubro_Equipo original)
        {
            try
            {
                return Apu_Rubro_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Rubro_Mano_Obra
        private DO_Apu_Rubro_Mano_Obra _Apu_Rubro_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Mano_Obra
        /// </summary>
        public DO_Apu_Rubro_Mano_Obra Apu_Rubro_Mano_Obra
        {
            get
            {
                if (_Apu_Rubro_Mano_Obra == null)
                    _Apu_Rubro_Mano_Obra = new DO_Apu_Rubro_Mano_Obra();
                return _Apu_Rubro_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Mano_Obra> Apu_Rubro_Mano_Obra_Get(Scope s)
        {
            return Apu_Rubro_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Mano_Obra </returns>

        [WebMethod]
        public List<Apu_Rubro_Mano_Obra> Apu_Rubro_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Rubro_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Rubro_Mano_Obra> Apu_Rubro_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Rubro_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Rubro_Mano_Obra> Apu_Rubro_Mano_Obra_GetByProyectoRubro(Scope s, string Apu_Proyecto_id, string Apu_Rubro_id)
        {
            return Apu_Rubro_Mano_Obra.GetByProyectoRubro(s, Apu_Proyecto_id, Apu_Rubro_id);
        }
        [WebMethod]
        public List<Apu_Rubro_Mano_Obra> Apu_Rubro_Mano_Obra_GetByRubro(Scope s, string Apu_Rubro_Id)
        {
            return Apu_Rubro_Mano_Obra.GetByRubro(s, Apu_Rubro_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Rubro_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Rubro_Mano_Obra_Delete(Scope s, Apu_Rubro_Mano_Obra o)
        {
            try
            {
                return Apu_Rubro_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Rubro_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Rubro_Mano_Obra_Insert(Scope s, Apu_Rubro_Mano_Obra o)
        {
            try
            {
                return Apu_Rubro_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Rubro_Mano_Obra_Update(Scope s, Apu_Rubro_Mano_Obra o, Apu_Rubro_Mano_Obra original)
        {
            try
            {
                return Apu_Rubro_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Categoria
        // Objeto permanente para acceso a DO_Apu_Proyecto_Categoria
        private DO_Apu_Proyecto_Categoria _Apu_Proyecto_Categoria;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Categoria
        /// </summary>
        public DO_Apu_Proyecto_Categoria Apu_Proyecto_Categoria
        {
            get
            {
                if (_Apu_Proyecto_Categoria == null)
                    _Apu_Proyecto_Categoria = new DO_Apu_Proyecto_Categoria();
                return _Apu_Proyecto_Categoria;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Categoria> Apu_Proyecto_Categoria_Get(Scope s)
        {
            return Apu_Proyecto_Categoria.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Categoria
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Categoria </returns>

        [WebMethod]
        public List<Apu_Proyecto_Categoria> Apu_Proyecto_Categoria_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Categoria.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Categoria> Apu_Proyecto_Categoria_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Categoria.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Categoria> Apu_Proyecto_Categoria_GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Categoria.GetByProyecto(s, apu_proyecto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Categoria
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Categoria
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Categoria_Delete(Scope s, Apu_Proyecto_Categoria o)
        {
            try
            {
                return Apu_Proyecto_Categoria.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Categoria_Insert(Scope s, Apu_Proyecto_Categoria o)
        {
            try
            {
                return Apu_Proyecto_Categoria.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Categoria
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Categoria_Update(Scope s, Apu_Proyecto_Categoria o, Apu_Proyecto_Categoria original)
        {
            try
            {
                return Apu_Proyecto_Categoria.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Material
        // Objeto permanente para acceso a DO_Apu_Proyecto_Material
        private DO_Apu_Proyecto_Material _Apu_Proyecto_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Material
        /// </summary>
        public DO_Apu_Proyecto_Material Apu_Proyecto_Material
        {
            get
            {
                if (_Apu_Proyecto_Material == null)
                    _Apu_Proyecto_Material = new DO_Apu_Proyecto_Material();
                return _Apu_Proyecto_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_Get(Scope s)
        {
            return Apu_Proyecto_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Material </returns>

        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByMaterial(Scope s, string apu_material_Id)
        {
            return Apu_Proyecto_Material.GetByMaterial(s, apu_material_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Material.GetByProyecto(s, apu_proyecto_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByProyecto_Oferta(Scope s, string apu_proyecto_id, string apu_oferta_Id)
        {
            return Apu_Proyecto_Material.GetByProyecto_Oferta(s,apu_proyecto_id,  apu_oferta_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByProyectoMaterial(Scope s, string Apu_Proyecto_Id, string apu_material_Id)
        {
            return Apu_Proyecto_Material.GetByProyectoMaterial(s, Apu_Proyecto_Id, apu_material_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Material> Apu_Proyecto_Material_GetByUpdateCosto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Material.GetByUpdateCosto(s, Apu_Proyecto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Material
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Material_Delete(Scope s, Apu_Proyecto_Material o)
        {
            try
            {
                return Apu_Proyecto_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Material_Insert(Scope s, Apu_Proyecto_Material o)
        {
            try
            {
                return Apu_Proyecto_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Material_Update(Scope s, Apu_Proyecto_Material o, Apu_Proyecto_Material original)
        {
            try
            {
                return Apu_Proyecto_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro
        private DO_Apu_Proyecto_Rubro _Apu_Proyecto_Rubro;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro
        /// </summary>
        public DO_Apu_Proyecto_Rubro Apu_Proyecto_Rubro
        {
            get
            {
                if (_Apu_Proyecto_Rubro == null)
                    _Apu_Proyecto_Rubro = new DO_Apu_Proyecto_Rubro();
                return _Apu_Proyecto_Rubro;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_Get(Scope s)
        {
            return Apu_Proyecto_Rubro.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro </returns>

        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Rubro.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Rubro.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Rubro.GetByProyecto(s, Apu_Proyecto_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_GetBySucursal(Scope s, string Int_Sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            return Apu_Proyecto_Rubro.GetBySucursal(s, Int_Sucursal_id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);
        }

        [WebMethod]
        public List<Apu_Proyecto_Rubro> Apu_Proyecto_Rubro_GetByProyecto_Oferta(Scope s,string apu_proyecto_id, string Apu_Oferta_Id)
        {
            return Apu_Proyecto_Rubro.GetByProyecto_Oferta(s,apu_proyecto_id, Apu_Oferta_Id);
        }

        [WebMethod]
        public int Apu_Proyecto_Rubro_TotalPaginas(Scope s, string Int_sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            return Apu_Proyecto_Rubro.TotalPaginas(s, Int_sucursal_id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);
        }


        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Delete(Scope s, Apu_Proyecto_Rubro o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Insert(Scope s, Apu_Proyecto_Rubro o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Update(Scope s, Apu_Proyecto_Rubro o, Apu_Proyecto_Rubro original)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Tecnica
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Tecnica
        private DO_Apu_Proyecto_Rubro_Tecnica _Apu_Proyecto_Rubro_Tecnica;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Tecnica Apu_Proyecto_Rubro_Tecnica
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Tecnica == null)
                    _Apu_Proyecto_Rubro_Tecnica = new DO_Apu_Proyecto_Rubro_Tecnica();
                return _Apu_Proyecto_Rubro_Tecnica;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Tecnica> Apu_Proyecto_Rubro_Tecnica_Get(Scope s, string par_servidor_id)
        {
            return Apu_Proyecto_Rubro_Tecnica.Get(s, par_servidor_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Tecnica </returns>

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Tecnica> Apu_Proyecto_Rubro_Tecnica_GetByCodigo(Scope s, string par_servidor_id, string Codigo)
        {
            return Apu_Proyecto_Rubro_Tecnica.GetByCodigo(s, par_servidor_id, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Tecnica> Apu_Proyecto_Rubro_Tecnica_GetById(Scope s, string par_servidor_Id, string Id)
        {
            return Apu_Proyecto_Rubro_Tecnica.GetById(s, par_servidor_Id, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Tecnica> Apu_Proyecto_Rubro_Tecnica_GetByProyecto(Scope s, string par_servidor_Id, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Rubro_Tecnica.GetByProyecto(s, par_servidor_Id, apu_proyecto_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Tecnica> Apu_Proyecto_Rubro_Tecnica_GetByProyectoRubro(Scope s, string par_servidor_Id, string apu_proyecto_rubro_Id)
        {
            return Apu_Proyecto_Rubro_Tecnica.GetByProyectoRubro(s, par_servidor_Id, apu_proyecto_rubro_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro_Tecnica
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Tecnica_Delete(Scope s, Apu_Proyecto_Rubro_Tecnica o)
        {
            try
            {
                return Apu_Proyecto_Rubro_Tecnica.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Tecnica_Insert(Scope s, Apu_Proyecto_Rubro_Tecnica o)
        {
            try
            {
                return Apu_Proyecto_Rubro_Tecnica.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Tecnica_Update(Scope s, Apu_Proyecto_Rubro_Tecnica o, Apu_Proyecto_Rubro_Tecnica original)
        {
            try
            {
                return Apu_Proyecto_Rubro_Tecnica.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Documento
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Documento
        private DO_Apu_Proyecto_Rubro_Documento _Apu_Proyecto_Rubro_Documento;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Documento
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Documento Apu_Proyecto_Rubro_Documento
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Documento == null)
                    _Apu_Proyecto_Rubro_Documento = new DO_Apu_Proyecto_Rubro_Documento();
                return _Apu_Proyecto_Rubro_Documento;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Documento> Apu_Proyecto_Rubro_Documento_Get(Scope s, string par_servidor_Id)
        {
            return Apu_Proyecto_Rubro_Documento.Get(s, par_servidor_Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Documento
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Documento </returns>

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Documento> Apu_Proyecto_Rubro_Documento_GetByCodigo(Scope s, string Codigo, string par_servidor_Id)
        {
            return Apu_Proyecto_Rubro_Documento.GetByCodigo(s, Codigo, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Documento> Apu_Proyecto_Rubro_Documento_GetById(Scope s, string Id, string par_servidor_Id)
        {
            return Apu_Proyecto_Rubro_Documento.GetById(s, Id, par_servidor_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Documento> Apu_Proyecto_Rubro_Documento_GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            return Apu_Proyecto_Rubro_Documento.GetByRubro(s, Apu_Rubro_Id, par_servidor_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro_Documento
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro_Documento
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Documento_Delete(Scope s, Apu_Proyecto_Rubro_Documento o)
        {
            try
            {
                return Apu_Proyecto_Rubro_Documento.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Documento
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Documento_Insert(Scope s, Apu_Proyecto_Rubro_Documento o)
        {
            try
            {
                return Apu_Proyecto_Rubro_Documento.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro_Documento
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Documento_Update(Scope s, Apu_Proyecto_Rubro_Documento o, Apu_Proyecto_Rubro_Documento original)
        {
            try
            {
                return Apu_Proyecto_Rubro_Documento.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Equipo
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Equipo
        private DO_Apu_Proyecto_Rubro_Equipo _Apu_Proyecto_Rubro_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Equipo
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Equipo Apu_Proyecto_Rubro_Equipo
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Equipo == null)
                    _Apu_Proyecto_Rubro_Equipo = new DO_Apu_Proyecto_Rubro_Equipo();
                return _Apu_Proyecto_Rubro_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Equipo> Apu_Proyecto_Rubro_Equipo_Get(Scope s)
        {
            return Apu_Proyecto_Rubro_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Equipo </returns>

        #region Procedimientos Select UNI  denominado ExisteEquipo
        [WebMethod]
        public int Apu_Proyecto_Rubro_Equipo_ExisteEquipo(Scope s, string Apu_Equipo_Id, string Apu_Proyecto_Rubro_Id)
        {
            return Apu_Proyecto_Rubro_Equipo.ExisteEquipo(s, Apu_Equipo_Id, Apu_Proyecto_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Equipo> Apu_Proyecto_Rubro_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Rubro_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Equipo> Apu_Proyecto_Rubro_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Rubro_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Equipo> Apu_Proyecto_Rubro_Equipo_GetByRubro(Scope s, string Apu_Proyecto_Rubro_Id)
        {
            return Apu_Proyecto_Rubro_Equipo.GetByRubro(s, Apu_Proyecto_Rubro_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Equipo> Apu_Proyecto_Rubro_Equipo_GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Rubro_Equipo.GetByProyecto(s, Apu_Proyecto_Id);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Equipo_Delete(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Equipo_Insert(Scope s, Apu_Proyecto_Rubro_Equipo o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Equipo_Update(Scope s, Apu_Proyecto_Rubro_Equipo o, Apu_Proyecto_Rubro_Equipo original)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Material
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Material
        private DO_Apu_Proyecto_Rubro_Material _Apu_Proyecto_Rubro_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Material
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Material Apu_Proyecto_Rubro_Material
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Material == null)
                    _Apu_Proyecto_Rubro_Material = new DO_Apu_Proyecto_Rubro_Material();
                return _Apu_Proyecto_Rubro_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_Get(Scope s)
        {
            return Apu_Proyecto_Rubro_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Material </returns>

        #region Procedimientos Select UNI  denominado ExisteMaterial
        [WebMethod]
        public int Apu_Proyecto_Rubro_Material_ExisteMaterial(Scope s, string Apu_Material_Id, string Apu_Proyecto_Rubro_Id)
        {
            return Apu_Proyecto_Rubro_Material.ExisteMaterial(s, Apu_Material_Id, Apu_Proyecto_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Rubro_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Rubro_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Rubro_Material.GetByProyecto(s, Apu_Proyecto_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_GetByProyectoRubro(Scope s, string Apu_Proyecto_Rubro_Id)
        {
            return Apu_Proyecto_Rubro_Material.GetByProyectoRubro(s, Apu_Proyecto_Rubro_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Material> Apu_Proyecto_Rubro_Material_GetByRubro(Scope s, string Apu_Proyecto_Rubro_id)
        {
            return Apu_Proyecto_Rubro_Material.GetByRubro(s, Apu_Proyecto_Rubro_id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro_Material
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Material_Delete(Scope s, Apu_Proyecto_Rubro_Material o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Material_Insert(Scope s, Apu_Proyecto_Rubro_Material o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Material_Update(Scope s, Apu_Proyecto_Rubro_Material o, Apu_Proyecto_Rubro_Material original)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Mano_Obra
        private DO_Apu_Proyecto_Rubro_Mano_Obra _Apu_Proyecto_Rubro_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Mano_Obra
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Mano_Obra Apu_Proyecto_Rubro_Mano_Obra
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Mano_Obra == null)
                    _Apu_Proyecto_Rubro_Mano_Obra = new DO_Apu_Proyecto_Rubro_Mano_Obra();
                return _Apu_Proyecto_Rubro_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Mano_Obra> Apu_Proyecto_Rubro_Mano_Obra_Get(Scope s)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Mano_Obra </returns>

        #region Procedimientos Select UNI  denominado ExisteManoObra
        [WebMethod]
        public int Apu_Proyecto_Rubro_Mano_Obra_ExisteManoObra(Scope s, string Apu_Mano_Obra_Id, string Apu_Proyecto_Rubro_Id)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.ExisteManoObra(s, Apu_Mano_Obra_Id, Apu_Proyecto_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Mano_Obra> Apu_Proyecto_Rubro_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Mano_Obra> Apu_Proyecto_Rubro_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Mano_Obra> Apu_Proyecto_Rubro_Mano_Obra_GetByRubro(Scope s, string Apu_Proyecto_Rubro_id)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.GetByRubro(s, Apu_Proyecto_Rubro_id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Mano_Obra> Apu_Proyecto_Rubro_Mano_Obra_GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Rubro_Mano_Obra.GetByProyecto(s, Apu_Proyecto_Id);
        }



        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Rubro_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Mano_Obra_Delete(Scope s, Apu_Proyecto_Rubro_Mano_Obra o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Rubro_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Rubro_Mano_Obra_Insert(Scope s, Apu_Proyecto_Rubro_Mano_Obra o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Rubro_Mano_Obra_Update(Scope s, Apu_Proyecto_Rubro_Mano_Obra o, Apu_Proyecto_Rubro_Mano_Obra original)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Rubro_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Equipo
        // Objeto permanente para acceso a DO_Apu_Proyecto_Equipo
        private DO_Apu_Proyecto_Equipo _Apu_Proyecto_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Equipo
        /// </summary>
        public DO_Apu_Proyecto_Equipo Apu_Proyecto_Equipo
        {
            get
            {
                if (_Apu_Proyecto_Equipo == null)
                    _Apu_Proyecto_Equipo = new DO_Apu_Proyecto_Equipo();
                return _Apu_Proyecto_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_Get(Scope s)
        {
            return Apu_Proyecto_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Equipo </returns>

        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByEquipo(Scope s, string Apu_Equipo_Id)
        {
            return Apu_Proyecto_Equipo.GetByEquipo(s, Apu_Equipo_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Equipo.GetByProyecto(s, apu_proyecto_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByProyecto_Oferta(Scope s, string apu_proyecto_id, string apu_oferta_Id)
        {
            return Apu_Proyecto_Equipo.GetByProyecto_Oferta(s,apu_proyecto_id, apu_oferta_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByProyectoEquipo(Scope s, string Apu_Proyecto_Id, string Apu_Equipo_Id)
        {
            return Apu_Proyecto_Equipo.GetByProyectoEquipo(s, Apu_Proyecto_Id, Apu_Equipo_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo> Apu_Proyecto_Equipo_GetByUpdateCosto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Equipo.GetByUpdateCosto(s, Apu_Proyecto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Equipo_Delete(Scope s, Apu_Proyecto_Equipo o)
        {
            try
            {
                return Apu_Proyecto_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Equipo_Insert(Scope s, Apu_Proyecto_Equipo o)
        {
            try
            {
                return Apu_Proyecto_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Equipo_Update(Scope s, Apu_Proyecto_Equipo o, Apu_Proyecto_Equipo original)
        {
            try
            {
                return Apu_Proyecto_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Cuadrilla
        // Objeto permanente para acceso a DO_Apu_Proyecto_Cuadrilla
        private DO_Apu_Proyecto_Cuadrilla _Apu_Proyecto_Cuadrilla;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Cuadrilla
        /// </summary>
        public DO_Apu_Proyecto_Cuadrilla Apu_Proyecto_Cuadrilla
        {
            get
            {
                if (_Apu_Proyecto_Cuadrilla == null)
                    _Apu_Proyecto_Cuadrilla = new DO_Apu_Proyecto_Cuadrilla();
                return _Apu_Proyecto_Cuadrilla;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Cuadrilla> Apu_Proyecto_Cuadrilla_Get(Scope s, string apu_proyecto_id)
        {
            return Apu_Proyecto_Cuadrilla.Get(s, apu_proyecto_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Cuadrilla
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Cuadrilla </returns>

        #endregion

        #endregion

        #region Servicios para Apu_Proyecto_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Proyecto_Mano_Obra
        private DO_Apu_Proyecto_Mano_Obra _Apu_Proyecto_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Mano_Obra
        /// </summary>
        public DO_Apu_Proyecto_Mano_Obra Apu_Proyecto_Mano_Obra
        {
            get
            {
                if (_Apu_Proyecto_Mano_Obra == null)
                    _Apu_Proyecto_Mano_Obra = new DO_Apu_Proyecto_Mano_Obra();
                return _Apu_Proyecto_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_Get(Scope s)
        {
            return Apu_Proyecto_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Mano_Obra </returns>

        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Mano_Obra.GetByProyecto(s, apu_proyecto_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByProyecto_Oferta(Scope s, string apu_proyecto_id, string apu_oferta_Id)
        {
            return Apu_Proyecto_Mano_Obra.GetByProyecto_Oferta(s, apu_proyecto_id, apu_oferta_Id);
        }

        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByManoObra(Scope s, string apu_mano_obra_Id)
        {
            return Apu_Proyecto_Mano_Obra.GetByManoObra(s, apu_mano_obra_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByProyectoManoObra(Scope s, string Apu_Proyecto_Id, string Apu_Mano_Obra_Id)
        {
            return Apu_Proyecto_Mano_Obra.GetByProyectoManoObra(s, Apu_Proyecto_Id, Apu_Mano_Obra_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Mano_Obra> Apu_Proyecto_Mano_Obra_GetByUpdateCosto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Mano_Obra.GetByUpdateCosto(s, Apu_Proyecto_Id);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Mano_Obra_Delete(Scope s, Apu_Proyecto_Mano_Obra o)
        {
            try
            {
                return Apu_Proyecto_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Mano_Obra_Insert(Scope s, Apu_Proyecto_Mano_Obra o)
        {
            try
            {
                return Apu_Proyecto_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Mano_Obra_Update(Scope s, Apu_Proyecto_Mano_Obra o, Apu_Proyecto_Mano_Obra original)
        {
            try
            {
                return Apu_Proyecto_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto
        // Objeto permanente para acceso a DO_Apu_Proyecto
        private DO_Apu_Proyecto _Apu_Proyecto;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto
        /// </summary>
        public DO_Apu_Proyecto Apu_Proyecto
        {
            get
            {
                if (_Apu_Proyecto == null)
                    _Apu_Proyecto = new DO_Apu_Proyecto();
                return _Apu_Proyecto;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_Get(Scope s)
        {
            return Apu_Proyecto.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto </returns>

        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetById(Scope s, string Id)
        {
            return Apu_Proyecto.GetById(s, Id);
        }

        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByIdResumido(Scope s, string Id)
        {
            return Apu_Proyecto.GetByIdResumido(s, Id);
        }

        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetBySucursal(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
        {
            return DEL.APU.DO_Apu_Proyecto.GetBySucursal(s, Int_sucursal_id, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
        }

        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return Apu_Proyecto.GetByLikeCodigoDesde(s, desde_Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return Apu_Proyecto.GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return Apu_Proyecto.GetByLikeCodigoHasta(s, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto> Apu_Proyecto_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Proyecto.GetByLikeNombre(s, Nombre);
        }

        [WebMethod]
        public int Apu_Proyecto_TotalPaginas(Scope s,  string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
        {
            return Apu_Proyecto.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
        }

        [WebMethod]
        public bool Apu_Proyecto_Update_Costo(Scope s, Apu_Proyecto oApu_Proyecto)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto.Update_Costo(s, oApu_Proyecto);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                //throw Error.ConstruirExcepcion(new Exception(Parametros[0], e), Context.Request.Url.AbsoluteUri);
                //throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
                throw Error.ConstruirExcepcion(new Exception(e.Message, e), Context.Request.Url.AbsoluteUri);
            }
        }

        [WebMethod]
        public bool Apu_Proyecto_Transferir_Oferta(Scope s, Apu_Proyecto oApu_Proyecto, string Apu_Oferta_Id)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto.Transferir_Oferta(s, oApu_Proyecto, Apu_Oferta_Id);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(e.Message, e), Context.Request.Url.AbsoluteUri);
            }
        }

        #endregion

        #region  Operaciones con datos de la tabla Apu_Proyecto
        /// <summary>
        /// Borra el objeto de Apu_Proyecto
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Delete(Scope s, Apu_Proyecto o)
        {
            try
            {
                return Apu_Proyecto.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Insert(Scope s, Apu_Proyecto o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Update(Scope s, Apu_Proyecto o, Apu_Proyecto original)
        {
            try
            {
                return Apu_Proyecto.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Rubro_Insumo
        // Objeto permanente para acceso a DO_Apu_Rubro_Insumo
        private DO_Apu_Rubro_Insumo _Apu_Rubro_Insumo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Rubro_Insumo
        /// </summary>
        public DO_Apu_Rubro_Insumo Apu_Rubro_Insumo
        {
            get
            {
                if (_Apu_Rubro_Insumo == null)
                    _Apu_Rubro_Insumo = new DO_Apu_Rubro_Insumo();
                return _Apu_Rubro_Insumo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Rubro_Insumo> Apu_Rubro_Insumo_Get(Scope s)
        {
            return Apu_Rubro_Insumo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Rubro_Insumo
        /// </summary>
        /// <returns>Todos los registros de Apu_Rubro_Insumo </returns>
        [WebMethod]
        public List<Apu_Rubro_Insumo> Apu_Rubro_Insumo_GetByRubro(Scope s, string apu_rubro_id)
        {
            return Apu_Rubro_Insumo.GetByRubro(s, apu_rubro_id);
        }

        [WebMethod]
        public List<Apu_Rubro_Insumo> Apu_Rubro_Insumo_GetBySucursal(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre,
                                                                     string Apu_Insumo_Nombre, string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            try
            {
                return Apu_Rubro_Insumo.GetBySucursal(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo,
                                                      Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }

        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Apu_Rubro_Insumo_TotalPaginas(Scope s, string Apu_Rubro_Codigo_Desde, string Apu_Rubro_Codigo_Hasta, string Apu_Rubro_Nombre, 
                                                 string Apu_Insumo_Nombre, string Tipo, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            try
            {
                return Apu_Rubro_Insumo.TotalPaginas(s, Apu_Rubro_Codigo_Desde, Apu_Rubro_Codigo_Hasta, Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo,
                                                     Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Insumo
        // Objeto permanente para acceso a DO_Apu_Proyecto_Insumo
        private DO_Apu_Proyecto_Insumo _Apu_Proyecto_Insumo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Insumo
        /// </summary>
        public DO_Apu_Proyecto_Insumo Apu_Proyecto_Insumo
        {
            get
            {
                if (_Apu_Proyecto_Insumo == null)
                    _Apu_Proyecto_Insumo = new DO_Apu_Proyecto_Insumo();
                return _Apu_Proyecto_Insumo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Insumo> Apu_Proyecto_Insumo_Get(Scope s)
        {
            return Apu_Proyecto_Insumo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Insumo
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Insumo </returns>

        [WebMethod]
        public List<Apu_Proyecto_Insumo> Apu_Proyecto_Insumo_GetBySucursal(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Insumo_Nombre, string Tipo)
        {
            return Apu_Proyecto_Insumo.GetBySucursal(s, Int_sucursal_id, Codigo_Desde, Codigo_Hasta, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Insumo_Nombre, Tipo);
        }

        [WebMethod]
        public int Apu_Proyecto_Insumo_TotalPaginas(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Insumo_Nombre, string Tipo)
        {
            return Apu_Proyecto_Insumo.TotalPaginas(s, Int_sucursal_id, Codigo_Desde, Codigo_Hasta, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Insumo_Nombre, Tipo);
        }
        #endregion

        #endregion

        #region Servicios para Apu_Proyecto_Equipo_Indice
        // Objeto permanente para acceso a DO_Apu_Proyecto_Equipo_Indice
        private DO_Apu_Proyecto_Equipo_Indice _Apu_Proyecto_Equipo_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Equipo_Indice
        /// </summary>
        public DO_Apu_Proyecto_Equipo_Indice Apu_Proyecto_Equipo_Indice
        {
            get
            {
                if (_Apu_Proyecto_Equipo_Indice == null)
                    _Apu_Proyecto_Equipo_Indice = new DO_Apu_Proyecto_Equipo_Indice();
                return _Apu_Proyecto_Equipo_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Equipo_Indice> Apu_Proyecto_Equipo_Indice_Get(Scope s)
        {
            return Apu_Proyecto_Equipo_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Equipo_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Equipo_Indice </returns>

        [WebMethod]
        public List<Apu_Proyecto_Equipo_Indice> Apu_Proyecto_Equipo_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Equipo_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo_Indice> Apu_Proyecto_Equipo_Indice_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Equipo_Indice.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo_Indice> Apu_Proyecto_Equipo_Indice_GetByProyectoEquipo(Scope s, string Apu_Proyecto_Equipo_Id)
        {
            return Apu_Proyecto_Equipo_Indice.GetByProyectoEquipo(s, Apu_Proyecto_Equipo_Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Equipo_Indice> Apu_Proyecto_Equipo_Indice_GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            return Apu_Proyecto_Equipo_Indice.GetByProyecto(s, Apu_Proyecto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Equipo_Indice
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Equipo_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Equipo_Indice_Delete(Scope s, Apu_Proyecto_Equipo_Indice o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Equipo_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Equipo_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Equipo_Indice_Insert(Scope s, Apu_Proyecto_Equipo_Indice o)
        {
            try
            {
                return DEL.APU.DO_Apu_Proyecto_Equipo_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Equipo_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Equipo_Indice_Update(Scope s, Apu_Proyecto_Equipo_Indice o, Apu_Proyecto_Equipo_Indice original)
        {
            try
            {
                return Apu_Proyecto_Equipo_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Transporte_Indice
        // Objeto permanente para acceso a DO_Apu_Proyecto_Transporte_Indice
        private DO_Apu_Proyecto_Transporte_Indice _Apu_Proyecto_Transporte_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Transporte_Indice
        /// </summary>
        public DO_Apu_Proyecto_Transporte_Indice Apu_Proyecto_Transporte_Indice
        {
            get
            {
                if (_Apu_Proyecto_Transporte_Indice == null)
                    _Apu_Proyecto_Transporte_Indice = new DO_Apu_Proyecto_Transporte_Indice();
                return _Apu_Proyecto_Transporte_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Transporte_Indice> Apu_Proyecto_Transporte_Indice_Get(Scope s)
        {
            return Apu_Proyecto_Transporte_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Transporte_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Transporte_Indice </returns>

        [WebMethod]
        public List<Apu_Proyecto_Transporte_Indice> Apu_Proyecto_Transporte_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Proyecto_Transporte_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Proyecto_Transporte_Indice> Apu_Proyecto_Transporte_Indice_GetById(Scope s, string Id)
        {
            return Apu_Proyecto_Transporte_Indice.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Proyecto_Transporte_Indice> Apu_Proyecto_Transporte_Indice_GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            return Apu_Proyecto_Transporte_Indice.GetByProyecto(s, apu_proyecto_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Proyecto_Transporte_Indice
        /// <summary>
        /// Borra el objeto de Apu_Proyecto_Transporte_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Proyecto_Transporte_Indice_Delete(Scope s, Apu_Proyecto_Transporte_Indice o)
        {
            try
            {
                return Apu_Proyecto_Transporte_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Proyecto_Transporte_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Proyecto_Transporte_Indice_Insert(Scope s, Apu_Proyecto_Transporte_Indice o)
        {
            try
            {
                return Apu_Proyecto_Transporte_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Proyecto_Transporte_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Proyecto_Transporte_Indice_Update(Scope s, Apu_Proyecto_Transporte_Indice o, Apu_Proyecto_Transporte_Indice original)
        {
            try
            {
                return Apu_Proyecto_Transporte_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Indice
        // Objeto permanente para acceso a DO_Apu_Proyecto_Indice
        private DO_Apu_Proyecto_Indice _Apu_Proyecto_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Indice
        /// </summary>
        public DO_Apu_Proyecto_Indice Apu_Proyecto_Indice
        {
            get
            {
                if (_Apu_Proyecto_Indice == null)
                    _Apu_Proyecto_Indice = new DO_Apu_Proyecto_Indice();
                return _Apu_Proyecto_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Indice> Apu_Proyecto_Indice_Get(Scope s, string apu_proyecto_id)
        {
            return Apu_Proyecto_Indice.Get(s, apu_proyecto_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Indice </returns>

        #endregion

        #endregion

        #region Servicios para Apu_Proyecto_Rubro_Insumo
        // Objeto permanente para acceso a DO_Apu_Proyecto_Rubro_Insumo
        private DO_Apu_Proyecto_Rubro_Insumo _Apu_Proyecto_Rubro_Insumo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Rubro_Insumo
        /// </summary>
        public DO_Apu_Proyecto_Rubro_Insumo Apu_Proyecto_Rubro_Insumo
        {
            get
            {
                if (_Apu_Proyecto_Rubro_Insumo == null)
                    _Apu_Proyecto_Rubro_Insumo = new DO_Apu_Proyecto_Rubro_Insumo();
                return _Apu_Proyecto_Rubro_Insumo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Rubro_Insumo> Apu_Proyecto_Rubro_Insumo_Get(Scope s)
        {
            return Apu_Proyecto_Rubro_Insumo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Rubro_Insumo
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Rubro_Insumo </returns>

        [WebMethod]
        public List<Apu_Proyecto_Rubro_Insumo> Apu_Proyecto_Rubro_Insumo_GetBySucursal(Scope s, string Int_sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Nombre, string Apu_Insumo_Nombre, string Tipo)
        {
            return Apu_Proyecto_Rubro_Insumo.GetBySucursal(s, Int_sucursal_id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo);
        }


        [WebMethod]
        public List<Apu_Proyecto_Rubro_Insumo> Apu_Proyecto_Rubro_Insumo_GetByProyecto(Scope s, string Apu_proyecto_id)
        {
            return Apu_Proyecto_Rubro_Insumo.GetByProyecto(s, Apu_proyecto_id);
        }
        #endregion

        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Apu_Proyecto_Rubro_Insumo_TotalPaginas(Scope s, string Int_sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Nombre, string Apu_Insumo_Nombre, string Tipo)
        {
            return Apu_Proyecto_Rubro_Insumo.TotalPaginas(s, Int_sucursal_id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo);
        }
        #endregion

        #endregion

        #region Servicios para Apu_Oferta
        // Objeto permanente para acceso a DO_Apu_Oferta
        private DO_Apu_Oferta _Apu_Oferta;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta
        /// </summary>
        public DO_Apu_Oferta Apu_Oferta
        {
            get
            {
                if (_Apu_Oferta == null)
                    _Apu_Oferta = new DO_Apu_Oferta();
                return _Apu_Oferta;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_Get(Scope s)
        {
            return Apu_Oferta.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta </returns>

        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetById(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta.GetById(s, Apu_Oferta_Id);
        }

        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByIdResumido(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta.GetByIdResumido(s, Apu_Oferta_Id);
        }

        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
        {
            return DEL.APU.DO_Apu_Oferta.GetBySucursal(s,  Codigo_Desde, Codigo_Hasta, Estado, Nombre, Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
        }

        [WebMethod]
        public int Apu_Oferta_TotalPaginas(Scope s,  string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre,  string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
        {
            return Apu_Oferta.TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre,  Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            return Apu_Oferta.GetByLikeCodigoDesde(s, desde_Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            return Apu_Oferta.GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            return Apu_Oferta.GetByLikeCodigoHasta(s, hasta_Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByLikeNombre(Scope s, string Nombre)
        {
            return Apu_Oferta.GetByLikeNombre(s, Nombre);
        }
        [WebMethod]
        public List<Apu_Oferta> Apu_Oferta_GetByEstado(Scope s, string Nombre, string Estado)
        {
            return Apu_Oferta.GetByEstado(s,Nombre, Estado);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta

        [WebMethod]
        public String Apu_Oferta_Clonar(Scope s, String Apu_Oferta_Id)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta.Clonar(s, Apu_Oferta_Id);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        
        /// <summary>
        /// Borra el objeto de Apu_Oferta
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Delete(Scope s, Apu_Oferta o)
        {
            try
            {
                return Apu_Oferta.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Insert(Scope s, Apu_Oferta o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Update(Scope s, Apu_Oferta o, Apu_Oferta original)
        {
            try
            {
                return Apu_Oferta.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Material
        // Objeto permanente para acceso a DO_Apu_Oferta_Material
        private DO_Apu_Oferta_Material _Apu_Oferta_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Material
        /// </summary>
        public DO_Apu_Oferta_Material Apu_Oferta_Material
        {
            get
            {
                if (_Apu_Oferta_Material == null)
                    _Apu_Oferta_Material = new DO_Apu_Oferta_Material();
                return _Apu_Oferta_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_Get(Scope s)
        {
            return Apu_Oferta_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Material </returns>

        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_GetByMaterial(Scope s, string Apu_Material_Id)
        {
            return Apu_Oferta_Material.GetByMaterial(s, Apu_Material_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Material.GetByOferta(s, Apu_Oferta_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Material> Apu_Oferta_Material_GetByOfertaMaterial(Scope s, string Apu_Oferta_Id, string Apu_Material_Id)
        {
            return Apu_Oferta_Material.GetByOfertaMaterial(s, Apu_Oferta_Id, Apu_Material_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Material
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Material_Delete(Scope s, Apu_Oferta_Material o)
        {
            try
            {
                return Apu_Oferta_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Material_Insert(Scope s, Apu_Oferta_Material o)
        {
            try
            {
                return Apu_Oferta_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Material_Update(Scope s, Apu_Oferta_Material o, Apu_Oferta_Material original)
        {
            try
            {
                return Apu_Oferta_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Transporte_Indice
        // Objeto permanente para acceso a DO_Apu_Oferta_Transporte_Indice
        private DO_Apu_Oferta_Transporte_Indice _Apu_Oferta_Transporte_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Transporte_Indice
        /// </summary>
        public DO_Apu_Oferta_Transporte_Indice Apu_Oferta_Transporte_Indice
        {
            get
            {
                if (_Apu_Oferta_Transporte_Indice == null)
                    _Apu_Oferta_Transporte_Indice = new DO_Apu_Oferta_Transporte_Indice();
                return _Apu_Oferta_Transporte_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Transporte_Indice> Apu_Oferta_Transporte_Indice_Get(Scope s)
        {
            return Apu_Oferta_Transporte_Indice.Get(s);
        }
        [WebMethod]
        public List<Apu_Oferta_Transporte_Indice> Apu_Oferta_Transporte_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Transporte_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Transporte_Indice> Apu_Oferta_Transporte_Indice_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Transporte_Indice.GetById(s, Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Transporte_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Transporte_Indice </returns>

        [WebMethod]
        public List<Apu_Oferta_Transporte_Indice> Apu_Oferta_Transporte_Indice_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Transporte_Indice.GetByOferta(s, Apu_Oferta_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Transporte_Indice
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Transporte_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Transporte_Indice_Delete(Scope s, Apu_Oferta_Transporte_Indice o)
        {
            try
            {
                return Apu_Oferta_Transporte_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Transporte_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Transporte_Indice_Insert(Scope s, Apu_Oferta_Transporte_Indice o)
        {
            try
            {
                return Apu_Oferta_Transporte_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Transporte_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Transporte_Indice_Update(Scope s, Apu_Oferta_Transporte_Indice o, Apu_Oferta_Transporte_Indice original)
        {
            try
            {
                return Apu_Oferta_Transporte_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Equipo
        // Objeto permanente para acceso a DO_Apu_Oferta_Equipo
        private DO_Apu_Oferta_Equipo _Apu_Oferta_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Equipo
        /// </summary>
        public DO_Apu_Oferta_Equipo Apu_Oferta_Equipo
        {
            get
            {
                if (_Apu_Oferta_Equipo == null)
                    _Apu_Oferta_Equipo = new DO_Apu_Oferta_Equipo();
                return _Apu_Oferta_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_Get(Scope s)
        {
            return Apu_Oferta_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Equipo </returns>

        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_GetByEquipo(Scope s, string Apu_Equipo_Id)
        {
            return Apu_Oferta_Equipo.GetByEquipo(s, Apu_Equipo_Id);
        }

        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Equipo.GetByOferta(s, Apu_Oferta_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Equipo> Apu_Oferta_Equipo_GetByOfertaEquipo(Scope s, string Apu_Oferta_Id, string Apu_Equipo_Id)
        {
            return Apu_Oferta_Equipo.GetByOfertaEquipo(s, Apu_Oferta_Id, Apu_Equipo_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Equipo_Delete(Scope s, Apu_Oferta_Equipo o)
        {
            try
            {
                return Apu_Oferta_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Equipo_Insert(Scope s, Apu_Oferta_Equipo o)
        {
            try
            {
                return Apu_Oferta_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Equipo_Update(Scope s, Apu_Oferta_Equipo o, Apu_Oferta_Equipo original)
        {
            try
            {
                return Apu_Oferta_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Equipo_Indice
        // Objeto permanente para acceso a DO_Apu_Oferta_Equipo_Indice
        private DO_Apu_Oferta_Equipo_Indice _Apu_Oferta_Equipo_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Equipo_Indice
        /// </summary>
        public DO_Apu_Oferta_Equipo_Indice Apu_Oferta_Equipo_Indice
        {
            get
            {
                if (_Apu_Oferta_Equipo_Indice == null)
                    _Apu_Oferta_Equipo_Indice = new DO_Apu_Oferta_Equipo_Indice();
                return _Apu_Oferta_Equipo_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Equipo_Indice> Apu_Oferta_Equipo_Indice_Get(Scope s)
        {
            return Apu_Oferta_Equipo_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Equipo_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Equipo_Indice </returns>

        [WebMethod]
        public List<Apu_Oferta_Equipo_Indice> Apu_Oferta_Equipo_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Equipo_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Equipo_Indice> Apu_Oferta_Equipo_Indice_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Equipo_Indice.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Equipo_Indice> Apu_Oferta_Equipo_Indice_GetByOfertaEquipo(Scope s, string Apu_Oferta_Equipo_Id)
        {
            return Apu_Oferta_Equipo_Indice.GetByOfertaEquipo(s, Apu_Oferta_Equipo_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Equipo_Indice
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Equipo_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Equipo_Indice_Delete(Scope s, Apu_Oferta_Equipo_Indice o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Equipo_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Equipo_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Equipo_Indice_Insert(Scope s, Apu_Oferta_Equipo_Indice o)
        {
            try
            {
                
                return DEL.APU.DO_Apu_Oferta_Equipo_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Equipo_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Equipo_Indice_Update(Scope s, Apu_Oferta_Equipo_Indice o, Apu_Oferta_Equipo_Indice original)
        {
            try
            {
                return Apu_Oferta_Equipo_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Rubro
        // Objeto permanente para acceso a DO_Apu_Oferta_Rubro
        private DO_Apu_Oferta_Rubro _Apu_Oferta_Rubro;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Rubro
        /// </summary>
        public DO_Apu_Oferta_Rubro Apu_Oferta_Rubro
        {
            get
            {
                if (_Apu_Oferta_Rubro == null)
                    _Apu_Oferta_Rubro = new DO_Apu_Oferta_Rubro();
                return _Apu_Oferta_Rubro;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Rubro> Apu_Oferta_Rubro_Get(Scope s)
        {
            return Apu_Oferta_Rubro.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Rubro
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Rubro </returns>

        [WebMethod]
        public List<Apu_Oferta_Rubro> Apu_Oferta_Rubro_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Rubro.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro> Apu_Oferta_Rubro_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Rubro.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro> Apu_Oferta_Rubro_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Rubro.GetByOferta(s, Apu_Oferta_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Rubro
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Rubro
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Rubro_Delete(Scope s, Apu_Oferta_Rubro o)
        {
            try
            {
                return Apu_Oferta_Rubro.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Rubro_Insert(Scope s, Apu_Oferta_Rubro o)
        {
            try
            {
                //return Apu_Oferta_Rubro.Insert(s, o);
                return DEL.APU.DO_Apu_Oferta_Rubro.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Rubro
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Rubro_Update(Scope s, Apu_Oferta_Rubro o, Apu_Oferta_Rubro original)
        {
            try
            {
                return Apu_Oferta_Rubro.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Rubro_Material
        // Objeto permanente para acceso a DO_Apu_Oferta_Rubro_Material
        private DO_Apu_Oferta_Rubro_Material _Apu_Oferta_Rubro_Material;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Rubro_Material
        /// </summary>
        public DO_Apu_Oferta_Rubro_Material Apu_Oferta_Rubro_Material
        {
            get
            {
                if (_Apu_Oferta_Rubro_Material == null)
                    _Apu_Oferta_Rubro_Material = new DO_Apu_Oferta_Rubro_Material();
                return _Apu_Oferta_Rubro_Material;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Rubro_Material> Apu_Oferta_Rubro_Material_Get(Scope s)
        {
            return Apu_Oferta_Rubro_Material.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Rubro_Material
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Rubro_Material </returns>

        #region Procedimientos Select UNI  denominado ExisteMaterial
        [WebMethod]
        public int Apu_Oferta_Rubro_Material_ExisteMaterial(Scope s, string Apu_Material_Id, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Material.ExisteMaterial(s, Apu_Material_Id, Apu_Oferta_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Oferta_Rubro_Material> Apu_Oferta_Rubro_Material_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Rubro_Material.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Material> Apu_Oferta_Rubro_Material_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Rubro_Material.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Material> Apu_Oferta_Rubro_Material_GetByOfertaRubro(Scope s, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Material.GetByOfertaRubro(s, Apu_Oferta_Rubro_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Material> Apu_Oferta_Rubro_Material_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Rubro_Material.GetByOferta(s, Apu_Oferta_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Rubro_Material
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Rubro_Material_Delete(Scope s, Apu_Oferta_Rubro_Material o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Material.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Rubro_Material
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Rubro_Material_Insert(Scope s, Apu_Oferta_Rubro_Material o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Material.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Rubro_Material
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Rubro_Material_Update(Scope s, Apu_Oferta_Rubro_Material o, Apu_Oferta_Rubro_Material original)
        {
            try
            {
                return Apu_Oferta_Rubro_Material.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Rubro_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Oferta_Rubro_Mano_Obra
        private DO_Apu_Oferta_Rubro_Mano_Obra _Apu_Oferta_Rubro_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Rubro_Mano_Obra
        /// </summary>
        public DO_Apu_Oferta_Rubro_Mano_Obra Apu_Oferta_Rubro_Mano_Obra
        {
            get
            {
                if (_Apu_Oferta_Rubro_Mano_Obra == null)
                    _Apu_Oferta_Rubro_Mano_Obra = new DO_Apu_Oferta_Rubro_Mano_Obra();
                return _Apu_Oferta_Rubro_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Rubro_Mano_Obra> Apu_Oferta_Rubro_Mano_Obra_Get(Scope s)
        {
            return Apu_Oferta_Rubro_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Rubro_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Rubro_Mano_Obra </returns>

        #region Procedimientos Select UNI  denominado ExisteManoObra
        [WebMethod]
        public int Apu_Oferta_Rubro_Mano_Obra_ExisteManoObra(Scope s, string Apu_Mano_Obra_Id, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Mano_Obra.ExisteManoObra(s, Apu_Mano_Obra_Id, Apu_Oferta_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Oferta_Rubro_Mano_Obra> Apu_Oferta_Rubro_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Rubro_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Mano_Obra> Apu_Oferta_Rubro_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Rubro_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Mano_Obra> Apu_Oferta_Rubro_Mano_Obra_GetByOfertaRubro(Scope s, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Mano_Obra.GetByOfertaRubro(s, Apu_Oferta_Rubro_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Mano_Obra> Apu_Oferta_Rubro_Mano_Obra_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Rubro_Mano_Obra.GetByOferta(s, Apu_Oferta_Id);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Rubro_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Rubro_Mano_Obra_Delete(Scope s, Apu_Oferta_Rubro_Mano_Obra o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Rubro_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Rubro_Mano_Obra_Insert(Scope s, Apu_Oferta_Rubro_Mano_Obra o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Rubro_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Rubro_Mano_Obra_Update(Scope s, Apu_Oferta_Rubro_Mano_Obra o, Apu_Oferta_Rubro_Mano_Obra original)
        {
            try
            {
                return Apu_Oferta_Rubro_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Mano_Obra
        // Objeto permanente para acceso a DO_Apu_Oferta_Mano_Obra
        private DO_Apu_Oferta_Mano_Obra _Apu_Oferta_Mano_Obra;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Mano_Obra
        /// </summary>
        public DO_Apu_Oferta_Mano_Obra Apu_Oferta_Mano_Obra
        {
            get
            {
                if (_Apu_Oferta_Mano_Obra == null)
                    _Apu_Oferta_Mano_Obra = new DO_Apu_Oferta_Mano_Obra();
                return _Apu_Oferta_Mano_Obra;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_Get(Scope s)
        {
            return Apu_Oferta_Mano_Obra.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Mano_Obra
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Mano_Obra </returns>

        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Mano_Obra.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Mano_Obra.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_GetByManoObra(Scope s, string Apu_Mano_Obra_Id)
        {
            return Apu_Oferta_Mano_Obra.GetByManoObra(s, Apu_Mano_Obra_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Mano_Obra.GetByOferta(s, Apu_Oferta_Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Mano_Obra> Apu_Oferta_Mano_Obra_GetByOfertaManoObra(Scope s, string Apu_Oferta_Id, string Apu_Mano_Obra_Id)
        {
            return Apu_Oferta_Mano_Obra.GetByOfertaManoObra(s, Apu_Oferta_Id, Apu_Mano_Obra_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Mano_Obra
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Mano_Obra_Delete(Scope s, Apu_Oferta_Mano_Obra o)
        {
            try
            {
                return Apu_Oferta_Mano_Obra.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Mano_Obra
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Mano_Obra_Insert(Scope s, Apu_Oferta_Mano_Obra o)
        {
            try
            {
                return Apu_Oferta_Mano_Obra.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Mano_Obra
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Mano_Obra_Update(Scope s, Apu_Oferta_Mano_Obra o, Apu_Oferta_Mano_Obra original)
        {
            try
            {
                return Apu_Oferta_Mano_Obra.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Rubro_Equipo
        // Objeto permanente para acceso a DO_Apu_Oferta_Rubro_Equipo
        private DO_Apu_Oferta_Rubro_Equipo _Apu_Oferta_Rubro_Equipo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Rubro_Equipo
        /// </summary>
        public DO_Apu_Oferta_Rubro_Equipo Apu_Oferta_Rubro_Equipo
        {
            get
            {
                if (_Apu_Oferta_Rubro_Equipo == null)
                    _Apu_Oferta_Rubro_Equipo = new DO_Apu_Oferta_Rubro_Equipo();
                return _Apu_Oferta_Rubro_Equipo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Rubro_Equipo> Apu_Oferta_Rubro_Equipo_Get(Scope s)
        {
            return Apu_Oferta_Rubro_Equipo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Rubro_Equipo
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Rubro_Equipo </returns>

        #region Procedimientos Select UNI  denominado ExisteEquipo
        [WebMethod]
        public int Apu_Oferta_Rubro_Equipo_ExisteEquipo(Scope s, string Apu_Equipo_Id, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Equipo.ExisteEquipo(s, Apu_Equipo_Id, Apu_Oferta_Rubro_Id);
        }
        #endregion

        [WebMethod]
        public List<Apu_Oferta_Rubro_Equipo> Apu_Oferta_Rubro_Equipo_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Rubro_Equipo.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Equipo> Apu_Oferta_Rubro_Equipo_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Rubro_Equipo.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Rubro_Equipo> Apu_Oferta_Rubro_Equipo_GetByOfertaRubro(Scope s, string Apu_Oferta_Rubro_Id)
        {
            return Apu_Oferta_Rubro_Equipo.GetByOfertaRubro(s, Apu_Oferta_Rubro_Id);
        }

        [WebMethod]
        public List<Apu_Oferta_Rubro_Equipo> Apu_Oferta_Rubro_Equipo_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Rubro_Equipo.GetByOferta(s, Apu_Oferta_Id);
        }


        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Rubro_Equipo
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Rubro_Equipo_Delete(Scope s, Apu_Oferta_Rubro_Equipo o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Equipo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Rubro_Equipo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Rubro_Equipo_Insert(Scope s, Apu_Oferta_Rubro_Equipo o)
        {
            try
            {
                return DEL.APU.DO_Apu_Oferta_Rubro_Equipo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Rubro_Equipo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Rubro_Equipo_Update(Scope s, Apu_Oferta_Rubro_Equipo o, Apu_Oferta_Rubro_Equipo original)
        {
            try
            {
                return Apu_Oferta_Rubro_Equipo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Indice
        // Objeto permanente para acceso a DO_Apu_Oferta_Indice
        private DO_Apu_Oferta_Indice _Apu_Oferta_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Indice
        /// </summary>
        public DO_Apu_Oferta_Indice Apu_Oferta_Indice
        {
            get
            {
                if (_Apu_Oferta_Indice == null)
                    _Apu_Oferta_Indice = new DO_Apu_Oferta_Indice();
                return _Apu_Oferta_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Indice> Apu_Oferta_Indice_Get(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Indice.Get(s, Apu_Oferta_Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Indice </returns>
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Cuadrilla
        // Objeto permanente para acceso a DO_Apu_Oferta_Cuadrilla
        private DO_Apu_Oferta_Cuadrilla _Apu_Oferta_Cuadrilla;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Cuadrilla
        /// </summary>
        public DO_Apu_Oferta_Cuadrilla Apu_Oferta_Cuadrilla
        {
            get
            {
                if (_Apu_Oferta_Cuadrilla == null)
                    _Apu_Oferta_Cuadrilla = new DO_Apu_Oferta_Cuadrilla();
                return _Apu_Oferta_Cuadrilla;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Cuadrilla> Apu_Oferta_Cuadrilla_Get(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Cuadrilla.Get(s, Apu_Oferta_Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Cuadrilla
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Cuadrilla </returns>
        #endregion
        #endregion

        #region Servicios para Apu_Indice
        // Objeto permanente para acceso a DO_Apu_Indice
        private DO_Apu_Indice _Apu_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Indice
        /// </summary>
        public DO_Apu_Indice Apu_Indice
        {
            get
            {
                if (_Apu_Indice == null)
                    _Apu_Indice = new DO_Apu_Indice();
                return _Apu_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_Get(Scope s)
        {
            return Apu_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Indice </returns>

        #region Procedimientos Select UNI  denominado ExisteRegistros
        [WebMethod]
        public int Apu_Indice_ExisteRegistros(Scope s)
        {
            return Apu_Indice.ExisteRegistros(s);
        }
        #endregion

        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Indice.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetByEmpresa(Scope s)
        {
            return Apu_Indice.GetByEmpresa(s);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetById(Scope s, string Id)
        {
            return Apu_Indice.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetBySoloMaterial(Scope s)
        {
            return Apu_Indice.GetBySoloMaterial(s);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetByVariosN(Scope s)
        {
            return Apu_Indice.GetByVariosN(s);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetByLikeSoloMaterial(Scope s, string nombre)
        {
            return Apu_Indice.GetByLikeSoloMaterial(s, nombre);
        }
        [WebMethod]
        public List<Apu_Indice> Apu_Indice_GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Indice_Nombre)
        {
            return Apu_Indice.GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Indice_Nombre);
        }
        #region Update denominado UpdateVariosN
        [WebMethod]
        public int Apu_Indice_UpdateVariosN(Scope s)
        {
            return Apu_Indice.UpdateVariosN(s);
        }
        #endregion

        #endregion
        #region  Operaciones con datos de la tabla Apu_Indice
        /// <summary>
        /// Borra el objeto de Apu_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Indice_Delete(Scope s, Apu_Indice o)
        {
            try
            {
                return Apu_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Indice_Insert(Scope s, Apu_Indice o)
        {
            try
            {
                return Apu_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Indice_Update(Scope s, Apu_Indice o, Apu_Indice original)
        {
            try
            {
                return Apu_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Rubro_Insumo
        // Objeto permanente para acceso a DO_Apu_Oferta_Rubro_Insumo
        private DO_Apu_Oferta_Rubro_Insumo _Apu_Oferta_Rubro_Insumo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Rubro_Insumo
        /// </summary>
        public DO_Apu_Oferta_Rubro_Insumo Apu_Oferta_Rubro_Insumo
        {
            get
            {
                if (_Apu_Oferta_Rubro_Insumo == null)
                    _Apu_Oferta_Rubro_Insumo = new DO_Apu_Oferta_Rubro_Insumo();
                return _Apu_Oferta_Rubro_Insumo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Rubro_Insumo> Apu_Oferta_Rubro_Insumo_Get(Scope s)
        {
            return Apu_Oferta_Rubro_Insumo.Get(s);
        }

        [WebMethod]
        public List<Apu_Oferta_Rubro_Insumo> Apu_Oferta_Rubro_Insumo_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Rubro_Insumo.GetByOferta(s, Apu_Oferta_Id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Rubro_Insumo
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Rubro_Insumo </returns>
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Diferencia
        // Objeto permanente para acceso a DO_Apu_Proyecto_Diferencia
        private DO_Apu_Proyecto_Diferencia _Apu_Proyecto_Diferencia;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Diferencia
        /// </summary>
        public DO_Apu_Proyecto_Diferencia Apu_Proyecto_Diferencia
        {
            get
            {
                if (_Apu_Proyecto_Diferencia == null)
                    _Apu_Proyecto_Diferencia = new DO_Apu_Proyecto_Diferencia();
                return _Apu_Proyecto_Diferencia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Diferencia> Apu_Proyecto_Diferencia_GetByProyecto(Scope s, string apu_proyecto_id)
        {
            return Apu_Proyecto_Diferencia.GetByProyecto(s, apu_proyecto_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Diferencia
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Diferencia </returns>

        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Diferencia
        // Objeto permanente para acceso a DO_Apu_Oferta_Diferencia
        private DO_Apu_Oferta_Diferencia _Apu_Oferta_Diferencia;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Diferencia
        /// </summary>
        public DO_Apu_Oferta_Diferencia Apu_Oferta_Diferencia
        {
            get
            {
                if (_Apu_Oferta_Diferencia == null)
                    _Apu_Oferta_Diferencia = new DO_Apu_Oferta_Diferencia();
                return _Apu_Oferta_Diferencia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Diferencia> Apu_Oferta_Diferencia_GetByOferta(Scope s, string apu_oferta_id)
        {
            return Apu_Oferta_Diferencia.GetByOferta(s, apu_oferta_id);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Diferencia
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Diferencia </returns>
        #endregion
        #endregion

        #region Servicios para Apu_Proyecto_Cuadrilla_Diferencia
        // Objeto permanente para acceso a DO_Apu_Proyecto_Cuadrilla_Diferencia
        private DO_Apu_Proyecto_Cuadrilla_Diferencia _Apu_Proyecto_Cuadrilla_Diferencia;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Proyecto_Cuadrilla_Diferencia
        /// </summary>
        public DO_Apu_Proyecto_Cuadrilla_Diferencia Apu_Proyecto_Cuadrilla_Diferencia
        {
            get
            {
                if (_Apu_Proyecto_Cuadrilla_Diferencia == null)
                    _Apu_Proyecto_Cuadrilla_Diferencia = new DO_Apu_Proyecto_Cuadrilla_Diferencia();
                return _Apu_Proyecto_Cuadrilla_Diferencia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Proyecto_Cuadrilla_Diferencia> Apu_Proyecto_Cuadrilla_Diferencia_Get(Scope s)
        {
            return Apu_Proyecto_Cuadrilla_Diferencia.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Proyecto_Cuadrilla_Diferencia
        /// </summary>
        /// <returns>Todos los registros de Apu_Proyecto_Cuadrilla_Diferencia </returns>

        [WebMethod]
        public List<Apu_Proyecto_Cuadrilla_Diferencia> Apu_Proyecto_Cuadrilla_Diferencia_GetByProyecto(Scope s, string apu_proyecto_id)
        {
            return Apu_Proyecto_Cuadrilla_Diferencia.GetByProyecto(s, apu_proyecto_id);
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Categoria
        // Objeto permanente para acceso a DO_Apu_Oferta_Categoria
        private DO_Apu_Oferta_Categoria _Apu_Oferta_Categoria;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Categoria
        /// </summary>
        public DO_Apu_Oferta_Categoria Apu_Oferta_Categoria
        {
            get
            {
                if (_Apu_Oferta_Categoria == null)
                    _Apu_Oferta_Categoria = new DO_Apu_Oferta_Categoria();
                return _Apu_Oferta_Categoria;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Categoria> Apu_Oferta_Categoria_Get(Scope s)
        {
            return Apu_Oferta_Categoria.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Categoria
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Categoria </returns>

        [WebMethod]
        public List<Apu_Oferta_Categoria> Apu_Oferta_Categoria_GetByCodigo(Scope s, string Codigo)
        {
            return Apu_Oferta_Categoria.GetByCodigo(s, Codigo);
        }
        [WebMethod]
        public List<Apu_Oferta_Categoria> Apu_Oferta_Categoria_GetById(Scope s, string Id)
        {
            return Apu_Oferta_Categoria.GetById(s, Id);
        }
        [WebMethod]
        public List<Apu_Oferta_Categoria> Apu_Oferta_Categoria_GetByOferta(Scope s, string apu_oferta_Id)
        {
            return Apu_Oferta_Categoria.GetByOferta(s, apu_oferta_Id);
        }
        #endregion
        #region  Operaciones con datos de la tabla Apu_Oferta_Categoria
        /// <summary>
        /// Borra el objeto de Apu_Oferta_Categoria
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Oferta_Categoria_Delete(Scope s, Apu_Oferta_Categoria o)
        {
            try
            {
                return Apu_Oferta_Categoria.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Oferta_Categoria
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Oferta_Categoria_Insert(Scope s, Apu_Oferta_Categoria o)
        {
            try
            {
                return Apu_Oferta_Categoria.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Oferta_Categoria
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Oferta_Categoria_Update(Scope s, Apu_Oferta_Categoria o, Apu_Oferta_Categoria original)
        {
            try
            {
                return Apu_Oferta_Categoria.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Oferta_Cuadrilla_Diferencia
        // Objeto permanente para acceso a DO_Apu_Oferta_Cuadrilla_Diferencia
        private DO_Apu_Oferta_Cuadrilla_Diferencia _Apu_Oferta_Cuadrilla_Diferencia;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Oferta_Cuadrilla_Diferencia
        /// </summary>
        public DO_Apu_Oferta_Cuadrilla_Diferencia Apu_Oferta_Cuadrilla_Diferencia
        {
            get
            {
                if (_Apu_Oferta_Cuadrilla_Diferencia == null)
                    _Apu_Oferta_Cuadrilla_Diferencia = new DO_Apu_Oferta_Cuadrilla_Diferencia();
                return _Apu_Oferta_Cuadrilla_Diferencia;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Oferta_Cuadrilla_Diferencia> Apu_Oferta_Cuadrilla_Diferencia_Get(Scope s)
        {
            return Apu_Oferta_Cuadrilla_Diferencia.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Oferta_Cuadrilla_Diferencia
        /// </summary>
        /// <returns>Todos los registros de Apu_Oferta_Cuadrilla_Diferencia </returns>

        [WebMethod]
        public List<Apu_Oferta_Cuadrilla_Diferencia> Apu_Oferta_Cuadrilla_Diferencia_GetByOferta(Scope s, string Apu_Oferta_Id)
        {
            return Apu_Oferta_Cuadrilla_Diferencia.GetByOferta(s, Apu_Oferta_Id);
        }
        #endregion
    
        #endregion

        #region Servicios para Apu_Presupuesto_Rubro_Insumo
        // Objeto permanente para acceso a DO_Apu_Presupuesto_Rubro_Insumo
        private DO_Apu_Presupuesto_Rubro_Insumo _Apu_Presupuesto_Rubro_Insumo;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        public DO_Apu_Presupuesto_Rubro_Insumo Apu_Presupuesto_Rubro_Insumo
        {
            get
            {
                if (_Apu_Presupuesto_Rubro_Insumo == null)
                    _Apu_Presupuesto_Rubro_Insumo = new DO_Apu_Presupuesto_Rubro_Insumo();
                return _Apu_Presupuesto_Rubro_Insumo;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto_Rubro_Insumo> Apu_Presupuesto_Rubro_Insumo_Get(Scope s)
        {
            return Apu_Presupuesto_Rubro_Insumo.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto_Rubro_Insumo </returns>
        
        [WebMethod]
        public List<Apu_Presupuesto_Rubro_Insumo> Apu_Presupuesto_Rubro_Insumo_GetByOrigen(Scope s, string apu_origen_Id)
        {
            return Apu_Presupuesto_Rubro_Insumo.GetByOrigen(s, apu_origen_Id);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto_Rubro_Insumo
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Rubro_Insumo_Delete(Scope s, Apu_Presupuesto_Rubro_Insumo o)
        {
            try
            {
                return Apu_Presupuesto_Rubro_Insumo.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Rubro_Insumo_Insert(Scope s, Apu_Presupuesto_Rubro_Insumo o)
        {
            try
            {
                return Apu_Presupuesto_Rubro_Insumo.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto_Rubro_Insumo
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Rubro_Insumo_Update(Scope s, Apu_Presupuesto_Rubro_Insumo o, Apu_Presupuesto_Rubro_Insumo original)
        {
            try
            {
                return Apu_Presupuesto_Rubro_Insumo.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Presupuesto_Indice
        // Objeto permanente para acceso a DO_Apu_Presupuesto_Indice
        private DO_Apu_Presupuesto_Indice _Apu_Presupuesto_Indice;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto_Indice
        /// </summary>
        public DO_Apu_Presupuesto_Indice Apu_Presupuesto_Indice
        {
            get
            {
                if (_Apu_Presupuesto_Indice == null)
                    _Apu_Presupuesto_Indice = new DO_Apu_Presupuesto_Indice();
                return _Apu_Presupuesto_Indice;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto_Indice> Apu_Presupuesto_Indice_Get(Scope s)
        {
            return Apu_Presupuesto_Indice.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto_Indice
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto_Indice </returns>
        
        [WebMethod]
        public List<Apu_Presupuesto_Indice> Apu_Presupuesto_Indice_GetByOrigen(Scope s, string apu_origen_Id)
        {
            return Apu_Presupuesto_Indice.GetByOrigen(s, apu_origen_Id);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto_Indice
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto_Indice
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Indice_Delete(Scope s, Apu_Presupuesto_Indice o)
        {
            try
            {
                return Apu_Presupuesto_Indice.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Indice
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Indice_Insert(Scope s, Apu_Presupuesto_Indice o)
        {
            try
            {
                return Apu_Presupuesto_Indice.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto_Indice
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Indice_Update(Scope s, Apu_Presupuesto_Indice o, Apu_Presupuesto_Indice original)
        {
            try
            {
                return Apu_Presupuesto_Indice.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Presupuesto
        // Objeto permanente para acceso a DO_Apu_Presupuesto
        private DO_Apu_Presupuesto _Apu_Presupuesto;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto
        /// </summary>
        public DO_Apu_Presupuesto Apu_Presupuesto
        {
            get
            {
                if (_Apu_Presupuesto == null)
                    _Apu_Presupuesto = new DO_Apu_Presupuesto();
                return _Apu_Presupuesto;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto> Apu_Presupuesto_Get(Scope s)
        {
            return Apu_Presupuesto.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto </returns>

        [WebMethod]
        public List<Apu_Presupuesto> Apu_Presupuesto_GetById(Scope s, string Id, string Estado)
        {
            return Apu_Presupuesto.GetById(s, Id,Estado);
        }
        [WebMethod]
        public List<Apu_Presupuesto> Apu_Presupuesto_GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            return Apu_Presupuesto.GetByOrigen(s, Apu_Origen_Id);
        }
        [WebMethod]
        public List<Apu_Presupuesto> Apu_Presupuesto_GetByTipoOrigen(Scope s, string Apu_Tipo_Origen)
        {
            return Apu_Presupuesto.GetByTipoOrigen(s, Apu_Tipo_Origen);
        }

        [WebMethod]
        public List<Apu_Presupuesto> Apu_Presupuesto_GetBySucursal(Scope s)
        {
            return Apu_Presupuesto.GetBySucursal(s);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Delete(Scope s, Apu_Presupuesto o)
        {
            try
            {
                return Apu_Presupuesto.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Insert(Scope s, Apu_Presupuesto o)
        {
            try
            {
                return Apu_Presupuesto.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Update(Scope s, Apu_Presupuesto o, Apu_Presupuesto original)
        {
            try
            {
                return Apu_Presupuesto.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Presupuesto_Rubro
        // Objeto permanente para acceso a DO_Apu_Presupuesto_Rubro
        private DO_Apu_Presupuesto_Rubro _Apu_Presupuesto_Rubro;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto_Rubro
        /// </summary>
        public DO_Apu_Presupuesto_Rubro Apu_Presupuesto_Rubro
        {
            get
            {
                if (_Apu_Presupuesto_Rubro == null)
                    _Apu_Presupuesto_Rubro = new DO_Apu_Presupuesto_Rubro();
                return _Apu_Presupuesto_Rubro;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto_Rubro> Apu_Presupuesto_Rubro_Get(Scope s)
        {
            return Apu_Presupuesto_Rubro.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto_Rubro
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto_Rubro </returns>
    

        [WebMethod]
        public List<Apu_Presupuesto_Rubro> Apu_Presupuesto_Rubro_GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            return Apu_Presupuesto_Rubro.GetByOrigen(s, Apu_Origen_Id);
        }
        [WebMethod]
        public List<Apu_Presupuesto_Rubro> Apu_Presupuesto_Rubro_GetByPresupuesto(Scope s, string Apu_Presupuesto_Id, string Estado)
        {
            return Apu_Presupuesto_Rubro.GetByPresupuesto(s, Apu_Presupuesto_Id,Estado);
        }

        [WebMethod]
        public List<Apu_Presupuesto_Rubro> Apu_Presupuesto_Rubro_GetByPresupuestoPF(Scope s, string Apu_Presupuesto_Id,string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            return Apu_Presupuesto_Rubro.GetByPresupuestoPF(s,Apu_Presupuesto_Id, Estado,Apu_Rubro_Codigo,Apu_Rubro_Nombre,Apu_Rubro_Cantidad_Desde,Apu_Rubro_Cantidad_Hasta);
        }

        [WebMethod]
        public List<Apu_Presupuesto_Rubro> Apu_Presupuesto_Rubro_GetByLikePresupuestoPlanilla(Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre,string Estado, string Fis_Planilla_Id)
        {
            return Apu_Presupuesto_Rubro.GetByLikePresupuestoPlanilla(s, Apu_Presupuesto_Id, Apu_Rubro_Nombre,Estado,Fis_Planilla_Id);
        }
 
        #region Procedimientos Select UNI  denominado TotalPaginas
        [WebMethod]
        public int Apu_Presupuesto_Rubro_TotalPaginas(Scope s, string Apu_Presupuesto_Id,string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
        return Apu_Presupuesto_Rubro.TotalPaginas(s, Apu_Presupuesto_Id,Estado, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Cantidad_Desde, Apu_Rubro_Cantidad_Hasta);
        }
        #endregion


        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto_Rubro
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Rubro_Delete(Scope s, Apu_Presupuesto_Rubro o)
        {
            try
            {
                return Apu_Presupuesto_Rubro.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Rubro_Insert(Scope s, Apu_Presupuesto_Rubro o)
        {
            try
            {
                return Apu_Presupuesto_Rubro.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Rubro_Update(Scope s, Apu_Presupuesto_Rubro o, Apu_Presupuesto_Rubro original)
        {
            try
            {
                return Apu_Presupuesto_Rubro.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Presupuesto_Formula
        // Objeto permanente para acceso a DO_Apu_Presupuesto_Formula
        private DO_Apu_Presupuesto_Formula _Apu_Presupuesto_Formula;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto_Formula
        /// </summary>
        public DO_Apu_Presupuesto_Formula Apu_Presupuesto_Formula
        {
            get
            {
                if (_Apu_Presupuesto_Formula == null)
                    _Apu_Presupuesto_Formula = new DO_Apu_Presupuesto_Formula();
                return _Apu_Presupuesto_Formula;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto_Formula> Apu_Presupuesto_Formula_Get(Scope s)
        {
            return Apu_Presupuesto_Formula.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto_Formula
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto_Formula </returns>

        [WebMethod]
        public List<Apu_Presupuesto_Formula> Apu_Presupuesto_Formula_GetByIndice(Scope s, string Apu_Indice_Id)
        {
            return Apu_Presupuesto_Formula.GetByIndice(s, Apu_Indice_Id);
        }
        [WebMethod]
        public List<Apu_Presupuesto_Formula> Apu_Presupuesto_Formula_GetByPresupuesto(Scope s, string Apu_Presupuesto_Id, string Estado)
        {
            return Apu_Presupuesto_Formula.GetByPresupuesto(s, Apu_Presupuesto_Id,Estado);
        }

        [WebMethod]
        public List<Apu_Presupuesto_Formula> Apu_Presupuesto_Formula_GetByPlanilla(Scope s,string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
        {
            return Apu_Presupuesto_Formula.GetByPlanilla(s,Apu_Presupuesto_Id,Fis_Planilla_Id, Estado);
        }
        
        [WebMethod]
        public  Boolean Apu_Presupuesto_Formula_Obtener_Publicacion(Scope s, string Apu_Presupuesto_Id, string Estado)
        {
            try
            {
                return DEL.APU.DO_Apu_Presupuesto_Formula.Obtener_Publicacion(s, Apu_Presupuesto_Id, Estado);
            }
            catch (Exception e)
            {
                string[] Parametros = e.Message.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
                throw Error.ConstruirExcepcion(new Exception(e.Message, e), Context.Request.Url.AbsoluteUri);
            }
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto_Formula
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto_Formula
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Formula_Delete(Scope s, Apu_Presupuesto_Formula o)
        {
            try
            {
                return Apu_Presupuesto_Formula.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Formula
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Formula_Insert(Scope s, Apu_Presupuesto_Formula o)
        {
            try
            {
                return Apu_Presupuesto_Formula.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto_Formula
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Formula_Update(Scope s, Apu_Presupuesto_Formula o, Apu_Presupuesto_Formula original)
        {
            try
            {
                return Apu_Presupuesto_Formula.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(new Exception(e.Message,e), Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

        #region Servicios para Apu_Presupuesto_Cuadrilla
        // Objeto permanente para acceso a DO_Apu_Presupuesto_Cuadrilla
        private DO_Apu_Presupuesto_Cuadrilla _Apu_Presupuesto_Cuadrilla;
        /// <summary>
        /// La propiedad para acceso a DO_Apu_Presupuesto_Cuadrilla
        /// </summary>
        public DO_Apu_Presupuesto_Cuadrilla Apu_Presupuesto_Cuadrilla
        {
            get
            {
                if (_Apu_Presupuesto_Cuadrilla == null)
                    _Apu_Presupuesto_Cuadrilla = new DO_Apu_Presupuesto_Cuadrilla();
                return _Apu_Presupuesto_Cuadrilla;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<Apu_Presupuesto_Cuadrilla> Apu_Presupuesto_Cuadrilla_Get(Scope s)
        {
            return Apu_Presupuesto_Cuadrilla.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <returns>Todos los registros de Apu_Presupuesto_Cuadrilla </returns>

        [WebMethod]
        public List<Apu_Presupuesto_Cuadrilla> Apu_Presupuesto_Cuadrilla_GetByPresupuesto(Scope s, string Apu_Presupuesto_Id,string Estado)
        {
            return Apu_Presupuesto_Cuadrilla.GetByPresupuesto(s, Apu_Presupuesto_Id,Estado);
        }

        [WebMethod]
        public List<Apu_Presupuesto_Cuadrilla> Apu_Presupuesto_Cuadrilla_GetByPlanilla(Scope s, string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
        {
            return Apu_Presupuesto_Cuadrilla.GetByPlanilla(s,Apu_Presupuesto_Id,Fis_Planilla_Id, Estado);
        }

        #endregion
        #region  Operaciones con datos de la tabla Apu_Presupuesto_Cuadrilla
        /// <summary>
        /// Borra el objeto de Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public int Apu_Presupuesto_Cuadrilla_Delete(Scope s, Apu_Presupuesto_Cuadrilla o)
        {
            try
            {
                return Apu_Presupuesto_Cuadrilla.Delete(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>
        [WebMethod]
        public string Apu_Presupuesto_Cuadrilla_Insert(Scope s, Apu_Presupuesto_Cuadrilla o)
        {
            try
            {
                return Apu_Presupuesto_Cuadrilla.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Actualiza el módulo en Apu_Presupuesto_Cuadrilla
        /// </summary>
        /// <param name="o">El objeto a actualizar</param>
        /// <returns></returns>
        /// <param name="original"></param>
        [WebMethod]
        public int Apu_Presupuesto_Cuadrilla_Update(Scope s, Apu_Presupuesto_Cuadrilla o, Apu_Presupuesto_Cuadrilla original)
        {
            try
            {
                return Apu_Presupuesto_Cuadrilla.Update(s, o, original);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(new Exception(e.Message, e), Context.Request.Url.AbsoluteUri);
            }
        }
        #endregion
        #endregion

    }
}