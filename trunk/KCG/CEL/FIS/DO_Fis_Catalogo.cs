using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.FiscalizacionTableAdapters;
using AEL.FIS;
using BEL;

namespace CEL.FIS
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Fiscalizaci
    /// Tabla:Fis_Catalogo
    /// </summary>
    public class DO_Fis_Catalogo
    {
        #region Adapter
        private Fis_CatalogoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_CatalogoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_CatalogoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtenci�n de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Catalogo
        /// </summary> 
        /// <returns>Lista de objetos Fis_Catalogo</returns> 
        public List<Fis_Catalogo> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_CatalogoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: Get " + "Parametros  Enviados en el M�todo: s " + " Nombre del Store Procedure: " + " Fis_Catalogo_Get " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_CatalogoRow fila in tabla)
                    lista.Add(new Fis_Catalogo(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Int_Empresa_Id,
                              fila.Fecha_Creacion,
                              fila.Creacion_Per_Personal_Id,
                              fila.Fecha_Publicacion,
                              fila.Int_Empresa_Codigo,
                              fila.Int_Empresa_Nombre,
                              fila.Creacion_Per_Personal_Codigo,
                              fila.Creacion_Per_Personal_Nombre,
                              fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_CatalogoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_ByCodigo " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_CatalogoRow fila in tabla)
                    lista.Add(new Fis_Catalogo(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Int_Empresa_Id,
                              fila.Fecha_Creacion,
                              fila.Creacion_Per_Personal_Id,
                              fila.Fecha_Publicacion,
                              fila.Int_Empresa_Codigo,
                              fila.Int_Empresa_Nombre,
                              fila.Creacion_Per_Personal_Codigo,
                              fila.Creacion_Per_Personal_Nombre,
                              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo> GetByEmpresa(Scope s,DateTime Fecha_Creacion_Desde ,DateTime Fecha_Creacion_Hasta ,DateTime Fecha_Publicacion_Desde , DateTime Fecha_Publicacion_Hasta , string Nombre  )
        {
            string llamada = "";
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_CatalogoDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id,Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Fecha_Publicacion_Desde,Fecha_Publicacion_Hasta,Nombre,s.Pagina_Actual,s.Numero_Registros);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + " Fecha_Creacion_Desde : " + Fecha_Creacion_Desde + "," + " Fecha_Creacion_Hasta : " + Fecha_Creacion_Hasta + "," + " Fecha_Publicacion_Desde : " + Fecha_Publicacion_Desde + "," + " Fecha_Publicacion_Hasta : " + Fecha_Publicacion_Hasta + "," + " Nombre : " + Nombre + "," + " Pagina_Actual : " + s.Pagina_Actual + "," + " Numero_Registros : " + s.Numero_Registros + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_ByEmpresa " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_CatalogoRow fila in tabla)
                    lista.Add(new Fis_Catalogo(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Int_Empresa_Id,
                              fila.Fecha_Creacion,
                              fila.Creacion_Per_Personal_Id,
                              fila.Fecha_Publicacion,
                              fila.Int_Empresa_Codigo,
                              fila.Int_Empresa_Nombre,
                              fila.Creacion_Per_Personal_Codigo,
                              fila.Creacion_Per_Personal_Nombre,
                              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_CatalogoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetById" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_ById " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_CatalogoRow fila in tabla)
                    lista.Add(new Fis_Catalogo(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Int_Empresa_Id,
                              fila.Fecha_Creacion,
                              fila.Creacion_Per_Personal_Id,
                              fila.Fecha_Publicacion,
                              fila.Int_Empresa_Codigo,
                              fila.Int_Empresa_Nombre,
                              fila.Creacion_Per_Personal_Codigo,
                              fila.Creacion_Per_Personal_Nombre,
                              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Fis_Catalogo> lista = new List<Fis_Catalogo>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_CatalogoDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Nombre : " + Nombre + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_ByLikeNombre " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_CatalogoRow fila in tabla)
                    lista.Add(new Fis_Catalogo(
                              fila.Id,
                              fila.Codigo,
                              fila.Nombre,
                              fila.Estado,
                              fila.Descripcion,
                              fila.Int_Empresa_Id,
                              fila.Fecha_Creacion,
                              fila.Creacion_Per_Personal_Id,
                              fila.Fecha_Publicacion,
                              fila.Int_Empresa_Codigo,
                              fila.Int_Empresa_Nombre,
                              fila.Creacion_Per_Personal_Codigo,
                              fila.Creacion_Per_Personal_Nombre,
                              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, DateTime Fecha_Creacion_Desde, DateTime Fecha_Creacion_Hasta, DateTime Fecha_Publicacion_Desde, DateTime Fecha_Publicacion_Hasta, string Nombre)
          {
          int  resultado;
          // Recuperar la lista de objetos a procesar
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.TotalPaginas(s.Ver_Version_Id,s.Int_Empresa_Id,Fecha_Creacion_Desde,Fecha_Creacion_Hasta,Fecha_Publicacion_Desde,Fecha_Publicacion_Hasta,Nombre,s.Numero_Registros);
          // Construir la cadena de llamada, par�metros y respuesta del procedimiento
          string llamada = "TotalPaginas.Ver_Version_Id: " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "  Fecha_Creacion_Desde: " + Fecha_Creacion_Desde + "  Fecha_Creacion_Hasta: " + Fecha_Creacion_Hasta + "  Fecha_Publicacion_Desde: " + Fecha_Publicacion_Desde + "  Fecha_Publicacion_Desde: " + Fecha_Publicacion_Hasta + "," + " Nombre : " + Nombre + " Numero_Registros:  " + s.Numero_Registros + "," + "Nombre del SP: " + " dbo.Fis_Catalogo_ByTotalPaginas " + "," + " resultado: " + resultado;
          
          return resultado;
          }
        #endregion
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Fis_Catalogo
        /// </summary>
        /// <param name="s">Variables de �mbito como la versi�n y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Catalogo o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Creacion = DateTime.Today;
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Int_Empresa_Id,
                      o.Fecha_Creacion,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Publicacion,
                      o.Nombre);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                switch (e.Number)
                {
                    // Si el error es de violaci�n PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Fis_Catalogo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Catalogo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                       o.Id,
                       o.Codigo,
                       o.Estado,
                       o.Descripcion,
                       o.Int_Empresa_Id,
                       o.Fecha_Creacion,
                       o.Creacion_Per_Personal_Id,
                       o.Fecha_Publicacion,
                       o.Nombre );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_Indice_Fis_Ctgo))
                {
                    eCaso = new System.Exception("Fis Catalogo Indice");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_Categ_Fis_Catal))
                {
                    eCaso = new System.Exception("Fis Catalogo Categoria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Catalogo
        /// </summary>
        /// <param name="o">Objeto que contiene la informaci�n a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Catalogo o, Fis_Catalogo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Estado,
                      o.Descripcion,
                      o.Int_Empresa_Id,
                      o.Fecha_Creacion,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Publicacion,
                      o.Nombre,
                      original.Id,
                      original.Codigo,
                      original.Estado,
                      original.Descripcion,
                      original.Int_Empresa_Id,
                      original.Fecha_Creacion,
                      original.Creacion_Per_Personal_Id,
                      original.Fecha_Publicacion,
                      original.Nombre);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
