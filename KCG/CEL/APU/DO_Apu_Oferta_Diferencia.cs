
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
    /// Tabla:Apu_Oferta_Diferencia
    /// </summary>
    public class DO_Apu_Oferta_Diferencia
    {
    #region Adapter
    private Apu_Oferta_DiferenciaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Oferta_DiferenciaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Oferta_DiferenciaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Diferencia
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Diferencia</returns> 
    public List <Apu_Oferta_Diferencia> GetByOferta ( Scope s,string apu_Oferta_id )
    {
    string llamada = "";
    List <Apu_Oferta_Diferencia> lista= new List <Apu_Oferta_Diferencia> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Oferta_DiferenciaDataTable tabla = 
    Adapter.GetByOferta (apu_Oferta_id ,s.Int_Empresa_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Diferencia_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Oferta_DiferenciaRow fila in tabla)
      lista.Add(new Apu_Oferta_Diferencia(
      
    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Nombre,
    fila.Apu_Indice_Codigo,
    fila.costo_total,
    fila.coeficiente,
    fila.Letra));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    
    }
    }
