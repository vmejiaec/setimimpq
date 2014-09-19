
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
  /// Tabla: Apu_Proyecto_Material
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto_Material
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
  public List<Apu_Proyecto_Material> Get(string sortExpression, Scope s)
  {
  List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material>(Adapter.Apu_Proyecto_Material_Get(s));
  lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material> (Adapter.Apu_Proyecto_Material_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material>GetById(string sortExpression, Scope s ,string Id )
          {
          List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material> (Adapter.Apu_Proyecto_Material_GetById(s,  Id));
          lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetById(s,  Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material>GetByMaterial(string sortExpression, Scope s ,string apu_material_Id )
          {
          List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material> (Adapter.Apu_Proyecto_Material_GetByMaterial(s,  apu_material_Id));
          lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByMaterial(Scope s ,string apu_material_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByMaterial(s,  apu_material_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material>GetByProyecto(string sortExpression, Scope s ,string apu_proyecto_Id )
          {
          List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material> (Adapter.Apu_Proyecto_Material_GetByProyecto(s,  apu_proyecto_Id));
          lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyecto(Scope s ,string apu_proyecto_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByProyecto(s,  apu_proyecto_Id));
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material> GetByProyectoMaterial(string sortExpression, Scope s, string Apu_Proyecto_Id, string apu_material_Id)
          {
              List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material>(Adapter.Apu_Proyecto_Material_GetByProyectoMaterial(s,Apu_Proyecto_Id, apu_material_Id));
              lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyectoMaterial(Scope s, string Apu_Proyecto_Id, string apu_material_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByProyectoMaterial(s, Apu_Proyecto_Id, apu_material_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material> GetByUpdateCosto(string sortExpression, Scope s, string Apu_Proyecto_Id)
          {
              List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material>(Adapter.Apu_Proyecto_Material_GetByUpdateCosto(s, Apu_Proyecto_Id));
              lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByUpdateCosto(Scope s, string Apu_Proyecto_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByUpdateCosto(s, Apu_Proyecto_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Proyecto_Material> GetByProyecto_Oferta(string sortExpression, Scope s, string apu_proyecto_id, string apu_oferta_Id)
          {
              List<Apu_Proyecto_Material> lista = new List<Apu_Proyecto_Material>(Adapter.Apu_Proyecto_Material_GetByProyecto_Oferta(s, apu_proyecto_id, apu_oferta_Id));
              lista.Sort(new Apu_Proyecto_Material_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByProyecto_Oferta(Scope s, string apu_proyecto_id, string apu_oferta_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Proyecto_Material_GetByProyecto_Oferta(s, apu_proyecto_id, apu_oferta_Id));
          }
          #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Apu_Proyecto_Material
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Proyecto_Material o, Apu_Proyecto_Material original)
  {
  return Adapter.Apu_Proyecto_Material_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Material o = new Apu_Proyecto_Material();
  Apu_Proyecto_Material original = new Apu_Proyecto_Material();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Proyecto_Material
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Proyecto_Material o)
  {
  return Adapter.Apu_Proyecto_Material_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Proyecto_Material o = new Apu_Proyecto_Material();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Proyecto_Material
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Proyecto_Material o)
  {
  return Adapter.Apu_Proyecto_Material_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Proyecto_Material original = new Apu_Proyecto_Material();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Proyecto_Material_Comparar : IComparer<Apu_Proyecto_Material>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Material_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto_Material x, Apu_Proyecto_Material y)
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
