
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Rubro_Material
    /// </summary>
    public class DO_Apu_Rubro_Material
    {
    #region Adapter
    private Apu_Rubro_MaterialTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Rubro_MaterialTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Rubro_MaterialTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Rubro_Material
    /// </summary> 
    /// <returns>Lista de objetos Apu_Rubro_Material</returns> 
    public List <Apu_Rubro_Material> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Rubro_Material> lista= new List <Apu_Rubro_Material> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Rubro_MaterialDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Rubro_Material_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Rubro_MaterialRow fila in tabla)
      lista.Add(new Apu_Rubro_Material(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Rubro_Id,
    fila.Apu_Material_Id,
    fila.Cantidad,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.UpdateTransporte_Per_Personal_Id,
    fila.Fecha_UpdateTransporte,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Material_Codigo,
    fila.Apu_Material_Nombre,
    fila.Apu_Material_Unidad,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.UpdateTransporte_Per_Personal_Codigo,
    fila.UpdateTransporte_Per_Personal_Nombre,
    fila.costo_unitario,
    fila.costo_unitario_transporte,
    fila.costo_total,
    fila.costo_total_transporte,
    fila.int_moneda_simbolo,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_id,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Titulo_Id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Rubro_Material> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Apu_Rubro_Material> lista= new List <Apu_Rubro_Material> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Rubro_MaterialDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Material_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Rubro_MaterialRow fila in tabla)
          lista.Add(new Apu_Rubro_Material(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Rubro_Id,
    fila.Apu_Material_Id,
    fila.Cantidad,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.UpdateTransporte_Per_Personal_Id,
    fila.Fecha_UpdateTransporte,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Material_Codigo,
    fila.Apu_Material_Nombre,
    fila.Apu_Material_Unidad,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.UpdateTransporte_Per_Personal_Codigo,
    fila.UpdateTransporte_Per_Personal_Nombre,
    fila.costo_unitario,
    fila.costo_unitario_transporte,
    fila.costo_total,
    fila.costo_total_transporte,
    fila.int_moneda_simbolo,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_id,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Titulo_Id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Apu_Rubro_Material> GetById( Scope s , string Id)
          {
          string llamada = "";
          List <Apu_Rubro_Material> lista= new List <Apu_Rubro_Material> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Rubro_MaterialDataTable tabla = 
          Adapter.GetById(s.Ver_Version_Id, Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Material_ById " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Rubro_MaterialRow fila in tabla)
          lista.Add(new Apu_Rubro_Material(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Rubro_Id,
    fila.Apu_Material_Id,
    fila.Cantidad,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.UpdateTransporte_Per_Personal_Id,
    fila.Fecha_UpdateTransporte,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Material_Codigo,
    fila.Apu_Material_Nombre,
    fila.Apu_Material_Unidad,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.UpdateTransporte_Per_Personal_Codigo,
    fila.UpdateTransporte_Per_Personal_Nombre,
    fila.costo_unitario,
    fila.costo_unitario_transporte,
    fila.costo_total,
    fila.costo_total_transporte,
    fila.int_moneda_simbolo,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_id,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Titulo_Id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        public List<Apu_Rubro_Material> GetByProyectoRubro(Scope s, string apu_proyecto_id, string apu_rubro_id)
          {
          string llamada = "";
          List <Apu_Rubro_Material> lista= new List <Apu_Rubro_Material> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Rubro_MaterialDataTable tabla = 
          Adapter.GetByProyectoRubro(s.Ver_Version_Id,apu_proyecto_id, apu_rubro_id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByProyectoRubro" + " Parametros  Enviados en el Método: "+ "," + " ver_version_id : " + s.Ver_Version_Id+ "," + " apu_proyecto_id : " + apu_proyecto_id+ "," + " apu_rubro_id : " + apu_rubro_id  + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Material_ByProyectoRubro " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Rubro_MaterialRow fila in tabla)
          lista.Add(new Apu_Rubro_Material(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Rubro_Id,
    fila.Apu_Material_Id,
    fila.Cantidad,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.UpdateTransporte_Per_Personal_Id,
    fila.Fecha_UpdateTransporte,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Material_Codigo,
    fila.Apu_Material_Nombre,
    fila.Apu_Material_Unidad,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.UpdateTransporte_Per_Personal_Codigo,
    fila.UpdateTransporte_Per_Personal_Nombre,
    fila.costo_unitario,
    fila.costo_unitario_transporte,
    fila.costo_total,
    fila.costo_total_transporte,
    fila.int_moneda_simbolo,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_id,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Titulo_Id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Apu_Rubro_Material> GetByRubro( Scope s , string Apu_Rubro_Id)
          {
          string llamada = "";
          List <Apu_Rubro_Material> lista= new List <Apu_Rubro_Material> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Rubro_MaterialDataTable tabla = 
          Adapter.GetByRubro(s.Ver_Version_Id, Apu_Rubro_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByRubro" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Rubro_Id : " + Apu_Rubro_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Material_ByRubro " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Rubro_MaterialRow fila in tabla)
          lista.Add(new Apu_Rubro_Material(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Rubro_Id,
    fila.Apu_Material_Id,
    fila.Cantidad,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.UpdateTransporte_Per_Personal_Id,
    fila.Fecha_UpdateTransporte,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Material_Codigo,
    fila.Apu_Material_Nombre,
    fila.Apu_Material_Unidad,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.UpdateTransporte_Per_Personal_Codigo,
    fila.UpdateTransporte_Per_Personal_Nombre,
    fila.costo_unitario,
    fila.costo_unitario_transporte,
    fila.costo_total,
    fila.costo_total_transporte,
    fila.int_moneda_simbolo,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_id,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Titulo_Id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre));
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
    /// Inserta el objeto en la tabla Apu_Rubro_Material
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Rubro_Material o)
    {
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
    o.GenCodigo(s.Ver_Version_Id);
    o.GenEstado();
    // Controla el error de clave primaria duplicada.
        o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
        o.Update_Per_Personal_Id = s.Per_Personal_Id;
        o.Fecha_Creacion = DateTime.Now;
        o.Fecha_Update = DateTime.Now;
        o.Fecha_UpdateTransporte = DateTime.Now;
        o.UpdateTransporte_Per_Personal_Id = s.Per_Personal_Id;
    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Apu_Rubro_Id,
          o.Apu_Material_Id,
          o.Cantidad,
          o.Fecha_Update,
          o.Update_Per_Personal_Id,
          o.Fecha_Creacion,
          o.Creacion_Per_Personal_Id,
          o.UpdateTransporte_Per_Personal_Id,
          o.Fecha_UpdateTransporte,
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
        if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Material_Codigo))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }

        if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Material))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Apu_Rubro_Material
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Rubro_Material o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Apu_Rubro_Id,
                o.Apu_Material_Id,
                o.Cantidad,
                o.Fecha_Update,
                o.Update_Per_Personal_Id,
                o.Fecha_Creacion,
                o.Creacion_Per_Personal_Id,
                o.UpdateTransporte_Per_Personal_Id,
                o.Fecha_UpdateTransporte,
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
    //Actualiza la tabla Apu_Rubro_Material
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Rubro_Material o, Apu_Rubro_Material original)
    {
    int resultado=0;
    o.Update_Per_Personal_Id = s.Per_Personal_Id;
    o.Fecha_Update = DateTime.Now;
    o.Fecha_UpdateTransporte = DateTime.Now;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Apu_Rubro_Id,
            o.Apu_Material_Id,
            o.Cantidad,
            o.Fecha_Update,
            o.Update_Per_Personal_Id,
            o.Fecha_Creacion,
            o.Creacion_Per_Personal_Id,
            o.UpdateTransporte_Per_Personal_Id,
            o.Fecha_UpdateTransporte,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Apu_Rubro_Id,
            original.Apu_Material_Id,
            original.Cantidad,
            original.Fecha_Update,
            original.Update_Per_Personal_Id,
            original.Fecha_Creacion,
            original.Creacion_Per_Personal_Id,
            original.UpdateTransporte_Per_Personal_Id,
            original.Fecha_UpdateTransporte,
            original.Estado
            );
    }
        catch(SqlException e)
        {
            System.Exception eCaso;
            System.Exception otroEX;

            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Material_Codigo))
            {
                eCaso = new System.Exception("");
                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                throw (otroEX);
            }

            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Material))
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
