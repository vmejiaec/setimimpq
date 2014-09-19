
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.SEG
  {
  /// <summary>
  /// Acceso a los Web Services WS_SEG
  /// Modulo: Seguridad 
  /// Tabla: Seg_Rol_Objeto
  /// </summary>
  [DataObject]
  public class BO_Seg_Rol_Objeto
  {
  #region  Adapter
  private WS_SEG _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_SEG Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_SEG();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Objeto> Get(string sortExpression, Scope s)
  {
  List<Seg_Rol_Objeto> lista = new List<Seg_Rol_Objeto>(Adapter.Seg_Rol_Objeto_Get(s));
  lista.Sort(new Seg_Rol_Objeto_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Objeto_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Objeto>GetDataBy(string sortExpression, Scope s ,string Id )
  {
  List<Seg_Rol_Objeto> lista = new List<Seg_Rol_Objeto> (Adapter.Seg_Rol_Objeto_GetDataBy(s,  Id));
  lista.Sort(new Seg_Rol_Objeto_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetDataBy(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Objeto_GetDataBy(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Objeto>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Seg_Rol_Objeto> lista = new List<Seg_Rol_Objeto> (Adapter.Seg_Rol_Objeto_GetByCodigo(s,  Codigo));
  lista.Sort(new Seg_Rol_Objeto_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Objeto_GetByCodigo(s,  Codigo));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Seg_Rol_Objeto
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Seg_Rol_Objeto o, Seg_Rol_Objeto original)
  {
  return Adapter.Seg_Rol_Objeto_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Seg_Rol_Objeto o = new Seg_Rol_Objeto();
  Seg_Rol_Objeto original = new Seg_Rol_Objeto();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Seg_Rol_Objeto
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Seg_Rol_Objeto o)
  {
  return Adapter.Seg_Rol_Objeto_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Seg_Rol_Objeto o = new Seg_Rol_Objeto();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Seg_Rol_Objeto
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Seg_Rol_Objeto o)
  {
  return Adapter.Seg_Rol_Objeto_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Seg_Rol_Objeto original = new Seg_Rol_Objeto();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Seg_Rol_Objeto_Comparar : IComparer<Seg_Rol_Objeto>
  {
  private string _sortColumn;
  private bool _reverse;
  public Seg_Rol_Objeto_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Seg_Rol_Objeto x, Seg_Rol_Objeto y)
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
