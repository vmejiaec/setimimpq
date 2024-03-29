
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
    /// Tabla:Apu_Indice_Equipo
    /// </summary>
    public class DO_Apu_Indice_Equipo
    {
    #region Adapter
    private Apu_Indice_EquipoTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Apu_Indice_EquipoTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Apu_Indice_EquipoTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Apu_Indice_Equipo
    /// </summary> 
    /// <returns>Lista de objetos Apu_Indice_Equipo</returns> 
    public List <Apu_Indice_Equipo> Get ( Scope s )
    {
    List <Apu_Indice_Equipo> lista= new List <Apu_Indice_Equipo> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_Indice_EquipoDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Apu.Apu_Indice_EquipoRow fila in tabla)
      lista.Add(new Apu_Indice_Equipo(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Int_Empresa_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Indice_Equipo> GetByCodigo( Scope s , string Codigo)
      {
      List <Apu_Indice_Equipo> lista= new List <Apu_Indice_Equipo> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_Indice_EquipoDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Apu.Apu_Indice_EquipoRow fila in tabla)
      lista.Add(new Apu_Indice_Equipo(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Int_Empresa_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Indice_Equipo> GetByEmpresa( Scope s )
      {
      List <Apu_Indice_Equipo> lista= new List <Apu_Indice_Equipo> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_Indice_EquipoDataTable tabla = 
      Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
      //Carga en la lista
      foreach (Apu.Apu_Indice_EquipoRow fila in tabla)
      lista.Add(new Apu_Indice_Equipo(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Int_Empresa_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Apu_Indice_Equipo> GetById( Scope s , string Id)
      {
      List <Apu_Indice_Equipo> lista= new List <Apu_Indice_Equipo> ();
      //Extrae los datos
      if(s != null)
      {
      Apu.Apu_Indice_EquipoDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Apu.Apu_Indice_EquipoRow fila in tabla)
      lista.Add(new Apu_Indice_Equipo(
      
    fila.Id,
    fila.Codigo, 
    fila.Estado,
    fila.Apu_Indice_Id,
    fila.Porcentaje,
    fila.Int_Empresa_Id,
    fila.Apu_Indice_Codigo,
    fila.Apu_Indice_Nombre,
    fila.Int_empresa_Codigo,
    fila.Int_Empresa_nombre,
    fila.Estado_Nombre));
      }
      //Devuleve la Lista
      return lista;
      }
        public List<Apu_Indice_Equipo> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Apu_Indice_Equipo> lista = new List<Apu_Indice_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Indice_EquipoDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," + " int_empresa_id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Indice_Equipo_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Indice_EquipoRow fila in tabla)
                    lista.Add(new Apu_Indice_Equipo(

              fila.Id,
              fila.Codigo, 
              fila.Estado,
              fila.Apu_Indice_Id,
              fila.Porcentaje,
              fila.Int_Empresa_Id,
              fila.Apu_Indice_Codigo,
              fila.Apu_Indice_Nombre,
              fila.Int_empresa_Codigo,
              fila.Int_Empresa_nombre,
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
    /// Inserta el objeto en la tabla Apu_Indice_Equipo
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Apu_Indice_Equipo o)
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
          o.Apu_Indice_Id,
          o.Porcentaje,
          o.Int_Empresa_Id,
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
        if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_Equipo_Codigo))
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
    /// Borra el objeto de la tabla Apu_Indice_Equipo
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Apu_Indice_Equipo o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                o.Id,
                o.Codigo,
                o.Apu_Indice_Id,
                o.Porcentaje,
                o.Int_Empresa_Id,
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
    //Actualiza la tabla Apu_Indice_Equipo
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
    public int Update(Scope s, Apu_Indice_Equipo o, Apu_Indice_Equipo original)
    {
    int resultado=0;
    try
    {
        resultado = Adapter.Update(
            o.Id,
            o.Codigo,
            o.Apu_Indice_Id,
            o.Porcentaje,
            o.Int_Empresa_Id,
            o.Estado,
            original.Id,
            original.Codigo,
            original.Apu_Indice_Id,
            original.Porcentaje,
            original.Int_Empresa_Id,
            original.Estado
            );
    }
        catch (SqlException e)
    {
        System.Exception eCaso;
        System.Exception otroEX;
    
        if (e.Message.Contains(TXT_BDD._IX_Apu_Indice_Equipo_Codigo))
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
