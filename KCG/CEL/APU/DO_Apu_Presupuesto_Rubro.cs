
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Presupuesto_Rubro
    /// </summary>
    public class DO_Apu_Presupuesto_Rubro
    {
        #region Adapter
        private Apu_Presupuesto_RubroTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Presupuesto_RubroTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Presupuesto_RubroTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Presupuesto_Rubro
        /// </summary> 
        /// <returns>Lista de objetos Apu_Presupuesto_Rubro</returns> 
        public List<Apu_Presupuesto_Rubro> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Presupuesto_RubroDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Presupuesto_Rubro_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Presupuesto_RubroRow fila in tabla)
                    lista.Add(new Apu_Presupuesto_Rubro(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Apu_Presupuesto_Id,
                  fila.Apu_Rubro_id,
                  fila.Apu_Rubro_Codigo,
                  fila.Apu_Rubro_Nombre,
                  fila.Apu_Rubro_Unidad,
                  fila.Apu_Rubro_Cantidad,
                  fila.Costo_Unitario,
                  fila.Costo_Total,
                  fila.Apu_Subtitulo_Id,
                  fila.Apu_Subtitulo_Codigo,
                  fila.Apu_Subtitulo_Nombre,
                  fila.Apu_Titulo_id,
                  fila.Apu_Titulo_Codigo,
                  fila.Apu_Titulo_Nombre,
                  fila.Apu_Origen_Id));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto_Rubro> GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            string llamada = "";
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Presupuesto_RubroDataTable tabla =
                Adapter.GetByOrigen(s.Ver_Version_Id, Apu_Origen_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOrigen" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Origen_Id : " + Apu_Origen_Id + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Rubro_ByOrigen " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Presupuesto_RubroRow fila in tabla)
                    lista.Add(new Apu_Presupuesto_Rubro(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Descripcion,
              fila.Apu_Presupuesto_Id,
              fila.Apu_Rubro_id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Rubro_Cantidad,
              fila.Costo_Unitario,
              fila.Costo_Total,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Codigo,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_id,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Apu_Origen_Id));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto_Rubro> GetByPresupuesto(Scope s, string Apu_Presupuesto_Id , string Estado)
        {
            string llamada = "";
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Presupuesto_RubroDataTable tabla =
                Adapter.GetByPresupuesto(s.Ver_Version_Id, Apu_Presupuesto_Id,Estado);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPresupuesto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Rubro_ByPresup " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Presupuesto_RubroRow fila in tabla)
                    lista.Add(new Apu_Presupuesto_Rubro(
                              fila.Id,
                              fila.Codigo,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Apu_Presupuesto_Id,
                              fila.Apu_Rubro_id,
                              fila.Apu_Rubro_Codigo,
                              fila.Apu_Rubro_Nombre,
                              fila.Apu_Rubro_Unidad,
                              fila.Apu_Rubro_Cantidad,
                              fila.Costo_Unitario,
                              fila.Costo_Total,
                              fila.Apu_Subtitulo_Id,
                              fila.Apu_Subtitulo_Codigo,
                              fila.Apu_Subtitulo_Nombre,
                              fila.Apu_Titulo_id,
                              fila.Apu_Titulo_Codigo,
                              fila.Apu_Titulo_Nombre,
                              fila.Apu_Origen_Id));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto_Rubro> GetByPresupuestoPF(Scope s, string Apu_Presupuesto_Id,string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            string llamada = "";
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Presupuesto_RubroDataTable tabla =
                Adapter.GetByPresupuestoPF(s.Ver_Version_Id, Apu_Presupuesto_Id,Estado, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Cantidad_Desde, Apu_Rubro_Cantidad_Hasta, s.Numero_Registros, s.Pagina_Actual);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPresupuestoPF" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + "," + " Apu_Rubro_Codigo : " + Apu_Rubro_Codigo + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + "," + " Apu_Rubro_Cantidad_Desde : " + Apu_Rubro_Cantidad_Desde + "," + " Apu_Rubro_Cantidad_Hasta : " + Apu_Rubro_Cantidad_Hasta + "," + " Numero_Registros : " + s.Numero_Registros + "," + " Pagina_Actual : " + s.Pagina_Actual + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Rubro_ByPresupuesto " + " Número de Registros: " + s.Numero_Registros;
                //Carga en la lista
                foreach (Apu.Apu_Presupuesto_RubroRow fila in tabla)
                    lista.Add(new Apu_Presupuesto_Rubro(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Presupuesto_Id,
                                      fila.Apu_Rubro_id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Apu_Rubro_Cantidad,
                                      fila.Costo_Unitario,
                                      fila.Costo_Total,
                                      fila.Apu_Subtitulo_Id,
                                      fila.Apu_Subtitulo_Codigo,
                                      fila.Apu_Subtitulo_Nombre,
                                      fila.Apu_Titulo_id,
                                      fila.Apu_Titulo_Codigo,
                                      fila.Apu_Titulo_Nombre,
                                      fila.Apu_Origen_Id));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto_Rubro> GetByLikePresupuestoPlanilla(Scope s, string Apu_Presupuesto_Id, string Apu_Rubro_Nombre, string Estado,string Fis_Planilla_Id)
        {
            string llamada = "";
            List<Apu_Presupuesto_Rubro> lista = new List<Apu_Presupuesto_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Presupuesto_RubroDataTable tabla =
                Adapter.GetByLikePresupuestoPlanilla(s.Ver_Version_Id, Apu_Presupuesto_Id, Apu_Rubro_Nombre,Estado,Fis_Planilla_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikePresupuestoPlanilla" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + "," + " Apu_Rubro_Nombre : " + Apu_Rubro_Nombre + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_Rubro_ByLikePresupuestoPlanilla " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Presupuesto_RubroRow fila in tabla)
                    lista.Add(new Apu_Presupuesto_Rubro(
                                      fila.Id,
                                      fila.Codigo,
                                      fila.Estado,
                                      fila.Descripcion,
                                      fila.Apu_Presupuesto_Id,
                                      fila.Apu_Rubro_id,
                                      fila.Apu_Rubro_Codigo,
                                      fila.Apu_Rubro_Nombre,
                                      fila.Apu_Rubro_Unidad,
                                      fila.Apu_Rubro_Cantidad,
                                      fila.Costo_Unitario,
                                      fila.Costo_Total,
                                      fila.Apu_Subtitulo_Id,
                                      fila.Apu_Subtitulo_Codigo,
                                      fila.Apu_Subtitulo_Nombre,
                                      fila.Apu_Titulo_id,
                                      fila.Apu_Titulo_Codigo,
                                      fila.Apu_Titulo_Nombre,
                                      fila.Apu_Origen_Id));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }


        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Apu_Presupuesto_Id, string Estado, string Apu_Rubro_Codigo, string Apu_Rubro_Nombre, decimal Apu_Rubro_Cantidad_Desde, decimal Apu_Rubro_Cantidad_Hasta)
        {
            int resultado;
            // Recuperar la lista de objetos a procesar
            List<Apu_Presupuesto_Rubro> lista = null;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, Apu_Presupuesto_Id,Estado, Apu_Rubro_Codigo, Apu_Rubro_Nombre, Apu_Rubro_Cantidad_Desde, Apu_Rubro_Cantidad_Hasta, s.Numero_Registros);
            //Retorna el resultado
            return resultado;
        }
        #endregion

        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Presupuesto_Rubro o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Apu_Presupuesto_Id,
                      o.Apu_Rubro_id,
                      o.Apu_Rubro_Codigo,
                      o.Apu_Rubro_Nombre,
                      o.Apu_Rubro_Unidad,
                      o.Apu_Rubro_Cantidad,
                      o.Costo_Unitario,
                      o.Costo_Total,
                      o.Apu_Subtitulo_Id
                );
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                            throw;
                        break;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Presupuesto_Rubro
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Presupuesto_Rubro o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(

                 o.Id,
                 o.Codigo,
                 o.Estado,
                 o.Descripcion,
                 o.Apu_Presupuesto_Id,
                 o.Apu_Rubro_id,
                 o.Apu_Rubro_Codigo,
                 o.Apu_Rubro_Nombre,
                 o.Apu_Rubro_Unidad,
                 o.Apu_Rubro_Cantidad,
                 o.Costo_Unitario,
                 o.Costo_Total,
                 o.Apu_Subtitulo_Id
                );
            }

            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Fis_Planilla_Det_Apu_Presupuesto_Rubro))
                {
                    eCaso = new System.Exception("Fis Planilla Det");
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
        //Actualiza la tabla Apu_Presupuesto_Rubro
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Presupuesto_Rubro o, Apu_Presupuesto_Rubro original)
        {
            int resultado;
            resultado = Adapter.Update(

                  o.Id,
                  o.Codigo,
                  o.Estado,
                  o.Descripcion,
                  o.Apu_Presupuesto_Id,
                  o.Apu_Rubro_id,
                  o.Apu_Rubro_Codigo,
                  o.Apu_Rubro_Nombre,
                  o.Apu_Rubro_Unidad,
                  o.Apu_Rubro_Cantidad,
                  o.Costo_Unitario,
                  o.Costo_Total,
                  o.Apu_Subtitulo_Id,
                  original.Id,
                  original.Codigo,
                  original.Estado,
                  original.Descripcion,
                  original.Apu_Presupuesto_Id,
                  original.Apu_Rubro_id,
                  original.Apu_Rubro_Codigo,
                  original.Apu_Rubro_Nombre,
                  original.Apu_Rubro_Unidad,
                  original.Apu_Rubro_Cantidad,
                  original.Costo_Unitario,
                  original.Costo_Total,
                  original.Apu_Subtitulo_Id

            );
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
