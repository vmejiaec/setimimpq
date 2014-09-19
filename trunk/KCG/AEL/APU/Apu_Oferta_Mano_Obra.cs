
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Oferta_Mano_Obra : Entidad
    {
        // Atributos
        private String _Apu_Oferta_Id;
        private String _Apu_Mano_Obra_Id;
        private String _Apu_Categoria_Id;
        private String _Apu_Indice_Id;
        private Decimal _Costo_Diario;
        private String _Apu_Oferta_Codigo;
        private String _Apu_Oferta_Nombre;
        private String _Apu_Oferta_Etapa;
        private String _Apu_Mano_Obra_Codigo;
        private String _Apu_Mano_Obra_Nombre;
        private String _Apu_Categoria_Codigo;
        private String _Apu_Categoria_Nombre;
        private String _Apu_Indice_Codigo;
        private String _Apu_Indice_Nombre;
        private Decimal _Costo;
        private String _Int_Moneda_Simbolo;
        private String _Estado_Nombre;
        private Decimal _Apu_Mano_Obra_Costo_Diario;
        private Decimal _Costo_Hora;
        private Decimal _Cantidad_Mano_Obra;
        private Decimal _Cantidad_Mano_Obra_X_Costo;

        // Propiedades de la clase
        public String Apu_Oferta_Id
        {
            get { return _Apu_Oferta_Id; }
            set { _Apu_Oferta_Id = value; }
        }

        public String Apu_Mano_Obra_Id
        {
            get { return _Apu_Mano_Obra_Id; }
            set { _Apu_Mano_Obra_Id = value; }
        }

        public String Apu_Categoria_Id
        {
            get { return _Apu_Categoria_Id; }
            set { _Apu_Categoria_Id = value; }
        }

        public String Apu_Indice_Id
        {
            get { return _Apu_Indice_Id; }
            set { _Apu_Indice_Id = value; }
        }

        public Decimal Costo_Diario
        {
            get { return _Costo_Diario; }
            set { _Costo_Diario = value; }
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

        public String Apu_Mano_Obra_Codigo
        {
            get { return _Apu_Mano_Obra_Codigo; }
            set { _Apu_Mano_Obra_Codigo = value; }
        }

        public String Apu_Mano_Obra_Nombre
        {
            get { return _Apu_Mano_Obra_Nombre; }
            set { _Apu_Mano_Obra_Nombre = value; }
        }

        public String Apu_Categoria_Codigo
        {
            get { return _Apu_Categoria_Codigo; }
            set { _Apu_Categoria_Codigo = value; }
        }

        public String Apu_Categoria_Nombre
        {
            get { return _Apu_Categoria_Nombre; }
            set { _Apu_Categoria_Nombre = value; }
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

        public Decimal Costo
        {
            get { return _Costo; }
            set { _Costo = value; }
        }

        public String Int_Moneda_Simbolo
        {
            get { return _Int_Moneda_Simbolo; }
            set { _Int_Moneda_Simbolo = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        public Decimal Apu_Mano_Obra_Costo_Diario
        {
            get { return _Apu_Mano_Obra_Costo_Diario; }
            set { _Apu_Mano_Obra_Costo_Diario = value; }
        }

        public Decimal Costo_Hora
        {
            get { return _Costo_Hora; }
            set { _Costo_Hora = value; }
        }

        public Decimal Cantidad_Mano_Obra
        {
            get { return _Cantidad_Mano_Obra; }
            set { _Cantidad_Mano_Obra = value; }
        }

        public Decimal Cantidad_Mano_Obra_X_Costo
        {
            get { return _Cantidad_Mano_Obra_X_Costo; }
            set { _Cantidad_Mano_Obra_X_Costo = value; }
        }

        // Constructor
        public Apu_Oferta_Mano_Obra()
        {
        }
        public Apu_Oferta_Mano_Obra(String _Id, String _Codigo, String _Estado, String _Apu_Oferta_Id, String _Apu_Mano_Obra_Id, String _Apu_Categoria_Id, String _Apu_Indice_Id, Decimal _Costo_Diario, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Mano_Obra_Codigo, String _Apu_Mano_Obra_Nombre, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Costo, String _Int_Moneda_Simbolo, String _Estado_Nombre, Decimal _Apu_Mano_Obra_Costo_Diario, Decimal _Costo_Hora, Decimal _Cantidad_Mano_Obra, Decimal _Cantidad_Mano_Obra_X_Costo)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Oferta_Id = _Apu_Oferta_Id;
            this._Apu_Mano_Obra_Id = _Apu_Mano_Obra_Id;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Apu_Indice_Id = _Apu_Indice_Id;
            this._Costo_Diario = _Costo_Diario;
            this._Apu_Oferta_Codigo = _Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = _Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = _Apu_Oferta_Etapa;
            this._Apu_Mano_Obra_Codigo = _Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = _Apu_Mano_Obra_Nombre;
            this._Apu_Categoria_Codigo = _Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = _Apu_Categoria_Nombre;
            this._Apu_Indice_Codigo = _Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = _Apu_Indice_Nombre;
            this._Costo = _Costo;
            this._Int_Moneda_Simbolo = _Int_Moneda_Simbolo;
            this._Estado_Nombre = _Estado_Nombre;
            this._Apu_Mano_Obra_Costo_Diario = _Apu_Mano_Obra_Costo_Diario;
            this._Costo_Hora = _Costo_Hora;
            this._Cantidad_Mano_Obra = _Cantidad_Mano_Obra;
            this._Cantidad_Mano_Obra_X_Costo = _Cantidad_Mano_Obra_X_Costo;
        }
        public Apu_Oferta_Mano_Obra(Apu_Oferta_Mano_Obra o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apu_Oferta_Id = o.Apu_Oferta_Id;
            this._Apu_Mano_Obra_Id = o.Apu_Mano_Obra_Id;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Apu_Indice_Id = o.Apu_Indice_Id;
            this._Costo_Diario = o.Costo_Diario;
            this._Apu_Oferta_Codigo = o.Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = o.Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = o.Apu_Oferta_Etapa;
            this._Apu_Mano_Obra_Codigo = o.Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = o.Apu_Mano_Obra_Nombre;
            this._Apu_Categoria_Codigo = o.Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = o.Apu_Categoria_Nombre;
            this._Apu_Indice_Codigo = o.Apu_Indice_Codigo;
            this._Apu_Indice_Nombre = o.Apu_Indice_Nombre;
            this._Costo = o.Costo;
            this._Int_Moneda_Simbolo = o.Int_Moneda_Simbolo;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Apu_Mano_Obra_Costo_Diario = o.Apu_Mano_Obra_Costo_Diario;
            this._Costo_Hora = o.Costo_Hora;
            this._Cantidad_Mano_Obra = o.Cantidad_Mano_Obra;
            this._Cantidad_Mano_Obra_X_Costo = o.Cantidad_Mano_Obra_X_Costo;
        }
    }
}
