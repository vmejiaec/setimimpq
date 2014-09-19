
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
    public class Par_Iva : Entidad
    {
        // Atributos
        private Decimal _Valor;
        private String _Cuenta;
        private String _Tipo_Auxiliar;
        private String _Auxiliar;
        private String _Int_Empresa_Id;
        private String _Creacion_Per_Personal_Id;
        private DateTime _Fecha_Creacion;
        private String _Update_Per_Personal_Id;
        private DateTime _Fecha_Update;
        private String _Descripcion;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Update_Per_Personal_Codigo;
        private String _Update_Per_Personal_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public Decimal Valor
        {
            get { return _Valor; }
            set { _Valor = value; }
        }

        public String Cuenta
        {
            get { return _Cuenta; }
            set { _Cuenta = value; }
        }

        public String Tipo_Auxiliar
        {
            get { return _Tipo_Auxiliar; }
            set { _Tipo_Auxiliar = value; }
        }

        public String Auxiliar
        {
            get { return _Auxiliar; }
            set { _Auxiliar = value; }
        }

        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
        }

        public String Creacion_Per_Personal_Id
        {
            get { return _Creacion_Per_Personal_Id; }
            set { _Creacion_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Creacion
        {
            get { return _Fecha_Creacion; }
            set { _Fecha_Creacion = value; }
        }

        public String Update_Per_Personal_Id
        {
            get { return _Update_Per_Personal_Id; }
            set { _Update_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Update
        {
            get { return _Fecha_Update; }
            set { _Fecha_Update = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Creacion_Per_Personal_Codigo
        {
            get { return _Creacion_Per_Personal_Codigo; }
            set { _Creacion_Per_Personal_Codigo = value; }
        }

        public String Creacion_Per_Personal_Nombre
        {
            get { return _Creacion_Per_Personal_Nombre; }
            set { _Creacion_Per_Personal_Nombre = value; }
        }

        public String Update_Per_Personal_Codigo
        {
            get { return _Update_Per_Personal_Codigo; }
            set { _Update_Per_Personal_Codigo = value; }
        }

        public String Update_Per_Personal_Nombre
        {
            get { return _Update_Per_Personal_Nombre; }
            set { _Update_Per_Personal_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Par_Iva()
        {
        }
        public Par_Iva(String _Id, String _Codigo, String _Nombre, String _Estado, Decimal _Valor, String _Cuenta, String _Tipo_Auxiliar, String _Auxiliar, String _Int_Empresa_Id, String _Creacion_Per_Personal_Id, DateTime _Fecha_Creacion, String _Update_Per_Personal_Id, DateTime _Fecha_Update, String _Descripcion, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Valor = _Valor;
            this._Cuenta = _Cuenta;
            this._Tipo_Auxiliar = _Tipo_Auxiliar;
            this._Auxiliar = _Auxiliar;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Update_Per_Personal_Id = _Update_Per_Personal_Id;
            this._Fecha_Update = _Fecha_Update;
            this._Descripcion = _Descripcion;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = _Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = _Update_Per_Personal_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Par_Iva(Par_Iva o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Valor = o.Valor;
            this._Cuenta = o.Cuenta;
            this._Tipo_Auxiliar = o.Tipo_Auxiliar;
            this._Auxiliar = o.Auxiliar;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Creacion_Per_Personal_Id = o.Creacion_Per_Personal_Id;
            this._Fecha_Creacion = o.Fecha_Creacion;
            this._Update_Per_Personal_Id = o.Update_Per_Personal_Id;
            this._Fecha_Update = o.Fecha_Update;
            this._Descripcion = o.Descripcion;
            this._Creacion_Per_Personal_Codigo = o.Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = o.Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = o.Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = o.Update_Per_Personal_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
