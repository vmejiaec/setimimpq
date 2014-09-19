
   using System.Collections;
   using System.Collections.Generic;
   using System.ComponentModel;
   using System.Data;
   using HER;
using System.Security.Cryptography;
using System;
  namespace FEL.INT
  {
  /// <summary>
  /// Acceso a los Web Services WS_INT
  /// Modulo: Interface 
  /// Tabla: Int_Usuario
  /// </summary>
  [DataObject]
  public class BO_Int_Usuario
  {
  #region  Adapter
  private WS_INT _Adapter;
  /// <summary>
  /// Acceso al servicio
  /// </summary>
  public WS_INT Adapter
  {
  get
  {
  if (_Adapter == null)
  _Adapter = new WS_INT();
  return _Adapter;
  }
  }
  #endregion
  #region Obtención de datos
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario> Get(string sortExpression, Scope s)
  {
  List<Int_Usuario> lista = new List<Int_Usuario>(Adapter.Int_Usuario_Get(s));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  // Retorna un data table de objetos
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable Get(Scope s)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_Get(s));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario>GetByCodigo(string sortExpression, Scope s ,string Codigo )
  {
  List<Int_Usuario> lista = new List<Int_Usuario> (Adapter.Int_Usuario_GetByCodigo(s,  Codigo));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByCodigo(Scope s ,string Codigo)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_GetByCodigo(s,  Codigo));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario>GetById(string sortExpression, Scope s ,string Id )
  {
      
  List<Int_Usuario> lista = new List<Int_Usuario> (Adapter.Int_Usuario_GetById(s,  Id));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetById(Scope s ,string Id)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_GetById(s,  Id));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario>GetByNombre(string sortExpression, Scope s ,string Nombre )
  {
  List<Int_Usuario> lista = new List<Int_Usuario> (Adapter.Int_Usuario_GetByNombre(s,  Nombre));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByNombre(Scope s ,string Nombre)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_GetByNombre(s,  Nombre));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario>GetByNombrePassword(string sortExpression, Scope s ,string Nombre,string Password )
  {
  List<Int_Usuario> lista = new List<Int_Usuario> (Adapter.Int_Usuario_GetByNombrePassword(s, Nombre,  Password));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByNombrePassword(Scope s ,string Nombre,string Password)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_GetByNombrePassword(s, Nombre,  Password));
  }
  
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario>GetByNombrePasswordSalt(string sortExpression, Scope s ,string Nombre,string Password,string Salt )
  {
  List<Int_Usuario> lista = new List<Int_Usuario> (Adapter.Int_Usuario_GetByNombrePasswordSalt(s,Nombre,Password,  Salt));
  lista.Sort(new Int_Usuario_Comparar(sortExpression));
  return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
      public DataTable GetByNombrePasswordSalt(Scope s, string Nombre, string Password, string Salt)
  {
  return EntidadDT.GetDT(Adapter.Int_Usuario_GetByNombrePasswordSalt(s,Nombre,Password,  Salt));
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public List<Int_Usuario> GetByPersonal(string sortExpression, Scope s)
  {
      List<Int_Usuario> lista = new List<Int_Usuario>(Adapter.Int_Usuario_GetByPersonal(s));
      lista.Sort(new Int_Usuario_Comparar(sortExpression));
      return lista;
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Select, false)]
  public DataTable GetByPersonal(Scope s)
  {
      return EntidadDT.GetDT(Adapter.Int_Usuario_GetByPersonal(s));
  }
  #endregion
  #region Operacion entre datos
  // Actualiza
  /// <summary>
  /// Actualiza la tabla Int_Usuario
  /// </summary>
  /// <param name="o">Objeto que contiene la informacion a actualizar</param>
  /// <returns></returns>
  /// <param name="original"></param>
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update(Scope s,  Int_Usuario o, Int_Usuario original)
  {
  return Adapter.Int_Usuario_Update(s,o,original);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Update, false)]
  public int Update (Scope s, List<DictionaryEntry> parametros)
  {
  Int_Usuario o = new Int_Usuario();
  Int_Usuario original = new Int_Usuario();
  Navegacion.ObtenerObjetoYOriginalDeDiccionario(o, original, parametros);
  return Update(s,o, original);
  }
  // Inserta
  /// <summary>
  /// Inserta el objeto en Int_Usuario
  /// </summary>
  /// <param name="s"></param>
  /// <param name="o">Objeto a actualizar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert (Scope s, Int_Usuario o)
  {
      
      o.int_empresa_id = s.Int_Empresa_Id;      
      // Controla el error de clave primaria duplicada.
      
      byte[] randomNumber = new byte[4];
      RNGCryptoServiceProvider gen = new RNGCryptoServiceProvider();
      gen.GetBytes(randomNumber);
      UInt32 rand = BitConverter.ToUInt32(randomNumber, 0);
      o.Salt = rand.ToString();

      o.Pred_Ver_Version_Id = s.Ver_Version_Id;
      o.Pred_Int_Sucursal_Id = s.Int_Sucursal_Id;
      o.Usuario_Id_Ref = s.Int_Usuario_Id;
        return Adapter.Int_Usuario_Insert(s , o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Insert, false)]
  public string Insert(Scope s, List<DictionaryEntry>parametros)
  {
  Int_Usuario o = new Int_Usuario();
   Navegacion.ObtenerObjetoDeDiccionario(o, parametros);
  return Insert(s, o);
  }
  // Borra
  /// <summary>
  /// Borra el objeto en  Int_Usuario
  /// </summary>
  /// <param name="o">Objeto a borrar</param>
  /// <returns></returns>
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s,  Int_Usuario o)
  {
      //o.Salt = "1234";
    return Adapter.Int_Usuario_Delete(s,o);
  }
  [DataObjectMethodAttribute(DataObjectMethodType.Delete, false)]
  public int Delete(Scope s, List<DictionaryEntry> parametros)
  {
  Int_Usuario original = new Int_Usuario();
   Navegacion.ObtenerOriginalDeDiccionario(original, parametros);
  return Delete(s,original);
  }
  #endregion
  #region Ordenar la lista
  class Int_Usuario_Comparar : IComparer<Int_Usuario>
  {
  private string _sortColumn;
  private bool _reverse;
  public Int_Usuario_Comparar(string sortExpression)
  {
  _reverse = sortExpression.ToLowerInvariant().EndsWith(" desc");
  if (_reverse)
  _sortColumn = sortExpression.Substring(0, sortExpression.Length - 5);
  else
  _sortColumn = sortExpression;
  }
  public int Compare( Int_Usuario x, Int_Usuario y)
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
