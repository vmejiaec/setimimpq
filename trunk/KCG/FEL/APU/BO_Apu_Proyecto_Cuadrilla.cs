
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
  /// Tabla: Apu_Proyecto_Cuadrilla
  /// </summary>
  [DataObject]
  public class BO_Apu_Proyecto_Cuadrilla
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
      public List<Apu_Proyecto_Cuadrilla> Get(string sortExpression, Scope s, string apu_proyecto_id)
  {
  List<Apu_Proyecto_Cuadrilla> lista = new List<Apu_Proyecto_Cuadrilla>(Adapter.Apu_Proyecto_Cuadrilla_Get(s, apu_proyecto_id));
  lista.Sort(new Apu_Proyecto_Cuadrilla_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable Get(Scope s, string apu_proyecto_id)
  {
      return EntidadDT.GetDT(Adapter.Apu_Proyecto_Cuadrilla_Get(s, apu_proyecto_id));
  }
  #endregion
  
  #region Ordenar la lista
  class Apu_Proyecto_Cuadrilla_Comparar : IComparer<Apu_Proyecto_Cuadrilla>
  {
  private string _sortColumn;
  private bool _reverse;
  public Apu_Proyecto_Cuadrilla_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Apu_Proyecto_Cuadrilla x, Apu_Proyecto_Cuadrilla y)
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