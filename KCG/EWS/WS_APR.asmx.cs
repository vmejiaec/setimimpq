
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.APR;
  using BEL;
  using CEL.APR;
using System;
using HER;
  namespace EWS
  {
  /// <summary>
  /// Summary description for WS_APR
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_APR : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
    #region Servicios para Apr_Estado
    // Objeto permanente para acceso a DO_Apr_Estado
    private DO_Apr_Estado _Apr_Estado ;
    /// <summary>
    /// La propiedad para acceso a DO_Apr_Estado
    /// </summary>
    public DO_Apr_Estado Apr_Estado
    {
    get
    {
    if(_Apr_Estado == null)
    _Apr_Estado = new DO_Apr_Estado ();
    return _Apr_Estado ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Apr_Estado> Apr_Estado_Get(Scope s)
    {
     return Apr_Estado.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Apr_Estado
    /// </summary>
    /// <returns>Todos los registros de Apr_Estado </returns>
    
    [WebMethod]
    public List< Apr_Estado> Apr_Estado_GetByCodigo ( Scope s, string Codigo)
    {
    return Apr_Estado.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Apr_Estado> Apr_Estado_GetById ( Scope s, string Id)
    {
    return Apr_Estado.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Apr_Estado
    /// <summary>
    /// Borra el objeto de Apr_Estado
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Apr_Estado_Delete(Scope s, Apr_Estado o)
    {
        try
        {
            return Apr_Estado.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }    
    }
    /// <summary>
    /// Inserta el objeto en Apr_Estado
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Apr_Estado_Insert(Scope s, Apr_Estado o)
    {
        try
        {
            return Apr_Estado.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Actualiza el módulo en Apr_Estado
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Apr_Estado_Update (Scope s, Apr_Estado o, Apr_Estado original)
    {
        try
        {
            return Apr_Estado.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    #endregion
    #endregion
    
    #region Servicios para Apr_Doc_Estado
    // Objeto permanente para acceso a DO_Apr_Doc_Estado
    private DO_Apr_Doc_Estado _Apr_Doc_Estado ;
    /// <summary>
    /// La propiedad para acceso a DO_Apr_Doc_Estado
    /// </summary>
    public DO_Apr_Doc_Estado Apr_Doc_Estado
    {
    get
    {
    if(_Apr_Doc_Estado == null)
    _Apr_Doc_Estado = new DO_Apr_Doc_Estado ();
    return _Apr_Doc_Estado ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Apr_Doc_Estado> Apr_Doc_Estado_Get(Scope s)
    {
     return Apr_Doc_Estado.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Apr_Doc_Estado
    /// </summary>
    /// <returns>Todos los registros de Apr_Doc_Estado </returns>
    
    [WebMethod]
    public List< Apr_Doc_Estado> Apr_Doc_Estado_GetByCodigo ( Scope s, string Codigo)
    {
    return Apr_Doc_Estado.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Apr_Doc_Estado> Apr_Doc_Estado_GetById ( Scope s, string Id)
    {
    return Apr_Doc_Estado.GetById(s, Id );
    }
    [WebMethod]
    public List< Apr_Doc_Estado> Apr_Doc_Estado_GetByMantenimiento ( Scope s, string ver_version_id)
    {
    return Apr_Doc_Estado.GetByMantenimiento(s, ver_version_id );
    }

    [WebMethod]
    public List<Apr_Doc_Estado> Apr_Doc_Estado_GetByObjetoCampo(Scope s,string Objeto_Nombre,  string Campo_Nombre)
    {
          return Apr_Doc_Estado.GetByObjetoCampo(s,Objeto_Nombre,  Campo_Nombre);
    }

    #endregion
    #region  Operaciones con datos de la tabla Apr_Doc_Estado
    /// <summary>
    /// Borra el objeto de Apr_Doc_Estado
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Apr_Doc_Estado_Delete(Scope s, Apr_Doc_Estado o)
    {
        try
        {
            return Apr_Doc_Estado.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Inserta el objeto en Apr_Doc_Estado
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Apr_Doc_Estado_Insert(Scope s, Apr_Doc_Estado o)
    {
        try
        {
            return Apr_Doc_Estado.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }  
    
    }
    /// <summary>
    /// Actualiza el módulo en Apr_Doc_Estado
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Apr_Doc_Estado_Update (Scope s, Apr_Doc_Estado o, Apr_Doc_Estado original)
    {
        try
        {
            return Apr_Doc_Estado.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    #endregion
    #endregion
    
    #region Servicios para Apr_Documento
    // Objeto permanente para acceso a DO_Apr_Documento
    private DO_Apr_Documento _Apr_Documento ;
    /// <summary>
    /// La propiedad para acceso a DO_Apr_Documento
    /// </summary>
    public DO_Apr_Documento Apr_Documento
    {
    get
    {
    if(_Apr_Documento == null)
    _Apr_Documento = new DO_Apr_Documento ();
    return _Apr_Documento ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Apr_Documento> Apr_Documento_Get(Scope s)
    {
     return Apr_Documento.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Apr_Documento
    /// </summary>
    /// <returns>Todos los registros de Apr_Documento </returns>
    
    [WebMethod]
    public List< Apr_Documento> Apr_Documento_GetByCodigo ( Scope s, string Codigo)
    {
    return Apr_Documento.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Apr_Documento> Apr_Documento_GetById ( Scope s, string Id)
    {
    return Apr_Documento.GetById(s, Id );
    }
    [WebMethod]
    public List< Apr_Documento> Apr_Documento_GetByMantenimiento ( Scope s, string ver_version_id)
    {
    return Apr_Documento.GetByMantenimiento(s, ver_version_id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Apr_Documento
    /// <summary>
    /// Borra el objeto de Apr_Documento
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Apr_Documento_Delete(Scope s, Apr_Documento o)
    {
        try
        {
            return Apr_Documento.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Inserta el objeto en Apr_Documento
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Apr_Documento_Insert(Scope s, Apr_Documento o)
    {
        try
        {
            return Apr_Documento.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Actualiza el módulo en Apr_Documento
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Apr_Documento_Update (Scope s, Apr_Documento o, Apr_Documento original)
    {
        try
        {
            return Apr_Documento.Update(s, o, original);
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
  
