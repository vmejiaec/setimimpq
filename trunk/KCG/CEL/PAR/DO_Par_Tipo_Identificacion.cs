using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ParametrosTableAdapters;
using AEL.PAR;
using BEL;

namespace CEL.PAR
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Tipo_Identificacion
    /// </summary>
    public class DO_Par_Tipo_Identificacion
    {
        #region Adapter

        private Par_Tipo_IdentificacionTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Par_Tipo_IdentificacionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Par_Tipo_IdentificacionTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Obtenci�n de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Par_Tipo_Identificacion
        /// </summary> 
        /// <returns>Lista de objetos Par_Tipo_Identificacion</returns> 
        public List<Par_Tipo_Identificacion> Get(Scope s)
        {
            string llamada = "";
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Tipo_IdentificacionDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: Get " + "Parametros  Enviados en el M�todo: s " +
                          " Nombre del Store Procedure: " + " Par_Tipo_Identificacion_Get " + " N�mero de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Tipo_IdentificacionRow fila in tabla)
                    lista.Add(new Par_Tipo_Identificacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Descripcion,
                        fila.Cedula,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Cedula_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Par_Tipo_Identificacion> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Tipo_IdentificacionDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el M�todo: " +
                          "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo +
                          " Nombre del Store Procedure: " + "dbo.Par_Tipo_Identificacion_ByCodigo " +
                          " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Tipo_IdentificacionRow fila in tabla)
                    lista.Add(new Par_Tipo_Identificacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Descripcion,
                        fila.Cedula,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Cedula_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Par_Tipo_Identificacion> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Tipo_IdentificacionDataTable tabla =
                    Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el M�todo: " +
                          "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " +
                          s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Par_Tipo_Identificacion_ByEmpresa " +
                          " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Tipo_IdentificacionRow fila in tabla)
                    lista.Add(new Par_Tipo_Identificacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Descripcion,
                        fila.Cedula,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Cedula_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Par_Tipo_Identificacion> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Tipo_IdentificacionDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetById" + " Parametros  Enviados en el M�todo: " + "," +
                          " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Id : " + Id +
                          " Nombre del Store Procedure: " + "dbo.Par_Tipo_Identificacion_ById " +
                          " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Tipo_IdentificacionRow fila in tabla)
                    lista.Add(new Par_Tipo_Identificacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Descripcion,
                        fila.Cedula,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Cedula_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Par_Tipo_Identificacion> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Par_Tipo_Identificacion> lista = new List<Par_Tipo_Identificacion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Tipo_IdentificacionDataTable tabla =
                    Adapter.GetByLikeNombre(s.Ver_Version_Id, s.Int_Empresa_Id, Nombre);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el M�todo: " +
                          "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " +
                          s.Int_Empresa_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " +
                          "dbo.Par_Tipo_Identificacion_ByLikeNombre " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Tipo_IdentificacionRow fila in tabla)
                    lista.Add(new Par_Tipo_Identificacion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Descripcion,
                        fila.Cedula,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Cedula_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        #endregion

        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Par_Tipo_Identificacion
        /// </summary>
        /// <param name="s">Variables de �mbito como la versi�n y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Par_Tipo_Identificacion o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            if (o.Codigo == null)
                o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Descripcion,
                    o.Estado,
                    o.Cedula
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                switch (e.Number)
                {
                    // Si el error es de violaci�n PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.Contains(
                            Textos._ERR_VIOLATION_UNIQUE_KEY)
                            )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Par_Tipo_Identificacion_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Par_Tipo_Identificacion_Nombre_Int_Empresa_Id))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new Exception(e.Message);
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //throw;
                    //break;
                    default:
                        eCaso = new Exception(e.Message);
                        otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
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
        /// Borra el objeto de la tabla Par_Tipo_Identificacion
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Par_Tipo_Identificacion o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Descripcion,
                    o.Estado,
                    o.Cedula
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Par_Razon_Social_Par_Tipo_Identificacion))
                {
                    eCaso = new Exception("Par Raz�n Social");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        } //Actualiza
        /// <summary>
        //Actualiza la tabla Par_Tipo_Identificacion
        /// </summary>
        /// <param name="o">Objeto que contiene la informaci�n a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Par_Tipo_Identificacion o, Par_Tipo_Identificacion original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Descripcion,
                    o.Estado,
                    o.Cedula,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Int_Empresa_Id,
                    original.Descripcion,
                    original.Estado,
                    original.Cedula
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Par_Tipo_Identificacion_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Par_Tipo_Identificacion_Nombre_Int_Empresa_Id))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }

        #endregion
    }
}