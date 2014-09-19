
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
    /// Tabla:Apu_Oferta_Cuadrilla_Diferencia
    /// </summary>
    public class DO_Apu_Oferta_Cuadrilla_Diferencia
    {
    #region Adapter
    private Apu_Oferta_Cuadrilla_DiferenciaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Oferta_Cuadrilla_DiferenciaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Oferta_Cuadrilla_DiferenciaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Cuadrilla_Diferencia
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Cuadrilla_Diferencia</returns> 
    public List <Apu_Oferta_Cuadrilla_Diferencia> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Oferta_Cuadrilla_Diferencia> lista= new List <Apu_Oferta_Cuadrilla_Diferencia> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Oferta_Cuadrilla_DiferenciaDataTable tabla = 
    Adapter.Get ();
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Cuadrilla_Diferencia_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Oferta_Cuadrilla_DiferenciaRow fila in tabla)
      lista.Add(new Apu_Oferta_Cuadrilla_Diferencia(
    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Cuadrilla_Codigo,
    fila.Apu_Cuadrilla_Nombre,
    fila.costo_total,
    fila.Costo_Hora,
    fila.Numero_trabajadores,
    fila.Coeficiente));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Oferta_Cuadrilla_Diferencia> GetByOferta( Scope s , string Apu_Oferta_Id)
          {
          string llamada = "";
          List <Apu_Oferta_Cuadrilla_Diferencia> lista= new List <Apu_Oferta_Cuadrilla_Diferencia> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Oferta_Cuadrilla_DiferenciaDataTable tabla = 
          Adapter.GetByOferta(Apu_Oferta_Id ,s.Int_Empresa_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByOferta" + " Parametros  Enviados en el Método: " + "," + " apu_oferta_id : " + Apu_Oferta_Id + "," + " int_empresa_id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Cuadrilla_Diferencia_ByOferta " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Oferta_Cuadrilla_DiferenciaRow fila in tabla)
          lista.Add(new Apu_Oferta_Cuadrilla_Diferencia(
    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Cuadrilla_Codigo,
    fila.Apu_Cuadrilla_Nombre,
    fila.costo_total,
    fila.Costo_Hora,
    fila.Numero_trabajadores,
    fila.Coeficiente));
          }
          //Realiza la auditoria
          ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          #endregion
   
    }
    }
