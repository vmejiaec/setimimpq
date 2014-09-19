
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.PAR
  {
  /// <summary>
  /// Acceso a los Web Services WS_PAR
  /// Modulo: Parametros
  /// Tabla: Par_Recursos
  /// </summary>
  [DataObject]
  public class BO_Par_Recursos
  {
  #region  Adapter
  private WS_PAR _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_PAR Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_PAR();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public List<Par_Recursos> GetByContenedor(string sortExpression, Scope s, string dic_contenedor_id)
  {
  List<Par_Recursos> lista = new List<Par_Recursos>(Adapter.Par_Recursos_GetByContenedor(s,dic_contenedor_id));
  lista.Sort(new Par_Recursos_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByContenedor(Scope s, string dic_contenedor_id)
  {
      return EntidadDT.GetDT(Adapter.Par_Recursos_GetByContenedor(s, dic_contenedor_id));
  }
  #endregion
  #region Ordenar la lista
  class Par_Recursos_Comparar : IComparer<Par_Recursos>
  {
  private string _sortColumn;
  private bool _reverse;
  public Par_Recursos_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Par_Recursos x, Par_Recursos y)
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
