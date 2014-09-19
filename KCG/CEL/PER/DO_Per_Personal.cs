
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.PersonalTableAdapters;
using AEL.PER;
using BEL;

namespace CEL.PER
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Personal t
    /// Tabla:Per_Personal
    /// </summary>
    public class DO_Per_Personal
    {
        #region Adapter
        private Per_PersonalTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Per_PersonalTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Per_PersonalTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Per_Personal
        /// </summary> 
        /// <returns>Lista de objetos Per_Personal</returns> 
        public List<Per_Personal> Get(Scope s)
        {
            string llamada = "";
            List<Per_Personal> lista = new List<Per_Personal>();
            //Extrae los datos
            if (s != null)
            {
                Personal.Per_PersonalDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " 
                        + " Nombre del Store Procedure: " + " Per_Personal_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Personal.Per_PersonalRow fila in tabla)
                    lista.Add(new Per_Personal(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Coordinador,
                        fila.Tecnico_Costos,
                        fila.Int_Empresa_Id,
                        fila.Jefe_Costos,
                        fila.Par_Razon_Social_Id,
                        fila.Tipo_Fiscalizacion,
                        fila.Jefe_Fiscalizacion,
                        fila.Fiscalizacion,
                        fila.Contratista,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Razon_Social_Codigo,
                        fila.Par_Razon_Social_Numero,
                        fila.Par_Razon_Social_Nombre,
                        fila.Par_Razon_Social_Nom_Comercial,
                        fila.Per_Personal_Usuario,
                        fila.Coordinador_Nombre,
                        fila.Tecnico_Costos_Nombre,
                        fila.Jefe_Costos_Nombre,
                        fila.Tipo_Fiscalizacion_Nombre,
                        fila.Jefe_Fiscalizacion_Nombre,
                        fila.Fiscalizacion_Nombre,
                        fila.Contratista_Nombre,
                        fila.Estado_Nombre,
                        fila.Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Per_Personal> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Per_Personal> lista = new List<Per_Personal>();
            //Extrae los datos
            if (s != null)
            {
                Personal.Per_PersonalDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo 
                        + " Nombre del Store Procedure: " + "dbo.Per_Personal_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Personal.Per_PersonalRow fila in tabla)
                    lista.Add(new Per_Personal(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Coordinador,
                        fila.Tecnico_Costos,
                        fila.Int_Empresa_Id,
                        fila.Jefe_Costos,
                        fila.Par_Razon_Social_Id,
                        fila.Tipo_Fiscalizacion,
                        fila.Jefe_Fiscalizacion,
                        fila.Fiscalizacion,
                        fila.Contratista,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Razon_Social_Codigo,
                        fila.Par_Razon_Social_Numero,
                        fila.Par_Razon_Social_Nombre,
                        fila.Par_Razon_Social_Nom_Comercial,
                        fila.Per_Personal_Usuario,
                        fila.Coordinador_Nombre,
                        fila.Tecnico_Costos_Nombre,
                        fila.Jefe_Costos_Nombre,
                        fila.Tipo_Fiscalizacion_Nombre,
                        fila.Jefe_Fiscalizacion_Nombre,
                        fila.Fiscalizacion_Nombre,
                        fila.Contratista_Nombre,
                        fila.Estado_Nombre,
                        fila.Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Per_Personal> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Per_Personal> lista = new List<Per_Personal>();
            //Extrae los datos
            if (s != null)
            {
                Personal.Per_PersonalDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Id : " + Id 
                        + " Nombre del Store Procedure: " + "dbo.Per_Personal_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Personal.Per_PersonalRow fila in tabla)
                    lista.Add(new Per_Personal(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Coordinador,
                        fila.Tecnico_Costos,
                        fila.Int_Empresa_Id,
                        fila.Jefe_Costos,
                        fila.Par_Razon_Social_Id,
                        fila.Tipo_Fiscalizacion,
                        fila.Jefe_Fiscalizacion,
                        fila.Fiscalizacion,
                        fila.Contratista,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Razon_Social_Codigo,
                        fila.Par_Razon_Social_Numero,
                        fila.Par_Razon_Social_Nombre,
                        fila.Par_Razon_Social_Nom_Comercial,
                        fila.Per_Personal_Usuario,
                        fila.Coordinador_Nombre,
                        fila.Tecnico_Costos_Nombre,
                        fila.Jefe_Costos_Nombre,
                        fila.Tipo_Fiscalizacion_Nombre,
                        fila.Jefe_Fiscalizacion_Nombre,
                        fila.Fiscalizacion_Nombre,
                        fila.Contratista_Nombre,
                        fila.Estado_Nombre,
                        fila.Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Per_Personal> GetByJefeCostos(Scope s)
        {
            string llamada = "";
            List<Per_Personal> lista = new List<Per_Personal>();
            //Extrae los datos
            if (s != null)
            {
                Personal.Per_PersonalDataTable tabla = Adapter.GetByJefeCostos(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByJefeCostos" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_id : " + s.Ver_Version_Id + " Nombre del Store Procedure: " 
                        + "dbo.Per_Personal_ByJefeCostos " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Personal.Per_PersonalRow fila in tabla)
                    lista.Add(new Per_Personal(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Coordinador,
                        fila.Tecnico_Costos,
                        fila.Int_Empresa_Id,
                        fila.Jefe_Costos,
                        fila.Par_Razon_Social_Id,
                        fila.Tipo_Fiscalizacion,
                        fila.Jefe_Fiscalizacion,
                        fila.Fiscalizacion,
                        fila.Contratista,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Razon_Social_Codigo,
                        fila.Par_Razon_Social_Numero,
                        fila.Par_Razon_Social_Nombre,
                        fila.Par_Razon_Social_Nom_Comercial,
                        fila.Per_Personal_Usuario,
                        fila.Coordinador_Nombre,
                        fila.Tecnico_Costos_Nombre,
                        fila.Jefe_Costos_Nombre,
                        fila.Tipo_Fiscalizacion_Nombre,
                        fila.Jefe_Fiscalizacion_Nombre,
                        fila.Fiscalizacion_Nombre,
                        fila.Contratista_Nombre,
                        fila.Estado_Nombre,
                        fila.Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Per_Personal> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List <Per_Personal> lista= new List <Per_Personal> ();
            //Extrae los datos
            if(s != null)
            {
                Personal.Per_PersonalDataTable tabla = Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Int_Empresa_Id : " + s.Int_Empresa_Id  
                        + " Nombre del Store Procedure: " + "dbo.Per_Personal_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Personal.Per_PersonalRow fila in tabla)
                    lista.Add(new Per_Personal(
                        fila.Id,
                        fila.Codigo,
                        fila.Estado,
                        fila.Coordinador,
                        fila.Tecnico_Costos,
                        fila.Int_Empresa_Id,
                        fila.Jefe_Costos,
                        fila.Par_Razon_Social_Id,
                        fila.Tipo_Fiscalizacion,
                        fila.Jefe_Fiscalizacion,
                        fila.Fiscalizacion,
                        fila.Contratista,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Par_Tipo_Identificacion_Id,
                        fila.Par_Tipo_Identificacion_Nombre,
                        fila.Par_Razon_Social_Codigo,
                        fila.Par_Razon_Social_Numero,
                        fila.Par_Razon_Social_Nombre,
                        fila.Par_Razon_Social_Nom_Comercial,
                        fila.Per_Personal_Usuario,
                        fila.Coordinador_Nombre,
                        fila.Tecnico_Costos_Nombre,
                        fila.Jefe_Costos_Nombre,
                        fila.Tipo_Fiscalizacion_Nombre,
                        fila.Jefe_Fiscalizacion_Nombre,
                        fila.Fiscalizacion_Nombre,
                        fila.Contratista_Nombre,
                        fila.Estado_Nombre,
                        fila.Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List <Per_Personal> GetByLikeNombre( Scope s , string Nombre)
          {
          string llamada = "";
          List <Per_Personal> lista= new List <Per_Personal> ();
          //Extrae los datos
          if(s != null)
          {
          Personal.Per_PersonalDataTable tabla = 
          Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Nombre : " + Nombre  + " Nombre del Store Procedure: " + "dbo.Per_Personal_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Personal.Per_PersonalRow fila in tabla)
          lista.Add(new Per_Personal(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Coordinador,
    fila.Tecnico_Costos,
    fila.Int_Empresa_Id,
    fila.Jefe_Costos,
    fila.Par_Razon_Social_Id,
    fila.Tipo_Fiscalizacion,
    fila.Jefe_Fiscalizacion,
    fila.Fiscalizacion,
    fila.Contratista,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Par_Tipo_Identificacion_Id,
    fila.Par_Tipo_Identificacion_Nombre,
    fila.Par_Razon_Social_Codigo,
    fila.Par_Razon_Social_Numero,
    fila.Par_Razon_Social_Nombre,
    fila.Par_Razon_Social_Nom_Comercial,
    fila.Per_Personal_Usuario,
    fila.Coordinador_Nombre,
    fila.Tecnico_Costos_Nombre,
    fila.Jefe_Costos_Nombre,
    fila.Tipo_Fiscalizacion_Nombre,
    fila.Jefe_Fiscalizacion_Nombre,
    fila.Fiscalizacion_Nombre,
    fila.Contratista_Nombre,
    fila.Estado_Nombre,
    fila.Nombre));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        public List <Per_Personal> GetByLikeFiscalizacion( Scope s , string Nombre)
          {
          string llamada = "";
          List <Per_Personal> lista= new List <Per_Personal> ();
          //Extrae los datos
          if(s != null)
          {
          Personal.Per_PersonalDataTable tabla = 
          Adapter.GetByLikeFiscalizacion(s.Ver_Version_Id, Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByLikeFiscalizacion" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Nombre : " + Nombre  + " Nombre del Store Procedure: " + "dbo.Per_Personal_ByLikeFiscalizacion " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Personal.Per_PersonalRow fila in tabla)
          lista.Add(new Per_Personal(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Coordinador,
    fila.Tecnico_Costos,
    fila.Int_Empresa_Id,
    fila.Jefe_Costos,
    fila.Par_Razon_Social_Id,
    fila.Tipo_Fiscalizacion,
    fila.Jefe_Fiscalizacion,
    fila.Fiscalizacion,
    fila.Contratista,
    fila.Int_Empresa_Codigo,
    fila.Int_Empresa_Nombre,
    fila.Par_Tipo_Identificacion_Id,
    fila.Par_Tipo_Identificacion_Nombre,
    fila.Par_Razon_Social_Codigo,
    fila.Par_Razon_Social_Numero,
    fila.Par_Razon_Social_Nombre,
    fila.Par_Razon_Social_Nom_Comercial,
    fila.Per_Personal_Usuario,
    fila.Coordinador_Nombre,
    fila.Tecnico_Costos_Nombre,
    fila.Jefe_Costos_Nombre,
    fila.Tipo_Fiscalizacion_Nombre,
    fila.Jefe_Fiscalizacion_Nombre,
    fila.Fiscalizacion_Nombre,
    fila.Contratista_Nombre,
    fila.Estado_Nombre,
    fila.Nombre));
          }
          //Realiza la auditoria
          Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Per_Personal
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Per_Personal o)
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
                    o.Coordinador,
                    o.Tecnico_Costos,
                    o.Int_Empresa_Id,
                    o.Jefe_Costos,
                    o.Estado,
                    o.Par_Razon_Social_Id,
                    o.Tipo_Fiscalizacion,
                    o.Jefe_Fiscalizacion,
                    o.Fiscalizacion,
                    o.Contratista);
            }
            catch (SqlException e)
            {
                switch (e.Number)
                {
                    // Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._ERR_VIOLATION_UNIQUE_KEY))
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Per_Personal_Codigo))
                            {
                                System.Exception eCaso = new System.Exception("");
                                System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Per_Personal_Nombre_Empresa))
                            {
                                System.Exception eCaso = new System.Exception("");
                                System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Per_Personal))
                            {
                                System.Exception eCaso = new System.Exception("");
                                System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                        }
                        throw;
                    default:
                        mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(Textos._INSERT_NULL))
                        {
                            System.Exception eCaso = new System.Exception("");
                            System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                            throw (otroEX);
                        }
                        else
                            throw;
                }
            }
            //Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Per_Personal
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Per_Personal o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Coordinador,
                    o.Tecnico_Costos,
                    o.Int_Empresa_Id,
                    o.Jefe_Costos,
                    o.Estado,
                    o.Par_Razon_Social_Id,
                    o.Tipo_Fiscalizacion,
                    o.Jefe_Fiscalizacion,
                    o.Fiscalizacion,
                    o.Contratista);
            }
            catch (SqlException e)
            {
                if (e.Message.Contains(TXT_BDD._FK_Apu_Equipo_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Equipo_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Mano_Obra_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Mano_Obra_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Material_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Material_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Per_Personal2))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Equipo_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Equipo_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Mano_Obra_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Material_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Material_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Material_Per_Personal2))
                {
                    System.Exception eCaso = new System.Exception("Apu Oferta Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Per_Personal2))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Per_Personal3))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Creacion))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Equipo_Per_Personal_Update))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Mano_Obra_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Material_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Material_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Material_Per_Personal2))
                {
                    System.Exception eCaso = new System.Exception("Apu Proyecto Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Equipo_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Equipo_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Equipo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Mano_Obra_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Mano_Obra_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Mano Obra");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Material_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Material_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Material_Per_Personal2))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro Material");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Per_Personal1))
                {
                    System.Exception eCaso = new System.Exception("Apu Rubro");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Int_Usuario_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Int Usuario");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_Per_Personal_Id))
                {
                    System.Exception eCaso = new System.Exception("Fis Catalogo");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                
                //
                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Per_Personal))
                {
                    System.Exception eCaso = new System.Exception("Apu Presupuesto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Per_Personal_2))
                {
                    System.Exception eCaso = new System.Exception("Apu Presupuesto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Per_Personal_3))
                {
                    System.Exception eCaso = new System.Exception("Apu Presupuesto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Per_Personal_4))
                {
                    System.Exception eCaso = new System.Exception("Apu Presupuesto");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }


            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Per_Personal
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Per_Personal o, Per_Personal original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Coordinador,
                    o.Tecnico_Costos,
                    o.Int_Empresa_Id,
                    o.Jefe_Costos,
                    o.Estado,
                    o.Par_Razon_Social_Id,
                    o.Tipo_Fiscalizacion,
                    o.Jefe_Fiscalizacion,
                    o.Fiscalizacion,
                    o.Contratista,
                    original.Id,
                    original.Codigo,
                    original.Coordinador,
                    original.Tecnico_Costos,
                    original.Int_Empresa_Id,
                    original.Jefe_Costos,
                    original.Estado,
                    original.Par_Razon_Social_Id,
                    original.Tipo_Fiscalizacion,
                    original.Jefe_Fiscalizacion,
                    original.Fiscalizacion,
                    original.Contratista);
            }
            catch (SqlException e)
            {
                if (e.Message.Contains(TXT_BDD._IX_Per_Personal_Codigo))
                {
                    System.Exception eCaso = new System.Exception("");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Per_Personal_Nombre_Empresa))
                {
                    System.Exception eCaso = new System.Exception("");
                    System.Exception otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                    throw (otroEX);
                }
            }
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
