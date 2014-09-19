
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
    /// Tabla:Ver_Etiqueta
    /// </summary>
    public class DO_Ver_Etiqueta
    {
        #region Adapter
        private Ver_EtiquetaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Ver_EtiquetaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Ver_EtiquetaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Ver_Etiqueta
        /// </summary> 
        /// <returns>Lista de objetos Ver_Etiqueta</returns> 
        public List<Ver_Etiqueta> Get(Scope s)
        {
            List<Ver_Etiqueta> lista = new List<Ver_Etiqueta>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_EtiquetaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_EtiquetaRow fila in tabla)
                    lista.Add(new Ver_Etiqueta(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Imagen_Activa,
                  fila.Imagen_Desactiva,
                  fila.Ver_Version_Codigo,
                  fila.Ver_Version_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Etiqueta> GetByCodigo(Scope s, string Codigo)
        {
            List<Ver_Etiqueta> lista = new List<Ver_Etiqueta>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_EtiquetaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Version.Ver_EtiquetaRow fila in tabla)
                    lista.Add(new Ver_Etiqueta(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Imagen_Activa,
                  fila.Imagen_Desactiva,
                  fila.Ver_Version_Codigo,
                  fila.Ver_Version_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Etiqueta> GetById(Scope s, string Id)
        {
            List<Ver_Etiqueta> lista = new List<Ver_Etiqueta>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_EtiquetaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Version.Ver_EtiquetaRow fila in tabla)
                    lista.Add(new Ver_Etiqueta(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_Id,
                  fila.Dic_Rotulo_Id,
                  fila.Imagen_Activa,
                  fila.Imagen_Desactiva,
                  fila.Ver_Version_Codigo,
                  fila.Ver_Version_Nombre,
                  fila.Dic_Rotulo_Codigo,
                  fila.Dic_Rotulo_nombre,
                  fila.estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Ver_Etiqueta
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Ver_Etiqueta o)
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
                      o.Dic_Rotulo_Id,
                      o.Imagen_Activa,
                      o.Imagen_Desactiva,
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
        /// Borra el objeto de la tabla Ver_Etiqueta
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Ver_Etiqueta o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_Id,
                  o.Dic_Rotulo_Id,
                  o.Imagen_Activa,
                  o.Imagen_Desactiva,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Ver_Etiqueta
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Ver_Etiqueta o, Ver_Etiqueta original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_Id,
                  o.Dic_Rotulo_Id,
                  o.Imagen_Activa,
                  o.Imagen_Desactiva,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Ver_Version_Id,
                  original.Dic_Rotulo_Id,
                  original.Imagen_Activa,
                  original.Imagen_Desactiva,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
