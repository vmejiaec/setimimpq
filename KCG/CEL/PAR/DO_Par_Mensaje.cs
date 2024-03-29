
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ParametrosTableAdapters;
using AEL.PAR;
using BEL;

namespace CEL.PAR
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Mensaje
    /// </summary>
    public class DO_Par_Mensaje
    {
        #region Adapter
        private Par_MensajeTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Par_MensajeTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Par_MensajeTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Par_Mensaje
        /// </summary> 
        /// <returns>Lista de objetos Par_Mensaje</returns> 
        public List<Par_Mensaje> Get(Scope s)
        {
            List<Par_Mensaje> lista = new List<Par_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_MensajeDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Parametros.Par_MensajeRow fila in tabla)
                    lista.Add(new Par_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Codigo_Mensaje,
                  fila.Tipo,
                  fila.Tipo_Nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Mensaje> GetByCodigo(Scope s, string Codigo)
        {
            List<Par_Mensaje> lista = new List<Par_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_MensajeDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Parametros.Par_MensajeRow fila in tabla)
                    lista.Add(new Par_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Codigo_Mensaje,
                  fila.Tipo,
                  fila.Tipo_Nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Mensaje> GetById(Scope s, string Id)
        {
            List<Par_Mensaje> lista = new List<Par_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_MensajeDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Parametros.Par_MensajeRow fila in tabla)
                    lista.Add(new Par_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Codigo_Mensaje,
                  fila.Tipo,
                  fila.Tipo_Nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Par_Mensaje> GetByMantenimiento(Scope s)
        {
            List<Par_Mensaje> lista = new List<Par_Mensaje>();
            //Extrae los datos
            if (s != null)
            {
                Parametros.Par_MensajeDataTable tabla =
                Adapter.GetByMantenimiento(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Parametros.Par_MensajeRow fila in tabla)
                    lista.Add(new Par_Mensaje(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Codigo_Mensaje,
                  fila.Tipo,
                  fila.Tipo_Nombre,
                  fila.Estado_Nombre,
                  fila.Ver_etiqueta_nombre,
                  fila.Tool_Ver_etiqueta_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Par_Mensaje
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Par_Mensaje o)
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
                      o.Codigo_Mensaje,
                      o.Nombre,
                      o.Tipo,
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
        /// Borra el objeto de la tabla Par_Mensaje
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Par_Mensaje o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Codigo_Mensaje,
                  o.Nombre,
                  o.Tipo,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Par_Mensaje
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Par_Mensaje o, Par_Mensaje original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Codigo_Mensaje,
                  o.Nombre,
                  o.Tipo,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Codigo_Mensaje,
                  original.Nombre,
                  original.Tipo,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
