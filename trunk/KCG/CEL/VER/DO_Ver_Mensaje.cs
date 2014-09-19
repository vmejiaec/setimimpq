
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.VersionTableAdapters;
using AEL.VER;
using BEL;

namespace CEL.VER
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Version ta
    /// Tabla:Ver_Mensaje
    /// </summary>
    public class DO_Ver_Mensaje
    {
        #region Adapter
        private Ver_MensajeTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Ver_MensajeTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Ver_MensajeTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Ver_Mensaje
        /// </summary> 
        /// <returns>Lista de objetos Ver_Mensaje</returns> 
        public List<Ver_Mensaje> Get(Scope s)
        {
            List<Ver_Mensaje> lista = new List<Ver_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_MensajeDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_MensajeRow fila in tabla)
                    lista.Add(new Ver_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.par_mensaje_codigo_mensaje,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Mensaje> GetByCodigo(Scope s, string Codigo)
        {
            List<Ver_Mensaje> lista = new List<Ver_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_MensajeDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Version.Ver_MensajeRow fila in tabla)
                    lista.Add(new Ver_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.par_mensaje_codigo_mensaje,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Mensaje> GetById(Scope s, string Id)
        {
            List<Ver_Mensaje> lista = new List<Ver_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_MensajeDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Version.Ver_MensajeRow fila in tabla)
                    lista.Add(new Ver_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.par_mensaje_codigo_mensaje,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Ver_Mensaje
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Ver_Mensaje o)
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
                      o.Ver_Version_Id,
                      o.Par_Mensaje_Id,
                      o.Estado);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                            throw;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Ver_Mensaje
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Ver_Mensaje o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_Id,
                  o.Par_Mensaje_Id,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Ver_Mensaje
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Ver_Mensaje o, Ver_Mensaje original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_Id,
                  o.Par_Mensaje_Id,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Ver_Version_Id,
                  original.Par_Mensaje_Id,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
