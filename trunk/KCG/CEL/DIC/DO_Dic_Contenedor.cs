using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.DiccionarioTableAdapters;
using AEL.DIC;
using BEL;

namespace CEL.DIC
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Diccionario
    /// Tabla:Dic_Contenedor
    /// </summary>
    public class DO_Dic_Contenedor
    {
        #region Adapter

        private Dic_ContenedorTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_ContenedorTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_ContenedorTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Contenedor
        /// </summary> 
        /// <returns>Lista de objetos Dic_Contenedor</returns> 
        public List<Dic_Contenedor> Get(Scope s)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetById(Scope s, string Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByMantenimiento(Scope s, string int_empresa_Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByMantenimiento(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByModulo(Scope s, string Dic_Modulo_Id)
        {
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByModulo(s.Ver_Version_Id, Dic_Modulo_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByLikeNombreMenu(Scope s, string Nombre)
        {
            string llamada = "";
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByLikeNombreMenu(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombreMenu" +
                          " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," +
                          " Nombre : " + Nombre + " Nombre del Store Procedure: " +
                          "dbo.Dic_Contenedor_ByLikeNombreMenu " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByNombre" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre +
                          " Nombre del Store Procedure: " + "dbo.Dic_Contenedor_ByNombre " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Contenedor> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Dic_Contenedor> lista = new List<Dic_Contenedor>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ContenedorDataTable tabla =
                    Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre +
                          " Nombre del Store Procedure: " + "dbo.Dic_Contenedor_ByLikeNombre " +
                          " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_ContenedorRow fila in tabla)
                    lista.Add(new Dic_Contenedor(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Tipo,
                                  fila.Dic_Modulo_id,
                                  fila.Filtro,
                                  fila.Estado_Nombre,
                                  fila.Tipo_Nombre,
                                  fila.Dic_Modulo_Codigo,
                                  fila.Dic_Modulo_Nombre,
                                  fila.Filtro_Nombre,
                                  fila.Archivo_Recursos,
                                  fila.Menu_Dic_Con_Elemento_Id,
                                  fila.Menu_Dic_Con_Elemento_Nombre,
                                  fila.Menu_Dic_Rotulo_Id,
                                  fila.Menu_Dic_Rotulo_Nombre,
                                  fila.Menu_Ver_Etiqueta_Nombre));
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
        /// Inserta el objeto en la tabla Dic_Contenedor
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Contenedor o)
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
                    o.Nombre,
                    o.Estado,
                    o.Tipo,
                    o.Dic_Modulo_id,
                    o.Filtro
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
                        if (mensaje.Contains(
                            Textos._ERR_VIOLATION_UNIQUE_KEY)
                            )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Contenedor_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Contenedor))
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
                    //throw;
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Dic_Contenedor
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Contenedor o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado,
                    o.Tipo,
                    o.Dic_Modulo_id,
                    o.Filtro
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Aud_Log_Dic_Contenedor))
                {
                    eCaso = new Exception("Aud Log");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Par_Log_Dic_Contenedor))
                {
                    eCaso = new Exception("Aud Par Log");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Elemento_Dic_Contenedor))
                {
                    eCaso = new Exception("Dic Con Elemento");
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
        //Actualiza la tabla Dic_Contenedor
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Contenedor o, Dic_Contenedor original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado,
                    o.Tipo,
                    o.Dic_Modulo_id,
                    o.Filtro,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Estado,
                    original.Tipo,
                    original.Dic_Modulo_id,
                    original.Filtro
                    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Dic_Contenedor_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Contenedor))
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