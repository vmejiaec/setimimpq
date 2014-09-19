
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
    /// Tabla:Apu_Presupuesto_Cuadrilla
    /// </summary>
    public class DO_Apu_Presupuesto_Cuadrilla
    {
    #region Adapter
    private Apu_Presupuesto_CuadrillaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Presupuesto_CuadrillaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Presupuesto_CuadrillaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Presupuesto_Cuadrilla
    /// </summary> 
    /// <returns>Lista de objetos Apu_Presupuesto_Cuadrilla</returns> 
    public List <Apu_Presupuesto_Cuadrilla> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Presupuesto_Cuadrilla> lista= new List <Apu_Presupuesto_Cuadrilla> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Presupuesto_CuadrillaDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Presupuesto_Cuadrilla_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Presupuesto_CuadrillaRow fila in tabla)
      lista.Add(new Apu_Presupuesto_Cuadrilla(
      
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Origen,
    fila.Origen_Id,
    fila.Origen_Codigo,
    fila.Origen_Nombre,
    fila.Costo_Total,
    fila.Salario_Real,
    fila.Numero_Trabajadores,
    fila.Coeficiente,
    fila.Costo_Actual,
    fila.SRD_x_Coeficiente,
    fila.Costo_Planilla,
    fila.Costo_Planilla_x_Coeficiente,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id,
    fila.Fis_Catalogo_Fecha_Publicacion));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Apu_Presupuesto_Cuadrilla> GetByPresupuesto( Scope s , string Apu_Presupuesto_Id,string Estado)
          {
          string llamada = "";
          List <Apu_Presupuesto_Cuadrilla> lista= new List <Apu_Presupuesto_Cuadrilla> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_CuadrillaDataTable tabla = 
          Adapter.GetByPresupuesto(s.Ver_Version_Id, Apu_Presupuesto_Id,Estado);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByPresupuesto" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Cuadrilla_ByPres " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_CuadrillaRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Cuadrilla(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Origen,
    fila.Origen_Id,
    fila.Origen_Codigo,
    fila.Origen_Nombre,
    fila.Costo_Total,
    fila.Salario_Real,
    fila.Numero_Trabajadores,
    fila.Coeficiente,
    fila.Costo_Actual,
    fila.SRD_x_Coeficiente,
    fila.Costo_Planilla,
    fila.Costo_Planilla_x_Coeficiente,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id,
    fila.Fis_Catalogo_Fecha_Publicacion));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
    public List <Apu_Presupuesto_Cuadrilla> GetByPlanilla( Scope s , string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
          {
          string llamada = "";
          List <Apu_Presupuesto_Cuadrilla> lista= new List <Apu_Presupuesto_Cuadrilla> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_CuadrillaDataTable tabla = 
          Adapter.GetByPlanilla(s.Ver_Version_Id,Apu_Presupuesto_Id,Fis_Planilla_Id, Estado);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByPlanilla" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id+ "," + " Fis_Planilla_Id : " + Fis_Planilla_Id+ "," + " Estado : " + Estado  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Cuadrilla_ByPlanilla " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_CuadrillaRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Cuadrilla(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Origen,
    fila.Origen_Id,
    fila.Origen_Codigo,
    fila.Origen_Nombre,
    fila.Costo_Total,
    fila.Salario_Real,
    fila.Numero_Trabajadores,
    fila.Coeficiente,
    fila.Costo_Actual,
    fila.SRD_x_Coeficiente,
    fila.Costo_Planilla,
    fila.Costo_Planilla_x_Coeficiente,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id,
    fila.Fis_Catalogo_Fecha_Publicacion));
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
    /// Inserta el objeto en la tabla Apu_Presupuesto_Cuadrilla
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Presupuesto_Cuadrilla o)
    {
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
    o.GenCodigo(s.Ver_Version_Id);
    // Controla el error de clave primaria duplicada.
    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Apu_Presupuesto_Id,
          o.Origen,
          o.Origen_Id,
          o.Origen_Codigo,
          o.Origen_Nombre,
          o.Costo_Total,
          o.Salario_Real,
          o.Numero_Trabajadores,
          o.Coeficiente,
          o.Costo_Actual
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
    /// Borra el objeto de la tabla Apu_Presupuesto_Cuadrilla
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Presupuesto_Cuadrilla o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Apu_Presupuesto_Id,
          o.Origen,
          o.Origen_Id,
          o.Origen_Codigo,
          o.Origen_Nombre,
          o.Costo_Total,
          o.Salario_Real,
          o.Numero_Trabajadores,
          o.Coeficiente,
          o.Costo_Actual
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Presupuesto_Cuadrilla
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Presupuesto_Cuadrilla o, Apu_Presupuesto_Cuadrilla original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Apu_Presupuesto_Id,
          o.Origen,
          o.Origen_Id,
          o.Origen_Codigo,
          o.Origen_Nombre,
          o.Costo_Total,
          o.Salario_Real,
          o.Numero_Trabajadores,
          o.Coeficiente,
          o.Costo_Actual,
          original.Id,
          original.Codigo,
          original.Estado,
          original.Apu_Presupuesto_Id,
          original.Origen,
          original.Origen_Id,
          original.Origen_Codigo,
          original.Origen_Nombre,
          original.Costo_Total,
          original.Salario_Real,
          original.Numero_Trabajadores,
          original.Coeficiente,
          original.Costo_Actual
    
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
