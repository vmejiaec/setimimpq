
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
  /// Tabla: Int_Sucursal
  /// </summary>
  [DataObject]
  public class BO_Int_Sucursal
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
  public List<Int_Sucursal> Get(string sortExpression, Scope s)
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal>(Adapter.Int_Sucursal_Get(s));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetByCodigo(s,  Codigo));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal>GetByEmpresa(string sortExpression, Scope s ,string Int_Empresa_Id )
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetByEmpresa(s,  Int_Empresa_Id));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s ,string Int_Empresa_Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByEmpresa(s,  Int_Empresa_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Int_Sucursal> GetByEmpresaUsuario(string sortExpression, Scope s, string Int_Empresa_Id, string Int_Usuario_Id)
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetByEmpresaUsuario(s,Int_Empresa_Id,  Int_Usuario_Id));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresaUsuario(Scope s ,string Int_Empresa_Id,string Int_Usuario_Id)
  {
      return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByEmpresaUsuario(s, Int_Empresa_Id, Int_Usuario_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetById(s,  Id));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Int_Sucursal> GetByIdUsuario(string sortExpression, Scope s, string Id, string Int_Usuario_Id)
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetByIdUsuario(s, Id,  Int_Usuario_Id));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByIdUsuario(Scope s, string Id, string Int_Usuario_Id)
  {
      return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByIdUsuario(s, Id, Int_Usuario_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal>GetByMantenimiento(string sortExpression, Scope s ,string int_empresa_id )
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetByMantenimiento(s,  int_empresa_id));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByMantenimiento(Scope s ,string int_empresa_id)
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByMantenimiento(s,  int_empresa_id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal>GetOnlyPredeterminada(string sortExpression, Scope s )
  {
  List<Int_Sucursal> lista = new List<Int_Sucursal> (Adapter.Int_Sucursal_GetOnlyPredeterminada(s));
  lista.Sort(new Int_Sucursal_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetOnlyPredeterminada(Scope s )
  {
  return EntidadDT.GetDT(Adapter.Int_Sucursal_GetOnlyPredeterminada(s));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Sucursal> GetByLikeEmpresa(string sortExpression, Scope s, string Int_Empresa_Id)
  {
      List<Int_Sucursal> lista = new List<Int_Sucursal>(Adapter.Int_Sucursal_GetByLikeEmpresa(s, Int_Empresa_Id));
      lista.Sort(new Int_Sucursal_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByLikeEmpresa(Scope s, string Int_Empresa_Id)
  {
      return EntidadDT.GetDT(Adapter.Int_Sucursal_GetByLikeEmpresa(s, Int_Empresa_Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Int_Sucursal
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Int_Sucursal o, Int_Sucursal original)
  {
  return Adapter.Int_Sucursal_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Int_Sucursal o = new Int_Sucursal();
  Int_Sucursal original = new Int_Sucursal();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Int_Sucursal
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Int_Sucursal o)
  {
  return Adapter.Int_Sucursal_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Int_Sucursal o = new Int_Sucursal();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Int_Sucursal
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Int_Sucursal o)
  {
  return Adapter.Int_Sucursal_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Int_Sucursal original = new Int_Sucursal();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Int_Sucursal_Comparar : IComparer<Int_Sucursal>
  {
  private string _sortColumn;
  private bool _reverse;
  public Int_Sucursal_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Int_Sucursal x, Int_Sucursal y)
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
