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
    /// Tabla:Apu_Oferta_Rubro_Insumo
    /// </summary>
    public class DO_Apu_Oferta_Rubro_Insumo
    {
    #region Adapter
    private Apu_Oferta_Rubro_InsumoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Oferta_Rubro_InsumoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Oferta_Rubro_InsumoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Rubro_Insumo
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Rubro_Insumo</returns> 
    public List <Apu_Oferta_Rubro_Insumo> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Oferta_Rubro_Insumo> lista= new List <Apu_Oferta_Rubro_Insumo> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Oferta_Rubro_InsumoDataTable tabla = 
        Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Rubro_Insumo_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Oferta_Rubro_InsumoRow fila in tabla)
      lista.Add(new Apu_Oferta_Rubro_Insumo(
      
    fila.Tipo,
    fila.Tipo_Nombre,
    fila.Apu_Insumo_Id,
    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Rubro_Id,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Insumo_Codigo,
    fila.Apu_Insumo_Nombre,
    fila.Costo_Insumo,
    fila.Costo_x_Cantidad,
    fila.Int_Sucursal_Id,
    fila.Apu_Oferta_Rubro_Cantidad,
    fila.Apu_Oferta_Rubro_Costo_Directo,
    fila.Apu_Oferta_Rubro_Costo_Indirecto,
    fila.Apu_Oferta_Rubro_Costo));
      }
      //Devuleve la Lista
      return lista;
      }
     public List <Apu_Oferta_Rubro_Insumo> GetByOferta( Scope s , string Apu_Oferta_Id)
          {
          string llamada = "";
          List <Apu_Oferta_Rubro_Insumo> lista= new List <Apu_Oferta_Rubro_Insumo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Oferta_Rubro_InsumoDataTable tabla = 
          Adapter.GetByOferta(s.Ver_Version_Id, Apu_Oferta_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByOferta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Oferta_Id : " + Apu_Oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Rubro_Insumo_ByOferta " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Oferta_Rubro_InsumoRow fila in tabla)
          lista.Add(new Apu_Oferta_Rubro_Insumo(
          
    fila.Tipo,
    fila.Tipo_Nombre,
    fila.Apu_Insumo_Id,
    fila.Apu_Oferta_Id,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Rubro_Id,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Insumo_Codigo,
    fila.Apu_Insumo_Nombre,
    fila.Costo_Insumo,
    fila.Costo_x_Cantidad,
    fila.Int_Sucursal_Id,
    fila.Apu_Oferta_Rubro_Cantidad,
    fila.Apu_Oferta_Rubro_Costo_Directo,
    fila.Apu_Oferta_Rubro_Costo_Indirecto,
    fila.Apu_Oferta_Rubro_Costo));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
      #endregion
    
    }
    }
