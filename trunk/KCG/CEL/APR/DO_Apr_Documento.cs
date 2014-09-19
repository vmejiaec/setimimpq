
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.AprobacionTableAdapters;
using AEL.APR;
using BEL;

namespace CEL.APR
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Aprobacion
    /// Tabla:Apr_Documento
    /// </summary>
    public class DO_Apr_Documento
    {
        #region Adapter
        private Apr_DocumentoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apr_DocumentoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apr_DocumentoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apr_Documento
        /// </summary> 
        /// <returns>Lista de objetos Apr_Documento</returns> 
        public List<Apr_Documento> Get(Scope s)
        {
            List<Apr_Documento> lista = new List<Apr_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Aprobacion.Apr_DocumentoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Aprobacion.Apr_DocumentoRow fila in tabla)
                    lista.Add(new Apr_Documento(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Dic_Campo_id,
                  fila.Descripcion,
                  fila.Dic_campo_Codigo,
                  fila.Dic_campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apr_Documento> GetByCodigo(Scope s, string Codigo)
        {
            List<Apr_Documento> lista = new List<Apr_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Aprobacion.Apr_DocumentoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Aprobacion.Apr_DocumentoRow fila in tabla)
                    lista.Add(new Apr_Documento(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Dic_Campo_id,
                  fila.Descripcion,
                  fila.Dic_campo_Codigo,
                  fila.Dic_campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apr_Documento> GetById(Scope s, string Id)
        {
            List<Apr_Documento> lista = new List<Apr_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Aprobacion.Apr_DocumentoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Aprobacion.Apr_DocumentoRow fila in tabla)
                    lista.Add(new Apr_Documento(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Dic_Campo_id,
                  fila.Descripcion,
                  fila.Dic_campo_Codigo,
                  fila.Dic_campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apr_Documento> GetByMantenimiento(Scope s, string ver_version_id)
        {
            List<Apr_Documento> lista = new List<Apr_Documento>();
            //Extrae los datos
            if (s != null)
            {
                Aprobacion.Apr_DocumentoDataTable tabla =
                Adapter.GetByMantenimiento(ver_version_id);
                //Carga en la lista
                foreach (Aprobacion.Apr_DocumentoRow fila in tabla)
                    lista.Add(new Apr_Documento(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Abreviatura,
                  fila.Dic_Campo_id,
                  fila.Descripcion,
                  fila.Dic_campo_Codigo,
                  fila.Dic_campo_Nombre,
                  fila.Dic_Objeto_Id,
                  fila.Dic_Objeto_codigo,
                  fila.Dic_Objeto_nombre,
                  fila.Dic_Modulo_Id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apr_Documento
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apr_Documento o)
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
                      o.Abreviatura,
                      o.Dic_Campo_id,
                      o.Estado,
                      o.Descripcion);
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
        /// Borra el objeto de la tabla Apr_Documento
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apr_Documento o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Abreviatura,
                  o.Dic_Campo_id,
                  o.Estado,
                  o.Descripcion);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Apr_Documento
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apr_Documento o, Apr_Documento original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Nombre,
                  o.Abreviatura,
                  o.Dic_Campo_id,
                  o.Estado,
                  o.Descripcion,
                  original.Id,
                  original.Codigo,
                  original.Nombre,
                  original.Abreviatura,
                  original.Dic_Campo_id,
                  original.Estado,
                  original.Descripcion);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
