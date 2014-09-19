
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Planilla : Entidad
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
        private String _Provisional_Fis_Catalogo_Id;
        private String _Definitivo_Fis_Catalogo_Id;
        private DateTime _Fecha_Pago;
        private String _Apu_Presupuesto_Apu_Origen_Id;
        private String _Apu_Presupuesto_Codigo;
        private String _Apu_Presupuesto_Nombre;
        private String _Tipo_Nombre;
        private String _Estado_Nombre;
        private Decimal _Total;
        private String _Apu_Presupuesto_Codigo_Institucional;
        private String _Contratista_Per_Personal_Nombre;
        private Int32 _Fis_Planilla_Anio;
        private Decimal _Apu_Presupuesto_Costo_Total;
        private Int32 _Numero_Dias_Periodo;
        private DateTime _Fecha_Contrato_Inicial;
        private Int32 _Apu_Presupuesto_Plazo;
        private DateTime _Fecha_Contrato_Final;
        private Decimal _Deduccion_Anticipo;
        private DateTime _Provisional_Fis_Catalogo_Fecha_Publicacion;
        private DateTime _Definitivo_Fis_Catalogo_Fecha_Publicacion;

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

        public String Provisional_Fis_Catalogo_Id
        {
            get { return _Provisional_Fis_Catalogo_Id; }
            set { _Provisional_Fis_Catalogo_Id = value; }
        }

        public String Definitivo_Fis_Catalogo_Id
        {
            get { return _Definitivo_Fis_Catalogo_Id; }
            set { _Definitivo_Fis_Catalogo_Id = value; }
        }

        public DateTime Fecha_Pago
        {
            get { return _Fecha_Pago; }
            set { _Fecha_Pago = value; }
        }

        public String Apu_Presupuesto_Apu_Origen_Id
        {
            get { return _Apu_Presupuesto_Apu_Origen_Id; }
            set { _Apu_Presupuesto_Apu_Origen_Id = value; }
        }

        public String Apu_Presupuesto_Codigo
        {
            get { return _Apu_Presupuesto_Codigo; }
            set { _Apu_Presupuesto_Codigo = value; }
        }

        public String Apu_Presupuesto_Nombre
        {
            get { return _Apu_Presupuesto_Nombre; }
            set { _Apu_Presupuesto_Nombre = value; }
        }

        public String Tipo_Nombre
        {
            get { return _Tipo_Nombre; }
            set { _Tipo_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        public Decimal Total
        {
            get { return _Total; }
            set { _Total = value; }
        }

        public String Apu_Presupuesto_Codigo_Institucional
        {
            get { return _Apu_Presupuesto_Codigo_Institucional; }
            set { _Apu_Presupuesto_Codigo_Institucional = value; }
        }

        public String Contratista_Per_Personal_Nombre
        {
            get { return _Contratista_Per_Personal_Nombre; }
            set { _Contratista_Per_Personal_Nombre = value; }
        }

        public Int32 Fis_Planilla_Anio
        {
            get { return _Fis_Planilla_Anio; }
            set { _Fis_Planilla_Anio = value; }
        }

        public Decimal Apu_Presupuesto_Costo_Total
        {
            get { return _Apu_Presupuesto_Costo_Total; }
            set { _Apu_Presupuesto_Costo_Total = value; }
        }

        public Int32 Numero_Dias_Periodo
        {
            get { return _Numero_Dias_Periodo; }
            set { _Numero_Dias_Periodo = value; }
        }

        public DateTime Fecha_Contrato_Inicial
        {
            get { return _Fecha_Contrato_Inicial; }
            set { _Fecha_Contrato_Inicial = value; }
        }

        public Int32 Apu_Presupuesto_Plazo
        {
            get { return _Apu_Presupuesto_Plazo; }
            set { _Apu_Presupuesto_Plazo = value; }
        }

        public DateTime Fecha_Contrato_Final
        {
            get { return _Fecha_Contrato_Final; }
            set { _Fecha_Contrato_Final = value; }
        }

        public Decimal Deduccion_Anticipo
        {
            get { return _Deduccion_Anticipo; }
            set { _Deduccion_Anticipo = value; }
        }

        public DateTime Provisional_Fis_Catalogo_Fecha_Publicacion
        {
            get { return _Provisional_Fis_Catalogo_Fecha_Publicacion; }
            set { _Provisional_Fis_Catalogo_Fecha_Publicacion = value; }
        }

        public DateTime Definitivo_Fis_Catalogo_Fecha_Publicacion
        {
            get { return _Definitivo_Fis_Catalogo_Fecha_Publicacion; }
            set { _Definitivo_Fis_Catalogo_Fecha_Publicacion = value; }
        }

        // Constructor
        public Fis_Planilla()
        {
        }
        public Fis_Planilla(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Tipo_Planilla, String _Apu_Presupuesto_Id, DateTime _Fecha_Inicio_Ingreso, DateTime _Fecha_Inicial, DateTime _Fecha_Final, DateTime _Fecha_Ultimo_Ingreso, Decimal _Porcentaje_Iva, Decimal _Porcentaje_Retencion, DateTime _Fecha_Reajuste_Provisional, DateTime _Fecha_Reajuste_Definitivo, String _Numero_Planilla, String _Descripcion_Provisional, String _Descripcion_Definitiva, Decimal _Anticipo_Devengar, String _Provisional_Fis_Catalogo_Id, String _Definitivo_Fis_Catalogo_Id, DateTime _Fecha_Pago, String _Apu_Presupuesto_Apu_Origen_Id, String _Apu_Presupuesto_Codigo, String _Apu_Presupuesto_Nombre, String _Tipo_Nombre, String _Estado_Nombre, Decimal _Total, String _Apu_Presupuesto_Codigo_Institucional, String _Contratista_Per_Personal_Nombre, Int32 _Fis_Planilla_Anio, Decimal _Apu_Presupuesto_Costo_Total, Int32 _Numero_Dias_Periodo, DateTime _Fecha_Contrato_Inicial, Int32 _Apu_Presupuesto_Plazo, DateTime _Fecha_Contrato_Final, Decimal _Deduccion_Anticipo, DateTime _Provisional_Fis_Catalogo_Fecha_Publicacion, DateTime _Definitivo_Fis_Catalogo_Fecha_Publicacion)
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
            this._Provisional_Fis_Catalogo_Id = _Provisional_Fis_Catalogo_Id;
            this._Definitivo_Fis_Catalogo_Id = _Definitivo_Fis_Catalogo_Id;
            this._Fecha_Pago = _Fecha_Pago;
            this._Apu_Presupuesto_Apu_Origen_Id = _Apu_Presupuesto_Apu_Origen_Id;
            this._Apu_Presupuesto_Codigo = _Apu_Presupuesto_Codigo;
            this._Apu_Presupuesto_Nombre = _Apu_Presupuesto_Nombre;
            this._Tipo_Nombre = _Tipo_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Total = _Total;
            this._Apu_Presupuesto_Codigo_Institucional = _Apu_Presupuesto_Codigo_Institucional;
            this._Contratista_Per_Personal_Nombre = _Contratista_Per_Personal_Nombre;
            this._Fis_Planilla_Anio = _Fis_Planilla_Anio;
            this._Apu_Presupuesto_Costo_Total = _Apu_Presupuesto_Costo_Total;
            this._Numero_Dias_Periodo = _Numero_Dias_Periodo;
            this._Fecha_Contrato_Inicial = _Fecha_Contrato_Inicial;
            this._Apu_Presupuesto_Plazo = _Apu_Presupuesto_Plazo;
            this._Fecha_Contrato_Final = _Fecha_Contrato_Final;
            this._Deduccion_Anticipo = _Deduccion_Anticipo;
            this._Provisional_Fis_Catalogo_Fecha_Publicacion = _Provisional_Fis_Catalogo_Fecha_Publicacion;
            this._Definitivo_Fis_Catalogo_Fecha_Publicacion = _Definitivo_Fis_Catalogo_Fecha_Publicacion;
        }
        public Fis_Planilla(Fis_Planilla o)
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
            this._Provisional_Fis_Catalogo_Id = o.Provisional_Fis_Catalogo_Id;
            this._Definitivo_Fis_Catalogo_Id = o.Definitivo_Fis_Catalogo_Id;
            this._Fecha_Pago = o.Fecha_Pago;
            this._Apu_Presupuesto_Apu_Origen_Id = o.Apu_Presupuesto_Apu_Origen_Id;
            this._Apu_Presupuesto_Codigo = o.Apu_Presupuesto_Codigo;
            this._Apu_Presupuesto_Nombre = o.Apu_Presupuesto_Nombre;
            this._Tipo_Nombre = o.Tipo_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Total = o.Total;
            this._Apu_Presupuesto_Codigo_Institucional = o.Apu_Presupuesto_Codigo_Institucional;
            this._Contratista_Per_Personal_Nombre = o.Contratista_Per_Personal_Nombre;
            this._Fis_Planilla_Anio = o.Fis_Planilla_Anio;
            this._Apu_Presupuesto_Costo_Total = o.Apu_Presupuesto_Costo_Total;
            this._Numero_Dias_Periodo = o.Numero_Dias_Periodo;
            this._Fecha_Contrato_Inicial = o.Fecha_Contrato_Inicial;
            this._Apu_Presupuesto_Plazo = o.Apu_Presupuesto_Plazo;
            this._Fecha_Contrato_Final = o.Fecha_Contrato_Final;
            this._Deduccion_Anticipo = o.Deduccion_Anticipo;
            this._Provisional_Fis_Catalogo_Fecha_Publicacion = o.Provisional_Fis_Catalogo_Fecha_Publicacion;
            this._Definitivo_Fis_Catalogo_Fecha_Publicacion = o.Definitivo_Fis_Catalogo_Fecha_Publicacion;
        }
    }
}
