
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.AUD;
  using BEL;
  using CEL.AUD;
using System;
using HER;
  namespace EWS
  {
  /// <summary>
  /// Summary description for WS_AUD
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_AUD : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
    #region Servicios para Aud_Par_Log
    // Objeto permanente para acceso a DO_Aud_Par_Log
    private DO_Aud_Par_Log _Aud_Par_Log ;
    /// <summary>
    /// La propiedad para acceso a DO_Aud_Par_Log
    /// </summary>
    public DO_Aud_Par_Log Aud_Par_Log
    {
    get
    {
    if(_Aud_Par_Log == null)
    _Aud_Par_Log = new DO_Aud_Par_Log ();
    return _Aud_Par_Log ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Aud_Par_Log> Aud_Par_Log_Get(Scope s)
    {
     return Aud_Par_Log.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Aud_Par_Log
    /// </summary>
    /// <returns>Todos los registros de Aud_Par_Log </returns>
    
    [WebMethod]
    public List< Aud_Par_Log> Aud_Par_Log_GetByCodigo ( Scope s, string Codigo)
    {
    return Aud_Par_Log.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Aud_Par_Log> Aud_Par_Log_GetByEmpresa ( Scope s, string int_empresa_Id)
    {
    return Aud_Par_Log.GetByEmpresa(s, int_empresa_Id );
    }
    [WebMethod]
    public List< Aud_Par_Log> Aud_Par_Log_GetById ( Scope s, string Id)
    {
    return Aud_Par_Log.GetById(s, Id );
    }
    [WebMethod]
      public List<Aud_Par_Log> Aud_Par_Log_GetBySucursalContenedor(Scope s, string Int_Sucursal_Id, string Dic_Contenedor_Id)
    {
    return Aud_Par_Log.GetBySucursalContenedor(s, Int_Sucursal_Id, Dic_Contenedor_Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Aud_Par_Log
    /// <summary>
    /// Borra el objeto de Aud_Par_Log
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Aud_Par_Log_Delete(Scope s, Aud_Par_Log o)
    {
        try
        {
            return Aud_Par_Log.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Inserta el objeto en Aud_Par_Log
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Aud_Par_Log_Insert(Scope s, Aud_Par_Log o)
    {
        try
        {
            return Aud_Par_Log.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }    
    }
    /// <summary>
    /// Actualiza el módulo en Aud_Par_Log
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Aud_Par_Log_Update (Scope s, Aud_Par_Log o, Aud_Par_Log original)
    {
        try
        {
            return Aud_Par_Log.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    #endregion
    #endregion
    
    #region Servicios para Aud_Log
    // Objeto permanente para acceso a DO_Aud_Log
    private DO_Aud_Log _Aud_Log ;
    /// <summary>
    /// La propiedad para acceso a DO_Aud_Log
    /// </summary>
    public DO_Aud_Log Aud_Log
    {
    get
    {
    if(_Aud_Log == null)
    _Aud_Log = new DO_Aud_Log ();
    return _Aud_Log ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Aud_Log> Aud_Log_Get(Scope s)
    {
     return Aud_Log.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Aud_Log
    /// </summary>
    /// <returns>Todos los registros de Aud_Log </returns>
    
    [WebMethod]
    public List< Aud_Log> Aud_Log_GetByCodigo ( Scope s, string Codigo)
    {
    return Aud_Log.GetByCodigo(s, Codigo );
    }
    [WebMethod]
      public List<Aud_Log> Aud_Log_GetByEmpresa(Scope s, string Par_Servidor_Id, string Dic_Objeto_Id, int secuencia, string Int_Empresa_Id)
    {
    return Aud_Log.GetByEmpresa(s,Par_Servidor_Id,Dic_Objeto_Id,secuencia, Int_Empresa_Id );
    }
    [WebMethod]
    public List< Aud_Log> Aud_Log_GetById ( Scope s, string Id)
    {
    return Aud_Log.GetById(s, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Aud_Log
    /// <summary>
    /// Borra el objeto de Aud_Log
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Aud_Log_Delete(Scope s, Aud_Log o)
    {
        try
        {
            return Aud_Log.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Inserta el objeto en Aud_Log
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Aud_Log_Insert(Scope s, Aud_Log o)
    {
        try
        {
            return Aud_Log.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Actualiza el módulo en Aud_Log
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Aud_Log_Update (Scope s, Aud_Log o, Aud_Log original)
    {
        try
        {
            return Aud_Log.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    #endregion
    #endregion
    
    #region Servicios para Aud_Auditoria
    // Objeto permanente para acceso a DO_Aud_Auditoria
    private DO_Aud_Auditoria _Aud_Auditoria ;
    /// <summary>
    /// La propiedad para acceso a DO_Aud_Auditoria
    /// </summary>
    public DO_Aud_Auditoria Aud_Auditoria
    {
    get
    {
    if(_Aud_Auditoria == null)
    _Aud_Auditoria = new DO_Aud_Auditoria ();
    return _Aud_Auditoria ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Aud_Auditoria> Aud_Auditoria_Get(Scope s,string Id_Inicial,string Id_Final)
    {
     return Aud_Auditoria.Get(s,Id_Inicial,Id_Final);
    }
    /// <summary>
    /// Retorna todos los datos de Aud_Auditoria
    /// </summary>
    /// <returns>Todos los registros de Aud_Auditoria </returns>
    
    [WebMethod]
    public List< Aud_Auditoria> Aud_Auditoria_GetByCodigo ( Scope s,string Id_Inicial,string Id_Final, string Codigo)
    {
    return Aud_Auditoria.GetByCodigo(s,Id_Inicial,Id_Final, Codigo );
    }
    [WebMethod]
    public List< Aud_Auditoria> Aud_Auditoria_GetByEmpresa ( Scope s,string Par_Servidor_Id,string  Dic_Objeto_Id,int secuencia, string Int_Empresa_Id)
    {
    return Aud_Auditoria.GetByEmpresa(s, Par_Servidor_Id, Dic_Objeto_Id,secuencia, Int_Empresa_Id );
    }
    [WebMethod]
    public List< Aud_Auditoria> Aud_Auditoria_GetById ( Scope s,string Id_Inicial,string Id_Final, string Id)
    {
    return Aud_Auditoria.GetById(s,Id_Inicial,Id_Final, Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Aud_Auditoria
    /// <summary>
    /// Borra el objeto de Aud_Auditoria
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Aud_Auditoria_Delete(Scope s, Aud_Auditoria o)
    {
        try
        {
            return Aud_Auditoria.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Inserta el objeto en Aud_Auditoria
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Aud_Auditoria_Insert(Scope s, Aud_Auditoria o)
    {
        try
        {
            return Aud_Auditoria.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Actualiza el módulo en Aud_Auditoria
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Aud_Auditoria_Update (Scope s, Aud_Auditoria o, Aud_Auditoria original)
    {
        try
        {
            return Aud_Auditoria.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    #endregion
    #endregion
    
    #region Servicios para Aud_Par_Auditoria
    // Objeto permanente para acceso a DO_Aud_Par_Auditoria
    private DO_Aud_Par_Auditoria _Aud_Par_Auditoria ;
    /// <summary>
    /// La propiedad para acceso a DO_Aud_Par_Auditoria
    /// </summary>
    public DO_Aud_Par_Auditoria Aud_Par_Auditoria
    {
    get
    {
    if(_Aud_Par_Auditoria == null)
    _Aud_Par_Auditoria = new DO_Aud_Par_Auditoria ();
    return _Aud_Par_Auditoria ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Aud_Par_Auditoria> Aud_Par_Auditoria_Get(Scope s)
    {
     return Aud_Par_Auditoria.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Aud_Par_Auditoria
    /// </summary>
    /// <returns>Todos los registros de Aud_Par_Auditoria </returns>
    
    [WebMethod]
    public List< Aud_Par_Auditoria> Aud_Par_Auditoria_GetByCodigo ( Scope s, string Codigo)
    {
    return Aud_Par_Auditoria.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Aud_Par_Auditoria> Aud_Par_Auditoria_GetByEmpresa ( Scope s, string int_empresa_Id)
    {
    return Aud_Par_Auditoria.GetByEmpresa(s, int_empresa_Id );
    }
    [WebMethod]
    public List< Aud_Par_Auditoria> Aud_Par_Auditoria_GetById ( Scope s, string Id)
    {
    return Aud_Par_Auditoria.GetById(s, Id );
    }
    [WebMethod]
      public List<Aud_Par_Auditoria> Aud_Par_Auditoria_GetBySucursalObjeto(Scope s, string Int_Sucursal_Id, string Dic_Objeto_Id)
    {
    return Aud_Par_Auditoria.GetBySucursalObjeto(s,Int_Sucursal_Id, Dic_Objeto_Id );
    }
    #endregion
    #region  Operaciones con datos de la tabla Aud_Par_Auditoria
    /// <summary>
    /// Borra el objeto de Aud_Par_Auditoria
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Aud_Par_Auditoria_Delete(Scope s, Aud_Par_Auditoria o)
    {
        try
        {
            return Aud_Par_Auditoria.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Inserta el objeto en Aud_Par_Auditoria
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Aud_Par_Auditoria_Insert(Scope s, Aud_Par_Auditoria o)
    {
        try
        {
            return Aud_Par_Auditoria.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Actualiza el módulo en Aud_Par_Auditoria
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Aud_Par_Auditoria_Update (Scope s, Aud_Par_Auditoria o, Aud_Par_Auditoria original)
    {
        try
        {
            return Aud_Par_Auditoria.Update(s, o, original);
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
  
