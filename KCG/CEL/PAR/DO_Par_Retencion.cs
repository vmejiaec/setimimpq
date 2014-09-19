
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ParametrosTableAdapters;
using AEL.PAR;
using BEL;
using System;

namespace CEL.PAR
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Retencion
    /// </summary>
    public class DO_Par_Retencion
    {
        #region Adapter
        private Par_RetencionTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Par_RetencionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Par_RetencionTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Par_Retencion
        /// </summary> 
        /// <returns>Lista de objetos Par_Retencion</returns> 
        public List<Par_Retencion> Get(Scope s)
        {
            string llamada = "";
            List<Par_Retencion> lista = new List<Par_Retencion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_RetencionDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " 
                        + " Par_Retencion_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_RetencionRow fila in tabla)
                    lista.Add(new Par_Retencion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Retencion> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Par_Retencion> lista = new List<Par_Retencion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_RetencionDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " 
                        + "dbo.Par_Retencion_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_RetencionRow fila in tabla)
                    lista.Add(new Par_Retencion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Retencion> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Par_Retencion> lista = new List<Par_Retencion>();
            //Extrae los datos
            if (s != null)
            {   
                Parametros.Par_RetencionDataTable tabla = Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id 
                        + " Nombre del Store Procedure: " + "dbo.Par_Retencion_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_RetencionRow fila in tabla)
                    lista.Add(new Par_Retencion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Retencion> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Par_Retencion> lista = new List<Par_Retencion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_RetencionDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " 
                        + "dbo.Par_Retencion_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_RetencionRow fila in tabla)
                    lista.Add(new Par_Retencion(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Retencion> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Par_Retencion> lista = new List<Par_Retencion>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_RetencionDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Par_Retencion_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_RetencionRow fila in tabla)
                    lista.Add(new Par_Retencion(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Valor,
              fila.Descripcion,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
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
        /// Inserta el objeto en la tabla Par_Retencion
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Par_Retencion o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Nombre,
                      o.Int_Empresa_Id,
                      o.Valor,
                      o.Descripcion,
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
                        if (mensaje.Contains(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Par_Retencion_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Par_Retencion_Nombre_Int_Empresa_Id))
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
        /// Borra el objeto de la tabla Par_Retencion
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Par_Retencion o)
        {
            int resultado = 0;
            try
            {
                Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Valor,
                    o.Descripcion,
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Par_Retencion
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Par_Retencion o, Par_Retencion original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Valor,
                    o.Descripcion,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Int_Empresa_Id,
                    original.Valor,
                    original.Descripcion,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Par_Retencion_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Par_Retencion_Nombre_Int_Empresa_Id))
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
