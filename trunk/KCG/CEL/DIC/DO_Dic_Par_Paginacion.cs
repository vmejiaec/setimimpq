
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.DiccionarioTableAdapters;
    using AEL.DIC;
    using BEL;
    
    namespace CEL.DIC
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Diccionario
    /// Tabla:Dic_Par_Paginacion
    /// </summary>
    public class DO_Dic_Par_Paginacion
    {
    #region Adapter
    private Dic_Par_PaginacionTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Dic_Par_PaginacionTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Dic_Par_PaginacionTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Dic_Par_Paginacion
    /// </summary> 
    /// <returns>Lista de objetos Dic_Par_Paginacion</returns> 
    public List <Dic_Par_Paginacion> Get ( Scope s )
    {
    List <Dic_Par_Paginacion> lista= new List <Dic_Par_Paginacion> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Par_PaginacionDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Diccionario.Dic_Par_PaginacionRow fila in tabla)
      lista.Add(new Dic_Par_Paginacion(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Dic_Objeto_Id,
    fila.Par_Servidor_Id,
    fila.Limite_registros,
    fila.Numero_usuarios,
    fila.Umbral,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Par_Servidor_Codigo,
    fila.Par_Servidor_Nombre,
    fila.Dic_Modulo_Id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_Par_Paginacion> GetByCodigo( Scope s , string Codigo)
      {
      List <Dic_Par_Paginacion> lista= new List <Dic_Par_Paginacion> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Par_PaginacionDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Diccionario.Dic_Par_PaginacionRow fila in tabla)
      lista.Add(new Dic_Par_Paginacion(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Dic_Objeto_Id,
    fila.Par_Servidor_Id,
    fila.Limite_registros,
    fila.Numero_usuarios,
    fila.Umbral,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Par_Servidor_Codigo,
    fila.Par_Servidor_Nombre,
    fila.Dic_Modulo_Id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_Par_Paginacion> GetById( Scope s , string Id)
      {
      List <Dic_Par_Paginacion> lista= new List <Dic_Par_Paginacion> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Par_PaginacionDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Diccionario.Dic_Par_PaginacionRow fila in tabla)
      lista.Add(new Dic_Par_Paginacion(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Dic_Objeto_Id,
    fila.Par_Servidor_Id,
    fila.Limite_registros,
    fila.Numero_usuarios,
    fila.Umbral,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Par_Servidor_Codigo,
    fila.Par_Servidor_Nombre,
    fila.Dic_Modulo_Id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Procedimientos
        public int NumeroRegistros(Scope s, string p_dic_objeto_nombre)
      {
          int resultado;
          // Recuperar la lista de objetos a procesar
          List<Dic_Par_Paginacion> lista = null;
          // Ejecutar el procedimiento en bloque
          resultado = (int)Adapter.NumeroRegistros(p_dic_objeto_nombre);

          // Construir la cadena de llamada, parámetros y respuesta del procedimiento
          string llamada = string.Format("NumeroSecciones.Ver_Version_Id: {0};p_dic_objeto_nombre: {1};resultado: {2}",
                                          s.Ver_Version_Id,
                                          p_dic_objeto_nombre,
                                          resultado);
          // Registrar la auditoria del procedimiento
          ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_UPDATE);
          //Retorna el resultado
          return resultado;
      }

      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Dic_Par_Paginacion
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Dic_Par_Paginacion o)
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
          o.Dic_Objeto_Id,
          o.Par_Servidor_Id,
          o.Limite_registros,
          o.Numero_usuarios,
          o.Umbral,
          o.Estado
    );
    }
    catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;
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
    {
        if (e.Message.Contains(TXT_BDD._IX_Dic_Par_Paginacion))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);              
    }
    throw;
    break;
    default:
        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX); 
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
    /// Borra el objeto de la tabla Dic_Par_Paginacion
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Dic_Par_Paginacion o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Dic_Objeto_Id,
                o.Par_Servidor_Id,
                o.Limite_registros,
                o.Numero_usuarios,
                o.Umbral,
                o.Estado
                );
        }catch (SqlException e)
        {
            System.Exception eCaso;
            System.Exception otroEX;

            eCaso = new System.Exception(e.Message);
            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
            throw (otroEX);
        }
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Dic_Par_Paginacion
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Dic_Par_Paginacion o, Dic_Par_Paginacion original)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Update(
                o.Id,
                o.Codigo,
                o.Dic_Objeto_Id,
                o.Par_Servidor_Id,
                o.Limite_registros,
                o.Numero_usuarios,
                o.Umbral,
                o.Estado,
                original.Id,
                original.Codigo,
                original.Dic_Objeto_Id,
                original.Par_Servidor_Id,
                original.Limite_registros,
                original.Numero_usuarios,
                original.Umbral,
                original.Estado
                );
        }
        catch (SqlException e)
        {
            System.Exception eCaso;
            System.Exception otroEX;

            if (e.Message.Contains(TXT_BDD._IX_Dic_Par_Paginacion))
            {
                eCaso = new System.Exception("");
                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                throw (otroEX);
            }
            eCaso = new System.Exception(e.Message);
            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
            throw (otroEX);
        }

        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
