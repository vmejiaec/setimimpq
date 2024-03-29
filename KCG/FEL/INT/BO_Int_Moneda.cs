
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.INT
  {
  /// <summary>
  /// Acceso a los Web Services WS_INT
  /// Modulo: Interface 
  /// Tabla: Int_Moneda
  /// </summary>
  [DataObject]
  public class BO_Int_Moneda
  {
  #region  Adapter
  private WS_INT _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_INT Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_INT();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Moneda> Get(string sortExpression, Scope s)
  {
  List<Int_Moneda> lista = new List<Int_Moneda>(Adapter.Int_Moneda_Get(s));
  lista.Sort(new Int_Moneda_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Int_Moneda_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Moneda>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Int_Moneda> lista = new List<Int_Moneda> (Adapter.Int_Moneda_GetByCodigo(s,  Codigo));
  lista.Sort(new Int_Moneda_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Int_Moneda_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Moneda>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Int_Moneda> lista = new List<Int_Moneda> (Adapter.Int_Moneda_GetById(s,  Id));
  lista.Sort(new Int_Moneda_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Moneda_GetById(s,  Id));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Moneda> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
  {
      List<Int_Moneda> lista = new List<Int_Moneda>(Adapter.Int_Moneda_GetByLikeNombre(s, Nombre));
      lista.Sort(new Int_Moneda_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByLikeNombre(Scope s, string Nombre)
  {
      return EntidadDT.GetDT(Adapter.Int_Moneda_GetByLikeNombre(s, Nombre));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Int_Moneda
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Int_Moneda o, Int_Moneda original)
  {
  return Adapter.Int_Moneda_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Int_Moneda o = new Int_Moneda();
  Int_Moneda original = new Int_Moneda();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Int_Moneda
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Int_Moneda o)
  {
  return Adapter.Int_Moneda_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Int_Moneda o = new Int_Moneda();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Int_Moneda
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Int_Moneda o)
  {
  return Adapter.Int_Moneda_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Int_Moneda original = new Int_Moneda();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Int_Moneda_Comparar : IComparer<Int_Moneda>
  {
  private string _sortColumn;
  private bool _reverse;
  public Int_Moneda_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Int_Moneda x, Int_Moneda y)
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
