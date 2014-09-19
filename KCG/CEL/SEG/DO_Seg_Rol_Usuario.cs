using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.SeguridadTableAdapters;
using AEL.SEG;
using BEL;

namespace CEL.SEG
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridad 
    /// Tabla:Seg_Rol_Usuario
    /// </summary>
    public class DO_Seg_Rol_Usuario
    {
        #region Adapter

        private Seg_Rol_UsuarioTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Seg_Rol_UsuarioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Seg_Rol_UsuarioTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Seg_Rol_Usuario
        /// </summary> 
        /// <returns>Lista de objetos Seg_Rol_Usuario</returns> 
        public List<Seg_Rol_Usuario> Get(Scope s)
        {
            string llamada = "";
            List<Seg_Rol_Usuario> lista = new List<Seg_Rol_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_UsuarioDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " +
                          " Nombre del Store Procedure: " + " Seg_Rol_Usuario_Get " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_UsuarioRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Estado,
                                  fila.Seg_Rol_Id,
                                  fila.Int_Usuario_Id,
                                  fila.Seg_Rol_Codigo,
                                  fila.Seg_Rol_Nombre,
                                  fila.Int_usuario_codigo,
                                  fila.Int_usuario_nombre,
                                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Rol_Usuario> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Seg_Rol_Usuario> lista = new List<Seg_Rol_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_UsuarioDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo +
                          " Nombre del Store Procedure: " + "dbo.Seg_Rol_Usuario_ByCodigo " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_UsuarioRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Estado,
                                  fila.Seg_Rol_Id,
                                  fila.Int_Usuario_Id,
                                  fila.Seg_Rol_Codigo,
                                  fila.Seg_Rol_Nombre,
                                  fila.Int_usuario_codigo,
                                  fila.Int_usuario_nombre,
                                  fila.Estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Rol_Usuario> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Seg_Rol_Usuario> lista = new List<Seg_Rol_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_UsuarioDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," +
                          " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id +
                          " Nombre del Store Procedure: " + "dbo.Seg_Rol_Usuario_ById " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_UsuarioRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Estado,
                                  fila.Seg_Rol_Id,
                                  fila.Int_Usuario_Id,
                                  fila.Seg_Rol_Codigo,
                                  fila.Seg_Rol_Nombre,
                                  fila.Int_usuario_codigo,
                                  fila.Int_usuario_nombre,
                                  fila.Estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Rol_Usuario> GetByRol(Scope s, string Seg_Rol_Id)
        {
            string llamada = "";
            List<Seg_Rol_Usuario> lista = new List<Seg_Rol_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_UsuarioDataTable tabla =
                    Adapter.GetByRol(s.Ver_Version_Id, Seg_Rol_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRol" + " Parametros  Enviados en el Método: " + "," +
                          " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_Id : " + Seg_Rol_Id +
                          " Nombre del Store Procedure: " + "dbo.Seg_Rol_Usuario_ByRol " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_UsuarioRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Estado,
                                  fila.Seg_Rol_Id,
                                  fila.Int_Usuario_Id,
                                  fila.Seg_Rol_Codigo,
                                  fila.Seg_Rol_Nombre,
                                  fila.Int_usuario_codigo,
                                  fila.Int_usuario_nombre,
                                  fila.Estado_nombre));
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
        /// Inserta el objeto en la tabla Seg_Rol_Usuario
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Seg_Rol_Usuario o)
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
                    o.Seg_Rol_Id,
                    o.Int_Usuario_Id,
                    o.Estado
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
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Usuario_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Usuario_Rol_Usuario))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
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
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Seg_Rol_Usuario
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Seg_Rol_Usuario o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Seg_Rol_Id,
                    o.Int_Usuario_Id,
                    o.Estado
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Usuario_Det_Seg_Rol_Usuario))
                {
                    eCaso = new Exception("Seg Rol Usuario");
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
        //Actualiza la tabla Seg_Rol_Usuario
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Seg_Rol_Usuario o, Seg_Rol_Usuario original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Seg_Rol_Id,
                    o.Int_Usuario_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Seg_Rol_Id,
                    original.Int_Usuario_Id,
                    original.Estado
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Usuario_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Usuario_Rol_Usuario))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
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