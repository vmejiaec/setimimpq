
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;
    using System.Data;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Proyecto_Rubro_Insumo
    /// </summary>
    public class DO_Apu_Proyecto_Rubro_Insumo
    {
    #region Adapter
    private Apu_Proyecto_Rubro_InsumoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Proyecto_Rubro_InsumoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Proyecto_Rubro_InsumoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Proyecto_Rubro_Insumo
    /// </summary> 
    /// <returns>Lista de objetos Apu_Proyecto_Rubro_Insumo</returns> 
    public List <Apu_Proyecto_Rubro_Insumo> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Proyecto_Rubro_Insumo> lista= new List <Apu_Proyecto_Rubro_Insumo> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Proyecto_Rubro_InsumoDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Proyecto_Rubro_Insumo_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Proyecto_Rubro_InsumoRow fila in tabla)
      lista.Add(new Apu_Proyecto_Rubro_Insumo(
      
    fila.Tipo,
    fila.Tipo_Nombre,
    fila.Apu_Insumo_Id,
    fila.Apu_Proyecto_Id,
    fila.Apu_Proyecto_Codigo,
    fila.Apu_Proyecto_Nombre,
    fila.Apu_Proyecto_Etapa,
    fila.Apu_Rubro_Id,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Insumo_Codigo,
    fila.Apu_Insumo_Nombre,
    fila.Costo_Insumo,
    fila.Cantidad_Insumo,
    fila.Costo_x_Cantidad,
    fila.Int_Sucursal_Id,
    fila.Apu_Proyecto_Rubro_Cantidad,
    fila.Apu_Proyecto_Rubro_Costo_Directo,
    fila.Apu_Proyecto_Rubro_Costo_Indirecto,
    fila.Apu_Proyecto_Rubro_Costo,
    fila.Apu_Proyecto_Rubro_Costo_Unitario,
    fila.Apu_Proyecto_Rubro_Id));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Apu_Proyecto_Rubro_Insumo> GetBySucursal(Scope s, string Int_Sucursal_Id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Nombre, string Apu_Insumo_Nombre, string Tipo)
          {
          string llamada = "";
          List <Apu_Proyecto_Rubro_Insumo> lista= new List <Apu_Proyecto_Rubro_Insumo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Proyecto_Rubro_InsumoDataTable tabla =
          Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id, s.Numero_Registros, s.Pagina_Actual, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Nombre, Apu_Insumo_Nombre, Tipo);
          //tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_sucursal_id : " + s.Int_Sucursal_Id +  "," + " Numero_Registros : " + s.Numero_Registros + "," + " Pagina_Actual : " + s.Pagina_Actual + "," + " Apu_Proyecto_Codigo : " + Apu_Proyecto_Codigo + "," + " Apu_Proyecto_Nombre : " + Apu_Proyecto_Nombre + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + "," + " Apu_Insumo_Nombre : " + Apu_Insumo_Nombre + "," + " Tipo : " + Tipo +  " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_Insumo_BySucursal " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (DataRowView fila in tabla.DefaultView)
          lista.Add(new Apu_Proyecto_Rubro_Insumo(
          
    Convert.ToString(fila["Tipo"]),
    Convert.ToString(fila["Tipo_Nombre"]),
    Convert.ToString(fila["Apu_Insumo_Id"]),
    Convert.ToString(fila["Apu_Proyecto_Id"]),
    Convert.ToString(fila["Apu_Proyecto_Codigo"]),
    Convert.ToString(fila["Apu_Proyecto_Nombre"]),
    Convert.ToString(fila["Apu_Proyecto_Etapa"]),
    Convert.ToString(fila["Apu_Rubro_Id"]),
    Convert.ToString(fila["Apu_Rubro_Codigo"]),
    Convert.ToString(fila["Apu_Rubro_Nombre"]),
    Convert.ToString(fila["Apu_Rubro_Unidad"]),
    Convert.ToString(fila["Apu_Insumo_Codigo"]),
    Convert.ToString(fila["Apu_Insumo_Nombre"]),
    Convert.ToDecimal(fila["Costo_Insumo"]),
    Convert.ToDecimal(fila["Cantidad_Insumo"]),
    Convert.ToDecimal(fila["Costo_x_Cantidad"]),
    Convert.ToString(fila["Int_Sucursal_Id"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Cantidad"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Directo"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Indirecto"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Unitario"]),
    Convert.ToString(fila["Apu_Proyecto_Rubro_Id"])
    ));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
      public List <Apu_Proyecto_Rubro_Insumo> GetByProyecto( Scope s , string Apu_proyecto_id)
          {
          string llamada = "";
          List <Apu_Proyecto_Rubro_Insumo> lista= new List <Apu_Proyecto_Rubro_Insumo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Proyecto_Rubro_InsumoDataTable tabla = 
          Adapter.GetByProyecto(s.Ver_Version_Id, Apu_proyecto_id);
          tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_proyecto_id : " + Apu_proyecto_id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_Insumo_ByProyecto " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (DataRowView fila in tabla.DefaultView)
          lista.Add(new Apu_Proyecto_Rubro_Insumo(

    Convert.ToString(fila["Tipo"]),
    Convert.ToString(fila["Tipo_Nombre"]),
    Convert.ToString(fila["Apu_Insumo_Id"]),
    Convert.ToString(fila["Apu_Proyecto_Id"]),
    Convert.ToString(fila["Apu_Proyecto_Codigo"]),
    Convert.ToString(fila["Apu_Proyecto_Nombre"]),
    Convert.ToString(fila["Apu_Proyecto_Etapa"]),
    Convert.ToString(fila["Apu_Rubro_Id"]),
    Convert.ToString(fila["Apu_Rubro_Codigo"]),
    Convert.ToString(fila["Apu_Rubro_Nombre"]),
    Convert.ToString(fila["Apu_Rubro_Unidad"]),
    Convert.ToString(fila["Apu_Insumo_Codigo"]),
    Convert.ToString(fila["Apu_Insumo_Nombre"]),
    Convert.ToDecimal(fila["Costo_Insumo"]),
    Convert.ToDecimal(fila["Cantidad_Insumo"]),
    Convert.ToDecimal(fila["Costo_x_Cantidad"]),
    Convert.ToString(fila["Int_Sucursal_Id"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Cantidad"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Directo"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Indirecto"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo"]),
    Convert.ToDecimal(fila["Apu_Proyecto_Rubro_Costo_Unitario"]),
    Convert.ToString(fila["Apu_Proyecto_Rubro_Id"])
    ));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }

          #region  Procedimiento de SELECT  UNI  TotalPaginas
          public int TotalPaginas(Scope s ,string Int_sucursal_id,string Apu_Proyecto_Codigo,string Apu_Proyecto_Nombre,string Apu_Rubro_Nombre,string Apu_Insumo_Nombre,string Tipo )
          {
          int  resultado;
          List<Apu_Proyecto> lista = new List<Apu_Proyecto>();
      
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.TotalPaginas(s.Ver_Version_Id,s.Int_Sucursal_Id,s.Numero_Registros,Apu_Proyecto_Codigo,Apu_Proyecto_Nombre,Apu_Rubro_Nombre,Apu_Insumo_Nombre,Tipo);
          // Construir la cadena de llamada, parámetros y respuesta del procedimiento
          string llamada ="TotalPaginas.Ver_Version_Id: " + s.Ver_Version_Id + "," + " Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id +"," +  s.Numero_Registros + "," + " Apu_Proyecto_Codigo : " + Apu_Proyecto_Codigo+ "," + " Apu_Proyecto_Nombre : " + Apu_Proyecto_Nombre+ "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre+ "," + " Apu_Insumo_Nombre : " + Apu_Insumo_Nombre + "," + " Tipo : " + Tipo + "," + "Nombre del SP: " + " dbo.Apu_Proyecto_Rubro_Insumo_ByTotalPaginas " + "," + " resultado: "+ resultado;
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Retorna el resultado
          return resultado;
          }
          #endregion

          #endregion
    
    }
    }
