
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.VER
  {
  /// <summary>
  /// Acceso a los Web Services WS_VER
  /// Modulo: Version ta
  /// Tabla: Ver_Etiqueta
  /// </summary>
  [DataObject]
  public class BO_Ver_Etiqueta
  {
  #region  Adapter
  private WS_VER _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_VER Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_VER();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Etiqueta> Get(string sortExpression, Scope s)
  {
  List<Ver_Etiqueta> lista = new List<Ver_Etiqueta>(Adapter.Ver_Etiqueta_Get(s));
  lista.Sort(new Ver_Etiqueta_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Ver_Etiqueta_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Etiqueta>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Ver_Etiqueta> lista = new List<Ver_Etiqueta> (Adapter.Ver_Etiqueta_GetByCodigo(s,  Codigo));
  lista.Sort(new Ver_Etiqueta_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Ver_Etiqueta_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Etiqueta>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Ver_Etiqueta> lista = new List<Ver_Etiqueta> (Adapter.Ver_Etiqueta_GetById(s,  Id));
  lista.Sort(new Ver_Etiqueta_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Ver_Etiqueta_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Ver_Etiqueta
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Ver_Etiqueta o, Ver_Etiqueta original)
  {
  return Adapter.Ver_Etiqueta_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Etiqueta o = new Ver_Etiqueta();
  Ver_Etiqueta original = new Ver_Etiqueta();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Ver_Etiqueta
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Ver_Etiqueta o)
  {
  return Adapter.Ver_Etiqueta_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Ver_Etiqueta o = new Ver_Etiqueta();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Ver_Etiqueta
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Ver_Etiqueta o)
  {
  return Adapter.Ver_Etiqueta_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Etiqueta original = new Ver_Etiqueta();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Ver_Etiqueta_Comparar : IComparer<Ver_Etiqueta>
  {
  private string _sortColumn;
  private bool _reverse;
  public Ver_Etiqueta_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Ver_Etiqueta x, Ver_Etiqueta y)
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
