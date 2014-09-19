
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.FiscalizacionTableAdapters;
using AEL.FIS;
using BEL;
using System;

namespace CEL.FIS
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Fiscalizaci
    /// Tabla:Fis_Multa
    /// </summary>
    public class DO_Fis_Multa
    {
        #region Adapter
        private Fis_MultaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_MultaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_MultaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Multa
        /// </summary> 
        /// <returns>Lista de objetos Fis_Multa</returns> 
        public List<Fis_Multa> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Multa> lista = new List<Fis_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_MultaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Fis_Multa_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_MultaRow fila in tabla)
                    lista.Add(new Fis_Multa(

                          fila.Id,
                          fila.Codigo,
                          fila.Nombre,
                          fila.Estado,
                          fila.Descripcion,
                          fila.Int_Empresa_Id,
                          fila.Int_Empresa_Codigo,
                          fila.Int_Empresa_Nombre,
                          fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Multa> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Multa> lista = new List<Fis_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_MultaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Fis_Multa_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_MultaRow fila in tabla)
                    lista.Add(new Fis_Multa(
                          fila.Id,
                          fila.Codigo,
                          fila.Nombre,
                          fila.Estado,
                          fila.Descripcion,
                          fila.Int_Empresa_Id,
                          fila.Int_Empresa_Codigo,
                          fila.Int_Empresa_Nombre,
                          fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Multa> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Multa> lista = new List<Fis_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_MultaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Multa_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_MultaRow fila in tabla)
                    lista.Add(new Fis_Multa(
                      fila.Id,
                      fila.Codigo,
                      fila.Nombre,
                      fila.Estado,
                      fila.Descripcion,
                      fila.Int_Empresa_Id,
                      fila.Int_Empresa_Codigo,
                      fila.Int_Empresa_Nombre,
                      fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Multa> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Fis_Multa> lista = new List<Fis_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_MultaDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Fis_Multa_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_MultaRow fila in tabla)
                    lista.Add(new Fis_Multa(

                      fila.Id,
                      fila.Codigo,
                      fila.Nombre,
                      fila.Estado,
                      fila.Descripcion,
                      fila.Int_Empresa_Id,
                      fila.Int_Empresa_Codigo,
                      fila.Int_Empresa_Nombre,
                      fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Multa> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Fis_Multa> lista = new List<Fis_Multa>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_MultaDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Fis_Multa_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_MultaRow fila in tabla)
                    lista.Add(new Fis_Multa(
                      fila.Id,
                      fila.Codigo,
                      fila.Nombre,
                      fila.Estado,
                      fila.Descripcion,
                      fila.Int_Empresa_Id,
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
        /// Inserta el objeto en la tabla Fis_Multa
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Multa o)
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
                    o.Estado,
                    o.Descripcion,
                    o.Int_Empresa_Id);
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
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Multa_Codigo))
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Fis_Multa
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Multa o)
        {
            int resultado = 0;            
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado,
                    o.Descripcion,
                    o.Int_Empresa_Id);
            }
            catch(SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Fis_Planilla_Multa_Fis_Multa))
                {
                    eCaso = new System.Exception("Fis Planilla Multa");
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
        //Actualiza la tabla Fis_Multa
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Multa o, Fis_Multa original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Estado,
                    o.Descripcion, 
                    o.Int_Empresa_Id,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Estado,
                    original.Descripcion,
                    original.Int_Empresa_Id);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Multa_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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