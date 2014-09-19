
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;

using System;
using System.ComponentModel;
using BEL;
using CEL.APU;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Presupuesto_Formula
    /// </summary>
    public class DO_Apu_Presupuesto_Formula
    {
    #region Adapter
    private Apu_Presupuesto_FormulaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Presupuesto_FormulaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Presupuesto_FormulaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Presupuesto_Formula
    /// </summary> 
    /// <returns>Lista de objetos Apu_Presupuesto_Formula</returns> 
    public List <Apu_Presupuesto_Formula> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Presupuesto_Formula> lista= new List <Apu_Presupuesto_Formula> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Presupuesto_FormulaDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Presupuesto_Formula_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Presupuesto_FormulaRow fila in tabla)
      lista.Add(new Apu_Presupuesto_Formula(
      
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Apu_Indice_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Coeficiente,
    fila.Letra,
    fila.Costo_Actual,
    fila.Costo_Planilla,
    fila.Relacion,
    fila.Coeficiente_X_Relacion,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Apu_Presupuesto_Formula> GetByIndice( Scope s , string Apu_Indice_Id)
          {
          string llamada = "";
          List <Apu_Presupuesto_Formula> lista= new List <Apu_Presupuesto_Formula> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_FormulaDataTable tabla = 
          Adapter.GetByIndice(s.Ver_Version_Id, Apu_Indice_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByIndice" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Indice_Id : " + Apu_Indice_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Formula_ByIndice " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_FormulaRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Formula(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Apu_Indice_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Coeficiente,
    fila.Letra,
    fila.Costo_Actual,
    fila.Costo_Planilla,
    fila.Relacion,
    fila.Coeficiente_X_Relacion,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
    public List <Apu_Presupuesto_Formula> GetByPresupuesto( Scope s , string Apu_Presupuesto_Id, string Estado)
          {
          string llamada = "";
          List <Apu_Presupuesto_Formula> lista= new List <Apu_Presupuesto_Formula> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_FormulaDataTable tabla = 
          Adapter.GetByPresupuesto(s.Ver_Version_Id, Apu_Presupuesto_Id,Estado);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByPresupuesto" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Formula_ByPres " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_FormulaRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Formula(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Apu_Indice_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Coeficiente,
    fila.Letra,
    fila.Costo_Actual,
    fila.Costo_Planilla,
    fila.Relacion,
    fila.Coeficiente_X_Relacion,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
    public List <Apu_Presupuesto_Formula> GetByPlanilla( Scope s , string Apu_Presupuesto_Id, string Fis_Planilla_Id, string Estado)
          {
          string llamada = "";
          List <Apu_Presupuesto_Formula> lista= new List <Apu_Presupuesto_Formula> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Presupuesto_FormulaDataTable tabla = 
          Adapter.GetByPlanilla(s.Ver_Version_Id,Apu_Presupuesto_Id,Fis_Planilla_Id, Estado);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByPlanilla" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id+ "," + " Fis_Planilla_Id : " + Fis_Planilla_Id+ "," + " Estado : " + Estado  + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Formula_ByPlanilla " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Presupuesto_FormulaRow fila in tabla)
          lista.Add(new Apu_Presupuesto_Formula(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Presupuesto_Id,
    fila.Apu_Indice_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Coeficiente,
    fila.Letra,
    fila.Costo_Actual,
    fila.Costo_Planilla,
    fila.Relacion,
    fila.Coeficiente_X_Relacion,
    fila.Fis_Catalogo_Nombre,
    fila.Fis_Catalogo_Id));
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
    /// Inserta el objeto en la tabla Apu_Presupuesto_Formula
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Presupuesto_Formula o)
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
          o.Apu_Indice_Id,
          o.Apu_Indice_Codigo,
          o.Apu_Indice_Nombre,
          o.Costo_Total,
          o.Coeficiente,
          o.Letra,
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
    /// Borra el objeto de la tabla Apu_Presupuesto_Formula
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Presupuesto_Formula o)
    {
    int resultado = Adapter.Delete(
    
          o.Id,
          o.Codigo,
          o.Estado,
          o.Apu_Presupuesto_Id,
          o.Apu_Indice_Id,
          o.Apu_Indice_Codigo,
          o.Apu_Indice_Nombre,
          o.Costo_Total,
          o.Coeficiente,
          o.Letra,
          o.Costo_Actual
    );
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Presupuesto_Formula
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Presupuesto_Formula o, Apu_Presupuesto_Formula original)
    {
    int resultado;
    try
    {
        resultado = Adapter.Update(

              o.Id,
              o.Codigo,
              o.Estado,
              o.Apu_Presupuesto_Id,
              o.Apu_Indice_Id,
              o.Apu_Indice_Codigo,
              o.Apu_Indice_Nombre,
              o.Costo_Total,
              o.Coeficiente,
              o.Letra,
              o.Costo_Actual,
              original.Id,
              original.Codigo,
              original.Estado,
              original.Apu_Presupuesto_Id,
              original.Apu_Indice_Id,
              original.Apu_Indice_Codigo,
              original.Apu_Indice_Nombre,
              original.Costo_Total,
              original.Coeficiente,
              original.Letra,
              original.Costo_Actual

        );
    }
    catch (SqlException e)
    {
        throw e;
    }
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
