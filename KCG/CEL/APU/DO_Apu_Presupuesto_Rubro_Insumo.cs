
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
    /// Tabla:Apu_Presupuesto_Rubro_Insumo
    /// </summary>
    public class DO_Apu_Presupuesto_Rubro_Insumo
    {
    #region Adapter
    private Apu_Presupuesto_Rubro_InsumoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Presupuesto_Rubro_InsumoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Presupuesto_Rubro_InsumoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Presupuesto_Rubro_Insumo
    /// </summary> 
    /// <returns>Lista de objetos Apu_Presupuesto_Rubro_Insumo</returns> 
    public List <Apu_Presupuesto_Rubro_Insumo> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Presupuesto_Rubro_Insumo> lista= new List <Apu_Presupuesto_Rubro_Insumo> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Presupuesto_Rubro_InsumoDataTable tabla = 
    Adapter.Get ();
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Presupuesto_Rubro_Insumo_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Presupuesto_Rubro_InsumoRow fila in tabla)
      lista.Add(new Apu_Presupuesto_Rubro_Insumo(
      
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Descripcion,
    fila.Origen,
    fila.Apu_Origen_Id,
    fila.Apu_Rubro_Id,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Cantidad,
    fila.Apu_Rubro_Unidad,
    fila.Insumo,
    fila.Apu_Insumo_Id,
    fila.Apu_Insumo_Codigo,
    fila.Apu_Insumo_Nombre,
    fila.Apu_Categoria_Id,
    fila.Apu_Categoria_Codigo,
    fila.Apu_Categoria_Nombre,
    fila.Costo_Diario,
    fila.Rendimiento,
    fila.Cantidad));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Apu_Presupuesto_Rubro_Insumo> GetByOrigen( Scope s , string apu_origen_Id)
          {
          string llamada = "";
          List <Apu_Presupuesto_Rubro_Insumo> lista= new List <Apu_Presupuesto_Rubro_Insumo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_Rubro_InsumoDataTable tabla = 
          Adapter.GetByOrigen(s.Ver_Version_Id, apu_origen_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByOrigen" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " apu_origen_Id : " + apu_origen_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Rubro_Insumo_ByOrigen " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_Rubro_InsumoRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Rubro_Insumo(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Descripcion,
    fila.Origen,
    fila.Apu_Origen_Id,
    fila.Apu_Rubro_Id,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Cantidad,
    fila.Apu_Rubro_Unidad,
    fila.Insumo,
    fila.Apu_Insumo_Id,
    fila.Apu_Insumo_Codigo,
    fila.Apu_Insumo_Nombre,
    fila.Apu_Categoria_Id,
    fila.Apu_Categoria_Codigo,
    fila.Apu_Categoria_Nombre,
    fila.Costo_Diario,
    fila.Rendimiento,
    fila.Cantidad));
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
    /// Inserta el objeto en la tabla Apu_Presupuesto_Rubro_Insumo
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Presupuesto_Rubro_Insumo o)
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
          o.Descripcion,
          o.Origen,
          o.Apu_Origen_Id,
          o.Apu_Rubro_Id,
          o.Apu_Rubro_Codigo,
          o.Apu_Rubro_Nombre,
          o.Apu_Rubro_Cantidad,
          o.Apu_Rubro_Unidad,
          o.Insumo,
          o.Apu_Insumo_Id,
          o.Apu_Insumo_Codigo,
          o.Apu_Insumo_Nombre,
          o.Apu_Categoria_Id,
          o.Apu_Categoria_Codigo,
          o.Apu_Categoria_Nombre,
          o.Costo_Diario,
          o.Rendimiento,
          o.Cantidad
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
    /// Borra el objeto de la tabla Apu_Presupuesto_Rubro_Insumo
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Presupuesto_Rubro_Insumo o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Descripcion,
          o.Origen,
          o.Apu_Origen_Id,
          o.Apu_Rubro_Id,
          o.Apu_Rubro_Codigo,
          o.Apu_Rubro_Nombre,
          o.Apu_Rubro_Cantidad,
          o.Apu_Rubro_Unidad,
          o.Insumo,
          o.Apu_Insumo_Id,
          o.Apu_Insumo_Codigo,
          o.Apu_Insumo_Nombre,
          o.Apu_Categoria_Id,
          o.Apu_Categoria_Codigo,
          o.Apu_Categoria_Nombre,
          o.Costo_Diario,
          o.Rendimiento,
          o.Cantidad
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Presupuesto_Rubro_Insumo
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Presupuesto_Rubro_Insumo o, Apu_Presupuesto_Rubro_Insumo original)
    {
    int resultado;
    resultado=Adapter.Update(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Descripcion,
          o.Origen,
          o.Apu_Origen_Id,
          o.Apu_Rubro_Id,
          o.Apu_Rubro_Codigo,
          o.Apu_Rubro_Nombre,
          o.Apu_Rubro_Cantidad,
          o.Apu_Rubro_Unidad,
          o.Insumo,
          o.Apu_Insumo_Id,
          o.Apu_Insumo_Codigo,
          o.Apu_Insumo_Nombre,
          o.Apu_Categoria_Id,
          o.Apu_Categoria_Codigo,
          o.Apu_Categoria_Nombre,
          o.Costo_Diario,
          o.Rendimiento,
          o.Cantidad,
          original.Id,
          original.Codigo,
          original.Estado,
          original.Descripcion,
          original.Origen,
          original.Apu_Origen_Id,
          original.Apu_Rubro_Id,
          original.Apu_Rubro_Codigo,
          original.Apu_Rubro_Nombre,
          original.Apu_Rubro_Cantidad,
          original.Apu_Rubro_Unidad,
          original.Insumo,
          original.Apu_Insumo_Id,
          original.Apu_Insumo_Codigo,
          original.Apu_Insumo_Nombre,
          original.Apu_Categoria_Id,
          original.Apu_Categoria_Codigo,
          original.Apu_Categoria_Nombre,
          original.Costo_Diario,
          original.Rendimiento,
          original.Cantidad
    
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
