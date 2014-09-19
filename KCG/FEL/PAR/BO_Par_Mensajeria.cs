
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.PAR
  {
  /// <summary>
  /// Acceso a los Web Services WS_PAR
  /// Modulo: Parametros
  /// Tabla: Par_Mensajeria
  /// </summary>
  [DataObject]
  public class BO_Par_Mensajeria
  {
  #region  Adapter
  private WS_PAR _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_PAR Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_PAR();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Par_Mensajeria> Get(string sortExpression, Scope s)
  {
  List<Par_Mensajeria> lista = new List<Par_Mensajeria>(Adapter.Par_Mensajeria_Get(s));
  lista.Sort(new Par_Mensajeria_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Par_Mensajeria_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Par_Mensajeria>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Par_Mensajeria> lista = new List<Par_Mensajeria> (Adapter.Par_Mensajeria_GetByCodigo(s,  Codigo));
  lista.Sort(new Par_Mensajeria_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Par_Mensajeria_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Par_Mensajeria>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Par_Mensajeria> lista = new List<Par_Mensajeria> (Adapter.Par_Mensajeria_GetById(s,  Id));
  lista.Sort(new Par_Mensajeria_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Par_Mensajeria_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Par_Mensajeria
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Par_Mensajeria o, Par_Mensajeria original)
  {
  return Adapter.Par_Mensajeria_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Par_Mensajeria o = new Par_Mensajeria();
  Par_Mensajeria original = new Par_Mensajeria();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Par_Mensajeria
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Par_Mensajeria o)
  {
  return Adapter.Par_Mensajeria_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Par_Mensajeria o = new Par_Mensajeria();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Par_Mensajeria
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Par_Mensajeria o)
  {
  return Adapter.Par_Mensajeria_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Par_Mensajeria original = new Par_Mensajeria();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Par_Mensajeria_Comparar : IComparer<Par_Mensajeria>
  {
  private string _sortColumn;
  private bool _reverse;
  public Par_Mensajeria_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Par_Mensajeria x, Par_Mensajeria y)
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
