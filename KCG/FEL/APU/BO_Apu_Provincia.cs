
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
  /// Tabla: Apu_Provincia
  /// </summary>
  [DataObject]
  public class BO_Apu_Provincia
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
  public List<Apu_Provincia> Get(string sortExpression, Scope s)
  {
  List<Apu_Provincia> lista = new List<Apu_Provincia>(Adapter.Apu_Provincia_Get(s));
  lista.Sort(new Apu_Provincia_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Provincia_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Provincia>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Apu_Provincia> lista = new List<Apu_Provincia> (Adapter.Apu_Provincia_GetByCodigo(s,  Codigo));
  lista.Sort(new Apu_Provincia_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Apu_Provincia_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Provincia>GetByEmpresa(string sortExpression, Scope s )
  {
  List<Apu_Provincia> lista = new List<Apu_Provincia> (Adapter.Apu_Provincia_GetByEmpresa(s));
  lista.Sort(new Apu_Provincia_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Provincia_GetByEmpresa(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Provincia>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Apu_Provincia> lista = new List<Apu_Provincia> (Adapter.Apu_Provincia_GetById(s,  Id));
  lista.Sort(new Apu_Provincia_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Apu_Provincia_GetById(s,  Id));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Provincia> GetByPredeterminadaS(string sortExpression, Scope s)
  {
      List<Apu_Provincia> lista = new List<Apu_Provincia>(Adapter.Apu_Provincia_GetByPredeterminadaS(s));
      lista.Sort(new Apu_Provincia_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByPredeterminadaS(Scope s)
  {
      return EntidadDT.GetDT(Adapter.Apu_Provincia_GetByPredeterminadaS(s));
  } 
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Provincia
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Provincia o, Apu_Provincia original)
  {
  return Adapter.Apu_Provincia_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Provincia o = new Apu_Provincia();
  Apu_Provincia original = new Apu_Provincia();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Provincia
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Provincia o)
  {
      o.Int_Empresa_Id = s.Int_Empresa_Id;//Escribir la Empresa del Scope al Original
      return Adapter.Apu_Provincia_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Provincia o = new Apu_Provincia();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Provincia
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Provincia o)
  {
  return Adapter.Apu_Provincia_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Provincia original = new Apu_Provincia();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Provincia_Comparar : IComparer<Apu_Provincia>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Provincia_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Provincia x, Apu_Provincia y)
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
