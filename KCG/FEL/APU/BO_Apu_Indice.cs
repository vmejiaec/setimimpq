
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
  /// Tabla: Apu_Indice
  /// </summary>
  [DataObject]
  public class BO_Apu_Indice
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
  public List<Apu_Indice> Get(string sortExpression, Scope s)
  {
  List<Apu_Indice> lista = new List<Apu_Indice>(Adapter.Apu_Indice_Get(s));
  lista.Sort(new Apu_Indice_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Indice_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Indice>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Apu_Indice> lista = new List<Apu_Indice> (Adapter.Apu_Indice_GetByCodigo(s,  Codigo));
  lista.Sort(new Apu_Indice_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Apu_Indice_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Indice>GetByEmpresa(string sortExpression, Scope s )
  {
  List<Apu_Indice> lista = new List<Apu_Indice> (Adapter.Apu_Indice_GetByEmpresa(s));
  lista.Sort(new Apu_Indice_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByEmpresa(Scope s )
  {
  return EntidadDT.GetDT(Adapter.Apu_Indice_GetByEmpresa(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Indice>GetById(string sortExpression, Scope s ,string Id )
  {
  List<Apu_Indice> lista = new List<Apu_Indice> (Adapter.Apu_Indice_GetById(s,  Id));
  lista.Sort(new Apu_Indice_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Apu_Indice_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Indice>GetByVariosN(string sortExpression, Scope s ,string Int_Empresa_Id )
  {
  List<Apu_Indice> lista = new List<Apu_Indice> (Adapter.Apu_Indice_GetByVariosN(s));
  lista.Sort(new Apu_Indice_Comparar(sortExpression));
  return lista;
  }
   [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Indice> GetByLikeSoloMaterial(string sortExpression, Scope s, string nombre)
      {
          List<Apu_Indice> lista = new List<Apu_Indice>(Adapter.Apu_Indice_GetByLikeSoloMaterial(s, nombre));
          lista.Sort(new Apu_Indice_Comparar(sortExpression));
          return lista;
      }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByVariosN(Scope s ,string Int_Empresa_Id)
  {
  return EntidadDT.GetDT(Adapter.Apu_Indice_GetByVariosN(s));
  }

  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Apu_Indice> GetByLikeNombreCatalogo(string sortExpression, Scope s, string Fis_Catalogo_Id, string Apu_Indice_Nombre)
  {
      List<Apu_Indice> lista = new List<Apu_Indice>(Adapter.Apu_Indice_GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Indice_Nombre));
      lista.Sort(new Apu_Indice_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Indice_Nombre)
  {
      return EntidadDT.GetDT(Adapter.Apu_Indice_GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Apu_Indice_Nombre));
  }
  #endregion
  #region Procedimientos
      public int UpdateVariosN(Scope s, string p_Int_Empresa_Id)
  {
      return Adapter.Apu_Indice_UpdateVariosN(s);
  }
      public int ExisteRegistros(Scope s, string p_Int_Empresa_Id)
  {
      return Adapter.Apu_Indice_ExisteRegistros(s);
  }
      #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Indice
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Indice o, Apu_Indice original)
  {
  return Adapter.Apu_Indice_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Indice o = new Apu_Indice();
  Apu_Indice original = new Apu_Indice();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Indice
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Indice o)
  {
  	o.Int_Empresa_Id = s.Int_Empresa_Id;
	return Adapter.Apu_Indice_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Indice o = new Apu_Indice();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Indice
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Indice o)
  {
  return Adapter.Apu_Indice_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Indice original = new Apu_Indice();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Indice_Comparar : IComparer<Apu_Indice>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Indice_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Indice x, Apu_Indice y)
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
