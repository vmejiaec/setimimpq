
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ApuTableAdapters;
    using AEL.APU;
    using BEL;
    
    namespace CEL.APU
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Oferta_Transporte_Indice
    /// </summary>
    public class DO_Apu_Oferta_Transporte_Indice
    {
    #region Adapter
    private Apu_Oferta_Transporte_IndiceTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Oferta_Transporte_IndiceTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Oferta_Transporte_IndiceTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Oferta_Transporte_Indice
    /// </summary> 
    /// <returns>Lista de objetos Apu_Oferta_Transporte_Indice</returns> 
    public List <Apu_Oferta_Transporte_Indice> Get ( Scope s )
    {
    string llamada = "";
    List <Apu_Oferta_Transporte_Indice> lista= new List <Apu_Oferta_Transporte_Indice> ();
    //Extrae los datos
    if(s != null)
    {
    Apu.Apu_Oferta_Transporte_IndiceDataTable tabla = 
    Adapter.Get (s.Ver_Version_Id);
    //Cuenta  el número  de registros de la tabla
    int numeroRegistros = tabla.Count;
    llamada = "Nombre del Método Utilizado: Get "  + "Parametros  Enviados en el Método: s "  + " Nombre del Store Procedure: " + " Apu_Oferta_Transporte_Indice_Get "+ " Número de Registros: " + numeroRegistros;
    //Carga en la lista
      foreach (Apu.Apu_Oferta_Transporte_IndiceRow fila in tabla)
      lista.Add(new Apu_Oferta_Transporte_Indice(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Oferta_Id,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Costo_Indice,
    fila.Int_Moneda_Simbolo,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Oferta_Transporte_Indice> GetByOferta( Scope s , string Apu_Oferta_Id)
          {
          string llamada = "";
          List <Apu_Oferta_Transporte_Indice> lista= new List <Apu_Oferta_Transporte_Indice> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Oferta_Transporte_IndiceDataTable tabla = 
          Adapter.GetByOferta(s.Ver_Version_Id, Apu_Oferta_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByOferta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Oferta_Id : " + Apu_Oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Transporte_Indice_ByOferta " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Oferta_Transporte_IndiceRow fila in tabla)
          lista.Add(new Apu_Oferta_Transporte_Indice(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Oferta_Id,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Costo_Indice,
    fila.Int_Moneda_Simbolo,
    fila.Estado_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
     public List <Apu_Oferta_Transporte_Indice> GetByCodigo( Scope s , string Codigo)
          {
          string llamada = "";
          List <Apu_Oferta_Transporte_Indice> lista= new List <Apu_Oferta_Transporte_Indice> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Oferta_Transporte_IndiceDataTable tabla = 
          Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Codigo : " + Codigo  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Transporte_Indice_ByCodigo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Oferta_Transporte_IndiceRow fila in tabla)
          lista.Add(new Apu_Oferta_Transporte_Indice(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Oferta_Id,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Costo_Indice,
    fila.Int_Moneda_Simbolo,
    fila.Estado_Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        public List <Apu_Oferta_Transporte_Indice> GetById( Scope s , string Id)
          {
          string llamada = "";
          List <Apu_Oferta_Transporte_Indice> lista= new List <Apu_Oferta_Transporte_Indice> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Oferta_Transporte_IndiceDataTable tabla = 
          Adapter.GetById(s.Ver_Version_Id, Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Id : " + Id  + " Nombre del Store Procedure: " + "dbo.Apu_Oferta_Transporte_Indice_ById " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Oferta_Transporte_IndiceRow fila in tabla)
          lista.Add(new Apu_Oferta_Transporte_Indice(
          
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Oferta_Id,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Apu_Oferta_Codigo,
    fila.Apu_Oferta_Nombre,
    fila.Apu_Oferta_Etapa,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Costo_Total,
    fila.Costo_Indice,
    fila.Int_Moneda_Simbolo,
    fila.Estado_Nombre));
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
          /// Inserta el objeto en la tabla Apu_Oferta_Transporte_Indice
          /// </summary>
          /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
          // <returns></returns>
          public string Insert(Scope s, Apu_Oferta_Transporte_Indice o)
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
                        o.Apu_Oferta_Id,
                        o.Apu_Indice_Id,
                        o.Porcentaje,
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
                          if (mensaje.StartsWith(
                          Textos._ERR_VIOLATION_UNIQUE_KEY)
                          )
                              return Insert(s, o);
                          else
                          {
                              if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Transporte_Indice))
                              {
                                  eCaso = new System.Exception("");
                                  otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                  throw (otroEX);
                              }
                              eCaso = new System.Exception(e.Message);
                              otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                              throw (otroEX);
                          }
                          break;
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
          /// Borra el objeto de la tabla Apu_Oferta_Transporte_Indice
          ///</summary>
          /// <param name="o">Objeto a actualizar</param>
          /// <returns></returns>
          public int Delete(Scope s, Apu_Oferta_Transporte_Indice o)
          {
              int resultado = 0;
              try
              {

                  resultado = Adapter.Delete(

                       o.Id,
                       o.Codigo,
                       o.Apu_Oferta_Id,
                       o.Apu_Indice_Id,
                       o.Porcentaje,
                       o.Estado
                 );
              }
              catch (SqlException e)
              {
                  System.Exception eCaso;
                  System.Exception otroEX;

                  eCaso = new System.Exception(e.Message);
                  otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                  throw (otroEX);
              }
              ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
              return resultado;
          }//Actualiza
          /// <summary>
          //Actualiza la tabla Apu_Oferta_Transporte_Indice
          /// </summary>
          /// <param name="o">Objeto que contiene la información a actualizar</param>
          /// <param name="original">Original para concurrencia optimista</param> 
          /// <returns></returns>
          public int Update(Scope s, Apu_Oferta_Transporte_Indice o, Apu_Oferta_Transporte_Indice original)
          {
              int resultado = 0;
              try{
              resultado = Adapter.Update(

                    o.Id,
                    o.Codigo,
                    o.Apu_Oferta_Id,
                    o.Apu_Indice_Id,
                    o.Porcentaje,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Apu_Oferta_Id,
                    original.Apu_Indice_Id,
                    original.Porcentaje,
                    original.Estado

              );
              }catch (SqlException e)
                {
                    System.Exception eCaso;
                    System.Exception otroEX;
                  if (e.Message.Contains(TXT_BDD._IX_Apu_Oferta_Transporte_Indice))
                    {
                       eCaso = new System.Exception("");
                       otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
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
