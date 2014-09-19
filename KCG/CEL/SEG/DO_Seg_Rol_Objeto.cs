
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.SeguridadTableAdapters;
    using AEL.SEG;
    using BEL;
    
    namespace CEL.SEG
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridad 
    /// Tabla:Seg_Rol_Objeto
    /// </summary>
    public class DO_Seg_Rol_Objeto
    {
    #region Adapter
    private Seg_Rol_ObjetoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Seg_Rol_ObjetoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Seg_Rol_ObjetoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Seg_Rol_Objeto
    /// </summary> 
    /// <returns>Lista de objetos Seg_Rol_Objeto</returns> 
    public List <Seg_Rol_Objeto> Get ( Scope s )
    {
    List <Seg_Rol_Objeto> lista= new List <Seg_Rol_Objeto> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_ObjetoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_ObjetoRow fila in tabla)
      lista.Add(new Seg_Rol_Objeto(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Seg_Rol_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Tipo,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Dic_con_Objeto_Codigo,
    fila.Dic_Con_Objeto_Nombre,
    fila.Dic_Objeto_id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Tipo_nombre,
    fila.Estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Seg_Rol_Objeto> GetDataBy( Scope s , string Id)
      {
      List <Seg_Rol_Objeto> lista= new List <Seg_Rol_Objeto> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_ObjetoDataTable tabla = 
      Adapter.GetDataBy(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_ObjetoRow fila in tabla)
      lista.Add(new Seg_Rol_Objeto(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Seg_Rol_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Tipo,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Dic_con_Objeto_Codigo,
    fila.Dic_Con_Objeto_Nombre,
    fila.Dic_Objeto_id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Tipo_nombre,
    fila.Estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Seg_Rol_Objeto> GetByCodigo( Scope s , string Codigo)
      {
      List <Seg_Rol_Objeto> lista= new List <Seg_Rol_Objeto> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_ObjetoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_ObjetoRow fila in tabla)
      lista.Add(new Seg_Rol_Objeto(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Seg_Rol_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Tipo,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Dic_con_Objeto_Codigo,
    fila.Dic_Con_Objeto_Nombre,
    fila.Dic_Objeto_id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Tipo_nombre,
    fila.Estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Seg_Rol_Objeto
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Seg_Rol_Objeto o)
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
          o.Seg_Rol_Id,
          o.Dic_Con_Objeto_Id,
          o.Tipo,
          o.Estado
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
    /// Borra el objeto de la tabla Seg_Rol_Objeto
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Seg_Rol_Objeto o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Seg_Rol_Id,
          o.Dic_Con_Objeto_Id,
          o.Tipo,
          o.Estado
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Seg_Rol_Objeto
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Seg_Rol_Objeto o, Seg_Rol_Objeto original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Seg_Rol_Id,
          o.Dic_Con_Objeto_Id,
          o.Tipo,
          o.Estado,
          original.Id,
          original.Codigo,
          original.Seg_Rol_Id,
          original.Dic_Con_Objeto_Id,
          original.Tipo,
          original.Estado
    
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
