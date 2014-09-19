
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
    /// Tabla:Apu_Equipo
    /// </summary>
    public class DO_Apu_Equipo
    {
        #region Adapter
        private Apu_EquipoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_EquipoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_EquipoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Equipo
        /// </summary> 
        /// <returns>Lista de objetos Apu_Equipo</returns> 
        public List<Apu_Equipo> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Equipo_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(
                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Disponible,
                  fila.Costo_Combustible,
                  fila.Costo_Repuesto,
                  fila.Costo_Mantenimiento,
                  fila.Costo_Alquiler,
                  fila.Costo_Otros,
                  fila.Int_Sucursal_Id,
                  fila.Int_Moneda_Id,
                  fila.Fecha_Creacion,
                  fila.Creacion_Per_Personal_Id,
                  fila.Fecha_Update,
                  fila.Update_Per_Personal_Id,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.Int_Moneda_Simbolo,
                  fila.Creacion_Per_Personal_Codigo,
                  fila.Creacion_Per_Personal_Nombre,
                  fila.Costo_Total,
                  fila.Costo_Hora,
                  fila.Update_Per_Personal_Codigo,
                  fila.Update_Per_Personal_Nombre,
                  fila.Disponible_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByLikeNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + nombre + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByNombre(s.Ver_Version_Id, nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + nombre + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByProyectoRubroEquipo(Scope s, string Apu_Proyecto_Rubro_id, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByProyectoRubroEquipo(s.Ver_Version_Id, Apu_Proyecto_Rubro_id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyectoRubroEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Proyecto_Rubro_id : " + Apu_Proyecto_Rubro_id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByProyectoRubroEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetBySucursal(Scope s, string Int_Sucursal_id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Sucursal_id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_BySucursal " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByOfertaRubroEquipo(Scope s, string Apu_Oferta_Rubro_id, string Apu_Equipo_Id)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByOfertaRubroEquipo(s.Ver_Version_Id, Apu_Oferta_Rubro_id, Apu_Equipo_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOfertaRubroEquipo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Oferta_Rubro_id : " + Apu_Oferta_Rubro_id + "," + " Apu_Equipo_Id : " + Apu_Equipo_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByOfertaRubroEquipo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByLikeCodigoDesde(s.Ver_Version_Id, desde_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesde" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByLikeCodigoDesde " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByLikeCodigoDesdeHasta(s.Ver_Version_Id, desde_Codigo, hasta_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesdeHasta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," + " hasta_Codigo : " + hasta_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByLikeCodigoDesdeHasta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Equipo> GetByLkeCodigoHasta(Scope s, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Equipo> lista = new List<Apu_Equipo>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_EquipoDataTable tabla =
                Adapter.GetByLkeCodigoHasta(s.Ver_Version_Id, hasta_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLkeCodigoHasta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " hasta_Codigo : " + hasta_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Equipo_ByLikeCodigoHasta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_EquipoRow fila in tabla)
                    lista.Add(new Apu_Equipo(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Combustible,
              fila.Costo_Repuesto,
              fila.Costo_Mantenimiento,
              fila.Costo_Alquiler,
              fila.Costo_Otros,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Moneda_Simbolo,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Hora,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Disponible_Nombre,
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
        /// Inserta el objeto en la tabla Apu_Equipo
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Equipo o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            if (String.IsNullOrEmpty(o.Codigo)) o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
            //scope 
            o.Int_Sucursal_Id = s.Int_Sucursal_Id;
            o.Int_Moneda_Id = s.Int_Moneda_Id;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            // Victor 11 Marzo 2010
            // Arreglo: No calcula la fecha de creación ni de actualización según el servidor.
            // ------------------------------------
            o.Fecha_Creacion = DateTime.Now;
            o.Fecha_Update = DateTime.Now;
            // ------------------------------------
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Nombre.ToUpper(),
                      o.Disponible.ToUpper(),
                      o.Costo_Combustible,
                      o.Costo_Repuesto,
                      o.Costo_Mantenimiento,
                      o.Costo_Alquiler,
                      o.Costo_Otros,
                      o.Int_Sucursal_Id,
                      o.Int_Moneda_Id,
                      o.Fecha_Creacion,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Update,
                      o.Update_Per_Personal_Id,
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Equipo_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Equipo_Nombre_sucursal_Id))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ27, eCaso);
                                throw (otroEX);
                            }
                            eCaso = new System.Exception(e.Message);
                            otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                            throw (otroEX);
                        }
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
        /// Borra el objeto de la tabla Apu_Equipo
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Equipo o)
        {
            int resultado = 0;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Disponible,
                    o.Costo_Combustible,
                    o.Costo_Repuesto,
                    o.Costo_Mantenimiento,
                    o.Costo_Alquiler,
                    o.Costo_Otros,
                    o.Int_Sucursal_Id,
                    o.Int_Moneda_Id,
                    o.Fecha_Creacion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Update_Per_Personal_Id,
                    o.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Equipo_Apu_Equipo))
                {
                    eCaso = new System.Exception("Apu Oferta Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Equipo_Apu_Equipo))
                {
                    eCaso = new System.Exception("Apu Oferta Rubro Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Equipo_Apu_Equipo))
                {
                    eCaso = new System.Exception("Apu Proyecto Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Equipo_Apu_Equipo))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Equipo_Apu_Equipo))
                {
                    eCaso = new System.Exception("Apu Rubro Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
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
        //Actualiza la tabla Apu_Equipo
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Equipo o, Apu_Equipo original)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Disponible.ToUpper(),
                    o.Costo_Combustible,
                    o.Costo_Repuesto,
                    o.Costo_Mantenimiento,
                    o.Costo_Alquiler,
                    o.Costo_Otros,
                    o.Int_Sucursal_Id,
                    o.Int_Moneda_Id,
                    o.Fecha_Creacion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Update_Per_Personal_Id,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Disponible,
                    original.Costo_Combustible,
                    original.Costo_Repuesto,
                    original.Costo_Mantenimiento,
                    original.Costo_Alquiler,
                    original.Costo_Otros,
                    original.Int_Sucursal_Id,
                    original.Int_Moneda_Id,
                    original.Fecha_Creacion,
                    original.Creacion_Per_Personal_Id,
                    original.Fecha_Update,
                    original.Update_Per_Personal_Id,
                    original.Estado);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Equipo_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Equipo_Nombre_sucursal_Id))
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
