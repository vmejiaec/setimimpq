
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
    /// Tabla:Apr_Doc_Estado
    /// </summary>
    public class DO_Apr_Doc_Estado
    {
    #region Adapter
    private Apr_Doc_EstadoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apr_Doc_EstadoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apr_Doc_EstadoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apr_Doc_Estado
    /// </summary> 
    /// <returns>Lista de objetos Apr_Doc_Estado</returns> 
      public List <Apr_Doc_Estado> Get ( Scope s )
    {
    List <Apr_Doc_Estado> lista= new List <Apr_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_Doc_EstadoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Aprobacion.Apr_Doc_EstadoRow fila in tabla)
      lista.Add(new Apr_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Apr_Estado_Id,
    fila.Apr_Documento_Id,
    fila.Descripcion,
    fila.Estado,
    fila.Orden,
    fila.Apr_Estado_Codigo,
    fila.Apr_Estado_Nombre,
    fila.Apr_Estado_Dominio,
    fila.Apr_Documento_codigo,
    fila.Apr_Documento_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_Campo_Tipo_Dato,
    fila.Dic_Campo_Constraint,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Estado_Nombre,
    fila.Ver_Doc_Estado_Nombre,
    fila.Ver_Doc_Estado_Descripcion));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apr_Doc_Estado> GetByCodigo( Scope s , string Codigo)
      {
      List <Apr_Doc_Estado> lista= new List <Apr_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_Doc_EstadoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Aprobacion.Apr_Doc_EstadoRow fila in tabla)
      lista.Add(new Apr_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apr_Estado_Id,
    fila.Apr_Documento_Id,
    fila.Descripcion,
    fila.Orden,
    fila.Apr_Estado_Codigo,
    fila.Apr_Estado_Nombre,
    fila.Apr_Estado_Dominio,
    fila.Apr_Documento_codigo,
    fila.Apr_Documento_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_Campo_Tipo_Dato,
    fila.Dic_Campo_Constraint,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Estado_Nombre,
    fila.Ver_Doc_Estado_Nombre,
    fila.Ver_Doc_Estado_Descripcion));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apr_Doc_Estado> GetById( Scope s , string Id)
      {
      List <Apr_Doc_Estado> lista= new List <Apr_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_Doc_EstadoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Aprobacion.Apr_Doc_EstadoRow fila in tabla)
      lista.Add(new Apr_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apr_Estado_Id,
    fila.Apr_Documento_Id,
    fila.Descripcion,
    fila.Orden,
    fila.Apr_Estado_Codigo,
    fila.Apr_Estado_Nombre,
    fila.Apr_Estado_Dominio,
    fila.Apr_Documento_codigo,
    fila.Apr_Documento_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_Campo_Tipo_Dato,
    fila.Dic_Campo_Constraint,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Estado_Nombre,
    fila.Ver_Doc_Estado_Nombre,
    fila.Ver_Doc_Estado_Descripcion));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apr_Doc_Estado> GetByMantenimiento( Scope s , string ver_version_id)
      {
      List <Apr_Doc_Estado> lista= new List <Apr_Doc_Estado> ();
      //Extrae los datos
      if(s != null)
      {
      Aprobacion.Apr_Doc_EstadoDataTable tabla = 
      Adapter.GetByMantenimiento(ver_version_id);
      //Carga en la lista
      foreach (Aprobacion.Apr_Doc_EstadoRow fila in tabla)
      lista.Add(new Apr_Doc_Estado(

    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apr_Estado_Id,
    fila.Apr_Documento_Id,
    fila.Descripcion,
    fila.Orden,
    fila.Apr_Estado_Codigo,
    fila.Apr_Estado_Nombre,
    fila.Apr_Estado_Dominio,
    fila.Apr_Documento_codigo,
    fila.Apr_Documento_nombre,
    fila.Dic_Campo_Id,
    fila.Dic_Campo_Codigo,
    fila.Dic_Campo_Nombre,
    fila.Dic_Campo_Tipo_Dato,
    fila.Dic_Campo_Constraint,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Dic_Objeto_Nombre,
    fila.Estado_Nombre,
    fila.Ver_Doc_Estado_Nombre,
    fila.Ver_Doc_Estado_Descripcion));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Apr_Doc_Estado> GetByObjetoCampo(Scope s, string Objeto_Nombre, string Campo_Nombre)
        {
            string llamada = "";
            List<Apr_Doc_Estado> lista = new List<Apr_Doc_Estado>();
            //Extrae los datos
            if (s != null)
            {
                Aprobacion.Apr_Doc_EstadoDataTable tabla =
                Adapter.GetByObjetoCampo(s.Ver_Version_Id,Objeto_Nombre,Campo_Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByObjetoCampo" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Objeto_Nombre : " + Objeto_Nombre + "," + " Campo_Nombre : " + Campo_Nombre + " Nombre del Store Procedure: " + "dbo.Apr_Doc_Estado_ByObjetoCampo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Aprobacion.Apr_Doc_EstadoRow fila in tabla)
                    lista.Add(new Apr_Doc_Estado(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apr_Estado_Id,
              fila.Apr_Documento_Id,
              fila.Descripcion,
              fila.Orden,
              fila.Apr_Estado_Codigo,
              fila.Apr_Estado_Nombre,
              fila.Apr_Estado_Dominio,
              fila.Apr_Documento_codigo,
              fila.Apr_Documento_nombre,
              fila.Dic_Campo_Id,
              fila.Dic_Campo_Codigo,
              fila.Dic_Campo_Nombre,
              fila.Dic_Campo_Tipo_Dato,
              fila.Dic_Campo_Constraint,
              fila.Dic_Objeto_Id,
              fila.Dic_Objeto_Codigo,
              fila.Dic_Objeto_Nombre,
              fila.Estado_Nombre,
              fila.Ver_Doc_Estado_Nombre,
              fila.Ver_Doc_Estado_Descripcion));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Apr_Doc_Estado
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apr_Doc_Estado o)
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
          o.Apr_Estado_Id,
          o.Apr_Documento_Id,
          o.Orden,
          o.Estado,
          o.Descripcion
          
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
                            if (e.Message.Contains(TXT_BDD._IX_Apr_Doc_Estado_Apr_Documento_Orden))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                      
                        break;
                    default:
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
    }
    
    //Control de Auditoria
    //////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Apr_Doc_Estado
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apr_Doc_Estado o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Apr_Estado_Id,
          o.Apr_Documento_Id,
          o.Orden,
          o.Estado,
          o.Descripcion
          
    );
    //////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apr_Doc_Estado
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apr_Doc_Estado o, Apr_Doc_Estado original)
    {
    int resultado;
        try
    {
    resultado=Adapter.Update(

          o.Id,
          o.Codigo,
          o.Apr_Estado_Id,
          o.Apr_Documento_Id,
          o.Orden,
          o.Descripcion,
          o.Estado,
          original.Id,
          original.Codigo,
          original.Apr_Estado_Id,
          original.Apr_Documento_Id,
          original.Orden,
          original.Descripcion,
          original.Estado
          
    
    );
    }
       catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apr_Doc_Estado_Apr_Documento_Orden))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    }
    //////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
