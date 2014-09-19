
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
  /// Tabla: Apu_Proyecto_Insumo
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto_Insumo
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
  public List<Apu_Proyecto_Insumo> Get(string sortExpression, Scope s)
  {
  List<Apu_Proyecto_Insumo> lista = new List<Apu_Proyecto_Insumo>(Adapter.Apu_Proyecto_Insumo_Get(s));
  lista.Sort(new Apu_Proyecto_Insumo_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Apu_Proyecto_Insumo_Get(s));
  }
  
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Apu_Proyecto_Insumo> GetBySucursal(string sortExpression, Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Insumo_Nombre, string Tipo)
          {
              List<Apu_Proyecto_Insumo> lista = new List<Apu_Proyecto_Insumo>(Adapter.Apu_Proyecto_Insumo_GetBySucursal(s, s.Int_Sucursal_Id,Codigo_Desde, Codigo_Hasta, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Insumo_Nombre, Tipo));
          lista.Sort(new Apu_Proyecto_Insumo_Comparar(sortExpression));
          return lista;
          }
          [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetBySucursal(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Insumo_Nombre, string Tipo)
          {
          return EntidadDT.GetDT(Adapter.Apu_Proyecto_Insumo_GetBySucursal(s, s.Int_Sucursal_Id,Codigo_Desde,Codigo_Hasta,Apu_Proyecto_Codigo,Apu_Proyecto_Nombre,Apu_Insumo_Nombre,Tipo));
          }
      
      #region Procedimiento Select  UNI  denominado TotalPaginas
      public int TotalPaginas(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Insumo_Nombre, string Tipo)
      {
          return Adapter.Apu_Proyecto_Insumo_TotalPaginas(s, Int_sucursal_id,  Codigo_Desde, Codigo_Hasta, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Insumo_Nombre, Tipo);
      }
      #endregion
      #endregion
  #region Ordenar la lista
  class Apu_Proyecto_Insumo_Comparar : IComparer<Apu_Proyecto_Insumo>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Insumo_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto_Insumo x, Apu_Proyecto_Insumo y)
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
