
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.INT;
  using BEL;
  using CEL.INT;
using System;
using HER;
  namespace EWS
  {
  /// <summary>
  /// Summary description for WS_INT
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_INT : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
    #region Servicios para Int_Empresa
      // Objeto permanente para acceso a DO_Int_Empresa
      private DO_Int_Empresa _Int_Empresa;
      /// <summary>
      /// La propiedad para acceso a DO_Int_Empresa
      /// </summary>
      public DO_Int_Empresa Int_Empresa
      {
          get
          {
              if (_Int_Empresa == null)
                  _Int_Empresa = new DO_Int_Empresa();
              return _Int_Empresa;
          }
      }

      #region Obtención  de Datos
      [WebMethod]
      public List<Int_Empresa> Int_Empresa_Get(Scope s)
      {
          return Int_Empresa.Get(s);
      }
      /// <summary>
      /// Retorna todos los datos de Int_Empresa
      /// </summary>
      /// <returns>Todos los registros de Int_Empresa </returns>

      [WebMethod]
      public List<Int_Empresa> Int_Empresa_GetByCodigo(Scope s, string Codigo)
      {
          return Int_Empresa.GetByCodigo(s, Codigo);
      }
      [WebMethod]
      public List<Int_Empresa> Int_Empresa_GetById(Scope s, string Id)
      {
          return Int_Empresa.GetById(s, Id);
      }
      [WebMethod]
      public List<Int_Empresa> Int_Empresa_GetByLikeNombre(Scope s, string Nombre)
      {
          return Int_Empresa.GetByLikeNombre(s, Nombre);
      }
      [WebMethod]
      public List<Int_Empresa> Int_Empresa_GetByUsuario(Scope s, string Int_Usuario_Id)
      {
          return Int_Empresa.GetByUsuario(s, Int_Usuario_Id);
      }
      #endregion
      #region  Operaciones con datos de la tabla Int_Empresa
      /// <summary>
      /// Borra el objeto de Int_Empresa
      /// </summary>
      /// <param name="o">El objeto a borrar</param>
      /// <returns></returns>
      [WebMethod]
      public int Int_Empresa_Delete(Scope s, Int_Empresa o)
      {
          try
          {
              return Int_Empresa.Delete(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }

      }
      /// <summary>
      /// Inserta el objeto en Int_Empresa
      /// </summary>
      /// <param name="s"></param>
      /// <param name="o">El objeto a insertar</param>
      /// <returns></returns>
      [WebMethod]
      public string Int_Empresa_Insert(Scope s, Int_Empresa o)
      {
          try
          {
              return Int_Empresa.Insert(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }

      }
      /// <summary>
      /// Actualiza el módulo en Int_Empresa
      /// </summary>
      /// <param name="o">El objeto a actualizar</param>
      /// <returns></returns>
      /// <param name="original"></param>
      [WebMethod]
      public int Int_Empresa_Update(Scope s, Int_Empresa o, Int_Empresa original)
      {
          try
          {
              return Int_Empresa.Update(s, o, original);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }

      }
      #endregion
      #endregion

    #region Servicios para Int_Sucursal
      // Objeto permanente para acceso a DO_Int_Sucursal
      private DO_Int_Sucursal _Int_Sucursal;
      /// <summary>
      /// La propiedad para acceso a DO_Int_Sucursal
      /// </summary>
      public DO_Int_Sucursal Int_Sucursal
      {
          get
          {
              if (_Int_Sucursal == null)
                  _Int_Sucursal = new DO_Int_Sucursal();
              return _Int_Sucursal;
          }
      }

      #region Obtención  de Datos
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_Get(Scope s)
      {
          return Int_Sucursal.Get(s);
      }
      /// <summary>
      /// Retorna todos los datos de Int_Sucursal
      /// </summary>
      /// <returns>Todos los registros de Int_Sucursal </returns>

      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByCodigo(Scope s, string Codigo)
      {
          return Int_Sucursal.GetByCodigo(s, Codigo);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByEmpresa(Scope s, string Int_Empresa_Id)
      {
          return Int_Sucursal.GetByEmpresa(s, Int_Empresa_Id);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByEmpresaUsuario(Scope s, string Int_Empresa_Id, string Int_Usuario_Id)
      {
          return Int_Sucursal.GetByEmpresaUsuario(s,Int_Empresa_Id, Int_Usuario_Id);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetById(Scope s, string Id)
      {
          return Int_Sucursal.GetById(s, Id);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByIdUsuario(Scope s,string Id, string Int_Usuario_Id)
      {
          return Int_Sucursal.GetByIdUsuario(s, Id, Int_Usuario_Id);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByMantenimiento(Scope s, string int_empresa_id)
      {
          return Int_Sucursal.GetByMantenimiento(s, int_empresa_id);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetOnlyPredeterminada(Scope s)
      {
          return Int_Sucursal.GetOnlyPredeterminada(s);
      }
      [WebMethod]
      public List<Int_Sucursal> Int_Sucursal_GetByLikeEmpresa(Scope s, string Int_Empresa_Id)
      {
          return Int_Sucursal.GetByLikeEmpresa(s, Int_Empresa_Id);
      }
      #endregion
      #region  Operaciones con datos de la tabla Int_Sucursal
      /// <summary>
      /// Borra el objeto de Int_Sucursal
      /// </summary>
      /// <param name="o">El objeto a borrar</param>
      /// <returns></returns>
      [WebMethod]
      public int Int_Sucursal_Delete(Scope s, Int_Sucursal o)
      {
          try
          {
              return Int_Sucursal.Delete(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }           
      }
      /// <summary>
      /// Inserta el objeto en Int_Sucursal
      /// </summary>
      /// <param name="s"></param>
      /// <param name="o">El objeto a insertar</param>
      /// <returns></returns>
      [WebMethod]
      public string Int_Sucursal_Insert(Scope s, Int_Sucursal o)
      {
          try
          {
              return Int_Sucursal.Insert(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }          
      }
      /// <summary>
      /// Actualiza el módulo en Int_Sucursal
      /// </summary>
      /// <param name="o">El objeto a actualizar</param>
      /// <returns></returns>
      /// <param name="original"></param>
      [WebMethod]
      public int Int_Sucursal_Update(Scope s, Int_Sucursal o, Int_Sucursal original)
      {
          try
          {
              return Int_Sucursal.Update(s, o, original);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }            
      }
      #endregion
      #endregion
    
    #region Servicios para Int_Usuario
    // Objeto permanente para acceso a DO_Int_Usuario
    private DO_Int_Usuario _Int_Usuario ;
    /// <summary>
    /// La propiedad para acceso a DO_Int_Usuario
    /// </summary>
    public DO_Int_Usuario Int_Usuario
    {
    get
    {
    if(_Int_Usuario == null)
    _Int_Usuario = new DO_Int_Usuario ();
    return _Int_Usuario ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Int_Usuario> Int_Usuario_Get(Scope s)
    {
     return Int_Usuario.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Int_Usuario
    /// </summary>
    /// <returns>Todos los registros de Int_Usuario </returns>
    
    [WebMethod]
    public List< Int_Usuario> Int_Usuario_GetByCodigo ( Scope s, string Codigo)
    {
    return Int_Usuario.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Int_Usuario> Int_Usuario_GetById ( Scope s, string Id)
    {
    return Int_Usuario.GetById(s, Id );
    }
    [WebMethod]
    public List< Int_Usuario> Int_Usuario_GetByNombre ( Scope s, string Nombre)
    {
    return Int_Usuario.GetByNombre(s, Nombre );
    }
    [WebMethod]
      public List<Int_Usuario> Int_Usuario_GetByNombrePassword(Scope s, string Nombre, string Password)
    {
    return Int_Usuario.GetByNombrePassword(s, Nombre, Password );
    }
    [WebMethod]
    public List< Int_Usuario> Int_Usuario_GetByNombrePasswordSalt ( Scope s,string Nombre,string Password, string Salt)
    {
    return Int_Usuario.GetByNombrePasswordSalt(s, Nombre, Password, Salt );
    }
    [WebMethod]
    public List<Int_Usuario> Int_Usuario_GetByPersonal(Scope s)
    {
      return Int_Usuario.GetByPersonal(s);
    }
    #endregion
    #region  Operaciones con datos de la tabla Int_Usuario
    /// <summary>
    /// Borra el objeto de Int_Usuario
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Int_Usuario_Delete(Scope s, Int_Usuario o)
    {    
        try
        {
            return Int_Usuario.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    }
    /// <summary>
    /// Inserta el objeto en Int_Usuario
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Int_Usuario_Insert(Scope s, Int_Usuario o)
    {    
        try
        {
            return Int_Usuario.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    }
    /// <summary>
    /// Actualiza el módulo en Int_Usuario
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Int_Usuario_Update (Scope s, Int_Usuario o, Int_Usuario original)
    {
        try
        {
            return Int_Usuario.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }
    
    }
    #endregion
    #endregion
    
    #region Servicios para Int_Moneda
    // Objeto permanente para acceso a DO_Int_Moneda
    private DO_Int_Moneda _Int_Moneda ;
    /// <summary>
    /// La propiedad para acceso a DO_Int_Moneda
    /// </summary>
    public DO_Int_Moneda Int_Moneda
    {
    get
    {
    if(_Int_Moneda == null)
    _Int_Moneda = new DO_Int_Moneda ();
    return _Int_Moneda ;
    }
    }
    
    #region Obtención  de Datos
    [WebMethod]
    public List<Int_Moneda> Int_Moneda_Get(Scope s)
    {
     return Int_Moneda.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Int_Moneda
    /// </summary>
    /// <returns>Todos los registros de Int_Moneda </returns>
    
    [WebMethod]
    public List< Int_Moneda> Int_Moneda_GetByCodigo ( Scope s, string Codigo)
    {
    return Int_Moneda.GetByCodigo(s, Codigo );
    }
    [WebMethod]
    public List< Int_Moneda> Int_Moneda_GetById ( Scope s, string Id)
    {
    return Int_Moneda.GetById(s, Id );
    }
      [WebMethod]
      public List<Int_Moneda> Int_Moneda_GetByLikeNombre(Scope s, string Nombre)
      {
          return Int_Moneda.GetByLikeNombre(s, Nombre);
      }
    #endregion
    #region  Operaciones con datos de la tabla Int_Moneda
    /// <summary>
    /// Borra el objeto de Int_Moneda
    /// </summary>
    /// <param name="o">El objeto a borrar</param>
    /// <returns></returns>
    [WebMethod]
    public int Int_Moneda_Delete(Scope s, Int_Moneda o)
    {
        try
        {
            return Int_Moneda.Delete(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    /// <summary>
    /// Inserta el objeto en Int_Moneda
    /// </summary>
    /// <param name="s"></param>
    /// <param name="o">El objeto a insertar</param>
    /// <returns></returns>
    [WebMethod]
    public string Int_Moneda_Insert(Scope s, Int_Moneda o)
    {
        try
        {
            return Int_Moneda.Insert(s, o);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }    
    }
    /// <summary>
    /// Actualiza el módulo en Int_Moneda
    /// </summary>
    /// <param name="o">El objeto a actualizar</param>
    /// <returns></returns>
    /// <param name="original"></param>
    [WebMethod]
    public int Int_Moneda_Update (Scope s, Int_Moneda o, Int_Moneda original)
    {
        try
        {
            return Int_Moneda.Update(s, o, original);
        }
        catch (Exception e)
        {
            throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
        }     
    }
    #endregion
    #endregion

    #region Servicios para Int_Subproyecto
    // Objeto permanente para acceso a DO_Int_Subproyecto
    private DO_Int_Subproyecto _Int_Subproyecto;
    /// <summary>
    /// La propiedad para acceso a DO_Int_Subproyecto
    /// </summary>
    public DO_Int_Subproyecto Int_Subproyecto
    {
        get
        {
            if (_Int_Subproyecto == null)
                _Int_Subproyecto = new DO_Int_Subproyecto();
            return _Int_Subproyecto;
        }
    }

    #region Obtención  de Datos
    [WebMethod]
    public List<Int_Subproyecto> Int_Subproyecto_Get(Scope s)
    {
        return Int_Subproyecto.Get(s);
    }
    /// <summary>
    /// Retorna todos los datos de Int_Subproyecto
    /// </summary>
    /// <returns>Todos los registros de Int_Subproyecto </returns>

    [WebMethod]
    public List<Int_Subproyecto> Int_Subproyecto_GetByLikeCodigoInstitucional(Scope s, string Codigo_Institucional)
    {
        return Int_Subproyecto.GetByLikeCodigoInstitucional(s,Codigo_Institucional);
    }
    #endregion
    
    #endregion
    
    }
  }
  
