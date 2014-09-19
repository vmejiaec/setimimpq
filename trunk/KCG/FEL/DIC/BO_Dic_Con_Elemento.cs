
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
  /// Tabla: Dic_Con_Elemento
  /// </summary>
  [DataObject]
  public class BO_Dic_Con_Elemento
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
  public List<Dic_Con_Elemento> Get(string sortExpression, Scope s)
  {
  List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento>(Adapter.Dic_Con_Elemento_Get(s));
  lista.Sort(new Dic_Con_Elemento_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Elemento_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Elemento>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento> (Adapter.Dic_Con_Elemento_GetByCodigo(s,  Codigo));
  lista.Sort(new Dic_Con_Elemento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Elemento_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Elemento>GetByContenedor(string sortExpression, Scope s ,string dic_Contenedor_id )
  {
  List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento> (Adapter.Dic_Con_Elemento_GetByContenedor(s,  dic_Contenedor_id));
  lista.Sort(new Dic_Con_Elemento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByContenedor(Scope s ,string dic_Contenedor_id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Elemento_GetByContenedor(s,  dic_Contenedor_id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Dic_Con_Elemento>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento> (Adapter.Dic_Con_Elemento_GetById(s,  Id));
  lista.Sort(new Dic_Con_Elemento_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Dic_Con_Elemento_GetById(s,  Id));
  }

  public List<Dic_Con_Elemento> GetByTipoLikeEtiqueta(string sortExpression, Scope s, string Tipo, string Nombre)
  {
      List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento>(Adapter.Dic_Con_Elemento_GetByTipoLikeEtiqueta(s, Tipo, Nombre));
      lista.Sort(new Dic_Con_Elemento_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByTipoLikeEtiqueta(Scope s, string Tipo, string Nombre)
  {
      return EntidadDT.GetDT(Adapter.Dic_Con_Elemento_GetByTipoLikeEtiqueta(s, Tipo, Nombre));
  }


  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Dic_Con_Elemento
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Dic_Con_Elemento o, Dic_Con_Elemento original)
  {
  return Adapter.Dic_Con_Elemento_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Con_Elemento o = new Dic_Con_Elemento();
  Dic_Con_Elemento original = new Dic_Con_Elemento();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Dic_Con_Elemento
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Dic_Con_Elemento o)
  {
  return Adapter.Dic_Con_Elemento_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Dic_Con_Elemento o = new Dic_Con_Elemento();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Dic_Con_Elemento
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Dic_Con_Elemento o)
  {
  return Adapter.Dic_Con_Elemento_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Dic_Con_Elemento original = new Dic_Con_Elemento();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Dic_Con_Elemento_Comparar : IComparer<Dic_Con_Elemento>
  {
  private string _sortColumn;
  private bool _reverse;
  public Dic_Con_Elemento_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Dic_Con_Elemento x, Dic_Con_Elemento y)
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
