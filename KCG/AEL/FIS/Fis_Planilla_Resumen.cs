
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Planilla_Resumen : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Tipo_Planilla;
        private String _Apu_Presupuesto_Id;
        private DateTime _Fecha_Inicio_Ingreso;
        private DateTime _Fecha_Inicial;
        private DateTime _Fecha_Final;
        private DateTime _Fecha_Ultimo_Ingreso;
        private Decimal _Porcentaje_Iva;
        private Decimal _Porcentaje_Retencion;
        private DateTime _Fecha_Reajuste_Provisional;
        private DateTime _Fecha_Reajuste_Definitivo;
        private String _Numero_Planilla;
        private String _Descripcion_Provisional;
        private String _Descripcion_Definitiva;
        private Decimal _Anticipo_Devengar;
        private Decimal _Fis_Planilla_Total;
        private Decimal _Anticipo_Devengado;
        private Decimal _Valor_A_Reajustar;
        private Decimal _Valor_Iva;
        private Decimal _Valor_Retencion;
        private Decimal _Valor_A_Pagar;
        private Decimal _Factor_Reajuste_Provisional;
        private Decimal _Valor_Reajuste_Provisional;
        private Decimal _Valor_Iva_Provisional;
        private Decimal _Valor_Retencion_Provisional;
        private Decimal _Valor_A_Pagar_Provisional;
        private Decimal _Factor_Reajuste_Definitivo;
        private Decimal _Valor_Reajuste_Definitivo;
        private Decimal _Valor_Iva_Definitivo;
        private Decimal _Valor_Retencion_Definitivo;
        private Decimal _Valor_A_Pagar_Definitivo;
        private Int32 _Numero_Dias_Periodo;
        private Int32 _Numero_Dias_Acumulado;
        private String _Publicacion_Reajuste_Provisional;
        private String _Publicacion_Reajuste_Definitivo;
        private String _Contratista_Per_Personal_Nombre;
        private String _Contratista_Per_Personal_Id;
        private Decimal _Apu_Presupuesto_Costo_Total;
        private Decimal _Apu_Presupuesto_Anticipo_Porcentaje;
        private DateTime _Apu_Presupuesto_Fecha_Oferta_Cierre;
        private Int32 _Fis_Planilla_Anio;
        private DateTime _Apu_Presupuesto_Fecha_Pago;
        private Decimal _Sum_Coeficiente_DIS;
        private Decimal _Sum_Coeficiente_REA;
        private Decimal _Sum_SRD_x_Coeficiente_DIS;
        private Decimal _Sum_SRD_x_Coeficiente_REA;
        private Decimal _Sum_Costo_Planilla_x_Coeficiente_DIS;
        private Decimal _Sum_Costo_Planilla_x_Coeficiente_REA;
        private Decimal _Sum_Coeficiente_Formula_DIS;
        private Decimal _Sum_Valor_Actual_DIS;
        private Decimal _Sum_Coeficiente_x_Relacion_DIS;
        private Decimal _Sum_Coeficiente_Formula_REA;
        private Decimal _Sum_Valor_Actual_REA;
        private Decimal _Sum_Coeficiente_x_Relacion_REA;
        private Decimal _Porcentaje_Reajuste_DIS;
        private Decimal _Porcentaje_Reajuste_REA;
        private Decimal _Valor_Del_Reajuste_Provisional;
        private Decimal _Valor_Del_Reajuste_Definitivo;
        private Decimal _Sum_Importe_Anterior;
        private Decimal _Sum_Importe_Anterior_Anticipo;
        private Decimal _Sum_Importe_Anterior_Iva;
        private Decimal _Sum_Importe_Anterior_Deducciones;
        private Decimal _Sum_Importe_Anterior_Pagar;
        private Decimal _Sum_Importe_Actual;
        private Decimal _Sum_Importe_Actual_Anticipo;
        private Decimal _Sum_Importe_Actual_Iva;
        private Decimal _Sum_Importe_Actual_Deducciones;
        private Decimal _Sum_Importe_Actual_Pagar;
        private Decimal _Sum_Importe_Total;
        private Decimal _Sum_Importe_Total_Anticipo;
        private Decimal _Sum_Importe_Total_Iva;
        private Decimal _Sum_Importe_Total_Deducciones;
        private Decimal _Sum_Importe_Total_Pagar;
        private Decimal _Sum_Incremento_Monto_1;
        private Decimal _Sum_Incremento_Monto_2;
        private Decimal _Porcentaje_Incremento;
        private Decimal _Total_Costo_Mas_Porcentaje;
        private Decimal _Porcentaje_Costo_Mas_Porcentaje;
        private Decimal _Deduccion_Acumulada;
        private Decimal _Saldo;
        private Decimal _Sum_Cantidad_Total;
        private Decimal _Monto_Total_Ejecutarse;
        private DateTime _Fecha_Ini_Contrato;
        private Decimal _Anticipo_por_Devengar;
        private Decimal _Monto_Total;
        private DateTime _Fis_Catalogo_Fecha_Publicacion_0;
        private DateTime _Fis_Catalogo_Fecha_Publicacion_1_DIS;
        private DateTime _Fis_Catalogo_Fecha_Publicacion_1_REA;
        private Decimal _Incremento_Real_Obra;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Tipo_Planilla
        {
            get { return _Tipo_Planilla; }
            set { _Tipo_Planilla = value; }
        }

        public String Apu_Presupuesto_Id
        {
            get { return _Apu_Presupuesto_Id; }
            set { _Apu_Presupuesto_Id = value; }
        }

        public DateTime Fecha_Inicio_Ingreso
        {
            get { return _Fecha_Inicio_Ingreso; }
            set { _Fecha_Inicio_Ingreso = value; }
        }

        public DateTime Fecha_Inicial
        {
            get { return _Fecha_Inicial; }
            set { _Fecha_Inicial = value; }
        }

        public DateTime Fecha_Final
        {
            get { return _Fecha_Final; }
            set { _Fecha_Final = value; }
        }

        public DateTime Fecha_Ultimo_Ingreso
        {
            get { return _Fecha_Ultimo_Ingreso; }
            set { _Fecha_Ultimo_Ingreso = value; }
        }

        public Decimal Porcentaje_Iva
        {
            get { return _Porcentaje_Iva; }
            set { _Porcentaje_Iva = value; }
        }

        public Decimal Porcentaje_Retencion
        {
            get { return _Porcentaje_Retencion; }
            set { _Porcentaje_Retencion = value; }
        }

        public DateTime Fecha_Reajuste_Provisional
        {
            get { return _Fecha_Reajuste_Provisional; }
            set { _Fecha_Reajuste_Provisional = value; }
        }

        public DateTime Fecha_Reajuste_Definitivo
        {
            get { return _Fecha_Reajuste_Definitivo; }
            set { _Fecha_Reajuste_Definitivo = value; }
        }

        public String Numero_Planilla
        {
            get { return _Numero_Planilla; }
            set { _Numero_Planilla = value; }
        }

        public String Descripcion_Provisional
        {
            get { return _Descripcion_Provisional; }
            set { _Descripcion_Provisional = value; }
        }

        public String Descripcion_Definitiva
        {
            get { return _Descripcion_Definitiva; }
            set { _Descripcion_Definitiva = value; }
        }

        public Decimal Anticipo_Devengar
        {
            get { return _Anticipo_Devengar; }
            set { _Anticipo_Devengar = value; }
        }

        public Decimal Fis_Planilla_Total
        {
            get { return _Fis_Planilla_Total; }
            set { _Fis_Planilla_Total = value; }
        }

        public Decimal Anticipo_Devengado
        {
            get { return _Anticipo_Devengado; }
            set { _Anticipo_Devengado = value; }
        }

        public Decimal Valor_A_Reajustar
        {
            get { return _Valor_A_Reajustar; }
            set { _Valor_A_Reajustar = value; }
        }

        public Decimal Valor_Iva
        {
            get { return _Valor_Iva; }
            set { _Valor_Iva = value; }
        }

        public Decimal Valor_Retencion
        {
            get { return _Valor_Retencion; }
            set { _Valor_Retencion = value; }
        }

        public Decimal Valor_A_Pagar
        {
            get { return _Valor_A_Pagar; }
            set { _Valor_A_Pagar = value; }
        }

        public Decimal Factor_Reajuste_Provisional
        {
            get { return _Factor_Reajuste_Provisional; }
            set { _Factor_Reajuste_Provisional = value; }
        }

        public Decimal Valor_Reajuste_Provisional
        {
            get { return _Valor_Reajuste_Provisional; }
            set { _Valor_Reajuste_Provisional = value; }
        }

        public Decimal Valor_Iva_Provisional
        {
            get { return _Valor_Iva_Provisional; }
            set { _Valor_Iva_Provisional = value; }
        }

        public Decimal Valor_Retencion_Provisional
        {
            get { return _Valor_Retencion_Provisional; }
            set { _Valor_Retencion_Provisional = value; }
        }

        public Decimal Valor_A_Pagar_Provisional
        {
            get { return _Valor_A_Pagar_Provisional; }
            set { _Valor_A_Pagar_Provisional = value; }
        }

        public Decimal Factor_Reajuste_Definitivo
        {
            get { return _Factor_Reajuste_Definitivo; }
            set { _Factor_Reajuste_Definitivo = value; }
        }

        public Decimal Valor_Reajuste_Definitivo
        {
            get { return _Valor_Reajuste_Definitivo; }
            set { _Valor_Reajuste_Definitivo = value; }
        }

        public Decimal Valor_Iva_Definitivo
        {
            get { return _Valor_Iva_Definitivo; }
            set { _Valor_Iva_Definitivo = value; }
        }

        public Decimal Valor_Retencion_Definitivo
        {
            get { return _Valor_Retencion_Definitivo; }
            set { _Valor_Retencion_Definitivo = value; }
        }

        public Decimal Valor_A_Pagar_Definitivo
        {
            get { return _Valor_A_Pagar_Definitivo; }
            set { _Valor_A_Pagar_Definitivo = value; }
        }

        public Int32 Numero_Dias_Periodo
        {
            get { return _Numero_Dias_Periodo; }
            set { _Numero_Dias_Periodo = value; }
        }

        public Int32 Numero_Dias_Acumulado
        {
            get { return _Numero_Dias_Acumulado; }
            set { _Numero_Dias_Acumulado = value; }
        }

        public String Publicacion_Reajuste_Provisional
        {
            get { return _Publicacion_Reajuste_Provisional; }
            set { _Publicacion_Reajuste_Provisional = value; }
        }

        public String Publicacion_Reajuste_Definitivo
        {
            get { return _Publicacion_Reajuste_Definitivo; }
            set { _Publicacion_Reajuste_Definitivo = value; }
        }

        public String Contratista_Per_Personal_Nombre
        {
            get { return _Contratista_Per_Personal_Nombre; }
            set { _Contratista_Per_Personal_Nombre = value; }
        }

        public String Contratista_Per_Personal_Id
        {
            get { return _Contratista_Per_Personal_Id; }
            set { _Contratista_Per_Personal_Id = value; }
        }

        public Decimal Apu_Presupuesto_Costo_Total
        {
            get { return _Apu_Presupuesto_Costo_Total; }
            set { _Apu_Presupuesto_Costo_Total = value; }
        }

        public Decimal Apu_Presupuesto_Anticipo_Porcentaje
        {
            get { return _Apu_Presupuesto_Anticipo_Porcentaje; }
            set { _Apu_Presupuesto_Anticipo_Porcentaje = value; }
        }

        public DateTime Apu_Presupuesto_Fecha_Oferta_Cierre
        {
            get { return _Apu_Presupuesto_Fecha_Oferta_Cierre; }
            set { _Apu_Presupuesto_Fecha_Oferta_Cierre = value; }
        }

        public Int32 Fis_Planilla_Anio
        {
            get { return _Fis_Planilla_Anio; }
            set { _Fis_Planilla_Anio = value; }
        }

        public DateTime Apu_Presupuesto_Fecha_Pago
        {
            get { return _Apu_Presupuesto_Fecha_Pago; }
            set { _Apu_Presupuesto_Fecha_Pago = value; }
        }

        public Decimal Sum_Coeficiente_DIS
        {
            get { return _Sum_Coeficiente_DIS; }
            set { _Sum_Coeficiente_DIS = value; }
        }

        public Decimal Sum_Coeficiente_REA
        {
            get { return _Sum_Coeficiente_REA; }
            set { _Sum_Coeficiente_REA = value; }
        }

        public Decimal Sum_SRD_x_Coeficiente_DIS
        {
            get { return _Sum_SRD_x_Coeficiente_DIS; }
            set { _Sum_SRD_x_Coeficiente_DIS = value; }
        }

        public Decimal Sum_SRD_x_Coeficiente_REA
        {
            get { return _Sum_SRD_x_Coeficiente_REA; }
            set { _Sum_SRD_x_Coeficiente_REA = value; }
        }

        public Decimal Sum_Costo_Planilla_x_Coeficiente_DIS
        {
            get { return _Sum_Costo_Planilla_x_Coeficiente_DIS; }
            set { _Sum_Costo_Planilla_x_Coeficiente_DIS = value; }
        }

        public Decimal Sum_Costo_Planilla_x_Coeficiente_REA
        {
            get { return _Sum_Costo_Planilla_x_Coeficiente_REA; }
            set { _Sum_Costo_Planilla_x_Coeficiente_REA = value; }
        }

        public Decimal Sum_Coeficiente_Formula_DIS
        {
            get { return _Sum_Coeficiente_Formula_DIS; }
            set { _Sum_Coeficiente_Formula_DIS = value; }
        }

        public Decimal Sum_Valor_Actual_DIS
        {
            get { return _Sum_Valor_Actual_DIS; }
            set { _Sum_Valor_Actual_DIS = value; }
        }

        public Decimal Sum_Coeficiente_x_Relacion_DIS
        {
            get { return _Sum_Coeficiente_x_Relacion_DIS; }
            set { _Sum_Coeficiente_x_Relacion_DIS = value; }
        }

        public Decimal Sum_Coeficiente_Formula_REA
        {
            get { return _Sum_Coeficiente_Formula_REA; }
            set { _Sum_Coeficiente_Formula_REA = value; }
        }

        public Decimal Sum_Valor_Actual_REA
        {
            get { return _Sum_Valor_Actual_REA; }
            set { _Sum_Valor_Actual_REA = value; }
        }

        public Decimal Sum_Coeficiente_x_Relacion_REA
        {
            get { return _Sum_Coeficiente_x_Relacion_REA; }
            set { _Sum_Coeficiente_x_Relacion_REA = value; }
        }

        public Decimal Porcentaje_Reajuste_DIS
        {
            get { return _Porcentaje_Reajuste_DIS; }
            set { _Porcentaje_Reajuste_DIS = value; }
        }

        public Decimal Porcentaje_Reajuste_REA
        {
            get { return _Porcentaje_Reajuste_REA; }
            set { _Porcentaje_Reajuste_REA = value; }
        }

        public Decimal Valor_Del_Reajuste_Provisional
        {
            get { return _Valor_Del_Reajuste_Provisional; }
            set { _Valor_Del_Reajuste_Provisional = value; }
        }

        public Decimal Valor_Del_Reajuste_Definitivo
        {
            get { return _Valor_Del_Reajuste_Definitivo; }
            set { _Valor_Del_Reajuste_Definitivo = value; }
        }

        public Decimal Sum_Importe_Anterior
        {
            get { return _Sum_Importe_Anterior; }
            set { _Sum_Importe_Anterior = value; }
        }

        public Decimal Sum_Importe_Anterior_Anticipo
        {
            get { return _Sum_Importe_Anterior_Anticipo; }
            set { _Sum_Importe_Anterior_Anticipo = value; }
        }

        public Decimal Sum_Importe_Anterior_Iva
        {
            get { return _Sum_Importe_Anterior_Iva; }
            set { _Sum_Importe_Anterior_Iva = value; }
        }

        public Decimal Sum_Importe_Anterior_Deducciones
        {
            get { return _Sum_Importe_Anterior_Deducciones; }
            set { _Sum_Importe_Anterior_Deducciones = value; }
        }

        public Decimal Sum_Importe_Anterior_Pagar
        {
            get { return _Sum_Importe_Anterior_Pagar; }
            set { _Sum_Importe_Anterior_Pagar = value; }
        }

        public Decimal Sum_Importe_Actual
        {
            get { return _Sum_Importe_Actual; }
            set { _Sum_Importe_Actual = value; }
        }

        public Decimal Sum_Importe_Actual_Anticipo
        {
            get { return _Sum_Importe_Actual_Anticipo; }
            set { _Sum_Importe_Actual_Anticipo = value; }
        }

        public Decimal Sum_Importe_Actual_Iva
        {
            get { return _Sum_Importe_Actual_Iva; }
            set { _Sum_Importe_Actual_Iva = value; }
        }

        public Decimal Sum_Importe_Actual_Deducciones
        {
            get { return _Sum_Importe_Actual_Deducciones; }
            set { _Sum_Importe_Actual_Deducciones = value; }
        }

        public Decimal Sum_Importe_Actual_Pagar
        {
            get { return _Sum_Importe_Actual_Pagar; }
            set { _Sum_Importe_Actual_Pagar = value; }
        }

        public Decimal Sum_Importe_Total
        {
            get { return _Sum_Importe_Total; }
            set { _Sum_Importe_Total = value; }
        }

        public Decimal Sum_Importe_Total_Anticipo
        {
            get { return _Sum_Importe_Total_Anticipo; }
            set { _Sum_Importe_Total_Anticipo = value; }
        }

        public Decimal Sum_Importe_Total_Iva
        {
            get { return _Sum_Importe_Total_Iva; }
            set { _Sum_Importe_Total_Iva = value; }
        }

        public Decimal Sum_Importe_Total_Deducciones
        {
            get { return _Sum_Importe_Total_Deducciones; }
            set { _Sum_Importe_Total_Deducciones = value; }
        }

        public Decimal Sum_Importe_Total_Pagar
        {
            get { return _Sum_Importe_Total_Pagar; }
            set { _Sum_Importe_Total_Pagar = value; }
        }

        public Decimal Sum_Incremento_Monto_1
        {
            get { return _Sum_Incremento_Monto_1; }
            set { _Sum_Incremento_Monto_1 = value; }
        }

        public Decimal Sum_Incremento_Monto_2
        {
            get { return _Sum_Incremento_Monto_2; }
            set { _Sum_Incremento_Monto_2 = value; }
        }

        public Decimal Porcentaje_Incremento
        {
            get { return _Porcentaje_Incremento; }
            set { _Porcentaje_Incremento = value; }
        }

        public Decimal Total_Costo_Mas_Porcentaje
        {
            get { return _Total_Costo_Mas_Porcentaje; }
            set { _Total_Costo_Mas_Porcentaje = value; }
        }

        public Decimal Porcentaje_Costo_Mas_Porcentaje
        {
            get { return _Porcentaje_Costo_Mas_Porcentaje; }
            set { _Porcentaje_Costo_Mas_Porcentaje = value; }
        }

        public Decimal Deduccion_Acumulada
        {
            get { return _Deduccion_Acumulada; }
            set { _Deduccion_Acumulada = value; }
        }

        public Decimal Saldo
        {
            get { return _Saldo; }
            set { _Saldo = value; }
        }

        public Decimal Sum_Cantidad_Total
        {
            get { return _Sum_Cantidad_Total; }
            set { _Sum_Cantidad_Total = value; }
        }

        public Decimal Monto_Total_Ejecutarse
        {
            get { return _Monto_Total_Ejecutarse; }
            set { _Monto_Total_Ejecutarse = value; }
        }

        public DateTime Fecha_Ini_Contrato
        {
            get { return _Fecha_Ini_Contrato; }
            set { _Fecha_Ini_Contrato = value; }
        }

        public Decimal Anticipo_por_Devengar
        {
            get { return _Anticipo_por_Devengar; }
            set { _Anticipo_por_Devengar = value; }
        }

        public Decimal Monto_Total
        {
            get { return _Monto_Total; }
            set { _Monto_Total = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Publicacion_0
        {
            get { return _Fis_Catalogo_Fecha_Publicacion_0; }
            set { _Fis_Catalogo_Fecha_Publicacion_0 = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Publicacion_1_DIS
        {
            get { return _Fis_Catalogo_Fecha_Publicacion_1_DIS; }
            set { _Fis_Catalogo_Fecha_Publicacion_1_DIS = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Publicacion_1_REA
        {
            get { return _Fis_Catalogo_Fecha_Publicacion_1_REA; }
            set { _Fis_Catalogo_Fecha_Publicacion_1_REA = value; }
        }

        public Decimal Incremento_Real_Obra
        {
            get { return _Incremento_Real_Obra; }
            set { _Incremento_Real_Obra = value; }
        }

        // Constructor
        public Fis_Planilla_Resumen()
        {
        }
        public Fis_Planilla_Resumen(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Tipo_Planilla, String _Apu_Presupuesto_Id, DateTime _Fecha_Inicio_Ingreso, DateTime _Fecha_Inicial, DateTime _Fecha_Final, DateTime _Fecha_Ultimo_Ingreso, Decimal _Porcentaje_Iva, Decimal _Porcentaje_Retencion, DateTime _Fecha_Reajuste_Provisional, DateTime _Fecha_Reajuste_Definitivo, String _Numero_Planilla, String _Descripcion_Provisional, String _Descripcion_Definitiva, Decimal _Anticipo_Devengar, Decimal _Fis_Planilla_Total, Decimal _Anticipo_Devengado, Decimal _Valor_A_Reajustar, Decimal _Valor_Iva, Decimal _Valor_Retencion, Decimal _Valor_A_Pagar, Decimal _Factor_Reajuste_Provisional, Decimal _Valor_Reajuste_Provisional, Decimal _Valor_Iva_Provisional, Decimal _Valor_Retencion_Provisional, Decimal _Valor_A_Pagar_Provisional, Decimal _Factor_Reajuste_Definitivo, Decimal _Valor_Reajuste_Definitivo, Decimal _Valor_Iva_Definitivo, Decimal _Valor_Retencion_Definitivo, Decimal _Valor_A_Pagar_Definitivo, Int32 _Numero_Dias_Periodo, Int32 _Numero_Dias_Acumulado, String _Publicacion_Reajuste_Provisional, String _Publicacion_Reajuste_Definitivo, String _Contratista_Per_Personal_Nombre, String _Contratista_Per_Personal_Id, Decimal _Apu_Presupuesto_Costo_Total, Decimal _Apu_Presupuesto_Anticipo_Porcentaje, DateTime _Apu_Presupuesto_Fecha_Oferta_Cierre, Int32 _Fis_Planilla_Anio, DateTime _Apu_Presupuesto_Fecha_Pago, Decimal _Sum_Coeficiente_DIS, Decimal _Sum_Coeficiente_REA, Decimal _Sum_SRD_x_Coeficiente_DIS, Decimal _Sum_SRD_x_Coeficiente_REA, Decimal _Sum_Costo_Planilla_x_Coeficiente_DIS, Decimal _Sum_Costo_Planilla_x_Coeficiente_REA, Decimal _Sum_Coeficiente_Formula_DIS, Decimal _Sum_Valor_Actual_DIS, Decimal _Sum_Coeficiente_x_Relacion_DIS, Decimal _Sum_Coeficiente_Formula_REA, Decimal _Sum_Valor_Actual_REA, Decimal _Sum_Coeficiente_x_Relacion_REA, Decimal _Porcentaje_Reajuste_DIS, Decimal _Porcentaje_Reajuste_REA, Decimal _Valor_Del_Reajuste_Provisional, Decimal _Valor_Del_Reajuste_Definitivo, Decimal _Sum_Importe_Anterior, Decimal _Sum_Importe_Anterior_Anticipo, Decimal _Sum_Importe_Anterior_Iva, Decimal _Sum_Importe_Anterior_Deducciones, Decimal _Sum_Importe_Anterior_Pagar, Decimal _Sum_Importe_Actual, Decimal _Sum_Importe_Actual_Anticipo, Decimal _Sum_Importe_Actual_Iva, Decimal _Sum_Importe_Actual_Deducciones, Decimal _Sum_Importe_Actual_Pagar, Decimal _Sum_Importe_Total, Decimal _Sum_Importe_Total_Anticipo, Decimal _Sum_Importe_Total_Iva, Decimal _Sum_Importe_Total_Deducciones, Decimal _Sum_Importe_Total_Pagar, Decimal _Sum_Incremento_Monto_1, Decimal _Sum_Incremento_Monto_2, Decimal _Porcentaje_Incremento, Decimal _Total_Costo_Mas_Porcentaje, Decimal _Porcentaje_Costo_Mas_Porcentaje, Decimal _Deduccion_Acumulada, Decimal _Saldo, Decimal _Sum_Cantidad_Total, Decimal _Monto_Total_Ejecutarse, DateTime _Fecha_Ini_Contrato, Decimal _Anticipo_por_Devengar, Decimal _Monto_Total, DateTime _Fis_Catalogo_Fecha_Publicacion_0, DateTime _Fis_Catalogo_Fecha_Publicacion_1_DIS, DateTime _Fis_Catalogo_Fecha_Publicacion_1_REA, Decimal _Incremento_Real_Obra)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Tipo_Planilla = _Tipo_Planilla;
            this._Apu_Presupuesto_Id = _Apu_Presupuesto_Id;
            this._Fecha_Inicio_Ingreso = _Fecha_Inicio_Ingreso;
            this._Fecha_Inicial = _Fecha_Inicial;
            this._Fecha_Final = _Fecha_Final;
            this._Fecha_Ultimo_Ingreso = _Fecha_Ultimo_Ingreso;
            this._Porcentaje_Iva = _Porcentaje_Iva;
            this._Porcentaje_Retencion = _Porcentaje_Retencion;
            this._Fecha_Reajuste_Provisional = _Fecha_Reajuste_Provisional;
            this._Fecha_Reajuste_Definitivo = _Fecha_Reajuste_Definitivo;
            this._Numero_Planilla = _Numero_Planilla;
            this._Descripcion_Provisional = _Descripcion_Provisional;
            this._Descripcion_Definitiva = _Descripcion_Definitiva;
            this._Anticipo_Devengar = _Anticipo_Devengar;
            this._Fis_Planilla_Total = _Fis_Planilla_Total;
            this._Anticipo_Devengado = _Anticipo_Devengado;
            this._Valor_A_Reajustar = _Valor_A_Reajustar;
            this._Valor_Iva = _Valor_Iva;
            this._Valor_Retencion = _Valor_Retencion;
            this._Valor_A_Pagar = _Valor_A_Pagar;
            this._Factor_Reajuste_Provisional = _Factor_Reajuste_Provisional;
            this._Valor_Reajuste_Provisional = _Valor_Reajuste_Provisional;
            this._Valor_Iva_Provisional = _Valor_Iva_Provisional;
            this._Valor_Retencion_Provisional = _Valor_Retencion_Provisional;
            this._Valor_A_Pagar_Provisional = _Valor_A_Pagar_Provisional;
            this._Factor_Reajuste_Definitivo = _Factor_Reajuste_Definitivo;
            this._Valor_Reajuste_Definitivo = _Valor_Reajuste_Definitivo;
            this._Valor_Iva_Definitivo = _Valor_Iva_Definitivo;
            this._Valor_Retencion_Definitivo = _Valor_Retencion_Definitivo;
            this._Valor_A_Pagar_Definitivo = _Valor_A_Pagar_Definitivo;
            this._Numero_Dias_Periodo = _Numero_Dias_Periodo;
            this._Numero_Dias_Acumulado = _Numero_Dias_Acumulado;
            this._Publicacion_Reajuste_Provisional = _Publicacion_Reajuste_Provisional;
            this._Publicacion_Reajuste_Definitivo = _Publicacion_Reajuste_Definitivo;
            this._Contratista_Per_Personal_Nombre = _Contratista_Per_Personal_Nombre;
            this._Contratista_Per_Personal_Id = _Contratista_Per_Personal_Id;
            this._Apu_Presupuesto_Costo_Total = _Apu_Presupuesto_Costo_Total;
            this._Apu_Presupuesto_Anticipo_Porcentaje = _Apu_Presupuesto_Anticipo_Porcentaje;
            this._Apu_Presupuesto_Fecha_Oferta_Cierre = _Apu_Presupuesto_Fecha_Oferta_Cierre;
            this._Fis_Planilla_Anio = _Fis_Planilla_Anio;
            this._Apu_Presupuesto_Fecha_Pago = _Apu_Presupuesto_Fecha_Pago;
            this._Sum_Coeficiente_DIS = _Sum_Coeficiente_DIS;
            this._Sum_Coeficiente_REA = _Sum_Coeficiente_REA;
            this._Sum_SRD_x_Coeficiente_DIS = _Sum_SRD_x_Coeficiente_DIS;
            this._Sum_SRD_x_Coeficiente_REA = _Sum_SRD_x_Coeficiente_REA;
            this._Sum_Costo_Planilla_x_Coeficiente_DIS = _Sum_Costo_Planilla_x_Coeficiente_DIS;
            this._Sum_Costo_Planilla_x_Coeficiente_REA = _Sum_Costo_Planilla_x_Coeficiente_REA;
            this._Sum_Coeficiente_Formula_DIS = _Sum_Coeficiente_Formula_DIS;
            this._Sum_Valor_Actual_DIS = _Sum_Valor_Actual_DIS;
            this._Sum_Coeficiente_x_Relacion_DIS = _Sum_Coeficiente_x_Relacion_DIS;
            this._Sum_Coeficiente_Formula_REA = _Sum_Coeficiente_Formula_REA;
            this._Sum_Valor_Actual_REA = _Sum_Valor_Actual_REA;
            this._Sum_Coeficiente_x_Relacion_REA = _Sum_Coeficiente_x_Relacion_REA;
            this._Porcentaje_Reajuste_DIS = _Porcentaje_Reajuste_DIS;
            this._Porcentaje_Reajuste_REA = _Porcentaje_Reajuste_REA;
            this._Valor_Del_Reajuste_Provisional = _Valor_Del_Reajuste_Provisional;
            this._Valor_Del_Reajuste_Definitivo = _Valor_Del_Reajuste_Definitivo;
            this._Sum_Importe_Anterior = _Sum_Importe_Anterior;
            this._Sum_Importe_Anterior_Anticipo = _Sum_Importe_Anterior_Anticipo;
            this._Sum_Importe_Anterior_Iva = _Sum_Importe_Anterior_Iva;
            this._Sum_Importe_Anterior_Deducciones = _Sum_Importe_Anterior_Deducciones;
            this._Sum_Importe_Anterior_Pagar = _Sum_Importe_Anterior_Pagar;
            this._Sum_Importe_Actual = _Sum_Importe_Actual;
            this._Sum_Importe_Actual_Anticipo = _Sum_Importe_Actual_Anticipo;
            this._Sum_Importe_Actual_Iva = _Sum_Importe_Actual_Iva;
            this._Sum_Importe_Actual_Deducciones = _Sum_Importe_Actual_Deducciones;
            this._Sum_Importe_Actual_Pagar = _Sum_Importe_Actual_Pagar;
            this._Sum_Importe_Total = _Sum_Importe_Total;
            this._Sum_Importe_Total_Anticipo = _Sum_Importe_Total_Anticipo;
            this._Sum_Importe_Total_Iva = _Sum_Importe_Total_Iva;
            this._Sum_Importe_Total_Deducciones = _Sum_Importe_Total_Deducciones;
            this._Sum_Importe_Total_Pagar = _Sum_Importe_Total_Pagar;
            this._Sum_Incremento_Monto_1 = _Sum_Incremento_Monto_1;
            this._Sum_Incremento_Monto_2 = _Sum_Incremento_Monto_2;
            this._Porcentaje_Incremento = _Porcentaje_Incremento;
            this._Total_Costo_Mas_Porcentaje = _Total_Costo_Mas_Porcentaje;
            this._Porcentaje_Costo_Mas_Porcentaje = _Porcentaje_Costo_Mas_Porcentaje;
            this._Deduccion_Acumulada = _Deduccion_Acumulada;
            this._Saldo = _Saldo;
            this._Sum_Cantidad_Total = _Sum_Cantidad_Total;
            this._Monto_Total_Ejecutarse = _Monto_Total_Ejecutarse;
            this._Fecha_Ini_Contrato = _Fecha_Ini_Contrato;
            this._Anticipo_por_Devengar = _Anticipo_por_Devengar;
            this._Monto_Total = _Monto_Total;
            this._Fis_Catalogo_Fecha_Publicacion_0 = _Fis_Catalogo_Fecha_Publicacion_0;
            this._Fis_Catalogo_Fecha_Publicacion_1_DIS = _Fis_Catalogo_Fecha_Publicacion_1_DIS;
            this._Fis_Catalogo_Fecha_Publicacion_1_REA = _Fis_Catalogo_Fecha_Publicacion_1_REA;
            this._Incremento_Real_Obra = _Incremento_Real_Obra;
        }
        public Fis_Planilla_Resumen(Fis_Planilla_Resumen o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Tipo_Planilla = o.Tipo_Planilla;
            this._Apu_Presupuesto_Id = o.Apu_Presupuesto_Id;
            this._Fecha_Inicio_Ingreso = o.Fecha_Inicio_Ingreso;
            this._Fecha_Inicial = o.Fecha_Inicial;
            this._Fecha_Final = o.Fecha_Final;
            this._Fecha_Ultimo_Ingreso = o.Fecha_Ultimo_Ingreso;
            this._Porcentaje_Iva = o.Porcentaje_Iva;
            this._Porcentaje_Retencion = o.Porcentaje_Retencion;
            this._Fecha_Reajuste_Provisional = o.Fecha_Reajuste_Provisional;
            this._Fecha_Reajuste_Definitivo = o.Fecha_Reajuste_Definitivo;
            this._Numero_Planilla = o.Numero_Planilla;
            this._Descripcion_Provisional = o.Descripcion_Provisional;
            this._Descripcion_Definitiva = o.Descripcion_Definitiva;
            this._Anticipo_Devengar = o.Anticipo_Devengar;
            this._Fis_Planilla_Total = o.Fis_Planilla_Total;
            this._Anticipo_Devengado = o.Anticipo_Devengado;
            this._Valor_A_Reajustar = o.Valor_A_Reajustar;
            this._Valor_Iva = o.Valor_Iva;
            this._Valor_Retencion = o.Valor_Retencion;
            this._Valor_A_Pagar = o.Valor_A_Pagar;
            this._Factor_Reajuste_Provisional = o.Factor_Reajuste_Provisional;
            this._Valor_Reajuste_Provisional = o.Valor_Reajuste_Provisional;
            this._Valor_Iva_Provisional = o.Valor_Iva_Provisional;
            this._Valor_Retencion_Provisional = o.Valor_Retencion_Provisional;
            this._Valor_A_Pagar_Provisional = o.Valor_A_Pagar_Provisional;
            this._Factor_Reajuste_Definitivo = o.Factor_Reajuste_Definitivo;
            this._Valor_Reajuste_Definitivo = o.Valor_Reajuste_Definitivo;
            this._Valor_Iva_Definitivo = o.Valor_Iva_Definitivo;
            this._Valor_Retencion_Definitivo = o.Valor_Retencion_Definitivo;
            this._Valor_A_Pagar_Definitivo = o.Valor_A_Pagar_Definitivo;
            this._Numero_Dias_Periodo = o.Numero_Dias_Periodo;
            this._Numero_Dias_Acumulado = o.Numero_Dias_Acumulado;
            this._Publicacion_Reajuste_Provisional = o.Publicacion_Reajuste_Provisional;
            this._Publicacion_Reajuste_Definitivo = o.Publicacion_Reajuste_Definitivo;
            this._Contratista_Per_Personal_Nombre = o.Contratista_Per_Personal_Nombre;
            this._Contratista_Per_Personal_Id = o.Contratista_Per_Personal_Id;
            this._Apu_Presupuesto_Costo_Total = o.Apu_Presupuesto_Costo_Total;
            this._Apu_Presupuesto_Anticipo_Porcentaje = o.Apu_Presupuesto_Anticipo_Porcentaje;
            this._Apu_Presupuesto_Fecha_Oferta_Cierre = o.Apu_Presupuesto_Fecha_Oferta_Cierre;
            this._Fis_Planilla_Anio = o.Fis_Planilla_Anio;
            this._Apu_Presupuesto_Fecha_Pago = o.Apu_Presupuesto_Fecha_Pago;
            this._Sum_Coeficiente_DIS = o.Sum_Coeficiente_DIS;
            this._Sum_Coeficiente_REA = o.Sum_Coeficiente_REA;
            this._Sum_SRD_x_Coeficiente_DIS = o.Sum_SRD_x_Coeficiente_DIS;
            this._Sum_SRD_x_Coeficiente_REA = o.Sum_SRD_x_Coeficiente_REA;
            this._Sum_Costo_Planilla_x_Coeficiente_DIS = o.Sum_Costo_Planilla_x_Coeficiente_DIS;
            this._Sum_Costo_Planilla_x_Coeficiente_REA = o.Sum_Costo_Planilla_x_Coeficiente_REA;
            this._Sum_Coeficiente_Formula_DIS = o.Sum_Coeficiente_Formula_DIS;
            this._Sum_Valor_Actual_DIS = o.Sum_Valor_Actual_DIS;
            this._Sum_Coeficiente_x_Relacion_DIS = o.Sum_Coeficiente_x_Relacion_DIS;
            this._Sum_Coeficiente_Formula_REA = o.Sum_Coeficiente_Formula_REA;
            this._Sum_Valor_Actual_REA = o.Sum_Valor_Actual_REA;
            this._Sum_Coeficiente_x_Relacion_REA = o.Sum_Coeficiente_x_Relacion_REA;
            this._Porcentaje_Reajuste_DIS = o.Porcentaje_Reajuste_DIS;
            this._Porcentaje_Reajuste_REA = o.Porcentaje_Reajuste_REA;
            this._Valor_Del_Reajuste_Provisional = o.Valor_Del_Reajuste_Provisional;
            this._Valor_Del_Reajuste_Definitivo = o.Valor_Del_Reajuste_Definitivo;
            this._Sum_Importe_Anterior = o.Sum_Importe_Anterior;
            this._Sum_Importe_Anterior_Anticipo = o.Sum_Importe_Anterior_Anticipo;
            this._Sum_Importe_Anterior_Iva = o.Sum_Importe_Anterior_Iva;
            this._Sum_Importe_Anterior_Deducciones = o.Sum_Importe_Anterior_Deducciones;
            this._Sum_Importe_Anterior_Pagar = o.Sum_Importe_Anterior_Pagar;
            this._Sum_Importe_Actual = o.Sum_Importe_Actual;
            this._Sum_Importe_Actual_Anticipo = o.Sum_Importe_Actual_Anticipo;
            this._Sum_Importe_Actual_Iva = o.Sum_Importe_Actual_Iva;
            this._Sum_Importe_Actual_Deducciones = o.Sum_Importe_Actual_Deducciones;
            this._Sum_Importe_Actual_Pagar = o.Sum_Importe_Actual_Pagar;
            this._Sum_Importe_Total = o.Sum_Importe_Total;
            this._Sum_Importe_Total_Anticipo = o.Sum_Importe_Total_Anticipo;
            this._Sum_Importe_Total_Iva = o.Sum_Importe_Total_Iva;
            this._Sum_Importe_Total_Deducciones = o.Sum_Importe_Total_Deducciones;
            this._Sum_Importe_Total_Pagar = o.Sum_Importe_Total_Pagar;
            this._Sum_Incremento_Monto_1 = o.Sum_Incremento_Monto_1;
            this._Sum_Incremento_Monto_2 = o.Sum_Incremento_Monto_2;
            this._Porcentaje_Incremento = o.Porcentaje_Incremento;
            this._Total_Costo_Mas_Porcentaje = o.Total_Costo_Mas_Porcentaje;
            this._Porcentaje_Costo_Mas_Porcentaje = o.Porcentaje_Costo_Mas_Porcentaje;
            this._Deduccion_Acumulada = o.Deduccion_Acumulada;
            this._Saldo = o.Saldo;
            this._Sum_Cantidad_Total = o.Sum_Cantidad_Total;
            this._Monto_Total_Ejecutarse = o.Monto_Total_Ejecutarse;
            this._Fecha_Ini_Contrato = o.Fecha_Ini_Contrato;
            this._Anticipo_por_Devengar = o.Anticipo_por_Devengar;
            this._Monto_Total = o.Monto_Total;
            this._Fis_Catalogo_Fecha_Publicacion_0 = o.Fis_Catalogo_Fecha_Publicacion_0;
            this._Fis_Catalogo_Fecha_Publicacion_1_DIS = o.Fis_Catalogo_Fecha_Publicacion_1_DIS;
            this._Fis_Catalogo_Fecha_Publicacion_1_REA = o.Fis_Catalogo_Fecha_Publicacion_1_REA;
            this._Incremento_Real_Obra = o.Incremento_Real_Obra;
        }
    }
}
