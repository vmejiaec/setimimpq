
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
    /// Tabla:Par_Servidor_Det
    /// </summary>
    public class DO_Par_Servidor_Det
    {
    #region Adapter
    private Par_Servidor_DetTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_Servidor_DetTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_Servidor_DetTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Servidor_Det
    /// </summary> 
    /// <returns>Lista de objetos Par_Servidor_Det</returns> 
    public List <Par_Servidor_Det> Get ( Scope s )
    {
    List <Par_Servidor_Det> lista= new List <Par_Servidor_Det> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Servidor_DetDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Parametros.Par_Servidor_DetRow fila in tabla)
      lista.Add(new Par_Servidor_Det(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Par_Servidor_Id,
    fila.Dic_Contenedor_Id,
    fila.Referencia,
    fila.Estado_Nombre,
    fila.par_servidor_codigo,
    fila.par_servidor_nombre,
    fila.dic_contenedor_codigo,
    fila.dic_contenedor_nombre,
    fila.Dic_Modulo_id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Servidor_Det> GetByCodigo( Scope s , string Codigo)
      {
      List <Par_Servidor_Det> lista= new List <Par_Servidor_Det> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Servidor_DetDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Parametros.Par_Servidor_DetRow fila in tabla)
      lista.Add(new Par_Servidor_Det(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Par_Servidor_Id,
    fila.Dic_Contenedor_Id,
    fila.Referencia,
    fila.Estado_Nombre,
    fila.par_servidor_codigo,
    fila.par_servidor_nombre,
    fila.dic_contenedor_codigo,
    fila.dic_contenedor_nombre,
    fila.Dic_Modulo_id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Servidor_Det> GetByContenedor( Scope s , string dic_contenedor_id)
      {
      List <Par_Servidor_Det> lista= new List <Par_Servidor_Det> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Servidor_DetDataTable tabla = 
      Adapter.GetByContenedor(s.Ver_Version_Id, dic_contenedor_id);
      //Carga en la lista
      foreach (Parametros.Par_Servidor_DetRow fila in tabla)
      lista.Add(new Par_Servidor_Det(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Par_Servidor_Id,
    fila.Dic_Contenedor_Id,
    fila.Referencia,
    fila.Estado_Nombre,
    fila.par_servidor_codigo,
    fila.par_servidor_nombre,
    fila.dic_contenedor_codigo,
    fila.dic_contenedor_nombre,
    fila.Dic_Modulo_id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Servidor_Det> GetById( Scope s , string Id)
      {
      List <Par_Servidor_Det> lista= new List <Par_Servidor_Det> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Servidor_DetDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Parametros.Par_Servidor_DetRow fila in tabla)
      lista.Add(new Par_Servidor_Det(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Par_Servidor_Id,
    fila.Dic_Contenedor_Id,
    fila.Referencia,
    fila.Estado_Nombre,
    fila.par_servidor_codigo,
    fila.par_servidor_nombre,
    fila.dic_contenedor_codigo,
    fila.dic_contenedor_nombre,
    fila.Dic_Modulo_id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Par_Servidor_Det> GetByReferencia( Scope s , string Referencia)
      {
      List <Par_Servidor_Det> lista= new List <Par_Servidor_Det> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Servidor_DetDataTable tabla = 
      Adapter.GetByReferencia(s.Ver_Version_Id, Referencia);
      //Carga en la lista
      foreach (Parametros.Par_Servidor_DetRow fila in tabla)
      lista.Add(new Par_Servidor_Det(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Par_Servidor_Id,
    fila.Dic_Contenedor_Id,
    fila.Referencia,
    fila.Estado_Nombre,
    fila.par_servidor_codigo,
    fila.par_servidor_nombre,
    fila.dic_contenedor_codigo,
    fila.dic_contenedor_nombre,
    fila.Dic_Modulo_id,
    fila.Dic_Modulo_Codigo,
    fila.Dic_Modulo_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    #region Operaciones con datos
    
    //Inserta
    /// <summary>
    /// Inserta el objeto en la tabla Par_Servidor_Det
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Par_Servidor_Det o)
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
              o.Par_Servidor_Id,
              o.Dic_Contenedor_Id,
              o.Referencia,
              o.Estado
        );
    }
    catch (SqlException e)
    {
        //switch (e.Number)
        //{
        //    // Si el error es de violación PK, entonces repite.
        //    case 2627:
        //        string mensaje = e.Errors[0].Message;
        //        if (mensaje.StartsWith(
        //        Textos._ERR_VIOLATION_UNIQUE_KEY)
        //        )
        //            return Insert(s, o);
        //        else
        //            throw;
        //        break;
        //    default:
        //        throw;
        //}

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
                    if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Det_Codigo))
                    {
                        eCaso = new Exception("");
                        otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                        throw (otroEX);
                    }
                    if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Det))
                    {
                        eCaso = new Exception("");
                        otroEX = new Exception(TXT_Mensajes._MSJ86, eCaso);
                        throw (otroEX);
                    }

                    eCaso = new Exception(e.Message);
                    otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                    throw (otroEX);
                }
            //break;

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
    /// Borra el objeto de la tabla Par_Servidor_Det
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Par_Servidor_Det o)
    {
        int resultado;

        try
        {
            resultado = Adapter.Delete(
              o.Id,
              o.Codigo,
              o.Par_Servidor_Id,
              o.Dic_Contenedor_Id,
              o.Referencia,
              o.Estado);
        }
        catch (SqlException e)
        {
            Exception eCaso;
            Exception otroEX;

            eCaso = new Exception(e.Message);
            otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
            throw (otroEX);
        }

    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
    return resultado;
    }//Actualiza
    /// <summary>
    //Actualiza la tabla Par_Servidor_Det
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Par_Servidor_Det o, Par_Servidor_Det original)
    {
            int resultado = 0;
            try
            {

                resultado = Adapter.Update(
                      o.Id,
                      o.Codigo,
                      o.Par_Servidor_Id,
                      o.Dic_Contenedor_Id,
                      o.Referencia,
                      o.Estado,
                      original.Id,
                      original.Codigo,
                      original.Par_Servidor_Id,
                      original.Dic_Contenedor_Id,
                      original.Referencia,
                      original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:

                        if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Det_Codigo))
                        {
                            eCaso = new Exception("");
                            otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
                            throw (otroEX);
                        }
                        if (e.Message.Contains(TXT_BDD._IX_Par_Servidor_Det))
                        {
                            eCaso = new Exception("");
                            otroEX = new Exception(TXT_Mensajes._MSJ86, eCaso);
                            throw (otroEX);
                        }

                        eCaso = new Exception(e.Message);
                        otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);

                    //break;

                    default:
                        eCaso = new Exception(e.Message);
                        otroEX = new Exception(TXT_Mensajes._MSJ34, eCaso);
                        throw (otroEX);
                }
            }
    ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
    return resultado;
    }
    #endregion
    }
    }
