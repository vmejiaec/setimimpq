
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.SeguridadTableAdapters;
using AEL.SEG;
using BEL;
using System;

namespace CEL.SEG
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridad 
    /// Tabla:Seg_Rol
    /// </summary>
    public class DO_Seg_Rol
    {
        #region Adapter
        private Seg_RolTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Seg_RolTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Seg_RolTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Seg_Rol
        /// </summary> 
        /// <returns>Lista de objetos Seg_Rol</returns> 
        public List<Seg_Rol> Get(Scope s)
        {
            List<Seg_Rol> lista = new List<Seg_Rol>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_RolDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Carga en la lista
                foreach (Seguridad.Seg_RolRow fila in tabla)
                    lista.Add(new Seg_Rol(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol> GetByCodigo(Scope s, string Codigo)
        {
            List<Seg_Rol> lista = new List<Seg_Rol>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_RolDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Carga en la lista
                foreach (Seguridad.Seg_RolRow fila in tabla)
                    lista.Add(new Seg_Rol(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol> GetById(Scope s, string Id)
        {
            List<Seg_Rol> lista = new List<Seg_Rol>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_RolDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Carga en la lista
                foreach (Seguridad.Seg_RolRow fila in tabla)
                    lista.Add(new Seg_Rol(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Seg_Rol> GetByUsuarioLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Seg_Rol> lista = new List<Seg_Rol>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_RolDataTable tabla =
                Adapter.GetByUsuarioLikeNombre(s.Ver_Version_Id, s.Int_Usuario_Id, Nombre);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByUsuarioLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Usuario_Id : " + s.Int_Usuario_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Seg_Rol_ByUsuarioLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_RolRow fila in tabla)
                    lista.Add(new Seg_Rol(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Descripcion,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Seg_Rol> GetByLikeNombre(Scope s, string Nombre)
        {
            List<Seg_Rol> lista = new List<Seg_Rol>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_RolDataTable tabla =
                    Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Carga en la lista
                foreach (Seguridad.Seg_RolRow fila in tabla)
                    lista.Add(new Seg_Rol(
              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Descripcion,
              fila.Estado_Nombre));
            }
            return lista;
        }

        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Seg_Rol
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Seg_Rol o)
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
                      o.Descripcion,
                      o.Estado
               );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.Contains(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Nombre))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    //break;
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
        /// Borra el objeto de la tabla Seg_Rol
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Seg_Rol o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(

              o.Id,
              o.Codigo,
              o.Nombre,
              o.Descripcion,
              o.Estado
         );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                if (e.Message.Contains(TXT_BDD._FK_Aud_Auditoria_Seg_Rol))
                {
                    eCaso = new Exception("Aud Auditoria");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Log_Seg_Rol))
                {
                    eCaso = new Exception("Aud_Log");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Int_Usuario_Seg_Rol))
                {
                    eCaso = new Exception("Int_Usuario");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Menu_Seg_Rol))
                {
                    eCaso = new Exception("Seg_Menu");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Elemento_Seg_Rol2))
                {
                    eCaso = new Exception("Seg_Rol_Elemento");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Menu_Seg_Rol))
                {
                    eCaso = new Exception("Seg_Rol_Menu");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Objeto_Seg_Rol))
                {
                    eCaso = new Exception("Seg_Rol_Objeto");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Usuario_Seg_Rol))
                {
                    eCaso = new Exception("Seg_Rol_Usuario");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Seg_Rol
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Seg_Rol o, Seg_Rol original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

      o.Id,
      o.Codigo,
      o.Nombre,
      o.Descripcion,
      o.Estado,
      original.Id,
      original.Codigo,
      original.Nombre,
      original.Descripcion,
      original.Estado

 );
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Nombre))
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
