
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.HistoricoTableAdapters;
    using AEL.HIS;
    using BEL;
    
    namespace CEL.HIS
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Historico 
    /// Tabla:His_Historico
    /// </summary>
    public class DO_His_Historico
    {
    #region Adapter
        private His_HistoricoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
        public His_HistoricoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
        _Adapter = new His_HistoricoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla His_Historico
    /// </summary> 
    /// <returns>Lista de objetos His_Historico</returns> 
    public List <His_Historico> Get ( Scope s )
    {
    string llamada = "";
    List <His_Historico> lista= new List <His_Historico> ();
    //Extrae los datos
    if(s != null)
    {
    Historico.His_HistoricoDataTable tabla = 
    Adapter.Get ();
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " His_Historico_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Historico.His_HistoricoRow fila in tabla)
      lista.Add(new His_Historico(
      
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Dic_Objeto_Id,
    fila.Dic_Objeto_Codigo,
    fila.Fecha_Creacion,
    fila.Dic_Objeto_Nombe,
    fila.Per_Personal_Id,
    fila.Per_Personal_Codigo,
    fila.Per_Personal_Nombre,
    fila.Int_Usuario_Id,
    fila.Int_Usuario_Codigo,
    fila.Int_Usuario_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Int_Sucursal_Id,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Descripcion
    ));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla His_Historico
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, His_Historico o)
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
          o.Estado,
          o.Dic_Objeto_Id,
          o.Dic_Objeto_Codigo,
          o.Fecha_Creacion,
          o.Dic_Objeto_Nombe,
          o.Per_Personal_Id,
          o.Per_Personal_Codigo,
          o.Per_Personal_Nombre,
          o.Int_Usuario_Id,
          o.Int_Usuario_Codigo,
          o.Int_Usuario_Nombre,
          o.Int_Empresa_Id,
          o.Int_Empresa_Codigo,
          o.Int_Empresa_Nombre,
          o.Int_Sucursal_Id,
          o.Int_Sucursal_Codigo,
          o.Int_Sucursal_Nombre,
          o.Descripcion
          
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
  
    #endregion
    }
    }
