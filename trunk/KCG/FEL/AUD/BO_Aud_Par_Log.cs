
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.AUD
  {
  /// <summary>
  /// Acceso a los Web Services WS_AUD
  /// Modulo: Auditoria 
  /// Tabla: Aud_Par_Log
  /// </summary>
  [DataObject]
  public class BO_Aud_Par_Log
  {
  #region  Adapter
  private WS_AUD _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_AUD Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_AUD();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Par_Log> Get(string sortExpression, Scope s)
  {
  List<Aud_Par_Log> lista = new List<Aud_Par_Log>(Adapter.Aud_Par_Log_Get(s));
  lista.Sort(new Aud_Par_Log_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Aud_Par_Log_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Par_Log>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Aud_Par_Log> lista = new List<Aud_Par_Log> (Adapter.Aud_Par_Log_GetByCodigo(s,  Codigo));
  lista.Sort(new Aud_Par_Log_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Aud_Par_Log_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Par_Log>GetByEmpresa(string sortExpression, Scope s ,string int_empresa_Id )
  {
  List<Aud_Par_Log> lista = new List<Aud_Par_Log> (Adapter.Aud_Par_Log_GetByEmpresa(s,  int_empresa_Id));
  lista.Sort(new Aud_Par_Log_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s ,string int_empresa_Id)
  {
  return EntidadDT.GetDT(Adapter.Aud_Par_Log_GetByEmpresa(s,  int_empresa_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Par_Log>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Aud_Par_Log> lista = new List<Aud_Par_Log> (Adapter.Aud_Par_Log_GetById(s,  Id));
  lista.Sort(new Aud_Par_Log_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Aud_Par_Log_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Aud_Par_Log> GetBySucursalContenedor(string sortExpression, Scope s, string Int_Sucursal_Id, string Dic_Contenedor_Id)
  {
  List<Aud_Par_Log> lista = new List<Aud_Par_Log> (Adapter.Aud_Par_Log_GetBySucursalContenedor(s,Int_Sucursal_Id,  Dic_Contenedor_Id));
  lista.Sort(new Aud_Par_Log_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetBySucursalContenedor(Scope s, string Int_Sucursal_Id, string Dic_Contenedor_Id)
  {
      return EntidadDT.GetDT(Adapter.Aud_Par_Log_GetBySucursalContenedor(s, Int_Sucursal_Id, Dic_Contenedor_Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Aud_Par_Log
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Aud_Par_Log o, Aud_Par_Log original)
  {
  return Adapter.Aud_Par_Log_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Aud_Par_Log o = new Aud_Par_Log();
  Aud_Par_Log original = new Aud_Par_Log();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Aud_Par_Log
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Aud_Par_Log o)
  {
  return Adapter.Aud_Par_Log_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Aud_Par_Log o = new Aud_Par_Log();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Aud_Par_Log
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Aud_Par_Log o)
  {
  return Adapter.Aud_Par_Log_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Aud_Par_Log original = new Aud_Par_Log();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Aud_Par_Log_Comparar : IComparer<Aud_Par_Log>
  {
  private string _sortColumn;
  private bool _reverse;
  public Aud_Par_Log_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Aud_Par_Log x, Aud_Par_Log y)
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
