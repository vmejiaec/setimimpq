
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
  /// Tabla: Dic_Dominio
  /// </summary>
  [DataObject]
  public class BO_Dic_Dominio
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
  public List<Dic_Dominio> Get(string sortExpression, Scope s)
  {
  List<Dic_Dominio> lista = new List<Dic_Dominio>(Adapter.Dic_Dominio_Get(s));
  lista.Sort(new Dic_Dominio_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_Dominio_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Dominio>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_Dominio> lista = new List<Dic_Dominio> (Adapter.Dic_Dominio_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_Dominio_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_Dominio_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Dominio>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_Dominio> lista = new List<Dic_Dominio> (Adapter.Dic_Dominio_GetById(s,  Id));
  lista.Sort(new Dic_Dominio_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Dominio_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Dominio>GetByMantenimiento(string sortExpression, Scope s )
  {
  List<Dic_Dominio> lista = new List<Dic_Dominio> (Adapter.Dic_Dominio_GetByMantenimiento(s));
  lista.Sort(new Dic_Dominio_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByMantenimiento(Scope s )
  {
  return EntidadDT.GetDT(Adapter.Dic_Dominio_GetByMantenimiento(s));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_Dominio
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_Dominio o, Dic_Dominio original)
  {
  return Adapter.Dic_Dominio_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Dominio o = new Dic_Dominio();
  Dic_Dominio original = new Dic_Dominio();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_Dominio
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_Dominio o)
  {
  return Adapter.Dic_Dominio_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_Dominio o = new Dic_Dominio();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_Dominio
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_Dominio o)
  {
  return Adapter.Dic_Dominio_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Dominio original = new Dic_Dominio();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Dic_Dominio_Comparar : IComparer<Dic_Dominio>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_Dominio_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_Dominio x, Dic_Dominio y)
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
