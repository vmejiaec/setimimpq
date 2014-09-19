
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
    /// Tabla:Apu_Mano_Obra
    /// </summary>
    public class DO_Apu_Mano_Obra
    {
        #region Adapter
        private Apu_Mano_ObraTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_Mano_ObraTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_Mano_ObraTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Mano_Obra
        /// </summary> 
        /// <returns>Lista de objetos Apu_Mano_Obra</returns> 
        public List<Apu_Mano_Obra> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Mano_Obra_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

                  fila.Id,
                  fila.Codigo,
                  fila.Nombre,
                  fila.Estado,
                  fila.Disponible,
                  fila.Costo_Diario,
                  fila.Apu_Categoria_Id,
                  fila.Int_Sucursal_Id,
                  fila.Int_Moneda_Id,
                  fila.Fecha_Creacion,
                  fila.Creacion_Per_Personal_Id,
                  fila.Fecha_Update,
                  fila.Update_Per_Personal_Id,
                  fila.Apu_Categoria_Codigo,
                  fila.Apu_Categoria_Nombre,
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
                  fila.Update_Per_Personal_Codigo,
                  fila.Update_Per_Personal_Nombre,
                  fila.Costo_Hora,
                  fila.Disponible_Nombre,
                  fila.Estado_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByCodigo(Scope s, string Codigo)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByCodigo(s.Ver_Version_Id, Codigo);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByCodigo" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Codigo : " + Codigo + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByCodigo " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByEmpresa(Scope s)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByEmpresa(s.Ver_Version_Id, s.Int_Empresa_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByEmpresa" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Empresa_Id : " + s.Int_Empresa_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByEmpresa " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByLikeNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByLikeNombre(s.Ver_Version_Id, Nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByLikeNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByLikeNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByNombre(Scope s, string Nombre, string int_sucursal_Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByNombre(s.Ver_Version_Id, Nombre, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByNombre" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " nombre : " + Nombre + "," + " int_sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByNombre " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByOfertaRubroManoObra(Scope s, string Apu_Oferta_Rubro_Id, string Apu_Mano_Obra_Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByOfertaRubroManoObra(s.Ver_Version_Id, Apu_Oferta_Rubro_Id, Apu_Mano_Obra_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOfertaRubroManoObra" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Oferta_Rubro_id : " + Apu_Oferta_Rubro_Id + "," + " Apu_Mano_Obra_Id : " + Apu_Mano_Obra_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByOfertaRubroManoObra " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByProyectoRubroMano_Obra(Scope s, string Apu_Proyecto_Rubro_Id, string Apu_Mano_Obra_Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetByProyectoRubroMano_Obra(s.Ver_Version_Id, Apu_Proyecto_Rubro_Id, Apu_Mano_Obra_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByProyectoRubroMano_Obra" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Proyecto_Rubro_id : " + Apu_Proyecto_Rubro_Id + "," + " Apu_Mano_Obra_Id : " + Apu_Mano_Obra_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByProyectoRubroMano_Obra " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetBySucursal(Scope s, string Int_Sucursal_Id)
        {
            string llamada = "";
            List<Apu_Mano_Obra> lista = new List<Apu_Mano_Obra>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_Mano_ObraDataTable tabla =
                Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Sucursal_id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_BySucursal " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_Mano_ObraRow fila in tabla)
                    lista.Add(new Apu_Mano_Obra(

              fila.Id,
              fila.Codigo,
              fila.Nombre,
              fila.Estado,
              fila.Disponible,
              fila.Costo_Diario,
              fila.Apu_Categoria_Id,
              fila.Int_Sucursal_Id,
              fila.Int_Moneda_Id,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Apu_Categoria_Codigo,
              fila.Apu_Categoria_Nombre,
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
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Costo_Hora,
              fila.Disponible_Nombre,
              fila.Estado_Nombre));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Mano_Obra> GetByLikeNombreCatalogo( Scope s , string Fis_Catalogo_Id, string Nombre)
          {
          string llamada = "";
          List <Apu_Mano_Obra> lista= new List <Apu_Mano_Obra> ();
          //Extrae los datos
          if(s != null)
          {
              Apu.Apu_Mano_ObraDataTable tabla =
              Adapter.GetByLikeNombreCatalogo(s.Ver_Version_Id, Fis_Catalogo_Id, Nombre);
          //Cuenta  el número  de registros de la tabla
          int numeroRegistros = tabla.Count;
          llamada = "Nombre del Método Utilizado: " + " GetByLikeNombreCatalogo" + " Parametros  Enviados en el Método: "+ "," + " s.Ver_Version_Id : " + s.Ver_Version_Id+ "," + " Fis_Catalogo_Id : " + Fis_Catalogo_Id+ "," + " Nombre : " + Nombre  + " Nombre del Store Procedure: " + "dbo.Apu_Mano_Obra_ByLikeNomCatalogo " + " Número de Registros: " + numeroRegistros;
          //Carga en la lista
          foreach (Apu.Apu_Mano_ObraRow fila in tabla)
          lista.Add(new Apu_Mano_Obra(          
                        fila.Id,
                        fila.Codigo,
                        fila.Nombre,
                        fila.Estado,
                        fila.Disponible,
                        fila.Costo_Diario,
                        fila.Apu_Categoria_Id,
                        fila.Int_Sucursal_Id,
                        fila.Int_Moneda_Id,
                        fila.Fecha_Creacion,
                        fila.Creacion_Per_Personal_Id,
                        fila.Fecha_Update,
                        fila.Update_Per_Personal_Id,
                        fila.Apu_Categoria_Codigo,
                        fila.Apu_Categoria_Nombre,
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
                        fila.Update_Per_Personal_Codigo,
                        fila.Update_Per_Personal_Nombre,
                        fila.Costo_Hora,
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
        /// Inserta el objeto en la tabla Apu_Mano_Obra
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Mano_Obra o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);
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
                      o.Disponible,
                      o.Costo_Diario,
                      o.Apu_Categoria_Id,
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
                            if (e.Message.Contains(TXT_BDD._IX_Apu_Mano_Obra_Codigo))
                            {
                                eCaso = new System.Exception("");
                                otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                                throw (otroEX);
                            }

                            if (e.Message.Contains(TXT_BDD._IX_Apu_Mano_Obra_Nombre_Sucursal_Id))
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
        /// Borra el objeto de la tabla Apu_Mano_Obra
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Mano_Obra o)
        {
            int resultado = 0;
            try
            {
                resultado = Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Nombre,
                    o.Disponible,
                    o.Costo_Diario,
                    o.Apu_Categoria_Id,
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

                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Mano_Obra_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Oferta Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Oferta_Rubro_Mano_Obra_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Oferta Rubro Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Parametros_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Parametros");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Mano_Obra_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Proyecto Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Proyecto_Rubro_Mano_Obra_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Proyecto Rubro Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Apu_Rubro_Mano_Obra_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Rubro Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }
                if (e.Message.Contains(TXT_BDD._FK_Fis_Catalogo_M_Obra_Apu_M_Obr))
                {
                    eCaso = new System.Exception("Fis Catalogo Mano Obra");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Apu_Mano_Obra))
                {
                    eCaso = new System.Exception("Apu Presupuesto Mano Obra");
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
        //Actualiza la tabla Apu_Mano_Obra
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Mano_Obra o, Apu_Mano_Obra original)
        {
            int resultado = 0;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Fecha_Update = DateTime.Now;
            if (o.Apu_Categoria_Nombre == null)
                o.Apu_Categoria_Id = null;
            try
            {
                resultado = Adapter.Update(
                    o.Id,
                    o.Codigo,
                    o.Nombre.ToUpper(),
                    o.Disponible,
                    o.Costo_Diario,
                    o.Apu_Categoria_Id,
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
                    original.Costo_Diario,
                    original.Apu_Categoria_Id,
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

                if (e.Message.Contains(TXT_BDD._IX_Apu_Mano_Obra_Codigo))
                {
                    eCaso = new System.Exception("");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ32, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._IX_Apu_Mano_Obra_Nombre_Sucursal_Id))
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
