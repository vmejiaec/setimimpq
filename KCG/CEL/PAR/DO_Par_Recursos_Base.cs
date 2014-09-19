
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.ParametrosTableAdapters;
    using AEL.PAR;
    using BEL;
    
    namespace CEL.PAR
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Parametros
    /// Tabla:Par_Recursos_Base
    /// </summary>
    public class DO_Par_Recursos_Base
    {
    #region Adapter
    private Par_Recursos_BaseTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_Recursos_BaseTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_Recursos_BaseTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Recursos_Base
    /// </summary> 
    /// <returns>Lista de objetos Par_Recursos_Base</returns> 
    public List <Par_Recursos_Base> GetBase ( Scope s )
    {
    List <Par_Recursos_Base> lista= new List <Par_Recursos_Base> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_Recursos_BaseDataTable tabla = 
      Adapter.GetBase (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Parametros.Par_Recursos_BaseRow fila in tabla)
      lista.Add(new Par_Recursos_Base(
      
    
    fila.Origen, 
    fila.Tipo, 
    fila.Nombre,
    fila.Ver_Etiqueta_Nombre,
    fila.Tool_Ver_Etiqueta_Nombre,
    fila.Ver_Etiqueta_Imagen_Activa,
    fila.Ver_Etiqueta_Imagen_Desactiva));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    }
    }
