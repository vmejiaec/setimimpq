
   using System;
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.DIC
  {
  /// <summary>
  /// Acceso a los Web Services WS_DIC
  /// Modulo: Diccionario
  /// Tabla: Dic_General
  /// </summary>
  [DataObject]
  public class BO_Dic_General
  {
  #region  Adapter
  private WS_DIC _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_DIC Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_DIC();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_General> Get(string sortExpression, Scope s)
  {
  List<Dic_General> lista = new List<Dic_General>(Adapter.Dic_General_Get(s));
  lista.Sort(new Dic_General_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_General_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_General>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_General> lista = new List<Dic_General> (Adapter.Dic_General_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_General_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_General_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_General>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_General> lista = new List<Dic_General> (Adapter.Dic_General_GetById(s,  Id));
  lista.Sort(new Dic_General_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_General_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_General>GetByTipo(string sortExpression, Scope s , string Tipo )
  {
  List<Dic_General> lista = new List<Dic_General> (Adapter.Dic_General_GetByTipo(s,  Tipo));
  lista.Sort(new Dic_General_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByTipo(Scope s , string Tipo)
  {
  return EntidadDT.GetDT(Adapter.Dic_General_GetByTipo(s,  Tipo));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_General
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_General o, Dic_General original)
  {
  return Adapter.Dic_General_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_General o = new Dic_General();
  Dic_General original = new Dic_General();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_General
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_General o)
  {
  return Adapter.Dic_General_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_General o = new Dic_General();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_General
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_General o)
  {
  return Adapter.Dic_General_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_General original = new Dic_General();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Dic_General_Comparar : IComparer<Dic_General>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_General_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_General x, Dic_General y)
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
