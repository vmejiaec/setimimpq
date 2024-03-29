
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.AuditoriaTableAdapters;
    using AEL.AUD;
    using BEL;
    
    namespace CEL.AUD
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Auditoria 
    /// Tabla:Aud_Auditoria
    /// </summary>
    public class DO_Aud_Auditoria
    {
    #region Adapter
    private Aud_AuditoriaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Aud_AuditoriaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Aud_AuditoriaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Aud_Auditoria
    /// </summary> 
    /// <returns>Lista de objetos Aud_Auditoria</returns> 
    public List <Aud_Auditoria> Get ( Scope s, string  Id_Inicial ,string  Id_Final )
    {
    List <Aud_Auditoria> lista= new List <Aud_Auditoria> ();
      //Extrae los datos
      if(s != null)
      {
      Auditoria .Aud_AuditoriaDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id , Id_Inicial , Id_Final);
      //Carga en la lista
      foreach (Auditoria .Aud_AuditoriaRow fila in tabla)
      lista.Add(new Aud_Auditoria(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Accion,
    fila.Fecha,
    fila.Id_Origen,
    fila.Codigo_Origen,
    fila.Seg_Rol_Id,
    fila.Dic_Objeto_Id,
    fila.Int_Usuario_Id,
    fila.Dic_Contenedor_Id,
    fila.Int_Sucursal_Id,
    fila.Campos,
    fila.Dic_Objeto_Codigo,
    fila.Dic_objeto_Nombre,
    fila.Objeto_Dic_Modulo_Id,
    fila.Objeto_Dic_modulo_codigo,
    fila.Objeto_Dic_modulo_nombre,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Int_Sucursal_codigo,
    fila.Int_Sucursal_nombre,
    fila.int_empresa_id,
    fila.int_empresa_codigo,
    fila.int_empresa_nombre,
    fila.Int_Moneda_Id,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_modulo_codigo,
    fila.Contenedor_Dic_modulo_nombre,
    fila.Accion_Nombre,
    fila.estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Aud_Auditoria> GetByCodigo( Scope s ,string Id_Inicial ,string  Id_Final, string Codigo)
      {
      List <Aud_Auditoria> lista= new List <Aud_Auditoria> ();
      //Extrae los datos
      if(s != null)
      {
      Auditoria .Aud_AuditoriaDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Id_Inicial , Id_Final, Codigo);
      //Carga en la lista
      foreach (Auditoria .Aud_AuditoriaRow fila in tabla)
      lista.Add(new Aud_Auditoria(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Accion,
    fila.Fecha,
    fila.Id_Origen,
    fila.Codigo_Origen,
    fila.Seg_Rol_Id,
    fila.Dic_Objeto_Id,
    fila.Int_Usuario_Id,
    fila.Dic_Contenedor_Id,
    fila.Int_Sucursal_Id,
    fila.Campos,
    fila.Dic_Objeto_Codigo,
    fila.Dic_objeto_Nombre,
    fila.Objeto_Dic_Modulo_Id,
    fila.Objeto_Dic_modulo_codigo,
    fila.Objeto_Dic_modulo_nombre,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Int_Sucursal_codigo,
    fila.Int_Sucursal_nombre,
    fila.int_empresa_id,
    fila.int_empresa_codigo,
    fila.int_empresa_nombre,
    fila.Int_Moneda_Id,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_modulo_codigo,
    fila.Contenedor_Dic_modulo_nombre,
    fila.Accion_Nombre,
    fila.estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Aud_Auditoria> GetByEmpresa( Scope s ,string Par_Servidor_Id,string  Dic_Objeto_Id,int secuencia, string Int_Empresa_Id)
      {
      List <Aud_Auditoria> lista= new List <Aud_Auditoria> ();
      //Extrae los datos
      if(s != null)
      {
      Auditoria .Aud_AuditoriaDataTable tabla = 
      Adapter.GetByEmpresa(s.Ver_Version_Id, s.Par_Servidor_Id, Dic_Objeto_Id, secuencia, s.Int_Empresa_Id);
      //Carga en la lista
      foreach (Auditoria .Aud_AuditoriaRow fila in tabla)
      lista.Add(new Aud_Auditoria(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Accion,
    fila.Fecha,
    fila.Id_Origen,
    fila.Codigo_Origen,
    fila.Seg_Rol_Id,
    fila.Dic_Objeto_Id,
    fila.Int_Usuario_Id,
    fila.Dic_Contenedor_Id,
    fila.Int_Sucursal_Id,
    fila.Campos,
    fila.Dic_Objeto_Codigo,
    fila.Dic_objeto_Nombre,
    fila.Objeto_Dic_Modulo_Id,
    fila.Objeto_Dic_modulo_codigo,
    fila.Objeto_Dic_modulo_nombre,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Int_Sucursal_codigo,
    fila.Int_Sucursal_nombre,
    fila.int_empresa_id,
    fila.int_empresa_codigo,
    fila.int_empresa_nombre,
    fila.Int_Moneda_Id,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_modulo_codigo,
    fila.Contenedor_Dic_modulo_nombre,
    fila.Accion_Nombre,
    fila.estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Aud_Auditoria> GetById( Scope s ,string  Id_Inicial,string Id_Final, string Id)
      {
      List <Aud_Auditoria> lista= new List <Aud_Auditoria> ();
      //Extrae los datos
      if(s != null)
      {
      Auditoria .Aud_AuditoriaDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id_Inicial,Id_Final, Id);
      //Carga en la lista
      foreach (Auditoria .Aud_AuditoriaRow fila in tabla)
      lista.Add(new Aud_Auditoria(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Accion,
    fila.Fecha,
    fila.Id_Origen,
    fila.Codigo_Origen,
    fila.Seg_Rol_Id,
    fila.Dic_Objeto_Id,
    fila.Int_Usuario_Id,
    fila.Dic_Contenedor_Id,
    fila.Int_Sucursal_Id,
    fila.Campos,
    fila.Dic_Objeto_Codigo,
    fila.Dic_objeto_Nombre,
    fila.Objeto_Dic_Modulo_Id,
    fila.Objeto_Dic_modulo_codigo,
    fila.Objeto_Dic_modulo_nombre,
    fila.Seg_Rol_Codigo,
    fila.Seg_Rol_Nombre,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Int_Sucursal_codigo,
    fila.Int_Sucursal_nombre,
    fila.int_empresa_id,
    fila.int_empresa_codigo,
    fila.int_empresa_nombre,
    fila.Int_Moneda_Id,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Dic_contenedor_Codigo,
    fila.Dic_contenedor_Nombre,
    fila.Contenedor_Dic_Modulo_Id,
    fila.Contenedor_Dic_modulo_codigo,
    fila.Contenedor_Dic_modulo_nombre,
    fila.Accion_Nombre,
    fila.estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Aud_Auditoria
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Aud_Auditoria o)
    {
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
o.GenCodigo(s.Ver_Version_Id);
    o.GenEstado();
    // Controla el error de clave primaria duplicada.
        o.Int_Sucursal_Id = s.Int_Sucursal_Id;
        o.Int_Usuario_Id = s.Int_Usuario_Id;
    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Nombre.ToUpper( ),
          o.Accion,
          o.Fecha,
          o.Id_Origen,
          o.Codigo_Origen,
          o.Seg_Rol_Id,
          o.Dic_Objeto_Id,
          o.Int_Usuario_Id,
          o.Dic_Contenedor_Id,
          o.Int_Sucursal_Id,
          o.Campos,
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

        if (e.Message.Contains(TXT_BDD._IX_Aud_Auditoria_codigo))
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
    /// Borra el objeto de la tabla Aud_Auditoria
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Aud_Auditoria o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Nombre,
                o.Accion,
                o.Fecha,
                o.Id_Origen,
                o.Codigo_Origen,
                o.Seg_Rol_Id,
                o.Dic_Objeto_Id,
                o.Int_Usuario_Id,
                o.Dic_Contenedor_Id,
                o.Int_Sucursal_Id,
                o.Campos,
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
    //Actualiza la tabla Aud_Auditoria
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Aud_Auditoria o, Aud_Auditoria original)
    {
    int resultado=0;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Nombre.ToUpper(),
            o.Accion,
            o.Fecha,
            o.Id_Origen,
            o.Codigo_Origen,
            o.Seg_Rol_Id,
            o.Dic_Objeto_Id,
            o.Int_Usuario_Id,
            o.Dic_Contenedor_Id,
            o.Int_Sucursal_Id,
            o.Campos,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Nombre,
            original.Accion,
            original.Fecha,
            original.Id_Origen,
            original.Codigo_Origen,
            original.Seg_Rol_Id,
            original.Dic_Objeto_Id,
            original.Int_Usuario_Id,
            original.Dic_Contenedor_Id,
            original.Int_Sucursal_Id,
            original.Campos,
            original.Estado
            );
    }catch (SqlException e)

            {
                System.Exception eCaso;
                System.Exception otroEX;
        if (e.Message.Contains(TXT_BDD._IX_Aud_Auditoria_codigo))
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
