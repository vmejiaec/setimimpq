
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.InterfaceTableAdapters;
    using AEL.INT;
    using BEL;
using System;
    
    namespace CEL.INT
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Interface 
    /// Tabla:Int_Sucursal
    /// </summary>
    public class DO_Int_Sucursal
    {
    #region Adapter
    private Int_SucursalTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Int_SucursalTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Int_SucursalTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Int_Sucursal
    /// </summary> 
    /// <returns>Lista de objetos Int_Sucursal</returns> 
    public List <Int_Sucursal> Get ( Scope s )
    {
    List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetByCodigo( Scope s , string Codigo)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetByEmpresa( Scope s , string Int_Empresa_Id)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetByEmpresa(s.Ver_Version_Id, Int_Empresa_Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List<Int_Sucursal> GetByEmpresaUsuario(Scope s, string Int_Empresa_Id, string Int_Usuario_Id)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetByEmpresaUsuario(s.Ver_Version_Id, Int_Empresa_Id, Int_Usuario_Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetById( Scope s , string Id)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetByIdUsuario( Scope s ,string Id, string Int_Usuario_Id)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetByIdUsuario(s.Ver_Version_Id,Id, Int_Usuario_Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetByMantenimiento( Scope s , string int_empresa_id)
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetByMantenimiento(s.Ver_Version_Id, int_empresa_id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
    public List <Int_Sucursal> GetOnlyPredeterminada( Scope s )
      {
      List <Int_Sucursal> lista= new List <Int_Sucursal> ();
      //Extrae los datos
      if(s != null)
      {
      Interface .Int_SucursalDataTable tabla = 
      Adapter.GetOnlyPredeterminada(s.Ver_Version_Id);
      //Carga en la lista
      foreach (Interface .Int_SucursalRow fila in tabla)
      lista.Add(new Int_Sucursal(

    fila.Id,
    fila.Codigo,
    fila.Nombre,
    fila.Estado,
    fila.Abreviatura,
    fila.Numero,
    fila.Predeterminada,
    fila.Int_Empresa_Id,
    fila.Int_Moneda_Id,
    fila.Descripcion,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Int_Empresa_Imagen,
    fila.Int_Moneda_Codigo,
    fila.Int_Moneda_Nombre,
    fila.Estado_Nombre,
    fila.Int_Empresa_Abreviatura));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Int_Sucursal> GetByLikeEmpresa(Scope s, string Int_Empresa_Id)
        {
            string llamada = "";
            List<Int_Sucursal> lista = new List<Int_Sucursal>();
            //Extrae los datos
            if (s != null)
            {
                Interface.Int_SucursalDataTable tabla =
                    Adapter.GetByLikeEmpresa(s.Ver_Version_Id, Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeEmpresa" + " Parametros  Enviados en el Método: " +
                          "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + Int_Empresa_Id +
                          " Nombre del Store Procedure: " + "dbo.Int_Sucursal_ByLikeEmpresa " + " Número de Registros: " +
                          numeroRegistros;
                //Carga en la lista
                foreach (Interface.Int_SucursalRow fila in tabla)
                    lista.Add(new Int_Sucursal(
                    fila.Id,
                    fila.Codigo,
                    fila.Nombre,
                    fila.Estado,
                    fila.Abreviatura,
                    fila.Numero,
                    fila.Predeterminada,
                    fila.Int_Empresa_Id,
                    fila.Int_Moneda_Id,
                    fila.Descripcion,
                    fila.Int_empresa_Codigo,
                    fila.Int_Empresa_nombre,
                    fila.Int_Empresa_Imagen,
                    fila.Int_Moneda_Codigo,
                    fila.Int_Moneda_Nombre,
                    fila.Estado_Nombre,
                    fila.Int_Empresa_Abreviatura));
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
        /// Inserta el objeto en la tabla Int_Sucursal
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Int_Sucursal o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            o.Predeterminada = "N";
            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Nombre,
                      o.Abreviatura,
                      o.Numero,
                      o.Predeterminada,
                      o.Int_Empresa_Id,
                      o.Int_Moneda_Id,
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
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.Contains(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Int_Sucursal_Codigo))
                            {
                                eCaso = new Exception("");
                                otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            eCaso = new Exception(e.Message);
                            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
                    // break;

                    default:
                        eCaso = new Exception(e.Message);
                        otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
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
        /// Borra el objeto de la tabla Int_Sucursal
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Int_Sucursal o)
        {
            int resultado = 0;

            try
            {
                resultado = Adapter.Delete(
                              o.Id,
                              o.Codigo,
                              o.Nombre,
                              o.Abreviatura,
                              o.Numero,
                              o.Predeterminada,
                              o.Int_Empresa_Id,
                              o.Int_Moneda_Id,
                              o.Estado,
                              o.Descripcion
                            );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Aud_Log_Int_Sucursal))
                {
                    eCaso = new Exception("Aud Log");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Par_Auditoria_Int_Sucursal))
                {
                    eCaso = new Exception("Aud Par Auditoria");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Aud_Par_Log_Int_Sucursal))
                {
                    eCaso = new Exception("Aud Par Log");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Int_Usuario_Int_Sucursal))
                {
                    eCaso = new Exception("Int Usuario");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Inv_Accion_Int_Sucursal))
                {
                    eCaso = new Exception("Inv Accion");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Inv_Emisor_Int_Sucursal))
                {
                    eCaso = new Exception("Inv Emisor");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Seg_Rol_Usuario_Det_Int_Sucursal))
                {
                    eCaso = new Exception("Seg Rol Usuario Det");
                    otroEX = new Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Int_Sucursal
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Int_Sucursal o, Int_Sucursal original)
        {
            int resultado;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Nombre,
                      o.Abreviatura,
                      o.Numero,
                      o.Predeterminada,
                      o.Int_Empresa_Id,
                      o.Int_Moneda_Id,
                      o.Estado,
                      o.Descripcion,
                      original.Id,
                      original.Codigo,
                      original.Nombre,
                      original.Abreviatura,
                      original.Numero,
                      original.Predeterminada,
                      original.Int_Empresa_Id,
                      original.Int_Moneda_Id,
                      original.Estado,
                      original.Descripcion);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Int_Sucursal_Codigo))
                {
                    eCaso = new Exception("");
                    otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                eCaso = new Exception(e.Message);
                otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
    #endregion
    }
    }
