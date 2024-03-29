
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Rubro_Documento
    /// </summary>
    public class DO_Apu_Rubro_Documento
    {
        #region Adapter
        private Apu_Rubro_DocumentoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Rubro_DocumentoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Rubro_DocumentoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Rubro_Documento
        /// </summary> 
        /// <returns>Lista de objetos Apu_Rubro_Documento</returns> 
        public List<Apu_Rubro_Documento> Get(Scope s, string par_servidor_Id)
        {
            string llamada = "";
            List<Apu_Rubro_Documento> lista = new List<Apu_Rubro_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_DocumentoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id, s.Par_Servidor_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Rubro_Documento_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_DocumentoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Documento(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Apu_Rubro_Id,
                  fila.Ruta,
                  fila.Descripcion,
                  fila.Apu_Rubro_Codigo,
                  fila.Apu_Rubro_Nombre,
                  fila.Apu_Rubro_Unidad,
                  fila.Path_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro_Documento> GetByCodigo(Scope s, string Codigo, string par_servidor_Id)
        {
            string llamada = "";
            List<Apu_Rubro_Documento> lista = new List<Apu_Rubro_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_DocumentoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo, s.Par_Servidor_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + "," + " par_servidor_Id : " + s.Par_Servidor_Id + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Documento_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_DocumentoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Documento(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Rubro_Id,
              fila.Ruta,
              fila.Descripcion,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Path_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro_Documento> GetById(Scope s, string Id, string par_servidor_Id)
        {
            string llamada = "";
            List<Apu_Rubro_Documento> lista = new List<Apu_Rubro_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_DocumentoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id, s.Par_Servidor_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + "," + " par_servidor_Id : " + s.Par_Servidor_Id + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Documento_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_DocumentoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Documento(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Rubro_Id,
              fila.Ruta,
              fila.Descripcion,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Path_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro_Documento> GetByRubro(Scope s, string Apu_Rubro_Id, string par_servidor_Id)
        {
            string llamada = "";
            List<Apu_Rubro_Documento> lista = new List<Apu_Rubro_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Rubro_DocumentoDataTable tabla =
                Adapter.GetByRubro(s.Ver_Version_Id, Apu_Rubro_Id, s.Par_Servidor_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRubro" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Rubro_Id : " + Apu_Rubro_Id + "," + " par_servidor_Id : " + s.Par_Servidor_Id + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_Documento_ByRubro " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Rubro_DocumentoRow fila in tabla)
                    lista.Add(new Apu_Rubro_Documento(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Rubro_Id,
              fila.Ruta,
              fila.Descripcion,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Path_Nombre,
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
        /// Inserta el objeto en la tabla Apu_Rubro_Documento
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Rubro_Documento o)
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
                      o.Apu_Rubro_Id,
                      o.Nombre.ToUpper(),
                      o.Ruta.ToUpper(),
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
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Documento_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Documento_Nombre))
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
        /// Borra el objeto de la tabla Apu_Rubro_Documento
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Rubro_Documento o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Rubro_Id,
                    o.Nombre,
                    o.Ruta,
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
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Rubro_Documento
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Rubro_Documento o, Apu_Rubro_Documento original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Rubro_Id,
                    o.Nombre.ToUpper(),
                    o.Ruta.ToUpper(),
                    o.Descripcion,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Rubro_Id,
                    original.Nombre,
                    original.Ruta,
                    original.Descripcion,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Documento_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Documento_Nombre))
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
