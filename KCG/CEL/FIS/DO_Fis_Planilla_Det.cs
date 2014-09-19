
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
    /// Tabla:Fis_Planilla_Det
    /// </summary>
    public class DO_Fis_Planilla_Det
    {
        #region Adapter
        private Fis_Planilla_DetTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Planilla_DetTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Planilla_DetTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Planilla_Det
        /// </summary> 
        /// <returns>Lista de objetos Fis_Planilla_Det</returns> 
        public List<Fis_Planilla_Det> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Planilla_Det> lista = new List<Fis_Planilla_Det>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_DetDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Fis_Planilla_Det_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_DetRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Prespuesto_Rubro_Id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Costo,
                                      fila.Cantidad, 
                                      fila.Apu_Prespuesto_Rubro_Codigo,
                                      fila.Apu_Prespuesto_Rubro_Cantidad,
                                      fila.Acumulado,
                                      fila.Diferencia,
                                      fila.SubTotal,
                                      fila.Estado_Nombre, 
                                      fila.Fis_Planilla_Id, 
                                      fila.Fis_Planilla_Codigo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Det> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Planilla_Det> lista = new List<Fis_Planilla_Det>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_DetDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Det_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_DetRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Prespuesto_Rubro_Id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Costo,
                                      fila.Cantidad,
                                      fila.Apu_Prespuesto_Rubro_Codigo,
                                      fila.Apu_Prespuesto_Rubro_Cantidad,
                                      fila.Acumulado,
                                      fila.Diferencia,
                                      fila.SubTotal,
                                      fila.Estado_Nombre, 
                                      fila.Fis_Planilla_Id, 
                                      fila.Fis_Planilla_Codigo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Det> GetByLikePrespRub(Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre)
        {
            string llamada = "";
            List<Fis_Planilla_Det> lista = new List<Fis_Planilla_Det>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_DetDataTable tabla =
                Adapter.GetByLikePrespRub(s.Ver_Version_Id, Apu_Presupuesto_Id, Apu_Rubro_Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikePrespRub" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Det_ByLikePrespRub " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_DetRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Prespuesto_Rubro_Id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Costo,
                                      fila.Cantidad,
                                      fila.Apu_Prespuesto_Rubro_Codigo,
                                      fila.Apu_Prespuesto_Rubro_Cantidad,
                                      fila.Acumulado,
                                      fila.Diferencia,
                                      fila.SubTotal,
                                      fila.Estado_Nombre,
                                      fila.Fis_Planilla_Id,
                                      fila.Fis_Planilla_Codigo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Det> GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            string llamada = "";
            List<Fis_Planilla_Det> lista = new List<Fis_Planilla_Det>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_DetDataTable tabla =
                Adapter.GetByPlanilla(s.Ver_Version_Id, Fis_Planilla_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPlanilla" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Planilla_Id : " + Fis_Planilla_Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Det_ByPlanilla " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_DetRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Prespuesto_Rubro_Id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Costo,
                                      fila.Cantidad,
                                      fila.Apu_Prespuesto_Rubro_Codigo,
                                      fila.Apu_Prespuesto_Rubro_Cantidad,
                                      fila.Acumulado,
                                      fila.Diferencia, 
                                      fila.SubTotal,
                                      fila.Estado_Nombre,
                                      fila.Fis_Planilla_Id,
                                      fila.Fis_Planilla_Codigo));
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
        /// Inserta el objeto en la tabla Fis_Planilla_Det
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Planilla_Det o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            o.Estado = null;
            o.Descripcion = null;
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Apu_Prespuesto_Rubro_Id,
                      o.Apu_Rubro_Codigo,
                      o.Apu_Rubro_Nombre,
                      o.Apu_Rubro_Unidad,
                      o.Costo,
                      o.Cantidad, 
                      o.Fis_Planilla_Id);
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
                        if (mensaje.StartsWith(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                        {
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
        /// Borra el objeto de la tabla Fis_Planilla_Det
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Planilla_Det o)
        {
            int resultado = 0;

            try
            {
                resultado = Adapter.Delete(

                       o.Id,
                       o.Codigo,
                       o.Estado,
                       o.Descripcion,
                       o.Apu_Prespuesto_Rubro_Id,
                       o.Apu_Rubro_Codigo,
                       o.Apu_Rubro_Nombre,
                       o.Apu_Rubro_Unidad,
                       o.Costo,
                       o.Cantidad,
                      o.Fis_Planilla_Id
                 );
            }
            catch (SqlException e)
            {
                throw (e);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Planilla_Det
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Planilla_Det o, Fis_Planilla_Det original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Apu_Prespuesto_Rubro_Id,
                      o.Apu_Rubro_Codigo,
                      o.Apu_Rubro_Nombre,
                      o.Apu_Rubro_Unidad,
                      o.Costo,
                      o.Cantidad,
                      o.Fis_Planilla_Id,
                      original.Id,
                      original.Codigo,
                      original.Estado,
                      original.Descripcion,
                      original.Apu_Prespuesto_Rubro_Id,
                      original.Apu_Rubro_Codigo,
                      original.Apu_Rubro_Nombre,
                      original.Apu_Rubro_Unidad,
                      original.Costo,
                      original.Cantidad,
                      original.Fis_Planilla_Id);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

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
