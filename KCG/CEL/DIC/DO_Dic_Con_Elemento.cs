
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
    /// Tabla:Dic_Con_Elemento
    /// </summary>
    public class DO_Dic_Con_Elemento
    {
    #region Adapter
    private Dic_Con_ElementoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Dic_Con_ElementoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Dic_Con_ElementoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Dic_Con_Elemento
    /// </summary> 
    /// <returns>Lista de objetos Dic_Con_Elemento</returns> 
    public List <Dic_Con_Elemento> Get ( Scope s )
    {
    List <Dic_Con_Elemento> lista= new List <Dic_Con_Elemento> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Con_ElementoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Diccionario.Dic_Con_ElementoRow fila in tabla)
      lista.Add(new Dic_Con_Elemento(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dic_Contenedor_id,
    fila.Dic_Rotulo_id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Tipo_Nombre,
    fila.Dic_Contenedor_Codigo,
    fila.Dic_Contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_Modulo_Codigo,
    fila.Contenedor_Dic_Modulo_Nombre,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Estado_Nombre,
    fila.Ver_etiqueta_nombre,
    fila.Tool_Ver_etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_Con_Elemento> GetByCodigo( Scope s , string Codigo)
      {
      List <Dic_Con_Elemento> lista= new List <Dic_Con_Elemento> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Con_ElementoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Diccionario.Dic_Con_ElementoRow fila in tabla)
      lista.Add(new Dic_Con_Elemento(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dic_Contenedor_id,
    fila.Dic_Rotulo_id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Tipo_Nombre,
    fila.Dic_Contenedor_Codigo,
    fila.Dic_Contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_Modulo_Codigo,
    fila.Contenedor_Dic_Modulo_Nombre,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Estado_Nombre,
    fila.Ver_etiqueta_nombre,
    fila.Tool_Ver_etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_Con_Elemento> GetByContenedor( Scope s , string dic_Contenedor_id)
      {
      List <Dic_Con_Elemento> lista= new List <Dic_Con_Elemento> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Con_ElementoDataTable tabla = 
      Adapter.GetByContenedor(s.Ver_Version_Id, dic_Contenedor_id);
      //Carga en la lista
      foreach (Diccionario.Dic_Con_ElementoRow fila in tabla)
      lista.Add(new Dic_Con_Elemento(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dic_Contenedor_id,
    fila.Dic_Rotulo_id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Tipo_Nombre,
    fila.Dic_Contenedor_Codigo,
    fila.Dic_Contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_Modulo_Codigo,
    fila.Contenedor_Dic_Modulo_Nombre,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Estado_Nombre,
    fila.Ver_etiqueta_nombre,
    fila.Tool_Ver_etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Dic_Con_Elemento> GetById( Scope s , string Id)
      {
      List <Dic_Con_Elemento> lista= new List <Dic_Con_Elemento> ();
      //Extrae los datos
      if(s != null)
      {
      Diccionario.Dic_Con_ElementoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Diccionario.Dic_Con_ElementoRow fila in tabla)
      lista.Add(new Dic_Con_Elemento(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Tipo,
    fila.Dic_Contenedor_id,
    fila.Dic_Rotulo_id,
    fila.Tool_Dic_Rotulo_Id,
    fila.Tipo_Nombre,
    fila.Dic_Contenedor_Codigo,
    fila.Dic_Contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_Modulo_Codigo,
    fila.Contenedor_Dic_Modulo_Nombre,
    fila.Dic_Rotulo_Codigo,
    fila.Dic_Rotulo_nombre,
    fila.Tool_Dic_Rotulo_Codigo,
    fila.Tool_Dic_Rotulo_nombre,
    fila.Estado_Nombre,
    fila.Ver_etiqueta_nombre,
    fila.Tool_Ver_etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Dic_Con_Elemento> GetByTipoLikeEtiqueta(Scope s, string Tipo, string Nombre)
        {
            string llamada = "";
            List<Dic_Con_Elemento> lista = new List<Dic_Con_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ElementoDataTable tabla =
                Adapter.GetByTipoLikeEtiqueta(s.Ver_Version_Id, Tipo, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByTipoLikeEtiqueta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Tipo : " + Tipo + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Dic_Con_Elemento_ByTipoLikeEtiqueta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ElementoRow fila in tabla)
                    lista.Add(new Dic_Con_Elemento(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Tipo,
                        fila.Dic_Contenedor_id,
                        fila.Dic_Rotulo_id,
                        fila.Tool_Dic_Rotulo_Id,
                        fila.Tipo_Nombre,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Dic_Rotulo_Codigo,
                        fila.Dic_Rotulo_nombre,
                        fila.Tool_Dic_Rotulo_Codigo,
                        fila.Tool_Dic_Rotulo_nombre,
                        fila.Estado_Nombre,
                        fila.Ver_etiqueta_nombre,
                        fila.Tool_Ver_etiqueta_nombre));
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
    /// Inserta el objeto en la tabla Dic_Con_Elemento
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Dic_Con_Elemento o)
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
          o.Tipo,
          o.Nombre,
          o.Dic_Contenedor_id,
          o.Dic_Rotulo_id,
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
        if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Elemento_Codigo))
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
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Dic_Con_Elemento
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Dic_Con_Elemento o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Tipo,
                o.Nombre,
                o.Dic_Contenedor_id,
                o.Dic_Rotulo_id,
                o.Tool_Dic_Rotulo_Id,
                o.Estado
                );
        }catch (SqlException e)
        {
            System.Exception eCaso;
            System.Exception otroEX;
            
             if (e.Message.Contains(TXT_BDD._FK_Seg_Menu_Dic_Con_Elemento))
        {
            eCaso = new System.Exception("Seg Menu");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }

              if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Elemento_Dic_Con_Elemento))
        {
            eCaso = new System.Exception("Seg Rol Elemento");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }
              if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Menu_Dic_Con_Elemento))
        {
            eCaso = new System.Exception("Seg Rol Menu");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }
            eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);
        }
        //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Dic_Con_Elemento
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Dic_Con_Elemento o, Dic_Con_Elemento original)
    {
    int resultado=0;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Tipo,
            o.Nombre,
            o.Dic_Contenedor_id,
            o.Dic_Rotulo_id,
            o.Tool_Dic_Rotulo_Id,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Tipo,
            original.Nombre,
            original.Dic_Contenedor_id,
            original.Dic_Rotulo_id,
            original.Tool_Dic_Rotulo_Id,
            original.Estado
            );
    }catch(SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;

        if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Elemento_Codigo))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }

        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);
    }

        //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
