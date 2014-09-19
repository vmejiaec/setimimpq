
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
   using System;
  namespace FEL.APU
  {
  /// <summary>
  /// Acceso a los Web Services WS_APU
  /// Modulo: Apu target
  /// Tabla: Apu_Oferta
  /// </summary>
  [DataObject]
  public class BO_Apu_Oferta
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
  public List<Apu_Oferta> Get(string sortExpression, Scope s)
  {
  List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_Get(s));
  lista.Sort(new Apu_Oferta_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Oferta_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta>GetByCodigo(string sortExpression, Scope s ,string Codigo )
          {
          List<Apu_Oferta> lista = new List<Apu_Oferta> (Adapter.Apu_Oferta_GetByCodigo(s,  Codigo));
          lista.Sort(new Apu_Oferta_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByCodigo(Scope s ,string Codigo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByCodigo(s,  Codigo));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta>GetById(string sortExpression, Scope s ,string Apu_Oferta_Id )
          {
          List<Apu_Oferta> lista = new List<Apu_Oferta> (Adapter.Apu_Oferta_GetById(s,  Apu_Oferta_Id));
          lista.Sort(new Apu_Oferta_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetById(Scope s ,string Apu_Oferta_Id)
          {
          return EntidadDT.GetDT(Adapter.Apu_Oferta_GetById(s,  Apu_Oferta_Id));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByIdResumido(string sortExpression, Scope s, string Apu_Oferta_Id)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByIdResumido(s, Apu_Oferta_Id));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByIdResumido(Scope s, string Apu_Oferta_Id)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByIdResumido(s, Apu_Oferta_Id));
          }
          
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetBySucursal(string sortExpression, Scope s,  string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetBySucursal(s, Codigo_Desde, Codigo_Hasta, Estado, Nombre, Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado));
          lista.Sort(new Apu_Oferta_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
              
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetBySucursal(s,Codigo_Desde, Codigo_Hasta, Estado, Nombre,  Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado));
              
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByLikeCodigoDesde(string sortExpression, Scope s, string desde_Codigo)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByLikeCodigoDesde(s, desde_Codigo));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoDesde(Scope s, string desde_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByLikeCodigoDesde(s, desde_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByLikeCodigoDesdeHasta(string sortExpression, Scope s, string desde_Codigo, string hasta_Codigo)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByLikeCodigoDesdeHasta(s, desde_Codigo, hasta_Codigo));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByLikeCodigoDesdeHasta(s,desde_Codigo,hasta_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByLikeCodigoHasta(string sortExpression, Scope s, string hasta_Codigo)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByLikeCodigoHasta(s, hasta_Codigo));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByLikeCodigoHasta(s, hasta_Codigo));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByLikeNombre(string sortExpression, Scope s, string Nombre)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByLikeNombre(s, Nombre));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByLikeNombre(Scope s, string Nombre)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByLikeNombre(s, Nombre));
          }

          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public List<Apu_Oferta> GetByEstado(string sortExpression, Scope s, string Nombre, string Estado)
          {
              List<Apu_Oferta> lista = new List<Apu_Oferta>(Adapter.Apu_Oferta_GetByEstado(s,Nombre, Estado));
              lista.Sort(new Apu_Oferta_Comparar(sortExpression));
              return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
          public DataTable GetByEstado(Scope s, string Nombre,  string Estado)
          {
              return EntidadDT.GetDT(Adapter.Apu_Oferta_GetByEstado(s,Nombre, Estado));
          }

        #region Procedimiento Select  UNI  denominado TotalPaginas
      public int TotalPaginas(Scope s,  string Codigo_Desde, string Codigo_Hasta, string Etapa, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
            {
            return Adapter.Apu_Oferta_TotalPaginas(s, Codigo_Desde, Codigo_Hasta, Etapa, Nombre,  Contratista, Tecnico_Per_Personal_Nombre, Apu_Lugar_Nombre, Apu_Provincia_Nombre, Apu_Presupuesto_Estado);
            }
        #endregion

       #endregion
  #region Operacion entre datos
  
  /// <summary>
  /// Clonación de una oferta
  /// </summary>
  /// <param name="s"></param>
  /// <param name="Apu_Oferta_Id">El Id de la oferta a clonar</param>
  /// <returns></returns>
  public String Clonar(Scope s, String Apu_Oferta_Id)
  {
      return Adapter.Apu_Oferta_Clonar(s,Apu_Oferta_Id);
  }
  
  /// <summary>
  /// Actualiza la tabla Apu_Oferta
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Apu_Oferta o, Apu_Oferta original)
  {
  return Adapter.Apu_Oferta_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Oferta o = new Apu_Oferta();
  Apu_Oferta original = new Apu_Oferta();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Apu_Oferta
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Apu_Oferta o)
  {
  return Adapter.Apu_Oferta_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Apu_Oferta o = new Apu_Oferta();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Apu_Oferta
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Apu_Oferta o)
  {
  return Adapter.Apu_Oferta_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Apu_Oferta original = new Apu_Oferta();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Apu_Oferta_Comparar : IComparer<Apu_Oferta>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Oferta_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Oferta x, Apu_Oferta y)
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
