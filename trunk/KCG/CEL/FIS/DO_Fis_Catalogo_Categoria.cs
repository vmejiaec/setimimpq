
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
    /// Modulo:Fiscalizaci
    /// Tabla:Fis_Catalogo_Categoria
    /// </summary>
    public class DO_Fis_Catalogo_Categoria
    {
        #region Adapter
        private Fis_Catalogo_CategoriaTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Catalogo_CategoriaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Catalogo_CategoriaTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtenci�n de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Catalogo_Categoria
        /// </summary> 
        /// <returns>Lista de objetos Fis_Catalogo_Categoria</returns> 
        public List<Fis_Catalogo_Categoria> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_CategoriaDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: Get " + "Parametros  Enviados en el M�todo: s " + " Nombre del Store Procedure: " + " Fis_Catalogo_Categoria_Get " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_CategoriaRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Categoria(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Fis_Catalogo_Id,
                  fila.Apu_Categoria_Id,
                  fila.Valor,
                  fila.Descripcion,
                  fila.Fis_Catalogo_Nombre,
                  fila.Fis_Catalogo_Codigo,
                  fila.Apu_Categoria_Nombre,
                  fila.Apu_Categoria_Codigo,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Categoria> GetByCatalogo(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
        {
            string llamada = "";
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_CategoriaDataTable tabla =
                Adapter.GetByCatalogo(s.Ver_Version_Id, Fis_Catalogo_Id, Apu_Categoria_Codigo_Desde, Apu_Categoria_Codigo_Hasta, Apu_Categoria_Nombre, Valor_Desde, Valor_Hasta,s.Pagina_Actual,s.Numero_Registros);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCatalogo" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id + "," + " Apu_Categoria_Codigo_Desde : " + Apu_Categoria_Codigo_Desde + "," + " Apu_Categoria_Codigo_Hasta : " + Apu_Categoria_Codigo_Hasta + "," + " Apu_Categoria_Nombre : " + Apu_Categoria_Nombre + "," + " Valor_Desde : " + Valor_Desde + "," + " Valor_Hasta : " + Valor_Hasta + "," + " Pagina_Actual : " + s.Pagina_Actual + "," + " Numero_Registros : " + s.Numero_Registros + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Categoria_ByCatalogo " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_CategoriaRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Fis_Catalogo_Id,
              fila.Apu_Categoria_Id,
              fila.Valor,
              fila.Descripcion,
              fila.Fis_Catalogo_Nombre,
              fila.Fis_Catalogo_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Apu_Categoria_Codigo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Categoria> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_CategoriaDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Categoria_ByCodigo " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_CategoriaRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Fis_Catalogo_Id,
              fila.Apu_Categoria_Id,
              fila.Valor,
              fila.Descripcion,
              fila.Fis_Catalogo_Nombre,
              fila.Fis_Catalogo_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Apu_Categoria_Codigo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Categoria> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_CategoriaDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetById" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Categoria_ById " + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_CategoriaRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Fis_Catalogo_Id,
              fila.Apu_Categoria_Id,
              fila.Valor,
              fila.Descripcion,
              fila.Fis_Catalogo_Nombre,
              fila.Fis_Catalogo_Codigo,
              fila.Apu_Categoria_Nombre,
              fila.Apu_Categoria_Codigo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Catalogo_Categoria> GetByCatalogoReporte(Scope s, string Fis_Catalogo_Id)
        {
            string llamada = "";
            List<Fis_Catalogo_Categoria> lista = new List<Fis_Catalogo_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Catalogo_CategoriaDataTable tabla = Adapter.GetByCatalogoReporte(s.Ver_Version_Id, Fis_Catalogo_Id);
                //Cuenta  el n�mero  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del M�todo Utilizado: " + " GetByCatalogoReporte" + " Parametros  Enviados en el M�todo: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id 
                        + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Categoria_ByCatalogoReporte " 
                        + " N�mero de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Catalogo_CategoriaRow fila in tabla)
                    lista.Add(new Fis_Catalogo_Categoria(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Fis_Catalogo_Id,
                        fila.Apu_Categoria_Id,
                        fila.Valor,
                        fila.Descripcion,
                        fila.Fis_Catalogo_Nombre,
                        fila.Fis_Catalogo_Codigo,
                        fila.Apu_Categoria_Nombre,
                        fila.Apu_Categoria_Codigo,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Fis_Catalogo_Id, string Apu_Categoria_Codigo_Desde, string Apu_Categoria_Codigo_Hasta, string Apu_Categoria_Nombre, decimal Valor_Desde, decimal Valor_Hasta)
          {
          int  resultado;
          // Recuperar la lista de objetos a procesar
          List<Fis_Catalogo_Categoria>lista =null;
          // Ejecutar el procedimiento en bloque
          resultado = (int )Adapter.TotalPaginas(s.Ver_Version_Id,Fis_Catalogo_Id,Apu_Categoria_Codigo_Desde,Apu_Categoria_Codigo_Hasta,Apu_Categoria_Nombre,Valor_Desde,Valor_Hasta,s.Numero_Registros);
          // Construir la cadena de llamada, par�metros y respuesta del procedimiento
          string llamada = "Nombre del M�todo Utilizado: " + " GetByCatalogo" + " Parametros  Enviados en el M�todo: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id + "," + " Apu_Categoria_Codigo_Desde : " + Apu_Categoria_Codigo_Desde + "," + " Apu_Categoria_Codigo_Hasta : " + Apu_Categoria_Codigo_Hasta + "," + " Apu_Categoria_Nombre : " + Apu_Categoria_Nombre + "," + " Valor_Desde : " + Valor_Desde + "," + " Valor_Hasta : " + Valor_Hasta + "," + " Pagina_Actual : " + s.Pagina_Actual + "," + " Numero_Registros : " + s.Numero_Registros + " Nombre del Store Procedure: " + "dbo.Fis_Catalogo_Categoria_ByTotalPaginas " ;
          //Retorna el resultado
          return resultado;
          }
        #endregion
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="s">Variables de �mbito como la versi�n y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Fis_Catalogo_Categoria o)
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
                      o.Valor,
                      o.Estado,
                      o.Descripcion
                );
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
                        if (mensaje.StartsWith(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Categoria_Cod))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Categoria_Catalogo_Cat))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
        /// Borra el objeto de la tabla Fis_Catalogo_Categoria
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Fis_Catalogo_Categoria o)
        {
            int resultado = 0;

            try
            {
                resultado = Adapter.Delete(

                       o.Id,
                       o.Codigo,
                       o.Fis_Catalogo_Id,
                       o.Apu_Categoria_Id,
                       o.Valor,
                       o.Estado,
                       o.Descripcion);
            }
            catch (SqlException e)
            {
                throw (e);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Fis_Catalogo_Categoria
        /// </summary>
        /// <param name="o">Objeto que contiene la informaci�n a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Fis_Catalogo_Categoria o, Fis_Catalogo_Categoria original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

                      o.Id,
                      o.Codigo,
                      o.Fis_Catalogo_Id,
                      o.Apu_Categoria_Id,
                      o.Valor,
                      o.Estado,
                      o.Descripcion,
                      original.Id,
                      original.Codigo,
                      original.Fis_Catalogo_Id,
                      original.Apu_Categoria_Id,
                      original.Valor,
                      original.Estado,
                      original.Descripcion);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Fis_Catalogo_Categoria_Cod))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
