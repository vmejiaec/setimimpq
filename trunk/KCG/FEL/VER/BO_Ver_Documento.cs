
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
  /// Tabla: Ver_Documento
  /// </summary>
  [DataObject]
  public class BO_Ver_Documento
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
  public List<Ver_Documento> Get(string sortExpression, Scope s)
  {
  List<Ver_Documento> lista = new List<Ver_Documento>(Adapter.Ver_Documento_Get(s));
  lista.Sort(new Ver_Documento_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Ver_Documento_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Documento>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Ver_Documento> lista = new List<Ver_Documento> (Adapter.Ver_Documento_GetByCodigo(s,  Codigo));
  lista.Sort(new Ver_Documento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Ver_Documento_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Documento>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Ver_Documento> lista = new List<Ver_Documento> (Adapter.Ver_Documento_GetById(s,  Id));
  lista.Sort(new Ver_Documento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Ver_Documento_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Ver_Documento
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Ver_Documento o, Ver_Documento original)
  {
  return Adapter.Ver_Documento_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Documento o = new Ver_Documento();
  Ver_Documento original = new Ver_Documento();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Ver_Documento
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Ver_Documento o)
  {
  return Adapter.Ver_Documento_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Ver_Documento o = new Ver_Documento();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Ver_Documento
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Ver_Documento o)
  {
  return Adapter.Ver_Documento_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Documento original = new Ver_Documento();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Ver_Documento_Comparar : IComparer<Ver_Documento>
  {
  private string _sortColumn;
  private bool _reverse;
  public Ver_Documento_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Ver_Documento x, Ver_Documento y)
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
