
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
    public class Seg_Menu : Entidad
    {
        // Atributos
        private String _Dic_Pantalla_Id;
        private String _Grupo;
        private Int32 _Orden;
        private String _Int_Usuario_Id;
        private String _Dic_Con_Elemento_Id;
        private String _Seg_Rol_Id;
        private String _int_usuario_codigo;
        private String _int_usuario_nombre;
        private String _Dic_con_elemento_Codigo;
        private String _Dic_con_elemento_nombre;
        private String _Dic_Pantalla_Codigo;
        private String _Dic_Pantalla_Nombre;
        private String _pantalla_ver_etiqueta_nombre;
        private String _pantalla_ver_etiqueta_imagen_activa;
        private String _pantalla_ver_etiqueta_imagen_desactiva;
        private String _tool_pantalla_ver_etiqueta_nombre;
        private String _Seg_Rol_Codigo;
        private String _Seg_Rol_Nombre;
        private String _Dic_Contenedor_id;
        private String _dic_contenedor_codigo;
        private String _dic_contenedor_nombre;
        private String _Dic_Rotulo_id;
        private String _Dic_Rotulo_Codigo;
        private String _Dic_Rotulo_Nombre;
        private String _ver_etiqueta_nombre;
        private String _ver_etiqueta_imagen_activa;
        private String _ver_etiqueta_imagen_desactiva;
        private String _tool_ver_etiqueta_nombre;
        private String _Par_servidor_det_referencia;
        private String _estado_nombre;
        private String _grupo_nombre;
        private String _Dic_Contenedor_Tipo;

        // Propiedades de la clase
        public String Dic_Pantalla_Id
        {
            get { return _Dic_Pantalla_Id; }
            set { _Dic_Pantalla_Id = value; }
        }

        public String Grupo
        {
            get { return _Grupo; }
            set { _Grupo = value; }
        }

        public Int32 Orden
        {
            get { return _Orden; }
            set { _Orden = value; }
        }

        public String Int_Usuario_Id
        {
            get { return _Int_Usuario_Id; }
            set { _Int_Usuario_Id = value; }
        }

        public String Dic_Con_Elemento_Id
        {
            get { return _Dic_Con_Elemento_Id; }
            set { _Dic_Con_Elemento_Id = value; }
        }

        public String Seg_Rol_Id
        {
            get { return _Seg_Rol_Id; }
            set { _Seg_Rol_Id = value; }
        }

        public String int_usuario_codigo
        {
            get { return _int_usuario_codigo; }
            set { _int_usuario_codigo = value; }
        }

        public String int_usuario_nombre
        {
            get { return _int_usuario_nombre; }
            set { _int_usuario_nombre = value; }
        }

        public String Dic_con_elemento_Codigo
        {
            get { return _Dic_con_elemento_Codigo; }
            set { _Dic_con_elemento_Codigo = value; }
        }

        public String Dic_con_elemento_nombre
        {
            get { return _Dic_con_elemento_nombre; }
            set { _Dic_con_elemento_nombre = value; }
        }

        public String Dic_Pantalla_Codigo
        {
            get { return _Dic_Pantalla_Codigo; }
            set { _Dic_Pantalla_Codigo = value; }
        }

        public String Dic_Pantalla_Nombre
        {
            get { return _Dic_Pantalla_Nombre; }
            set { _Dic_Pantalla_Nombre = value; }
        }

        public String pantalla_ver_etiqueta_nombre
        {
            get { return _pantalla_ver_etiqueta_nombre; }
            set { _pantalla_ver_etiqueta_nombre = value; }
        }

        public String pantalla_ver_etiqueta_imagen_activa
        {
            get { return _pantalla_ver_etiqueta_imagen_activa; }
            set { _pantalla_ver_etiqueta_imagen_activa = value; }
        }

        public String pantalla_ver_etiqueta_imagen_desactiva
        {
            get { return _pantalla_ver_etiqueta_imagen_desactiva; }
            set { _pantalla_ver_etiqueta_imagen_desactiva = value; }
        }

        public String tool_pantalla_ver_etiqueta_nombre
        {
            get { return _tool_pantalla_ver_etiqueta_nombre; }
            set { _tool_pantalla_ver_etiqueta_nombre = value; }
        }

        public String Seg_Rol_Codigo
        {
            get { return _Seg_Rol_Codigo; }
            set { _Seg_Rol_Codigo = value; }
        }

        public String Seg_Rol_Nombre
        {
            get { return _Seg_Rol_Nombre; }
            set { _Seg_Rol_Nombre = value; }
        }

        public String Dic_Contenedor_id
        {
            get { return _Dic_Contenedor_id; }
            set { _Dic_Contenedor_id = value; }
        }

        public String dic_contenedor_codigo
        {
            get { return _dic_contenedor_codigo; }
            set { _dic_contenedor_codigo = value; }
        }

        public String dic_contenedor_nombre
        {
            get { return _dic_contenedor_nombre; }
            set { _dic_contenedor_nombre = value; }
        }

        public String Dic_Rotulo_id
        {
            get { return _Dic_Rotulo_id; }
            set { _Dic_Rotulo_id = value; }
        }

        public String Dic_Rotulo_Codigo
        {
            get { return _Dic_Rotulo_Codigo; }
            set { _Dic_Rotulo_Codigo = value; }
        }

        public String Dic_Rotulo_Nombre
        {
            get { return _Dic_Rotulo_Nombre; }
            set { _Dic_Rotulo_Nombre = value; }
        }

        public String ver_etiqueta_nombre
        {
            get { return _ver_etiqueta_nombre; }
            set { _ver_etiqueta_nombre = value; }
        }

        public String ver_etiqueta_imagen_activa
        {
            get { return _ver_etiqueta_imagen_activa; }
            set { _ver_etiqueta_imagen_activa = value; }
        }

        public String ver_etiqueta_imagen_desactiva
        {
            get { return _ver_etiqueta_imagen_desactiva; }
            set { _ver_etiqueta_imagen_desactiva = value; }
        }

        public String tool_ver_etiqueta_nombre
        {
            get { return _tool_ver_etiqueta_nombre; }
            set { _tool_ver_etiqueta_nombre = value; }
        }

        public String Par_servidor_det_referencia
        {
            get { return _Par_servidor_det_referencia; }
            set { _Par_servidor_det_referencia = value; }
        }

        public String estado_nombre
        {
            get { return _estado_nombre; }
            set { _estado_nombre = value; }
        }

        public String grupo_nombre
        {
            get { return _grupo_nombre; }
            set { _grupo_nombre = value; }
        }

        public String Dic_Contenedor_Tipo
        {
            get { return _Dic_Contenedor_Tipo; }
            set { _Dic_Contenedor_Tipo = value; }
        }

        // Constructor
        public Seg_Menu()
        {
        }
        public Seg_Menu(String _Id, String _Codigo, String _Estado, String _Dic_Pantalla_Id, String _Grupo, Int32 _Orden, String _Int_Usuario_Id, String _Dic_Con_Elemento_Id, String _Seg_Rol_Id, String _int_usuario_codigo, String _int_usuario_nombre, String _Dic_con_elemento_Codigo, String _Dic_con_elemento_nombre, String _Dic_Pantalla_Codigo, String _Dic_Pantalla_Nombre, String _pantalla_ver_etiqueta_nombre, String _pantalla_ver_etiqueta_imagen_activa, String _pantalla_ver_etiqueta_imagen_desactiva, String _tool_pantalla_ver_etiqueta_nombre, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Dic_Contenedor_id, String _dic_contenedor_codigo, String _dic_contenedor_nombre, String _Dic_Rotulo_id, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_Nombre, String _ver_etiqueta_nombre, String _ver_etiqueta_imagen_activa, String _ver_etiqueta_imagen_desactiva, String _tool_ver_etiqueta_nombre, String _Par_servidor_det_referencia, String _estado_nombre, String _grupo_nombre, String _Dic_Contenedor_Tipo)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Dic_Pantalla_Id = _Dic_Pantalla_Id;
            this._Grupo = _Grupo;
            this._Orden = _Orden;
            this._Int_Usuario_Id = _Int_Usuario_Id;
            this._Dic_Con_Elemento_Id = _Dic_Con_Elemento_Id;
            this._Seg_Rol_Id = _Seg_Rol_Id;
            this._int_usuario_codigo = _int_usuario_codigo;
            this._int_usuario_nombre = _int_usuario_nombre;
            this._Dic_con_elemento_Codigo = _Dic_con_elemento_Codigo;
            this._Dic_con_elemento_nombre = _Dic_con_elemento_nombre;
            this._Dic_Pantalla_Codigo = _Dic_Pantalla_Codigo;
            this._Dic_Pantalla_Nombre = _Dic_Pantalla_Nombre;
            this._pantalla_ver_etiqueta_nombre = _pantalla_ver_etiqueta_nombre;
            this._pantalla_ver_etiqueta_imagen_activa = _pantalla_ver_etiqueta_imagen_activa;
            this._pantalla_ver_etiqueta_imagen_desactiva = _pantalla_ver_etiqueta_imagen_desactiva;
            this._tool_pantalla_ver_etiqueta_nombre = _tool_pantalla_ver_etiqueta_nombre;
            this._Seg_Rol_Codigo = _Seg_Rol_Codigo;
            this._Seg_Rol_Nombre = _Seg_Rol_Nombre;
            this._Dic_Contenedor_id = _Dic_Contenedor_id;
            this._dic_contenedor_codigo = _dic_contenedor_codigo;
            this._dic_contenedor_nombre = _dic_contenedor_nombre;
            this._Dic_Rotulo_id = _Dic_Rotulo_id;
            this._Dic_Rotulo_Codigo = _Dic_Rotulo_Codigo;
            this._Dic_Rotulo_Nombre = _Dic_Rotulo_Nombre;
            this._ver_etiqueta_nombre = _ver_etiqueta_nombre;
            this._ver_etiqueta_imagen_activa = _ver_etiqueta_imagen_activa;
            this._ver_etiqueta_imagen_desactiva = _ver_etiqueta_imagen_desactiva;
            this._tool_ver_etiqueta_nombre = _tool_ver_etiqueta_nombre;
            this._Par_servidor_det_referencia = _Par_servidor_det_referencia;
            this._estado_nombre = _estado_nombre;
            this._grupo_nombre = _grupo_nombre;
            this._Dic_Contenedor_Tipo = _Dic_Contenedor_Tipo;
        }

        public Seg_Menu(Seg_Menu o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Dic_Pantalla_Id = o.Dic_Pantalla_Id;
            this._Grupo = o.Grupo;
            this._Orden = o.Orden;
            this._Int_Usuario_Id = o.Int_Usuario_Id;
            this._Dic_Con_Elemento_Id = o.Dic_Con_Elemento_Id;
            this._Seg_Rol_Id = o.Seg_Rol_Id;
            this._int_usuario_codigo = o.int_usuario_codigo;
            this._int_usuario_nombre = o.int_usuario_nombre;
            this._Dic_con_elemento_Codigo = o.Dic_con_elemento_Codigo;
            this._Dic_con_elemento_nombre = o.Dic_con_elemento_nombre;
            this._Dic_Pantalla_Codigo = o.Dic_Pantalla_Codigo;
            this._Dic_Pantalla_Nombre = o.Dic_Pantalla_Nombre;
            this._pantalla_ver_etiqueta_nombre = o.pantalla_ver_etiqueta_nombre;
            this._pantalla_ver_etiqueta_imagen_activa = o.pantalla_ver_etiqueta_imagen_activa;
            this._pantalla_ver_etiqueta_imagen_desactiva = o.pantalla_ver_etiqueta_imagen_desactiva;
            this._tool_pantalla_ver_etiqueta_nombre = o.tool_pantalla_ver_etiqueta_nombre;
            this._Seg_Rol_Codigo = o.Seg_Rol_Codigo;
            this._Seg_Rol_Nombre = o.Seg_Rol_Nombre;
            this._Dic_Contenedor_id = o.Dic_Contenedor_id;
            this._dic_contenedor_codigo = o.dic_contenedor_codigo;
            this._dic_contenedor_nombre = o.dic_contenedor_nombre;
            this._Dic_Rotulo_id = o.Dic_Rotulo_id;
            this._Dic_Rotulo_Codigo = o.Dic_Rotulo_Codigo;
            this._Dic_Rotulo_Nombre = o.Dic_Rotulo_Nombre;
            this._ver_etiqueta_nombre = o.ver_etiqueta_nombre;
            this._ver_etiqueta_imagen_activa = o.ver_etiqueta_imagen_activa;
            this._ver_etiqueta_imagen_desactiva = o.ver_etiqueta_imagen_desactiva;
            this._tool_ver_etiqueta_nombre = o.tool_ver_etiqueta_nombre;
            this._Par_servidor_det_referencia = o.Par_servidor_det_referencia;
            this._estado_nombre = o.estado_nombre;
            this._grupo_nombre = o.grupo_nombre;
            this._Dic_Contenedor_Tipo = o.Dic_Contenedor_Tipo;
        }
    }
}
