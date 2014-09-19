
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
    /// Tabla:Par_Razon_Social
    /// </summary>
    public class DO_Par_Razon_Social
    {
        #region Adapter
        private Par_Razon_SocialTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Par_Razon_SocialTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Par_Razon_SocialTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Par_Razon_Social
        /// </summary> 
        /// <returns>Lista de objetos Par_Razon_Social</returns> 
        public List<Par_Razon_Social> Get(Scope s)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Par_Razon_Social_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Par_Tipo_Identificacion_Id,
                  fila.Numero,
                  fila.Nombre_Comercial,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Par_Tipo_Identificacion_Codigo,
                  fila.Par_Tipo_Identificacion_Nombre,
                  fila.Par_Tipo_Identificacion_Cedula,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Par_Tipo_Identificacion_Id,
              fila.Numero,
              fila.Nombre_Comercial,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Par_Tipo_Identificacion_Codigo,
              fila.Par_Tipo_Identificacion_Nombre,
              fila.Par_Tipo_Identificacion_Cedula,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Par_Tipo_Identificacion_Id,
              fila.Numero,
              fila.Nombre_Comercial,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Par_Tipo_Identificacion_Codigo,
              fila.Par_Tipo_Identificacion_Nombre,
              fila.Par_Tipo_Identificacion_Cedula,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Par_Tipo_Identificacion_Id,
              fila.Numero,
              fila.Nombre_Comercial,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Par_Tipo_Identificacion_Codigo,
              fila.Par_Tipo_Identificacion_Nombre,
              fila.Par_Tipo_Identificacion_Cedula,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetByLikeNombre(Scope s, string Par_Tipo_Identificacion_Id, string Nombre)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, s.Int_Empresa_Id, Par_Tipo_Identificacion_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Par_Tipo_Identificacion_Id,
              fila.Numero,
              fila.Nombre_Comercial,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Par_Tipo_Identificacion_Codigo,
              fila.Par_Tipo_Identificacion_Nombre,
              fila.Par_Tipo_Identificacion_Cedula,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetByLikeNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla =
                Adapter.GetByLikeNumero(s.Ver_Version_Id, s.Int_Empresa_Id, Par_Tipo_Identificacion_Id, Numero);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNumero" + " Parametros  Enviados en el Método: " + "," + " ver_version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + " Numero : " + Numero + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ByLikeNumero " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(

                fila.Id,
                fila.Codigo,
                fila.Nombre,
                fila.Estado,
                fila.Par_Tipo_Identificacion_Id,
                fila.Numero,
                fila.Nombre_Comercial,
                fila.Int_Empresa_Id,
                fila.Int_Empresa_Codigo,
                fila.Int_Empresa_Nombre,
                fila.Par_Tipo_Identificacion_Codigo,
                fila.Par_Tipo_Identificacion_Nombre,
                fila.Par_Tipo_Identificacion_Cedula,
                fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Razon_Social> GetByTipoNumero(Scope s, string Par_Tipo_Identificacion_Id, string Numero)
        {
            string llamada = "";
            List<Par_Razon_Social> lista = new List<Par_Razon_Social>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_Razon_SocialDataTable tabla = Adapter.GetByTipoNumero(s.Ver_Version_Id, Par_Tipo_Identificacion_Id, Numero);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByTipoNumero" + " Parametros  Enviados en el Método: " + ","
                        + " ver_version_id : " + s.Ver_Version_Id + "," + " Par_Tipo_Identificacion_Id : " + Par_Tipo_Identificacion_Id + ","
                        + " Numero : " + Numero + " Nombre del Store Procedure: " + "dbo.Par_Razon_Social_ByTipoNumero "
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Parametros.Par_Razon_SocialRow fila in tabla)
                    lista.Add(new Par_Razon_Social(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Numero,
                        fila.Nombre_Comercial,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Codigo,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Tipo_Identificacion_Cedula,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Par_Razon_Social
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Par_Razon_Social o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Par_Tipo_Identificacion_Id,
                      o.Numero,
                      o.Nombre,
                      o.Nombre_Comercial,
                      o.Int_Empresa_Id,
                      o.Estado
                );
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
                        if (mensaje.Contains(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Nombre_Int_Empresa_Id_Par_Tipo_Identificacion_Id))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Tipo_Identificacion_Numero))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //throw;
                    //break;
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
        /// Borra el objeto de la tabla Par_Razon_Social
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Par_Razon_Social o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(

                 o.Id,
                 o.Codigo,
                 o.Par_Tipo_Identificacion_Id,
                 o.Numero,
                 o.Nombre,
                 o.Nombre_Comercial,
                 o.Int_Empresa_Id,
                 o.Estado
           );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Com_Devolucion_Donacion_Ing_Par_Razon_Social))
                {
                    eCaso = new Exception("Com Devolucion Donacion Ing");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Com_Donacion_Ing_Par_Razon_Social))
                {
                    eCaso = new Exception("Com Donacion Ing");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Com_Prestamo_Egr_Par_Razon_Social))
                {
                    eCaso = new Exception("Com Prestamo Egr");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Com_Prestamo_Ing_Par_Razon_Social))
                {
                    eCaso = new Exception("Com Prestamo Ing");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fac_Cliente_Par_Razon_Social1))
                {
                    eCaso = new Exception("Fac Cliente");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fac_Cliente_Par_Razon_Social2))
                {
                    eCaso = new Exception("Fac Cliente");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fac_Factura_Razon_Social))
                {
                    eCaso = new Exception("Fac Factura");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
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
        //Actualiza la tabla Par_Razon_Social
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Par_Razon_Social o, Par_Razon_Social original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

                  o.Id,
                  o.Codigo,
                  o.Par_Tipo_Identificacion_Id,
                  o.Numero,
                  o.Nombre,
                  o.Nombre_Comercial,
                  o.Int_Empresa_Id,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Par_Tipo_Identificacion_Id,
                  original.Numero,
                  original.Nombre,
                  original.Nombre_Comercial,
                  original.Int_Empresa_Id,
                  original.Estado

            );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Nombre_Int_Empresa_Id_Par_Tipo_Identificacion_Id))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Par_Razon_Social_Tipo_Identificacion_Numero))
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
