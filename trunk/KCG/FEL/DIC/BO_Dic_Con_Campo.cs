
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
  /// Tabla: Dic_Con_Campo
  /// </summary>
  [DataObject]
  public class BO_Dic_Con_Campo
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
  public List<Dic_Con_Campo> Get(string sortExpression, Scope s)
  {
  List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>(Adapter.Dic_Con_Campo_Get(s));
  lista.Sort(new Dic_Con_Campo_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Campo_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Campo>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_Con_Campo> lista = new List<Dic_Con_Campo> (Adapter.Dic_Con_Campo_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_Con_Campo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Campo_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Dic_Con_Campo> GetByConObjeto(string sortExpression, Scope s, string Dic_Con_Objeto_Id, string int_usuario_id)
  {
      List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>(Adapter.Dic_Con_Campo_GetByConObjeto(s, Dic_Con_Objeto_Id, int_usuario_id));
  lista.Sort(new Dic_Con_Campo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByConObjeto(Scope s, string Dic_Con_Objeto_Id, string int_usuario_id)
  {
      return EntidadDT.GetDT(Adapter.Dic_Con_Campo_GetByConObjeto(s, Dic_Con_Objeto_Id, int_usuario_id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Campo>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_Con_Campo> lista = new List<Dic_Con_Campo> (Adapter.Dic_Con_Campo_GetById(s,  Id));
  lista.Sort(new Dic_Con_Campo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Campo_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Campo>GetByObjeto(string sortExpression, Scope s ,string con_Objeto_id )
  {
  List<Dic_Con_Campo> lista = new List<Dic_Con_Campo> (Adapter.Dic_Con_Campo_GetByObjeto(s,  con_Objeto_id));
  lista.Sort(new Dic_Con_Campo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByObjeto(Scope s ,string con_Objeto_id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Campo_GetByObjeto(s,  con_Objeto_id));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_Con_Campo
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_Con_Campo o, Dic_Con_Campo original)
  {
  return Adapter.Dic_Con_Campo_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Con_Campo o = new Dic_Con_Campo();
  Dic_Con_Campo original = new Dic_Con_Campo();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_Con_Campo
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_Con_Campo o)
  {
  return Adapter.Dic_Con_Campo_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_Con_Campo o = new Dic_Con_Campo();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_Con_Campo
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_Con_Campo o)
  {
  return Adapter.Dic_Con_Campo_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Con_Campo original = new Dic_Con_Campo();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Dic_Con_Campo_Comparar : IComparer<Dic_Con_Campo>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_Con_Campo_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_Con_Campo x, Dic_Con_Campo y)
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
