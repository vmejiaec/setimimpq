
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
    /// Tabla:Fis_Ampliacion
    /// </summary>
    public class DO_Fis_Ampliacion
    {
        #region Adapter
        private Fis_AmpliacionTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_AmpliacionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_AmpliacionTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Ampliacion
        /// </summary> 
        /// <returns>Lista de objetos Fis_Ampliacion</returns> 
        public List<Fis_Ampliacion> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_AmpliacionDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " 
                        + " Fis_Ampliacion_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_AmpliacionRow fila in tabla)
                    lista.Add(new Fis_Ampliacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Descripcion,
                        fila.Apu_Presupuesto_Id,
                        fila.Fecha_Autorizacion,
                        fila.Plazo_Dias,
                        fila.Plazo_Total_Prorroga,
                        fila.Fecha_Final_Prorroga,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Ampliacion> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_AmpliacionDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " 
                        + "dbo.Fis_Ampliacion_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_AmpliacionRow fila in tabla)
                    lista.Add(new Fis_Ampliacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Descripcion,
                        fila.Apu_Presupuesto_Id,
                        fila.Fecha_Autorizacion,
                        fila.Plazo_Dias,
                        fila.Plazo_Total_Prorroga,
                        fila.Fecha_Final_Prorroga,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Ampliacion> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_AmpliacionDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Ampliacion_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_AmpliacionRow fila in tabla)
                    lista.Add(new Fis_Ampliacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Descripcion,
                        fila.Apu_Presupuesto_Id,
                        fila.Fecha_Autorizacion,
                        fila.Plazo_Dias,
                        fila.Plazo_Total_Prorroga,
                        fila.Fecha_Final_Prorroga,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Ampliacion> GetByPresuesto(Scope s, string Apu_Presupuesto_Id)
        {
            string llamada = "";
            List<Fis_Ampliacion> lista = new List<Fis_Ampliacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_AmpliacionDataTable tabla = Adapter.GetByPresuesto(s.Ver_Version_Id, Apu_Presupuesto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPresuesto" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Ampliacion_ByPresupuesto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_AmpliacionRow fila in tabla)
                    lista.Add(new Fis_Ampliacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Descripcion,
                        fila.Apu_Presupuesto_Id,
                        fila.Fecha_Autorizacion,
                        fila.Plazo_Dias,
                        fila.Plazo_Total_Prorroga,
                        fila.Fecha_Final_Prorroga,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Fis_Ampliacion
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Ampliacion o)
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
                    o.Apu_Presupuesto_Id,
                    o.Nombre,
                    o.Fecha_Autorizacion,
                    o.Plazo_Dias);
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
                        if (mensaje.Contains(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Ampliacion_Codigo))
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Fis_Ampliacion
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Ampliacion o)
        {
            int resultado = 0;
            try
            {
                Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Estado,
                    o.Descripcion,
                    o.Apu_Presupuesto_Id,
                    o.Nombre,
                    o.Fecha_Autorizacion,
                    o.Plazo_Dias);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Ampliacion
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Ampliacion o, Fis_Ampliacion original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Apu_Presupuesto_Id,
                      o.Nombre,
                      o.Fecha_Autorizacion,
                      o.Plazo_Dias,
                      original.Id,
                      original.Codigo,
                      original.Estado,
                      original.Descripcion,
                      original.Apu_Presupuesto_Id,
                      original.Nombre,
                      original.Fecha_Autorizacion,
                      original.Plazo_Dias);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Ampliacion_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
