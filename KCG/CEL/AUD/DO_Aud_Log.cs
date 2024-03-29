
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.AuditoriaTableAdapters;
using AEL.AUD;
using BEL;

namespace CEL.AUD
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Auditoria 
    /// Tabla:Aud_Log
    /// </summary>
    public class DO_Aud_Log
    {
        #region Adapter
        private Aud_LogTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Aud_LogTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Aud_LogTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Aud_Log
        /// </summary> 
        /// <returns>Lista de objetos Aud_Log</returns> 
        public List<Aud_Log> Get(Scope s)
        {
            List<Aud_Log> lista = new List<Aud_Log>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_LogDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Auditoria.Aud_LogRow fila in tabla)
                    lista.Add(new Aud_Log(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Fecha,
                  fila.Accion,
                  fila.Dic_Contenedor_Id,
                  fila.Int_Sucursal_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Id,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.Procedimiento,
                  fila.Parametros,
                  fila.Datos,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Modulo_id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.int_empresa_codigo,
                  fila.int_empresa_nombre,
                  fila.Int_moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_codigo,
                  fila.seg_rol_nombre,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Per_Personal_Id,
                  fila.Per_Personal_Codigo,
                  fila.Per_Personal_Nombre,
                  fila.ver_version_codigo,
                  fila.Ver_version_Nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.Accion_Nombre,
                  fila.estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Log> GetByCodigo(Scope s, string Codigo)
        {
            List<Aud_Log> lista = new List<Aud_Log>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_LogDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Auditoria.Aud_LogRow fila in tabla)
                    lista.Add(new Aud_Log(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Fecha,
                  fila.Accion,
                  fila.Dic_Contenedor_Id,
                  fila.Int_Sucursal_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Id,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.Procedimiento,
                  fila.Parametros,
                  fila.Datos,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Modulo_id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.int_empresa_codigo,
                  fila.int_empresa_nombre,
                  fila.Int_moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_codigo,
                  fila.seg_rol_nombre,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Per_Personal_Id,
                  fila.Per_Personal_Codigo,
                  fila.Per_Personal_Nombre,
                  fila.ver_version_codigo,
                  fila.Ver_version_Nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.Accion_Nombre,
                  fila.estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Log> GetByEmpresa(Scope s, string Par_Servidor_Id, string Dic_Objeto_Id, int secuencia, string Int_Empresa_Id)
        {
            List<Aud_Log> lista = new List<Aud_Log>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_LogDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, Par_Servidor_Id, Dic_Objeto_Id, secuencia, Int_Empresa_Id);
                //Carga en la lista
                foreach (Auditoria.Aud_LogRow fila in tabla)
                    lista.Add(new Aud_Log(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Fecha,
                  fila.Accion,
                  fila.Dic_Contenedor_Id,
                  fila.Int_Sucursal_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Id,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.Procedimiento,
                  fila.Parametros,
                  fila.Datos,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Modulo_id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.int_empresa_codigo,
                  fila.int_empresa_nombre,
                  fila.Int_moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_codigo,
                  fila.seg_rol_nombre,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Per_Personal_Id,
                  fila.Per_Personal_Codigo,
                  fila.Per_Personal_Nombre,
                  fila.ver_version_codigo,
                  fila.Ver_version_Nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.Accion_Nombre,
                  fila.estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Aud_Log> GetById(Scope s, string Id)
        {
            List<Aud_Log> lista = new List<Aud_Log>();
            //Extrae los datos
            if (s != null)
            {
                Auditoria.Aud_LogDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Auditoria.Aud_LogRow fila in tabla)
                    lista.Add(new Aud_Log(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Fecha,
                  fila.Accion,
                  fila.Dic_Contenedor_Id,
                  fila.Int_Sucursal_Id,
                  fila.Seg_Rol_Id,
                  fila.Int_Usuario_Id,
                  fila.Ver_Version_Id,
                  fila.Par_Mensaje_Id,
                  fila.Procedimiento,
                  fila.Parametros,
                  fila.Datos,
                  fila.Dic_Contenedor_Codigo,
                  fila.Dic_Contenedor_Nombre,
                  fila.Dic_Modulo_id,
                  fila.Dic_Modulo_Codigo,
                  fila.Dic_Modulo_Nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_empresa_Id,
                  fila.int_empresa_codigo,
                  fila.int_empresa_nombre,
                  fila.Int_moneda_id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_codigo,
                  fila.seg_rol_nombre,
                  fila.Int_Usuario_Codigo,
                  fila.Int_Usuario_Nombre,
                  fila.Per_Personal_Id,
                  fila.Per_Personal_Codigo,
                  fila.Per_Personal_Nombre,
                  fila.ver_version_codigo,
                  fila.Ver_version_Nombre,
                  fila.par_mensaje_codigo,
                  fila.par_mensaje_nombre,
                  fila.Accion_Nombre,
                  fila.estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Aud_Log
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Aud_Log o)
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
                      o.Fecha,
                      o.Accion,
                      o.Dic_Contenedor_Id,
                      o.Int_Sucursal_Id,
                      o.Seg_Rol_Id,
                      o.Int_Usuario_Id,
                      o.Ver_Version_Id,
                      o.Par_Mensaje_Id,
                      o.Procedimiento,
                      o.Parametros,
                      o.Datos,
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
        /// Borra el objeto de la tabla Aud_Log
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Aud_Log o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Fecha,
                  o.Accion,
                  o.Dic_Contenedor_Id,
                  o.Int_Sucursal_Id,
                  o.Seg_Rol_Id,
                  o.Int_Usuario_Id,
                  o.Ver_Version_Id,
                  o.Par_Mensaje_Id,
                  o.Procedimiento,
                  o.Parametros,
                  o.Datos,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Aud_Log
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Aud_Log o, Aud_Log original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Fecha,
                  o.Accion,
                  o.Dic_Contenedor_Id,
                  o.Int_Sucursal_Id,
                  o.Seg_Rol_Id,
                  o.Int_Usuario_Id,
                  o.Ver_Version_Id,
                  o.Par_Mensaje_Id,
                  o.Procedimiento,
                  o.Parametros,
                  o.Datos,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Fecha,
                  original.Accion,
                  original.Dic_Contenedor_Id,
                  original.Int_Sucursal_Id,
                  original.Seg_Rol_Id,
                  original.Int_Usuario_Id,
                  original.Ver_Version_Id,
                  original.Par_Mensaje_Id,
                  original.Procedimiento,
                  original.Parametros,
                  original.Datos,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
