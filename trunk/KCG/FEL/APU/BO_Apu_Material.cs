
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
using System;
  namespace FEL.APU
  {
  /// <summary>
  /// Acceso a los Web Services WS_APU
  /// Modulo: Apu target
  /// Tabla: Apu_Material
  /// </summary>
  [DataObject]
  public class BO_Apu_Material
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
  public List<Apu_Material> Get(string sortExpression, Scope s)
  {
  List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_Get(s));
  lista.Sort(new Apu_Material_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Material_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Material> lista = new List<Apu_Material> (Adapter.Apu_Material_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Material_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material>GetByEmpresa(string sortExpression, Scope s  )
          {
          List<Apu_Material> lista = new List<Apu_Material> (Adapter.Apu_Material_GetByEmpresa(s));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByEmpresa(Scope s )
          {
          return EntidadDT.GetDT(Adapter.Apu_Material_GetByEmpresa(s));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Material> lista = new List<Apu_Material> (Adapter.Apu_Material_GetById(s,  Id));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Material_GetById(s,  Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material>GetByLikeNombre(string sortExpression, Scope s ,string nombre,string int_sucursal_Id )
          {
          List<Apu_Material> lista = new List<Apu_Material> (Adapter.Apu_Material_GetByLikeNombre(s, nombre,  s.Int_Sucursal_Id));
          //lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeNombre(Scope s, string nombre, string int_sucursal_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GetByLikeNombre(s, nombre, s.Int_Sucursal_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material> GetByNombre(string sortExpression, Scope s, string nombre, string int_sucursal_Id)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GetByNombre(s, nombre, s.Int_Sucursal_Id));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByNombre(Scope s, string nombre, string int_sucursal_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GetByNombre(s, nombre, s.Int_Sucursal_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material>GetByProyectoRubroMaterial(string sortExpression, Scope s ,string Apu_Proyecto_Rubro_id,string Apu_Material_Id )
          {
          List<Apu_Material> lista = new List<Apu_Material> (Adapter.Apu_Material_GetByProyectoRubroMaterial(s, Apu_Proyecto_Rubro_id,  Apu_Material_Id));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyectoRubroMaterial(Scope s ,string Apu_Proyecto_Rubro_id,string Apu_Material_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Material_GetByProyectoRubroMaterial(s,Apu_Proyecto_Rubro_id,  Apu_Material_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Material> GetBySucursal(string sortExpression, Scope s, string Int_Sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GetBySucursal(s, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible));
          lista.Sort(new Apu_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetBySucursal(Scope s, string Int_Sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
          {
              DataTable dt = new DataTable();
              dt = EntidadDT.GetDT(Adapter.Apu_Material_GetBySucursal(s, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible));
              return EntidadDT.GetDT(Adapter.Apu_Material_GetBySucursal(s, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Material> GetByOfertaRubroMaterial(string sortExpression, Scope s, string Nombre, string Apu_Material_Id)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GetByOfertaRubroMaterial(s,Nombre, Apu_Material_Id));
              lista.Sort(new Apu_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByOfertaRubroMaterial(Scope s, string Nombre, string Apu_Material_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GetByOfertaRubroMaterial(s,Nombre, Apu_Material_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Material> GetByLikeCodigoDesde(string sortExpression, Scope s, string desde_Codigo)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GetByLikeCodigoDesde(s, desde_Codigo));
              lista.Sort(new Apu_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByLikeCodigoDesde(Scope s, string desde_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GetByLikeCodigoDesde(s, desde_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Material> GetByLikeCodigoDesdeHasta(string sortExpression, Scope s, string desde_Codigo, string hasta_Codigo)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo));
              lista.Sort(new Apu_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GetByLikeCodigoDesdeHasta(s,desde_Codigo, hasta_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Material> GeByLikeCodigoHasta(string sortExpression, Scope s, string hasta_Codigo)
          {
              List<Apu_Material> lista = new List<Apu_Material>(Adapter.Apu_Material_GeByLikeCodigoHasta(s, hasta_Codigo));
              lista.Sort(new Apu_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GeByLikeCodigoHasta(Scope s, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Material_GeByLikeCodigoHasta(s, hasta_Codigo));
          }
      public int TotalPaginas(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
      {
          return Adapter.Apu_Material_TotalPaginas(s, Int_sucursal_id, Codigo_Desde, Codigo_Hasta, Nombre, Unidad, Costo_Total_Desde, Costo_Total_Hasta, Disponible);
      }
          #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Material
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Material o, Apu_Material original)
  {
      o.Update_Per_Personal_Id = s.Per_Personal_Id;
      if (!string.IsNullOrEmpty(o.Nombre))
          o.Nombre = o.Nombre.ToUpper();
      return Adapter.Apu_Material_Update(s, o, original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Material o = new Apu_Material();
  Apu_Material original = new Apu_Material();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Material
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Material o)
  {
      o.Int_Sucursal_Id = s.Int_Sucursal_Id;
      o.Int_Moneda_Id = s.Int_Moneda_Id;
      o.Fecha_Creacion = DateTime.Now;
      o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
      o.Fecha_Update = DateTime.Now;
      o.Update_Per_Personal_Id = s.Per_Personal_Id;
      if (!string.IsNullOrEmpty(o.Nombre))
          o.Nombre = o.Nombre.ToUpper();
      return Adapter.Apu_Material_Insert(s, o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Material o = new Apu_Material();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Material
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Material o)
  {
  return Adapter.Apu_Material_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Material original = new Apu_Material();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Material_Comparar : IComparer<Apu_Material>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Material_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Material x, Apu_Material y)
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
      retVal = (int.Parse(x.Codigo) > int.Parse(y.Codigo)) ? 1 : -1;
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
