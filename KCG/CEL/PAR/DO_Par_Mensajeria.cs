
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ParametrosTableAdapters;
    using AEL.PAR;
    using BEL;
    
    namespace CEL.PAR
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Mensajeria
    /// </summary>
    public class DO_Par_Mensajeria
    {
    #region Adapter
    private Par_MensajeriaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_MensajeriaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_MensajeriaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Mensajeria
    /// </summary> 
    /// <returns>Lista de objetos Par_Mensajeria</returns> 
    public List <Par_Mensajeria> Get ( Scope s )
    {
    List <Par_Mensajeria> lista= new List <Par_Mensajeria> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_MensajeriaDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Parametros.Par_MensajeriaRow fila in tabla)
      lista.Add(new Par_Mensajeria(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Fecha,
    fila.Int_Usuario_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Id_Origen,
    fila.Descripcion,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Dic_con_objeto_codigo,
    fila.Dic_con_objeto_nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_codigo,
    fila.Dic_contenedor_nombre,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Mensajeria> GetByCodigo( Scope s , string Codigo)
      {
      List <Par_Mensajeria> lista= new List <Par_Mensajeria> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_MensajeriaDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Parametros.Par_MensajeriaRow fila in tabla)
      lista.Add(new Par_Mensajeria(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Fecha,
    fila.Int_Usuario_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Id_Origen,
    fila.Descripcion,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Dic_con_objeto_codigo,
    fila.Dic_con_objeto_nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_codigo,
    fila.Dic_contenedor_nombre,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Mensajeria> GetById( Scope s , string Id)
      {
      List <Par_Mensajeria> lista= new List <Par_Mensajeria> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_MensajeriaDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Parametros.Par_MensajeriaRow fila in tabla)
      lista.Add(new Par_Mensajeria(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Fecha,
    fila.Int_Usuario_Id,
    fila.Dic_Con_Objeto_Id,
    fila.Id_Origen,
    fila.Descripcion,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Dic_con_objeto_codigo,
    fila.Dic_con_objeto_nombre,
    fila.Dic_contenedor_Id,
    fila.Dic_contenedor_codigo,
    fila.Dic_contenedor_nombre,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Par_Mensajeria
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Par_Mensajeria o)
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
          o.Fecha,
          o.Int_Usuario_Id,
          o.Dic_Con_Objeto_Id,
          o.Id_Origen,
          o.Descripcion,
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
    /// Borra el objeto de la tabla Par_Mensajeria
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Par_Mensajeria o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Fecha,
          o.Int_Usuario_Id,
          o.Dic_Con_Objeto_Id,
          o.Id_Origen,
          o.Descripcion,
          o.Estado
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Par_Mensajeria
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Par_Mensajeria o, Par_Mensajeria original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Fecha,
          o.Int_Usuario_Id,
          o.Dic_Con_Objeto_Id,
          o.Id_Origen,
          o.Descripcion,
          o.Estado,
          original.Id,
          original.Codigo,
          original.Fecha,
          original.Int_Usuario_Id,
          original.Dic_Con_Objeto_Id,
          original.Id_Origen,
          original.Descripcion,
          original.Estado
    
    );
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
