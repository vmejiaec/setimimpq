
using System;
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
    /// Tabla:Apu_Material
    /// </summary>
    public class DO_Apu_Material
    {
        #region Adapter
        private Apu_MaterialTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_MaterialTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_MaterialTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Material
        /// </summary> 
        /// <returns>Lista de objetos Apu_Material</returns> 
        public List<Apu_Material> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Material_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Unidad,
                  fila.Costo_Parcial,
                  fila.Costo_Otros,
                  fila.Costo_Transporte,
                  fila.Disponible,
                  fila.Int_Sucursal_Id,
                  fila.Int_Moneda_Id,
                  fila.Fecha_Creacion,
                  fila.Creacion_Per_Personal_Id,
                  fila.Fecha_Update,
                  fila.Update_Per_Personal_Id,
                  fila.Int_Sucursal_Codigo,
                  fila.Int_Sucursal_Nombre,
                  fila.Int_Moneda_Codigo,
                  fila.Int_Moneda_Nombre,
                  fila.Int_Empresa_Id,
                  fila.Int_Empresa_Codigo,
                  fila.Int_Empresa_Nombre,
                  fila.Creacion_Per_Personal_Codigo,
                  fila.Creacion_Per_Personal_Nombre,
                  fila.Update_Per_Personal_Codigo,
                  fila.Update_Per_Personal_Nombre,
                  fila.Costo_Total,
                  fila.Costo_Total_Costo_Transporte,
                  fila.Int_Moneda_Simbolo,
                  fila.Disponible_Nombre,
                  fila.estado_nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Material_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByLikeNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " nombre : " + nombre + "," + " s.Int_Sucursal_Id : " + int_sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_byLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByNombre(Scope s, string nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByNombre(s.Ver_Version_Id, nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " nombre : " + nombre + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_byNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByOfertaRubroMaterial(Scope s, string Apu_Oferta_Rubro_id, string Apu_Material_Id)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByOfertaRubroMaterial(s.Ver_Version_Id, Apu_Oferta_Rubro_id, Apu_Material_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOfertaRubroMaterial" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Apu_Oferta_Rubro_id : " + Apu_Oferta_Rubro_id + "," + " Apu_Material_Id : " + Apu_Material_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_ByOfertaRubroMaterial " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByProyectoRubroMaterial(Scope s, string Apu_Proyecto_Rubro_Id, string Apu_Material_Id)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByProyectoRubroMaterial(s.Ver_Version_Id, Apu_Proyecto_Rubro_Id, Apu_Material_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyectoRubroMaterial" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Apu_Proyecto_Rubro_id : " + Apu_Proyecto_Rubro_Id + "," + " Apu_Material_Id : " + Apu_Material_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_ByProyectoRubroMaterial " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetBySucursal(Scope s, string Int_Sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (!String.IsNullOrEmpty(Nombre))
                Nombre = Nombre.Replace("[", "").Replace("]", "");
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetBySucursal(s.Ver_Version_Id,
                      s.Int_Sucursal_Id,
                      s.Numero_Registros,
                      s.Pagina_Actual,
                      Codigo_Desde,
                      Codigo_Hasta,
                      Nombre,
                      Unidad,
                      Costo_Total_Desde,
                      Costo_Total_Hasta,
                      Disponible);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " Int_Sucursal_id : " + s.Int_Sucursal_Id + " Numero_Registros : " + s.Numero_Registros + "," + " Pagina_Actual : " + s.Pagina_Actual + "," + " Codigo_Desde : " + Codigo_Desde + "," + " Codigo_Hasta : " + Codigo_Hasta + "," + " Nombre : " + Nombre + "," + " Unidad : " + Unidad + "," + " Costo_Total_Desde : " + Costo_Total_Desde + "," + " Costo_Total_Hasta : " + Costo_Total_Hasta + "," + " Disponible : " + Disponible + " Nombre del Store Procedure: " + "dbo.Apu_Material_bySucursal " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByLikeCodigoDesde(Scope s, string desde_Codigo)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByLikeCodigoDesde(s.Ver_Version_Id, desde_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesde" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_byLikeCodigoDesde " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GetByLikeCodigoDesdeHasta(Scope s, string desde_Codigo, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GetByLikeCodigoDesdeHasta(s.Ver_Version_Id, desde_Codigo, hasta_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeCodigoDesdeHasta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " desde_Codigo : " + desde_Codigo + "," + " hasta_Codigo : " + hasta_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_byLikeCodigoDesdeHasta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Material> GeByLikeCodigoHasta(Scope s, string hasta_Codigo)
        {
            string llamada = "";
            List<Apu_Material> lista = new List<Apu_Material>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_MaterialDataTable tabla =
                Adapter.GeByLikeCodigoHasta(s.Ver_Version_Id, hasta_Codigo, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GeByLikeCodigoHasta" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_id : " + s.Ver_Version_Id + "," + " hasta_Codigo : " + hasta_Codigo + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Material_byLikeCodigoHasta " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_MaterialRow fila in tabla)
                    lista.Add(new Apu_Material(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Unidad,
              fila.Costo_Parcial,
              fila.Costo_Otros,
              fila.Costo_Transporte,
              fila.Disponible,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Int_Sucursal_Codigo,
              fila.Int_Sucursal_Nombre,
              fila.Int_Moneda_Codigo,
              fila.Int_Moneda_Nombre,
              fila.Int_Empresa_Id,
              fila.Int_Empresa_Codigo,
              fila.Int_Empresa_Nombre,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Total,
              fila.Costo_Total_Costo_Transporte,
              fila.Int_Moneda_Simbolo,
              fila.Disponible_Nombre,
              fila.estado_nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public int TotalPaginas(Scope s, string Int_sucursal_id, string Codigo_Desde, string Codigo_Hasta, string Nombre, string Unidad, decimal Costo_Total_Desde, decimal Costo_Total_Hasta, string Disponible)
        {
            if (!String.IsNullOrEmpty(Nombre))
                Nombre = Nombre.Replace("[", "").Replace("]", "");
            int resultado;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id,
                    s.Int_Sucursal_Id,
                    s.Numero_Registros,
                    Codigo_Desde,
                    Codigo_Hasta,
                    Nombre,
                    Unidad,
                    Costo_Total_Desde,
                    Costo_Total_Hasta,
                    Disponible);

            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            string llamada = "Nombre del Método Utilizado: " + " GetByTotalPaginas" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_sucursal_id : " + Int_sucursal_id + "," + " Numero_Registros : " + s.Numero_Registros + "," + " Codigo_Desde : " + Codigo_Desde + "," + " Codigo_Hasta : " + Codigo_Hasta + "," + " Nombre : " + Nombre + "," + " Unidad : " + Unidad + "," + " Costo_Total_Desde : " + Costo_Total_Desde + "," + " Costo_Total_Hasta : " + Costo_Total_Hasta + "," + " Disponible : " + Disponible + " Nombre del Store Procedure: " + "dbo.Apu_Proyecto_ByTotalPaginas " + " Número de Registros: " + s.Numero_Registros;
            return resultado;
        }

        #endregion
        #region Operaciones con datos

        //Inserta
        /// <summary>
        /// Inserta el objeto en la tabla Apu_Material
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Material o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            if (String.IsNullOrEmpty(o.Codigo)) o.GenCodigo(s.Ver_Version_Id);
            o.GenEstado();
            // Controla el error de clave primaria duplicada.
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
                      o.Costo_Parcial,
                      o.Costo_Otros,
                      o.Costo_Transporte,
                      o.Disponible.ToUpper(),
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Material_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Material_Sucursal_Id_Nombre))
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
        /// Borra el objeto de la tabla Apu_Material
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Material o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Unidad,
                    o.Costo_Parcial,
                    o.Costo_Otros,
                    o.Costo_Transporte,
                    o.Disponible,
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

                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Material_Apu_Material))
                {
                    eCaso = new System.Exception("Apu Oferta Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Material_Apu_Material))
                {
                    eCaso = new System.Exception("Apu Oferta Rubro Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Material_Apu_Proyecto_Material))
                {
                    eCaso = new System.Exception("Apu Proyecto Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Material_Apu_Material))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Material");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Material_Apu_Material))
                {
                    eCaso = new System.Exception("Apu Rubro Material");
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
        //Actualiza la tabla Apu_Material
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Material o, Apu_Material original)
        {
            int resultado = 0;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Update = DateTime.Now;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Unidad,
                    o.Costo_Parcial,
                    o.Costo_Otros,
                    o.Costo_Transporte,
                    o.Disponible,
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
                    original.Unidad,
                    original.Costo_Parcial,
                    original.Costo_Otros,
                    original.Costo_Transporte,
                    original.Disponible,
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

                if (e.Message.Contains(TXT_BDD._IX_Apu_Material_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._IX_Apu_Material_Sucursal_Id_Nombre))
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
