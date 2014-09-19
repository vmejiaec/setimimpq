
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PER
{
    public class Per_Personal : Entidad
    {
        // Atributos
        private String _Coordinador;
        private String _Tecnico_Costos;
        private String _Int_Empresa_Id;
        private String _Jefe_Costos;
        private String _Par_Razon_Social_Id;
        private String _Tipo_Fiscalizacion;
        private String _Jefe_Fiscalizacion;
        private String _Fiscalizacion;
        private String _Contratista;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Par_Tipo_Identificacion_Id;
        private String _Par_Tipo_Identificacion_Nombre;
        private String _Par_Razon_Social_Codigo;
        private String _Par_Razon_Social_Numero;
        private String _Par_Razon_Social_Nombre;
        private String _Par_Razon_Social_Nom_Comercial;
        private String _Per_Personal_Usuario;
        private String _Coordinador_Nombre;
        private String _Tecnico_Costos_Nombre;
        private String _Jefe_Costos_Nombre;
        private String _Tipo_Fiscalizacion_Nombre;
        private String _Jefe_Fiscalizacion_Nombre;
        private String _Fiscalizacion_Nombre;
        private String _Contratista_Nombre;
        private String _Estado_Nombre;
        
        // Propiedades de la clase
        public String Coordinador
        {
            get { return _Coordinador; }
            set { _Coordinador = value; }
        }

        public String Tecnico_Costos
        {
            get { return _Tecnico_Costos; }
            set { _Tecnico_Costos = value; }
        }

        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
        }

        public String Jefe_Costos
        {
            get { return _Jefe_Costos; }
            set { _Jefe_Costos = value; }
        }

        public String Par_Razon_Social_Id
        {
            get { return _Par_Razon_Social_Id; }
            set { _Par_Razon_Social_Id = value; }
        }

        public String Tipo_Fiscalizacion
        {
            get { return _Tipo_Fiscalizacion; }
            set { _Tipo_Fiscalizacion = value; }
        }

        public String Jefe_Fiscalizacion
        {
            get { return _Jefe_Fiscalizacion; }
            set { _Jefe_Fiscalizacion = value; }
        }

        public String Fiscalizacion
        {
            get { return _Fiscalizacion; }
            set { _Fiscalizacion = value; }
        }

        public String Contratista
        {
            get { return _Contratista; }
            set { _Contratista = value; }
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

        public String Par_Tipo_Identificacion_Id
        {
            get { return _Par_Tipo_Identificacion_Id; }
            set { _Par_Tipo_Identificacion_Id = value; }
        }

        public String Par_Tipo_Identificacion_Nombre
        {
            get { return _Par_Tipo_Identificacion_Nombre; }
            set { _Par_Tipo_Identificacion_Nombre = value; }
        }

        public String Par_Razon_Social_Codigo
        {
            get { return _Par_Razon_Social_Codigo; }
            set { _Par_Razon_Social_Codigo = value; }
        }

        public String Par_Razon_Social_Numero
        {
            get { return _Par_Razon_Social_Numero; }
            set { _Par_Razon_Social_Numero = value; }
        }

        public String Par_Razon_Social_Nombre
        {
            get { return _Par_Razon_Social_Nombre; }
            set { _Par_Razon_Social_Nombre = value; }
        }

        public String Par_Razon_Social_Nom_Comercial
        {
            get { return _Par_Razon_Social_Nom_Comercial; }
            set { _Par_Razon_Social_Nom_Comercial = value; }
        }

        public String Per_Personal_Usuario
        {
            get { return _Per_Personal_Usuario; }
            set { _Per_Personal_Usuario = value; }
        }

        public String Coordinador_Nombre
        {
            get { return _Coordinador_Nombre; }
            set { _Coordinador_Nombre = value; }
        }

        public String Tecnico_Costos_Nombre
        {
            get { return _Tecnico_Costos_Nombre; }
            set { _Tecnico_Costos_Nombre = value; }
        }

        public String Jefe_Costos_Nombre
        {
            get { return _Jefe_Costos_Nombre; }
            set { _Jefe_Costos_Nombre = value; }
        }

        public String Tipo_Fiscalizacion_Nombre
        {
            get { return _Tipo_Fiscalizacion_Nombre; }
            set { _Tipo_Fiscalizacion_Nombre = value; }
        }

        public String Jefe_Fiscalizacion_Nombre
        {
            get { return _Jefe_Fiscalizacion_Nombre; }
            set { _Jefe_Fiscalizacion_Nombre = value; }
        }

        public String Fiscalizacion_Nombre
        {
            get { return _Fiscalizacion_Nombre; }
            set { _Fiscalizacion_Nombre = value; }
        }

        public String Contratista_Nombre
        {
            get { return _Contratista_Nombre; }
            set { _Contratista_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        

        // Constructor
        public Per_Personal()
        {
        }
        public Per_Personal(String _Id, String _Codigo, String _Estado, String _Coordinador, String _Tecnico_Costos, String _Int_Empresa_Id, String _Jefe_Costos, String _Par_Razon_Social_Id, String _Tipo_Fiscalizacion, String _Jefe_Fiscalizacion, String _Fiscalizacion, String _Contratista, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Par_Tipo_Identificacion_Id, String _Par_Tipo_Identificacion_Nombre, String _Par_Razon_Social_Codigo, String _Par_Razon_Social_Numero, String _Par_Razon_Social_Nombre, String _Par_Razon_Social_Nom_Comercial, String _Per_Personal_Usuario, String _Coordinador_Nombre, String _Tecnico_Costos_Nombre, String _Jefe_Costos_Nombre, String _Tipo_Fiscalizacion_Nombre, String _Jefe_Fiscalizacion_Nombre, String _Fiscalizacion_Nombre, String _Contratista_Nombre, String _Estado_Nombre, String _Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Coordinador = _Coordinador;
            this._Tecnico_Costos = _Tecnico_Costos;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Jefe_Costos = _Jefe_Costos;
            this._Par_Razon_Social_Id = _Par_Razon_Social_Id;
            this._Tipo_Fiscalizacion = _Tipo_Fiscalizacion;
            this._Jefe_Fiscalizacion = _Jefe_Fiscalizacion;
            this._Fiscalizacion = _Fiscalizacion;
            this._Contratista = _Contratista;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Par_Tipo_Identificacion_Id = _Par_Tipo_Identificacion_Id;
            this._Par_Tipo_Identificacion_Nombre = _Par_Tipo_Identificacion_Nombre;
            this._Par_Razon_Social_Codigo = _Par_Razon_Social_Codigo;
            this._Par_Razon_Social_Numero = _Par_Razon_Social_Numero;
            this._Par_Razon_Social_Nombre = _Par_Razon_Social_Nombre;
            this._Par_Razon_Social_Nom_Comercial = _Par_Razon_Social_Nom_Comercial;
            this._Per_Personal_Usuario = _Per_Personal_Usuario;
            this._Coordinador_Nombre = _Coordinador_Nombre;
            this._Tecnico_Costos_Nombre = _Tecnico_Costos_Nombre;
            this._Jefe_Costos_Nombre = _Jefe_Costos_Nombre;
            this._Tipo_Fiscalizacion_Nombre = _Tipo_Fiscalizacion_Nombre;
            this._Jefe_Fiscalizacion_Nombre = _Jefe_Fiscalizacion_Nombre;
            this._Fiscalizacion_Nombre = _Fiscalizacion_Nombre;
            this._Contratista_Nombre = _Contratista_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this.Nombre = _Nombre;
        }
        public Per_Personal(Per_Personal o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Coordinador = o.Coordinador;
            this._Tecnico_Costos = o.Tecnico_Costos;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Jefe_Costos = o.Jefe_Costos;
            this._Par_Razon_Social_Id = o.Par_Razon_Social_Id;
            this._Tipo_Fiscalizacion = o.Tipo_Fiscalizacion;
            this._Jefe_Fiscalizacion = o.Jefe_Fiscalizacion;
            this._Fiscalizacion = o.Fiscalizacion;
            this._Contratista = o.Contratista;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Par_Tipo_Identificacion_Id = o.Par_Tipo_Identificacion_Id;
            this._Par_Tipo_Identificacion_Nombre = o.Par_Tipo_Identificacion_Nombre;
            this._Par_Razon_Social_Codigo = o.Par_Razon_Social_Codigo;
            this._Par_Razon_Social_Numero = o.Par_Razon_Social_Numero;
            this._Par_Razon_Social_Nombre = o.Par_Razon_Social_Nombre;
            this._Par_Razon_Social_Nom_Comercial = o.Par_Razon_Social_Nom_Comercial;
            this._Per_Personal_Usuario = o.Per_Personal_Usuario;
            this._Coordinador_Nombre = o.Coordinador_Nombre;
            this._Tecnico_Costos_Nombre = o.Tecnico_Costos_Nombre;
            this._Jefe_Costos_Nombre = o.Jefe_Costos_Nombre;
            this._Tipo_Fiscalizacion_Nombre = o.Tipo_Fiscalizacion_Nombre;
            this._Jefe_Fiscalizacion_Nombre = o.Jefe_Fiscalizacion_Nombre;
            this._Fiscalizacion_Nombre = o.Fiscalizacion_Nombre;
            this._Contratista_Nombre = o.Contratista_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this.Nombre = o.Nombre;


        }
    }
}
