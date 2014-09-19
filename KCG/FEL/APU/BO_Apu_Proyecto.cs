
   using System;
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.APU
  {
  /// <summary>
  /// Acceso a los Web Services WS_APU
  /// Modulo: Apu target
  /// Tabla: Apu_Proyecto
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto
  {
  #region  Adapter
  private WS_APU _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_APU Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_APU();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Proyecto> Get(string sortExpression, Scope s)
  {
  List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_Get(s));
  lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Proyecto_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Proyecto> lista = new List<Apu_Proyecto> (Adapter.Apu_Proyecto_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Proyecto> lista = new List<Apu_Proyecto> (Adapter.Apu_Proyecto_GetById(s,  Id));
          lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetById(s,  Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto> GetByIdResumido(string sortExpression, Scope s, string Id)
          {
              List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_GetByIdResumido(s, Id));
              lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByIdResumido(Scope s, string Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByIdResumido(s, Id));
          }

          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Proyecto> GetBySucursal(string sortExpression, Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
          List<Apu_Proyecto> lista = new List<Apu_Proyecto> (Adapter.Apu_Proyecto_GetBySucursal(s,  s.Int_Sucursal_Id, Codigo_Desde,  Codigo_Hasta,  Estado,  Nombre,  Fecha_Creacion_Desde,  Fecha_Creacion_Hasta,  Coordinador_Per_Personal_Nombre,  Tecnico_Per_Personal_Nombre,  Apu_Lugar_Nombre,  Apu_Provincia_Nombre, Apu_Presupuesto_Estado ));
          lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetBySucursal(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetBySucursal(s, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado));
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto> GetByLikeCodigoDesde(string sortExpression, Scope s, string desde_Codigo)
          {
              List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_GetByLikeCodigoDesde(s, desde_Codigo));
              lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoDesde(Scope s, string desde_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByLikeCodigoDesde(s, desde_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto> GetByLikeCodigoDesdeHasta(string sortExpression, Scope s,string desde_Codigo, string hasta_Codigo)
          {
              List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_GetByLikeCodigoDesdeHasta(s,desde_Codigo, hasta_Codigo));
              lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoDesdeHasta(Scope s,string desde_Codigo, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByLikeCodigoDesdeHasta(s,desde_Codigo, hasta_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto> GetByLikeCodigoHasta(string sortExpression, Scope s, string hasta_Codigo)
          {
              List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_GetByLikeCodigoHasta(s, hasta_Codigo));
              lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByLikeCodigoHasta(s, hasta_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
          {
              List<Apu_Proyecto> lista = new List<Apu_Proyecto>(Adapter.Apu_Proyecto_GetByLikeNombre(s, Nombre));
              lista.Sort(new Apu_Proyecto_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeNombre(Scope s, string Nombre)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_GetByLikeNombre(s, Nombre));
          }

          public int TotalPaginas(Scope s,  string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
              return Adapter.Apu_Proyecto_TotalPaginas(s,  Codigo_Desde, Codigo_Hasta, Estado, Nombre, Fecha_Creacion_Desde, Fecha_Creacion_Hasta, Coordinador_Per_Personal_Nombre, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
          }

          public bool Update_Costo(Scope s, Apu_Proyecto oApu_Proyecto)
          {
              return Adapter.Apu_Proyecto_Update_Costo(s,oApu_Proyecto);
          }

          public bool Transferir_Oferta(Scope s, Apu_Proyecto oApu_Proyecto, string Apu_Oferta_Id)
          {
              return Adapter.Apu_Proyecto_Transferir_Oferta(s, oApu_Proyecto, Apu_Oferta_Id);
          }

          #endregion
  # region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Proyecto
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Proyecto o, Apu_Proyecto original)
  {
  return Adapter.Apu_Proyecto_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto o = new Apu_Proyecto();
  Apu_Proyecto original = new Apu_Proyecto();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Proyecto
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Proyecto o)
  {
  return Adapter.Apu_Proyecto_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Proyecto o = new Apu_Proyecto();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Proyecto
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Proyecto o)
  {
  return Adapter.Apu_Proyecto_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto original = new Apu_Proyecto();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Proyecto_Comparar : IComparer<Apu_Proyecto>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto x, Apu_Proyecto y)
  {
  int retVal = 0;
  switch (_sortColumn)
  {
  case "Id":
  retVal = string.Compare(x.Id, y.Id);
  break;
  case "Nombre":
  retVal = string.Compare(x.Nombre, y.Nombre);
  break;
  case "Codigo":
  retVal = string.Compare(x.Codigo, y.Codigo);
  break;
  case "Estado":
  retVal = string.Compare(x.Estado, y.Estado);
  break;
  }
  return (retVal * (_reverse ? -1 : 1));
  }
  }
  #endregion
    }
    }
