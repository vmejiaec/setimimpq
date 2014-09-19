
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
    /// Tabla:Apu_Proyecto_Equipo
    /// </summary>
    public class DO_Apu_Proyecto_Equipo
    {
        #region Adapter
        private Apu_Proyecto_EquipoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Proyecto_EquipoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Proyecto_EquipoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Proyecto_Equipo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Proyecto_Equipo</returns> 
        public List<Apu_Proyecto_Equipo> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Proyecto_Equipo_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Costo_Combustible,
                  fila.Costo_Repuesto,
                  fila.Costo_Mantenimiento,
                  fila.Costo_Alquiler,
                  fila.Costo_Otros,
                  fila.Apu_Proyecto_Id,
                  fila.Apu_Equipo_Id,
                  fila.Apu_Proyecto_Codigo,
                  fila.Apu_Proyecto_Nombre,
                  fila.Apu_Proyecto_Etapa,
                  fila.Apu_Equipo_Codigo,
                  fila.Apu_Equipo_Nombre,
                  fila.Apu_Equipo_Costo_Combustible,
                  fila.Apu_Equipo_Costo_Repuesto,
                  fila.Apu_Equipo_Costo_Mantenimiento,
                  fila.Apu_Equipo_Costo_Alquiler,
                  fila.Apu_Equipo_Costo_Otros,
                  fila.Int_Moneda_Simbolo,
                  fila.Cantidad_equipo,
                  fila.Cantidad_equipo_X_Costo,
                  fila.Suma_porcentaje_Equipo,
                  fila.Suma_porcentaje_Equipo_1,
                  fila.Estado_Nombre,
                  fila.Costo_Total,
                  fila.Costo_Hora));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Equipo> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Apu_Proyecto_Id,
              fila.Apu_Equipo_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Equipo_Codigo,
              fila.Apu_Equipo_Nombre,
              fila.Apu_Equipo_Costo_Combustible,
              fila.Apu_Equipo_Costo_Repuesto,
              fila.Apu_Equipo_Costo_Mantenimiento,
              fila.Apu_Equipo_Costo_Alquiler,
              fila.Apu_Equipo_Costo_Otros,
              fila.Int_Moneda_Simbolo,
              fila.Cantidad_equipo,
              fila.Cantidad_equipo_X_Costo,
              fila.Suma_porcentaje_Equipo,
              fila.Suma_porcentaje_Equipo_1,
              fila.Estado_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Equipo> GetByEquipo(Scope s, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.GetByEquipo(s.Ver_Version_Id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Apu_Proyecto_Id,
              fila.Apu_Equipo_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Equipo_Codigo,
              fila.Apu_Equipo_Nombre,
              fila.Apu_Equipo_Costo_Combustible,
              fila.Apu_Equipo_Costo_Repuesto,
              fila.Apu_Equipo_Costo_Mantenimiento,
              fila.Apu_Equipo_Costo_Alquiler,
              fila.Apu_Equipo_Costo_Otros,
              fila.Int_Moneda_Simbolo,
              fila.Cantidad_equipo,
              fila.Cantidad_equipo_X_Costo,
              fila.Suma_porcentaje_Equipo,
              fila.Suma_porcentaje_Equipo_1,
              fila.Estado_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Equipo> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Apu_Proyecto_Id,
              fila.Apu_Equipo_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Equipo_Codigo,
              fila.Apu_Equipo_Nombre,
              fila.Apu_Equipo_Costo_Combustible,
              fila.Apu_Equipo_Costo_Repuesto,
              fila.Apu_Equipo_Costo_Mantenimiento,
              fila.Apu_Equipo_Costo_Alquiler,
              fila.Apu_Equipo_Costo_Otros,
              fila.Int_Moneda_Simbolo,
              fila.Cantidad_equipo,
              fila.Cantidad_equipo_X_Costo,
              fila.Suma_porcentaje_Equipo,
              fila.Suma_porcentaje_Equipo_1,
              fila.Estado_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Equipo> GetByProyecto(Scope s, string apu_proyecto_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.GetByProyecto(s.Ver_Version_Id, apu_proyecto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyecto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " apu_proyecto_Id : " + apu_proyecto_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByProyecto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Apu_Proyecto_Id,
              fila.Apu_Equipo_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Equipo_Codigo,
              fila.Apu_Equipo_Nombre,
              fila.Apu_Equipo_Costo_Combustible,
              fila.Apu_Equipo_Costo_Repuesto,
              fila.Apu_Equipo_Costo_Mantenimiento,
              fila.Apu_Equipo_Costo_Alquiler,
              fila.Apu_Equipo_Costo_Otros,
              fila.Int_Moneda_Simbolo,
              fila.Cantidad_equipo,
              fila.Cantidad_equipo_X_Costo,
              fila.Suma_porcentaje_Equipo,
              fila.Suma_porcentaje_Equipo_1,
              fila.Estado_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Proyecto_Equipo> GetByProyectoEquipo(Scope s, string Apu_Proyecto_Id, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Proyecto_Equipo> lista = new List<Apu_Proyecto_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Proyecto_EquipoDataTable tabla =
                Adapter.GetByProyectoEquipo(s.Ver_Version_Id, Apu_Proyecto_Id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyectoEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Proyecto_Id : " + Apu_Proyecto_Id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByProyectoEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
                    lista.Add(new Apu_Proyecto_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Apu_Proyecto_Id,
              fila.Apu_Equipo_Id,
              fila.Apu_Proyecto_Codigo,
              fila.Apu_Proyecto_Nombre,
              fila.Apu_Proyecto_Etapa,
              fila.Apu_Equipo_Codigo,
              fila.Apu_Equipo_Nombre,
              fila.Apu_Equipo_Costo_Combustible,
              fila.Apu_Equipo_Costo_Repuesto,
              fila.Apu_Equipo_Costo_Mantenimiento,
              fila.Apu_Equipo_Costo_Alquiler,
              fila.Apu_Equipo_Costo_Otros,
              fila.Int_Moneda_Simbolo,
              fila.Cantidad_equipo,
              fila.Cantidad_equipo_X_Costo,
              fila.Suma_porcentaje_Equipo,
              fila.Suma_porcentaje_Equipo_1,
              fila.Estado_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List <Apu_Proyecto_Equipo> GetByUpdateCosto( Scope s , string Apu_Proyecto_Id)
          {
          string llamada = "";
          List <Apu_Proyecto_Equipo> lista= new List <Apu_Proyecto_Equipo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Proyecto_EquipoDataTable tabla = 
          Adapter.GetByUpdateCosto(s.Ver_Version_Id, Apu_Proyecto_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByUpdateCosto" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Apu_Proyecto_Id : " + Apu_Proyecto_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByUpdateCosto " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
          lista.Add(new Apu_Proyecto_Equipo(
          
    fila.Id,
    fila.Codigo,
    fila.Estado,
    fila.Costo_Combustible,
    fila.Costo_Repuesto,
    fila.Costo_Mantenimiento,
    fila.Costo_Alquiler,
    fila.Costo_Otros,
    fila.Apu_Proyecto_Id,
    fila.Apu_Equipo_Id,
    fila.Apu_Proyecto_Codigo,
    fila.Apu_Proyecto_Nombre,
    fila.Apu_Proyecto_Etapa,
    fila.Apu_Equipo_Codigo,
    fila.Apu_Equipo_Nombre,
    fila.Apu_Equipo_Costo_Combustible,
    fila.Apu_Equipo_Costo_Repuesto,
    fila.Apu_Equipo_Costo_Mantenimiento,
    fila.Apu_Equipo_Costo_Alquiler,
    fila.Apu_Equipo_Costo_Otros,
    fila.Int_Moneda_Simbolo,
    fila.Cantidad_equipo,
    fila.Cantidad_equipo_X_Costo,
    fila.Suma_porcentaje_Equipo,
    fila.Suma_porcentaje_Equipo_1,
    fila.Estado_Nombre,
    fila.Costo_Total,
    fila.Costo_Hora));
          }
          //Realiza la auditoria
          //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
          //Devuleve la Lista
          return lista;
          }
        public List <Apu_Proyecto_Equipo> GetByProyecto_Oferta( Scope s , string apu_proyecto_id, string apu_oferta_Id)
          {
          string llamada = "";
          List <Apu_Proyecto_Equipo> lista= new List <Apu_Proyecto_Equipo> ();
          //Extrae los datos
          if(s != null)
          {
          Apu.Apu_Proyecto_EquipoDataTable tabla = 
          Adapter.GetByProyecto_Oferta(s.Ver_Version_Id,apu_proyecto_id, apu_oferta_Id);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          //llamada = "Nombre del Método Utilizado: " + " GetByProyecto_Oferta" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " apu_proyecto_Id : " + apu_proyecto_Id+ "," + " apu_oferta_Id : " + apu_oferta_Id  + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_Equipo_ByProy_Oferta " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Proyecto_EquipoRow fila in tabla)
          lista.Add(new Apu_Proyecto_Equipo(
          
            fila.Id,
            fila.Codigo,
            fila.Estado,
            fila.Costo_Combustible,
            fila.Costo_Repuesto,
            fila.Costo_Mantenimiento,
            fila.Costo_Alquiler,
            fila.Costo_Otros,
            fila.Apu_Proyecto_Id,
            fila.Apu_Equipo_Id,
            fila.Apu_Proyecto_Codigo,
            fila.Apu_Proyecto_Nombre,
            fila.Apu_Proyecto_Etapa,
            fila.Apu_Equipo_Codigo,
            fila.Apu_Equipo_Nombre,
            fila.Apu_Equipo_Costo_Combustible,
            fila.Apu_Equipo_Costo_Repuesto,
            fila.Apu_Equipo_Costo_Mantenimiento,
            fila.Apu_Equipo_Costo_Alquiler,
            fila.Apu_Equipo_Costo_Otros,
            fila.Int_Moneda_Simbolo,
            fila.Cantidad_equipo,
            fila.Cantidad_equipo_X_Costo,
            fila.Suma_porcentaje_Equipo,
            fila.Suma_porcentaje_Equipo_1,
            fila.Estado_Nombre,
            fila.Costo_Total,
            fila.Costo_Hora));
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
        /// Inserta el objeto en la tabla Apu_Proyecto_Equipo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Proyecto_Equipo o)
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
                      o.Costo_Combustible,
                      o.Costo_Repuesto,
                      o.Costo_Mantenimiento,
                      o.Costo_Alquiler,
                      o.Costo_Otros,
                      o.Apu_Proyecto_Id,
                      o.Apu_Equipo_Id,
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Equipo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Equipo_Proyecto_Equipo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
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
        /// Borra el objeto de la tabla Apu_Proyecto_Equipo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Proyecto_Equipo o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Costo_Combustible,
                    o.Costo_Repuesto,
                    o.Costo_Mantenimiento,
                    o.Costo_Alquiler,
                    o.Costo_Otros,
                    o.Apu_Proyecto_Id,
                    o.Apu_Equipo_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Equipo_Indice_Apu_Proyecto_Equipo))
                {
                    eCaso = new System.Exception("Apu Proyecto Equipo Indice");
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
        //Actualiza la tabla Apu_Proyecto_Equipo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Proyecto_Equipo o, Apu_Proyecto_Equipo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Costo_Combustible,
                    o.Costo_Repuesto,
                    o.Costo_Mantenimiento,
                    o.Costo_Alquiler,
                    o.Costo_Otros,
                    o.Apu_Proyecto_Id,
                    o.Apu_Equipo_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Costo_Combustible,
                    original.Costo_Repuesto,
                    original.Costo_Mantenimiento,
                    original.Costo_Alquiler,
                    original.Costo_Otros,
                    original.Apu_Proyecto_Id,
                    original.Apu_Equipo_Id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;
                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Equipo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Proyecto_Equipo_Proyecto_Equipo))
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
