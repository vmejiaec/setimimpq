
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
    /// Tabla:Apu_Proyecto_Cuadrilla
    /// </summary>
    public class DO_Apu_Proyecto_Cuadrilla
    {
    #region Adapter
    private Apu_Proyecto_CuadrillaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Proyecto_CuadrillaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Proyecto_CuadrillaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Proyecto_Cuadrilla
    /// </summary> 
    /// <returns>Lista de objetos Apu_Proyecto_Cuadrilla</returns> 
    public List <Apu_Proyecto_Cuadrilla> Get ( Scope s, string apu_proyecto_id )
    {
    string llamada = "";
    List <Apu_Proyecto_Cuadrilla> lista= new List <Apu_Proyecto_Cuadrilla> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Proyecto_CuadrillaDataTable tabla = 
    Adapter.Get (apu_proyecto_id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Proyecto_Cuadrilla_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Proyecto_CuadrillaRow fila in tabla)
      lista.Add(new Apu_Proyecto_Cuadrilla(
      
    fila.Apu_Proyecto_Id,
    fila.Apu_proyecto_Codigo,
    fila.Apu_proyecto_Nombre,
    fila.Apu_proyecto_Etapa,
    fila.Apu_Cuadrilla_Codigo,
    fila.Apu_Cuadrilla_Nombre,
    fila.Costo_Total,
    fila.Costo_Hora,
    fila.Numero_trabajadores,
    fila.Coeficiente,
    fila.Apu_Categoria_Id,
    fila.Origen));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    
    }
    }
