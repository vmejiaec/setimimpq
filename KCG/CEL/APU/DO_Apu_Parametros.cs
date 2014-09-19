
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
    /// Tabla:Apu_Parametros
    /// </summary>
    public class DO_Apu_Parametros
    {
    #region Adapter
    private Apu_ParametrosTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_ParametrosTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_ParametrosTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Parametros
    /// </summary> 
    /// <returns>Lista de objetos Apu_Parametros</returns> 
    public List <Apu_Parametros> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Parametros> lista= new List <Apu_Parametros> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_ParametrosDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Parametros_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_ParametrosRow fila in tabla)
      lista.Add(new Apu_Parametros(
      
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Equipo_Apu_Indice_Id,
    fila.ManoObra_Apu_Indice_Id,
    fila.Porcentaje_Costo_Indirecto,
    fila.Int_Sucursal_Id,
    fila.Apu_Mano_Obra_Id,
    fila.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
    fila.Equipo_Apu_Indice_Codigo,
    fila.Equipo_Apu_Indice_Nombre,
    fila.ManoObra_Apu_Indice_Codigo,
    fila.ManoObra_Apu_Indice_Nombre,
    fila.Apu_Mano_Obra_Codigo,
    fila.Apu_Mano_Obra_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      
          #region  Procedimiento de SELECT  UNI  ExisteRegistros
          public int ExisteRegistros(Scope s ,string int_sucursal_id )
          {
          int  resultado;
          // Recuperar la lista de objetos a procesar
          List<Apu_Parametros>lista =null;
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.ExisteRegistros(int_sucursal_id);
          //Retorna el resultado
          return resultado;
          }
          #endregion
          public List <Apu_Parametros> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Apu_Parametros> lista= new List <Apu_Parametros> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ParametrosDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Parametros_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ParametrosRow fila in tabla)
          lista.Add(new Apu_Parametros(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Equipo_Apu_Indice_Id,
    fila.ManoObra_Apu_Indice_Id,
    fila.Porcentaje_Costo_Indirecto,
    fila.Int_Sucursal_Id,
    fila.Apu_Mano_Obra_Id,
    fila.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
    fila.Equipo_Apu_Indice_Codigo,
    fila.Equipo_Apu_Indice_Nombre,
    fila.ManoObra_Apu_Indice_Codigo,
    fila.ManoObra_Apu_Indice_Nombre,
    fila.Apu_Mano_Obra_Codigo,
    fila.Apu_Mano_Obra_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Apu_Parametros> GetByEmpresa( Scope s)
          {
          string llamada = "";
          List <Apu_Parametros> lista= new List <Apu_Parametros> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ParametrosDataTable tabla = 
          Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_Empresa_Id : " + s.Int_Empresa_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Parametros_ByEmpresa " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ParametrosRow fila in tabla)
          lista.Add(new Apu_Parametros(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Equipo_Apu_Indice_Id,
    fila.ManoObra_Apu_Indice_Id,
    fila.Porcentaje_Costo_Indirecto,
    fila.Int_Sucursal_Id,
    fila.Apu_Mano_Obra_Id,
    fila.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
    fila.Equipo_Apu_Indice_Codigo,
    fila.Equipo_Apu_Indice_Nombre,
    fila.ManoObra_Apu_Indice_Codigo,
    fila.ManoObra_Apu_Indice_Nombre,
    fila.Apu_Mano_Obra_Codigo,
    fila.Apu_Mano_Obra_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Apu_Parametros> GetById( Scope s , string Id)
          {
          string llamada = "";
          List <Apu_Parametros> lista= new List <Apu_Parametros> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ParametrosDataTable tabla = 
          Adapter.GetById(s.Ver_Version_Id, Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Apu_Parametros_ById " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ParametrosRow fila in tabla)
          lista.Add(new Apu_Parametros(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Equipo_Apu_Indice_Id,
    fila.ManoObra_Apu_Indice_Id,
    fila.Porcentaje_Costo_Indirecto,
    fila.Int_Sucursal_Id,
    fila.Apu_Mano_Obra_Id,
    fila.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
    fila.Equipo_Apu_Indice_Codigo,
    fila.Equipo_Apu_Indice_Nombre,
    fila.ManoObra_Apu_Indice_Codigo,
    fila.ManoObra_Apu_Indice_Nombre,
    fila.Apu_Mano_Obra_Codigo,
    fila.Apu_Mano_Obra_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Apu_Parametros> GetBySucursal( Scope s )
          {
          string llamada = "";
          List <Apu_Parametros> lista= new List <Apu_Parametros> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ParametrosDataTable tabla = 
          Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + s.Int_Sucursal_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Parametros_BySucursal " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ParametrosRow fila in tabla)
          lista.Add(new Apu_Parametros(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Equipo_Apu_Indice_Id,
    fila.ManoObra_Apu_Indice_Id,
    fila.Porcentaje_Costo_Indirecto,
    fila.Int_Sucursal_Id,
    fila.Apu_Mano_Obra_Id,
    fila.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
    fila.Equipo_Apu_Indice_Codigo,
    fila.Equipo_Apu_Indice_Nombre,
    fila.ManoObra_Apu_Indice_Codigo,
    fila.ManoObra_Apu_Indice_Nombre,
    fila.Apu_Mano_Obra_Codigo,
    fila.Apu_Mano_Obra_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Estado_Nombre,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre));
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
    /// Inserta el objeto en la tabla Apu_Parametros
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Parametros o)
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
          o.Equipo_Apu_Indice_Id,
          o.ManoObra_Apu_Indice_Id,
          o.Porcentaje_Costo_Indirecto,
          o.Int_Sucursal_Id,
          o.Apu_Mano_Obra_Id,
          o.Estado,
          o.Apu_Subtitulo_Id_Oferta_Rubro_Pred
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
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Apu_Parametros
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Parametros o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Equipo_Apu_Indice_Id,
          o.ManoObra_Apu_Indice_Id,
          o.Porcentaje_Costo_Indirecto,
          o.Int_Sucursal_Id,
          o.Apu_Mano_Obra_Id,
          o.Estado,
          o.Apu_Subtitulo_Id_Oferta_Rubro_Pred
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Parametros
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Parametros o, Apu_Parametros original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Equipo_Apu_Indice_Id,
          o.ManoObra_Apu_Indice_Id,
          o.Porcentaje_Costo_Indirecto,
          o.Int_Sucursal_Id,
          o.Apu_Mano_Obra_Id,
          o.Estado,
          o.Apu_Subtitulo_Id_Oferta_Rubro_Pred,
          original.Id,
          original.Codigo,
          original.Equipo_Apu_Indice_Id,
          original.ManoObra_Apu_Indice_Id,
          original.Porcentaje_Costo_Indirecto,
          original.Int_Sucursal_Id,
          original.Apu_Mano_Obra_Id,
          original.Estado,
          original.Apu_Subtitulo_Id_Oferta_Rubro_Pred
    
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
