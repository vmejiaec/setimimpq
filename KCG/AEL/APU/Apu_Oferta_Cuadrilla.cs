
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Oferta_Cuadrilla : Entidad
    {
        // Atributos
        private String _Apu_Oferta_Id;
        private String _Apu_Oferta_Codigo;
        private String _Apu_Oferta_Nombre;
        private String _Apu_Oferta_Etapa;
        private String _Apu_Cuadrilla_Codigo;
        private String _Apu_Cuadrilla_Nombre;
        private Decimal _Costo_Total;
        private Decimal _Coeficiente;
        private Decimal _Costo_Hora;
        private Decimal _Numero_trabajadores;
        private String _Apu_Categoria_Id;
        private String _Origen;

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

        public Decimal Costo_Hora
        {
            get { return _Costo_Hora; }
            set { _Costo_Hora = value; }
        }

        public Decimal Numero_trabajadores
        {
            get { return _Numero_trabajadores; }
            set { _Numero_trabajadores = value; }
        }

        public String Apu_Categoria_Id
        {
            get { return _Apu_Categoria_Id; }
            set { _Apu_Categoria_Id = value; }
        }

        public String Origen
        {
            get { return _Origen; }
            set { _Origen = value; }
        }

        // Constructor
        public Apu_Oferta_Cuadrilla()
        {
        }
        public Apu_Oferta_Cuadrilla( String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Cuadrilla_Codigo, String _Apu_Cuadrilla_Nombre, Decimal _Costo_Total, Decimal _Coeficiente, Decimal _Costo_Hora, Decimal _Numero_trabajadores, String _Apu_Categoria_Id, String _Origen)
        {
            this._Apu_Oferta_Id = _Apu_Oferta_Id;
            this._Apu_Oferta_Codigo = _Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = _Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = _Apu_Oferta_Etapa;
            this._Apu_Cuadrilla_Codigo = _Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = _Apu_Cuadrilla_Nombre;
            this._Costo_Total = _Costo_Total;
            this._Coeficiente = _Coeficiente;
            this._Costo_Hora = _Costo_Hora;
            this._Numero_trabajadores = _Numero_trabajadores;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Origen = _Origen;
        }
        public Apu_Oferta_Cuadrilla(Apu_Oferta_Cuadrilla o)
        {
            this._Apu_Oferta_Id = o.Apu_Oferta_Id;
            this._Apu_Oferta_Codigo = o.Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = o.Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = o.Apu_Oferta_Etapa;
            this._Apu_Cuadrilla_Codigo = o.Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = o.Apu_Cuadrilla_Nombre;
            this._Costo_Total = o.Costo_Total;
            this._Coeficiente = o.Coeficiente;
            this._Costo_Hora = o.Costo_Hora;
            this._Numero_trabajadores = o.Numero_trabajadores;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Origen = o.Origen;
        }
    }
}
