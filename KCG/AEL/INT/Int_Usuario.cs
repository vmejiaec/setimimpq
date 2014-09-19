
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.INT
{
    public class Int_Usuario : Entidad
    {
        // Atributos
        private String _Salt;
        private String _Password;
        private String _Usuario_Id_Ref;
        private String _Per_Personal_Id;
        private String _Pred_Seg_Rol_Id;
        private String _Pred_Ver_Version_Id;
        private String _Pred_Int_Sucursal_Id;
        private String _Per_Personal_Codigo;
        private String _Per_Personal_Nombre;
        private String _Pred_seg_Rol_Codigo;
        private String _Pred_seg_Rol_Nombre;
        private String _Pred_ver_version_codigo;
        private String _Pred_ver_version_nombre;
        private String _Pred_Ver_Version_Abreviatura;
        private String _Pred_int_Usuario_codigo;
        private String _Pred_Int_Usuario_nombre;
        private String _int_empresa_id;
        private String _int_empresa_codigo;
        private String _int_empresa_nombre;
        private String _estado_nombre;
        private String _Jefe_Fiscalizacion;

        // Propiedades de la clase
        public String Salt
        {
            get { return _Salt; }
            set { _Salt = value; }
        }

        public String Password
        {
            get { return _Password; }
            set { _Password = value; }
        }

        public String Usuario_Id_Ref
        {
            get { return _Usuario_Id_Ref; }
            set { _Usuario_Id_Ref = value; }
        }

        public String Per_Personal_Id
        {
            get { return _Per_Personal_Id; }
            set { _Per_Personal_Id = value; }
        }

        public String Pred_Seg_Rol_Id
        {
            get { return _Pred_Seg_Rol_Id; }
            set { _Pred_Seg_Rol_Id = value; }
        }

        public String Pred_Ver_Version_Id
        {
            get { return _Pred_Ver_Version_Id; }
            set { _Pred_Ver_Version_Id = value; }
        }

        public String Pred_Int_Sucursal_Id
        {
            get { return _Pred_Int_Sucursal_Id; }
            set { _Pred_Int_Sucursal_Id = value; }
        }

        public String Per_Personal_Codigo
        {
            get { return _Per_Personal_Codigo; }
            set { _Per_Personal_Codigo = value; }
        }

        public String Per_Personal_Nombre
        {
            get { return _Per_Personal_Nombre; }
            set { _Per_Personal_Nombre = value; }
        }

        public String Pred_seg_Rol_Codigo
        {
            get { return _Pred_seg_Rol_Codigo; }
            set { _Pred_seg_Rol_Codigo = value; }
        }

        public String Pred_seg_Rol_Nombre
        {
            get { return _Pred_seg_Rol_Nombre; }
            set { _Pred_seg_Rol_Nombre = value; }
        }

        public String Pred_ver_version_codigo
        {
            get { return _Pred_ver_version_codigo; }
            set { _Pred_ver_version_codigo = value; }
        }

        public String Pred_ver_version_nombre
        {
            get { return _Pred_ver_version_nombre; }
            set { _Pred_ver_version_nombre = value; }
        }

        public String Pred_Ver_Version_Abreviatura
        {
            get { return _Pred_Ver_Version_Abreviatura; }
            set { _Pred_Ver_Version_Abreviatura = value; }
        }

        public String Pred_int_Usuario_codigo
        {
            get { return _Pred_int_Usuario_codigo; }
            set { _Pred_int_Usuario_codigo = value; }
        }

        public String Pred_Int_Usuario_nombre
        {
            get { return _Pred_Int_Usuario_nombre; }
            set { _Pred_Int_Usuario_nombre = value; }
        }

        public String int_empresa_id
        {
            get { return _int_empresa_id; }
            set { _int_empresa_id = value; }
        }

        public String int_empresa_codigo
        {
            get { return _int_empresa_codigo; }
            set { _int_empresa_codigo = value; }
        }

        public String int_empresa_nombre
        {
            get { return _int_empresa_nombre; }
            set { _int_empresa_nombre = value; }
        }

        public String estado_nombre
        {
            get { return _estado_nombre; }
            set { _estado_nombre = value; }
        }

        public String Jefe_Fiscalizacion
        {
            get { return _Jefe_Fiscalizacion; }
            set { _Jefe_Fiscalizacion = value; }
        }

        // Constructor
        public Int_Usuario()
        {
        }
        public Int_Usuario(String _Id, String _Codigo, String _Nombre, String _Estado, String _Salt, String _Password, String _Usuario_Id_Ref, String _Per_Personal_Id, String _Pred_Seg_Rol_Id, String _Pred_Ver_Version_Id, String _Pred_Int_Sucursal_Id, String _Per_Personal_Codigo, String _Per_Personal_Nombre, String _Pred_seg_Rol_Codigo, String _Pred_seg_Rol_Nombre, String _Pred_ver_version_codigo, String _Pred_ver_version_nombre, String _Pred_Ver_Version_Abreviatura, String _Pred_int_Usuario_codigo, String _Pred_Int_Usuario_nombre, String _int_empresa_id, String _int_empresa_codigo, String _int_empresa_nombre, String _estado_nombre, String _Jefe_Fiscalizacion)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Salt = _Salt;
            this._Password = _Password;
            this._Usuario_Id_Ref = _Usuario_Id_Ref;
            this._Per_Personal_Id = _Per_Personal_Id;
            this._Pred_Seg_Rol_Id = _Pred_Seg_Rol_Id;
            this._Pred_Ver_Version_Id = _Pred_Ver_Version_Id;
            this._Pred_Int_Sucursal_Id = _Pred_Int_Sucursal_Id;
            this._Per_Personal_Codigo = _Per_Personal_Codigo;
            this._Per_Personal_Nombre = _Per_Personal_Nombre;
            this._Pred_seg_Rol_Codigo = _Pred_seg_Rol_Codigo;
            this._Pred_seg_Rol_Nombre = _Pred_seg_Rol_Nombre;
            this._Pred_ver_version_codigo = _Pred_ver_version_codigo;
            this._Pred_ver_version_nombre = _Pred_ver_version_nombre;
            this._Pred_Ver_Version_Abreviatura = _Pred_Ver_Version_Abreviatura;
            this._Pred_int_Usuario_codigo = _Pred_int_Usuario_codigo;
            this._Pred_Int_Usuario_nombre = _Pred_Int_Usuario_nombre;
            this._int_empresa_id = _int_empresa_id;
            this._int_empresa_codigo = _int_empresa_codigo;
            this._int_empresa_nombre = _int_empresa_nombre;
            this._estado_nombre = _estado_nombre;
            this._Jefe_Fiscalizacion = _Jefe_Fiscalizacion;
        }
        public Int_Usuario(Int_Usuario o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Salt = o.Salt;
            this._Password = o.Password;
            this._Usuario_Id_Ref = o.Usuario_Id_Ref;
            this._Per_Personal_Id = o.Per_Personal_Id;
            this._Pred_Seg_Rol_Id = o.Pred_Seg_Rol_Id;
            this._Pred_Ver_Version_Id = o.Pred_Ver_Version_Id;
            this._Pred_Int_Sucursal_Id = o.Pred_Int_Sucursal_Id;
            this._Per_Personal_Codigo = o.Per_Personal_Codigo;
            this._Per_Personal_Nombre = o.Per_Personal_Nombre;
            this._Pred_seg_Rol_Codigo = o.Pred_seg_Rol_Codigo;
            this._Pred_seg_Rol_Nombre = o.Pred_seg_Rol_Nombre;
            this._Pred_ver_version_codigo = o.Pred_ver_version_codigo;
            this._Pred_ver_version_nombre = o.Pred_ver_version_nombre;
            this._Pred_Ver_Version_Abreviatura = o.Pred_Ver_Version_Abreviatura;
            this._Pred_int_Usuario_codigo = o.Pred_int_Usuario_codigo;
            this._Pred_Int_Usuario_nombre = o.Pred_Int_Usuario_nombre;
            this._int_empresa_id = o.int_empresa_id;
            this._int_empresa_codigo = o.int_empresa_codigo;
            this._int_empresa_nombre = o.int_empresa_nombre;
            this._estado_nombre = o.estado_nombre;
            this._Jefe_Fiscalizacion = o.Jefe_Fiscalizacion;
        }
    }
}
