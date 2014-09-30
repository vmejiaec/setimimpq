
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.APU
  {
  /// <summary>
  /// Acceso a los Web Services WS_APU
  /// Modulo: Apu target
  /// Tabla: Apu_Proyecto_Transporte_Indice
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto_Transporte_Indice
  {
  #region  Adapter
  private WS_APU _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_APU Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_APU();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Proyecto_Transporte_Indice> Get(string sortExpression, Scope s)
  {
  List<Apu_Proyecto_Transporte_Indice> lista = new List<Apu_Proyecto_Transporte_Indice>(Adapter.Apu_Proyecto_Transporte_Indice_Get(s));
  lista.Sort(new Apu_Proyecto_Transporte_Indice_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Proyecto_Transporte_Indice_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Transporte_Indice>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Proyecto_Transporte_Indice> lista = new List<Apu_Proyecto_Transporte_Indice> (Adapter.Apu_Proyecto_Transporte_Indice_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Proyecto_Transporte_Indice_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Transporte_Indice_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Transporte_Indice>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Proyecto_Transporte_Indice> lista = new List<Apu_Proyecto_Transporte_Indice> (Adapter.Apu_Proyecto_Transporte_Indice_GetById(s,  Id));
          lista.Sort(new Apu_Proyecto_Transporte_Indice_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Transporte_Indice_GetById(s,  Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Transporte_Indice>GetByProyecto(string sortExpression, Scope s ,string apu_proyecto_Id )
          {
          List<Apu_Proyecto_Transporte_Indice> lista = new List<Apu_Proyecto_Transporte_Indice> (Adapter.Apu_Proyecto_Transporte_Indice_GetByProyecto(s,  apu_proyecto_Id));
          lista.Sort(new Apu_Proyecto_Transporte_Indice_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyecto(Scope s ,string apu_proyecto_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Transporte_Indice_GetByProyecto(s,  apu_proyecto_Id));
          }
          #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Proyecto_Transporte_Indice
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Proyecto_Transporte_Indice o, Apu_Proyecto_Transporte_Indice original)
  {
  return Adapter.Apu_Proyecto_Transporte_Indice_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Transporte_Indice o = new Apu_Proyecto_Transporte_Indice();
  Apu_Proyecto_Transporte_Indice original = new Apu_Proyecto_Transporte_Indice();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Proyecto_Transporte_Indice
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Proyecto_Transporte_Indice o)
  {
  return Adapter.Apu_Proyecto_Transporte_Indice_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Proyecto_Transporte_Indice o = new Apu_Proyecto_Transporte_Indice();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Proyecto_Transporte_Indice
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Proyecto_Transporte_Indice o)
  {
  return Adapter.Apu_Proyecto_Transporte_Indice_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Transporte_Indice original = new Apu_Proyecto_Transporte_Indice();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Proyecto_Transporte_Indice_Comparar : IComparer<Apu_Proyecto_Transporte_Indice>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Transporte_Indice_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto_Transporte_Indice x, Apu_Proyecto_Transporte_Indice y)
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