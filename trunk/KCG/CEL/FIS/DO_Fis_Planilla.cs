
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.FiscalizacionTableAdapters;
using AEL.FIS;
using BEL;
using System;

namespace CEL.FIS
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Fiscalizaci
    /// Tabla:Fis_Planilla
    /// </summary>
    public class DO_Fis_Planilla
    {
        #region Adapter
        private Fis_PlanillaTableAdapter _Adapter;
        private Fis_PlanillaPagoTableAdapter _AdapterPago;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_PlanillaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_PlanillaTableAdapter();
                return _Adapter;
            }
        }

        public Fis_PlanillaPagoTableAdapter AdapterPago
        {
            get
            {
                if (_AdapterPago == null)
                    _AdapterPago = new Fis_PlanillaPagoTableAdapter();
                return _AdapterPago;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Planilla
        /// </summary> 
        /// <returns>Lista de objetos Fis_Planilla</returns> 
            public List<Fis_Planilla> Get(Scope s, string Apu_Presupuesto_Codigo_Institucional, string Apu_Presupuesto_Nombre, string Contratista_Per_Personal_Nombre, string Numero_Planilla_Desde, string Numero_Planilla_Hasta, DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta, string Tipo_Planilla, decimal Total_Desde, decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
            {
                string llamada = "";
                List<Fis_Planilla> lista = new List<Fis_Planilla>();
                //Extrae los datos
                if (s != null)
                {
                    Fiscalizacion.Fis_PlanillaDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id, Apu_Presupuesto_Codigo_Institucional, Apu_Presupuesto_Nombre, Contratista_Per_Personal_Nombre, Numero_Planilla_Desde, Numero_Planilla_Hasta, Fecha_Inicial_Desde, Fecha_Final_Hasta, Tipo_Planilla, Total_Desde, Total_Hasta, Fecha_Pago_Desde, Fecha_Pago_Hasta, s.Numero_Registros, s.Pagina_Actual);
                    //Cuenta  el número  de registros de la tabla
                    int numeroRegistros = tabla.Count;
                    llamada = "TotalPaginas.Ver_Version_Id: " + s.Ver_Version_Id + ","
                    + " Ver_Version_Id : " + s.Ver_Version_Id + ","
                    + " Apu_Presupuesto_Codigo_Institucional : " + Apu_Presupuesto_Codigo_Institucional + ","
                    + " Apu_Presupuesto_Nombre : " + Apu_Presupuesto_Nombre + ","
                    + " Contratista_Per_Personal_Nombre : " + Contratista_Per_Personal_Nombre + ","
                    + " Numero_Planilla_Desde : " + Numero_Planilla_Desde + ","
                    + " Numero_Planilla_Hasta : " + Numero_Planilla_Hasta + ","
                    + " Fecha_Inicial_Desde: " + Fecha_Inicial_Desde + ","
                    + " Fecha_Final_Hasta " + Fecha_Final_Hasta + ","
                    + " Tipo_Planilla : " + Tipo_Planilla + ","
                    + " Total_Desde : " + Total_Desde + ","
                    + " Total_Hasta : " + Total_Hasta + ","
                    + " Fecha_Pago_Desde : " + Fecha_Pago_Desde + ","
                    + " SmallDateTime : " + Fecha_Pago_Hasta + ","
                    + " Numero_Registros : " + s.Numero_Registros + ","
                    + " Pagina_Actual : " + s.Pagina_Actual + ","
                    + " Nombre del SP: " + " dbo.Fis_Planilla_Select " + ",";
                    //Carga en la lista
                    foreach (Fiscalizacion.Fis_PlanillaRow fila in tabla)
                        lista.Add(new Fis_Planilla(
                              fila.Id,
                              fila.Codigo,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Tipo_Planilla,
                              fila.Apu_Presupuesto_Id,
                              fila.Fecha_Inicio_Ingreso,
                              fila.Fecha_Inicial,
                              fila.Fecha_Final,
                              fila.Fecha_Ultimo_Ingreso,
                              fila.Porcentaje_Iva,
                              fila.Porcentaje_Retencion,
                              fila.Fecha_Reajuste_Provisional,
                              fila.Fecha_Reajuste_Definitivo,
                              fila.Numero_Planilla,
                              fila.Descripcion_Provisional,
                              fila.Descripcion_Definitiva,
                              fila.Anticipo_Devengar,
                              fila.Provisional_Fis_Catalogo_Id,
                              fila.Definitivo_Fis_Catalogo_Id,
                              fila.Fecha_Pago,
                              fila.Apu_Presupuesto_Apu_Origen_Id,
                              fila.Apu_Presupuesto_Codigo,
                              fila.Apu_Presupuesto_Nombre,
                              fila.Tipo_Nombre,
                              fila.Estado_Nombre,
                              fila.Total, 
                              fila.Apu_Presupuesto_Codigo_Institucional,
                              fila.Contratista_Per_Personal_Nombre,
                              fila.Fis_Planilla_Anio,
                              fila.Apu_Presupuesto_Costo_Total,
                              fila.Numero_Dias_Periodo,
                              fila.Fecha_Contrato_Inicial,
                              fila.Apu_Presupuesto_Plazo,
                              fila.Fecha_Contrato_Final,
                              fila.Deduccion_Anticipo,
                              fila.Provisional_Fis_Catalogo_Fecha_Publicacion,
                              fila.Definitivo_Fis_Catalogo_Fecha_Publicacion));
                }
                //Devuleve la Lista
                return lista;
            }
            public List<Fis_Planilla> GetById(Scope s, string Id)
            {
                string llamada = "";
                List<Fis_Planilla> lista = new List<Fis_Planilla>();
                //Extrae los datos
                if (s != null)
                {
                    Fiscalizacion.Fis_PlanillaDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                    //Cuenta  el número  de registros de la tabla
                    int numeroRegistros = tabla.Count;
                    // Construir la cadena de llamada, parámetros y respuesta del procedimiento
                    llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_ById " + " Número de Registros: " + numeroRegistros;
             
                    //Carga en la lista
                    foreach (Fiscalizacion.Fis_PlanillaRow fila in tabla)
                        lista.Add(new Fis_Planilla(
                              fila.Id,
                              fila.Codigo,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Tipo_Planilla,
                              fila.Apu_Presupuesto_Id,
                              fila.Fecha_Inicio_Ingreso,
                              fila.Fecha_Inicial,
                              fila.Fecha_Final,
                              fila.Fecha_Ultimo_Ingreso,
                              fila.Porcentaje_Iva,
                              fila.Porcentaje_Retencion,
                              fila.Fecha_Reajuste_Provisional,
                              fila.Fecha_Reajuste_Definitivo,
                              fila.Numero_Planilla,
                              fila.Descripcion_Provisional,
                              fila.Descripcion_Definitiva,
                              fila.Anticipo_Devengar,
                              fila.Provisional_Fis_Catalogo_Id,
                              fila.Definitivo_Fis_Catalogo_Id,
                              fila.Fecha_Pago,
                              fila.Apu_Presupuesto_Apu_Origen_Id,
                              fila.Apu_Presupuesto_Codigo,
                              fila.Apu_Presupuesto_Nombre,
                              fila.Tipo_Nombre,
                              fila.Estado_Nombre,
                              fila.Total,
                              fila.Apu_Presupuesto_Codigo_Institucional,
                              fila.Contratista_Per_Personal_Nombre,
                              fila.Fis_Planilla_Anio,
                              fila.Apu_Presupuesto_Costo_Total,
                              fila.Numero_Dias_Periodo,
                              fila.Fecha_Contrato_Inicial,
                              fila.Apu_Presupuesto_Plazo,
                              fila.Fecha_Contrato_Final,
                              fila.Deduccion_Anticipo,
                              fila.Provisional_Fis_Catalogo_Fecha_Publicacion,
                              fila.Definitivo_Fis_Catalogo_Fecha_Publicacion));
                }
                //Realiza la auditoria
                //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
                //Devuleve la Lista
                return lista;
            }
            public List<Fis_Planilla> GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            string llamada = "";
            List<Fis_Planilla> lista = new List<Fis_Planilla>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_PlanillaDataTable tabla =
                Adapter.GetByPresupuesto(s.Ver_Version_Id, Apu_Presupuesto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPresupuesto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_ByPresupuesto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_PlanillaRow fila in tabla)
                    lista.Add(new Fis_Planilla(
                          fila.Id,
                          fila.Codigo,
                          fila.Estado,
                          fila.Descripcion,
                          fila.Tipo_Planilla,
                          fila.Apu_Presupuesto_Id,
                          fila.Fecha_Inicio_Ingreso,
                          fila.Fecha_Inicial,
                          fila.Fecha_Final,
                          fila.Fecha_Ultimo_Ingreso,
                          fila.Porcentaje_Iva,
                          fila.Porcentaje_Retencion,
                          fila.Fecha_Reajuste_Provisional,
                          fila.Fecha_Reajuste_Definitivo,
                          fila.Numero_Planilla,
                          fila.Descripcion_Provisional,
                          fila.Descripcion_Definitiva,
                          fila.Anticipo_Devengar,
                          fila.Provisional_Fis_Catalogo_Id,
                          fila.Definitivo_Fis_Catalogo_Id,
                          fila.Fecha_Pago,
                          fila.Apu_Presupuesto_Apu_Origen_Id,
                          fila.Apu_Presupuesto_Codigo,
                          fila.Apu_Presupuesto_Nombre,
                          fila.Tipo_Nombre,
                          fila.Estado_Nombre,
                          fila.Total,
                          fila.Apu_Presupuesto_Codigo_Institucional,
                          fila.Contratista_Per_Personal_Nombre,
                          fila.Fis_Planilla_Anio,
                          fila.Apu_Presupuesto_Costo_Total,
                          fila.Numero_Dias_Periodo,
                          fila.Fecha_Contrato_Inicial,
                          fila.Apu_Presupuesto_Plazo,
                          fila.Fecha_Contrato_Final,
                          fila.Deduccion_Anticipo,
                          fila.Provisional_Fis_Catalogo_Fecha_Publicacion,
                          fila.Definitivo_Fis_Catalogo_Fecha_Publicacion));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
            public List<Fis_Planilla> GetByCodigo(Scope s, string Codigo)
            {
                string llamada = "";
                List<Fis_Planilla> lista = new List<Fis_Planilla>();
                //Extrae los datos
                if (s != null)
                {
                    Fiscalizacion.Fis_PlanillaDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                    //Cuenta  el número  de registros de la tabla
                    int numeroRegistros = tabla.Count;
                    llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_ByCodigo " + " Número de Registros: " + numeroRegistros;
                    //Carga en la lista
                    foreach (Fiscalizacion.Fis_PlanillaRow fila in tabla)
                        lista.Add(new Fis_Planilla(
                          fila.Id,
                          fila.Codigo,
                          fila.Estado,
                          fila.Descripcion,
                          fila.Tipo_Planilla,
                          fila.Apu_Presupuesto_Id,
                          fila.Fecha_Inicio_Ingreso,
                          fila.Fecha_Inicial,
                          fila.Fecha_Final,
                          fila.Fecha_Ultimo_Ingreso,
                          fila.Porcentaje_Iva,
                          fila.Porcentaje_Retencion,
                          fila.Fecha_Reajuste_Provisional,
                          fila.Fecha_Reajuste_Definitivo,
                          fila.Numero_Planilla,
                          fila.Descripcion_Provisional,
                          fila.Descripcion_Definitiva,
                          fila.Anticipo_Devengar,
                          fila.Provisional_Fis_Catalogo_Id,
                          fila.Definitivo_Fis_Catalogo_Id,
                          fila.Fecha_Pago,
                          fila.Apu_Presupuesto_Apu_Origen_Id,
                          fila.Apu_Presupuesto_Codigo,
                          fila.Apu_Presupuesto_Nombre,
                          fila.Tipo_Nombre,
                          fila.Estado_Nombre,
                          fila.Total,
                          fila.Apu_Presupuesto_Codigo_Institucional,
                          fila.Contratista_Per_Personal_Nombre,
                          fila.Fis_Planilla_Anio,
                          fila.Apu_Presupuesto_Costo_Total,
                          fila.Numero_Dias_Periodo,
                          fila.Fecha_Contrato_Inicial,
                          fila.Apu_Presupuesto_Plazo,
                          fila.Fecha_Contrato_Final,
                          fila.Deduccion_Anticipo,
                          fila.Provisional_Fis_Catalogo_Fecha_Publicacion,
                          fila.Definitivo_Fis_Catalogo_Fecha_Publicacion));
                }
                //Realiza la auditoria
                //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
                //Devuleve la Lista
                return lista;
            }

          #region  Procedimiento de SELECT  UNI  TotalPaginas
          public int TotalPaginas(Scope s ,string Apu_Presupuesto_Codigo_Institucional,string Apu_Presupuesto_Nombre,string Contratista_Per_Personal_Nombre,string Numero_Planilla_Desde,string Numero_Planilla_Hasta,DateTime Fecha_Inicial_Desde, DateTime Fecha_Final_Hasta,string Tipo_Planilla,decimal Total_Desde,decimal Total_Hasta, DateTime Fecha_Pago_Desde, DateTime Fecha_Pago_Hasta)
          {
          int  resultado = 0;

          resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, Apu_Presupuesto_Codigo_Institucional, Apu_Presupuesto_Nombre, Contratista_Per_Personal_Nombre, Numero_Planilla_Desde, Numero_Planilla_Hasta, Fecha_Inicial_Desde, Fecha_Final_Hasta, Tipo_Planilla, Total_Desde, Total_Hasta, Fecha_Pago_Desde, Fecha_Pago_Hasta, s.Numero_Registros);
          
          return resultado;
          }
          #endregion
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Fis_Planilla
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Planilla o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Tipo_Planilla,
                      o.Apu_Presupuesto_Id,
                      o.Fecha_Inicio_Ingreso,
                      o.Fecha_Inicial,
                      o.Fecha_Final,
                      o.Fecha_Ultimo_Ingreso,
                      o.Porcentaje_Iva,
                      o.Porcentaje_Retencion,
                      o.Fecha_Reajuste_Provisional,
                      o.Fecha_Reajuste_Definitivo,
                      o.Numero_Planilla,
                      o.Descripcion_Provisional,
                      o.Descripcion_Definitiva,
                      o.Anticipo_Devengar,
                      o.Provisional_Fis_Catalogo_Id,
                      o.Definitivo_Fis_Catalogo_Id
                );
            }
            catch (SqlException e)
            {
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
                            throw;
                        break;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Fis_Planilla
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Planilla o)
        {
            int resultado = 0;

            try
            {
                resultado = Adapter.Delete(

                          o.Id,
                          o.Codigo,
                          o.Estado,
                          o.Descripcion,
                          o.Tipo_Planilla,
                          o.Apu_Presupuesto_Id,
                          o.Fecha_Inicio_Ingreso,
                          o.Fecha_Inicial,
                          o.Fecha_Final,
                          o.Fecha_Ultimo_Ingreso,
                          o.Porcentaje_Iva,
                          o.Porcentaje_Retencion,
                          o.Fecha_Reajuste_Provisional,
                          o.Fecha_Reajuste_Definitivo,
                          o.Numero_Planilla,
                          o.Descripcion_Provisional,
                          o.Descripcion_Definitiva,
                          o.Anticipo_Devengar,
                          o.Provisional_Fis_Catalogo_Id,
                          o.Definitivo_Fis_Catalogo_Id
                );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Fis_Planilla_Det_Fis_Planilla))
                {
                    eCaso = new System.Exception("Fis Planilla Det");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Fis_Planilla_Multa_Fis_Planilla))
                {
                    eCaso = new System.Exception("Fis Planilla Multa");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                throw (e);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Planilla
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Planilla o, Fis_Planilla original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Tipo_Planilla,
                      o.Apu_Presupuesto_Id,
                      o.Fecha_Inicio_Ingreso,
                      o.Fecha_Inicial,
                      o.Fecha_Final,
                      o.Fecha_Ultimo_Ingreso,
                      o.Porcentaje_Iva,
                      o.Porcentaje_Retencion,
                      o.Fecha_Reajuste_Provisional,
                      o.Fecha_Reajuste_Definitivo,
                      o.Numero_Planilla,
                      o.Descripcion_Provisional,
                      o.Descripcion_Definitiva,
                      o.Anticipo_Devengar,
                      o.Provisional_Fis_Catalogo_Id,
                      o.Definitivo_Fis_Catalogo_Id,
                      original.Id,
                      original.Codigo,
                      original.Estado,
                      original.Descripcion,
                      original.Tipo_Planilla,
                      original.Apu_Presupuesto_Id,
                      original.Fecha_Inicio_Ingreso,
                      original.Fecha_Inicial,
                      original.Fecha_Final,
                      original.Fecha_Ultimo_Ingreso,
                      original.Porcentaje_Iva,
                      original.Porcentaje_Retencion,
                      original.Fecha_Reajuste_Provisional,
                      original.Fecha_Reajuste_Definitivo,
                      original.Numero_Planilla,
                      original.Descripcion_Provisional,
                      original.Descripcion_Definitiva,
                      original.Anticipo_Devengar,
                      original.Provisional_Fis_Catalogo_Id,
                      original.Definitivo_Fis_Catalogo_Id

                );
            }
            catch (SqlException e)
            {
                //Exception eCaso;
                //Exception otroEX;

                //eCaso = new System.Exception(e.Message);
                //otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                //throw (otroEX);
                throw (e);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }

        public int UpdateEstadoPago(Scope s, String Id, String EstadoPago)
        {
            int resultado = 0;

            try
            {
                resultado = AdapterPago.Update(
                      Id,
                      EstadoPago
                );
            }
            catch (SqlException e)
            {
                throw (e);
            }
            return resultado;
        }
        #endregion
    }
}
