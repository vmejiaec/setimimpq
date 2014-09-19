
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
    /// Tabla:Apu_Oferta_Indice
    /// </summary>
    public class DO_Apu_Oferta_Indice
    {
    #region Adapter
    private Apu_Oferta_IndiceTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Oferta_IndiceTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Oferta_IndiceTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Indice
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Indice</returns> 
    public List <Apu_Oferta_Indice> Get ( Scope s,string  Apu_Oferta_Id )
    {
    string llamada = "";
    List <Apu_Oferta_Indice> lista= new List <Apu_Oferta_Indice> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Oferta_IndiceDataTable tabla = 
    Adapter.Get (Apu_Oferta_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Indice_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Oferta_IndiceRow fila in tabla)
      lista.Add(new Apu_Oferta_Indice(
      

    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Nombre,
    fila.Apu_Indice_Codigo,
    fila.Costo_Total,
    fila.Coeficiente,
    fila.Letra));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    
    }
    }
