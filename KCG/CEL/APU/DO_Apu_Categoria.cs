
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Categoria
    /// </summary>
    public class DO_Apu_Categoria
    {
        #region Adapter

        private Apu_CategoriaTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_CategoriaTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_CategoriaTableAdapter();
                return _Adapter;
            }
        }

        #endregion
        #region Obtención de datos

        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Categoria
        /// </summary> 
        /// <returns>Lista de objetos Apu_Categoria</returns> 
        public List<Apu_Categoria> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Categoria> lista = new List<Apu_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_CategoriaDataTable tabla =
                    Adapter.Get(s.Ver_Version_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " +
                          " Nombre del Store Procedure: " + " Apu_Categoria_Get " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Categoria(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Int_Empresa_Id,
                                  fila.Costo_Diario,
                                  fila.Costo_Hora,
                                  fila.Int_Empresa_Codigo,
                                  fila.Int_Empresa_Nombre,
                                  fila.Int_Moneda_Simbolo,
                                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }

        public List<Apu_Categoria> GetByCodigo(Scope s, string codigo, string Int_Sucursal_Id)
        {
            string llamada = "";
            List<Apu_Categoria> lista = new List<Apu_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_CategoriaDataTable tabla =
                    Adapter.GetByCodigo(s.Ver_Version_Id, codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + codigo + "," +
                          " Int_Sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " +
                          "dbo.Apu_Categoria_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Categoria(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Int_Empresa_Id,
                                  fila.Costo_Diario,
                                  fila.Costo_Hora,
                                  fila.Int_Empresa_Codigo,
                                  fila.Int_Empresa_Nombre,
                                  fila.Int_Moneda_Simbolo,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Apu_Categoria> GetByEmpresa(Scope s, string Int_Sucursal_Id)
        {
            string llamada = "";
            List<Apu_Categoria> lista = new List<Apu_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_CategoriaDataTable tabla =
                    Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " +
                          s.Int_Empresa_Id + "," + " s.Int_Sucursal_Id : " + Int_Sucursal_Id +
                          " Nombre del Store Procedure: " + "dbo.Apu_Categoria_ByEmpresa " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Categoria(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Int_Empresa_Id,
                                  fila.Costo_Diario,
                                  fila.Costo_Hora,
                                  fila.Int_Empresa_Codigo,
                                  fila.Int_Empresa_Nombre,
                                  fila.Int_Moneda_Simbolo,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Apu_Categoria> GetById(Scope s, string Id, string Int_Sucursal_Id)
        {
            string llamada = "";
            List<Apu_Categoria> lista = new List<Apu_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_CategoriaDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id, Int_Sucursal_Id);

                /*try
              {
                  tabla =
                      Adapter.GetById(s.Ver_Version_Id, Id, Int_Sucursal_Id);
              }
              catch (Exception e)
              {
                  
              }*/

                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," +
                          " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + "," + " Int_Sucursal_Id : " +
                          Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Categoria_ById " +
                          " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Categoria(
                                  fila.Id,
                                  fila.Codigo,
                                  fila.Nombre,
                                  fila.Estado,
                                  fila.Int_Empresa_Id,
                                  fila.Costo_Diario,
                                  fila.Costo_Hora,
                                  fila.Int_Empresa_Codigo,
                                  fila.Int_Empresa_Nombre,
                                  fila.Int_Moneda_Simbolo,
                                  fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        public List<Apu_Categoria> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Apu_Categoria> lista = new List<Apu_Categoria>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_CategoriaDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre, s.Int_Empresa_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + "," + " Int_Sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Categoria_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_CategoriaRow fila in tabla)
                    lista.Add(new Apu_Categoria(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Int_Empresa_Id,
              fila.Costo_Diario,
              fila.Costo_Hora,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        
          public List <Apu_Categoria> GetByLikeNombreCatalogo( Scope s , string Fis_Catalogo_Id, string Apu_Categoria_Nombre)
          {
          string llamada = "";
          List <Apu_Categoria> lista= new List <Apu_Categoria> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_CategoriaDataTable tabla = 
          Adapter.GetByLikeNombreCatalogo(s.Ver_Version_Id, s.Int_Sucursal_Id, Fis_Catalogo_Id, Apu_Categoria_Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByLikeNombreCatalogo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_Sucursal_Id : " + s.Int_Sucursal_Id+ "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id+ "," + " Apu_Categoria_Nombre : " + Apu_Categoria_Nombre  + " Nombre del Store Procedure: " + "dbo.Apu_Categor_ByLikeNombreCatalogo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_CategoriaRow fila in tabla)
          lista.Add(new Apu_Categoria(          
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Int_Empresa_Id,
                        fila.Costo_Diario,
                        fila.Costo_Hora,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Estado_Nombre));
                              }
          //Realiza la auditoria
          ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Categoria
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Categoria o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            o.Int_Empresa_Id = s.Int_Empresa_Id;
            try
            {
                Adapter.Insert(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Int_Empresa_Id,
                    o.Costo_Diario,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Categoria_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Categoria_Nombre_Empresa_Id))
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
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }

        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Categoria
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Categoria o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Int_Empresa_Id,
                    o.Costo_Diario,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._FK_Apu_Mano_Obra_Apu_Categoria))
                {
                    eCaso = new System.Exception("Apu Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Mano_Obra_Apu_Categoria))
                {
                    eCaso = new System.Exception("Apu Oferta Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Categoria_Apu_Categoria))
                {
                    eCaso = new System.Exception("Apu Proyecto Categoria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Mano_Obra_Apu_Categoria))
                {
                    eCaso = new System.Exception("Apu Proyecto Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_M_Obra_Apu_Categ))
                {
                    eCaso = new System.Exception("Fis Catalogo Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_Categ_Apu_Categ))
                {
                    eCaso = new System.Exception("Fis Catalogo Categoria");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }
        //Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Categoria
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Categoria o, Apu_Categoria original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Nombre.ToUpper(),
                      o.Int_Empresa_Id,
                      o.Costo_Diario,
                      o.Estado,
                      original.Id,
                      original.Codigo,
                      original.Nombre,
                      original.Int_Empresa_Id,
                      original.Costo_Diario,
                      original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Categoria_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Categoria_Nombre_Empresa_Id))
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
