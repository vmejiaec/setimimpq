
  using System;
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.SEG;
  using BEL;
  using CEL.SEG;
  using HER;

namespace EWS
  {
  /// <summary>
  /// Summary description for WS_SEG
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_SEG : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
    #region Servicios para Seg_Rol
    // Objeto permanente para acceso a DO_Seg_Rol
    private DO_Seg_Rol _Seg_Rol ;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol
    /// </summary>
    public DO_Seg_Rol Seg_Rol
    {
    get
    {
    if(_Seg_Rol == null)
    _Seg_Rol = new DO_Seg_Rol ();
    return _Seg_Rol ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol> Seg_Rol_Get(Scope s)
    {
     return Seg_Rol.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol </returns>
    
    [WebMethod]
    public List< Seg_Rol> Seg_Rol_GetByCodigo ( Scope s, string Codigo)
    {
    return Seg_Rol.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Seg_Rol> Seg_Rol_GetById ( Scope s, string Id)
    {
    return Seg_Rol.GetById(s, Id );
    }

      [WebMethod]
      public List<Seg_Rol> Seg_Rol_GetByUsuarioLikeNombre(Scope s, string Nombre)
      {
          return Seg_Rol.GetByUsuarioLikeNombre(s, Nombre);
      }

      [WebMethod]
      public List<Seg_Rol> Seg_Rol_GetByLikeNombre(Scope s, string Nombre)
      {
          return Seg_Rol.GetByLikeNombre(s, Nombre);
      }
    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol
    /// <summary>
    /// Borra el objeto de Seg_Rol
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Delete(Scope s, Seg_Rol o)
    {
    return Seg_Rol.Delete(s,o);
    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Insert(Scope s, Seg_Rol o)
    {
    return Seg_Rol.Insert(s,o);
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Update (Scope s, Seg_Rol o, Seg_Rol original)
    {
    return Seg_Rol.Update(s,o,original);
    }
    #endregion
    #endregion

    #region Servicios para Seg_Rol_Elemento
    // Objeto permanente para acceso a DO_Seg_Rol_Elemento
    private DO_Seg_Rol_Elemento _Seg_Rol_Elemento;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol_Elemento
    /// </summary>
    public DO_Seg_Rol_Elemento Seg_Rol_Elemento
    {
        get
        {
            if (_Seg_Rol_Elemento == null)
                _Seg_Rol_Elemento = new DO_Seg_Rol_Elemento();
            return _Seg_Rol_Elemento;
        }
    }

    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_Get(Scope s)
    {
        return Seg_Rol_Elemento.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol_Elemento
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol_Elemento </returns>

    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_GetByCodigo(Scope s, string Codigo)
    {
        return Seg_Rol_Elemento.GetByCodigo(s, Codigo);
    }
    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_GetById(Scope s, string Id)
    {
        return Seg_Rol_Elemento.GetById(s, Id);
    }
    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_GetByRol(Scope s, string seg_Rol_Id)
    {
        return Seg_Rol_Elemento.GetByRol(s, seg_Rol_Id);
    }
    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_GetByRolLikeEtiqueta(Scope s, string Seg_Rol_Id, string nombre)
    {
        return Seg_Rol_Elemento.GetByRolLikeEtiqueta(s, Seg_Rol_Id, nombre);
    }
    [WebMethod]
    public List<Seg_Rol_Elemento> Seg_Rol_Elemento_GetByLikeNombre(Scope s, string seg_Rol_Id, string Nombre)
    {
        return Seg_Rol_Elemento.GetByLikeNombre(s, seg_Rol_Id, Nombre);
    }
    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol_Elemento
    /// <summary>
    /// Borra el objeto de Seg_Rol_Elemento
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Elemento_Delete(Scope s, Seg_Rol_Elemento o)
    {
        try
        {
            return Seg_Rol_Elemento.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }

    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol_Elemento
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Elemento_Insert(Scope s, Seg_Rol_Elemento o)
    {
        try
        {
            return Seg_Rol_Elemento.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }

    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol_Elemento
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Elemento_Update(Scope s, Seg_Rol_Elemento o, Seg_Rol_Elemento original)
    {
        try
        {
            return Seg_Rol_Elemento.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }

    }
    #endregion
    #endregion
    
    #region Servicios para Seg_Rol_Usuario
    // Objeto permanente para acceso a DO_Seg_Rol_Usuario
    private DO_Seg_Rol_Usuario _Seg_Rol_Usuario ;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol_Usuario
    /// </summary>
    public DO_Seg_Rol_Usuario Seg_Rol_Usuario
    {
    get
    {
    if(_Seg_Rol_Usuario == null)
    _Seg_Rol_Usuario = new DO_Seg_Rol_Usuario ();
    return _Seg_Rol_Usuario ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol_Usuario> Seg_Rol_Usuario_Get(Scope s)
    {
     return Seg_Rol_Usuario.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol_Usuario
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol_Usuario </returns>
    
    [WebMethod]
    public List< Seg_Rol_Usuario> Seg_Rol_Usuario_GetByCodigo ( Scope s, string Codigo)
    {
    return Seg_Rol_Usuario.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Seg_Rol_Usuario> Seg_Rol_Usuario_GetById ( Scope s, string Id)
    {
    return Seg_Rol_Usuario.GetById(s, Id );
    }
      [WebMethod]
      public List<Seg_Rol_Usuario> Seg_Rol_Usuario_GetByRol(Scope s, string Seg_Rol_Id)
      {
          return Seg_Rol_Usuario.GetByRol(s, Seg_Rol_Id);
      }
    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol_Usuario
    /// <summary>
    /// Borra el objeto de Seg_Rol_Usuario
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Usuario_Delete(Scope s, Seg_Rol_Usuario o)
    {
        try
        {
            return DEL.SEG.DO_Seg_Rol_Usuario.Delete(s, o);
            //return Seg_Rol_Usuario.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }    
    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol_Usuario
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Usuario_Insert(Scope s, Seg_Rol_Usuario o)
    {
        try
        {
            return DEL.SEG.DO_Seg_Rol_Usuario.Insert(s, o);
            //return Seg_Rol_Usuario.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol_Usuario
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Usuario_Update (Scope s, Seg_Rol_Usuario o, Seg_Rol_Usuario original)
    {
        try
        {
            return Seg_Rol_Usuario.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }        
    }
    #endregion
    #endregion
    
    #region Servicios para Seg_Rol_Objeto
    // Objeto permanente para acceso a DO_Seg_Rol_Objeto
    private DO_Seg_Rol_Objeto _Seg_Rol_Objeto ;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol_Objeto
    /// </summary>
    public DO_Seg_Rol_Objeto Seg_Rol_Objeto
    {
    get
    {
    if(_Seg_Rol_Objeto == null)
    _Seg_Rol_Objeto = new DO_Seg_Rol_Objeto ();
    return _Seg_Rol_Objeto ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol_Objeto> Seg_Rol_Objeto_Get(Scope s)
    {
     return Seg_Rol_Objeto.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol_Objeto
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol_Objeto </returns>
    
    [WebMethod]
    public List< Seg_Rol_Objeto> Seg_Rol_Objeto_GetDataBy ( Scope s, string Id)
    {
    return Seg_Rol_Objeto.GetDataBy(s, Id );
    }
    [WebMethod]
    public List< Seg_Rol_Objeto> Seg_Rol_Objeto_GetByCodigo ( Scope s, string Codigo)
    {
    return Seg_Rol_Objeto.GetByCodigo(s, Codigo );
    }
    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol_Objeto
    /// <summary>
    /// Borra el objeto de Seg_Rol_Objeto
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Objeto_Delete(Scope s, Seg_Rol_Objeto o)
    {
        try
        {
            return Seg_Rol_Objeto.Delete(s,o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }           
    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol_Objeto
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Objeto_Insert(Scope s, Seg_Rol_Objeto o)
    {
        try
        {
            return Seg_Rol_Objeto.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }       
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol_Objeto
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Objeto_Update (Scope s, Seg_Rol_Objeto o, Seg_Rol_Objeto original)
    {
        try
        {
            return Seg_Rol_Objeto.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }         
    }
    #endregion
    #endregion
    
    #region Servicios para Seg_Rol_Usuario_Det
    // Objeto permanente para acceso a DO_Seg_Rol_Usuario_Det
    private DO_Seg_Rol_Usuario_Det _Seg_Rol_Usuario_Det ;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol_Usuario_Det
    /// </summary>
    public DO_Seg_Rol_Usuario_Det Seg_Rol_Usuario_Det
    {
    get
    {
    if(_Seg_Rol_Usuario_Det == null)
    _Seg_Rol_Usuario_Det = new DO_Seg_Rol_Usuario_Det ();
    return _Seg_Rol_Usuario_Det ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_Get(Scope s)
    {
     return Seg_Rol_Usuario_Det.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol_Usuario_Det
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol_Usuario_Det </returns>
    
    [WebMethod]
    public List< Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_GetByCodigo ( Scope s, string Codigo)
    {
    return Seg_Rol_Usuario_Det.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_GetById ( Scope s, string Id)
    {
    return Seg_Rol_Usuario_Det.GetById(s, Id );
    }
    [WebMethod]
      public List<Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_GetBySucursalUsuario(Scope s, string Int_Sucursal_Id, string Int_Usuario_Id)
    {
    return Seg_Rol_Usuario_Det.GetBySucursalUsuario(s, Int_Sucursal_Id, Int_Usuario_Id );
    }
    [WebMethod]
    public List< Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_GetBySucursalUsuarioRol ( Scope s,string Int_Sucursal_Id,string Int_Usuario_Id, string Seg_Rol_Id)
    {
    return Seg_Rol_Usuario_Det.GetBySucursalUsuarioRol(s, Int_Sucursal_Id, Int_Usuario_Id, Seg_Rol_Id );
    }
      [WebMethod]
      public List<Seg_Rol_Usuario_Det> Seg_Rol_Usuario_Det_GetByRolUsuario(Scope s, string Seg_Rol_Usuario_Id)
      {
          return Seg_Rol_Usuario_Det.GetByRolUsuario(s, Seg_Rol_Usuario_Id);
      }
    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol_Usuario_Det
    /// <summary>
    /// Borra el objeto de Seg_Rol_Usuario_Det
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Usuario_Det_Delete(Scope s, Seg_Rol_Usuario_Det o)
    {
        try
        {
            return DEL.SEG.DO_Seg_Rol_Usuario_Det.Delete(s, o);
            //return Seg_Rol_Usuario_Det.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }      
    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol_Usuario_Det
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Usuario_Det_Insert(Scope s, Seg_Rol_Usuario_Det o)
    {
        try
        {
            return Seg_Rol_Usuario_Det.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }        
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol_Usuario_Det
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Usuario_Det_Update (Scope s, Seg_Rol_Usuario_Det o, Seg_Rol_Usuario_Det original)
    {
        try
        {
            return Seg_Rol_Usuario_Det.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }          
    }
    #endregion
    #endregion

    #region Servicios para Seg_Menu
    // Objeto permanente para acceso a DO_Seg_Menu
    private DO_Seg_Menu _Seg_Menu;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Menu
    /// </summary>
    public DO_Seg_Menu Seg_Menu
    {
        get
        {
            if (_Seg_Menu == null)
                _Seg_Menu = new DO_Seg_Menu();
            return _Seg_Menu;
        }
    }

    #region Obtención  de Datos
    [WebMethod]
      public List<Seg_Menu> Seg_Menu_Get(Scope s, string par_servidor_id)
    {
        return Seg_Menu.Get(s, par_servidor_id);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Menu
    /// </summary>
    /// <returns>Todos los registros de Seg_Menu </returns>

    [WebMethod]
    public List<Seg_Menu> Seg_Menu_GetByCodigo(Scope s,string Codigo, string par_servidor_id)
    {
        return Seg_Menu.GetByCodigo(s,Codigo, par_servidor_id);
    }
    [WebMethod]
    public List<Seg_Menu> Seg_Menu_GetById(Scope s,string Id, string par_servidor_id)
    {
        return Seg_Menu.GetById(s, Id, par_servidor_id);
    }
    [WebMethod]
    public List<Seg_Menu> Seg_Menu_GetByRolUsuario(Scope s, string Seg_Rol_Id,string Int_Usuario_Id, string par_servidor_id)
    {
        return Seg_Menu.GetByRolUsuario(s, Seg_Rol_Id, Int_Usuario_Id, par_servidor_id);
    }

    [WebMethod]
    public List<Seg_Menu> Seg_Menu_GetByRolId(Scope s, string Seg_Rol_Id, string par_servidor_id)
    {
        return Seg_Menu.GetByRolId(s, Seg_Rol_Id, par_servidor_id);
    }

      [WebMethod]
      public List<Seg_Menu> Seg_Menu_GetByRolElemento(Scope s, string Seg_Rol_Id, string Dic_Con_Elemento_Id, string par_servidor_id)
      {
          return Seg_Menu.GetByRolElemento(s, Seg_Rol_Id, Dic_Con_Elemento_Id, par_servidor_id);
      }

    #endregion
    #region  Operaciones con datos de la tabla Seg_Menu
    /// <summary>
    /// Borra el objeto de Seg_Menu
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Menu_Delete(Scope s, Seg_Menu o)
    {
        try
        {
            return Seg_Menu.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    }
    /// <summary>
    /// Inserta el objeto en Seg_Menu
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Menu_Insert(Scope s, Seg_Menu o)
    {
        try
        {
            return Seg_Menu.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Menu
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Menu_Update(Scope s, Seg_Menu o, Seg_Menu original)
    {
        try
        {
            return Seg_Menu.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    }
    #endregion
    #endregion
    
    #region Servicios para Seg_Rol_Menu
    // Objeto permanente para acceso a DO_Seg_Rol_Menu
    private DO_Seg_Rol_Menu _Seg_Rol_Menu ;
    /// <summary>
    /// La propiedad para acceso a DO_Seg_Rol_Menu
    /// </summary>
    public DO_Seg_Rol_Menu Seg_Rol_Menu
    {
    get
    {
    if(_Seg_Rol_Menu == null)
    _Seg_Rol_Menu = new DO_Seg_Rol_Menu ();
    return _Seg_Rol_Menu ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Seg_Rol_Menu> Seg_Rol_Menu_Get(Scope s)
    {
     return Seg_Rol_Menu.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Seg_Rol_Menu
    /// </summary>
    /// <returns>Todos los registros de Seg_Rol_Menu </returns>
    
    [WebMethod]
    public List< Seg_Rol_Menu> Seg_Rol_Menu_GetByCodigo ( Scope s, string Codigo)
    {
    return Seg_Rol_Menu.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Seg_Rol_Menu> Seg_Rol_Menu_GetById ( Scope s, string Id)
    {
    return Seg_Rol_Menu.GetById(s, Id );
    }

      [WebMethod]
      public List<Seg_Rol_Menu> Seg_Rol_Menu_GetByRol(Scope s, string Seg_Rol_Id)
      {
          return Seg_Rol_Menu.GetByRol(s, Seg_Rol_Id);
      }

    #endregion
    #region  Operaciones con datos de la tabla Seg_Rol_Menu
    /// <summary>
    /// Borra el objeto de Seg_Rol_Menu
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Seg_Rol_Menu_Delete(Scope s, Seg_Rol_Menu o)
    {
        try
        {
            return DEL.SEG.DO_Seg_Rol_Menu.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }          
    }
    /// <summary>
    /// Inserta el objeto en Seg_Rol_Menu
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Seg_Rol_Menu_Insert(Scope s, Seg_Rol_Menu o)
    {
        try
        {
            return DEL.SEG.DO_Seg_Rol_Menu.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }         
    }
    /// <summary>
    /// Actualiza el módulo en Seg_Rol_Menu
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Seg_Rol_Menu_Update (Scope s, Seg_Rol_Menu o, Seg_Rol_Menu original)
    {
        try
        {
            return Seg_Rol_Menu.Update(s, o, original);
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
  
