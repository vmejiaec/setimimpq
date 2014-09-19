
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
    /// Tabla:Dic_Codigo
    /// </summary>
    public class DO_Dic_Codigo
    {
        #region Adapter
        private Dic_CodigoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_CodigoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_CodigoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Codigo
        /// </summary> 
        /// <returns>Lista de objetos Dic_Codigo</returns> 
        public List<Dic_Codigo> Get(Scope s)
        {
            List<Dic_Codigo> lista = new List<Dic_Codigo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CodigoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_CodigoRow fila in tabla)
                    lista.Add(new Dic_Codigo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Tipo,
                  fila.Orden,
                  fila.Dic_Campo_Id,
                  fila.Ref_Dic_Campo_Id,
                  fila.Dic_Secuencia_Id,
                  fila.Pre_Dic_Campo_Id,
                  fila.Constante,
                  fila.Funcion,
                  fila.Act_Dic_Campo_Id,
                  fila.Dic_Secuencia_Codigo,
                  fila.Dic_Secuencia_Nombre,
                  fila.Ref_dic_Campo_Codigo,
                  fila.Ref_Dic_Campo_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Ref_Dic_Modulo_Id,
                  fila.Ref_Dic_Modulo_Codigo,
                  fila.Ref_Dic_Modulo_Nombre,
                  fila.Ref_Dic_Objeto_Id,
                  fila.Ref_Dic_Objeto_Codigo,
                  fila.Ref_Dic_Objeto_Nombre,
                  fila.Act_Dic_Campo_Codigo,
                  fila.Act_Dic_Campo_Nombre,
                  fila.Act_Dic_Modulo_Id,
                  fila.Act_Dic_Modulo_Codigo,
                  fila.Act_Dic_Modulo_Nombre,
                  fila.Act_Dic_Objeto_Id,
                  fila.Act_Dic_Objeto_Codigo,
                  fila.Act_Dic_Objeto_Nombre,
                  fila.Pre_Dic_Campo_Codigo,
                  fila.Pre_Dic_Campo_Nombre,
                  fila.Pre_Dic_Objeto_Id,
                  fila.Pre_Dic_Objeto_Codigo,
                  fila.Pre_Dic_Objeto_Nombre,
                  fila.Estado_nombre,
                  fila.Tipo_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Codigo> GetByCampo(Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
        {
            List<Dic_Codigo> lista = new List<Dic_Codigo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CodigoDataTable tabla =
                Adapter.GetByCampo(s.Ver_Version_Id, Dic_Objeto_Nombre, Dic_Campo_Nombre);
                //Carga en la lista
                foreach (Diccionario.Dic_CodigoRow fila in tabla)
                    lista.Add(new Dic_Codigo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Tipo,
                  fila.Orden,
                  fila.Dic_Campo_Id,
                  fila.Ref_Dic_Campo_Id,
                  fila.Dic_Secuencia_Id,
                  fila.Pre_Dic_Campo_Id,
                  fila.Constante,
                  fila.Funcion,
                  fila.Act_Dic_Campo_Id,
                  fila.Dic_Secuencia_Codigo,
                  fila.Dic_Secuencia_Nombre,
                  fila.Ref_dic_Campo_Codigo,
                  fila.Ref_Dic_Campo_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Ref_Dic_Modulo_Id,
                  fila.Ref_Dic_Modulo_Codigo,
                  fila.Ref_Dic_Modulo_Nombre,
                  fila.Ref_Dic_Objeto_Id,
                  fila.Ref_Dic_Objeto_Codigo,
                  fila.Ref_Dic_Objeto_Nombre,
                  fila.Act_Dic_Campo_Codigo,
                  fila.Act_Dic_Campo_Nombre,
                  fila.Act_Dic_Modulo_Id,
                  fila.Act_Dic_Modulo_Codigo,
                  fila.Act_Dic_Modulo_Nombre,
                  fila.Act_Dic_Objeto_Id,
                  fila.Act_Dic_Objeto_Codigo,
                  fila.Act_Dic_Objeto_Nombre,
                  fila.Pre_Dic_Campo_Codigo,
                  fila.Pre_Dic_Campo_Nombre,
                  fila.Pre_Dic_Objeto_Id,
                  fila.Pre_Dic_Objeto_Codigo,
                  fila.Pre_Dic_Objeto_Nombre,
                  fila.Estado_nombre,
                  fila.Tipo_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Codigo> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Codigo> lista = new List<Dic_Codigo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CodigoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_CodigoRow fila in tabla)
                    lista.Add(new Dic_Codigo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Tipo,
                  fila.Orden,
                  fila.Dic_Campo_Id,
                  fila.Ref_Dic_Campo_Id,
                  fila.Dic_Secuencia_Id,
                  fila.Pre_Dic_Campo_Id,
                  fila.Constante,
                  fila.Funcion,
                  fila.Act_Dic_Campo_Id,
                  fila.Dic_Secuencia_Codigo,
                  fila.Dic_Secuencia_Nombre,
                  fila.Ref_dic_Campo_Codigo,
                  fila.Ref_Dic_Campo_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Ref_Dic_Modulo_Id,
                  fila.Ref_Dic_Modulo_Codigo,
                  fila.Ref_Dic_Modulo_Nombre,
                  fila.Ref_Dic_Objeto_Id,
                  fila.Ref_Dic_Objeto_Codigo,
                  fila.Ref_Dic_Objeto_Nombre,
                  fila.Act_Dic_Campo_Codigo,
                  fila.Act_Dic_Campo_Nombre,
                  fila.Act_Dic_Modulo_Id,
                  fila.Act_Dic_Modulo_Codigo,
                  fila.Act_Dic_Modulo_Nombre,
                  fila.Act_Dic_Objeto_Id,
                  fila.Act_Dic_Objeto_Codigo,
                  fila.Act_Dic_Objeto_Nombre,
                  fila.Pre_Dic_Campo_Codigo,
                  fila.Pre_Dic_Campo_Nombre,
                  fila.Pre_Dic_Objeto_Id,
                  fila.Pre_Dic_Objeto_Codigo,
                  fila.Pre_Dic_Objeto_Nombre,
                  fila.Estado_nombre,
                  fila.Tipo_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Codigo> GetById(Scope s, string Id)
        {
            List<Dic_Codigo> lista = new List<Dic_Codigo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_CodigoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_CodigoRow fila in tabla)
                    lista.Add(new Dic_Codigo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Tipo,
                  fila.Orden,
                  fila.Dic_Campo_Id,
                  fila.Ref_Dic_Campo_Id,
                  fila.Dic_Secuencia_Id,
                  fila.Pre_Dic_Campo_Id,
                  fila.Constante,
                  fila.Funcion,
                  fila.Act_Dic_Campo_Id,
                  fila.Dic_Secuencia_Codigo,
                  fila.Dic_Secuencia_Nombre,
                  fila.Ref_dic_Campo_Codigo,
                  fila.Ref_Dic_Campo_Nombre,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_Codigo,
                  fila.Dic_Objeto_Nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Ref_Dic_Modulo_Id,
                  fila.Ref_Dic_Modulo_Codigo,
                  fila.Ref_Dic_Modulo_Nombre,
                  fila.Ref_Dic_Objeto_Id,
                  fila.Ref_Dic_Objeto_Codigo,
                  fila.Ref_Dic_Objeto_Nombre,
                  fila.Act_Dic_Campo_Codigo,
                  fila.Act_Dic_Campo_Nombre,
                  fila.Act_Dic_Modulo_Id,
                  fila.Act_Dic_Modulo_Codigo,
                  fila.Act_Dic_Modulo_Nombre,
                  fila.Act_Dic_Objeto_Id,
                  fila.Act_Dic_Objeto_Codigo,
                  fila.Act_Dic_Objeto_Nombre,
                  fila.Pre_Dic_Campo_Codigo,
                  fila.Pre_Dic_Campo_Nombre,
                  fila.Pre_Dic_Objeto_Id,
                  fila.Pre_Dic_Objeto_Codigo,
                  fila.Pre_Dic_Objeto_Nombre,
                  fila.Estado_nombre,
                  fila.Tipo_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Dic_Codigo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Codigo o)
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
                      o.Tipo,
                      o.Orden,
                      o.Dic_Campo_Id,
                      o.Act_Dic_Campo_Id,
                      o.Ref_Dic_Campo_Id,
                      o.Dic_Secuencia_Id,
                      o.Pre_Dic_Campo_Id,
                      o.Constante,
                      o.Funcion,
                      o.Estado);
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
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Codigo_Det_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
        /// Borra el objeto de la tabla Dic_Codigo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Codigo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Tipo,
                    o.Orden,
                    o.Dic_Campo_Id,
                    o.Act_Dic_Campo_Id,
                    o.Ref_Dic_Campo_Id,
                    o.Dic_Secuencia_Id,
                    o.Pre_Dic_Campo_Id,
                    o.Constante,
                    o.Funcion,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Dic_Codigo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Codigo o, Dic_Codigo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Tipo,
                    o.Orden,
                    o.Dic_Campo_Id,
                    o.Act_Dic_Campo_Id,
                    o.Ref_Dic_Campo_Id,
                    o.Dic_Secuencia_Id,
                    o.Pre_Dic_Campo_Id,
                    o.Constante,
                    o.Funcion,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Tipo,
                    original.Orden,
                    original.Dic_Campo_Id,
                    original.Act_Dic_Campo_Id,
                    original.Ref_Dic_Campo_Id,
                    original.Dic_Secuencia_Id,
                    original.Pre_Dic_Campo_Id,
                    original.Constante,
                    original.Funcion,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Dic_Codigo_Det_Codigo))
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
