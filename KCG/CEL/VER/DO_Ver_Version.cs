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
    /// Tabla:Ver_Version
    /// </summary>
    public class DO_Ver_Version
    {
        #region Adapter

        private Ver_VersionTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Ver_VersionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Ver_VersionTableAdapter();
                return _Adapter;
            }
        }

        #endregion
        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Ver_Version
        /// </summary> 
        /// <returns>Lista de objetos Ver_Version</returns> 
        public List<Ver_Version> Get(Scope s)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Ver_Version> GetByCodigo(Scope s, string Codigo)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Ver_Version> GetById(Scope s, string Id)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Ver_Version> GetByMantenimiento(Scope s)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.GetByMantenimiento(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Ver_Version> GetByOnlyPredeterminada(Scope s)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.GetByOnlyPredeterminada();
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Ver_Version> GetByPredeterminadaN(Scope s)
        {
            List<Ver_Version> lista = new List<Ver_Version>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_VersionDataTable tabla =
                    Adapter.GetByPredeterminadaN(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_VersionRow fila in tabla)
                    lista.Add(new Ver_Version(
                                  fila.Id,
                                  fila.Codigo, 
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Abreviatura,
                                  fila.Predeterminada,
                                  fila.Ruta_Imagen,
                                  fila.Descripcion,
                                  fila.Predeterminada_Nombre,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        #endregion
        #region Procedimientos

        public int UpdatePredeterminadaN(Scope s)
        {
            int resultado;
            // Recuperar la lista de objetos a procesar
            List<Ver_Version> lista = GetByPredeterminadaN(s);
            // Ejecutar el procedimiento en bloque
            resultado = (int) Adapter.UpdatePredeterminadaN();

            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = string.Format("GetByPredeterminadaN.Ver_Version_Id: {0};resultado: {1}",
                                           s.Ver_Version_Id,
                                           resultado);
            // Registrar la auditoria del procedimiento
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_UPDATE);
            //Retorna el resultado
            return resultado;
        }

        public int ExisteRegistros(Scope s)
        {
            int resultado;
            // Ejecutar el procedimiento en bloque
            resultado = (int) Adapter.ExisteRegistros();

            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = string.Format("ExisteRegistros.Ver_Version_Id: {0};resultado: {1}",
                                           s.Ver_Version_Id,
                                           resultado);
            // Registrar la auditoria del procedimiento
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_UPDATE);
            //Retorna el resultado
            return resultado;
        }

        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Ver_Version
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Ver_Version o)
        {
            return VerVersion.Insert(s, o);
        }

        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Ver_Version
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Ver_Version o)
        {
            int resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Nombre,
                o.Abreviatura,
                o.Predeterminada,
                o.Ruta_Imagen,
                o.Estado,
                o.Descripcion
                );
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        } //Actualiza
        /// <summary>
        //Actualiza la tabla Ver_Version
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Ver_Version o, Ver_Version original)
        {
            int resultado;
            resultado = Adapter.Update(
                o.Id,
                o.Codigo,
                o.Nombre,
                o.Abreviatura,
                o.Predeterminada,
                o.Ruta_Imagen,
                o.Estado,
                o.Descripcion,
                original.Id,
                original.Codigo,
                original.Nombre,
                original.Abreviatura,
                original.Predeterminada,
                original.Ruta_Imagen,
                original.Estado,
                original.Descripcion
                );
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }

        #endregion
    }
}
