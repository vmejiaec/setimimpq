
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
    /// Tabla:Apu_Proyecto_Rubro_Tecnica
    /// </summary>
    public class DO_Apu_Proyecto_Rubro_Tecnica
    {
        #region Adapter
        private Apu_Proyecto_Rubro_TecnicaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Proyecto_Rubro_TecnicaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Proyecto_Rubro_TecnicaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Rubro_Tecnica
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Rubro_Tecnica</returns> 
        public List<Apu_Proyecto_Rubro_Tecnica> Get(Scope s, string par_servidor_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro_Tecnica> lista = new List<Apu_Proyecto_Rubro_Tecnica>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_Rubro_TecnicaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id, s.Par_Servidor_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Proyecto_Rubro_Tecnica_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_Rubro_TecnicaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro_Tecnica(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Proyecto_Rubro_Id,
                  fila.Imagen,
                  fila.Origen_Imagen,
                  fila.Definicion,
                  fila.Especificacion,
                  fila.Medicion,
                  fila.Apu_Proyecto_Rubro_Codigo,
                  fila.Path_Imagen,
                  fila.Path_Origen_Imagen,
                  fila.Apu_Proyecto_Id,
                  fila.Apu_Proyecto_Codigo,
                  fila.Apu_Proyecto_Nombre,
                  fila.Apu_Rubro_Id,
                  fila.Apu_Rubro_Codigo,
                  fila.Apu_Rubro_Nombre,
                  fila.Apu_Rubro_Unidad,
                  fila.Apu_Subtitulo_Id,
                  fila.Apu_Subtitulo_Codigo,
                  fila.Apu_Subtitulo_Nombre,
                  fila.Apu_Titulo_Id,
                  fila.Apu_Titulo_Codigo,
                  fila.Apu_Titulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro_Tecnica> GetByCodigo(Scope s, string par_servidor_Id, string Codigo)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro_Tecnica> lista = new List<Apu_Proyecto_Rubro_Tecnica>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_Rubro_TecnicaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, s.Par_Servidor_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " par_servidor_Id : " + s.Par_Servidor_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_Tecnica_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_Rubro_TecnicaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro_Tecnica(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Rubro_Id,
              fila.Imagen,
              fila.Origen_Imagen,
              fila.Definicion,
              fila.Especificacion,
              fila.Medicion,
              fila.Apu_Proyecto_Rubro_Codigo,
              fila.Path_Imagen,
              fila.Path_Origen_Imagen,
              fila.Apu_Proyecto_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Rubro_Id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Codigo,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_Id,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro_Tecnica> GetById(Scope s, string par_servidor_Id, string Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro_Tecnica> lista = new List<Apu_Proyecto_Rubro_Tecnica>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_Rubro_TecnicaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, s.Par_Servidor_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " par_servidor_Id : " + s.Par_Servidor_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_Tecnica_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_Rubro_TecnicaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro_Tecnica(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Rubro_Id,
              fila.Imagen,
              fila.Origen_Imagen,
              fila.Definicion,
              fila.Especificacion,
              fila.Medicion,
              fila.Apu_Proyecto_Rubro_Codigo,
              fila.Path_Imagen,
              fila.Path_Origen_Imagen,
              fila.Apu_Proyecto_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Rubro_Id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Codigo,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_Id,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro_Tecnica> GetByProyecto(Scope s, string par_servidor_Id, string apu_proyecto_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro_Tecnica> lista = new List<Apu_Proyecto_Rubro_Tecnica>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_Rubro_TecnicaDataTable tabla =
                Adapter.GetByProyecto(s.Ver_Version_Id, s.Par_Servidor_Id, apu_proyecto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " par_servidor_Id : " + par_servidor_Id + "," + " apu_proyecto_Id : " + apu_proyecto_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Rubro_Tecnica_ByProyecto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_Rubro_TecnicaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro_Tecnica(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Rubro_Id,
              fila.Imagen,
              fila.Origen_Imagen,
              fila.Definicion,
              fila.Especificacion,
              fila.Medicion,
              fila.Apu_Proyecto_Rubro_Codigo,
              fila.Path_Imagen,
              fila.Path_Origen_Imagen,
              fila.Apu_Proyecto_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Rubro_Id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Codigo,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_Id,
              fila.Apu_Titulo_Codigo,
              fila.Apu_Titulo_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Rubro_Tecnica> GetByProyectoRubro(Scope s, string par_servidor_Id, string apu_proyecto_rubro_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Rubro_Tecnica> lista = new List<Apu_Proyecto_Rubro_Tecnica>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_Rubro_TecnicaDataTable tabla =
                Adapter.GetByProyectoRubro(s.Ver_Version_Id, s.Par_Servidor_Id, apu_proyecto_rubro_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: "
                    + " GetByProyectoRubro" + " Parametros  Enviados en el Método: "
                    + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " par_servidor_Id : "
                    + par_servidor_Id + "," + " apu_proyecto_Id : "
                    + apu_proyecto_rubro_Id + " Nombre del Store Procedure: "
                    + "dbo.Apu_Proyecto_Rubro_Tecnica_ByProyecto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_Rubro_TecnicaRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Rubro_Tecnica(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Proyecto_Rubro_Id,
              fila.Imagen,
              fila.Origen_Imagen,
              fila.Definicion,
              fila.Especificacion,
              fila.Medicion,
              fila.Apu_Proyecto_Rubro_Codigo,
              fila.Path_Imagen,
              fila.Path_Origen_Imagen,
              fila.Apu_Proyecto_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Rubro_Id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Codigo,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_Id,
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
        /// Inserta el objeto en la tabla Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Proyecto_Rubro_Tecnica o)
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
                      o.Apu_Proyecto_Rubro_Id,
                      o.Imagen,
                      o.Origen_Imagen,
                      o.Definicion,
                      o.Especificacion,
                      o.Medicion,
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Tecnica))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Tecnica_Proyecto_Rubro))
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
        /// Borra el objeto de la tabla Apu_Proyecto_Rubro_Tecnica
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Proyecto_Rubro_Tecnica o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Rubro_Id,
                    o.Imagen,
                    o.Origen_Imagen,
                    o.Definicion,
                    o.Especificacion,
                    o.Medicion,
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
        //Actualiza la tabla Apu_Proyecto_Rubro_Tecnica
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Proyecto_Rubro_Tecnica o, Apu_Proyecto_Rubro_Tecnica original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Apu_Proyecto_Rubro_Id,
                    o.Imagen,
                    o.Origen_Imagen,
                    o.Definicion,
                    o.Especificacion,
                    o.Medicion,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Proyecto_Rubro_Id,
                    original.Imagen,
                    original.Origen_Imagen,
                    original.Definicion,
                    original.Especificacion,
                    original.Medicion,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Tecnica))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Rubro_Tecnica_Proyecto_Rubro))
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
