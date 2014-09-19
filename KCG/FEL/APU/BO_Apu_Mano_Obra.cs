
   using System;
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
  /// Tabla: Apu_Mano_Obra
  /// </summary>
  [DataObject]
  public class BO_Apu_Mano_Obra
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
  public List<Apu_Mano_Obra> Get(string sortExpression, Scope s)
  {
  List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>(Adapter.Apu_Mano_Obra_Get(s));
  lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetByEmpresa(string sortExpression, Scope s )
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetByEmpresa(s));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByEmpresa(Scope s )
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByEmpresa(s));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetById(s,  Id));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetById(s,  Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetByLikeNombre(string sortExpression, Scope s ,string nombre, string int_sucursal_Id )
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetByLikeNombre(s,nombre,  int_sucursal_Id));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeNombre(Scope s ,string nombre, string int_sucursal_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByLikeNombre(s, nombre,  int_sucursal_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetByNombre(string sortExpression, Scope s ,string nombre,string int_sucursal_Id )
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetByNombre(s, nombre,  int_sucursal_Id));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByNombre(Scope s ,string nombre, string int_sucursal_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByNombre(s,nombre,  int_sucursal_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra> GetByProyectoRubroMano_Obra(string sortExpression, Scope s, string Apu_Proyecto_Rubro_id, string Apu_Mano_Obra_Id)
          {
              List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>(Adapter.Apu_Mano_Obra_GetByProyectoRubroMano_Obra(s, Apu_Proyecto_Rubro_id, Apu_Mano_Obra_Id));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyectoRubroMano_Obra(Scope s, string Apu_Proyecto_Rubro_id, string Apu_Mano_Obra_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByProyectoRubroMano_Obra(s, Apu_Proyecto_Rubro_id, Apu_Mano_Obra_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra>GetBySucursal(string sortExpression, Scope s)
          {
          List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra> (Adapter.Apu_Mano_Obra_GetBySucursal(s, s.Int_Sucursal_Id));
          lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetBySucursal(Scope s)
          {
          return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetBySucursal(s, s.Int_Sucursal_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Mano_Obra> GetByOfertaRubroManoObra(string sortExpression, Scope s, string Apu_Oferta_Rubro_Id, string Apu_Mano_Obra_Id)
          {
              List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>(Adapter.Apu_Mano_Obra_GetByOfertaRubroManoObra(s,Apu_Oferta_Rubro_Id, Apu_Mano_Obra_Id));
              lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByOfertaRubroManoObra(Scope s, string Apu_Oferta_Rubro_Id, string Apu_Mano_Obra_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByOfertaRubroManoObra(s, Apu_Oferta_Rubro_Id, Apu_Mano_Obra_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Mano_Obra> GetByLikeNombreCatalogo(string sortExpression, Scope s, string Fis_Catalogo_Id, string Nombre)
          {
              List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>(Adapter.Apu_Mano_Obra_GetByLikeNombreCatalogo(s,Fis_Catalogo_Id, Nombre));
              lista.Sort(new Apu_Mano_Obra_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeNombreCatalogo(Scope s, string Fis_Catalogo_Id, string Nombre)
          {
              return EntidadDT.GetDT(Adapter.Apu_Mano_Obra_GetByLikeNombreCatalogo(s, Fis_Catalogo_Id, Nombre));
          }
          #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Mano_Obra
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Mano_Obra o, Apu_Mano_Obra original)
  {
      o.Fecha_Update = DateTime.Now;//Asignación de la fecha actual al original
      o.Update_Per_Personal_Id = s.Per_Personal_Id;//Asignación de la persona_id al original      
      return Adapter.Apu_Mano_Obra_Update(s, o, original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Mano_Obra o = new Apu_Mano_Obra();
  Apu_Mano_Obra original = new Apu_Mano_Obra();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Mano_Obra
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Mano_Obra o)
  {
      o.Int_Sucursal_Id = s.Int_Sucursal_Id;
      o.Int_Moneda_Id = s.Int_Moneda_Id;
      o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
      o.Fecha_Creacion = DateTime.Now;
      o.Fecha_Update = DateTime.Now;
      o.Update_Per_Personal_Id = s.Per_Personal_Id;//Adición de algunos campos del Scope al original      
      return Adapter.Apu_Mano_Obra_Insert(s, o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Mano_Obra o = new Apu_Mano_Obra();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Mano_Obra
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Mano_Obra o)
  {
  return Adapter.Apu_Mano_Obra_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Mano_Obra original = new Apu_Mano_Obra();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Mano_Obra_Comparar : IComparer<Apu_Mano_Obra>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Mano_Obra_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Mano_Obra x, Apu_Mano_Obra y)
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
