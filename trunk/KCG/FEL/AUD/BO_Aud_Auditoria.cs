
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
  /// Tabla: Aud_Auditoria
  /// </summary>
  [DataObject]
  public class BO_Aud_Auditoria
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
  public List<Aud_Auditoria> Get(string sortExpression, Scope s,string Id_Inicial,string Id_Final)
  {
  List<Aud_Auditoria> lista = new List<Aud_Auditoria>(Adapter.Aud_Auditoria_Get(s,Id_Inicial,Id_Final));
  lista.Sort(new Aud_Auditoria_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s,string Id_Inicial,string Id_Final)
  {
      return EntidadDT.GetDT(Adapter.Aud_Auditoria_Get(s, Id_Inicial, Id_Final));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Aud_Auditoria> GetByCodigo(string sortExpression, Scope s, string Id_Inicial,string  Id_Final,string Codigo)
  {
  List<Aud_Auditoria> lista = new List<Aud_Auditoria> (Adapter.Aud_Auditoria_GetByCodigo(s,Id_Inicial,Id_Final,  Codigo));
  lista.Sort(new Aud_Auditoria_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByCodigo(Scope s, string Id_Inicial,string Id_Final,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Aud_Auditoria_GetByCodigo(s,Id_Inicial,Id_Final,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Auditoria>GetByEmpresa(string sortExpression, Scope s ,string Par_Servidor_Id,string Dic_Objeto_Id,int secuencia,string Int_Empresa_Id )
  {
  List<Aud_Auditoria> lista = new List<Aud_Auditoria> (Adapter.Aud_Auditoria_GetByEmpresa(s,Par_Servidor_Id, Dic_Objeto_Id,secuencia,  Int_Empresa_Id));
  lista.Sort(new Aud_Auditoria_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s ,string Par_Servidor_Id,string Dic_Objeto_Id,int secuencia,string Int_Empresa_Id)
  {
      return EntidadDT.GetDT(Adapter.Aud_Auditoria_GetByEmpresa(s, Par_Servidor_Id, Dic_Objeto_Id, secuencia, Int_Empresa_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Aud_Auditoria>GetById(string sortExpression, Scope s ,string Id_Inicial,string Id_Final,string Id )
  {
  List<Aud_Auditoria> lista = new List<Aud_Auditoria> (Adapter.Aud_Auditoria_GetById(s,Id_Inicial,Id_Final, Id));
  lista.Sort(new Aud_Auditoria_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id_Inicial,string Id_Final,string Id)
  {
      return EntidadDT.GetDT(Adapter.Aud_Auditoria_GetById(s, Id_Inicial, Id_Final, Id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Aud_Auditoria
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Aud_Auditoria o, Aud_Auditoria original)
  {
  return Adapter.Aud_Auditoria_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Aud_Auditoria o = new Aud_Auditoria();
  Aud_Auditoria original = new Aud_Auditoria();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Aud_Auditoria
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Aud_Auditoria o)
  {
  return Adapter.Aud_Auditoria_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Aud_Auditoria o = new Aud_Auditoria();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Aud_Auditoria
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Aud_Auditoria o)
  {
  return Adapter.Aud_Auditoria_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Aud_Auditoria original = new Aud_Auditoria();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Aud_Auditoria_Comparar : IComparer<Aud_Auditoria>
  {
  private string _sortColumn;
  private bool _reverse;
  public Aud_Auditoria_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Aud_Auditoria x, Aud_Auditoria y)
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
