
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.SeguridadTableAdapters;
using AEL.SEG;
using BEL;

namespace CEL.SEG
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridad 
    /// Tabla:Seg_Rol_Usuario_Det
    /// </summary>
    public class DO_Seg_Rol_Usuario_Det
    {
        #region Adapter
        private Seg_Rol_Usuario_DetTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Seg_Rol_Usuario_DetTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Seg_Rol_Usuario_DetTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Seg_Rol_Usuario_Det
        /// </summary> 
        /// <returns>Lista de objetos Seg_Rol_Usuario_Det</returns> 
        public List<Seg_Rol_Usuario_Det> Get(Scope s)
        {
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Usuario_Det> GetByCodigo(Scope s, string Codigo)
        {
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Usuario_Det> GetById(Scope s, string Id)
        {
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Usuario_Det> GetBySucursalUsuario(Scope s, string Int_Sucursal_Id, string Int_Usuario_Id)
        {
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.GetBySucursalUsuario(s.Ver_Version_Id, Int_Sucursal_Id, Int_Usuario_Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Usuario_Det> GetBySucursalUsuarioRol(Scope s, string Int_Sucursal_Id, string Int_Usuario_Id, string Seg_Rol_Id)
        {
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.GetBySucursalUsuarioRol(s.Ver_Version_Id, Int_Sucursal_Id, Int_Usuario_Id, Seg_Rol_Id);
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol_Usuario_Det> GetByRolUsuario(Scope s, string Seg_Rol_Usuario_Id)
        {
            string llamada = "";
            List<Seg_Rol_Usuario_Det> lista = new List<Seg_Rol_Usuario_Det>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_Usuario_DetDataTable tabla =
                Adapter.GetByRolUsuario(s.Ver_Version_Id, Seg_Rol_Usuario_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRolUsuario" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_Usuario_Id : " + Seg_Rol_Usuario_Id + " Nombre del Store Procedure: " + "dbo.Seg_Rol_Usuario_Det_ByRolUsuario " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_Usuario_DetRow fila in tabla)
                    lista.Add(new Seg_Rol_Usuario_Det(

              fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Seg_Rol_Usuario_Id,
                  fila.Int_Sucursal_Id,
                  fila.seg_rol_usuario_codigo,
                  fila.seg_rol_usuario_nombre,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Id,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.seg_rol_id,
                  fila.seg_rol_Codigo,
                  fila.seg_rol_Nombre,
                  fila.int_usuario_id,
                  fila.int_usuario_Codigo,
                  fila.int_usuario_Nombre,
                  fila.Estado_nombre));
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
        /// Inserta el objeto en la tabla Seg_Rol_Usuario_Det
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Seg_Rol_Usuario_Det o)
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
                      o.Seg_Rol_Usuario_Id,
                      o.Int_Sucursal_Id,
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
        /// Borra el objeto de la tabla Seg_Rol_Usuario_Det
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Seg_Rol_Usuario_Det o)
        {
            int resultado = Adapter.Delete(
                  o.Id,
                  o.Codigo,
                  o.Seg_Rol_Usuario_Id,
                  o.Int_Sucursal_Id,
                  o.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Seg_Rol_Usuario_Det
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Seg_Rol_Usuario_Det o, Seg_Rol_Usuario_Det original)
        {
            int resultado;
            resultado = Adapter.Update(
                  o.Id,
                  o.Codigo,
                  o.Seg_Rol_Usuario_Id,
                  o.Int_Sucursal_Id,
                  o.Estado,
                  original.Id,
                  original.Codigo,
                  original.Seg_Rol_Usuario_Id,
                  original.Int_Sucursal_Id,
                  original.Estado);
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
