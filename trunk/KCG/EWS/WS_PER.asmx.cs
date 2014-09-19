
  using System;
  using System.Collections.Generic;
  using System.ComponentModel;
  using System.Web.Services;
  using AEL.PER;
  using BEL;
  using CEL.PER;
  using HER;

namespace EWS
  {
  /// <summary>
  /// Summary description for WS_PER
  /// </summary>
  [WebService(Namespace = "http://koala.org/")]
  [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
  [ToolboxItem(false)]
  public class WS_PER : WebService
  {
   // Posible problema con static y nuevas consultas a la base
   // se debería optimizar la llamada a los objeto DO, 
  // para que esté creado desde el momento de la llamada
   // o
  // que problema existe en concurrencia??
      #region Servicios para Per_Personal
      // Objeto permanente para acceso a DO_Per_Personal
      private DO_Per_Personal _Per_Personal;
      /// <summary>
      /// La propiedad para acceso a DO_Per_Personal
      /// </summary>
      public DO_Per_Personal Per_Personal
      {
          get
          {
              if (_Per_Personal == null)
                  _Per_Personal = new DO_Per_Personal();
              return _Per_Personal;
          }
      }

      #region Obtención  de Datos
      [WebMethod]
      public List<Per_Personal> Per_Personal_Get(Scope s)
      {
          return Per_Personal.Get(s);
      }
      /// <summary>
      /// Retorna todos los datos de Per_Personal
      /// </summary>
      /// <returns>Todos los registros de Per_Personal </returns>

      [WebMethod]
      public List<Per_Personal> Per_Personal_GetByCodigo(Scope s, string Codigo)
      {
          return Per_Personal.GetByCodigo(s, Codigo);
      }
      [WebMethod]
      public List<Per_Personal> Per_Personal_GetById(Scope s, string Id)
      {
          return Per_Personal.GetById(s, Id);
      }
      [WebMethod]
      public List<Per_Personal> Per_Personal_GetByJefeCostos(Scope s)
      {
          return Per_Personal.GetByJefeCostos(s);
      }

      [WebMethod]
      public List<Per_Personal> Per_Personal_GetByLikeNombre(Scope s, string Nombre)
      {
          return Per_Personal.GetByLikeNombre(s, Nombre);
      }

      [WebMethod]
      public List<Per_Personal> Per_Personal_GetByLikeFiscalizacion(Scope s, string Nombre)
      {
          return Per_Personal.GetByLikeFiscalizacion(s, Nombre);
      }

      #endregion
      #region  Operaciones con datos de la tabla Per_Personal
      /// <summary>
      /// Borra el objeto de Per_Personal
      /// </summary>
      /// <param name="o">El objeto a borrar</param>
      /// <returns></returns>
      [WebMethod]
      public int Per_Personal_Delete(Scope s, Per_Personal o)
      {
          try
          {
              return Per_Personal.Delete(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }
      }
      /// <summary>
      /// Inserta el objeto en Per_Personal
      /// </summary>
      /// <param name="s"></param>
      /// <param name="o">El objeto a insertar</param>
      /// <returns></returns>
      [WebMethod]
      public string Per_Personal_Insert(Scope s, Per_Personal o)
      {
          try
          {
              return Per_Personal.Insert(s, o);
          }
          catch (Exception e)
          {
              throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
          }
      }
      /// <summary>
      /// Actualiza el módulo en Per_Personal
      /// </summary>
      /// <param name="o">El objeto a actualizar</param>
      /// <returns></returns>
      /// <param name="original"></param>
      [WebMethod]
      public int Per_Personal_Update(Scope s, Per_Personal o, Per_Personal original)
      {
          try
          {
              return Per_Personal.Update(s, o, original);
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
  
