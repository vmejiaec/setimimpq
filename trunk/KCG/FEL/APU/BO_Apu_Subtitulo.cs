
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
  /// Tabla: Apu_Subtitulo
  /// </summary>
  [DataObject]
  public class BO_Apu_Subtitulo
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
  public List<Apu_Subtitulo> Get(string sortExpression, Scope s)
  {
  List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>(Adapter.Apu_Subtitulo_Get(s));
  lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Subtitulo_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Subtitulo>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Apu_Subtitulo> lista = new List<Apu_Subtitulo> (Adapter.Apu_Subtitulo_GetByCodigo(s,  Codigo));
  lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Apu_Subtitulo_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Subtitulo>GetByEmpresa(string sortExpression, Scope s )
  {
  List<Apu_Subtitulo> lista = new List<Apu_Subtitulo> (Adapter.Apu_Subtitulo_GetByEmpresa(s, s.Int_Empresa_Id));
  lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Subtitulo_GetByEmpresa(s, s.Int_Empresa_Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Subtitulo>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Apu_Subtitulo> lista = new List<Apu_Subtitulo> (Adapter.Apu_Subtitulo_GetById(s,  Id));
  lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Apu_Subtitulo_GetById(s,  Id));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Subtitulo> GetByLikeNombre(string sortExpression, Scope s,string Apu_Titulo_Id, string Nombre)
  {
      List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>(Adapter.Apu_Subtitulo_GetByLikeNombre(s,Apu_Titulo_Id, Nombre));
      lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByLikeNombre(Scope s,string Apu_Titulo_Id, string Nombre)
  {
      return EntidadDT.GetDT(Adapter.Apu_Subtitulo_GetByLikeNombre(s,Apu_Titulo_Id, Nombre));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Subtitulo> GetByOnlyPredeterminadaOfertaRubro(string sortExpression, Scope s)
  {
      List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>(Adapter.Apu_Subtitulo_GetByOnlyPredeterminadaOfertaRubro(s));
      lista.Sort(new Apu_Subtitulo_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByOnlyPredeterminadaOfertaRubro(Scope s)
  {
      return EntidadDT.GetDT(Adapter.Apu_Subtitulo_GetByOnlyPredeterminadaOfertaRubro(s));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Subtitulo
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Subtitulo o, Apu_Subtitulo original)
  {
  return Adapter.Apu_Subtitulo_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Subtitulo o = new Apu_Subtitulo();
  Apu_Subtitulo original = new Apu_Subtitulo();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Subtitulo
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Subtitulo o)
  {
  return Adapter.Apu_Subtitulo_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Subtitulo o = new Apu_Subtitulo();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Subtitulo
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Subtitulo o)
  {
  return Adapter.Apu_Subtitulo_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Subtitulo original = new Apu_Subtitulo();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Subtitulo_Comparar : IComparer<Apu_Subtitulo>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Subtitulo_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Subtitulo x, Apu_Subtitulo y)
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
