
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
    /// Tabla:Ver_Dominio
    /// </summary>
    public class DO_Ver_Dominio
    {
        #region Adapter
        private Ver_DominioTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Ver_DominioTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Ver_DominioTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Ver_Dominio
        /// </summary> 
        /// <returns>Lista de objetos Ver_Dominio</returns> 
        public List<Ver_Dominio> Get(Scope s)
        {
            List<Ver_Dominio> lista = new List<Ver_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_DominioDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Version.Ver_DominioRow fila in tabla)
                    lista.Add(new Ver_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_id,
                  fila.Dic_Dominio_id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.dic_dominio_codigo,
                  fila.dic_dominio_nombre,
                  fila.Dic_Dominio_Dominio,
                  fila.Dic_campo_id,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Estado_Nombre,
                  fila.Dic_objeto_id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Dominio> GetByCampo(Scope s, string Dic_Campo_Id)
        {
            List<Ver_Dominio> lista = new List<Ver_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_DominioDataTable tabla =
                Adapter.GetByCampo(s.Ver_Version_Id, Dic_Campo_Id);
                //Carga en la lista
                foreach (Version.Ver_DominioRow fila in tabla)
                    lista.Add(new Ver_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_id,
                  fila.Dic_Dominio_id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.dic_dominio_codigo,
                  fila.dic_dominio_nombre,
                  fila.Dic_Dominio_Dominio,
                  fila.Dic_campo_id,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Estado_Nombre,
                  fila.Dic_objeto_id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Dominio> GetByCodigo(Scope s, string Codigo)
        {
            List<Ver_Dominio> lista = new List<Ver_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_DominioDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Version.Ver_DominioRow fila in tabla)
                    lista.Add(new Ver_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_id,
                  fila.Dic_Dominio_id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.dic_dominio_codigo,
                  fila.dic_dominio_nombre,
                  fila.Dic_Dominio_Dominio,
                  fila.Dic_campo_id,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Estado_Nombre,
                  fila.Dic_objeto_id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Dominio> GetById(Scope s, string Id)
        {
            List<Ver_Dominio> lista = new List<Ver_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_DominioDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Version.Ver_DominioRow fila in tabla)
                    lista.Add(new Ver_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_id,
                  fila.Dic_Dominio_id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.dic_dominio_codigo,
                  fila.dic_dominio_nombre,
                  fila.Dic_Dominio_Dominio,
                  fila.Dic_campo_id,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Estado_Nombre,
                  fila.Dic_objeto_id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Ver_Dominio> GetByObjetoCampo(Scope s, string Dic_Objeto_Nombre, string Dic_Campo_Nombre)
        {
            List<Ver_Dominio> lista = new List<Ver_Dominio>();
            //Extrae los datos
            if (s != null)
            {
                Version.Ver_DominioDataTable tabla =
                Adapter.GetByObjetoCampo(s.Ver_Version_Id, Dic_Objeto_Nombre, Dic_Campo_Nombre);
                //Carga en la lista
                foreach (Version.Ver_DominioRow fila in tabla)
                    lista.Add(new Ver_Dominio(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Ver_Version_id,
                  fila.Dic_Dominio_id,
                  fila.ver_version_codigo,
                  fila.ver_version_nombre,
                  fila.dic_dominio_codigo,
                  fila.dic_dominio_nombre,
                  fila.Dic_Dominio_Dominio,
                  fila.Dic_campo_id,
                  fila.Dic_Campo_Codigo,
                  fila.Dic_Campo_Nombre,
                  fila.Estado_Nombre,
                  fila.Dic_objeto_id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Ver_Dominio
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Ver_Dominio o)
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
                      o.Ver_Version_id,
                      o.Dic_Dominio_id,
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
        /// Borra el objeto de la tabla Ver_Dominio
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Ver_Dominio o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_id,
                  o.Dic_Dominio_id,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Ver_Dominio
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Ver_Dominio o, Ver_Dominio original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Ver_Version_id,
                  o.Dic_Dominio_id,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Ver_Version_id,
                  original.Dic_Dominio_id,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
