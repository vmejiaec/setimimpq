
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Catalogo_Indice : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Fis_Catalogo_Id;
        private String _Apu_Indice_Id;
        private Decimal _Valor;
        private String _Fis_Catalogo_Nombre;
        private String _Fis_Catalogo_Codigo;
        private String _Apu_Indice_Nombre;
        private String _Apu_Indice_Codigo;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Fis_Catalogo_Id
        {
            get { return _Fis_Catalogo_Id; }
            set { _Fis_Catalogo_Id = value; }
        }

        public String Apu_Indice_Id
        {
            get { return _Apu_Indice_Id; }
            set { _Apu_Indice_Id = value; }
        }

        public Decimal Valor
        {
            get { return _Valor; }
            set { _Valor = value; }
        }

        public String Fis_Catalogo_Nombre
        {
            get { return _Fis_Catalogo_Nombre; }
            set { _Fis_Catalogo_Nombre = value; }
        }

        public String Fis_Catalogo_Codigo
        {
            get { return _Fis_Catalogo_Codigo; }
            set { _Fis_Catalogo_Codigo = value; }
        }

        public String Apu_Indice_Nombre
        {
            get { return _Apu_Indice_Nombre; }
            set { _Apu_Indice_Nombre = value; }
        }

        public String Apu_Indice_Codigo
        {
            get { return _Apu_Indice_Codigo; }
            set { _Apu_Indice_Codigo = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Catalogo_Indice()
        {
        }
        public Fis_Catalogo_Indice(String _Id, String _Codigo, String _Estado, String _Descripcion, String _Fis_Catalogo_Id, String _Apu_Indice_Id, Decimal _Valor, String _Fis_Catalogo_Nombre, String _Fis_Catalogo_Codigo, String _Apu_Indice_Nombre, String _Apu_Indice_Codigo, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Fis_Catalogo_Id = _Fis_Catalogo_Id;
            this._Apu_Indice_Id = _Apu_Indice_Id;
            this._Valor = _Valor;
            this._Fis_Catalogo_Nombre = _Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Codigo = _Fis_Catalogo_Codigo;
            this._Apu_Indice_Nombre = _Apu_Indice_Nombre;
            this._Apu_Indice_Codigo = _Apu_Indice_Codigo;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Fis_Catalogo_Indice(Fis_Catalogo_Indice o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Fis_Catalogo_Id = o.Fis_Catalogo_Id;
            this._Apu_Indice_Id = o.Apu_Indice_Id;
            this._Valor = o.Valor;
            this._Fis_Catalogo_Nombre = o.Fis_Catalogo_Nombre;
            this._Fis_Catalogo_Codigo = o.Fis_Catalogo_Codigo;
            this._Apu_Indice_Nombre = o.Apu_Indice_Nombre;
            this._Apu_Indice_Codigo = o.Apu_Indice_Codigo;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
