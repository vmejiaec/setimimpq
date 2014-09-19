
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
    /// Tabla:Dic_Con_Objeto
    /// </summary>
    public class DO_Dic_Con_Objeto
    {
        #region Adapter
        private Dic_Con_ObjetoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Dic_Con_ObjetoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_Con_ObjetoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Dic_Con_Objeto
        /// </summary> 
        /// <returns>Lista de objetos Dic_Con_Objeto</returns> 
        public List<Dic_Con_Objeto> Get(Scope s)
        {
            List<Dic_Con_Objeto> lista = new List<Dic_Con_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ObjetoDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Con_Objeto(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Contenedor_Id,
                        fila.Dic_Objeto_Id,
                        fila.Orden,
                        fila.INS,
                        fila.UPD,
                        fila.DEL,
                        fila.Maximo,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Objeto_Dic_Modulo_Id,
                        fila.Objeto_Dic_Modulo_Codigo,
                        fila.Objeto_Dic_Modulo_Nombre,
                        fila.Ins_Nombre,
                        fila.Upd_Nombre,
                        fila.Del_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Objeto> GetByCodigo(Scope s, string Codigo)
        {
            List<Dic_Con_Objeto> lista = new List<Dic_Con_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ObjetoDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Con_Objeto(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Contenedor_Id,
                        fila.Dic_Objeto_Id,
                        fila.Orden,
                        fila.INS,
                        fila.UPD,
                        fila.DEL,
                        fila.Maximo,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Objeto_Dic_Modulo_Id,
                        fila.Objeto_Dic_Modulo_Codigo,
                        fila.Objeto_Dic_Modulo_Nombre,
                        fila.Ins_Nombre,
                        fila.Upd_Nombre,
                        fila.Del_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Objeto> GetByContenedorObjetoOrden(Scope s, string dic_contenedor_nombre, string dic_objeto_nombre, int Orden)
        {
            List<Dic_Con_Objeto> lista = new List<Dic_Con_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ObjetoDataTable tabla = Adapter.GetByContenedorObjetoOrden(s.Ver_Version_Id, dic_contenedor_nombre, dic_objeto_nombre, Orden);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Con_Objeto(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Contenedor_Id,
                        fila.Dic_Objeto_Id,
                        fila.Orden,
                        fila.INS,
                        fila.UPD,
                        fila.DEL,
                        fila.Maximo,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Objeto_Dic_Modulo_Id,
                        fila.Objeto_Dic_Modulo_Codigo,
                        fila.Objeto_Dic_Modulo_Nombre,
                        fila.Ins_Nombre,
                        fila.Upd_Nombre,
                        fila.Del_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Objeto> GetById(Scope s, string Id)
        {
            List<Dic_Con_Objeto> lista = new List<Dic_Con_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ObjetoDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Con_Objeto(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Contenedor_Id,
                        fila.Dic_Objeto_Id,
                        fila.Orden,
                        fila.INS,
                        fila.UPD,
                        fila.DEL,
                        fila.Maximo,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Objeto_Dic_Modulo_Id,
                        fila.Objeto_Dic_Modulo_Codigo,
                        fila.Objeto_Dic_Modulo_Nombre,
                        fila.Ins_Nombre,
                        fila.Upd_Nombre,
                        fila.Del_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Dic_Con_Objeto> GetByLikeNombre(Scope s, string Dic_Contenedor_Id, string Dic_Objeto_Id, string Nombre)
        {
            string llamada = "";
            List<Dic_Con_Objeto> lista = new List<Dic_Con_Objeto>();
            //Extrae los datos
            if (s != null)
            {
                Diccionario.Dic_Con_ObjetoDataTable tabla = Adapter.GetByLikeNombre(s.Ver_Version_Id, Dic_Contenedor_Id, Dic_Objeto_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Dic_Contenedor_Id : " + Dic_Contenedor_Id + "," + " Dic_Objeto_Id : " + Dic_Objeto_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Dic_Con_Objeto_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Diccionario.Dic_Con_ObjetoRow fila in tabla)
                    lista.Add(new Dic_Con_Objeto(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Dic_Contenedor_Id,
                        fila.Dic_Objeto_Id,
                        fila.Orden,
                        fila.INS,
                        fila.UPD,
                        fila.DEL,
                        fila.Maximo,
                        fila.Dic_Contenedor_Codigo,
                        fila.Dic_Contenedor_Nombre,
                        fila.Dic_Objeto_Codigo,
                        fila.Dic_Objeto_Nombre,
                        fila.Contenedor_Dic_Modulo_Id,
                        fila.Contenedor_Dic_Modulo_Codigo,
                        fila.Contenedor_Dic_Modulo_Nombre,
                        fila.Objeto_Dic_Modulo_Id,
                        fila.Objeto_Dic_Modulo_Codigo,
                        fila.Objeto_Dic_Modulo_Nombre,
                        fila.Ins_Nombre,
                        fila.Upd_Nombre,
                        fila.Del_Nombre,
                        fila.Estado_Nombre));
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
        /// Inserta el objeto en la tabla Dic_Con_Objeto
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Dic_Con_Objeto o)
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
                    o.Dic_Contenedor_Id,
                    o.Dic_Objeto_Id,
                    o.Orden,
                    o.INS,
                    o.UPD,
                    o.DEL,
                    o.Estado,
                    o.Maximo);
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
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Objeto_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Objeto_Cont_Obj_Orden))
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
        /// Borra el objeto de la tabla Dic_Con_Objeto
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Dic_Con_Objeto o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Dic_Contenedor_Id,
                    o.Dic_Objeto_Id,
                    o.Orden,
                    o.INS,
                    o.UPD,
                    o.DEL,
                    o.Estado,
                    o.Maximo);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;


                if (e.Message.Contains(TXT_BDD._FK_Dic_Con_Campo_Dic_Con_Objeto))
                {
                    eCaso = new System.Exception("Dic Con Campo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Par_Mensajeria_Dic_Con_Objeto))
                {
                    eCaso = new System.Exception("Par Mensajeria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Objeto_Dic_Con_Objeto))
                {
                    eCaso = new System.Exception("Seg Rol Objeto");
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
        //Actualiza la tabla Dic_Con_Objeto
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Dic_Con_Objeto o, Dic_Con_Objeto original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Dic_Contenedor_Id,
                    o.Dic_Objeto_Id,
                    o.Orden,
                    o.INS,
                    o.UPD,
                    o.DEL,
                    o.Estado,
                    o.Maximo,
                    original.Id,
                    original.Codigo,
                    original.Dic_Contenedor_Id,
                    original.Dic_Objeto_Id,
                    original.Orden,
                    original.INS,
                    original.UPD,
                    original.DEL,
                    original.Estado,
                    original.Maximo);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Objeto_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Dic_Con_Objeto_Cont_Obj_Orden))
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
