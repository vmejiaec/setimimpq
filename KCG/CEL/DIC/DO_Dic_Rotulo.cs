
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
    /// Tabla:Dic_Rotulo
    /// </summary>
    public class DO_Dic_Rotulo
    {
        #region Adapter
        private Dic_RotuloTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_RotuloTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_RotuloTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Rotulo
        /// </summary> 
        /// <returns>Lista de objetos Dic_Rotulo</returns> 
        public List<Dic_Rotulo> Get(Scope s)
        {
            List<Dic_Rotulo> lista = new List<Dic_Rotulo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_RotuloDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_RotuloRow fila in tabla)
                    lista.Add(new Dic_Rotulo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Rotulo> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Rotulo> lista = new List<Dic_Rotulo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_RotuloDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_RotuloRow fila in tabla)
                    lista.Add(new Dic_Rotulo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Rotulo> GetById(Scope s, string Id)
        {
            List<Dic_Rotulo> lista = new List<Dic_Rotulo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_RotuloDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_RotuloRow fila in tabla)
                    lista.Add(new Dic_Rotulo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Rotulo> GetByMantenimiento(Scope s)
        {
            List<Dic_Rotulo> lista = new List<Dic_Rotulo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_RotuloDataTable tabla =
                Adapter.GetByMantenimiento(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_RotuloRow fila in tabla)
                    lista.Add(new Dic_Rotulo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Rotulo> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Dic_Rotulo> lista = new List<Dic_Rotulo>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_RotuloDataTable tabla = Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " 
                        + "dbo.Dic_Rotulo_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_RotuloRow fila in tabla)
                    lista.Add(new Dic_Rotulo(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
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
        /// Inserta el objeto en la tabla Dic_Rotulo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Rotulo o)
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
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Rotulo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Rotulo_Nombre))
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Dic_Rotulo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Rotulo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Campo_Dic_Rotulo))
                {
                    eCaso = new System.Exception("Dic Con Campo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Campo_Dic_Rotulo1))
                {
                    eCaso = new System.Exception("Dic Con Campo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Elemento_Dic_Rotulo))
                {
                    eCaso = new System.Exception("Dic Con Elemento");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Elemento_Dic_Rotulo1))
                {
                    eCaso = new System.Exception("Dic Con Elemento");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_General_Dic_Rotulo))
                {
                    eCaso = new System.Exception("Dic General");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_General_Dic_Rotulo1))
                {
                    eCaso = new System.Exception("Dic General");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Ver_Etiqueta_Dic_Rotulo))
                {
                    eCaso = new System.Exception("Ver Etiqueta");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Pantalla_Dic_Rotulo))
                {
                    eCaso = new System.Exception("Dic Pantalla");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Dic_Pantalla_Dic_Rotulo1))
                {
                    eCaso = new System.Exception("Dic Pantalla");
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
        //Actualiza la tabla Dic_Rotulo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Rotulo o, Dic_Rotulo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Dic_Rotulo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Rotulo_Nombre))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
