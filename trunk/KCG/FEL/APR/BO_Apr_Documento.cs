
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.APR
  {
  /// <summary>
  /// Acceso a los Web Services WS_APR
  /// Modulo: Aprobacion
  /// Tabla: Apr_Documento
  /// </summary>
  [DataObject]
  public class BO_Apr_Documento
  {
  #region  Adapter
  private WS_APR _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_APR Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_APR();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apr_Documento> Get(string sortExpression, Scope s)
  {
  List<Apr_Documento> lista = new List<Apr_Documento>(Adapter.Apr_Documento_Get(s));
  lista.Sort(new Apr_Documento_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apr_Documento_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apr_Documento>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Apr_Documento> lista = new List<Apr_Documento> (Adapter.Apr_Documento_GetByCodigo(s,  Codigo));
  lista.Sort(new Apr_Documento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Apr_Documento_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apr_Documento>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Apr_Documento> lista = new List<Apr_Documento> (Adapter.Apr_Documento_GetById(s,  Id));
  lista.Sort(new Apr_Documento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Apr_Documento_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apr_Documento>GetByMantenimiento(string sortExpression, Scope s ,string ver_version_id )
  {
  List<Apr_Documento> lista = new List<Apr_Documento> (Adapter.Apr_Documento_GetByMantenimiento(s,  ver_version_id));
  lista.Sort(new Apr_Documento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByMantenimiento(Scope s ,string ver_version_id)
  {
  return EntidadDT.GetDT(Adapter.Apr_Documento_GetByMantenimiento(s,  ver_version_id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apr_Documento
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apr_Documento o, Apr_Documento original)
  {
  return Adapter.Apr_Documento_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apr_Documento o = new Apr_Documento();
  Apr_Documento original = new Apr_Documento();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apr_Documento
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apr_Documento o)
  {
  return Adapter.Apr_Documento_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apr_Documento o = new Apr_Documento();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apr_Documento
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apr_Documento o)
  {
  return Adapter.Apr_Documento_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apr_Documento original = new Apr_Documento();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apr_Documento_Comparar : IComparer<Apr_Documento>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apr_Documento_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apr_Documento x, Apr_Documento y)
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
