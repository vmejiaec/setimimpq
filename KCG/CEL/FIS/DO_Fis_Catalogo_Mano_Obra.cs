
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.FiscalizacionTableAdapters;
using AEL.FIS;
using BEL;
using System;


namespace CEL.FIS
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Fiscalizacion
    /// Tabla:Fis_Catalogo_Mano_Obra
    /// </summary>
    public class DO_Fis_Catalogo_Mano_Obra
    {
        #region Adapter
        private Fis_Catalogo_Mano_ObraTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Catalogo_Mano_ObraTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Catalogo_Mano_ObraTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Catalogo_Mano_Obra
        /// </summary> 
        /// <returns>Lista de objetos Fis_Catalogo_Mano_Obra</returns> 
        public List<Fis_Catalogo_Mano_Obra> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Catalogo_Mano_Obra> lista = new List<Fis_Catalogo_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_Mano_ObraDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " 
                        + " Nombre del Store Procedure: " + " Fis_Catalogo_Mano_Obra_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_Mano_ObraRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Codigo,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Fecha_Publicacion,
                        fila.Fis_Catalogo_Fecha_Creacion,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,    
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Fis_Catalogo_Categoria_Valor,
                        fila.Fis_Catalogo_CMO_Valor,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Mano_Obra> GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta,
                                                          string Apu_Categoria_Nombre, string Apu_Mano_Obra_Codigo_Desde, string Apu_Mano_Obra_Codigo_Hasta,
                                                          string Apu_Mano_Obra_Nombre, decimal Fis_Catalogo_CMO_Valor_Desde, decimal Fis_Catalogo_CMO_Valor_Hasta)
        {
            string llamada = "";
            List<Fis_Catalogo_Mano_Obra> lista = new List<Fis_Catalogo_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_Mano_ObraDataTable tabla = Adapter.GetByCatalogo(s.Ver_Version_Id, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, 
                                                                                            Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Apu_Mano_Obra_Codigo_Desde,
                                                                                            Apu_Mano_Obra_Codigo_Hasta, Apu_Mano_Obra_Nombre, Fis_Catalogo_CMO_Valor_Desde,
                                                                                            Fis_Catalogo_CMO_Valor_Hasta, s.Numero_Registros, s.Pagina_Actual);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCatalogo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id + "," 
                        + " Apu_Categoria_Codigo_Desde : " + Apu_Categoria_Codigo_Desde + "," + " Apu_Categoria_Codigo_Hasta : " + Apu_Categoria_Codigo_Hasta + "," 
                        + " Apu_Categoria_Nombre : " + Apu_Categoria_Nombre + "," + " Apu_Mano_Obra_Codigo_Desde : " + Apu_Mano_Obra_Codigo_Desde + "," 
                        + " Apu_Mano_Obra_Codigo_Hasta : " + Apu_Mano_Obra_Codigo_Hasta + "," + " Apu_Mano_Obra_Nombre : " + Apu_Mano_Obra_Nombre + "," 
                        + " Fis_Catalogo_CMO_Valor_Desde : " + Fis_Catalogo_CMO_Valor_Desde + "," + " Fis_Catalogo_CMO_Valor_Hasta : " + Fis_Catalogo_CMO_Valor_Hasta + "," 
                        + " Numero_Registros : " + s.Numero_Registros + "," + " Pagina_Actual : " + s.Pagina_Actual + " Nombre del Store Procedure: " 
                        + "dbo.Fis_Catalogo_Mano_Obra_ByCatalo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_Mano_ObraRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Codigo,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Fecha_Publicacion,
                        fila.Fis_Catalogo_Fecha_Creacion,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Fis_Catalogo_Categoria_Valor,
                        fila.Fis_Catalogo_CMO_Valor,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Mano_Obra> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Catalogo_Mano_Obra> lista = new List<Fis_Catalogo_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_Mano_ObraDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Mano_Obra_ByCodigo " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_Mano_ObraRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Codigo,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Fecha_Publicacion,
                        fila.Fis_Catalogo_Fecha_Creacion,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Fis_Catalogo_Categoria_Valor,
                        fila.Fis_Catalogo_CMO_Valor,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Mano_Obra> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Catalogo_Mano_Obra> lista = new List<Fis_Catalogo_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_Mano_ObraDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Mano_Obra_ById " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_Mano_ObraRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Codigo,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Fecha_Publicacion,
                        fila.Fis_Catalogo_Fecha_Creacion,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Fis_Catalogo_Categoria_Valor,
                        fila.Fis_Catalogo_CMO_Valor,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Mano_Obra> GetByCatalogoReporte(Scope s, string Fis_Catalogo_Id)
        {
            string llamada = "";
            List<Fis_Catalogo_Mano_Obra> lista = new List<Fis_Catalogo_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_Mano_ObraDataTable tabla = Adapter.GetByCatalogoReporte(s.Ver_Version_Id, Fis_Catalogo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCatalogoReporte" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Mano_Obra_ByCatalogoReporte " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_Mano_ObraRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Mano_Obra(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Apu_Mano_Obra_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Codigo,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Fecha_Publicacion,
                        fila.Fis_Catalogo_Fecha_Creacion,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Mano_Obra_Codigo,
                        fila.Apu_Mano_Obra_Nombre,
                        fila.Fis_Catalogo_Categoria_Valor,
                        fila.Fis_Catalogo_CMO_Valor,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, 
                                string Apu_Categoria_Nombre, string Apu_Mano_Obra_Codigo_Desde, string Apu_Mano_Obra_Codigo_Hasta,
                                string Apu_Mano_Obra_Nombre, decimal Fis_Catalogo_CMO_Valor_Desde, decimal Fis_Catalogo_CMO_Valor_Hasta)
        {
            int  resultado;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta,
                                                  Apu_Categoria_Nombre, Apu_Mano_Obra_Codigo_Desde, Apu_Mano_Obra_Codigo_Hasta, 
                                                  Apu_Mano_Obra_Nombre, Fis_Catalogo_CMO_Valor_Desde, Fis_Catalogo_CMO_Valor_Hasta,
                                                  s.Numero_Registros);            
            //Retorna el resultado
            return resultado;
        }
        #endregion
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Catalogo_Mano_Obra o)
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
                    o.Fis_Catalogo_Id,
                    o.Apu_Categoria_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Valor,
                    o.Estado,
                    o.Descripcion);
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
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Mano_Obra_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Mano_Obra_Catalogo_Mano))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }


                            eCaso = new Exception("");
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }                        
                    default:
                    eCaso = new Exception(e.Message);
                    otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
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
        /// Borra el objeto de la tabla Fis_Catalogo_Mano_Obra
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Catalogo_Mano_Obra o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Fis_Catalogo_Id,
                    o.Apu_Categoria_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Valor,
                    o.Estado,
                    o.Descripcion);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                
                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Catalogo_Mano_Obra
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Catalogo_Mano_Obra o, Fis_Catalogo_Mano_Obra original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Fis_Catalogo_Id,
                      o.Apu_Categoria_Id,
                      o.Apu_Mano_Obra_Id,
                      o.Valor,
                      o.Estado,
                      o.Descripcion,
                      original.Id,
                      original.Codigo,
                      original.Fis_Catalogo_Id,
                      original.Apu_Categoria_Id,
                      original.Apu_Mano_Obra_Id,
                      original.Valor,
                      original.Estado,
                      original.Descripcion);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Mano_Obra_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
