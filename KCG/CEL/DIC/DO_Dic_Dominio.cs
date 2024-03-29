
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
    /// Tabla:Dic_Dominio
    /// </summary>
    public class DO_Dic_Dominio
    {
        #region Adapter
        private Dic_DominioTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_DominioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_DominioTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Dominio
        /// </summary> 
        /// <returns>Lista de objetos Dic_Dominio</returns> 
        public List<Dic_Dominio> Get(Scope s)
        {
            List<Dic_Dominio> lista = new List<Dic_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_DominioDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_DominioRow fila in tabla)
                    lista.Add(new Dic_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Campo_Id,
                  fila.Dominio,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Nombre,
                  fila.Dic_Modulo_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Dominio> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Dominio> lista = new List<Dic_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_DominioDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_DominioRow fila in tabla)
                    lista.Add(new Dic_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Campo_Id,
                  fila.Dominio,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Nombre,
                  fila.Dic_Modulo_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Dominio> GetById(Scope s, string Id)
        {
            List<Dic_Dominio> lista = new List<Dic_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_DominioDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_DominioRow fila in tabla)
                    lista.Add(new Dic_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Campo_Id,
                  fila.Dominio,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Nombre,
                  fila.Dic_Modulo_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Dominio> GetByObjetoCampo(Scope s, string Objeto_Nombre, string Campo_Nombre)
        {
            List<Dic_Dominio> lista = new List<Dic_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_DominioDataTable tabla =
                Adapter.GetByDic_Objeto_Nombre_Dic_Campo_Nombre(s.Ver_Version_Id,Objeto_Nombre,Campo_Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_DominioRow fila in tabla)
                    lista.Add(new Dic_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Campo_Id,
                  fila.Dominio,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Nombre,
                  fila.Dic_Modulo_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Dic_Dominio> GetByMantenimiento(Scope s)
        {
            List<Dic_Dominio> lista = new List<Dic_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_DominioDataTable tabla =
                Adapter.GetByMantenimiento(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_DominioRow fila in tabla)
                    lista.Add(new Dic_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Dic_Campo_Id,
                  fila.Dominio,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Nombre,
                  fila.Dic_Modulo_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Dic_Dominio
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Dominio o)
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
                      o.Dic_Campo_Id,
                      o.Dominio,
                      o.Nombre,
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
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Dominio_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Dominio_Dic_Campo_Dominio))
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
        /// Borra el objeto de la tabla Dic_Dominio
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Dominio o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Dic_Campo_Id,
                    o.Dominio,
                    o.Nombre,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Ver_Dominio_Dic_Dominio))
                {
                    eCaso = new System.Exception("Ver Dominio");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
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
        //Actualiza la tabla Dic_Dominio
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Dominio o, Dic_Dominio original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Dic_Campo_Id,
                    o.Dominio,
                    o.Nombre,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Dic_Campo_Id,
                    original.Dominio,
                    original.Nombre,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Dic_Dominio_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Dominio_Dic_Campo_Dominio))
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
