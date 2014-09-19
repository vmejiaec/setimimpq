
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
    /// Tabla:Apu_Presupuesto
    /// </summary>
    public class DO_Apu_Presupuesto
    {
        #region Adapter
        private Apu_PresupuestoTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Apu_PresupuestoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Apu_PresupuestoTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Apu_Presupuesto
        /// </summary> 
        /// <returns>Lista de objetos Apu_Presupuesto</returns> 
        public List<Apu_Presupuesto> Get(Scope s)
        {
            string llamada = "";
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_PresupuestoDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Apu_Presupuesto_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_PresupuestoRow fila in tabla)
                    lista.Add(new Apu_Presupuesto(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Apu_Origen_Id,
                  fila.Apu_Origen_Codigo,
                  fila.Apu_Origen_Nombre,
                  fila.Origen,
                  fila.Costo_Directo,
                  fila.Costo_Total,
                  fila.Costo_Indirecto,
                  fila.Costo_Otros,
                  fila.Equipo_Apu_Indice_Id,
                  fila.ManoObra_Apu_Indice_Id,
                  fila.Porcentaje_Costo_Indirecto,
                  fila.Int_Sucursal_Id,
                  fila.Apu_Mano_Obra_Id,
                  fila.Fiscalizador_Per_Personal_Id,
                  fila.Contratista_Per_Personal_Id,
                  fila.Fecha_Indices_Def,
                  fila.Fecha_Creacion,
                  fila.Creacion_Per_Personal_Id,
                  fila.Fecha_Update,
                  fila.Update_Per_Personal_Id,
                  fila.Tipo,
                  fila.Indice_Sumatoria,
                  fila.Coeficiente_Sumatoria,
                  fila.Cuadrilla_Sumatoria,
                  fila.Cuadrilla_Coeficiente_Sumatoria,
                  fila.Suma_Porcentaje_Indice_Transporte,
                  fila.Origen_Nombre,
                  fila.Estado_Nombre,
                  fila.Cadena_Indice,
                  fila.Cadena_Cuadrilla,
                  fila.Tipo_Nombre,
                  fila.Codigo_Institucional));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto> GetById(Scope s, string Id, string Estado)
        {
            string llamada = "";
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_PresupuestoDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id,Estado);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_PresupuestoRow fila in tabla)
                    lista.Add(new Apu_Presupuesto(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Origen_Id,
              fila.Apu_Origen_Codigo,
              fila.Apu_Origen_Nombre,
              fila.Origen,
              fila.Costo_Directo,
              fila.Costo_Total,
              fila.Costo_Indirecto,
              fila.Costo_Otros,
              fila.Equipo_Apu_Indice_Id,
              fila.ManoObra_Apu_Indice_Id,
              fila.Porcentaje_Costo_Indirecto,
              fila.Int_Sucursal_Id,
              fila.Apu_Mano_Obra_Id,
              fila.Fiscalizador_Per_Personal_Id,
              fila.Contratista_Per_Personal_Id,
              fila.Fecha_Indices_Def,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Tipo,
              fila.Indice_Sumatoria,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.Suma_Porcentaje_Indice_Transporte,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Cadena_Indice,
              fila.Cadena_Cuadrilla,
              fila.Tipo_Nombre,
              fila.Codigo_Institucional));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto> GetByOrigen(Scope s, string Apu_Origen_Id)
        {
            string llamada = "";
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_PresupuestoDataTable tabla =
                Adapter.GetByOrigen(s.Ver_Version_Id, Apu_Origen_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByOrigen" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Origen_Id : " + Apu_Origen_Id + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_ByOrigen " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_PresupuestoRow fila in tabla)
                    lista.Add(new Apu_Presupuesto(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Origen_Id,
              fila.Apu_Origen_Codigo,
              fila.Apu_Origen_Nombre,
              fila.Origen,
              fila.Costo_Directo,
              fila.Costo_Total,
              fila.Costo_Indirecto,
              fila.Costo_Otros,
              fila.Equipo_Apu_Indice_Id,
              fila.ManoObra_Apu_Indice_Id,
              fila.Porcentaje_Costo_Indirecto,
              fila.Int_Sucursal_Id,
              fila.Apu_Mano_Obra_Id,
              fila.Fiscalizador_Per_Personal_Id,
              fila.Contratista_Per_Personal_Id,
              fila.Fecha_Indices_Def,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Tipo,
              fila.Indice_Sumatoria,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.Suma_Porcentaje_Indice_Transporte,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Cadena_Indice,
              fila.Cadena_Cuadrilla,
              fila.Tipo_Nombre,
              fila.Codigo_Institucional));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto> GetBySucursal(Scope s)
        {
            string llamada = "";
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_PresupuestoDataTable tabla =
                Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetBySucursal" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Int_Sucursal_Id : " + s.Int_Sucursal_Id + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_BySucursal " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_PresupuestoRow fila in tabla)
                    lista.Add(new Apu_Presupuesto(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Origen_Id,
              fila.Apu_Origen_Codigo,
              fila.Apu_Origen_Nombre,
              fila.Origen,
              fila.Costo_Directo,
              fila.Costo_Total,
              fila.Costo_Indirecto,
              fila.Costo_Otros,
              fila.Equipo_Apu_Indice_Id,
              fila.ManoObra_Apu_Indice_Id,
              fila.Porcentaje_Costo_Indirecto,
              fila.Int_Sucursal_Id,
              fila.Apu_Mano_Obra_Id,
              fila.Fiscalizador_Per_Personal_Id,
              fila.Contratista_Per_Personal_Id,
              fila.Fecha_Indices_Def,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Tipo,
              fila.Indice_Sumatoria,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.Suma_Porcentaje_Indice_Transporte,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Cadena_Indice,
              fila.Cadena_Cuadrilla,
              fila.Tipo_Nombre,
              fila.Codigo_Institucional));
            }
            //Realiza la auditoria
            //Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Apu_Presupuesto> GetByTipoOrigen(Scope s, string Apu_Tipo_Origen)
        {
            string llamada = "";
            List<Apu_Presupuesto> lista = new List<Apu_Presupuesto>();
            //Extrae los datos
            if (s != null)
            {
                Apu.Apu_PresupuestoDataTable tabla =
                Adapter.GetByTipoOrigen(s.Ver_Version_Id, Apu_Tipo_Origen);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByTipoOrigen" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Tipo_Origen : " + Apu_Tipo_Origen + " Nombre del Store Procedure: " + "dbo.Apu_Presupuesto_ByTipoOrigen " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Apu.Apu_PresupuestoRow fila in tabla)
                    lista.Add(new Apu_Presupuesto(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Apu_Origen_Id,
              fila.Apu_Origen_Codigo,
              fila.Apu_Origen_Nombre,
              fila.Origen,
              fila.Costo_Directo,
              fila.Costo_Total,
              fila.Costo_Indirecto,
              fila.Costo_Otros,
              fila.Equipo_Apu_Indice_Id,
              fila.ManoObra_Apu_Indice_Id,
              fila.Porcentaje_Costo_Indirecto,
              fila.Int_Sucursal_Id,
              fila.Apu_Mano_Obra_Id,
              fila.Fiscalizador_Per_Personal_Id,
              fila.Contratista_Per_Personal_Id,
              fila.Fecha_Indices_Def,
              fila.Fecha_Creacion,
              fila.Creacion_Per_Personal_Id,
              fila.Fecha_Update,
              fila.Update_Per_Personal_Id,
              fila.Tipo,
              fila.Indice_Sumatoria,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.Suma_Porcentaje_Indice_Transporte,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Cadena_Indice,
              fila.Cadena_Cuadrilla,
              fila.Tipo_Nombre,
              fila.Codigo_Institucional));
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
        /// Inserta el objeto en la tabla Apu_Presupuesto
        /// </summary>
        /// <param name="s">Variables de ámbito como la versión y la sucursal</param>
        // <returns></returns>
        public string Insert(Scope s, Apu_Presupuesto o)
        {
            // Genera un nuevo Id, codigo y estado.
            o.GenNewId(s.Int_Sucursal_Numero);
            o.GenCodigo(s.Ver_Version_Id);

            o.Creacion_Per_Personal_Id = s.Per_Personal_Id;
            o.Update_Per_Personal_Id = s.Per_Personal_Id;
            o.Int_Sucursal_Id = s.Int_Sucursal_Id;
            o.Tipo = "PRO";
            o.Fecha_Creacion = DateTime.Now;
            o.Fecha_Update = DateTime.Now;
            o.Fecha_Indices_Def = new DateTime(1900, 01, 01);


            // Controla el error de clave primaria duplicada.
            try
            {
                Adapter.Insert(

                      o.Id,
                      o.Codigo,
                      o.Apu_Origen_Id,
                      o.Apu_Origen_Codigo,
                      o.Apu_Origen_Nombre,
                      o.Origen,
                      o.Costo_Directo,
                      o.Costo_Total,
                      o.Costo_Indirecto,
                      o.Costo_Otros,
                      o.Equipo_Apu_Indice_Id,
                      o.ManoObra_Apu_Indice_Id,
                      o.Porcentaje_Costo_Indirecto,
                      o.Int_Sucursal_Id,
                      o.Apu_Mano_Obra_Id,
                      o.Estado,
                      o.Fiscalizador_Per_Personal_Id,
                      o.Contratista_Per_Personal_Id,
                      o.Fecha_Indices_Def,
                      o.Fecha_Creacion,
                      o.Creacion_Per_Personal_Id,
                      o.Fecha_Update,
                      o.Update_Per_Personal_Id,
                      o.Tipo
                );
            }
            catch (SqlException e)
            {
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
                            throw;
                        break;
                    default:
                        throw;
                }
            }
            //Control de Auditoria
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_INSERT);
            //Retorna el Id Insetado
            return o.Id;
        }
        // Borra
        /// <summary>
        /// Borra el objeto de la tabla Apu_Presupuesto
        ///</summary>
        /// <param name="o">Objeto a actualizar</param>
        /// <returns></returns>
        public int Delete(Scope s, Apu_Presupuesto o)
        {
            int resultado = 0;
            try
            {
                Adapter.Delete(
                    o.Id,
                    o.Codigo,
                    o.Apu_Origen_Id,
                    o.Apu_Origen_Codigo,
                    o.Apu_Origen_Nombre,
                    o.Origen,
                    o.Costo_Directo,
                    o.Costo_Total,
                    o.Costo_Indirecto,
                    o.Costo_Otros,
                    o.Equipo_Apu_Indice_Id,
                    o.ManoObra_Apu_Indice_Id,
                    o.Porcentaje_Costo_Indirecto,
                    o.Int_Sucursal_Id,
                    o.Apu_Mano_Obra_Id,
                    o.Estado,
                    o.Fiscalizador_Per_Personal_Id,
                    o.Contratista_Per_Personal_Id,
                    o.Fecha_Indices_Def,
                    o.Fecha_Creacion,
                    o.Creacion_Per_Personal_Id,
                    o.Fecha_Update,
                    o.Update_Per_Personal_Id,
                    o.Tipo);
            }
            catch (SqlException e)
            {
                Exception eCaso;
                Exception otroEX;

                if (e.Message.Contains(TXT_BDD._FK_Fis_Ampliacion_Apu_Presupuesto))
                {
                    eCaso = new System.Exception("Fis Ampliacion");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Cuadrilla_Apu_Presupuesto))
                {
                    eCaso = new System.Exception("Apu Presupuesto Cuadrilla");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Formula_Apu_Presupuesto))
                {
                    eCaso = new System.Exception("Apu Presupuesto Formula");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Apu_Presupuesto_Rubro_Apu_Presupuesto))
                {
                    eCaso = new System.Exception("Apu Presupuesto Rubro");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                if (e.Message.Contains(TXT_BDD._FK_Fis_Planilla_Apu_Presupuesto))
                {
                    eCaso = new System.Exception("Fis Planilla");
                    otroEX = new System.Exception(TXT_Mensajes._MSJ26, eCaso);
                    throw (otroEX);
                }

                eCaso = new System.Exception(e.Message);
                otroEX = new System.Exception(TXT_Mensajes._MSJ34, eCaso);
                throw (otroEX);
            }
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_DELETE);
            return resultado;
        }//Actualiza
        /// <summary>
        //Actualiza la tabla Apu_Presupuesto
        /// </summary>
        /// <param name="o">Objeto que contiene la información a actualizar</param>
        /// <param name="original">Original para concurrencia optimista</param> 
        /// <returns></returns>
        public int Update(Scope s, Apu_Presupuesto o, Apu_Presupuesto original)
        {
            int resultado;
            resultado = Adapter.Update(

                  o.Id,
                  o.Codigo,
                  o.Apu_Origen_Id,
                  o.Apu_Origen_Codigo,
                  o.Apu_Origen_Nombre,
                  o.Origen,
                  o.Costo_Directo,
                  o.Costo_Total,
                  o.Costo_Indirecto,
                  o.Costo_Otros,
                  o.Equipo_Apu_Indice_Id,
                  o.ManoObra_Apu_Indice_Id,
                  o.Porcentaje_Costo_Indirecto,
                  o.Int_Sucursal_Id,
                  o.Apu_Mano_Obra_Id,
                  o.Estado,
                  o.Fiscalizador_Per_Personal_Id,
                  o.Contratista_Per_Personal_Id,
                  o.Fecha_Indices_Def,
                  o.Fecha_Creacion,
                  o.Creacion_Per_Personal_Id,
                  o.Fecha_Update,
                  o.Update_Per_Personal_Id,
                  o.Tipo,
                  original.Id,
                  original.Codigo,
                  original.Apu_Origen_Id,
                  original.Apu_Origen_Codigo,
                  original.Apu_Origen_Nombre,
                  original.Origen,
                  original.Costo_Directo,
                  original.Costo_Total,
                  original.Costo_Indirecto,
                  original.Costo_Otros,
                  original.Equipo_Apu_Indice_Id,
                  original.ManoObra_Apu_Indice_Id,
                  original.Porcentaje_Costo_Indirecto,
                  original.Int_Sucursal_Id,
                  original.Apu_Mano_Obra_Id,
                  original.Estado,
                  original.Fiscalizador_Per_Personal_Id,
                  original.Contratista_Per_Personal_Id,
                  original.Fecha_Indices_Def,
                  original.Fecha_Creacion,
                  original.Creacion_Per_Personal_Id,
                  original.Fecha_Update,
                  original.Update_Per_Personal_Id,
                  original.Tipo

            );
            //Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
