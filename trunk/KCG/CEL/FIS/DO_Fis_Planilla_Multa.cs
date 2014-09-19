
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
    /// Tabla:Fis_Planilla_Multa
    /// </summary>
    public class DO_Fis_Planilla_Multa
    {
        #region Adapter
        private Fis_Planilla_MultaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Planilla_MultaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Planilla_MultaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Planilla_Multa
        /// </summary> 
        /// <returns>Lista de objetos Fis_Planilla_Multa</returns> 
        public List<Fis_Planilla_Multa> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_MultaDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " 
                        + " Fis_Planilla_Multa_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_MultaRow fila in tabla)
                    lista.Add(new Fis_Planilla_Multa(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Planilla_Id,
                        fila.Fis_Multa_Id,
                        fila.Valor,
                        fila.Fecha,
                        fila.Descripcion,
                        fila.Fis_Planilla_Numero_Planilla,
                        fila.Fis_Planilla_Fecha_Ultimo_Ingreso,
                        fila.Fis_Planilla_Total,
                        fila.Fis_Planilla_Tipo_Nombre,
                        fila.Fis_Multa_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Multa> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_MultaDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " 
                        + "dbo.Fis_Planilla_Multa_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_MultaRow fila in tabla)
                    lista.Add(new Fis_Planilla_Multa(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Planilla_Id,
                        fila.Fis_Multa_Id,
                        fila.Valor,
                        fila.Fecha,
                        fila.Descripcion,
                        fila.Fis_Planilla_Numero_Planilla,
                        fila.Fis_Planilla_Fecha_Ultimo_Ingreso,
                        fila.Fis_Planilla_Total,
                        fila.Fis_Planilla_Tipo_Nombre,
                        fila.Fis_Multa_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Multa> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_MultaDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " 
                        + "dbo.Fis_Planilla_Multa_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_MultaRow fila in tabla)
                    lista.Add(new Fis_Planilla_Multa(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Planilla_Id,
                        fila.Fis_Multa_Id,
                        fila.Valor,
                        fila.Fecha,
                        fila.Descripcion,
                        fila.Fis_Planilla_Numero_Planilla,
                        fila.Fis_Planilla_Fecha_Ultimo_Ingreso,
                        fila.Fis_Planilla_Total,
                        fila.Fis_Planilla_Tipo_Nombre,
                        fila.Fis_Multa_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Multa> GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            string llamada = "";
            List<Fis_Planilla_Multa> lista = new List<Fis_Planilla_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_MultaDataTable tabla = Adapter.GetByPlanilla(s.Ver_Version_Id, Fis_Planilla_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPlanilla" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Planilla_Id : " + Fis_Planilla_Id 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Multa_ByPlanilla " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_MultaRow fila in tabla)
                    lista.Add(new Fis_Planilla_Multa(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Planilla_Id,
                        fila.Fis_Multa_Id,
                        fila.Valor,
                        fila.Fecha,
                        fila.Descripcion,
                        fila.Fis_Planilla_Numero_Planilla,
                        fila.Fis_Planilla_Fecha_Ultimo_Ingreso,
                        fila.Fis_Planilla_Total,
                        fila.Fis_Planilla_Tipo_Nombre,
                        fila.Fis_Multa_Nombre,
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
        /// Inserta el objeto en la tabla Fis_Planilla_Multa
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Planilla_Multa o)
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
                    o.Fis_Planilla_Id,
                    o.Fis_Multa_Id,
                    o.Valor,
                    o.Fecha,
                    o.Estado,
                    o.Descripcion);
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
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Planilla_Multa_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new Exception("");
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    default:
                        eCaso = new Exception(e.Message);
                        otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
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
        /// Borra el objeto de la tabla Fis_Planilla_Multa
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Planilla_Multa o)
        {
            int resultado = 0;
            try
            {
                Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Fis_Planilla_Id,
                    o.Fis_Multa_Id,
                    o.Valor,
                    o.Fecha,
                    o.Estado,
                    o.Descripcion);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Planilla_Multa
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Planilla_Multa o, Fis_Planilla_Multa original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Fis_Planilla_Id,
                    o.Fis_Multa_Id,
                    o.Valor,
                    o.Fecha,
                    o.Estado,
                    o.Descripcion,
                    original.Id,
                    original.Codigo,
                    original.Fis_Planilla_Id,
                    original.Fis_Multa_Id,
                    original.Valor,
                    original.Fecha,
                    original.Estado,
                    original.Descripcion);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Planilla_Multa_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}