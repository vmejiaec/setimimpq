
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
    /// Tabla:Par_Filtro
    /// </summary>
    public class DO_Par_Filtro
    {
    #region Adapter
    private Par_FiltroTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_FiltroTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_FiltroTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Filtro
    /// </summary> 
    /// <returns>Lista de objetos Par_Filtro</returns> 
    public List <Par_Filtro> Get ( Scope s )
    {
    string llamada = "";
    List <Par_Filtro> lista= new List <Par_Filtro> ();
    //Extrae los datos
    if(s != null)
    {
    Parametros.Par_FiltroDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Par_Filtro_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Parametros.Par_FiltroRow fila in tabla)
      lista.Add(new Par_Filtro(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Int_Usuario_Id,
    fila.Dic_con_Campo_Id,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Dic_con_campo_Codigo,
    fila.Dic_con_campo_Nombre,
    fila.estado_Nombre,
    fila.Dic_con_Objeto_Id,
    fila.Dic_con_objeto_codigo,
    fila.Dic_con_objeto_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_rotulo_id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_Nombre,
    fila.Tool_dic_rotulo_id,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_Nombre,
    fila.Dic_Campo_Tipo_dato,
    fila.Dic_Campo_Tipo_constraint,
    fila.Visible,
    fila.Dic_Campo_Filtro,
    fila.Ver_etiqueta_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Par_Filtro> GetByConObjetoUsuario(Scope s, string dic_con_objeto_id, string int_usuario_id)
          {
          string llamada = "";
          List <Par_Filtro> lista= new List <Par_Filtro> ();
          //Extrae los datos
          if(s != null)
          {
          Parametros.Par_FiltroDataTable tabla = 
          Adapter.GetByConObjetoUsuario(s.Ver_Version_Id,dic_con_objeto_id, s.Int_Usuario_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByConObjetoUsuario" + " Parametros  Enviados en el Método: "+ "," + " ver_version_id : " + s.Ver_Version_Id+ "," + " dic_con_objeto_id : " + dic_con_objeto_id+ "," + " int_usuario_id : " + s.Int_Usuario_Id  + " Nombre del Store Procedure: " + "dbo.Par_Filtro_ByConObjetoUsuario " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Parametros.Par_FiltroRow fila in tabla)
          lista.Add(new Par_Filtro(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Int_Usuario_Id,
    fila.Dic_con_Campo_Id,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Dic_con_campo_Codigo,
    fila.Dic_con_campo_Nombre,
    fila.estado_Nombre,
    fila.Dic_con_Objeto_Id,
    fila.Dic_con_objeto_codigo,
    fila.Dic_con_objeto_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_rotulo_id,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_Nombre,
    fila.Tool_dic_rotulo_id,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_Nombre,
    fila.Dic_Campo_Tipo_dato,
    fila.Dic_Campo_Tipo_constraint,
    fila.Visible,
    fila.Dic_Campo_Filtro,
    fila.Ver_etiqueta_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Par_Filtro
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Par_Filtro o)
    {
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
    o.GenCodigo(s.Ver_Version_Id);
    o.GenEstado();
    // Controla el error de clave primaria duplicada.
        o.Int_Usuario_Id = s.Int_Usuario_Id;
    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Int_Usuario_Id,
          o.Dic_con_Campo_Id,
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
    {
        if (e.Message.Contains(TXT_BDD._IX_Par_filtro_codigo))
        {
            System.Exception eCaso = new System.Exception("");
            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._IX_Par_filtro_Usuario_Campo))
        {
            System.Exception eCaso = new System.Exception("");
            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
            throw (otroEX);
        }
    }
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
    /// Borra el objeto de la tabla Par_Filtro
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Par_Filtro o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Int_Usuario_Id,
                o.Dic_con_Campo_Id,
                o.Estado
                );
        }
        catch (SqlException e)
        {

            System.Exception eCaso = new System.Exception("Error No Registrado");
            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ22, eCaso);
            throw (otroEX);
        }
            
        
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Par_Filtro
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Par_Filtro o, Par_Filtro original)
    {
    int resultado=0;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Int_Usuario_Id,
            o.Dic_con_Campo_Id,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Int_Usuario_Id,
            original.Dic_con_Campo_Id,
            original.Estado
            );
    }catch (SqlException e)
    {
        if (e.Message.Contains(TXT_BDD._IX_Par_filtro_codigo))
        {
            System.Exception eCaso = new System.Exception("");
            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._IX_Par_filtro_Usuario_Campo))
        {
            System.Exception eCaso = new System.Exception("");
            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
            throw (otroEX);
        }
    }
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
