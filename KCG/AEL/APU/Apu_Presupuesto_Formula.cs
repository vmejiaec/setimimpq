
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto_Formula : Entidad
    {
        // Atributos
        private String _Apu_Presupuesto_Id;
        private String _Apu_Indice_Id;
        private String _Apu_Indice_Codigo;
        private String _Apu_Indice_Nombre;
        private Decimal _Costo_Total;
        private Decimal _Coeficiente;
        private String _Letra;
        private Decimal _Costo_Actual;
        private Decimal _Costo_Planilla;
        private Decimal _Relacion;
        private Decimal _Coeficiente_X_Relacion;
        private String _Fis_Catalogo_Nombre;
        private String _Fis_Catalogo_Id;

        // Propiedades de la clase
        public String Apu_Presupuesto_Id
        {
            get { return _Apu_Presupuesto_Id; }
            set { _Apu_Presupuesto_Id = value; }
        }

        public String Apu_Indice_Id
        {
            get { return _Apu_Indice_Id; }
            set { _Apu_Indice_Id = value; }
        }

        public String Apu_Indice_Codigo
        {
            get { return _Apu_Indice_Codigo; }
            set { _Apu_Indice_Codigo = value; }
        }

        public String Apu_Indice_Nombre
        {
            get { return _Apu_Indice_Nombre; }
            set { _Apu_Indice_Nombre = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public Decimal Coeficiente
        {
            get { return _Coeficiente; }
            set { _Coeficiente = value; }
        }

        public String Letra
        {
            get { return _Letra; }
            set { _Letra = value; }
        }

        public Decimal Costo_Actual
        {
            get { return _Costo_Actual; }
            set { _Costo_Actual = value; }
        }

        public Decimal Costo_Planilla
        {
            get { return _Costo_Planilla; }
            set { _Costo_Planilla = value; }
        }

        public Decimal Relacion
        {
            get { return _Relacion; }
            set { _Relacion = value; }
        }

        public Decimal Coeficiente_X_Relacion
        {
            get { return _Coeficiente_X_Relacion; }
            set { _Coeficiente_X_Relacion = value; }
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

        // Constructor
        public Apu_Presupuesto_Formula()
        {
        }
        public Apu_Presupuesto_Formula(String _Id, String _Codigo,  String _Estado, String _Apu_Presupuesto_Id, String _Apu_Indice_Id, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Costo_Total, Decimal _Coeficiente, String _Letra, Decimal _Costo_Actual, Decimal _Costo_Planilla, Decimal _Relacion, Decimal _Coeficiente_X_Relacion, String _Fis_Catalogo_Nombre, String _Fis_Catalogo_Id)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Presupuesto_Id = _Apu_Presupuesto_Id;
            this._Apu_Indice_Id = _Apu_Indice_Id;
            this._Apu_Indice_Codigo = _Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = _Apu_Indice_Nombre;
            this._Costo_Total = _Costo_Total;
            this._Coeficiente = _Coeficiente;
            this._Letra = _Letra;
            this._Costo_Actual = _Costo_Actual;
            this._Costo_Planilla = _Costo_Planilla;
            this._Relacion = _Relacion;
            this._Coeficiente_X_Relacion = _Coeficiente_X_Relacion;
            this._Fis_Catalogo_Nombre = _Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Id = _Fis_Catalogo_Id;
        }
        public Apu_Presupuesto_Formula(Apu_Presupuesto_Formula o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apu_Presupuesto_Id = o.Apu_Presupuesto_Id;
            this._Apu_Indice_Id = o.Apu_Indice_Id;
            this._Apu_Indice_Codigo = o.Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = o.Apu_Indice_Nombre;
            this._Costo_Total = o.Costo_Total;
            this._Coeficiente = o.Coeficiente;
            this._Letra = o.Letra;
            this._Costo_Actual = o.Costo_Actual;
            this._Costo_Planilla = o.Costo_Planilla;
            this._Relacion = o.Relacion;
            this._Coeficiente_X_Relacion = o.Coeficiente_X_Relacion;
            this._Fis_Catalogo_Nombre = o.Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Id = o.Fis_Catalogo_Id;
        }
    }
}
