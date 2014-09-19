
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.VER;
  using BEL;
  using CEL.VER;
using System;
using HER;
  namespace EWS
  {
  /// <summary>
  /// Summary description for WS_VER
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_VER : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
    #region Servicios para Ver_Documento
    // Objeto permanente para acceso a DO_Ver_Documento
    private DO_Ver_Documento _Ver_Documento ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Documento
    /// </summary>
    public DO_Ver_Documento Ver_Documento
    {
    get
    {
    if(_Ver_Documento == null)
    _Ver_Documento = new DO_Ver_Documento ();
    return _Ver_Documento ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Documento> Ver_Documento_Get(Scope s)
    {
     return Ver_Documento.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Ver_Documento
    /// </summary>
    /// <returns>Todos los registros de Ver_Documento </returns>
    
    [WebMethod]
    public List< Ver_Documento> Ver_Documento_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Documento.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Documento> Ver_Documento_GetById ( Scope s, string Id)
    {
    return Ver_Documento.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Documento
    /// <summary>
    /// Borra el objeto de Ver_Documento
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Documento_Delete(Scope s, Ver_Documento o)
    {
        try
        {
            return Ver_Documento.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }        
    }
    /// <summary>
    /// Inserta el objeto en Ver_Documento
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Documento_Insert(Scope s, Ver_Documento o)
    {
        try
        {
            return Ver_Documento.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }           
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Documento
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Documento_Update (Scope s, Ver_Documento o, Ver_Documento original)
    {
        try
        {
            return Ver_Documento.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }          
    }
    #endregion
    #endregion
    
    #region Servicios para Ver_Dominio
    // Objeto permanente para acceso a DO_Ver_Dominio
    private DO_Ver_Dominio _Ver_Dominio ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Dominio
    /// </summary>
    public DO_Ver_Dominio Ver_Dominio
    {
    get
    {
    if(_Ver_Dominio == null)
    _Ver_Dominio = new DO_Ver_Dominio ();
    return _Ver_Dominio ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Dominio> Ver_Dominio_Get(Scope s)
    {
     return Ver_Dominio.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Ver_Dominio
    /// </summary>
    /// <returns>Todos los registros de Ver_Dominio </returns>
    
    [WebMethod]
    public List< Ver_Dominio> Ver_Dominio_GetByCampo ( Scope s, string Dic_Campo_Id)
    {
    return Ver_Dominio.GetByCampo(s, Dic_Campo_Id );
    }
    [WebMethod]
    public List< Ver_Dominio> Ver_Dominio_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Dominio.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Dominio> Ver_Dominio_GetById ( Scope s, string Id)
    {
    return Ver_Dominio.GetById(s, Id );
    }
    [WebMethod]
      public List<Ver_Dominio> Ver_Dominio_GetByObjetoCampo(Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
    {
    return Ver_Dominio.GetByObjetoCampo(s, Dic_Objeto_Nombre, Dic_Campo_Nombre );
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Dominio
    /// <summary>
    /// Borra el objeto de Ver_Dominio
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Dominio_Delete(Scope s, Ver_Dominio o)
    {
        try
        {
            return Ver_Dominio.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }         
    }
    /// <summary>
    /// Inserta el objeto en Ver_Dominio
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Dominio_Insert(Scope s, Ver_Dominio o)
    {
        try
        {
            return Ver_Dominio.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Dominio
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Dominio_Update (Scope s, Ver_Dominio o, Ver_Dominio original)
    {
        try
        {
            return Ver_Dominio.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }         
    }
    #endregion
    #endregion
    
    #region Servicios para Ver_Etiqueta
    // Objeto permanente para acceso a DO_Ver_Etiqueta
    private DO_Ver_Etiqueta _Ver_Etiqueta ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Etiqueta
    /// </summary>
    public DO_Ver_Etiqueta Ver_Etiqueta
    {
    get
    {
    if(_Ver_Etiqueta == null)
    _Ver_Etiqueta = new DO_Ver_Etiqueta ();
    return _Ver_Etiqueta ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Etiqueta> Ver_Etiqueta_Get(Scope s)
    {
     return Ver_Etiqueta.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Ver_Etiqueta
    /// </summary>
    /// <returns>Todos los registros de Ver_Etiqueta </returns>
    
    [WebMethod]
    public List< Ver_Etiqueta> Ver_Etiqueta_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Etiqueta.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Etiqueta> Ver_Etiqueta_GetById ( Scope s, string Id)
    {
    return Ver_Etiqueta.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Etiqueta
    /// <summary>
    /// Borra el objeto de Ver_Etiqueta
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Etiqueta_Delete(Scope s, Ver_Etiqueta o)
    {
        try
        {
            return Ver_Etiqueta.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Inserta el objeto en Ver_Etiqueta
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Etiqueta_Insert(Scope s, Ver_Etiqueta o)
    {
        try
        {
            return Ver_Etiqueta.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Etiqueta
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Etiqueta_Update (Scope s, Ver_Etiqueta o, Ver_Etiqueta original)
    {
        try
        {
            return Ver_Etiqueta.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }          
    }
    #endregion
    #endregion
    
    #region Servicios para Ver_Mensaje
    // Objeto permanente para acceso a DO_Ver_Mensaje
    private DO_Ver_Mensaje _Ver_Mensaje ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Mensaje
    /// </summary>
    public DO_Ver_Mensaje Ver_Mensaje
    {
    get
    {
    if(_Ver_Mensaje == null)
    _Ver_Mensaje = new DO_Ver_Mensaje ();
    return _Ver_Mensaje ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Mensaje> Ver_Mensaje_Get(Scope s)
    {
     return Ver_Mensaje.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Ver_Mensaje
    /// </summary>
    /// <returns>Todos los registros de Ver_Mensaje </returns>
    
    [WebMethod]
    public List< Ver_Mensaje> Ver_Mensaje_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Mensaje.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Mensaje> Ver_Mensaje_GetById ( Scope s, string Id)
    {
    return Ver_Mensaje.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Mensaje
    /// <summary>
    /// Borra el objeto de Ver_Mensaje
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Mensaje_Delete(Scope s, Ver_Mensaje o)
    {
        try
        {
            return Ver_Mensaje.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Inserta el objeto en Ver_Mensaje
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Mensaje_Insert(Scope s, Ver_Mensaje o)
    {
        try
        {
            return Ver_Mensaje.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }        
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Mensaje
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Mensaje_Update (Scope s, Ver_Mensaje o, Ver_Mensaje original)
    {
        try
        {
            return Ver_Mensaje.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    #endregion
    #endregion
    
    #region Servicios para Ver_Version
    // Objeto permanente para acceso a DO_Ver_Version
    private DO_Ver_Version _Ver_Version ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Version
    /// </summary>
    public DO_Ver_Version Ver_Version
    {
    get
    {
    if(_Ver_Version == null)
    _Ver_Version = new DO_Ver_Version ();
    return _Ver_Version ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Version> Ver_Version_Get(Scope s)
    {
     return Ver_Version.Get(s);
    }
      [WebMethod]
      public List<Ver_Version> Ver_Version_Test()
      {
          Scope s = new Scope();
          s.Int_Empresa_Id = "1";
          s.Ver_Version_Id = "1";
          s.Int_Sucursal_Id = "1";
          return Ver_Version.Get(s);
      }
    /// <summary>
    /// Retorna todos los datos de Ver_Version
    /// </summary>
    /// <returns>Todos los registros de Ver_Version </returns>
    
    [WebMethod]
    public List< Ver_Version> Ver_Version_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Version.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Version> Ver_Version_GetById ( Scope s, string Id)
    {
    return Ver_Version.GetById(s, Id );
    }
    [WebMethod]
    public List< Ver_Version> Ver_Version_GetByMantenimiento ( Scope s)
    {
    return Ver_Version.GetByMantenimiento(s);
    }
    [WebMethod]
    public List< Ver_Version> Ver_Version_GetByOnlyPredeterminada ( Scope s)
    {
    return Ver_Version.GetByOnlyPredeterminada(s);
    }
    [WebMethod]
    public List< Ver_Version> Ver_Version_GetByPredeterminadaN ( Scope s)
    {
    return Ver_Version.GetByPredeterminadaN(s);
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Version
    /// <summary>
    /// Borra el objeto de Ver_Version
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Version_Delete(Scope s, Ver_Version o)
    {
        try
        {
            return Ver_Version.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }        
    }
    /// <summary>
    /// Inserta el objeto en Ver_Version
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Version_Insert(Scope s, Ver_Version o)
    {
        try
        {
            return Ver_Version.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Version
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Version_Update (Scope s, Ver_Version o, Ver_Version original)
    {
        try
        {
            return Ver_Version.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    #endregion
    #region Procedimientos
      [WebMethod]
      public int Ver_Version_UpdatePredeterminadaN(Scope s)
      {
          return Ver_Version.UpdatePredeterminadaN(s);
      }
      [WebMethod]
      public int Ver_Version_ExisteRegistros(Scope s)
      {
          return Ver_Version.ExisteRegistros(s);
      }
      #endregion

    #endregion
    
    #region Servicios para Ver_Doc_Estado
    // Objeto permanente para acceso a DO_Ver_Doc_Estado
    private DO_Ver_Doc_Estado _Ver_Doc_Estado ;
    /// <summary>
    /// La propiedad para acceso a DO_Ver_Doc_Estado
    /// </summary>
    public DO_Ver_Doc_Estado Ver_Doc_Estado
    {
    get
    {
    if(_Ver_Doc_Estado == null)
    _Ver_Doc_Estado = new DO_Ver_Doc_Estado ();
    return _Ver_Doc_Estado ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Ver_Doc_Estado> Ver_Doc_Estado_Get(Scope s)
    {
     return Ver_Doc_Estado.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Ver_Doc_Estado
    /// </summary>
    /// <returns>Todos los registros de Ver_Doc_Estado </returns>
    
    [WebMethod]
    public List< Ver_Doc_Estado> Ver_Doc_Estado_GetByCampo ( Scope s, string Dic_campo_Id)
    {
    return Ver_Doc_Estado.GetByCampo(s, Dic_campo_Id );
    }
    [WebMethod]
    public List< Ver_Doc_Estado> Ver_Doc_Estado_GetByCodigo ( Scope s, string Codigo)
    {
    return Ver_Doc_Estado.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Ver_Doc_Estado> Ver_Doc_Estado_GetById ( Scope s, string Id)
    {
    return Ver_Doc_Estado.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Ver_Doc_Estado
    /// <summary>
    /// Borra el objeto de Ver_Doc_Estado
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Ver_Doc_Estado_Delete(Scope s, Ver_Doc_Estado o)
    {
        try
        {
            return Ver_Doc_Estado.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Inserta el objeto en Ver_Doc_Estado
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Ver_Doc_Estado_Insert(Scope s, Ver_Doc_Estado o)
    {
        try
        {
            return Ver_Doc_Estado.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Actualiza el módulo en Ver_Doc_Estado
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Ver_Doc_Estado_Update (Scope s, Ver_Doc_Estado o, Ver_Doc_Estado original)
    {
        try
        {
            return Ver_Doc_Estado.Update(s, o, original);
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
  
