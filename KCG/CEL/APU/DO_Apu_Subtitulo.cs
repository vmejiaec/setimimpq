
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
    /// Tabla:Apu_Subtitulo
    /// </summary>
    public class DO_Apu_Subtitulo
    {
        #region Adapter
        private Apu_SubtituloTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_SubtituloTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_SubtituloTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Subtitulo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Subtitulo</returns> 
        public List<Apu_Subtitulo> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Subtitulo_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Apu_Titulo_Id,
                  fila.Int_Empresa_Id,
                  fila.Int_empresa_Codigo,
                  fila.Int_Empresa_nombre,
                  fila.Apu_Titulo_Codigo,
                  fila.Apu_Titulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetByTitulo(Scope s, string Apu_Titulo_Id)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetByTitulo(s.Ver_Version_Id, Apu_Titulo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByTitulo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Titulo_Id : " + Apu_Titulo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ByTitulo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetByLikeNombre(Scope s, string Apu_Titulo_Id, string Nombre)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Apu_Titulo_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Titulo_Id : " + Apu_Titulo_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Subtitulo> GetByOnlyPredeterminadaOfertaRubro(Scope s)
        {
            string llamada = "";
            List<Apu_Subtitulo> lista = new List<Apu_Subtitulo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_SubtituloDataTable tabla =
                Adapter.GetByOnlyPredeterminadaOfertaRubro(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOnlyPredeterminadaOfertaRubro" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Subtitulo_ByOnPredeterminadaOfertaRubro " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_SubtituloRow fila in tabla)
                    lista.Add(new Apu_Subtitulo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Apu_Titulo_Id,
              fila.Int_Empresa_Id,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
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
        /// Inserta el objeto en la tabla Apu_Subtitulo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Subtitulo o)
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
                      o.Nombre.ToUpper(),
                      o.Apu_Titulo_Id,
                      o.Int_Empresa_Id,
                      o.Estado
                );
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Subtitulo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Subtitulo_Nombre_Empresa))
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
        /// Borra el objeto de la tabla Apu_Subtitulo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Subtitulo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Apu_Titulo_Id,
                    o.Int_Empresa_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Apu_Subtitulo))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Apu_Subtitulo))
                {
                    eCaso = new System.Exception("Apu Rubro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Rubro_Apu_Subtitulo))
                {
                    eCaso = new System.Exception("Apu Presupuesto Rubro");
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
        //Actualiza la tabla Apu_Subtitulo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Subtitulo o, Apu_Subtitulo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Apu_Titulo_Id,
                    o.Int_Empresa_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Apu_Titulo_Id,
                    original.Int_Empresa_Id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Subtitulo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Subtitulo_Nombre_Empresa))
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
