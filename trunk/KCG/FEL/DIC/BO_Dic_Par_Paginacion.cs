
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
  /// Tabla: Dic_Par_Paginacion
  /// </summary>
  [DataObject]
  public class BO_Dic_Par_Paginacion
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
  public List<Dic_Par_Paginacion> Get(string sortExpression, Scope s)
  {
  List<Dic_Par_Paginacion> lista = new List<Dic_Par_Paginacion>(Adapter.Dic_Par_Paginacion_Get(s));
  lista.Sort(new Dic_Par_Paginacion_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_Par_Paginacion_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Par_Paginacion>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_Par_Paginacion> lista = new List<Dic_Par_Paginacion> (Adapter.Dic_Par_Paginacion_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_Par_Paginacion_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_Par_Paginacion_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Par_Paginacion>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_Par_Paginacion> lista = new List<Dic_Par_Paginacion> (Adapter.Dic_Par_Paginacion_GetById(s,  Id));
  lista.Sort(new Dic_Par_Paginacion_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Par_Paginacion_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_Par_Paginacion
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_Par_Paginacion o, Dic_Par_Paginacion original)
  {
  return Adapter.Dic_Par_Paginacion_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Par_Paginacion o = new Dic_Par_Paginacion();
  Dic_Par_Paginacion original = new Dic_Par_Paginacion();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_Par_Paginacion
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_Par_Paginacion o)
  {
  return Adapter.Dic_Par_Paginacion_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_Par_Paginacion o = new Dic_Par_Paginacion();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_Par_Paginacion
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_Par_Paginacion o)
  {
  return Adapter.Dic_Par_Paginacion_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Par_Paginacion original = new Dic_Par_Paginacion();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Procedimientos
      public int NumeroRegistros(Scope s, string p_dic_objeto_nombre)
  {
      return Adapter.Dic_Par_Paginacion_NumeroRegistros(s, p_dic_objeto_nombre);
  }
  #endregion
  #region Ordenar la lista
  class Dic_Par_Paginacion_Comparar : IComparer<Dic_Par_Paginacion>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_Par_Paginacion_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_Par_Paginacion x, Dic_Par_Paginacion y)
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
