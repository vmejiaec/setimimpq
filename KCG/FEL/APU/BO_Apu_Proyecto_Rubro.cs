
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
  /// Tabla: Apu_Proyecto_Rubro
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto_Rubro
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
  public List<Apu_Proyecto_Rubro> Get(string sortExpression, Scope s)
  {
  List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>(Adapter.Apu_Proyecto_Rubro_Get(s));
  lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Rubro>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro> (Adapter.Apu_Proyecto_Rubro_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Rubro>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro> (Adapter.Apu_Proyecto_Rubro_GetById(s,  Id));
          lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_GetById(s,  Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Rubro>GetByProyecto(string sortExpression, Scope s ,string Apu_Proyecto_Id )
          {
          List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro> (Adapter.Apu_Proyecto_Rubro_GetByProyecto(s,  Apu_Proyecto_Id));
          lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyecto(Scope s ,string Apu_Proyecto_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_GetByProyecto(s,  Apu_Proyecto_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Rubro> GetBySucursal(string sortExpression, Scope s, string Int_Sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
          {
          List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro> (Adapter.Apu_Proyecto_Rubro_GetBySucursal(s,  s.Int_Sucursal_Id, Apu_Proyecto_Codigo,  Apu_Proyecto_Nombre,  Apu_Rubro_Codigo,  Apu_Rubro_Nombre,  Apu_Subtitulo_Nombre,  Apu_Titulo_Nombre ));
          lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetBySucursal(Scope s, string Int_Sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_GetBySucursal(s, Int_Sucursal_id, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre));
          }
          public int TotalPaginas(Scope s, string Int_Sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
      {
          return Adapter.Apu_Proyecto_Rubro_TotalPaginas( s,  Int_Sucursal_id,  Apu_Proyecto_Codigo,  Apu_Proyecto_Nombre,  Apu_Rubro_Codigo,  Apu_Rubro_Nombre,  Apu_Subtitulo_Nombre,  Apu_Titulo_Nombre);
      }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Rubro> GetByProyecto_Oferta(string sortExpression, Scope s, string apu_proyecto_id, string Apu_Oferta_Id)
          {
              List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>(Adapter.Apu_Proyecto_Rubro_GetByProyecto_Oferta(s,apu_proyecto_id, Apu_Oferta_Id));
              lista.Sort(new Apu_Proyecto_Rubro_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyecto_Oferta(Scope s, string apu_proyecto_id, string Apu_Oferta_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_Rubro_GetByProyecto_Oferta(s,apu_proyecto_id,  Apu_Oferta_Id));
          }


          #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Proyecto_Rubro
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Proyecto_Rubro o, Apu_Proyecto_Rubro original)
  {
  return Adapter.Apu_Proyecto_Rubro_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Rubro o = new Apu_Proyecto_Rubro();
  Apu_Proyecto_Rubro original = new Apu_Proyecto_Rubro();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Proyecto_Rubro
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Proyecto_Rubro o)
  {
  return Adapter.Apu_Proyecto_Rubro_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Proyecto_Rubro o = new Apu_Proyecto_Rubro();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Proyecto_Rubro
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Proyecto_Rubro o)
  {
  return Adapter.Apu_Proyecto_Rubro_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Rubro original = new Apu_Proyecto_Rubro();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Proyecto_Rubro_Comparar : IComparer<Apu_Proyecto_Rubro>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Rubro_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto_Rubro x, Apu_Proyecto_Rubro y)
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
