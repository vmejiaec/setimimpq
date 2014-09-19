
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using ADL;
    using ADL.SeguridadTableAdapters;
    using AEL.SEG;
    using BEL;
using System;
    
    namespace CEL.SEG
    {
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Seguridad 
    /// Tabla:Seg_Rol_Menu
    /// </summary>
    public class DO_Seg_Rol_Menu
    {
    #region Adapter
    private Seg_Rol_MenuTableAdapter _Adapter;
    /// <summary>
    /// Acceso al Table Adapter de la capa ADL
    /// </summary>
    public Seg_Rol_MenuTableAdapter Adapter
    {
    get
    {
    if (_Adapter == null)
    _Adapter = new Seg_Rol_MenuTableAdapter();
     return _Adapter;
     }
     }
    #endregion
    #region Obtención de datos
    //Obtencion de datos
    /// <summary>
    /// Obtiene todos los datos de la tabla Seg_Rol_Menu
    /// </summary> 
    /// <returns>Lista de objetos Seg_Rol_Menu</returns> 
    public List <Seg_Rol_Menu> Get ( Scope s )
    {
    List <Seg_Rol_Menu> lista= new List <Seg_Rol_Menu> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_MenuDataTable tabla = 
      Adapter.Get (s.Ver_Version_Id);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_MenuRow fila in tabla)
      lista.Add(new Seg_Rol_Menu(   
                fila.Id,
                fila.Codigo,
                fila.Estado,
                fila.Dic_Pantalla_Id,
                fila.Grupo,
                fila.Seg_Rol_Id,
                fila.Dic_Con_Elemento_Id,
                fila.Estado_Nombre,
                fila.Grupo_Nombre,
                fila.Dic_Pantalla_Codigo,
                fila.Dic_Pantalla_Nombre,
                fila.Seg_Rol_Codigo,
                fila.Seg_Rol_Nombre,
                fila.Dic_Con_Elemento_Codigo,
                fila.Dic_con_elemento_nombre,
                fila.Dic_Contenedor_Id,
                fila.Dic_Contenedor_Codigo,
                fila.Dic_Contenedor_Nombre,
                fila.Pantalla_Dic_Rotulo_Id,
                fila.Pantalla_Dic_Rotulo_Codigo,
                fila.Pantalla_Dic_Rotulo_Nombre,
                fila.Pantalla_Ver_Etiqueta_nombre,
                fila.Elemento_Dic_Rotulo_Id,
                fila.Elemento_Dic_Rotulo_Codigo,
                fila.Elemento_Dic_Rotulo_Nombre,
                fila.Elemento_Ver_Etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Seg_Rol_Menu> GetByCodigo( Scope s , string Codigo)
      {
      List <Seg_Rol_Menu> lista= new List <Seg_Rol_Menu> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_MenuDataTable tabla = 
      Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_MenuRow fila in tabla)
          lista.Add(new Seg_Rol_Menu(
                    fila.Id,
                    fila.Codigo,
                    fila.Estado,
                    fila.Dic_Pantalla_Id,
                    fila.Grupo,
                    fila.Seg_Rol_Id,
                    fila.Dic_Con_Elemento_Id,
                    fila.Estado_Nombre,
                    fila.Grupo_Nombre,
                    fila.Dic_Pantalla_Codigo,
                    fila.Dic_Pantalla_Nombre,
                    fila.Seg_Rol_Codigo,
                    fila.Seg_Rol_Nombre,
                    fila.Dic_Con_Elemento_Codigo,
                    fila.Dic_con_elemento_nombre,
                    fila.Dic_Contenedor_Id,
                    fila.Dic_Contenedor_Codigo,
                    fila.Dic_Contenedor_Nombre,
                    fila.Pantalla_Dic_Rotulo_Id,
                    fila.Pantalla_Dic_Rotulo_Codigo,
                    fila.Pantalla_Dic_Rotulo_Nombre,
                    fila.Pantalla_Ver_Etiqueta_nombre,
                    fila.Elemento_Dic_Rotulo_Id,
                    fila.Elemento_Dic_Rotulo_Codigo,
                    fila.Elemento_Dic_Rotulo_Nombre,
                    fila.Elemento_Ver_Etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }
      public List <Seg_Rol_Menu> GetById( Scope s , string Id)
      {
      List <Seg_Rol_Menu> lista= new List <Seg_Rol_Menu> ();
      //Extrae los datos
      if(s != null)
      {
      Seguridad .Seg_Rol_MenuDataTable tabla = 
      Adapter.GetById(s.Ver_Version_Id, Id);
      //Carga en la lista
      foreach (Seguridad .Seg_Rol_MenuRow fila in tabla)
          lista.Add(new Seg_Rol_Menu(
                    fila.Id,
                    fila.Codigo,
                    fila.Estado,
                    fila.Dic_Pantalla_Id,
                    fila.Grupo,
                    fila.Seg_Rol_Id,
                    fila.Dic_Con_Elemento_Id,
                    fila.Estado_Nombre,
                    fila.Grupo_Nombre,
                    fila.Dic_Pantalla_Codigo,
                    fila.Dic_Pantalla_Nombre,
                    fila.Seg_Rol_Codigo,
                    fila.Seg_Rol_Nombre,
                    fila.Dic_Con_Elemento_Codigo,
                    fila.Dic_con_elemento_nombre,
                    fila.Dic_Contenedor_Id,
                    fila.Dic_Contenedor_Codigo,
                    fila.Dic_Contenedor_Nombre,
                    fila.Pantalla_Dic_Rotulo_Id,
                    fila.Pantalla_Dic_Rotulo_Codigo,
                    fila.Pantalla_Dic_Rotulo_Nombre,
                    fila.Pantalla_Ver_Etiqueta_nombre,
                    fila.Elemento_Dic_Rotulo_Id,
                    fila.Elemento_Dic_Rotulo_Codigo,
                    fila.Elemento_Dic_Rotulo_Nombre,
                    fila.Elemento_Ver_Etiqueta_nombre));
      }
      //Devuleve la Lista
      return lista;
      }

        public List<Seg_Rol_Menu> GetByRol(Scope s, string Seg_Rol_Id)
        {
            string llamada = "";
            List<Seg_Rol_Menu> lista = new List<Seg_Rol_Menu>();
            //Extrae los datos
            if (s != null)
            {
                Seguridad.Seg_Rol_MenuDataTable tabla =
                Adapter.GetByRol(s.Ver_Version_Id, Seg_Rol_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByRol" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Seg_Rol_Id : " + Seg_Rol_Id + " Nombre del Store Procedure: " + "dbo.Seg_Rol_Menu_ByRol " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Seguridad.Seg_Rol_MenuRow fila in tabla)
                    lista.Add(new Seg_Rol_Menu(
                            fila.Id,
                            fila.Codigo,
                            fila.Estado,
                            fila.Dic_Pantalla_Id,
                            fila.Grupo,
                            fila.Seg_Rol_Id,
                            fila.Dic_Con_Elemento_Id,
                            fila.Estado_Nombre,
                            fila.Grupo_Nombre,
                            fila.Dic_Pantalla_Codigo,
                            fila.Dic_Pantalla_Nombre,
                            fila.Seg_Rol_Codigo,
                            fila.Seg_Rol_Nombre,
                            fila.Dic_Con_Elemento_Codigo,
                            fila.Dic_con_elemento_nombre,
                            fila.Dic_Contenedor_Id,
                            fila.Dic_Contenedor_Codigo,
                            fila.Dic_Contenedor_Nombre,
                            fila.Pantalla_Dic_Rotulo_Id,
                            fila.Pantalla_Dic_Rotulo_Codigo,
                            fila.Pantalla_Dic_Rotulo_Nombre,
                            fila.Pantalla_Ver_Etiqueta_nombre,
                            fila.Elemento_Dic_Rotulo_Id,
                            fila.Elemento_Dic_Rotulo_Codigo,
                            fila.Elemento_Dic_Rotulo_Nombre,
                            fila.Elemento_Ver_Etiqueta_nombre));
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
    /// Inserta el objeto en la tabla Seg_Rol_Menu
    /// </summary>
    /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
    // <returns></returns>
    public string Insert(Scope s, Seg_Rol_Menu o)
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
              o.Dic_Pantalla_Id,
              o.Grupo,
              o.Seg_Rol_Id,
              o.Dic_Con_Elemento_Id,
              o.Estado
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
                    if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Menu_Codigo))
                    {
                        eCaso = new Exception("");
                        otroEX = new Exception(TXT_Mensajes._MSJ32, eCaso);
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
    /// Borra el objeto de la tabla Seg_Rol_Menu
    ///</summary>
     /// <param name="o">Objeto a actualizar</param>
    /// <returns></returns>
    public int Delete(Scope s,  Seg_Rol_Menu o)
    {
        int resultado = 0;
        try
        {
            resultado = Adapter.Delete(
                           o.Id,
                           o.Codigo,
                           o.Dic_Pantalla_Id,
                           o.Grupo,
                           o.Seg_Rol_Id,
                           o.Dic_Con_Elemento_Id,
                           o.Estado
                        );
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
    //Actualiza la tabla Seg_Rol_Menu
    /// </summary>
    /// <param name="o">Objeto que contiene la información a actualizar</param>
    /// <param name="original">Original para concurrencia optimista</param> 
    /// <returns></returns>
        public int Update(Scope s, Seg_Rol_Menu o, Seg_Rol_Menu original)
        {
            if (string.IsNullOrEmpty(o.Dic_Pantalla_Nombre))
                o.Dic_Pantalla_Id = null;
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(

                      o.Id,
                      o.Codigo,
                      o.Dic_Pantalla_Id,
                      o.Grupo,
                      o.Seg_Rol_Id,
                      o.Dic_Con_Elemento_Id,
                      o.Estado,
                      original.Id,
                      original.Codigo,
                      original.Dic_Pantalla_Id,
                      original.Grupo,
                      original.Seg_Rol_Id,
                      original.Dic_Con_Elemento_Id,
                      original.Estado

                );
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Seg_Rol_Menu_Codigo))
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
