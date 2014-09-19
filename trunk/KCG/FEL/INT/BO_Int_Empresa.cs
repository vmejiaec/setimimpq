
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
  /// Tabla: Int_Empresa
  /// </summary>
  [DataObject]
  public class BO_Int_Empresa
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
  public List<Int_Empresa> Get(string sortExpression, Scope s)
  {
  List<Int_Empresa> lista = new List<Int_Empresa>(Adapter.Int_Empresa_Get(s));
  lista.Sort(new Int_Empresa_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Int_Empresa_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Empresa>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Int_Empresa> lista = new List<Int_Empresa> (Adapter.Int_Empresa_GetByCodigo(s,  Codigo));
  lista.Sort(new Int_Empresa_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Int_Empresa_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Empresa>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Int_Empresa> lista = new List<Int_Empresa> (Adapter.Int_Empresa_GetById(s,  Id));
  lista.Sort(new Int_Empresa_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Empresa_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Empresa>GetByUsuario(string sortExpression, Scope s ,string Int_Usuario_Id )
  {
  List<Int_Empresa> lista = new List<Int_Empresa> (Adapter.Int_Empresa_GetByUsuario(s,  Int_Usuario_Id));
  lista.Sort(new Int_Empresa_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByUsuario(Scope s ,string Int_Usuario_Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Empresa_GetByUsuario(s,  Int_Usuario_Id));
  }

  public List<Int_Empresa> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
  {
      List<Int_Empresa> lista = new List<Int_Empresa>(Adapter.Int_Empresa_GetByLikeNombre(s, Nombre));
      lista.Sort(new Int_Empresa_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByLikeNombre(Scope s, string Nombre)
  {
      return EntidadDT.GetDT(Adapter.Int_Empresa_GetByLikeNombre(s, Nombre));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Int_Empresa
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Int_Empresa o, Int_Empresa original)
  {
  return Adapter.Int_Empresa_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Int_Empresa o = new Int_Empresa();
  Int_Empresa original = new Int_Empresa();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Int_Empresa
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Int_Empresa o)
  {
  return Adapter.Int_Empresa_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Int_Empresa o = new Int_Empresa();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Int_Empresa
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Int_Empresa o)
  {
  return Adapter.Int_Empresa_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Int_Empresa original = new Int_Empresa();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Int_Empresa_Comparar : IComparer<Int_Empresa>
  {
  private string _sortColumn;
  private bool _reverse;
  public Int_Empresa_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Int_Empresa x, Int_Empresa y)
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
