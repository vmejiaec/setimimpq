
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
    /// Tabla:Apu_Proyecto_Rubro
    /// </summary>
    public class DO_Apu_Proyecto_Rubro
    {
        #region Adapter
        private Apu_Proyecto_RubroTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Proyecto_RubroTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Proyecto_RubroTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Rubro
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Rubro</returns> 
        public List<Apu_Proyecto_Rubro> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_RubroDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " 
                        + " Nombre del Store Procedure: " + " Apu_Proyecto_Rubro_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Proyecto_Id,
                        fila.Apu_Rubro_Id,
                        fila.Cantidad,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Proyecto_Codigo,
                        fila.Apu_Proyecto_Nombre,
                        fila.Apu_Proyecto_Costo_Total,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Estado_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Material_costo_total,
                        fila.Transporte_costo_total,
                        fila.Mano_obra_costo_total,
                        fila.Equipo_costo_total,
                        fila.Costo_Unitario,
                        fila.Costo_Total,
                        fila.Apu_Proyecto_Etapa,
                        fila.Apu_rubro_Costo_Total,
                        fila.Material_ultima_fecha_update,
                        fila.Transporte_ultima_fecha_update,
                        fila.Mano_obra_ultima_fecha_update,
                        fila.Equipo_ultima_fecha_update,
                        fila.Int_moneda_simbolo,
                        fila.Int_Sucursal_Id,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo_Indirecto));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_RubroDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Proyecto_Id,
                        fila.Apu_Rubro_Id,
                        fila.Cantidad,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Proyecto_Codigo,
                        fila.Apu_Proyecto_Nombre,
                        fila.Apu_Proyecto_Costo_Total,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Estado_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Material_costo_total,
                        fila.Transporte_costo_total,
                        fila.Mano_obra_costo_total,
                        fila.Equipo_costo_total,
                        fila.Costo_Unitario,
                        fila.Costo_Total,
                        fila.Apu_Proyecto_Etapa,
                        fila.Apu_rubro_Costo_Total,
                        fila.Material_ultima_fecha_update,
                        fila.Transporte_ultima_fecha_update,
                        fila.Mano_obra_ultima_fecha_update,
                        fila.Equipo_ultima_fecha_update,
                        fila.Int_moneda_simbolo,
                        fila.Int_Sucursal_Id,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo_Indirecto));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_RubroDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Proyecto_Id,
                        fila.Apu_Rubro_Id,
                        fila.Cantidad,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Proyecto_Codigo,
                        fila.Apu_Proyecto_Nombre,
                        fila.Apu_Proyecto_Costo_Total,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Estado_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Material_costo_total,
                        fila.Transporte_costo_total,
                        fila.Mano_obra_costo_total,
                        fila.Equipo_costo_total,
                        fila.Costo_Unitario,
                        fila.Costo_Total,
                        fila.Apu_Proyecto_Etapa,
                        fila.Apu_rubro_Costo_Total,
                        fila.Material_ultima_fecha_update,
                        fila.Transporte_ultima_fecha_update,
                        fila.Mano_obra_ultima_fecha_update,
                        fila.Equipo_ultima_fecha_update,
                        fila.Int_moneda_simbolo,
                        fila.Int_Sucursal_Id,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo_Indirecto));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro> GetByProyecto(Scope s, string Apu_Proyecto_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_RubroDataTable tabla = Adapter.GetByProyecto(s.Ver_Version_Id, Apu_Proyecto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Proyecto_Id : " + Apu_Proyecto_Id 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_ByProyecto " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Proyecto_Id,
                        fila.Apu_Rubro_Id,
                        fila.Cantidad,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Proyecto_Codigo,
                        fila.Apu_Proyecto_Nombre,
                        fila.Apu_Proyecto_Costo_Total,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Estado_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Material_costo_total,
                        fila.Transporte_costo_total,
                        fila.Mano_obra_costo_total,
                        fila.Equipo_costo_total,
                        fila.Costo_Unitario,
                        fila.Costo_Total,
                        fila.Apu_Proyecto_Etapa,
                        fila.Apu_rubro_Costo_Total,
                        fila.Material_ultima_fecha_update,
                        fila.Transporte_ultima_fecha_update,
                        fila.Mano_obra_ultima_fecha_update,
                        fila.Equipo_ultima_fecha_update,
                        fila.Int_moneda_simbolo,
                        fila.Int_Sucursal_Id,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo_Indirecto));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro> GetBySucursal(Scope s, string Int_Sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, 
                                                      string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, 
                                                      string Apu_Titulo_Nombre)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro> lista = new List<Apu_Proyecto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                try
                {
                    Apu.Apu_Proyecto_RubroDataTable tabla = Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id, s.Numero_Registros, 
                                                                                  s.Pagina_Actual, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, 
                                                                                  Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, 
                                                                                  Apu_Titulo_Nombre);
                    //Cuenta  el número  de registros de la tabla
                    int numeroRegistros = tabla.Count;
                    llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," 
                            + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Sucursal_id : " + s.Int_Sucursal_Id + "," 
                            + " Numero_Registros : " + s.Numero_Registros + "," + " Pagina_Actual : " + s.Pagina_Actual + "," 
                            + " Apu_Proyecto_Codigo : " + Apu_Proyecto_Codigo + "," + " Apu_Proyecto_Nombre : " + Apu_Proyecto_Nombre + "," 
                            + " Apu_Rubro_Codigo : " + Apu_Rubro_Codigo + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + "," 
                            + " Apu_Subtitulo_Nombre : " + Apu_Subtitulo_Nombre + "," + " Apu_Titulo_Nombre : " + Apu_Titulo_Nombre 
                            + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_bySucursal " 
                            + " Número de Registros: " + numeroRegistros;
                    //Carga en la lista
                    foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
                        lista.Add(new Apu_Proyecto_Rubro(fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Apu_Proyecto_Id,
                        fila.Apu_Rubro_Id,
                        fila.Cantidad,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Apu_Subtitulo_id,
                        fila.Apu_Proyecto_Codigo,
                        fila.Apu_Proyecto_Nombre,
                        fila.Apu_Proyecto_Costo_Total,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Rubro_Codigo,
                        fila.Apu_Rubro_Nombre,
                        fila.Apu_Rubro_Unidad,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Estado_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Material_costo_total,
                        fila.Transporte_costo_total,
                        fila.Mano_obra_costo_total,
                        fila.Equipo_costo_total,
                        fila.Costo_Unitario,
                        fila.Costo_Total,
                        fila.Apu_Proyecto_Etapa,
                        fila.Apu_rubro_Costo_Total,
                        fila.Material_ultima_fecha_update,
                        fila.Transporte_ultima_fecha_update,
                        fila.Mano_obra_ultima_fecha_update,
                        fila.Equipo_ultima_fecha_update,
                        fila.Int_moneda_simbolo,
                        fila.Int_Sucursal_Id,
                        fila.Costo_Indirecto,
                        fila.Costo_Directo_Indirecto));
                }
                catch (Exception e)
                {
                    throw (e);
                }
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List <Apu_Proyecto_Rubro> GetByProyecto_Oferta( Scope s , string apu_proyecto_id, string Apu_Oferta_Id)
          {
          string llamada = "";
          List <Apu_Proyecto_Rubro> lista= new List <Apu_Proyecto_Rubro> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Proyecto_RubroDataTable tabla = 
          Adapter.GetByProyecto_Oferta(s.Ver_Version_Id,apu_proyecto_id, Apu_Oferta_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetByProyecto_Oferta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Proyecto_Id : " + Apu_Proyecto_Id+ "," + " Apu_Oferta_Id : " + Apu_Oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_ByProy_Oferta " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Proyecto_RubroRow fila in tabla)
          lista.Add(new Apu_Proyecto_Rubro(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Apu_Proyecto_Id,
    fila.Apu_Rubro_Id,
    fila.Cantidad,
    fila.Rendimiento_Mano_Obra,
    fila.Rendimiento_Equipo,
    fila.Apu_Subtitulo_id,
    fila.Apu_Proyecto_Codigo,
    fila.Apu_Proyecto_Nombre,
    fila.Apu_Proyecto_Costo_Total,
    fila.Apu_Subtitulo_Codigo,
    fila.Apu_Subtitulo_Nombre,
    fila.Apu_Rubro_Codigo,
    fila.Apu_Rubro_Nombre,
    fila.Apu_Rubro_Unidad,
    fila.Apu_Titulo_id,
    fila.Apu_Titulo_Codigo,
    fila.Apu_Titulo_Nombre,
    fila.Estado_Nombre,
    fila.Rendimiento_Mano_Obra_Hora,
    fila.Rendimiento_Equipo_Hora,
    fila.Material_costo_total,
    fila.Transporte_costo_total,
    fila.Mano_obra_costo_total,
    fila.Equipo_costo_total,
    fila.Costo_Unitario,
    fila.Costo_Total,
    fila.Apu_Proyecto_Etapa,
    fila.Apu_rubro_Costo_Total,
    fila.Material_ultima_fecha_update,
    fila.Transporte_ultima_fecha_update,
    fila.Mano_obra_ultima_fecha_update,
    fila.Equipo_ultima_fecha_update,
    fila.Int_moneda_simbolo,
    fila.Int_Sucursal_Id,
    fila.Costo_Indirecto,
    fila.Costo_Directo_Indirecto));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }

        public int TotalPaginas(Scope s, string Int_sucursal_id, string Apu_Proyecto_Codigo, string Apu_Proyecto_Nombre, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, string Apu_Subtitulo_Nombre, string Apu_Titulo_Nombre)
        {
            int resultado;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, s.Int_Sucursal_Id, s.Numero_Registros, Apu_Proyecto_Codigo, Apu_Proyecto_Nombre, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Subtitulo_Nombre, Apu_Titulo_Nombre);

            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = "Nombre del Método Utilizado: " + " GetByTotalPaginas" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_sucursal_id : " + Int_sucursal_id + "," + " Apu_Proyecto_Codigo : " + Apu_Proyecto_Codigo + "," + " Apu_Proyecto_Nombre : " + Apu_Proyecto_Nombre + "," + " Apu_Rubro_Codigo : " + Apu_Rubro_Codigo + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + "," + " Apu_Subtitulo_Nombre : " + Apu_Subtitulo_Nombre + "," + " Apu_Titulo_Nombre : " + Apu_Titulo_Nombre + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByTotalPaginas " + " Número de Registros: " + s.Numero_Registros;
            return resultado;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Proyecto_Rubro
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Proyecto_Rubro o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();

            //if (o.Apu_Rubro_Id == null and o.
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Apu_Proyecto_Id,
                      o.Apu_Rubro_Id,
                      o.Cantidad,
                      o.Rendimiento_Mano_Obra,
                      o.Rendimiento_Equipo,
                      o.Apu_Subtitulo_id,
                      o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    default:
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Proyecto_Rubro
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Proyecto_Rubro o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Id,
                    o.Apu_Rubro_Id,
                    o.Cantidad,
                    o.Rendimiento_Mano_Obra,
                    o.Rendimiento_Equipo,
                    o.Apu_Subtitulo_id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Documento_Apu_Proyecto_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Documento");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Equipo_Apu_Proyecto_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Proyecto_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Material_Apu_Proyecto_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Tecnica_Apu_Proyecto_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Tecnica");
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
        //Actualiza la tabla Apu_Proyecto_Rubro
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Proyecto_Rubro o, Apu_Proyecto_Rubro original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Id,
                    o.Apu_Rubro_Id,
                    o.Cantidad,
                    o.Rendimiento_Mano_Obra,
                    o.Rendimiento_Equipo,
                    o.Apu_Subtitulo_id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Proyecto_Id,
                    original.Apu_Rubro_Id,
                    original.Cantidad,
                    original.Rendimiento_Mano_Obra,
                    original.Rendimiento_Equipo,
                    original.Apu_Subtitulo_id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
