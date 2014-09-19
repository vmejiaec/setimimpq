
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Proyecto_Cuadrilla : Entidad
    {
        // Atributos
        private String _Apu_Proyecto_Id;
        private String _Apu_proyecto_Codigo;
        private String _Apu_proyecto_Nombre;
        private String _Apu_proyecto_Etapa;
        private String _Apu_Cuadrilla_Codigo;
        private String _Apu_Cuadrilla_Nombre;
        private Decimal _Costo_Total;
        private Decimal _Costo_Hora;
        private Decimal _Numero_trabajadores;
        private Decimal _Coeficiente;
        private String _Apu_Categoria_Id;
        private String _Origen;

        // Propiedades de la clase
        public String Apu_Proyecto_Id
        {
            get { return _Apu_Proyecto_Id; }
            set { _Apu_Proyecto_Id = value; }
        }

        public String Apu_proyecto_Codigo
        {
            get { return _Apu_proyecto_Codigo; }
            set { _Apu_proyecto_Codigo = value; }
        }

        public String Apu_proyecto_Nombre
        {
            get { return _Apu_proyecto_Nombre; }
            set { _Apu_proyecto_Nombre = value; }
        }

        public String Apu_proyecto_Etapa
        {
            get { return _Apu_proyecto_Etapa; }
            set { _Apu_proyecto_Etapa = value; }
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

        public Decimal Coeficiente
        {
            get { return _Coeficiente; }
            set { _Coeficiente = value; }
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
        public Apu_Proyecto_Cuadrilla()
        {
        }
        public Apu_Proyecto_Cuadrilla( String _Apu_Proyecto_Id, String _Apu_proyecto_Codigo, String _Apu_proyecto_Nombre, String _Apu_proyecto_Etapa, String _Apu_Cuadrilla_Codigo, String _Apu_Cuadrilla_Nombre, Decimal _Costo_Total, Decimal _Costo_Hora, Decimal _Numero_trabajadores, Decimal _Coeficiente, String _Apu_Categoria_Id, String _Origen)
        {
            this._Apu_Proyecto_Id = _Apu_Proyecto_Id;
            this._Apu_proyecto_Codigo = _Apu_proyecto_Codigo;
            this._Apu_proyecto_Nombre = _Apu_proyecto_Nombre;
            this._Apu_proyecto_Etapa = _Apu_proyecto_Etapa;
            this._Apu_Cuadrilla_Codigo = _Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = _Apu_Cuadrilla_Nombre;
            this._Costo_Total = _Costo_Total;
            this._Costo_Hora = _Costo_Hora;
            this._Numero_trabajadores = _Numero_trabajadores;
            this._Coeficiente = _Coeficiente;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Origen = _Origen;
        }
        public Apu_Proyecto_Cuadrilla(Apu_Proyecto_Cuadrilla o)
        {
            this._Apu_Proyecto_Id = o.Apu_Proyecto_Id;
            this._Apu_proyecto_Codigo = o.Apu_proyecto_Codigo;
            this._Apu_proyecto_Nombre = o.Apu_proyecto_Nombre;
            this._Apu_proyecto_Etapa = o.Apu_proyecto_Etapa;
            this._Apu_Cuadrilla_Codigo = o.Apu_Cuadrilla_Codigo;
            this._Apu_Cuadrilla_Nombre = o.Apu_Cuadrilla_Nombre;
            this._Costo_Total = o.Costo_Total;
            this._Costo_Hora = o.Costo_Hora;
            this._Numero_trabajadores = o.Numero_trabajadores;
            this._Coeficiente = o.Coeficiente;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Origen = o.Origen;
        }
    }
}
