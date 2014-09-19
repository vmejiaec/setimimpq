
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.DiccionarioTableAdapters;
using AEL.DIC;
using BEL;
using System;

namespace CEL.DIC
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Diccionario
    /// Tabla:Dic_Con_Campo
    /// </summary>
    public class DO_Dic_Con_Campo
    {
        #region Adapter
        private Dic_Con_CampoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_Con_CampoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_Con_CampoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Con_Campo
        /// </summary> 
        /// <returns>Lista de objetos Dic_Con_Campo</returns> 
        public List<Dic_Con_Campo> Get(Scope s)
        {
            List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_CampoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_CampoRow fila in tabla)
                    lista.Add(new Dic_Con_Campo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Con_Objeto_Id,
                  fila.Dic_Campo_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Tool_Dic_Rotulo_Id,
                  fila.Ancho,
                  fila.Orden,
                  fila.Dic_con_Objeto_Codigo,
                  fila.Dic_con_Objeto_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Campo_Dic_Objeto_Id,
                  fila.Campo_Dic_Objeto_Codigo,
                  fila.Campo_Dic_Objeto_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.Tool_Dic_Rotulo_Codigo,
                  fila.Tool_Dic_Rotulo_nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Campo> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_CampoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_CampoRow fila in tabla)
                    lista.Add(new Dic_Con_Campo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Con_Objeto_Id,
                  fila.Dic_Campo_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Tool_Dic_Rotulo_Id,
                  fila.Ancho,
                  fila.Orden,
                  fila.Dic_con_Objeto_Codigo,
                  fila.Dic_con_Objeto_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Campo_Dic_Objeto_Id,
                  fila.Campo_Dic_Objeto_Codigo,
                  fila.Campo_Dic_Objeto_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.Tool_Dic_Rotulo_Codigo,
                  fila.Tool_Dic_Rotulo_nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Campo> GetByConObjeto(Scope s, string Dic_Con_Objeto_Id, string int_usuario_id)
        {
            List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_CampoDataTable tabla =
                Adapter.GetByConObjeto(s.Ver_Version_Id, Dic_Con_Objeto_Id, s.Int_Usuario_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_CampoRow fila in tabla)
                    lista.Add(new Dic_Con_Campo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Con_Objeto_Id,
                  fila.Dic_Campo_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Tool_Dic_Rotulo_Id,
                  fila.Ancho,
                  fila.Orden,
                  fila.Dic_con_Objeto_Codigo,
                  fila.Dic_con_Objeto_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Campo_Dic_Objeto_Id,
                  fila.Campo_Dic_Objeto_Codigo,
                  fila.Campo_Dic_Objeto_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.Tool_Dic_Rotulo_Codigo,
                  fila.Tool_Dic_Rotulo_nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Campo> GetById(Scope s, string Id)
        {
            List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_CampoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_CampoRow fila in tabla)
                    lista.Add(new Dic_Con_Campo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Con_Objeto_Id,
                  fila.Dic_Campo_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Tool_Dic_Rotulo_Id,
                  fila.Ancho,
                  fila.Orden,
                  fila.Dic_con_Objeto_Codigo,
                  fila.Dic_con_Objeto_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Campo_Dic_Objeto_Id,
                  fila.Campo_Dic_Objeto_Codigo,
                  fila.Campo_Dic_Objeto_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.Tool_Dic_Rotulo_Codigo,
                  fila.Tool_Dic_Rotulo_nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Campo> GetByObjeto(Scope s, string con_Objeto_id)
        {
            List<Dic_Con_Campo> lista = new List<Dic_Con_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_CampoDataTable tabla =
                Adapter.GetByObjeto(s.Ver_Version_Id, con_Objeto_id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_CampoRow fila in tabla)
                    lista.Add(new Dic_Con_Campo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Dic_Con_Objeto_Id,
                  fila.Dic_Campo_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Tool_Dic_Rotulo_Id,
                  fila.Ancho,
                  fila.Orden,
                  fila.Dic_con_Objeto_Codigo,
                  fila.Dic_con_Objeto_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Contenedor_Id,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Campo_Dic_Objeto_Id,
                  fila.Campo_Dic_Objeto_Codigo,
                  fila.Campo_Dic_Objeto_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.Tool_Dic_Rotulo_Codigo,
                  fila.Tool_Dic_Rotulo_nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Dic_Con_Campo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Con_Campo o)
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
                      o.Dic_Con_Objeto_Id,
                      o.Dic_Campo_Id,
                      o.Dic_Rotulo_Id,
                      o.Tool_Dic_Rotulo_Id,
                      o.Ancho,
                      o.Orden,
                      o.Estado);
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

                            if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Contenedor_objeto_orden))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Dic_Cont_Obj_Campo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Dic_Con_Campo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Con_Campo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Dic_Con_Objeto_Id,
                    o.Dic_Campo_Id,
                    o.Dic_Rotulo_Id,
                    o.Tool_Dic_Rotulo_Id,
                    o.Ancho,
                    o.Orden,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._FK_Par_filtro_Dic_Con_Campo))
                {
                    eCaso = new System.Exception("Par filtro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Dic_Con_Campo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Con_Campo o, Dic_Con_Campo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Dic_Con_Objeto_Id,
                    o.Dic_Campo_Id,
                    o.Dic_Rotulo_Id,
                    o.Tool_Dic_Rotulo_Id,
                    o.Ancho,
                    o.Orden,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Dic_Con_Objeto_Id,
                    original.Dic_Campo_Id,
                    original.Dic_Rotulo_Id,
                    original.Tool_Dic_Rotulo_Id,
                    original.Ancho,
                    original.Orden,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Contenedor_objeto_orden))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Campo_Dic_Cont_Obj_Campo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
