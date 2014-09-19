
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
    /// Tabla:Seg_Rol_Elemento
    /// </summary>
    public class DO_Seg_Rol_Elemento
    {
        #region Adapter
        private Seg_Rol_ElementoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Seg_Rol_ElementoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Seg_Rol_ElementoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Seg_Rol_Elemento
        /// </summary> 
        /// <returns>Lista de objetos Seg_Rol_Elemento</returns> 
        public List<Seg_Rol_Elemento> Get(Scope s)
        {
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Elemento> GetByCodigo(Scope s, string Codigo)
        {
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Elemento> GetById(Scope s, string Id)
        {
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Elemento> GetByRol(Scope s, string seg_Rol_Id)
        {
            string llamada = "";
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.GetByRol(s.Ver_Version_Id, seg_Rol_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRol" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " seg_Rol_Id : " + seg_Rol_Id + " Nombre del Store Procedure: " + "dbo.Seg_Rol_Elemento_ByRol " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Elemento> GetByRolLikeEtiqueta(Scope s, string Seg_Rol_Id, string nombre)
        {
            string llamada = "";
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.GetByRolLikeEtiqueta(s.Ver_Version_Id, Seg_Rol_Id, nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRolLikeEtiqueta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_Id : " + Seg_Rol_Id + "," + " nombre : " + nombre + " Nombre del Store Procedure: " + "dbo.Seg_Rol_Elemento_ByRolLikeEtiqueta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Rol_Elemento> GetByLikeNombre(Scope s, string seg_Rol_Id, string Nombre)
        {
            string llamada = "";
            List<Seg_Rol_Elemento> lista = new List<Seg_Rol_Elemento>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_ElementoDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, seg_Rol_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Seg_Rol_Elemento_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_ElementoRow fila in tabla)
                    lista.Add(new Seg_Rol_Elemento(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_Con_Elemento_Nombre,
                            fila.Dic_Rotulo_Id,
                            fila.Dic_Rotulo_Codigo,
                            fila.Dic_Rotulo_Nombre,
                            fila.Tool_Dic_Rotulo_Id,
                            fila.Tool_Dic_Rotulo_Codigo,
                            fila.Tool_Dic_Rotulo_Nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Ver_Etiqueta_Nombre,
                            fila.Tool_Ver_Etiqueta_Nombre));
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
        /// Inserta el objeto en la tabla Seg_Rol_Elemento
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Seg_Rol_Elemento o)
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
                      o.Dic_Con_Elemento_Id,
                      o.Estado
                );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.Contains(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Elemento_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //break;
                    default:
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
            }
            //Control de Auditoria
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Seg_Rol_Elemento
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Seg_Rol_Elemento o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(

              o.Id,
              o.Codigo,
              o.Seg_Rol_Id,
              o.Dic_Con_Elemento_Id,
              o.Estado
        );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);

            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Seg_Rol_Elemento
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Seg_Rol_Elemento o, Seg_Rol_Elemento original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

                  o.Id,
                  o.Codigo,
                  o.Seg_Rol_Id,
                  o.Dic_Con_Elemento_Id,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Seg_Rol_Id,
                  original.Dic_Con_Elemento_Id,
                  original.Estado

             );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Elemento_Codigo))
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
