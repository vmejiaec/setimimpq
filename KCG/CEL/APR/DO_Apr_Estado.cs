
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.AprobacionTableAdapters;
    using AEL.APR;
    using BEL;
    
    namespace CEL.APR
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Aprobacion
    /// Tabla:Apr_Estado
    /// </summary>
    public class DO_Apr_Estado
    {
    #region Adapter
    private Apr_EstadoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apr_EstadoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apr_EstadoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apr_Estado
    /// </summary> 
    /// <returns>Lista de objetos Apr_Estado</returns> 
    public List <Apr_Estado> Get ( Scope s )
    {
    List <Apr_Estado> lista= new List <Apr_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_EstadoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Aprobacion.Apr_EstadoRow fila in tabla)
      lista.Add(new Apr_Estado(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Dominio,
    fila.Descripcion,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apr_Estado> GetByCodigo( Scope s , string Codigo)
      {
      List <Apr_Estado> lista= new List <Apr_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_EstadoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Aprobacion.Apr_EstadoRow fila in tabla)
      lista.Add(new Apr_Estado(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Dominio,
    fila.Descripcion,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apr_Estado> GetById( Scope s , string Id)
      {
      List <Apr_Estado> lista= new List <Apr_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_EstadoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Aprobacion.Apr_EstadoRow fila in tabla)
      lista.Add(new Apr_Estado(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Dominio,
    fila.Descripcion,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Apr_Estado
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apr_Estado o)
    {
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
o.GenCodigo(s.Ver_Version_Id);
    o.GenEstado();
    // Controla el error de clave primaria duplicada.
    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Nombre,
          o.Dominio,
          o.Estado,
          o.Descripcion
    );
    }
    catch (SqlException e)
    {
    switch (e.Number)
    {
    // Si el error es de violación PK, entonces repite.
    case 2627:
    string mensaje = e.Errors[0].Message;
    if (mensaje.StartsWith(
    Textos._ERR_VIOLATION_UNIQUE_KEY)
    )
    return Insert(s, o);
    else
    throw;
    break;
    default:
    throw;
    }
    }
    //Control de Auditoria
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Apr_Estado
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apr_Estado o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Nombre,
          o.Dominio,
          o.Estado,
          o.Descripcion
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apr_Estado
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apr_Estado o, Apr_Estado original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Nombre,
          o.Dominio,
          o.Estado,
          o.Descripcion,
          original.Id,
          original.Codigo,
          original.Nombre,
          original.Dominio,
          original.Estado,
          original.Descripcion
    
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
