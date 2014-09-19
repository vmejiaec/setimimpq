
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ParametrosTableAdapters;
    using AEL.PAR;
    using BEL;
using System;
    
    namespace CEL.PAR
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Servidor
    /// </summary>
    public class DO_Par_Servidor
    {
    #region Adapter
    private Par_ServidorTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_ServidorTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_ServidorTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Servidor
    /// </summary> 
    /// <returns>Lista de objetos Par_Servidor</returns> 
    public List <Par_Servidor> Get ( Scope s )
    {
    string llamada = "";
    List <Par_Servidor> lista= new List <Par_Servidor> ();
    //Extrae los datos
    if(s != null)
    {
    Parametros.Par_ServidorDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Par_Servidor_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Parametros.Par_ServidorRow fila in tabla)
      lista.Add(new Par_Servidor(
      
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Descripcion,
    fila.Ruta,
    fila.estado_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Servidor> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Par_Servidor> lista= new List <Par_Servidor> ();
          //Extrae los datos
          if(s != null)
          {
          Parametros.Par_ServidorDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Par_Servidor_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Parametros.Par_ServidorRow fila in tabla)
          lista.Add(new Par_Servidor(
          
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Descripcion,
    fila.Ruta,
    fila.estado_nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
          public List <Par_Servidor> GetById( Scope s , string Id)
          {
          string llamada = "";
          List <Par_Servidor> lista= new List <Par_Servidor> ();
          //Extrae los datos
          if(s != null)
          {
          Parametros.Par_ServidorDataTable tabla = 
          Adapter.GetById(s.Ver_Version_Id, Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Par_Servidor_ById " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Parametros.Par_ServidorRow fila in tabla)
          lista.Add(new Par_Servidor(
          
    fila.Id,
    fila.Codigo, 
    fila.Nombre,
    fila.Estado,
    fila.Descripcion,
    fila.Ruta,
    fila.estado_nombre));
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
    /// Inserta el objeto en la tabla Par_Servidor
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
        public string Insert(Scope s, Par_Servidor o)
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
                      o.Ruta,
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
                            if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Nombre))
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
    /// Borra el objeto de la tabla Par_Servidor
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Par_Servidor o)
    {
        int resultado;

        try
        {
            resultado = Adapter.Delete(
              o.Id,
              o.Codigo,
              o.Nombre,
              o.Descripcion,
              o.Ruta,
              o.Estado
            );
        }
        catch (SqlException e)
        {
            Exception eCaso;
            Exception otroEX;

            if (e.Message.Contains(TXT_BDD._FK_Par_Servidor_Det_Par_Servidor))
            {
                eCaso = new Exception("Par Servidor Det");
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
    //Actualiza la tabla Par_Servidor
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
        public int Update(Scope s, Par_Servidor o, Par_Servidor original)
        {
            int resultado;
            try
            {
                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Nombre,
                      o.Descripcion,
                      o.Ruta,
                      o.Estado,
                      original.Id,
                      original.Codigo,
                      original.Nombre,
                      original.Descripcion,
                      original.Ruta,
                      original.Estado
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

                        if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Codigo))
                        {
                            eCaso = new System.Exception("");
                            otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                            throw (otroEX);
                        }
                        if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Nombre))
                        {
                            eCaso = new System.Exception("");
                            otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                            throw (otroEX);
                        }
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);

                    // break;

                    default:
                        eCaso = new System.Exception(e.Message);
                        otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
    #endregion
    }
    }
