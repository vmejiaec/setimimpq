
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
    /// Tabla:Dic_Campo
    /// </summary>
    public class DO_Dic_Campo
    {
        #region Adapter
        private Dic_CampoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_CampoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_CampoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Campo
        /// </summary> 
        /// <returns>Lista de objetos Dic_Campo</returns> 
        public List<Dic_Campo> Get(Scope s)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Campo> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Campo> GetById(Scope s, string Id)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Campo> GetByObjeto(Scope s, string Dic_Objeto_Id)
        {
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.GetByObjeto(s.Ver_Version_Id, Dic_Objeto_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Campo> GetByLikeNombre(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            string llamada = "";
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.GetByLikeNombre(s.Ver_Version_Id, Dic_Objeto_Id, Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Campo> GetByLikeObjeto(Scope s, string Dic_Objeto_Id, string Nombre)
        {
            string llamada = "";
            List<Dic_Campo> lista = new List<Dic_Campo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CampoDataTable tabla = Adapter.GetByLikeObjeto(s.Ver_Version_Id, Dic_Objeto_Id, Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_CampoRow fila in tabla)
                    lista.Add(new Dic_Campo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Objeto_Id,
                        fila.Tipo_Dato,
                        fila.Tipo_Constraint,
                        fila.Filtro,
                        fila.Estado_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Tipo_Dato_nombre,
                        fila.Tipo_Constraint_nombre,
                        fila.Filtro_Nombre,
                        fila.Dic_Modulo_Id,
                        fila.Dic_Modulo_Codigo,
                        fila.Dic_Modulo_Nombre,
                        fila.Tipo_Dato_Nombre,
                        fila.Tipo_Constraint_Nombre,
                        fila.Sug_Dic_Rotulo_Id,
                        fila.Sug_Dic_Rotulo_Nombre,
                        fila.Sug_Dic_Rotulo_Codigo,
                        fila.SugTool_Dic_Rotulo_Id,
                        fila.SugTool_Dic_Rotulo_Nombre,
                        fila.SugTool_Dic_Rotulo_Codigo));
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
        /// Inserta el objeto en la tabla Dic_Campo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Campo o)
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
                      o.Dic_Objeto_Id,
                      o.Tipo_Dato,
                      o.Tipo_Constraint,
                      o.Filtro,
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

                            if (e.Message.Contains(TXT_BDD._IX_Dic_Campo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Campo_Dic_Objeto_Nombre))
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
        /// Borra el objeto de la tabla Dic_Campo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Campo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Dic_Objeto_Id,
                    o.Tipo_Dato,
                    o.Tipo_Constraint,
                    o.Filtro,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apr_Documento_Dic_Campo))
                {
                    eCaso = new System.Exception("Apr Documento");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Campo_Dic_Campo))
                {
                    eCaso = new System.Exception("Dic Con Campo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Dominio_Dic_Campo))
                {
                    eCaso = new System.Exception("Dic Dominio");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Dic_Campo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Campo o, Dic_Campo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Dic_Objeto_Id,
                    o.Tipo_Dato,
                    o.Tipo_Constraint,
                    o.Filtro,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Dic_Objeto_Id,
                    original.Tipo_Dato,
                    original.Tipo_Constraint,
                    original.Filtro,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Dic_Campo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Campo_Dic_Objeto_Nombre))
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
