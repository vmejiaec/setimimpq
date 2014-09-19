
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.InterfaceTableAdapters;
    using AEL.INT;
    using BEL;
    
    namespace CEL.INT
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Interface 
    /// Tabla:Int_Subproyecto
    /// </summary>
    public class DO_Int_Subproyecto
    {
    #region Adapter
    private Int_SubproyectoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Int_SubproyectoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Int_SubproyectoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Int_Subproyecto
    /// </summary> 
    /// <returns>Lista de objetos Int_Subproyecto</returns> 
    public List <Int_Subproyecto> Get ( Scope s )
    {
    string llamada = "";
    List <Int_Subproyecto> lista= new List <Int_Subproyecto> ();
    //Extrae los datos
    if(s != null)
    {
    Interface .Int_SubproyectoDataTable tabla = 
    Adapter.Get ();
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    //llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Int_Subproyecto_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Interface .Int_SubproyectoRow fila in tabla)
      lista.Add(new Int_Subproyecto(
      
    fila.Codigo_Institucional,
    fila.SPROY_NOMBRE));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Subproyecto> GetByLikeCodigoInstitucional( Scope s , string Codigo_Institucional)
          {
          string llamada = "";
          List <Int_Subproyecto> lista= new List <Int_Subproyecto> ();
          //Extrae los datos
          if(s != null)
          {
          Interface .Int_SubproyectoDataTable tabla = 
          Adapter.GetByLikeCodigoInstitucional(Codigo_Institucional);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoInstitucional" + " Parametros  Enviados en el Método: "+ "," + " Codigo_Institucional : " + Codigo_Institucional  + " Nombre del Store Procedure: " + "dbo.Int_Subproyecto_ByLikeCodigoInstitucional " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Interface .Int_SubproyectoRow fila in tabla)
          lista.Add(new Int_Subproyecto(
          
    fila.Codigo_Institucional,
    fila.SPROY_NOMBRE));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          #endregion

    }
    }
