
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.ApuTableAdapters;
using AEL.APU;
using BEL;
using System.Data;

namespace CEL.APU
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Apu target
    /// Tabla:Apu_Rubro
    /// </summary>
    public class DO_Apu_Rubro
    {
        #region Adapter
        private Apu_RubroTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_RubroTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_RubroTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Rubro
        /// </summary> 
        /// <returns>Lista de objetos Apu_Rubro</returns> 
        public List<Apu_Rubro> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los     datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " 
                        + " Apu_Rubro_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByEmpresa(Scope s, string Int_Empresa_Id)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByLikeNombre(Scope s, string Nombre)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre, s.Int_Sucursal_Id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," 
                        + " s.Int_Sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " 
                        + "dbo.Apu_Rubro_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByLikeCodigo(Scope s, string Codigo, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByLikeCodigo(s.Ver_Version_Id, Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: "
                    + " GetByLikeNombre"
                    + " Parametros  Enviados en el Método: "
                    + "," + " s.Ver_Version_Id : "
                    + s.Ver_Version_Id + "," + " codigo : "
                    + Codigo + "," + " s.Int_Sucursal_Id : "
                    + int_sucursal_Id + " Nombre del Store Procedure: "
                    + "dbo.Apu_Rubro_ByLikeCodigo "
                    + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByNombre(s.Ver_Version_Id, Nombre, s.Int_Sucursal_Id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByNombre" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," 
                        + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " 
                        + "dbo.Apu_Rubro_ByNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));

            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde,
                                             string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde,
                                             string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla;
                try
                {
                    tabla = Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre, Apu_Subtitulo_Codigo_Desde,
                                                  Apu_Subtitulo_Codigo_Hasta, Apu_Subtitulo_Nombre, Apu_Titulo_Codigo_Desde, Apu_Titulo_Codigo_Hasta,   
                                                  Apu_Titulo_Nombre, s.Numero_Registros, s.Pagina_Actual);
                }
                catch (SqlException e)
                {
                    throw (e);
                }
                //tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Sucursal_Id : " + s.Int_Sucursal_Id + "," 
                        + " Codigo_Desde : " + Codigo_Desde + "," + " Codigo_Hasta : " + Codigo_Hasta + "," 
                        + " Nombre : " + Nombre + "," + " Apu_Subtitulo_Codigo : " + Apu_Subtitulo_Codigo_Desde + "," 
                        + " Apu_Subtitulo_Codigo_Hasta : " + Apu_Subtitulo_Codigo_Hasta + "," + " Apu_Subtitulo_Nombre : " + Apu_Subtitulo_Nombre + "," 
                        + " Apu_Titulo_Codigo_Desde : " + Apu_Titulo_Codigo_Desde + "," + " Apu_Titulo_Codigo_Hasta : " + Apu_Titulo_Codigo_Hasta + ","
                        + " Apu_Titulo_Nombre : " + Apu_Titulo_Nombre + "," + " Nombre del Store Procedure: "
                        + "dbo.Apu_Rubro_BySucursal " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));

            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByLikeCodigoDesde(s.Ver_Version_Id, desde_Codigo, s.Int_Sucursal_Id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesde" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," 
                        + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " 
                        + "dbo.Apu_Rubro_ByLikeCodigoDesde " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByLikeCodigoDesdeHasta(s.Ver_Version_Id, desde_Codigo, hasta_Codigo, s.Int_Sucursal_Id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesdeHasta" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," 
                        + " hasta_Codigo : " + hasta_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id 
                        + " Nombre del Store Procedure: " + "dbo.Apu_Rubro_ByLikeCodigoDesdeHasta " 
                        + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Rubro> GetByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Rubro> lista = new List<Apu_Rubro>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_RubroDataTable tabla = Adapter.GetByLikeCodigoHasta(s.Ver_Version_Id, hasta_Codigo, s.Int_Sucursal_Id);
                tabla.DefaultView.RowFilter = s.Expresion_De_Filtrado;
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoHasta" + " Parametros  Enviados en el Método: " + "," 
                        + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " hasta_Codigo : " + hasta_Codigo + "," 
                        + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " 
                        + "dbo.Apu_Rubro_ByLikeCodigoHasta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_RubroRow fila in tabla)
                    lista.Add(new Apu_Rubro(
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Unidad,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Rendimiento_Mano_Obra,
                        fila.Rendimiento_Equipo,
                        fila.Especial,
                        fila.Disponible,
                        fila.Descripcion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Creacion,
                        fila.Update_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Apu_Subtitulo_id,
                        fila.Int_Sucursal_Codigo,
                        fila.Int_Sucursal_Nombre,
                        fila.Int_Empresa_Id,
                        fila.Int_Empresa_Codigo,
                        fila.Int_Empresa_Nombre,
                        fila.Apu_Subtitulo_Codigo,
                        fila.Apu_Subtitulo_Nombre,
                        fila.Apu_Titulo_id,
                        fila.Apu_Titulo_Codigo,
                        fila.Apu_Titulo_Nombre,
                        fila.Int_Moneda_Codigo,
                        fila.Int_Moneda_Nombre,
                        fila.Int_Moneda_Simbolo,
                        fila.Creacion_Per_Personal_Codigo,
                        fila.Creacion_Per_Personal_Nombre,
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Rendimiento_Mano_Obra_Hora,
                        fila.Rendimiento_Equipo_Hora,
                        fila.Apu_rubro_material_costo_total,
                        fila.Apu_rubro_transporte_costo_total,
                        fila.Apu_rubro_material_transporte_costo_total,
                        fila.Apu_rubro_mano_obra_costo_total,
                        fila.Apu_rubro_equipo_costo_total,
                        fila.Apu_rubro_material_ultima_fecha_update,
                        fila.Apu_rubro_transporte_ultima_fecha_update,
                        fila.Apu_rubro_mano_obra_ultima_fecha_update,
                        fila.Apu_rubro_equipo_ultima_fecha_update,
                        fila.Costo_Directo,
                        fila.Costo_Indirecto,
                        fila.Costo_Total,
                        fila.Porcentaje_costo_indirecto,
                        fila.Disponible_Nombre,
                        fila.Especial_Nombre,
                        fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Apu_Subtitulo_Codigo_Desde, 
                                string Apu_Subtitulo_Codigo_Hasta, string Apu_Subtitulo_Nombre, string Apu_Titulo_Codigo_Desde, 
                                string Apu_Titulo_Codigo_Hasta, string Apu_Titulo_Nombre)
        {
            int  resultado;
            // Ejecutar el procedimiento en bloque
            try
            {
                resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Nombre,
                                                      Apu_Subtitulo_Codigo_Desde, Apu_Subtitulo_Codigo_Hasta, Apu_Subtitulo_Nombre,
                                                      Apu_Titulo_Codigo_Desde, Apu_Titulo_Codigo_Hasta, Apu_Titulo_Nombre, s.Numero_Registros);
            }
            catch (SqlException e)
            {
                throw (e);
            }
            //Retorna el resultado
            return resultado;
        }
        #endregion
        #endregion
        #region Operaciones con datos
        // Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Rubro
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Rubro o)
        {
            //// Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            //// Controla el error de clave primaria duplicada.
            o.Int_Sucursal_Id = s.Int_Sucursal_Id;
            o.Int_Moneda_Id = s.Int_Moneda_Id;
            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Creacion = DateTime.Now;
            o.Fecha_Update = DateTime.Now;
            try
            {
                Adapter.Insert(
                      o.Id,
                      o.Codigo,
                      o.Nombre.ToUpper(),
                      o.Unidad.ToUpper(),
                      o.Int_Sucursal_Id,
                      o.Apu_Subtitulo_id,
                      o.Int_Moneda_Id,
                      o.Rendimiento_Mano_Obra,
                      o.Rendimiento_Equipo,
                      o.Especial,
                      o.Disponible,
                      o.Descripcion,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Creacion,
                      o.Update_Per_Personal_Id,
                      o.Fecha_Update,
                      o.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;
                switch (e.Number)
                {
                    //// Si el error es de violación PK, entonces repite.
                    case 2627:
                        string mensaje = e.Errors[0].Message;
                        if (mensaje.StartsWith(
                        Textos._ERR_VIOLATION_UNIQUE_KEY)
                        )
                            return Insert(s, o);
                        else
                        {
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_nombre_Sucursal_Id))
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
            ////Control de Auditoria
            ////Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            ////Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Rubro
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Rubro o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Unidad,
                    o.Int_Sucursal_Id,
                    o.Apu_Subtitulo_id,
                    o.Int_Moneda_Id,
                    o.Rendimiento_Mano_Obra,
                    o.Rendimiento_Equipo,
                    o.Especial,
                    o.Disponible,
                    o.Descripcion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Creacion,
                    o.Update_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Oferta Rubro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Documento_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Rubro Documento");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Equipo_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Rubro Equipo");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Mano_Obra_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Rubro Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Material_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Rubro Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Tecnica_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Rubro Tecnica");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Rubro_Apu_Rubro))
                {
                    eCaso = new System.Exception("Apu Presupuesto Rubro");
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
        //Actualiza la tabla Apu_Rubro
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Rubro o, Apu_Rubro original)
        {
            int resultado = 0;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Update = DateTime.Now;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Unidad.ToUpper(),
                    o.Int_Sucursal_Id,
                    o.Apu_Subtitulo_id,
                    o.Int_Moneda_Id,
                    o.Rendimiento_Mano_Obra,
                    o.Rendimiento_Equipo,
                    o.Especial,
                    o.Disponible,
                    o.Descripcion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Creacion,
                    o.Update_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Estado,
                    original.Id,
                    original.Codigo,
                    original.Nombre,
                    original.Unidad,
                    original.Int_Sucursal_Id,
                    original.Apu_Subtitulo_id,
                    original.Int_Moneda_Id,
                    original.Rendimiento_Mano_Obra,
                    original.Rendimiento_Equipo,
                    original.Especial,
                    original.Disponible,
                    original.Descripcion,
                    original.Creacion_Per_Personal_Id,
                    original.Fecha_Creacion,
                    original.Update_Per_Personal_Id,
                    original.Fecha_Update,
                    original.Estado);
            }
            catch (SqlException e)
            {
                System.Exception eCaso;
                System.Exception otroEX;

                if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Rubro_nombre_Sucursal_Id))
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
