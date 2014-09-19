
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
  /// Tabla: Dic_Codigo
  /// </summary>
  [DataObject]
  public class BO_Dic_Codigo
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
  public List<Dic_Codigo> Get(string sortExpression, Scope s)
  {
  List<Dic_Codigo> lista = new List<Dic_Codigo>(Adapter.Dic_Codigo_Get(s));
  lista.Sort(new Dic_Codigo_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_Codigo_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Dic_Codigo> GetByCampo(string sortExpression, Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
  {
  List<Dic_Codigo> lista = new List<Dic_Codigo> (Adapter.Dic_Codigo_GetByCampo(s,Dic_Objeto_Nombre, Dic_Campo_Nombre));
  lista.Sort(new Dic_Codigo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByCampo(Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
  {
      return EntidadDT.GetDT(Adapter.Dic_Codigo_GetByCampo(s, Dic_Objeto_Nombre, Dic_Campo_Nombre));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Codigo>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_Codigo> lista = new List<Dic_Codigo> (Adapter.Dic_Codigo_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_Codigo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_Codigo_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Codigo>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_Codigo> lista = new List<Dic_Codigo> (Adapter.Dic_Codigo_GetById(s,  Id));
  lista.Sort(new Dic_Codigo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Codigo_GetById(s,  Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_Codigo
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_Codigo o, Dic_Codigo original)
  {
  return Adapter.Dic_Codigo_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Codigo o = new Dic_Codigo();
  Dic_Codigo original = new Dic_Codigo();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_Codigo
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_Codigo o)
  {
  return Adapter.Dic_Codigo_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_Codigo o = new Dic_Codigo();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_Codigo
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_Codigo o)
  {
  return Adapter.Dic_Codigo_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Codigo original = new Dic_Codigo();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Dic_Codigo_Comparar : IComparer<Dic_Codigo>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_Codigo_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_Codigo x, Dic_Codigo y)
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
