
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;
    using AEL;
    using System;
    using System.Data;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Oferta
    /// </summary>
    public class DO_Apu_Oferta
    {
    #region Adapter
    private Apu_OfertaTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_OfertaTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_OfertaTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta</returns> 
    public List <Apu_Oferta> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Oferta> lista= new List <Apu_Oferta> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_OfertaDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Contratista,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Codigo_Institucion,
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
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Directo,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Costo_Total,
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
    public List <Apu_Oferta> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Apu_Oferta> lista= new List <Apu_Oferta> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_OfertaDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_OfertaRow fila in tabla)
          lista.Add(new Apu_Oferta(
          
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Contratista,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Codigo_Institucion,
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
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Directo,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Costo_Total,
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
    public List <Apu_Oferta> GetByLikeCodigoDesde(Scope s, string desde_Codigo)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByLikeCodigoDesde(s.Ver_Version_Id, desde_Codigo, s.Int_Sucursal_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByCodigoDesde" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " desde_Codigo : " + desde_Codigo+ "," + " Int_Sucursal_id : " + Int_Sucursal_id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByCodigoDesde " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByLikeCodigoDesdeHasta(s.Ver_Version_Id,desde_Codigo,hasta_Codigo, s.Int_Sucursal_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByCodigoDesdeHasta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " desde_Codigo : " + desde_Codigo+ "," + " hasta_Codigo : " + hasta_Codigo+ "," + " Int_Sucursal_id : " + Int_Sucursal_id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByCodigoDesdeHasta " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByLikeCodigoHasta(s.Ver_Version_Id,hasta_Codigo, s.Int_Sucursal_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByCodigoHasta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " hasta_Codigo : " + hasta_Codigo+ "," + " Int_Sucursal_id : " + Int_Sucursal_id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByCodigoHasta " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetByEstado(Scope s, string Nombre, string Estado)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByEstado(s.Ver_Version_Id,Nombre, Estado);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByEstado" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " nombre : " + nombre+ "," + " Estado : " + Estado  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByEstado " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetById( Scope s , string Apu_Oferta_Id)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Apu_Oferta_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Oferta_Id : " + Apu_Oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ById " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetByIdResumido( Scope s , string Apu_Oferta_Id)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByIdResumido(s.Ver_Version_Id, Apu_Oferta_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      llamada = "Nombre del Método Utilizado: " + " GetByIdResumido" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Oferta_Id : " + Apu_Oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByIdResumido " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetByLikeNombre ( Scope s , string Nombre)
      {
      string llamada = "";
      List <Apu_Oferta> lista= new List <Apu_Oferta> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_OfertaDataTable tabla = 
      Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre, s.Int_Sucursal_Id);
      //Cuenta  el número  de registros de la tabla
      int numeroRegistros = tabla.Count;
      //llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " nombre : " + nombre+ "," + " Int_Sucursal_id : " + Int_Sucursal_id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
      //Carga en la lista
      foreach (Apu.Apu_OfertaRow fila in tabla)
      lista.Add(new Apu_Oferta(
      
fila.Id,
fila.Codigo,
fila.Nombre,
fila.Estado,
fila.Apu_Lugar_Id,
fila.Area,
fila.Porcentaje_Costo_Indirecto,
fila.Porcentaje_Costo_Otros,
fila.Fecha_Creacion,
fila.Creacion_Per_Personal_Id,
fila.Fecha_Update,
fila.Update_Per_Personal_Id,
fila.Contratista,
fila.Tecnico_Per_Personal_Id,
fila.Etapa,
fila.Int_Sucursal_Id,
fila.Int_Moneda_Id,
fila.Descripcion,
fila.Codigo_Institucion,
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
fila.Tecnico_Per_Personal_Codigo,
fila.Tecnico_Per_Personal_Nombre,
fila.Int_Moneda_Codigo,
fila.Int_Moneda_Nombre,
fila.Int_Moneda_Simbolo,
fila.Costo_Equipo,
fila.Costo_Mano_Obra,
fila.Costo_Material,
fila.Costo_Transporte,
fila.Costo_Directo,
fila.Costo_Indirecto,
fila.Costo_Otros,
fila.Costo_Total,
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
    public List <Apu_Oferta> GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Estado, string Nombre, string Contratista, string Tecnico_Per_Personal_Nombre, string Apu_Lugar_Nombre, string Apu_Provincia_Nombre, string Apu_Presupuesto_Estado_Nombre)
          {
          string llamada = "";
          List <Apu_Oferta> lista= new List <Apu_Oferta> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_OfertaDataTable tabla = 
          Adapter.GetBySucursal(s.Ver_Version_Id,s.Int_Sucursal_Id,s.Numero_Registros,s.Pagina_Actual,Codigo_Desde,Codigo_Hasta,Estado,Nombre,Contratista,Tecnico_Per_Personal_Nombre,Apu_Lugar_Nombre,Apu_Provincia_Nombre,Apu_Presupuesto_Estado_Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_Sucursal_id : " + Int_Sucursal_id+ "," + " Numero_Registros : " + Numero_Registros+ "," + " Pagina_Actual : " + Pagina_Actual+ "," + " Codigo_Desde : " + Codigo_Desde+ "," + " Codigo_Hasta : " + Codigo_Hasta+ "," + " Estado : " + Estado+ "," + " Nombre : " + Nombre+ "," + " Contratista : " + Contratista+ "," + " Tecnico_Per_Personal_Nombre : " + Tecnico_Per_Personal_Nombre+ "," + " Apu_Lugar_Nombre : " + Apu_Lugar_Nombre+ "," + " Apu_Provincia_Nombre : " + Apu_Provincia_Nombre+ "," + " Apu_Presupuesto_Estado : " + Apu_Presupuesto_Estado  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_BySucursal " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_OfertaRow fila in tabla)
          lista.Add(new Apu_Oferta(
          
    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Apu_Lugar_Id,
    fila.Area,
    fila.Porcentaje_Costo_Indirecto,
    fila.Porcentaje_Costo_Otros,
    fila.Fecha_Creacion,
    fila.Creacion_Per_Personal_Id,
    fila.Fecha_Update,
    fila.Update_Per_Personal_Id,
    fila.Contratista,
    fila.Tecnico_Per_Personal_Id,
    fila.Etapa,
    fila.Int_Sucursal_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Codigo_Institucion,
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
    fila.Tecnico_Per_Personal_Codigo,
    fila.Tecnico_Per_Personal_Nombre,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Int_Moneda_Simbolo,
    fila.Costo_Equipo,
    fila.Costo_Mano_Obra,
    fila.Costo_Material,
    fila.Costo_Transporte,
    fila.Costo_Directo,
    fila.Costo_Indirecto,
    fila.Costo_Otros,
    fila.Costo_Total,
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
          public int TotalPaginas(Scope s ,string Codigo_Desde,string Codigo_Hasta,string Estado,string Nombre,string Contratista,string Tecnico_Per_Personal_Nombre,string Apu_Lugar_Nombre,string Apu_Provincia_Nombre,string Apu_Presupuesto_Estado_Nombre )
          {
          int  resultado;
          // Recuperar la lista de objetos a procesar
          List<Apu_Oferta>lista =null;
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.TotalPaginas(s.Ver_Version_Id,s.Int_Sucursal_Id,s.Numero_Registros,Codigo_Desde,Codigo_Hasta,Estado,Nombre,Contratista,Tecnico_Per_Personal_Nombre,Apu_Lugar_Nombre,Apu_Provincia_Nombre,Apu_Presupuesto_Estado_Nombre);
          // Construir la cadena de llamada, parámetros y respuesta del procedimiento
          //Retorna el resultado
          return resultado;
          }
          #endregion
          #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Apu_Oferta
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Oferta o)
    {


    string Codigo = "";
    // Genera un nuevo Id, codigo y estado.
    o.GenNewId(s.Int_Sucursal_Numero);
    GenerarCodigo gen = new GenerarCodigo();
    Codigo = gen.GenCodigo(s.Ver_Version_Id, o.Codigo, "APU_PROYECTO");
    o.Codigo = Codigo;
    o.GenEstado();

    // Controla el error de clave primaria duplicada.
    o.Nombre = o.Nombre.ToUpper();
    o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
    o.Update_Per_Personal_Id = s.Per_Personal_Id;
    o.Int_Sucursal_Id = s.Int_Sucursal_Id;
    o.Int_Moneda_Id = s.Int_Moneda_Id;
    o.Etapa = "BOR";
    o.Estado = "BOR";
    o.Fecha_Creacion = DateTime.Now;
    o.Fecha_Update = DateTime.Now;


    try
    {
    Adapter.Insert(
    
          o.Id,
          o.Codigo,
          o.Nombre,
          o.Apu_Lugar_Id,
          o.Area,
          o.Porcentaje_Costo_Indirecto,
          o.Porcentaje_Costo_Otros,
          o.Fecha_Creacion,
          o.Creacion_Per_Personal_Id,
          o.Fecha_Update,
          o.Update_Per_Personal_Id,
          o.Contratista,
          o.Tecnico_Per_Personal_Id,
          o.Etapa,
          o.Int_Sucursal_Id,
          o.Int_Moneda_Id,
          o.Estado,
          o.Descripcion,
          o.Codigo_Institucion,
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
                    if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Int_Sucursal_Nombre))
                    {
                        eCaso = new System.Exception("El nombre de la oferta ya existe en la base.");
                        otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                        throw (otroEX);
                    }
                    if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta))
                    {
                        eCaso = new System.Exception("");
                        otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
    /// Borra el objeto de la tabla Apu_Oferta
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Oferta o)
    {
    int resultado = 0;
    try
    {     resultado = Adapter.Delete(
          o.Id,
          o.Codigo,
          o.Nombre,
          o.Apu_Lugar_Id,
          o.Area,
          o.Porcentaje_Costo_Indirecto,
          o.Porcentaje_Costo_Otros,
          o.Fecha_Creacion,
          o.Creacion_Per_Personal_Id,
          o.Fecha_Update,
          o.Update_Per_Personal_Id,
          o.Contratista,
          o.Tecnico_Per_Personal_Id,
          o.Etapa,
          o.Int_Sucursal_Id,
          o.Int_Moneda_Id,
          o.Estado,
          o.Descripcion,
          o.Codigo_Institucion,
          o.Tipo_Contrato
          );
        }
        catch (SqlException e)
        {
            System.Exception eCaso;
            System.Exception otroEX;

            if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Equipo_Apu_Oferta))
            {
                eCaso = new System.Exception("Apu Oferta Equipo");
                otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                throw (otroEX);
            }
            if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Mano_Obra_Apu_Oferta))
            {
                eCaso = new System.Exception("Apu Oferta Mano Obra");
                otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                throw (otroEX);
            }
            if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Material_Apu_Oferta))
            {
                eCaso = new System.Exception("Apu Oferta Material");
                otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                throw (otroEX);
            }
            if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Apu_Oferta))
            {
                eCaso = new System.Exception("Apu Oferta Rubro");
                otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                throw (otroEX);
            }
            if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Transporte_Indice_Apu_Oferta))
            {
                eCaso = new System.Exception("Apu Oferta Transporte Indice");
                otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                throw (otroEX);
            }
            eCaso = new System.Exception(e.Message);
            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
            throw (otroEX);
        }
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Apu_Oferta
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Oferta o, Apu_Oferta original)
    {
    int resultado=0;
    o.Update_Per_Personal_Id = s.Per_Personal_Id;
    try
    {
        resultado = Adapter.Update(

              o.Id,
              o.Codigo,
              o.Nombre,
              o.Apu_Lugar_Id,
              o.Area,
              o.Porcentaje_Costo_Indirecto,
              o.Porcentaje_Costo_Otros,
              o.Fecha_Creacion,
              o.Creacion_Per_Personal_Id,
              o.Fecha_Update,
              o.Update_Per_Personal_Id,
              o.Contratista,
              o.Tecnico_Per_Personal_Id,
              o.Etapa,
              o.Int_Sucursal_Id,
              o.Int_Moneda_Id,
              o.Estado,
              o.Descripcion,
              o.Codigo_Institucion,
              o.Tipo_Contrato,
              original.Id,
              original.Codigo,
              original.Nombre,
              original.Apu_Lugar_Id,
              original.Area,
              original.Porcentaje_Costo_Indirecto,
              original.Porcentaje_Costo_Otros,
              original.Fecha_Creacion,
              original.Creacion_Per_Personal_Id,
              original.Fecha_Update,
              original.Update_Per_Personal_Id,
              original.Contratista,
              original.Tecnico_Per_Personal_Id,
              original.Etapa,
              original.Int_Sucursal_Id,
              original.Int_Moneda_Id,
              original.Estado,
              original.Descripcion,
              original.Codigo_Institucion,
              original.Tipo_Contrato

        );
    }
    catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;

        if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
            throw (otroEX);
        }
        if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Int_Sucursal_Nombre))
        {
            eCaso = new System.Exception("");
            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
            throw (otroEX);
        }
        eCaso = new System.Exception(e.Message);
        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
        throw (otroEX);

    }
        ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }

    #endregion
    }
    }
