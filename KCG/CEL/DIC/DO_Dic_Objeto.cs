
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
    /// Tabla:Dic_Objeto
    /// </summary>
    public class DO_Dic_Objeto
    {
        #region Adapter
        private Dic_ObjetoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_ObjetoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_ObjetoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Objeto
        /// </summary> 
        /// <returns>Lista de objetos Dic_Objeto</returns> 
        public List<Dic_Objeto> Get(Scope s)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetById(Scope s, string Id)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetByMantenimiento(Scope s, string int_empresa_id)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla =
                Adapter.GetByMantenimiento(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetByMantenimiento1(Scope s)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla =
                Adapter.GetByMantenimiento1(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetByNombre(Scope s, string Nombre)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla =
                Adapter.GetByNombre(s.Ver_Version_Id, Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Objeto> GetByLikeNombre(Scope s, string Nombre)
        {
            List<Dic_Objeto> lista = new List<Dic_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_ObjetoDataTable tabla = Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Objeto(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Modulo_Id,
                  fila.Numero,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Dic_Objeto
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Objeto o)
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
                      o.Dic_Modulo_Id,
                      o.Numero,
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
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Nombre))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Numero))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ35, eCaso);
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Dic_Objeto
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Objeto o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Dic_Modulo_Id,
                    o.Numero,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Aud_Auditoria_Dic_Objeto))
                {
                    eCaso = new System.Exception("Aud Auditoria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Par_Auditoria_Dic_Objeto))
                {
                    eCaso = new System.Exception("Aud Par Auditoria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Campo_Dic_Objeto))
                {
                    eCaso = new System.Exception("Dic Campo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Paginacion_Dic_Objeto))
                {
                    eCaso = new System.Exception("Dic Paginacion");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Par_Paginacion_Dic_Objeto))
                {
                    eCaso = new System.Exception("Dic Par Paginacion");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Dic_Objeto
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Objeto o, Dic_Objeto original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Dic_Modulo_Id,
                    o.Numero,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Dic_Modulo_Id,
                    original.Numero,
                    original.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Nombre))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Objeto_Numero))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ35, eCaso);
                    throw (otroEX);
                }

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
