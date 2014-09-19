using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Oferta_Categoria : Entidad
    {
        // Atributos
        private String _Apu_Oferta_Id;
        private String _Apu_Categoria_Id;
        private Decimal _Costo_Diario;
        private String _Apu_Oferta_Codigo;
        private String _Apu_Oferta_Nombre;
        private String _Apu_Oferta_Etapa;
        private String _Apu_Categoria_Codigo;
        private String _Apu_Categoria_Nombre;
        private String _Int_Empresa_id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private Decimal _Costo_Hora;
        private String _Int_Moneda_Simbolo;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Apu_Oferta_Id
        {
            get { return _Apu_Oferta_Id; }
            set { _Apu_Oferta_Id = value; }
        }

        public String Apu_Categoria_Id
        {
            get { return _Apu_Categoria_Id; }
            set { _Apu_Categoria_Id = value; }
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

        public String Int_Empresa_id
        {
            get { return _Int_Empresa_id; }
            set { _Int_Empresa_id = value; }
        }

        public String Int_Empresa_Codigo
        {
            get { return _Int_Empresa_Codigo; }
            set { _Int_Empresa_Codigo = value; }
        }

        public String Int_Empresa_Nombre
        {
            get { return _Int_Empresa_Nombre; }
            set { _Int_Empresa_Nombre = value; }
        }

        public Decimal Costo_Hora
        {
            get { return _Costo_Hora; }
            set { _Costo_Hora = value; }
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

        // Constructor
        public Apu_Oferta_Categoria()
        {
        }
        public Apu_Oferta_Categoria(String _Id, String _Codigo, String _Estado, String _Apu_Oferta_Id, String _Apu_Categoria_Id, Decimal _Costo_Diario, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Int_Empresa_id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, Decimal _Costo_Hora, String _Int_Moneda_Simbolo, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Oferta_Id = _Apu_Oferta_Id;
            this._Apu_Categoria_Id = _Apu_Categoria_Id;
            this._Costo_Diario = _Costo_Diario;
            this._Apu_Oferta_Codigo = _Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = _Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = _Apu_Oferta_Etapa;
            this._Apu_Categoria_Codigo = _Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = _Apu_Categoria_Nombre;
            this._Int_Empresa_id = _Int_Empresa_id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Costo_Hora = _Costo_Hora;
            this._Int_Moneda_Simbolo = _Int_Moneda_Simbolo;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Apu_Oferta_Categoria(Apu_Oferta_Categoria o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apu_Oferta_Id = o.Apu_Oferta_Id;
            this._Apu_Categoria_Id = o.Apu_Categoria_Id;
            this._Costo_Diario = o.Costo_Diario;
            this._Apu_Oferta_Codigo = o.Apu_Oferta_Codigo;
            this._Apu_Oferta_Nombre = o.Apu_Oferta_Nombre;
            this._Apu_Oferta_Etapa = o.Apu_Oferta_Etapa;
            this._Apu_Categoria_Codigo = o.Apu_Categoria_Codigo;
            this._Apu_Categoria_Nombre = o.Apu_Categoria_Nombre;
            this._Int_Empresa_id = o.Int_Empresa_id;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Costo_Hora = o.Costo_Hora;
            this._Int_Moneda_Simbolo = o.Int_Moneda_Simbolo;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
