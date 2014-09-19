
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
  namespace FEL.HIS
  {
  /// <summary>
  /// Acceso a los Web Services WS_HIS
  /// Modulo: Historico 
  /// Tabla: His_Historico
  /// </summary>
  [DataObject]
  public class BO_His_Historico
  {
  #region  Adapter

  private WS_HIS
      _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_HIS Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_HIS();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<His_Historico> Get(string sortExpression, Scope s)
  {
  List<His_Historico> lista = new List<His_Historico>(Adapter.His_Historico_Get(s));
  lista.Sort(new His_Historico_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.His_Historico_Get(s));
  }
  #endregion
  #region Operacion entre datos
   // Inserta
  /// <summary>
  /// Inserta el objeto en His_Historico
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, His_Historico o)
  {
  return Adapter.His_Historico_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  His_Historico o = new His_Historico();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  #endregion
  #region Ordenar la lista
  class His_Historico_Comparar : IComparer<His_Historico>
  {
  private string _sortColumn;
  private bool _reverse;
  public His_Historico_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( His_Historico x, His_Historico y)
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
