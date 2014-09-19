
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
    /// Tabla:Dic_General
    /// </summary>
    public class DO_Dic_General
    {
    #region Adapter
    private Dic_GeneralTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Dic_GeneralTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Dic_GeneralTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Dic_General
    /// </summary> 
    /// <returns>Lista de objetos Dic_General</returns> 
    public List <Dic_General> Get ( Scope s )
    {
    List <Dic_General> lista= new List <Dic_General> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_GeneralDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Diccionario.Dic_GeneralRow fila in tabla)
      lista.Add(new Dic_General(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dominio,
    fila.Orden,
    fila.Dic_Rotulo_Id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Ver_Version_Id,
    fila.Ver_Version_Codigo,
    fila.Ver_Version_Nombre,
    fila.Dominio_Nombre,
    fila.Estado_Nombre,
    fila.Tipo_Nombre,
    fila.Ver_Version_Nombre1,
    fila.Tool_Ver_Version_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_General> GetByCodigo( Scope s , string Codigo)
      {
      List <Dic_General> lista= new List <Dic_General> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_GeneralDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Diccionario.Dic_GeneralRow fila in tabla)
      lista.Add(new Dic_General(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dominio,
    fila.Orden,
    fila.Dic_Rotulo_Id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Ver_Version_Id,
    fila.Ver_Version_Codigo,
    fila.Ver_Version_Nombre,
    fila.Dominio_Nombre,
    fila.Estado_Nombre,
    fila.Tipo_Nombre,
    fila.Ver_Version_Nombre1,
    fila.Tool_Ver_Version_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_General> GetById( Scope s , string Id)
      {
      List <Dic_General> lista= new List <Dic_General> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_GeneralDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Diccionario.Dic_GeneralRow fila in tabla)
      lista.Add(new Dic_General(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dominio,
    fila.Orden,
    fila.Dic_Rotulo_Id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Ver_Version_Id,
    fila.Ver_Version_Codigo,
    fila.Ver_Version_Nombre,
    fila.Dominio_Nombre,
    fila.Estado_Nombre,
    fila.Tipo_Nombre,
    fila.Ver_Version_Nombre1,
    fila.Tool_Ver_Version_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_General> GetByTipo( Scope s , string Tipo)
      {
      List <Dic_General> lista= new List <Dic_General> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_GeneralDataTable tabla = 
      Adapter.GetByTipo(s.Ver_Version_Id, Tipo);
      //Carga en la lista
      foreach (Diccionario.Dic_GeneralRow fila in tabla)
      lista.Add(new Dic_General(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dominio,
    fila.Orden,
    fila.Dic_Rotulo_Id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Ver_Version_Id,
    fila.Ver_Version_Codigo,
    fila.Ver_Version_Nombre,
    fila.Dominio_Nombre,
    fila.Estado_Nombre,
    fila.Tipo_Nombre,
    fila.Ver_Version_Nombre1,
    fila.Tool_Ver_Version_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Dic_General
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Dic_General o)
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
          o.Nombre.ToUpper( ),
          o.Tipo,
          o.Dominio,
          o.Orden,
          o.Dic_Rotulo_Id,
          o.Tool_Dic_Rotulo_Id,
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
        if (e.Message.Contains(TXT_BDD._IX_Dic_General_Codigo))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._IX_Dic_General_Tipo_Dominio))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
    /// Borra el objeto de la tabla Dic_General
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Dic_General o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Nombre,
                o.Tipo,
                o.Dominio,
                o.Orden,
                o.Dic_Rotulo_Id,
                o.Tool_Dic_Rotulo_Id,
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
    //Actualiza la tabla Dic_General
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Dic_General o, Dic_General original)
    {
    int resultado=0;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Nombre.ToUpper(),
            o.Tipo,
            o.Dominio,
            o.Orden,
            o.Dic_Rotulo_Id,
            o.Tool_Dic_Rotulo_Id,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Nombre,
            original.Tipo,
            original.Dominio,
            original.Orden,
            original.Dic_Rotulo_Id,
            original.Tool_Dic_Rotulo_Id,
            original.Estado
            );
    }catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;
        if (e.Message.Contains(TXT_BDD._IX_Dic_General_Codigo))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._IX_Dic_General_Tipo_Dominio))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
