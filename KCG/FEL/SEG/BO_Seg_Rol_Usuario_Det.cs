
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
  /// Tabla: Seg_Rol_Usuario_Det
  /// </summary>
  [DataObject]
  public class BO_Seg_Rol_Usuario_Det
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
  public List<Seg_Rol_Usuario_Det> Get(string sortExpression, Scope s)
  {
  List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>(Adapter.Seg_Rol_Usuario_Det_Get(s));
  lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Usuario_Det>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det> (Adapter.Seg_Rol_Usuario_Det_GetByCodigo(s,  Codigo));
  lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Usuario_Det>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det> (Adapter.Seg_Rol_Usuario_Det_GetById(s,  Id));
  lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Usuario_Det>GetBySucursalUsuario(string sortExpression, Scope s,string Int_Sucursal_Id,string Int_Usuario_Id )
  {
      List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>(Adapter.Seg_Rol_Usuario_Det_GetBySucursalUsuario(s, Int_Sucursal_Id, Int_Usuario_Id));
  lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetBySucursalUsuario(Scope s ,string Int_Sucursal_Id,string  Int_Usuario_Id)
  {
      return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_GetBySucursalUsuario(s, Int_Sucursal_Id, Int_Usuario_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Usuario_Det>GetBySucursalUsuarioRol(string sortExpression, Scope s,string Int_Sucursal_Id,string Int_Usuario_Id, string Seg_Rol_Id )
  {
  List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det> (Adapter.Seg_Rol_Usuario_Det_GetBySucursalUsuarioRol(s, Int_Sucursal_Id, Int_Usuario_Id, Seg_Rol_Id));
  lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetBySucursalUsuarioRol(Scope s ,string Int_Sucursal_Id,string  Int_Usuario_Id,string Seg_Rol_Id)
  {
      return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_GetBySucursalUsuarioRol(s, Int_Sucursal_Id, Int_Usuario_Id, Seg_Rol_Id));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Seg_Rol_Usuario_Det> GetByRolUsuario(string sortExpression, Scope s, string Seg_Rol_Usuario_Id)
  {
      List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>(Adapter.Seg_Rol_Usuario_Det_GetByRolUsuario(s, Seg_Rol_Usuario_Id));
      lista.Sort(new Seg_Rol_Usuario_Det_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByRolUsuario(Scope s, string Seg_Rol_Usuario_Id)
  {
      return EntidadDT.GetDT(Adapter.Seg_Rol_Usuario_Det_GetByRolUsuario(s, Seg_Rol_Usuario_Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Seg_Rol_Usuario_Det
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Seg_Rol_Usuario_Det o, Seg_Rol_Usuario_Det original)
  {
  return Adapter.Seg_Rol_Usuario_Det_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Seg_Rol_Usuario_Det o = new Seg_Rol_Usuario_Det();
  Seg_Rol_Usuario_Det original = new Seg_Rol_Usuario_Det();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Seg_Rol_Usuario_Det
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Seg_Rol_Usuario_Det o)
  {
  return Adapter.Seg_Rol_Usuario_Det_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Seg_Rol_Usuario_Det o = new Seg_Rol_Usuario_Det();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Seg_Rol_Usuario_Det
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Seg_Rol_Usuario_Det o)
  {
  return Adapter.Seg_Rol_Usuario_Det_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Seg_Rol_Usuario_Det original = new Seg_Rol_Usuario_Det();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Seg_Rol_Usuario_Det_Comparar : IComparer<Seg_Rol_Usuario_Det>
  {
  private string _sortColumn;
  private bool _reverse;
  public Seg_Rol_Usuario_Det_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Seg_Rol_Usuario_Det x, Seg_Rol_Usuario_Det y)
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
