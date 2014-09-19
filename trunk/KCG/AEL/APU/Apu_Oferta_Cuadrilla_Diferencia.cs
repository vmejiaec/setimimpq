
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Oferta_Cuadrilla_Diferencia : Entidad
    {
        // Atributos
        private String _Apu_Oferta_Id;
        private String _Apu_Oferta_Codigo;
        private String _Apu_Oferta_Nombre;
        private String _Apu_Oferta_Etapa;
        private String _Apu_Cuadrilla_Codigo;
        private String _Apu_Cuadrilla_Nombre;
        private Int32 _costo_total;
        private Int32 _Costo_Hora;
        private Int32 _Numero_trabajadores;
        private Decimal _Coeficiente;

        // Propiedades de la clase
        public String Apu_Oferta_Id
        {
            get { return _Apu_Oferta_Id; }
            set { _Apu_Oferta_Id = value; }
        }

        public String Apu_Oferta_Codigo
        {
            get { return _Apu_Oferta_Codigo; }
            set { _Apu_Oferta_Codigo = value; }
        }

        public String Apu_Oferta_Nombre
        {
            get { return _Apu_Oferta_Nombre; }
            set { _Apu_Oferta_Nombre = value; }
        }

        public String Apu_Oferta_Etapa
        {
            get { return _Apu_Oferta_Etapa; }
            set { _Apu_Oferta_Etapa = value; }
        }

        public String Apu_Cuadrilla_Codigo
        {
            get { return _Apu_Cuadrilla_Codigo; }
            set { _Apu_Cuadrilla_Codigo = value; }
        }

        public String Apu_Cuadrilla_Nombre
        {
            get { return _Apu_Cuadrilla_Nombre; }
            set { _Apu_Cuadrilla_Nombre = value; }
        }

        public Int32 costo_total
        {
            get { return _costo_total; }
            set { _costo_total = value; }
        }

        public Int32 Costo_Hora
        {
            get { return _Costo_Hora; }
            set { _Costo_Hora = value; }
        }

        public Int32 Numero_trabajadores
        {
            get { return _Numero_trabajadores; }
            set { _Numero_trabajadores = value; }
        }

        public Decimal Coeficiente
        {
            get { return _Coeficiente; }
            set { _Coeficiente = value; }
        }

        // Constructor
        public Apu_Oferta_Cuadrilla_Diferencia()
        {
        }
        public Apu_Oferta_Cuadrilla_Diferencia( String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Cuadrilla_Codigo, String _Apu_Cuadrilla_Nombre, Int32 _costo_total, Int32 _Costo_Hora, Int32 _Numero_trabajadores, Decimal _Coeficiente)
        {
            this._Apu_Oferta_Id = _Apu_Oferta_Id;
            this._Apu_Oferta_Codigo = _Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = _Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = _Apu_Oferta_Etapa;
            this._Apu_Cuadrilla_Codigo = _Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = _Apu_Cuadrilla_Nombre;
            this._costo_total = _costo_total;
            this._Costo_Hora = _Costo_Hora;
            this._Numero_trabajadores = _Numero_trabajadores;
            this._Coeficiente = _Coeficiente;
        }
        public Apu_Oferta_Cuadrilla_Diferencia(Apu_Oferta_Cuadrilla_Diferencia o)
        {
            this._Apu_Oferta_Id = o.Apu_Oferta_Id;
            this._Apu_Oferta_Codigo = o.Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = o.Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = o.Apu_Oferta_Etapa;
            this._Apu_Cuadrilla_Codigo = o.Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = o.Apu_Cuadrilla_Nombre;
            this._costo_total = o.costo_total;
            this._Costo_Hora = o.Costo_Hora;
            this._Numero_trabajadores = o.Numero_trabajadores;
            this._Coeficiente = o.Coeficiente;
        }
    }
}
