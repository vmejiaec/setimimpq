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
    /// Tabla:Int_Usuario
    /// </summary>
    public class DO_Int_Usuario
    {
        #region Adapter

        private Int_UsuarioTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Int_UsuarioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Int_UsuarioTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Int_Usuario
        /// </summary> 
        /// <returns>Lista de objetos Int_Usuario</returns> 
        public List<Int_Usuario> Get(Scope s)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetByCodigo(Scope s, string Codigo)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetById(Scope s, string Id)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();

            // Verifica si la pantalla que invoca es la de cambio de clave
            string v_Id = Id;
            if (s.Dic_Contenedor_Nombre == "INT_USUARIO_CLAVE")
                v_Id = s.Int_Usuario_Id;

            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, v_Id);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetByNombre(Scope s, string Nombre)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetByNombre(s.Ver_Version_Id, Nombre);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetByNombrePassword(Scope s, string Nombre, string Password)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetByNombrePassword(s.Ver_Version_Id, Nombre, Password);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetByNombrePasswordSalt(Scope s, string Nombre, string Password, string Salt)
        {
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetByNombrePasswordSalt(s.Ver_Version_Id, Nombre, Password, Salt);
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Int_Usuario> GetByPersonal(Scope s)
        {
            string llamada = "";
            List<Int_Usuario> lista = new List<Int_Usuario>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_UsuarioDataTable tabla =
                    Adapter.GetByPersonal(s.Ver_Version_Id, s.Per_Personal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPersonal" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Per_Personal_Id : " +
                          s.Per_Personal_Id + " Nombre del Store Procedure: " + "dbo.Int_Usuario_ByPersonal " +
                          " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_UsuarioRow fila in tabla)
                    lista.Add(new Int_Usuario(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Salt,
                                  fila.Password,
                                  fila.Usuario_Id_Ref,
                                  fila.Per_Personal_Id,
                                  fila.Pred_Seg_Rol_Id,
                                  fila.Pred_Ver_Version_Id,
                                  fila.Pred_Int_Sucursal_Id,
                                  fila.Per_Personal_Codigo,
                                  fila.Per_Personal_Nombre,
                                  fila.Pred_seg_Rol_Codigo,
                                  fila.Pred_seg_Rol_Nombre,
                                  fila.Pred_ver_version_codigo,
                                  fila.Pred_ver_version_nombre,
                                  fila.Pred_Ver_Version_Abreviatura,
                                  fila.Pred_int_Usuario_codigo,
                                  fila.Pred_Int_Usuario_nombre,
                                  fila.int_empresa_id,
                                  fila.int_empresa_codigo,
                                  fila.int_empresa_nombre,
                                  fila.estado_nombre,
                                  fila.Jefe_Fiscalizacion));
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
        /// Inserta el objeto en la tabla Int_Usuario
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Int_Usuario o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            o.int_empresa_id = s.Int_Empresa_Id;
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Salt,
                    o.Password,
                    o.Usuario_Id_Ref,
                    o.Per_Personal_Id,
                    o.Pred_Seg_Rol_Id,
                    o.Pred_Ver_Version_Id,
                    o.Pred_Int_Sucursal_Id,
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
                        if (mensaje.StartsWith(
                            Textos._ERR_VIOLATION_UNIQUE_KEY)
                            )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Int_Usuario_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Int_Usuario_Nombre))
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
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Int_Usuario
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Int_Usuario o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Salt,
                    o.Password,
                    o.Usuario_Id_Ref,
                    o.Per_Personal_Id,
                    o.Pred_Seg_Rol_Id,
                    o.Pred_Ver_Version_Id,
                    o.Pred_Int_Sucursal_Id,
                    o.Estado
                    );
            }
            catch (SqlException e)
            {
                if (e.Message.Contains(TXT_BDD._FK_Aud_Auditoria_Int_Usuario))
                {
                    Exception eCaso = new Exception("Aud Auditoria");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Log_Int_Usuario))
                {
                    Exception eCaso = new Exception("Aud Log");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Par_filtro_Int_Usuario))
                {
                    Exception eCaso = new Exception("Par filtro");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Par_Mensajeria_Int_Usuario))
                {
                    Exception eCaso = new Exception("Par Mensajeria");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Seg_Menu_Int_Usuario))
                {
                    Exception eCaso = new Exception("Seg Menu");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Usuario_Int_Usuario))
                {
                    Exception eCaso = new Exception("Seg Rol Usuario");
                    Exception otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        } //Actualiza
        /// <summary>
        //Actualiza la tabla Int_Usuario
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Int_Usuario o, Int_Usuario original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Salt,
                    o.Password,
                    o.Usuario_Id_Ref,
                    o.Per_Personal_Id,
                    o.Pred_Seg_Rol_Id,
                    o.Pred_Ver_Version_Id,
                    o.Pred_Int_Sucursal_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Salt,
                    original.Password,
                    original.Usuario_Id_Ref,
                    original.Per_Personal_Id,
                    original.Pred_Seg_Rol_Id,
                    original.Pred_Ver_Version_Id,
                    original.Pred_Int_Sucursal_Id,
                    original.Estado
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Int_Usuario_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Int_Usuario_Nombre))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._PK_Int_Usuario_1))
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