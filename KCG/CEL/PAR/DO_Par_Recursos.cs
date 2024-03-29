
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
    /// Tabla:Par_Recursos
    /// </summary>
    public class DO_Par_Recursos
    {
    #region Adapter
    private Par_RecursosTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Par_RecursosTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Par_RecursosTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Par_Recursos
    /// </summary> 
    /// <returns>Lista de objetos Par_Recursos</returns> 
        public List<Par_Recursos> GetByContenedor(Scope s, string dic_contenedor_id)
    {
    List <Par_Recursos> lista= new List <Par_Recursos> ();
      //Extrae los datos
      if(s != null)
      {
      Parametros.Par_RecursosDataTable tabla = 
      Adapter.GetbyContenedor(s.Ver_Version_Id ,dic_contenedor_id);
      //Carga en la lista
      foreach (Parametros.Par_RecursosRow fila in tabla)
      lista.Add(new Par_Recursos(
      
    fila.Origen,
    fila.Tipo,
    fila.Nombre,      
    fila.Ver_etiqueta_nombre,
    fila.Tool_Ver_etiqueta_nombre,
    fila.orden,
    fila.dic_objeto_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      #endregion
    }
    }
