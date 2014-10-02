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
    /// Tabla:Seg_Menu
    /// </summary>
    public class DO_Seg_Menu
    {
        #region Adapter
        private Seg_MenuTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Seg_MenuTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Seg_MenuTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Seg_Menu
        /// </summary> 
        /// <returns>Lista de objetos Seg_Menu</returns> 
        public List<Seg_Menu> Get(Scope s, string par_servidor_id)
        {
            string llamada = "";
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.Get(s.Ver_Version_Id, par_servidor_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Seg_Menu_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Menu> GetByCodigo(Scope s, string Codigo, string par_servidor_id)
        {
            string llamada = "";
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo, par_servidor_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + "," + " par_servidor_id : " + par_servidor_id + " Nombre del Store Procedure: " + "dbo.Seg_Menu_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Menu> GetById(Scope s, string Id, string par_servidor_id)
        {
            string llamada = "";
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id, par_servidor_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + "," + " par_servidor_id : " + par_servidor_id + " Nombre del Store Procedure: " + "dbo.Seg_Menu_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Menu> GetByRolElemento(Scope s, string Seg_Rol_Id, string Dic_Con_Elemento_Id, string par_servidor_id)
        {
            string llamada = "";
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.GetByRolElemento(s.Ver_Version_Id, Seg_Rol_Id, Dic_Con_Elemento_Id, par_servidor_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRolElemento" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_Id : " + Seg_Rol_Id + "," + " Dic_Con_Elemento_Id : " + Dic_Con_Elemento_Id + "," + " par_servidor_id : " + par_servidor_id + " Nombre del Store Procedure: " + "dbo.Seg_Menu_ByRolElemento " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        
        public List<Seg_Menu> GetByRolUsuario(Scope s, string Seg_Rol_Id, string Int_Usuario_Id, string par_servidor_id)
        {
            string llamada = "";
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.GetByRolUsuario(s.Ver_Version_Id, Seg_Rol_Id, Int_Usuario_Id, par_servidor_id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRolUsuario" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_id : " + Seg_Rol_Id + "," + " Int_Usuario_Id : " + Int_Usuario_Id + "," + " par_servidor_id : " + par_servidor_id + " Nombre del Store Procedure: " + "dbo.Seg_Menu_ByRolUsuario " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Menu> GetByRolId(Scope s, string Seg_Rol_Id, string par_servidor_id)
        {
            List<Seg_Menu> lista = new List<Seg_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_MenuDataTable tabla =
                Adapter.GetByRol(s.Ver_Version_Id, Seg_Rol_Id, par_servidor_id);
                //Carga en la lista
                foreach (Seguridad.Seg_MenuRow fila in tabla)
                    lista.Add(new Seg_Menu(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Pantalla_Id,
                  fila.Grupo,
                  fila.Orden,
                  fila.Int_Usuario_Id,
                  fila.Dic_Con_Elemento_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Dic_Con_Elemento_Codigo,
                  fila.Dic_Con_Elemento_Nombre,
                  fila.Dic_Pantalla_Codigo,
                  fila.Dic_Pantalla_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Nombre,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Activa,
                  fila.Pantalla_Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Pantalla_Ver_Etiqueta_Nombre,
                  fila.Seg_Rol_Codigo,
                  fila.Seg_Rol_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Rotulo_id,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_Nombre,
                  fila.Ver_Etiqueta_Nombre,
                  fila.Ver_Etiqueta_Imagen_Activa,
                  fila.Ver_Etiqueta_Imagen_Desactiva,
                  fila.Tool_Ver_Etiqueta_Nombre,
                  fila.Par_Servidor_Det_Referencia,
                  fila.Estado_Nombre,
                  fila.Grupo_Nombre,
                  fila.Dic_Contenedor_Tipo));
            }
            return lista;
        }

        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Seg_Menu
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Seg_Menu o)
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
                      o.Dic_Pantalla_Id,
                      o.Grupo,
                      o.Orden,
                      o.Int_Usuario_Id,
                      o.Dic_Con_Elemento_Id,
                      o.Seg_Rol_Id,
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
                        if (mensaje.Contains(
                            Textos._ERR_VIOLATION_UNIQUE_KEY)
                            )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Menu_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new Exception(e.Message);
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //  break;
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
        /// Borra el objeto de la tabla Seg_Menu
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Seg_Menu o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(

          o.Id,
          o.Codigo,
          o.Dic_Pantalla_Id,
          o.Grupo,
          o.Orden,
          o.Int_Usuario_Id,
          o.Dic_Con_Elemento_Id,
          o.Seg_Rol_Id,
          o.Estado
    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Seg_Menu
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Seg_Menu o, Seg_Menu original)
        {
            if (string.IsNullOrEmpty(o.pantalla_ver_etiqueta_nombre))
                o.Dic_Pantalla_Id = null;
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

          o.Id,
          o.Codigo,
          o.Dic_Pantalla_Id,
          o.Grupo,
          o.Orden,
          o.Int_Usuario_Id,
          o.Dic_Con_Elemento_Id,
          o.Seg_Rol_Id,
          o.Estado,
          original.Id,
          original.Codigo,
          original.Dic_Pantalla_Id,
          original.Grupo,
          original.Orden,
          original.Int_Usuario_Id,
          original.Dic_Con_Elemento_Id,
          original.Seg_Rol_Id,
          original.Estado

    );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Seg_Menu_Codigo))
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
