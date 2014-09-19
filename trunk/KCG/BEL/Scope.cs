using System;

namespace BEL
{
    [Serializable]
    public class Scope
    {
        //Atributos
        private string _Ver_Version_Id;
        private string _Int_Empresa_Id;
        private string _Int_Sucursal_Id;
        private string _Seg_Rol_Id;
        private string _Int_Usuario_Id;
        private string _Dic_Contenedor_Id;
        private string _Dic_Objeto_Id;

        private string _id_inicial;
        private string _id_final;

        private string _Ver_Version_Nombre;
        private string _Int_Empresa_Nombre;
        private string _Int_Empresa_Abreviatura;
        private string _Int_Sucursal_Nombre;
        private string _Int_Sucursal_Abreviatura;
        private int _Int_Sucursal_Numero;
        private string _Int_Usuario_Nombre;
        private string _Seg_Rol_Nombre;
        private string _Dic_Contenedor_Nombre;
        private string _Dic_Objeto_Nombre;
        private string _Dic_Campo_Nombre;
        private string _Par_Servidor_Id;
        private string _Per_Personal_Id;
        private string _Int_Moneda_Id;
        private string _Per_Personal_Nombre;
        private string _Jefe_Fiscalizacion;
        private string _Password;

        private int _No_Seccion;

        private string _Ip_Origen;

        private int _Numero_Registros;
        private int _Pagina_Actual;

        private string _Expresion_De_Filtrado;


        public string Expresion_De_Filtrado
        {
            get { return _Expresion_De_Filtrado; }
            set { _Expresion_De_Filtrado = value; }
        }

        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }


        public int No_Seccion
        {
            get { return _No_Seccion; }
            set { _No_Seccion = value; }
        }

        public string Per_Personal_Nombre
        {
            get { return _Per_Personal_Nombre; }
            set { _Per_Personal_Nombre = value; }
        }

        public string Int_Moneda_Id
        {
            get { return _Int_Moneda_Id; }
            set { _Int_Moneda_Id = value; }
        }

        public string Per_Personal_Id
        {
            get { return _Per_Personal_Id; }
            set { _Per_Personal_Id = value; }
        }

        public string Par_Servidor_Id
        {
            get { return _Par_Servidor_Id; }
            set { _Par_Servidor_Id = value; }
        }

        public string Jefe_Fiscalizacion
        {
            get { return _Jefe_Fiscalizacion; }
            set { _Jefe_Fiscalizacion = value; }
        }


        #region propiedades
        public string Dic_Campo_Nombre
        {
            get { return _Dic_Campo_Nombre; }
            set { _Dic_Campo_Nombre = value; }  
        }
        public int Int_Sucursal_Numero
        {
            get { return _Int_Sucursal_Numero; }
            set { _Int_Sucursal_Numero = value; }
        }

        public string Int_Empresa_Nombre
        {
            get { return _Int_Empresa_Nombre; }
            set { _Int_Empresa_Nombre = value; }
        }

        public string Int_Empresa_Abreviatura
        {
            get { return _Int_Empresa_Abreviatura; }
            set { _Int_Empresa_Abreviatura = value; }
        }

        public string Ver_Version_Id
        {
            get { return _Ver_Version_Id; }
            set { _Ver_Version_Id = value; }
        }

        public string Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
        }

        public string Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
        }

        public string Seg_Rol_Id
        {
            get { return _Seg_Rol_Id; }
            set { _Seg_Rol_Id = value; }
        }

        public string Int_Usuario_Id
        {
            get { return _Int_Usuario_Id; }
            set { _Int_Usuario_Id = value; }
        }

        public string Dic_Contenedor_Id
        {
            get { return _Dic_Contenedor_Id; }
            set { _Dic_Contenedor_Id = value; }
        }

        public string id_inicial
        {
            get { return _id_inicial; }
            set { _id_inicial = value; }
        }

        public string id_final
        {
            get { return _id_final; }
            set { _id_final = value; }
        }

        public string Ver_Version_Nombre
        {
            get { return _Ver_Version_Nombre; }
            set { _Ver_Version_Nombre = value; }
        }

        public string Int_Sucursal_Nombre
        {
            get { return _Int_Sucursal_Nombre; }
            set { _Int_Sucursal_Nombre = value; }
        }

        public string Int_Sucursal_Abreviatura
        {
            get { return _Int_Sucursal_Abreviatura; }
            set { _Int_Sucursal_Abreviatura = value; }
        }

        public string Int_Usuario_Nombre
        {
            get { return _Int_Usuario_Nombre; }
            set { _Int_Usuario_Nombre = value; }
        }

        public string Seg_Rol_Nombre
        {
            get { return _Seg_Rol_Nombre; }
            set { _Seg_Rol_Nombre = value; }
        }

        public string Dic_Contenedor_Nombre
        {
            get { return _Dic_Contenedor_Nombre; }
            set { _Dic_Contenedor_Nombre = value; }
        }

        public string Dic_Objeto_Id
        {
            get { return _Dic_Objeto_Id; }
            set { _Dic_Objeto_Id = value; }
        }

        public string Dic_Objeto_Nombre
        {
            get { return _Dic_Objeto_Nombre; }
            set { _Dic_Objeto_Nombre = value; }
        }

        public string Ip_Origen
        {
            get { return _Ip_Origen; }
            set { _Ip_Origen = value; }
        }

        public int Numero_Registros
        {
            get { return _Numero_Registros; }
            set { _Numero_Registros = value; }
        }

        public int Pagina_Actual
        {
            get { return _Pagina_Actual; }
            set { _Pagina_Actual = value; }
        }
        
        #endregion
    }
}