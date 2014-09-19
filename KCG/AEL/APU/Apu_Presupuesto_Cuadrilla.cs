
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto_Cuadrilla : Entidad
    {
        // Atributos
        private String _Apu_Presupuesto_Id;
        private String _Origen;
        private String _Origen_Id;
        private String _Origen_Codigo;
        private String _Origen_Nombre;
        private Decimal _Costo_Total;
        private Decimal _Salario_Real;
        private Decimal _Numero_Trabajadores;
        private Decimal _Coeficiente;
        private Decimal _Costo_Actual;
        private Decimal _SRD_x_Coeficiente;
        private Decimal _Costo_Planilla;
        private Decimal _Costo_Planilla_x_Coeficiente;
        private String _Fis_Catalogo_Nombre;
        private String _Fis_Catalogo_Id;
        private DateTime _Fis_Catalogo_Fecha_Publicacion;

        // Propiedades de la clase
        public String Apu_Presupuesto_Id
        {
            get { return _Apu_Presupuesto_Id; }
            set { _Apu_Presupuesto_Id = value; }
        }

        public String Origen
        {
            get { return _Origen; }
            set { _Origen = value; }
        }

        public String Origen_Id
        {
            get { return _Origen_Id; }
            set { _Origen_Id = value; }
        }

        public String Origen_Codigo
        {
            get { return _Origen_Codigo; }
            set { _Origen_Codigo = value; }
        }

        public String Origen_Nombre
        {
            get { return _Origen_Nombre; }
            set { _Origen_Nombre = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public Decimal Salario_Real
        {
            get { return _Salario_Real; }
            set { _Salario_Real = value; }
        }

        public Decimal Numero_Trabajadores
        {
            get { return _Numero_Trabajadores; }
            set { _Numero_Trabajadores = value; }
        }

        public Decimal Coeficiente
        {
            get { return _Coeficiente; }
            set { _Coeficiente = value; }
        }

        public Decimal Costo_Actual
        {
            get { return _Costo_Actual; }
            set { _Costo_Actual = value; }
        }

        public Decimal SRD_x_Coeficiente
        {
            get { return _SRD_x_Coeficiente; }
            set { _SRD_x_Coeficiente = value; }
        }

        public Decimal Costo_Planilla
        {
            get { return _Costo_Planilla; }
            set { _Costo_Planilla = value; }
        }

        public Decimal Costo_Planilla_x_Coeficiente
        {
            get { return _Costo_Planilla_x_Coeficiente; }
            set { _Costo_Planilla_x_Coeficiente = value; }
        }

        public String Fis_Catalogo_Nombre
        {
            get { return _Fis_Catalogo_Nombre; }
            set { _Fis_Catalogo_Nombre = value; }
        }

        public String Fis_Catalogo_Id
        {
            get { return _Fis_Catalogo_Id; }
            set { _Fis_Catalogo_Id = value; }
        }

        public DateTime Fis_Catalogo_Fecha_Publicacion
        {
            get { return _Fis_Catalogo_Fecha_Publicacion; }
            set { _Fis_Catalogo_Fecha_Publicacion = value; }
        }

        // Constructor
        public Apu_Presupuesto_Cuadrilla()
        {
        }
        public Apu_Presupuesto_Cuadrilla(String _Id, String _Codigo, String _Estado, String _Apu_Presupuesto_Id, String _Origen, String _Origen_Id, String _Origen_Codigo, String _Origen_Nombre, Decimal _Costo_Total, Decimal _Salario_Real, Decimal _Numero_Trabajadores, Decimal _Coeficiente, Decimal _Costo_Actual, Decimal _SRD_x_Coeficiente, Decimal _Costo_Planilla, Decimal _Costo_Planilla_x_Coeficiente, String _Fis_Catalogo_Nombre, String _Fis_Catalogo_Id, DateTime _Fis_Catalogo_Fecha_Publicacion)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Presupuesto_Id = _Apu_Presupuesto_Id;
            this._Origen = _Origen;
            this._Origen_Id = _Origen_Id;
            this._Origen_Codigo = _Origen_Codigo;
            this._Origen_Nombre = _Origen_Nombre;
            this._Costo_Total = _Costo_Total;
            this._Salario_Real = _Salario_Real;
            this._Numero_Trabajadores = _Numero_Trabajadores;
            this._Coeficiente = _Coeficiente;
            this._Costo_Actual = _Costo_Actual;
            this._SRD_x_Coeficiente = _SRD_x_Coeficiente;
            this._Costo_Planilla = _Costo_Planilla;
            this._Costo_Planilla_x_Coeficiente = _Costo_Planilla_x_Coeficiente;
            this._Fis_Catalogo_Nombre = _Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Id = _Fis_Catalogo_Id;
            this._Fis_Catalogo_Fecha_Publicacion = _Fis_Catalogo_Fecha_Publicacion;
        }
        public Apu_Presupuesto_Cuadrilla(Apu_Presupuesto_Cuadrilla o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apu_Presupuesto_Id = o.Apu_Presupuesto_Id;
            this._Origen = o.Origen;
            this._Origen_Id = o.Origen_Id;
            this._Origen_Codigo = o.Origen_Codigo;
            this._Origen_Nombre = o.Origen_Nombre;
            this._Costo_Total = o.Costo_Total;
            this._Salario_Real = o.Salario_Real;
            this._Numero_Trabajadores = o.Numero_Trabajadores;
            this._Coeficiente = o.Coeficiente;
            this._Costo_Actual = o.Costo_Actual;
            this._SRD_x_Coeficiente = o.SRD_x_Coeficiente;
            this._Costo_Planilla = o.Costo_Planilla;
            this._Costo_Planilla_x_Coeficiente = o.Costo_Planilla_x_Coeficiente;
            this._Fis_Catalogo_Nombre = o.Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Id = o.Fis_Catalogo_Id;
            this._Fis_Catalogo_Fecha_Publicacion = o.Fis_Catalogo_Fecha_Publicacion;
        }
    }
}
