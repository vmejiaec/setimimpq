
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
  /// Tabla: Ver_Doc_Estado
  /// </summary>
  [DataObject]
  public class BO_Ver_Doc_Estado
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
  public List<Ver_Doc_Estado> Get(string sortExpression, Scope s)
  {
  List<Ver_Doc_Estado> lista = new List<Ver_Doc_Estado>(Adapter.Ver_Doc_Estado_Get(s));
  lista.Sort(new Ver_Doc_Estado_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Ver_Doc_Estado_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Doc_Estado>GetByCampo(string sortExpression, Scope s ,string Dic_campo_Id )
  {
  List<Ver_Doc_Estado> lista = new List<Ver_Doc_Estado> (Adapter.Ver_Doc_Estado_GetByCampo(s,  Dic_campo_Id));
  lista.Sort(new Ver_Doc_Estado_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCampo(Scope s ,string Dic_campo_Id)
  {
  return EntidadDT.GetDT(Adapter.Ver_Doc_Estado_GetByCampo(s,  Dic_campo_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Doc_Estado>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Ver_Doc_Estado> lista = new List<Ver_Doc_Estado> (Adapter.Ver_Doc_Estado_GetByCodigo(s,  Codigo));
  lista.Sort(new Ver_Doc_Estado_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Ver_Doc_Estado_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Ver_Doc_Estado>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Ver_Doc_Estado> lista = new List<Ver_Doc_Estado> (Adapter.Ver_Doc_Estado_GetById(s,  Id));
  lista.Sort(new Ver_Doc_Estado_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Ver_Doc_Estado_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Ver_Doc_Estado
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Ver_Doc_Estado o, Ver_Doc_Estado original)
  {
  return Adapter.Ver_Doc_Estado_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Doc_Estado o = new Ver_Doc_Estado();
  Ver_Doc_Estado original = new Ver_Doc_Estado();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Ver_Doc_Estado
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Ver_Doc_Estado o)
  {
  return Adapter.Ver_Doc_Estado_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Ver_Doc_Estado o = new Ver_Doc_Estado();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Ver_Doc_Estado
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Ver_Doc_Estado o)
  {
  return Adapter.Ver_Doc_Estado_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Ver_Doc_Estado original = new Ver_Doc_Estado();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Ver_Doc_Estado_Comparar : IComparer<Ver_Doc_Estado>
  {
  private string _sortColumn;
  private bool _reverse;
  public Ver_Doc_Estado_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Ver_Doc_Estado x, Ver_Doc_Estado y)
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
