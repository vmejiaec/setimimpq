
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;
using System;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Proyecto
    /// </summary>
    public class DO_Apu_Proyecto
    {
    #region Adapter
    private Apu_ProyectoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_ProyectoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_ProyectoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Proyecto
    /// </summary> 
    /// <returns>Lista de objetos Apu_Proyecto</returns> 
      public List <Apu_Proyecto> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_ProyectoDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Proyecto_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Codigo_Institucion,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Coordinador_Per_Personal_Id,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Fecha_Update,
    fila.Creacion_Per_Personal_Id,
    fila.Update_Per_Personal_Id,
    fila.Costo_Directo,
    fila.Costo_Total,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Descripcion,
    fila.Tipo_Contrato,
    fila.Apu_Lugar_Codigo,
    fila.Apu_Lugar_Nombre,
    fila.Apu_provincia_id,
    fila.Apu_Provincia_Codigo,
    fila.Apu_Provincia_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.Coordinador_Per_Personal_Codigo,
    fila.Coordinador_Per_Personal_Nombre,
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Metro_Cuadrado,
    fila.Costo_Indirecto_Otros,
    fila.Porcentaje_Costo_Indirecto_Otros,
    fila.Indice_Sumatoria,
    fila.Coeficiente_Sumatoria,
    fila.Cuadrilla_Sumatoria,
    fila.Cuadrilla_Coeficiente_Sumatoria,
    fila.Suma_Porcentaje_Indice_Transporte,
    fila.Etapa_Nombre,
    fila.Estado_Nombre,
    fila.Cadena_Indice,
    fila.Cadena_Cuadrilla,
    fila.Apu_Presupuesto_Estado,
    fila.Apu_Presupuesto_Estado_Nombre,
    fila.Tipo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Proyecto> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ProyectoDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ProyectoRow fila in tabla)
          lista.Add(new Apu_Proyecto(
          
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Codigo_Institucion,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Coordinador_Per_Personal_Id,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Fecha_Update,
    fila.Creacion_Per_Personal_Id,
    fila.Update_Per_Personal_Id,
    fila.Costo_Directo,
    fila.Costo_Total,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Descripcion,
    fila.Tipo_Contrato,
    fila.Apu_Lugar_Codigo,
    fila.Apu_Lugar_Nombre,
    fila.Apu_provincia_id,
    fila.Apu_Provincia_Codigo,
    fila.Apu_Provincia_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.Coordinador_Per_Personal_Codigo,
    fila.Coordinador_Per_Personal_Nombre,
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Metro_Cuadrado,
    fila.Costo_Indirecto_Otros,
    fila.Porcentaje_Costo_Indirecto_Otros,
    fila.Indice_Sumatoria,
    fila.Coeficiente_Sumatoria,
    fila.Cuadrilla_Sumatoria,
    fila.Cuadrilla_Coeficiente_Sumatoria,
    fila.Suma_Porcentaje_Indice_Transporte,
    fila.Etapa_Nombre,
    fila.Estado_Nombre,
    fila.Cadena_Indice,
    fila.Cadena_Cuadrilla,
    fila.Apu_Presupuesto_Estado,
    fila.Apu_Presupuesto_Estado_Nombre,
    fila.Tipo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
      public List <Apu_Proyecto> GetById( Scope s , string Id)
      {
      string llamada = "";
      List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_ProyectoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ById " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Codigo_Institucion,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Coordinador_Per_Personal_Id,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Fecha_Update,
fila.Creacion_Per_Personal_Id,
fila.Update_Per_Personal_Id,
fila.Costo_Directo,
fila.Costo_Total,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Descripcion,
fila.Tipo_Contrato,
fila.Apu_Lugar_Codigo,
fila.Apu_Lugar_Nombre,
fila.Apu_provincia_id,
fila.Apu_Provincia_Codigo,
fila.Apu_Provincia_Nombre,
fila.Int_Sucursal_Codigo,
fila.Int_Sucursal_Nombre,
fila.Int_Empresa_Id,
fila.Int_Empresa_Codigo,
fila.Int_Empresa_Nombre,
fila.Creacion_Per_Personal_Codigo,
fila.Creacion_Per_Personal_Nombre,
fila.Update_Per_Personal_Codigo,
fila.Update_Per_Personal_Nombre,
fila.Coordinador_Per_Personal_Codigo,
fila.Coordinador_Per_Personal_Nombre,
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Metro_Cuadrado,
fila.Costo_Indirecto_Otros,
fila.Porcentaje_Costo_Indirecto_Otros,
fila.Indice_Sumatoria,
fila.Coeficiente_Sumatoria,
fila.Cuadrilla_Sumatoria,
fila.Cuadrilla_Coeficiente_Sumatoria,
fila.Suma_Porcentaje_Indice_Transporte,
fila.Etapa_Nombre,
fila.Estado_Nombre,
fila.Cadena_Indice,
fila.Cadena_Cuadrilla,
fila.Apu_Presupuesto_Estado,
fila.Apu_Presupuesto_Estado_Nombre,
fila.Tipo_Nombre));
      }
      //Realiza la auditoria
      //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Proyecto> GetByIdResumido( Scope s , string Id)
      {
      string llamada = "";
      List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_ProyectoDataTable tabla = 
      Adapter.GetByIdResumido(s.Ver_Version_Id, Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      llamada = "Nombre del Método Utilizado: " + " GetByIdResumido" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByIdResumido " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Codigo_Institucion,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Coordinador_Per_Personal_Id,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Fecha_Update,
fila.Creacion_Per_Personal_Id,
fila.Update_Per_Personal_Id,
fila.Costo_Directo,
fila.Costo_Total,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Descripcion,
fila.Tipo_Contrato,
fila.Apu_Lugar_Codigo,
fila.Apu_Lugar_Nombre,
fila.Apu_provincia_id,
fila.Apu_Provincia_Codigo,
fila.Apu_Provincia_Nombre,
fila.Int_Sucursal_Codigo,
fila.Int_Sucursal_Nombre,
fila.Int_Empresa_Id,
fila.Int_Empresa_Codigo,
fila.Int_Empresa_Nombre,
fila.Creacion_Per_Personal_Codigo,
fila.Creacion_Per_Personal_Nombre,
fila.Update_Per_Personal_Codigo,
fila.Update_Per_Personal_Nombre,
fila.Coordinador_Per_Personal_Codigo,
fila.Coordinador_Per_Personal_Nombre,
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Metro_Cuadrado,
fila.Costo_Indirecto_Otros,
fila.Porcentaje_Costo_Indirecto_Otros,
fila.Indice_Sumatoria,
fila.Coeficiente_Sumatoria,
fila.Cuadrilla_Sumatoria,
fila.Cuadrilla_Coeficiente_Sumatoria,
fila.Suma_Porcentaje_Indice_Transporte,
fila.Etapa_Nombre,
fila.Estado_Nombre,
fila.Cadena_Indice,
fila.Cadena_Cuadrilla,
fila.Apu_Presupuesto_Estado,
fila.Apu_Presupuesto_Estado_Nombre,
fila.Tipo_Nombre));
      }
      //Realiza la auditoria
      //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
      //Devuleve la Lista
      return lista;
      }
        public List<Apu_Proyecto> GetByLikeCodigoDesde(Scope s, string desde_Codigo)
      {
      string llamada = "";
      List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_ProyectoDataTable tabla = 
      Adapter.GetByLikeCodigoDesde(s.Ver_Version_Id,s.Int_Sucursal_Id, desde_Codigo);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesde" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id+ "," + " desde_Codigo : " + desde_Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByLikeCodigoDesde " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Codigo_Institucion,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Coordinador_Per_Personal_Id,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Fecha_Update,
fila.Creacion_Per_Personal_Id,
fila.Update_Per_Personal_Id,
fila.Costo_Directo,
fila.Costo_Total,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Descripcion,
fila.Tipo_Contrato,
fila.Apu_Lugar_Codigo,
fila.Apu_Lugar_Nombre,
fila.Apu_provincia_id,
fila.Apu_Provincia_Codigo,
fila.Apu_Provincia_Nombre,
fila.Int_Sucursal_Codigo,
fila.Int_Sucursal_Nombre,
fila.Int_Empresa_Id,
fila.Int_Empresa_Codigo,
fila.Int_Empresa_Nombre,
fila.Creacion_Per_Personal_Codigo,
fila.Creacion_Per_Personal_Nombre,
fila.Update_Per_Personal_Codigo,
fila.Update_Per_Personal_Nombre,
fila.Coordinador_Per_Personal_Codigo,
fila.Coordinador_Per_Personal_Nombre,
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Metro_Cuadrado,
fila.Costo_Indirecto_Otros,
fila.Porcentaje_Costo_Indirecto_Otros,
fila.Indice_Sumatoria,
fila.Coeficiente_Sumatoria,
fila.Cuadrilla_Sumatoria,
fila.Cuadrilla_Coeficiente_Sumatoria,
fila.Suma_Porcentaje_Indice_Transporte,
fila.Etapa_Nombre,
fila.Estado_Nombre,
fila.Cadena_Indice,
fila.Cadena_Cuadrilla,
fila.Apu_Presupuesto_Estado,
fila.Apu_Presupuesto_Estado_Nombre,
fila.Tipo_Nombre));
      }
      //Realiza la auditoria
      //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Proyecto> GetByLikeCodigoDesdeHasta( Scope s,string desde_Codigo, string hasta_Codigo)
      {
      string llamada = "";
      List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_ProyectoDataTable tabla = 
      Adapter.GetByLikeCodigoDesdeHasta(s.Ver_Version_Id,s.Int_Sucursal_Id,desde_Codigo, hasta_Codigo);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesdeHasta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id+ "," + " desde_Codigo : " + desde_Codigo+ "," + " hasta_Codigo : " + hasta_Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByLikeCodigoDesdeHasta " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Codigo_Institucion,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Coordinador_Per_Personal_Id,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Fecha_Update,
fila.Creacion_Per_Personal_Id,
fila.Update_Per_Personal_Id,
fila.Costo_Directo,
fila.Costo_Total,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Descripcion,
fila.Tipo_Contrato,
fila.Apu_Lugar_Codigo,
fila.Apu_Lugar_Nombre,
fila.Apu_provincia_id,
fila.Apu_Provincia_Codigo,
fila.Apu_Provincia_Nombre,
fila.Int_Sucursal_Codigo,
fila.Int_Sucursal_Nombre,
fila.Int_Empresa_Id,
fila.Int_Empresa_Codigo,
fila.Int_Empresa_Nombre,
fila.Creacion_Per_Personal_Codigo,
fila.Creacion_Per_Personal_Nombre,
fila.Update_Per_Personal_Codigo,
fila.Update_Per_Personal_Nombre,
fila.Coordinador_Per_Personal_Codigo,
fila.Coordinador_Per_Personal_Nombre,
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Metro_Cuadrado,
fila.Costo_Indirecto_Otros,
fila.Porcentaje_Costo_Indirecto_Otros,
fila.Indice_Sumatoria,
fila.Coeficiente_Sumatoria,
fila.Cuadrilla_Sumatoria,
fila.Cuadrilla_Coeficiente_Sumatoria,
fila.Suma_Porcentaje_Indice_Transporte,
fila.Etapa_Nombre,
fila.Estado_Nombre,
fila.Cadena_Indice,
fila.Cadena_Cuadrilla,
fila.Apu_Presupuesto_Estado,
fila.Apu_Presupuesto_Estado_Nombre,
fila.Tipo_Nombre));
      }
      //Realiza la auditoria
      //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Proyecto> GetByLikeCodigoHasta( Scope s , string hasta_Codigo)
      {
      string llamada = "";
      List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_ProyectoDataTable tabla = 
      Adapter.GetByLikeCodigoHasta(s.Ver_Version_Id,s.Int_Sucursal_Id, hasta_Codigo);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoHasta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id+ "," + " hasta_Codigo : " + hasta_Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByLikeCodigoHasta " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_ProyectoRow fila in tabla)
      lista.Add(new Apu_Proyecto(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Codigo_Institucion,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Coordinador_Per_Personal_Id,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Fecha_Update,
fila.Creacion_Per_Personal_Id,
fila.Update_Per_Personal_Id,
fila.Costo_Directo,
fila.Costo_Total,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Descripcion,
fila.Tipo_Contrato,
fila.Apu_Lugar_Codigo,
fila.Apu_Lugar_Nombre,
fila.Apu_provincia_id,
fila.Apu_Provincia_Codigo,
fila.Apu_Provincia_Nombre,
fila.Int_Sucursal_Codigo,
fila.Int_Sucursal_Nombre,
fila.Int_Empresa_Id,
fila.Int_Empresa_Codigo,
fila.Int_Empresa_Nombre,
fila.Creacion_Per_Personal_Codigo,
fila.Creacion_Per_Personal_Nombre,
fila.Update_Per_Personal_Codigo,
fila.Update_Per_Personal_Nombre,
fila.Coordinador_Per_Personal_Codigo,
fila.Coordinador_Per_Personal_Nombre,
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Metro_Cuadrado,
fila.Costo_Indirecto_Otros,
fila.Porcentaje_Costo_Indirecto_Otros,
fila.Indice_Sumatoria,
fila.Coeficiente_Sumatoria,
fila.Cuadrilla_Sumatoria,
fila.Cuadrilla_Coeficiente_Sumatoria,
fila.Suma_Porcentaje_Indice_Transporte,
fila.Etapa_Nombre,
fila.Estado_Nombre,
fila.Cadena_Indice,
fila.Cadena_Cuadrilla,
fila.Apu_Presupuesto_Estado,
fila.Apu_Presupuesto_Estado_Nombre,
fila.Tipo_Nombre));
      }
      //Realiza la auditoria
      //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Proyecto> GetByLikeNombre( Scope s , string Nombre)
          {
          string llamada = "";
          List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ProyectoDataTable tabla = 
          Adapter.GetByLikeNombre(s.Ver_Version_Id,s.Int_Sucursal_Id, Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id+ "," + " Nombre : " + Nombre  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ProyectoRow fila in tabla)
          lista.Add(new Apu_Proyecto(
          
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Codigo_Institucion,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Coordinador_Per_Personal_Id,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Fecha_Update,
    fila.Creacion_Per_Personal_Id,
    fila.Update_Per_Personal_Id,
    fila.Costo_Directo,
    fila.Costo_Total,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Descripcion,
    fila.Tipo_Contrato,
    fila.Apu_Lugar_Codigo,
    fila.Apu_Lugar_Nombre,
    fila.Apu_provincia_id,
    fila.Apu_Provincia_Codigo,
    fila.Apu_Provincia_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.Coordinador_Per_Personal_Codigo,
    fila.Coordinador_Per_Personal_Nombre,
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Metro_Cuadrado,
    fila.Costo_Indirecto_Otros,
    fila.Porcentaje_Costo_Indirecto_Otros,
    fila.Indice_Sumatoria,
    fila.Coeficiente_Sumatoria,
    fila.Cuadrilla_Sumatoria,
    fila.Cuadrilla_Coeficiente_Sumatoria,
    fila.Suma_Porcentaje_Indice_Transporte,
    fila.Etapa_Nombre,
    fila.Estado_Nombre,
    fila.Cadena_Indice,
    fila.Cadena_Cuadrilla,
    fila.Apu_Presupuesto_Estado,
    fila.Apu_Presupuesto_Estado_Nombre,
    fila.Tipo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        public List<Apu_Proyecto> GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, string Coordinador_Per_Personal_Nombre, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado)
          {
          string llamada = "";
          List <Apu_Proyecto> lista= new List <Apu_Proyecto> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_ProyectoDataTable tabla = 
          Adapter.GetBySucursal(s.Ver_Version_Id,s.Int_Sucursal_Id,s.Numero_Registros,s.Pagina_Actual,Codigo_Desde,Codigo_Hasta,Estado,Nombre,Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Coordinador_Per_Personal_Nombre,Tecnico_Per_Personal_Nombre,Apu_Lugar_Nombre,Apu_Provincia_Nombre,Apu_Presupuesto_Estado);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id+ "," + " Numero_Registros : " + Numero_Registros+ "," + " Pagina_Actual : " + Pagina_Actual+ "," + " Codigo_Desde : " + Codigo_Desde+ "," + " Codigo_Hasta : " + Codigo_Hasta+ "," + " Estado : " + Estado+ "," + " Nombre : " + Nombre+ "," + " Fecha_Creacion_Desde : " + Fecha_Creacion_Desde+ "," + " Fecha_Creacion_Hasta : " + Fecha_Creacion_Hasta+ "," + " Coordinador_Per_Personal_Nombre : " + Coordinador_Per_Personal_Nombre+ "," + " Tecnico_Per_Personal_Nombre : " + Tecnico_Per_Personal_Nombre+ "," + " Apu_Lugar_Nombre : " + Apu_Lugar_Nombre+ "," + " Apu_Provincia_Nombre : " + Apu_Provincia_Nombre+ "," + " Apu_Presupuesto_Estado : " + Apu_Presupuesto_Estado  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_BySucursal " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_ProyectoRow fila in tabla)
          lista.Add(new Apu_Proyecto(
          
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Codigo_Institucion,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Coordinador_Per_Personal_Id,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Fecha_Update,
    fila.Creacion_Per_Personal_Id,
    fila.Update_Per_Personal_Id,
    fila.Costo_Directo,
    fila.Costo_Total,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Descripcion,
    fila.Tipo_Contrato,
    fila.Apu_Lugar_Codigo,
    fila.Apu_Lugar_Nombre,
    fila.Apu_provincia_id,
    fila.Apu_Provincia_Codigo,
    fila.Apu_Provincia_Nombre,
    fila.Int_Sucursal_Codigo,
    fila.Int_Sucursal_Nombre,
    fila.Int_Empresa_Id,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Creacion_Per_Personal_Codigo,
    fila.Creacion_Per_Personal_Nombre,
    fila.Update_Per_Personal_Codigo,
    fila.Update_Per_Personal_Nombre,
    fila.Coordinador_Per_Personal_Codigo,
    fila.Coordinador_Per_Personal_Nombre,
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Metro_Cuadrado,
    fila.Costo_Indirecto_Otros,
    fila.Porcentaje_Costo_Indirecto_Otros,
    fila.Indice_Sumatoria,
    fila.Coeficiente_Sumatoria,
    fila.Cuadrilla_Sumatoria,
    fila.Cuadrilla_Coeficiente_Sumatoria,
    fila.Suma_Porcentaje_Indice_Transporte,
    fila.Etapa_Nombre,
    fila.Estado_Nombre,
    fila.Cadena_Indice,
    fila.Cadena_Cuadrilla,
    fila.Apu_Presupuesto_Estado,
    fila.Apu_Presupuesto_Estado_Nombre,
    fila.Tipo_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          
          #region  Procedimiento de SELECT  UNI  TotalPaginas
          public int TotalPaginas(Scope s ,string Codigo_Desde,string Codigo_Hasta,string Estado,string Nombre,DateTime Fecha_Creacion_Desde,DateTime Fecha_Creacion_Hasta,string Coordinador_Per_Personal_Nombre,string Tecnico_Per_Personal_Nombre,string Apu_Lugar_Nombre,string Apu_Provincia_Nombre,string Apu_Presupuesto_Estado )
          {
          int  resultado;
          // Recuperar la lista de objetos a procesar
          List<Apu_Proyecto>lista =null;
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.TotalPaginas(s.Ver_Version_Id,s.Int_Sucursal_Id,s.Numero_Registros,Codigo_Desde,Codigo_Hasta,Estado,Nombre,Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Coordinador_Per_Personal_Nombre,Tecnico_Per_Personal_Nombre,Apu_Lugar_Nombre,Apu_Provincia_Nombre,Apu_Presupuesto_Estado);
          // Construir la cadena de llamada, parámetros y respuesta del procedimiento
          //string llamada ="TotalPaginas.Ver_Version_Id: " + s.Ver_Version_Id + "," + " Ver_Version_Id : " + Ver_Version_Id+ "," + " Int_sucursal_id : " + Int_sucursal_id, Numero_Registros + "," + " Codigo_Desde : " + Codigo_Desde+ "," + " Codigo_Hasta : " + Codigo_Hasta, Estado + "," + " Nombre : " + NombreSmallDateTime Fecha_Creacion_Desde, SmallDateTime Fecha_Creacion_Hasta, + "," + " Coordinador_Per_Personal_Nombre : " + Coordinador_Per_Personal_Nombre+ "," + " Tecnico_Per_Personal_Nombre : " + Tecnico_Per_Personal_Nombre+ "," + " Apu_Lugar_Nombre : " + Apu_Lugar_Nombre+ "," + " Apu_Provincia_Nombre : " + Apu_Provincia_Nombre+ "," + " Apu_Presupuesto_Estado : " + Apu_Presupuesto_Estado+ "," + "Nombre del SP: " + " dbo.Apu_Proyecto_ByTotalPaginas " + "," + " resultado: "+ resultado;
          // Registrar la auditoria del procedimiento
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_UNI);
          //Retorna el resultado
          return resultado;
          }
          #endregion
          #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Apu_Proyecto
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Proyecto o)
    {
        o.Nombre = o.Nombre.ToUpper();
        // Genera un nuevo Id, codigo y estado.
        o.GenNewId(s.Int_Sucursal_Numero);
        o.GenCodigo(s.Ver_Version_Id);
        o.GenEstado();
        // Controla el error de clave primaria duplicada.
        o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
        o.Update_Per_Personal_Id = s.Per_Personal_Id;
        o.Int_Sucursal_Id = s.Int_Sucursal_Id;
        o.Int_Moneda_Id = s.Int_Moneda_Id;
        o.Int_Empresa_Id = s.Int_Empresa_Id;
        o.Fecha_Creacion = DateTime.Now;
        o.Fecha_Update = DateTime.Now;
        o.Etapa = "BOR";
        o.Estado = "BOR";

    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Codigo_Institucion,
          o.Nombre,
          o.Apu_Lugar_Id,
          o.Area,
          o.Porcentaje_Costo_Indirecto,
          o.Porcentaje_Costo_Otros,
          o.Fecha_Creacion,
          o.Coordinador_Per_Personal_Id,
          o.Tecnico_Per_Personal_Id,
          o.Etapa,
          o.Int_Sucursal_Id,
          o.Int_Moneda_Id,
          o.Fecha_Update,
          o.Creacion_Per_Personal_Id,
          o.Update_Per_Personal_Id,
          o.Estado,
          o.Costo_Directo,
          o.Costo_Total,
          o.Costo_Indirecto,
          o.Costo_Otros,
          o.Descripcion,
          o.Tipo_Contrato
    );
    }
    catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;

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
                {

                    if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto))
                    {
                        eCaso = new System.Exception("");
                        otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                        throw (otroEX);
                    }
                    if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_SucursalNombre))
                    {
                        eCaso = new System.Exception("");
                        otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                        throw (otroEX);
                    }
                    eCaso = new System.Exception(e.Message);
                    otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                    throw (otroEX);
                }
                break;
            default:
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
        }
    }
    //Control de Auditoria
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
    //Retorna el Id Insetado
     return o.Id;
    }
    // Borra
    /// <summary>
    /// Borra el objeto de la tabla Apu_Proyecto
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Proyecto o)
    {
    int resultado = 0;
    try
    {
        resultado = Adapter.Delete(

              o.Id,
              o.Codigo,
              o.Codigo_Institucion,
              o.Nombre,
              o.Apu_Lugar_Id,
              o.Area,
              o.Porcentaje_Costo_Indirecto,
              o.Porcentaje_Costo_Otros,
              o.Fecha_Creacion,
              o.Coordinador_Per_Personal_Id,
              o.Tecnico_Per_Personal_Id,
              o.Etapa,
              o.Int_Sucursal_Id,
              o.Int_Moneda_Id,
              o.Fecha_Update,
              o.Creacion_Per_Personal_Id,
              o.Update_Per_Personal_Id,
              o.Estado,
              o.Costo_Directo,
              o.Costo_Total,
              o.Costo_Indirecto,
              o.Costo_Otros,
              o.Descripcion,
              o.Tipo_Contrato
        );
    }
    catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;

        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Categoria_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Categoria");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Mano_Obra_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Mano Obra");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }

        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Material_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Material");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }

        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Rubro");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }

        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Transporte_Indice_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Transporte Indice");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Equipo_Apu_Proyecto))
        {
            eCaso = new System.Exception("Apu Proyecto Equipo");
            otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
            throw (otroEX);
        }
        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);

    }
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Proyecto
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Proyecto o, Apu_Proyecto original)
    {
    int resultado = 0;
    o.Update_Per_Personal_Id = s.Per_Personal_Id;
    o.Fecha_Update = DateTime.Now;
    o.Nombre = o.Nombre.ToUpper();
    try
    {
        resultado = Adapter.Update(

              o.Id,
              o.Codigo,
              o.Codigo_Institucion,
              o.Nombre,
              o.Apu_Lugar_Id,
              o.Area,
              o.Porcentaje_Costo_Indirecto,
              o.Porcentaje_Costo_Otros,
              o.Fecha_Creacion,
              o.Coordinador_Per_Personal_Id,
              o.Tecnico_Per_Personal_Id,
              o.Etapa,
              o.Int_Sucursal_Id,
              o.Int_Moneda_Id,
              o.Fecha_Update,
              o.Creacion_Per_Personal_Id,
              o.Update_Per_Personal_Id,
              o.Estado,
              o.Costo_Directo,
              o.Costo_Total,
              o.Costo_Indirecto,
              o.Costo_Otros,
              o.Descripcion,
              o.Tipo_Contrato,
              original.Id,
              original.Codigo,
              original.Codigo_Institucion,
              original.Nombre,
              original.Apu_Lugar_Id,
              original.Area,
              original.Porcentaje_Costo_Indirecto,
              original.Porcentaje_Costo_Otros,
              original.Fecha_Creacion,
              original.Coordinador_Per_Personal_Id,
              original.Tecnico_Per_Personal_Id,
              original.Etapa,
              original.Int_Sucursal_Id,
              original.Int_Moneda_Id,
              original.Fecha_Update,
              original.Creacion_Per_Personal_Id,
              original.Update_Per_Personal_Id,
              original.Estado,
              original.Costo_Directo,
              original.Costo_Total,
              original.Costo_Indirecto,
              original.Costo_Otros,
              original.Descripcion,
              original.Tipo_Contrato

        );
    }
    catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;

        if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }

        if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_SucursalNombre))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
            throw (otroEX);
        }
        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);
    }
    //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
