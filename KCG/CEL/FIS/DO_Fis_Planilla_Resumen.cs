
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
    /// Tabla:Fis_Planilla_Resumen
    /// </summary>
    public class DO_Fis_Planilla_Resumen
    {
        #region Adapter
        private Fis_Planilla_ResumenTableAdapter _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public Fis_Planilla_ResumenTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Fis_Planilla_ResumenTableAdapter();
                return _Adapter;
            }
        }
        #endregion
        #region Obtención de datos
        //Obtencion de datos
        /// <summary>
        /// Obtiene todos los datos de la tabla Fis_Planilla_Resumen
        /// </summary> 
        /// <returns>Lista de objetos Fis_Planilla_Resumen</returns> 
        public List<Fis_Planilla_Resumen> Get(Scope s)
        {
            string llamada = "";
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_ResumenDataTable tabla =
                Adapter.Get(s.Ver_Version_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: Get " + "Parametros  Enviados en el Método: s " + " Nombre del Store Procedure: " + " Fis_Planilla_Resumen_Get " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_ResumenRow fila in tabla)
                    lista.Add(new Fis_Planilla_Resumen(

                  fila.Id,
                  fila.Codigo,
                  fila.Estado,
                  fila.Descripcion,
                  fila.Tipo_Planilla,
                  fila.Apu_Presupuesto_Id,
                  fila.Fecha_Inicio_Ingreso,
                  fila.Fecha_Inicial,
                  fila.Fecha_Final,
                  fila.Fecha_Ultimo_Ingreso,
                  fila.Porcentaje_Iva,
                  fila.Porcentaje_Retencion,
                  fila.Fecha_Reajuste_Provisional,
                  fila.Fecha_Reajuste_Definitivo,
                  fila.Numero_Planilla,
                  fila.Descripcion_Provisional,
                  fila.Descripcion_Definitiva,
                  fila.Anticipo_Devengar,
                  fila.Fis_Planilla_Total,
                  fila.Anticipo_Devengado,
                  fila.Valor_A_Reajustar,
                  fila.Valor_Iva,
                  fila.Valor_Retencion,
                  fila.Valor_A_Pagar,
                  fila.Factor_Reajuste_Provisional,
                  fila.Valor_Reajuste_Provisional,
                  fila.Valor_Iva_Provisional,
                  fila.Valor_Retencion_Provisional,
                  fila.Valor_A_Pagar_Provisional,
                  fila.Factor_Reajuste_Definitivo,
                  fila.Valor_Reajuste_Definitivo,
                  fila.Valor_Iva_Definitivo,
                  fila.Valor_Retencion_Definitivo,
                  fila.Valor_A_Pagar_Definitivo,
                  fila.Numero_Dias_Periodo,
                  fila.Numero_Dias_Acumulado,
                  fila.Publicacion_Reajuste_Provisional,
                  fila.Publicacion_Reajuste_Definitivo,
                  fila.Contratista_Per_Personal_Nombre,
                  fila.Contratista_Per_Personal_Id,
                  fila.Apu_Presupuesto_Costo_Total,
                  fila.Apu_Presupuesto_Anticipo_Porcentaje,
                  fila.Apu_Presupuesto_Fecha_Oferta_Cierre,
                  fila.Fis_Planilla_Anio,
                  fila.Apu_Presupuesto_Fecha_Pago,
                  fila.Sum_Coeficiente_DIS,
                  fila.Sum_Coeficiente_REA,
                  fila.Sum_SRD_x_Coeficiente_DIS,
                  fila.Sum_SRD_x_Coeficiente_REA,
                  fila.Sum_Costo_Planilla_x_Coeficiente_DIS,
                  fila.Sum_Costo_Planilla_x_Coeficiente_REA,
                  fila.Sum_Coeficiente_Formula_DIS,
                  fila.Sum_Valor_Actual_DIS,
                  fila.Sum_Coeficiente_x_Relacion_DIS,
                  fila.Sum_Coeficiente_Formula_REA,
                  fila.Sum_Valor_Actual_REA,
                  fila.Sum_Coeficiente_x_Relacion_REA,
                  fila.Porcentaje_Reajuste_DIS,
                  fila.Porcentaje_Reajuste_REA,
                  fila.Valor_Del_Reajuste_Provisional,
                  fila.Valor_Del_Reajuste_Definitivo,
                  fila.Sum_Importe_Anterior,
                  fila.Sum_Importe_Anterior_Anticipo,
                  fila.Sum_Importe_Anterior_Iva,
                  fila.Sum_Importe_Anterior_Deducciones,
                  fila.Sum_Importe_Anterior_Pagar,
                  fila.Sum_Importe_Actual,
                  fila.Sum_Importe_Actual_Anticipo,
                  fila.Sum_Importe_Actual_Iva,
                  fila.Sum_Importe_Actual_Deducciones,
                  fila.Sum_Importe_Actual_Pagar,
                  fila.Sum_Importe_Total,
                  fila.Sum_Importe_Total_Anticipo,
                  fila.Sum_Importe_Total_Iva,
                  fila.Sum_Importe_Total_Deducciones,
                  fila.Sum_Importe_Total_Pagar,
                  fila.Sum_Incremento_Monto_1,
                  fila.Sum_Incremento_Monto_2,
                  fila.Porcentaje_Incremento,
                  fila.Total_Costo_Mas_Porcentaje,
                  fila.Porcentaje_Costo_Mas_Porcentaje,
                  fila.Deduccion_Acumulada,
                  fila.Saldo,
                  fila.Sum_Cantidad_Total,
                  fila.Monto_Total_Ejecutarse,
                  fila.Fecha_Ini_Contrato,
                  fila.Anticipo_por_Devengar,
                  fila.Monto_Total,
                  fila.Fis_Catalogo_Fecha_Publicacion_0,
                  fila.Fis_Catalogo_Fecha_Publicacion_1_DIS,
                  fila.Fis_Catalogo_Fecha_Publicacion_1_REA ,
                  fila.Incremento_Real_Obra));
            }
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Resumen> GetById(Scope s, string Fis_Planilla_Id)
        {
            string llamada = "";
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_ResumenDataTable tabla =
                Adapter.GetById(s.Ver_Version_Id, Fis_Planilla_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetById" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Fis_Planilla_Id : " + Fis_Planilla_Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Resumen_ById " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_ResumenRow fila in tabla)
                    lista.Add(new Fis_Planilla_Resumen(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Descripcion,
              fila.Tipo_Planilla,
              fila.Apu_Presupuesto_Id,
              fila.Fecha_Inicio_Ingreso,
              fila.Fecha_Inicial,
              fila.Fecha_Final,
              fila.Fecha_Ultimo_Ingreso,
              fila.Porcentaje_Iva,
              fila.Porcentaje_Retencion,
              fila.Fecha_Reajuste_Provisional,
              fila.Fecha_Reajuste_Definitivo,
              fila.Numero_Planilla,
              fila.Descripcion_Provisional,
              fila.Descripcion_Definitiva,
              fila.Anticipo_Devengar,
              fila.Fis_Planilla_Total,
              fila.Anticipo_Devengado,
              fila.Valor_A_Reajustar,
              fila.Valor_Iva,
              fila.Valor_Retencion,
              fila.Valor_A_Pagar,
              fila.Factor_Reajuste_Provisional,
              fila.Valor_Reajuste_Provisional,
              fila.Valor_Iva_Provisional,
              fila.Valor_Retencion_Provisional,
              fila.Valor_A_Pagar_Provisional,
              fila.Factor_Reajuste_Definitivo,
              fila.Valor_Reajuste_Definitivo,
              fila.Valor_Iva_Definitivo,
              fila.Valor_Retencion_Definitivo,
              fila.Valor_A_Pagar_Definitivo,
              fila.Numero_Dias_Periodo,
              fila.Numero_Dias_Acumulado,
              fila.Publicacion_Reajuste_Provisional,
              fila.Publicacion_Reajuste_Definitivo,
              fila.Contratista_Per_Personal_Nombre,
              fila.Contratista_Per_Personal_Id,
              fila.Apu_Presupuesto_Costo_Total,
              fila.Apu_Presupuesto_Anticipo_Porcentaje,
              fila.Apu_Presupuesto_Fecha_Oferta_Cierre,
              fila.Fis_Planilla_Anio,
              fila.Apu_Presupuesto_Fecha_Pago,
              fila.Sum_Coeficiente_DIS,
              fila.Sum_Coeficiente_REA,
              fila.Sum_SRD_x_Coeficiente_DIS,
              fila.Sum_SRD_x_Coeficiente_REA,
              fila.Sum_Costo_Planilla_x_Coeficiente_DIS,
              fila.Sum_Costo_Planilla_x_Coeficiente_REA,
              fila.Sum_Coeficiente_Formula_DIS,
              fila.Sum_Valor_Actual_DIS,
              fila.Sum_Coeficiente_x_Relacion_DIS,
              fila.Sum_Coeficiente_Formula_REA,
              fila.Sum_Valor_Actual_REA,
              fila.Sum_Coeficiente_x_Relacion_REA,
              fila.Porcentaje_Reajuste_DIS,
              fila.Porcentaje_Reajuste_REA,
              fila.Valor_Del_Reajuste_Provisional,
              fila.Valor_Del_Reajuste_Definitivo,
              fila.Sum_Importe_Anterior,
              fila.Sum_Importe_Anterior_Anticipo,
              fila.Sum_Importe_Anterior_Iva,
              fila.Sum_Importe_Anterior_Deducciones,
              fila.Sum_Importe_Anterior_Pagar,
              fila.Sum_Importe_Actual,
              fila.Sum_Importe_Actual_Anticipo,
              fila.Sum_Importe_Actual_Iva,
              fila.Sum_Importe_Actual_Deducciones,
              fila.Sum_Importe_Actual_Pagar,
              fila.Sum_Importe_Total,
              fila.Sum_Importe_Total_Anticipo,
              fila.Sum_Importe_Total_Iva,
              fila.Sum_Importe_Total_Deducciones,
              fila.Sum_Importe_Total_Pagar,
              fila.Sum_Incremento_Monto_1,
              fila.Sum_Incremento_Monto_2,
              fila.Porcentaje_Incremento,
              fila.Total_Costo_Mas_Porcentaje,
              fila.Porcentaje_Costo_Mas_Porcentaje,
              fila.Deduccion_Acumulada,
              fila.Saldo,
              fila.Sum_Cantidad_Total,
              fila.Monto_Total_Ejecutarse,
              fila.Fecha_Ini_Contrato,
              fila.Anticipo_por_Devengar,
              fila.Monto_Total,
              fila.Fis_Catalogo_Fecha_Publicacion_0,
              fila.Fis_Catalogo_Fecha_Publicacion_1_DIS,
              fila.Fis_Catalogo_Fecha_Publicacion_1_REA,
              fila.Incremento_Real_Obra));
            }
            //Realiza la auditoria
            Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        public List<Fis_Planilla_Resumen> GetByPresupuesto(Scope s, string Apu_Presupuesto_Id)
        {
            string llamada = "";
            List<Fis_Planilla_Resumen> lista = new List<Fis_Planilla_Resumen>();
            //Extrae los datos
            if (s != null)
            {
                Fiscalizacion.Fis_Planilla_ResumenDataTable tabla =
                Adapter.GetByPresupuesto(s.Ver_Version_Id, Apu_Presupuesto_Id);
                //Cuenta  el número  de registros de la tabla
                int numeroRegistros = tabla.Count;
                llamada = "Nombre del Método Utilizado: " + " GetByPresupuesto" + " Parametros  Enviados en el Método: " + "," + " s.Ver_Version_Id : " + s.Ver_Version_Id + "," + " Apu_Presupuesto_Id : " + Apu_Presupuesto_Id + " Nombre del Store Procedure: " + "dbo.Fis_Planilla_Resumen_ByPresupuesto " + " Número de Registros: " + numeroRegistros;
                //Carga en la lista
                foreach (Fiscalizacion.Fis_Planilla_ResumenRow fila in tabla)
                    lista.Add(new Fis_Planilla_Resumen(

              fila.Id,
              fila.Codigo,
              fila.Estado,
              fila.Descripcion,
              fila.Tipo_Planilla,
              fila.Apu_Presupuesto_Id,
              fila.Fecha_Inicio_Ingreso,
              fila.Fecha_Inicial,
              fila.Fecha_Final,
              fila.Fecha_Ultimo_Ingreso,
              fila.Porcentaje_Iva,
              fila.Porcentaje_Retencion,
              fila.Fecha_Reajuste_Provisional,
              fila.Fecha_Reajuste_Definitivo,
              fila.Numero_Planilla,
              fila.Descripcion_Provisional,
              fila.Descripcion_Definitiva,
              fila.Anticipo_Devengar,
              fila.Fis_Planilla_Total,
              fila.Anticipo_Devengado,
              fila.Valor_A_Reajustar,
              fila.Valor_Iva,
              fila.Valor_Retencion,
              fila.Valor_A_Pagar,
              fila.Factor_Reajuste_Provisional,
              fila.Valor_Reajuste_Provisional,
              fila.Valor_Iva_Provisional,
              fila.Valor_Retencion_Provisional,
              fila.Valor_A_Pagar_Provisional,
              fila.Factor_Reajuste_Definitivo,
              fila.Valor_Reajuste_Definitivo,
              fila.Valor_Iva_Definitivo,
              fila.Valor_Retencion_Definitivo,
              fila.Valor_A_Pagar_Definitivo,
              fila.Numero_Dias_Periodo,
              fila.Numero_Dias_Acumulado,
              fila.Publicacion_Reajuste_Provisional,
              fila.Publicacion_Reajuste_Definitivo,
              fila.Contratista_Per_Personal_Nombre,
              fila.Contratista_Per_Personal_Id,
              fila.Apu_Presupuesto_Costo_Total,
              fila.Apu_Presupuesto_Anticipo_Porcentaje,
              fila.Apu_Presupuesto_Fecha_Oferta_Cierre,
              fila.Fis_Planilla_Anio,
              fila.Apu_Presupuesto_Fecha_Pago,
              fila.Sum_Coeficiente_DIS,
              fila.Sum_Coeficiente_REA,
              fila.Sum_SRD_x_Coeficiente_DIS,
              fila.Sum_SRD_x_Coeficiente_REA,
              fila.Sum_Costo_Planilla_x_Coeficiente_DIS,
              fila.Sum_Costo_Planilla_x_Coeficiente_REA,
              fila.Sum_Coeficiente_Formula_DIS,
              fila.Sum_Valor_Actual_DIS,
              fila.Sum_Coeficiente_x_Relacion_DIS,
              fila.Sum_Coeficiente_Formula_REA,
              fila.Sum_Valor_Actual_REA,
              fila.Sum_Coeficiente_x_Relacion_REA,
              fila.Porcentaje_Reajuste_DIS,
              fila.Porcentaje_Reajuste_REA,
              fila.Valor_Del_Reajuste_Provisional,
              fila.Valor_Del_Reajuste_Definitivo,
              fila.Sum_Importe_Anterior,
              fila.Sum_Importe_Anterior_Anticipo,
              fila.Sum_Importe_Anterior_Iva,
              fila.Sum_Importe_Anterior_Deducciones,
              fila.Sum_Importe_Anterior_Pagar,
              fila.Sum_Importe_Actual,
              fila.Sum_Importe_Actual_Anticipo,
              fila.Sum_Importe_Actual_Iva,
              fila.Sum_Importe_Actual_Deducciones,
              fila.Sum_Importe_Actual_Pagar,
              fila.Sum_Importe_Total,
              fila.Sum_Importe_Total_Anticipo,
              fila.Sum_Importe_Total_Iva,
              fila.Sum_Importe_Total_Deducciones,
              fila.Sum_Importe_Total_Pagar,
              fila.Sum_Incremento_Monto_1,
              fila.Sum_Incremento_Monto_2,
              fila.Porcentaje_Incremento,
              fila.Total_Costo_Mas_Porcentaje,
              fila.Porcentaje_Costo_Mas_Porcentaje,
              fila.Deduccion_Acumulada,
              fila.Saldo,
              fila.Sum_Cantidad_Total,
              fila.Monto_Total_Ejecutarse,
              fila.Fecha_Ini_Contrato,
              fila.Anticipo_por_Devengar,
              fila.Monto_Total,
              fila.Fis_Catalogo_Fecha_Publicacion_0,
              fila.Fis_Catalogo_Fecha_Publicacion_1_DIS,
              fila.Fis_Catalogo_Fecha_Publicacion_1_REA,
              fila.Incremento_Real_Obra));
            }
            //Realiza la auditoria
            Auditar.Registro(s, llamada, lista, Textos._AUDITAR_ACCION_SELECT_SEL);
            //Devuleve la Lista
            return lista;
        }
        #endregion
        
    }
}
