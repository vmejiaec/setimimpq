
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.VersionTableAdapters;
    using AEL.VER;
    using BEL;
    
    namespace CEL.VER
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Version ta
    /// Tabla:Ver_Doc_Estado
    /// </summary>
    public class DO_Ver_Doc_Estado
    {
    #region Adapter
    private Ver_Doc_EstadoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Ver_Doc_EstadoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Ver_Doc_EstadoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Ver_Doc_Estado
    /// </summary> 
    /// <returns>Lista de objetos Ver_Doc_Estado</returns> 
    public List <Ver_Doc_Estado> Get ( Scope s )
    {
    List <Ver_Doc_Estado> lista= new List <Ver_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Version.Ver_Doc_EstadoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Version.Ver_Doc_EstadoRow fila in tabla)
      lista.Add(new Ver_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Ver_Version_Id,
    fila.Apr_Doc_Estado_Id,
    fila.Descripcion,
    fila.ver_version_codigo,
    fila.ver_version_nombre,
    fila.Apr_doc_estado_Codigo,
    fila.Apr_doc_estado_Nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Apr_Estado_Dominio,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Ver_Doc_Estado> GetByCampo( Scope s , string Dic_campo_Id)
      {
      List <Ver_Doc_Estado> lista= new List <Ver_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Version.Ver_Doc_EstadoDataTable tabla = 
      Adapter.GetByCampo(s.Ver_Version_Id, Dic_campo_Id);
      //Carga en la lista
      foreach (Version.Ver_Doc_EstadoRow fila in tabla)
      lista.Add(new Ver_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Ver_Version_Id,
    fila.Apr_Doc_Estado_Id,
    fila.Descripcion,
    fila.ver_version_codigo,
    fila.ver_version_nombre,
    fila.Apr_doc_estado_Codigo,
    fila.Apr_doc_estado_Nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Apr_Estado_Dominio,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Ver_Doc_Estado> GetByCodigo( Scope s , string Codigo)
      {
      List <Ver_Doc_Estado> lista= new List <Ver_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Version.Ver_Doc_EstadoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Version.Ver_Doc_EstadoRow fila in tabla)
      lista.Add(new Ver_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Ver_Version_Id,
    fila.Apr_Doc_Estado_Id,
    fila.Descripcion,
    fila.ver_version_codigo,
    fila.ver_version_nombre,
    fila.Apr_doc_estado_Codigo,
    fila.Apr_doc_estado_Nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Apr_Estado_Dominio,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Ver_Doc_Estado> GetById( Scope s , string Id)
      {
      List <Ver_Doc_Estado> lista= new List <Ver_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Version.Ver_Doc_EstadoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Version.Ver_Doc_EstadoRow fila in tabla)
      lista.Add(new Ver_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Ver_Version_Id,
    fila.Apr_Doc_Estado_Id,
    fila.Descripcion,
    fila.ver_version_codigo,
    fila.ver_version_nombre,
    fila.Apr_doc_estado_Codigo,
    fila.Apr_doc_estado_Nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Apr_Estado_Dominio,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Ver_Doc_Estado
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Ver_Doc_Estado o)
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
          o.Ver_Version_Id,
          o.Estado,
          o.Apr_Doc_Estado_Id,
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
    /// Borra el objeto de la tabla Ver_Doc_Estado
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Ver_Doc_Estado o)
    {
    int resultado = Adapter.Delete(

          o.Id,
          o.Codigo,
          o.Nombre,
          o.Ver_Version_Id,
          o.Estado,
          o.Apr_Doc_Estado_Id,
          o.Descripcion
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Ver_Doc_Estado
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Ver_Doc_Estado o, Ver_Doc_Estado original)
    {
    int resultado;
    resultado=Adapter.Update(

           o.Id,
          o.Codigo,
          o.Nombre,
          o.Ver_Version_Id,
          o.Estado,
          o.Apr_Doc_Estado_Id,
          o.Descripcion,
          original.Id,
          original.Codigo,
          original.Nombre,
          original.Ver_Version_Id,
          original.Estado,
          original.Apr_Doc_Estado_Id,
          original.Descripcion
    
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
