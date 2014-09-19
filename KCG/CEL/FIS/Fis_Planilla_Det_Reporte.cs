
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
    /// Tabla:Fis_Planilla_Det_Reporte
    /// </summary>
    public class DO_Fis_Planilla_Det_Reporte
    {
        #region Adapter
        private Fis_Planilla_Det_ReporteTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Planilla_Det_ReporteTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Planilla_Det_ReporteTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Planilla_Det_Reporte
        /// </summary> 
        /// <returns>Lista de objetos Fis_Planilla_Det_Reporte</returns> 
        public List<Fis_Planilla_Det_Reporte> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Planilla_Det_Reporte> lista = new List<Fis_Planilla_Det_Reporte>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_Det_ReporteDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Fis_Planilla_Det_Reporte_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_Det_ReporteRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det_Reporte(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Apu_Prespuesto_Rubro_Id,
                  fila.Costo,
                  fila.Cantidad,
                  fila.Fis_Planilla_Id,
                  fila.Costo_x_Cantidad,
                  fila.Cantidad_Anterior,
                  fila.Cantidad_Actual,
                  fila.Cantidad_Total,
                  fila.Importe_Anterior,
                  fila.Importe_Actual,
                  fila.Importe_Total,
                  fila.Incremento_Cantidad_1,
                  fila.Incremento_Importe_1,
                  fila.Incremento_Cantidad_2,
                  fila.Incremento_Importe_2,
                  fila.Apu_Presupuesto_Rubro_Id,
                  fila.Apu_Presupuesto_Rubro_Codigo,
                  fila.Apu_Presupuesto_Rubro_Estado,
                  fila.Apu_Presupuesto_Rubro_Descripcion,
                  fila.Apu_Prespuesto_Id,
                  fila.Apu_Rubro_Id,
                  fila.Apu_Rubro_Codigo,
                  fila.Apu_Rubro_Nombre,
                  fila.Apu_Rubro_Unidad,
                  fila.Apu_Rubro_Cantidad,
                  fila.Apu_Rubro_Costo_Unitario,
                  fila.Apu_Rubro_Costo_Total,
                  fila.Apu_Subtitulo_Id,
                  fila.Apu_Subtitulo_Nombre,
                  fila.Apu_Titulo_Id,
                  fila.Apu_Titulo_Nombre));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Det_Reporte> GetByPlanilla(Scope s, string Fis_Planilla_Id)
        {
            string llamada = "";
            List<Fis_Planilla_Det_Reporte> lista = new List<Fis_Planilla_Det_Reporte>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_Det_ReporteDataTable tabla =
                Adapter.GetByPlanilla(s.Ver_Version_Id, Fis_Planilla_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPlanilla" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Planilla_Id : " + Fis_Planilla_Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Det_Reporte_ByPlanilla " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_Det_ReporteRow fila in tabla)
                    lista.Add(new Fis_Planilla_Det_Reporte(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Descripcion,
              fila.Apu_Prespuesto_Rubro_Id,
              fila.Costo,
              fila.Cantidad,
              fila.Fis_Planilla_Id,
              fila.Costo_x_Cantidad,
              fila.Cantidad_Anterior,
              fila.Cantidad_Actual,
              fila.Cantidad_Total,
              fila.Importe_Anterior,
              fila.Importe_Actual,
              fila.Importe_Total,
              fila.Incremento_Cantidad_1,
              fila.Incremento_Importe_1,
              fila.Incremento_Cantidad_2,
              fila.Incremento_Importe_2,
              fila.Apu_Presupuesto_Rubro_Id,
              fila.Apu_Presupuesto_Rubro_Codigo,
              fila.Apu_Presupuesto_Rubro_Estado,
              fila.Apu_Presupuesto_Rubro_Descripcion,
              fila.Apu_Prespuesto_Id,
              fila.Apu_Rubro_Id,
              fila.Apu_Rubro_Codigo,
              fila.Apu_Rubro_Nombre,
              fila.Apu_Rubro_Unidad,
              fila.Apu_Rubro_Cantidad,
              fila.Apu_Rubro_Costo_Unitario,
              fila.Apu_Rubro_Costo_Total,
              fila.Apu_Subtitulo_Id,
              fila.Apu_Subtitulo_Nombre,
              fila.Apu_Titulo_Id,
              fila.Apu_Titulo_Nombre));
            }
            //Realiza la auditoria
            ////Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #endregion

    }
}
