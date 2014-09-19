
using System.Collections.Generic;
using System.Data.SqlClient;
using ADL;
using ADL.FiscalizacionTableAdapters;
using AEL.FIS;
using BEL;

namespace CEL.FIS
{
    /// <summary>
    /// Acceso a la base de datos
    /// Modulo:Fiscalizaci
    /// Tabla:Fis_Fiscalizacion
    /// </summary>
    public class DO_Fis_Fiscalizacion
    {
        #region Adapter
        private Fis_FiscalizacionTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_FiscalizacionTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_FiscalizacionTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Fiscalizacion
        /// </summary> 
        /// <returns>Lista de objetos Fis_Fiscalizacion</returns> 
        public List<Fis_Fiscalizacion> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_FiscalizacionDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Fis_Fiscalizacion_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_FiscalizacionRow fila in tabla)
                    lista.Add(new Fis_Fiscalizacion(

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
                  fila.Codigo_Institucion,
                  fila.Tipo_Contrato,
                  fila.Fecha_Cierre,
                  fila.Fecha_APU,
                  fila.Fecha_Ini_Contrato,
                  fila.Plazo_Contrato,
                  fila.Fecha_Fin_Contrato,
                  fila.Valor_Anticipo,
                  fila.Porcentaje_Anticipo,
                  fila.Coordinador_1,
                  fila.Coordinador_2,
                  fila.Lugar,
                  fila.Publicacion_Base,
                  fila.Publicacion_Base_Def,
                  fila.Contrato_Tipo,
                  fila.Proyecto_Costos,
                  fila.SubProyecto_Costos,
                  fila.Programa_Costos,
                  fila.Tipo_Contrato_Costos,
                  fila.Ubicacion_Costos,
                  fila.Fecha_Indice_Base,
                  fila.Creacion_Per_Personal_Codigo,
                  fila.Creacion_Per_Personal_Nombre,
                  fila.Update_Per_Personal_Codigo,
                  fila.Update_Per_Personal_Nombre,
                  fila.Fiscalizador_Per_Personal_Codigo,
                  fila.Fiscalizador_Per_Personal_Nombre,
                  fila.Contratista_Per_Personal_Codigo,
                  fila.Contratista_Per_Personal_Nombre,
                  fila.Tipo_Fiscalizacion,
                  fila.Tipo_Fiscalizacion_Nombre,
                  fila.Jefe_Fiscalizacion,
                  fila.Jefe_Fiscalizacion_Nombre,
                  fila.Origen_Nombre,
                  fila.Estado_Nombre,
                  fila.Coeficiente_Sumatoria,
                  fila.Cuadrilla_Coeficiente_Sumatoria,
                  fila.SRD_x_Coeficiente_Sumatoria,
                  fila.Costo_Total_Dis,
                  fila.Costo_Total_Rea,
                  fila.SRD_x_Coeficiente_Sumatoria_Rea,
                  fila.Plazo_Ampliacion,
                  fila.Fecha_Final_Ampliacion,
                  fila.Plazo_Ampliacion_Only));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Fiscalizacion> GetByFiscalizacion(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_FiscalizacionDataTable tabla =
                Adapter.GetByFiscalizacion(s.Ver_Version_Id, Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByFiscalizacion" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Id : " + Id + " Nombre del Store Procedure: " + "dbo.Fis_Fiscalizacion_ByFisc " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_FiscalizacionRow fila in tabla)
                    lista.Add(new Fis_Fiscalizacion(

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
              fila.Codigo_Institucion,
              fila.Tipo_Contrato,
              fila.Fecha_Cierre,
              fila.Fecha_APU,
              fila.Fecha_Ini_Contrato,
              fila.Plazo_Contrato,
              fila.Fecha_Fin_Contrato,
              fila.Valor_Anticipo,
              fila.Porcentaje_Anticipo,
              fila.Coordinador_1,
              fila.Coordinador_2,
              fila.Lugar,
              fila.Publicacion_Base,
              fila.Publicacion_Base_Def,
              fila.Contrato_Tipo,
              fila.Proyecto_Costos,
              fila.SubProyecto_Costos,
              fila.Programa_Costos,
              fila.Tipo_Contrato_Costos,
              fila.Ubicacion_Costos,
              fila.Fecha_Indice_Base,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Fiscalizador_Per_Personal_Codigo,
              fila.Fiscalizador_Per_Personal_Nombre,
              fila.Contratista_Per_Personal_Codigo,
              fila.Contratista_Per_Personal_Nombre,
              fila.Tipo_Fiscalizacion,
              fila.Tipo_Fiscalizacion_Nombre,
              fila.Jefe_Fiscalizacion,
              fila.Jefe_Fiscalizacion_Nombre,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.SRD_x_Coeficiente_Sumatoria,
              fila.Costo_Total_Dis,
              fila.Costo_Total_Rea,
              fila.SRD_x_Coeficiente_Sumatoria_Rea,
              fila.Plazo_Ampliacion,
              fila.Fecha_Final_Ampliacion,
              fila.Plazo_Ampliacion_Only));
            }
            //Realiza la auditoria
            Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Fiscalizacion> GetById(Scope s, string Id)
        {
            string llamada = "";
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_FiscalizacionDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Id, s.Per_Personal_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_FiscalizacionRow fila in tabla)
                    lista.Add(new Fis_Fiscalizacion(

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
              fila.Codigo_Institucion,
              fila.Tipo_Contrato,
              fila.Fecha_Cierre,
              fila.Fecha_APU,
              fila.Fecha_Ini_Contrato,
              fila.Plazo_Contrato,
              fila.Fecha_Fin_Contrato,
              fila.Valor_Anticipo,
              fila.Porcentaje_Anticipo,
              fila.Coordinador_1,
              fila.Coordinador_2,
              fila.Lugar,
              fila.Publicacion_Base,
              fila.Publicacion_Base_Def,
              fila.Contrato_Tipo,
              fila.Proyecto_Costos,
              fila.SubProyecto_Costos,
              fila.Programa_Costos,
              fila.Tipo_Contrato_Costos,
              fila.Ubicacion_Costos,
              fila.Fecha_Indice_Base,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Fiscalizador_Per_Personal_Codigo,
              fila.Fiscalizador_Per_Personal_Nombre,
              fila.Contratista_Per_Personal_Codigo,
              fila.Contratista_Per_Personal_Nombre,
              fila.Tipo_Fiscalizacion,
              fila.Tipo_Fiscalizacion_Nombre,
              fila.Jefe_Fiscalizacion,
              fila.Jefe_Fiscalizacion_Nombre,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.SRD_x_Coeficiente_Sumatoria,
              fila.Costo_Total_Dis,
              fila.Costo_Total_Rea,
              fila.SRD_x_Coeficiente_Sumatoria_Rea,
              fila.Plazo_Ampliacion,
              fila.Fecha_Final_Ampliacion,
              fila.Plazo_Ampliacion_Only));
            }
            //Realiza la auditoria
            Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Fiscalizacion> GetBySucursal(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string nombre_proyecto, string estado, string contratista, string fiscalizador)
        {
            string llamada = "";
            List<Fis_Fiscalizacion> lista = new List<Fis_Fiscalizacion>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_FiscalizacionDataTable tabla =
                Adapter.GetBySucursal(s.Ver_Version_Id, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, nombre_proyecto, estado, contratista, fiscalizador,s.Per_Personal_Id, s.Pagina_Actual, s.Numero_Registros);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_FiscalizacionRow fila in tabla)
                    lista.Add(new Fis_Fiscalizacion(

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
              fila.Codigo_Institucion,
              fila.Tipo_Contrato,
              fila.Fecha_Cierre,
              fila.Fecha_APU,
              fila.Fecha_Ini_Contrato,
              fila.Plazo_Contrato,
              fila.Fecha_Fin_Contrato,
              fila.Valor_Anticipo,
              fila.Porcentaje_Anticipo,
              fila.Coordinador_1,
              fila.Coordinador_2,
              fila.Lugar,
              fila.Publicacion_Base,
              fila.Publicacion_Base_Def,
              fila.Contrato_Tipo,
              fila.Proyecto_Costos,
              fila.SubProyecto_Costos,
              fila.Programa_Costos,
              fila.Tipo_Contrato_Costos,
              fila.Ubicacion_Costos,
              fila.Fecha_Indice_Base,
              fila.Creacion_Per_Personal_Codigo,
              fila.Creacion_Per_Personal_Nombre,
              fila.Update_Per_Personal_Codigo,
              fila.Update_Per_Personal_Nombre,
              fila.Fiscalizador_Per_Personal_Codigo,
              fila.Fiscalizador_Per_Personal_Nombre,
              fila.Contratista_Per_Personal_Codigo,
              fila.Contratista_Per_Personal_Nombre,
              fila.Tipo_Fiscalizacion,
              fila.Tipo_Fiscalizacion_Nombre,
              fila.Jefe_Fiscalizacion,
              fila.Jefe_Fiscalizacion_Nombre,
              fila.Origen_Nombre,
              fila.Estado_Nombre,
              fila.Coeficiente_Sumatoria,
              fila.Cuadrilla_Coeficiente_Sumatoria,
              fila.SRD_x_Coeficiente_Sumatoria,
              fila.Costo_Total_Dis,
              fila.Costo_Total_Rea,
              fila.SRD_x_Coeficiente_Sumatoria_Rea,
              fila.Plazo_Ampliacion,
              fila.Fecha_Final_Ampliacion,
              fila.Plazo_Ampliacion_Only));
            }
            //Realiza la auditoria
            Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }

        #region  Procedimiento de SELECT  UNI  TotalPaginas
        public int TotalPaginas(Scope s, string Codigo_Desde, string Codigo_Hasta, string Codigo_Institucion, string nombre_proyecto, string estado, string contratista, string fiscalizador)
        {
            int resultado;
            // Recuperar la lista de objetos a procesar
            List<Fis_Fiscalizacion> lista = null;
            // Ejecutar el procedimiento en bloque
            resultado = (int)Adapter.TotalPaginas(s.Ver_Version_Id, s.Int_Sucursal_Id, Codigo_Desde, Codigo_Hasta, Codigo_Institucion, nombre_proyecto, estado, contratista, fiscalizador,s.Per_Personal_Id, s.Numero_Registros);
            // Construir la cadena de llamada, parámetros y respuesta del procedimiento
            //Retorna el resultado
            return resultado;
        }
        #endregion
        #endregion
        #region Operaciones con datos


        public int Update(Scope s, Fis_Fiscalizacion o, Fis_Fiscalizacion original)
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
            Auditar.Registro(s, o, Textos._AUDITAR_ACCION_UPDATE);
            return resultado;
        }
        #endregion
    }
}
