using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.InterfaceTableAdapters;
using AEL.INT;
using BEL;

namespace CEL.INT
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Interface 
    /// Tabla:Int_Empresa
    /// </summary>
    public class DO_Int_Empresa
    {
        #region Adapter

        private Int_EmpresaTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Int_EmpresaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Int_EmpresaTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Int_Empresa
        /// </summary> 
        /// <returns>Lista de objetos Int_Empresa</returns> 
        public List<Int_Empresa> Get(Scope s)
        {
            string llamada = "";
            List<Int_Empresa> lista = new List<Int_Empresa>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_EmpresaDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " +
                          " Nombre del Store Procedure: " + " Int_Empresa_Get " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_EmpresaRow fila in tabla)
                    lista.Add(new Int_Empresa(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Imagen,
                                  fila.Descripcion,
                                  fila.Plan_Cuenta,
                                  fila.Direccion,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Empresa> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Int_Empresa> lista = new List<Int_Empresa>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_EmpresaDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo +
                          " Nombre del Store Procedure: " + "dbo.Int_Empresa_ByCodigo " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_EmpresaRow fila in tabla)
                    lista.Add(new Int_Empresa(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Imagen,
                                  fila.Descripcion,
                                  fila.Plan_Cuenta,
                                  fila.Direccion,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Empresa> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Int_Empresa> lista = new List<Int_Empresa>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_EmpresaDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," +
                          " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id +
                          " Nombre del Store Procedure: " + "dbo.Int_Empresa_ById " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_EmpresaRow fila in tabla)
                    lista.Add(new Int_Empresa(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Imagen,
                                  fila.Descripcion,
                                  fila.Plan_Cuenta,
                                  fila.Direccion,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Empresa> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Int_Empresa> lista = new List<Int_Empresa>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_EmpresaDataTable tabla =
                    Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre +
                          " Nombre del Store Procedure: " + "dbo.Int_Empresa_ByLikeNombre " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_EmpresaRow fila in tabla)
                    lista.Add(new Int_Empresa(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Imagen,
                                  fila.Descripcion,
                                  fila.Plan_Cuenta,
                                  fila.Direccion,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Empresa> GetByUsuario(Scope s, string Int_Usuario_Id)
        {
            string llamada = "";
            List<Int_Empresa> lista = new List<Int_Empresa>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_EmpresaDataTable tabla =
                    Adapter.GetByUsuario(s.Ver_Version_Id, Int_Usuario_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByUsuario" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Usuario_Id : " + Int_Usuario_Id +
                          " Nombre del Store Procedure: " + "dbo.Int_Empresa_ByUsuario " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_EmpresaRow fila in tabla)
                    lista.Add(new Int_Empresa(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Imagen,
                                  fila.Descripcion,
                                  fila.Plan_Cuenta,
                                  fila.Direccion,
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
        /// Inserta el objeto en la tabla Int_Empresa
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Int_Empresa o)
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
                    o.Abreviatura,
                    o.Nombre,
                    o.Imagen,
                    o.Descripcion,
                    o.Estado,
                    o.Plan_Cuenta,
                    o.Direccion
                    );
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
                            if (e.Message.Contains(TXT_BDD._IX_Int_Empresa_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Int_Empresa_Nombre))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }

                            eCaso = new Exception(e.Message);
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //break;

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
        /// Borra el objeto de la tabla Int_Empresa
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Int_Empresa o)
        {
            int resultado;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Abreviatura,
                    o.Nombre,
                    o.Imagen,
                    o.Descripcion,
                    o.Estado,
                    o.Plan_Cuenta,
                    o.Direccion
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Int_Periodo_Int_Empresa))
                {
                    eCaso = new Exception("Int Periodo");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Int_Sucursal_Int_Empresa))
                {
                    eCaso = new Exception("Int Sucursal");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Par_Razon_Social_Int_Empresa))
                {
                    eCaso = new Exception("Par Razon Social");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Par_Tipo_Identificacion_Int_Empresa))
                {
                    eCaso = new Exception("Par Tipo Identificacion");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Per_Personal_Int_Empresa))
                {
                    eCaso = new Exception("Per Personal");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Par_Envio_Int_Empresa))
                {
                    eCaso = new Exception("Par Envio");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Int_Batch_Int_Empresa))
                {
                    eCaso = new Exception("Int Batch");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Int_Cta_Objeto_Int_Empresa_Id))
                {
                    eCaso = new Exception("Int Cuenta Objeto");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }


            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        } //Actualiza
        /// <summary>
        //Actualiza la tabla Int_Empresa
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Int_Empresa o, Int_Empresa original)
        {
            int resultado;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Abreviatura,
                    o.Nombre,
                    o.Imagen,
                    o.Descripcion,
                    o.Estado,
                    o.Plan_Cuenta,
                    o.Direccion,
                    original.Id,
                    original.Codigo,
                    original.Abreviatura,
                    original.Nombre,
                    original.Imagen,
                    original.Descripcion,
                    original.Estado,
                    original.Plan_Cuenta,
                    original.Direccion
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Int_Empresa_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Int_Empresa_Nombre))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ27, eCaso);
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