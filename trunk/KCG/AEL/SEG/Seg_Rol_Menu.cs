
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol_Menu: Entidad
{
    // Atributos
    private String _Dic_Pantalla_Id;
    private String _Grupo;
    private String _Seg_Rol_Id;
    private String _Dic_Con_Elemento_Id;
    private String _Estado_Nombre;
    private String _Grupo_Nombre;
    private String _Dic_Pantalla_Codigo;
    private String _Dic_Pantalla_Nombre;
    private String _Seg_Rol_Codigo;
    private String _Seg_Rol_Nombre;
    private String _Dic_Con_Elemento_Codigo;
    private String _Dic_con_elemento_nombre;
    private String _Dic_Contenedor_Id;
    private String _Dic_Contenedor_Codigo;
    private String _Dic_Contenedor_Nombre;
    private String _Pantalla_Dic_Rotulo_Id;
    private String _Pantalla_Dic_Rotulo_Codigo;
    private String _Pantalla_Dic_Rotulo_Nombre;
    private String _Pantalla_Ver_Etiqueta_nombre;
    private String _Elemento_Dic_Rotulo_Id;
    private String _Elemento_Dic_Rotulo_Codigo;
    private String _Elemento_Dic_Rotulo_Nombre;
    private String _Elemento_Ver_Etiqueta_nombre;

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

    public String Seg_Rol_Id
    {
        get { return _Seg_Rol_Id; }
        set { _Seg_Rol_Id = value; }
    }

    public String Dic_Con_Elemento_Id
    {
        get { return _Dic_Con_Elemento_Id; }
        set { _Dic_Con_Elemento_Id = value; }
    }

    public String Estado_Nombre
    {
        get { return _Estado_Nombre; }
        set { _Estado_Nombre = value; }
    }

    public String Grupo_Nombre
    {
        get { return _Grupo_Nombre; }
        set { _Grupo_Nombre = value; }
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

    public String Dic_Con_Elemento_Codigo
    {
        get { return _Dic_Con_Elemento_Codigo; }
        set { _Dic_Con_Elemento_Codigo = value; }
    }

    public String Dic_con_elemento_nombre
    {
        get { return _Dic_con_elemento_nombre; }
        set { _Dic_con_elemento_nombre = value; }
    }

    public String Dic_Contenedor_Id
    {
        get { return _Dic_Contenedor_Id; }
        set { _Dic_Contenedor_Id = value; }
    }

    public String Dic_Contenedor_Codigo
    {
        get { return _Dic_Contenedor_Codigo; }
        set { _Dic_Contenedor_Codigo = value; }
    }

    public String Dic_Contenedor_Nombre
    {
        get { return _Dic_Contenedor_Nombre; }
        set { _Dic_Contenedor_Nombre = value; }
    }

    public String Pantalla_Dic_Rotulo_Id
    {
        get { return _Pantalla_Dic_Rotulo_Id; }
        set { _Pantalla_Dic_Rotulo_Id = value; }
    }

    public String Pantalla_Dic_Rotulo_Codigo
    {
        get { return _Pantalla_Dic_Rotulo_Codigo; }
        set { _Pantalla_Dic_Rotulo_Codigo = value; }
    }

    public String Pantalla_Dic_Rotulo_Nombre
    {
        get { return _Pantalla_Dic_Rotulo_Nombre; }
        set { _Pantalla_Dic_Rotulo_Nombre = value; }
    }

    public String Pantalla_Ver_Etiqueta_nombre
    {
        get { return _Pantalla_Ver_Etiqueta_nombre; }
        set { _Pantalla_Ver_Etiqueta_nombre = value; }
    }

    public String Elemento_Dic_Rotulo_Id
    {
        get { return _Elemento_Dic_Rotulo_Id; }
        set { _Elemento_Dic_Rotulo_Id = value; }
    }

    public String Elemento_Dic_Rotulo_Codigo
    {
        get { return _Elemento_Dic_Rotulo_Codigo; }
        set { _Elemento_Dic_Rotulo_Codigo = value; }
    }

    public String Elemento_Dic_Rotulo_Nombre
    {
        get { return _Elemento_Dic_Rotulo_Nombre; }
        set { _Elemento_Dic_Rotulo_Nombre = value; }
    }

    public String Elemento_Ver_Etiqueta_nombre
    {
        get { return _Elemento_Ver_Etiqueta_nombre; }
        set { _Elemento_Ver_Etiqueta_nombre = value; }
    }

    // Constructor
    public Seg_Rol_Menu()
    {
    }
    public Seg_Rol_Menu(String _Id, String _Codigo, String _Estado, String _Dic_Pantalla_Id, String _Grupo, String _Seg_Rol_Id, String _Dic_Con_Elemento_Id, String _Estado_Nombre, String _Grupo_Nombre, String _Dic_Pantalla_Codigo, String _Dic_Pantalla_Nombre, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Dic_Con_Elemento_Codigo, String _Dic_con_elemento_nombre, String _Dic_Contenedor_Id, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Pantalla_Dic_Rotulo_Id, String _Pantalla_Dic_Rotulo_Codigo, String _Pantalla_Dic_Rotulo_Nombre, String _Pantalla_Ver_Etiqueta_nombre, String _Elemento_Dic_Rotulo_Id, String _Elemento_Dic_Rotulo_Codigo, String _Elemento_Dic_Rotulo_Nombre, String _Elemento_Ver_Etiqueta_nombre)
    {
        this.Id = _Id;
        this.Codigo = _Codigo;
        this.Estado = _Estado;
        this._Dic_Pantalla_Id = _Dic_Pantalla_Id;
        this._Grupo = _Grupo;
        this._Seg_Rol_Id = _Seg_Rol_Id;
        this._Dic_Con_Elemento_Id = _Dic_Con_Elemento_Id;
        this._Estado_Nombre = _Estado_Nombre;
        this._Grupo_Nombre = _Grupo_Nombre;
        this._Dic_Pantalla_Codigo = _Dic_Pantalla_Codigo;
        this._Dic_Pantalla_Nombre = _Dic_Pantalla_Nombre;
        this._Seg_Rol_Codigo = _Seg_Rol_Codigo;
        this._Seg_Rol_Nombre = _Seg_Rol_Nombre;
        this._Dic_Con_Elemento_Codigo = _Dic_Con_Elemento_Codigo;
        this._Dic_con_elemento_nombre = _Dic_con_elemento_nombre;
        this._Dic_Contenedor_Id = _Dic_Contenedor_Id;
        this._Dic_Contenedor_Codigo = _Dic_Contenedor_Codigo;
        this._Dic_Contenedor_Nombre = _Dic_Contenedor_Nombre;
        this._Pantalla_Dic_Rotulo_Id = _Pantalla_Dic_Rotulo_Id;
        this._Pantalla_Dic_Rotulo_Codigo = _Pantalla_Dic_Rotulo_Codigo;
        this._Pantalla_Dic_Rotulo_Nombre = _Pantalla_Dic_Rotulo_Nombre;
        this._Pantalla_Ver_Etiqueta_nombre = _Pantalla_Ver_Etiqueta_nombre;
        this._Elemento_Dic_Rotulo_Id = _Elemento_Dic_Rotulo_Id;
        this._Elemento_Dic_Rotulo_Codigo = _Elemento_Dic_Rotulo_Codigo;
        this._Elemento_Dic_Rotulo_Nombre = _Elemento_Dic_Rotulo_Nombre;
        this._Elemento_Ver_Etiqueta_nombre = _Elemento_Ver_Etiqueta_nombre;
    }
    public Seg_Rol_Menu(Seg_Rol_Menu o)
    {
        this.Id = o.Id;
        this.Codigo = o.Codigo;
        this.Estado = o.Estado;
        this._Dic_Pantalla_Id = o.Dic_Pantalla_Id;
        this._Grupo = o.Grupo;
        this._Seg_Rol_Id = o.Seg_Rol_Id;
        this._Dic_Con_Elemento_Id = o.Dic_Con_Elemento_Id;
        this._Estado_Nombre = o.Estado_Nombre;
        this._Grupo_Nombre = o.Grupo_Nombre;
        this._Dic_Pantalla_Codigo = o.Dic_Pantalla_Codigo;
        this._Dic_Pantalla_Nombre = o.Dic_Pantalla_Nombre;
        this._Seg_Rol_Codigo = o.Seg_Rol_Codigo;
        this._Seg_Rol_Nombre = o.Seg_Rol_Nombre;
        this._Dic_Con_Elemento_Codigo = o.Dic_Con_Elemento_Codigo;
        this._Dic_con_elemento_nombre = o.Dic_con_elemento_nombre;
        this._Dic_Contenedor_Id = o.Dic_Contenedor_Id;
        this._Dic_Contenedor_Codigo = o.Dic_Contenedor_Codigo;
        this._Dic_Contenedor_Nombre = o.Dic_Contenedor_Nombre;
        this._Pantalla_Dic_Rotulo_Id = o.Pantalla_Dic_Rotulo_Id;
        this._Pantalla_Dic_Rotulo_Codigo = o.Pantalla_Dic_Rotulo_Codigo;
        this._Pantalla_Dic_Rotulo_Nombre = o.Pantalla_Dic_Rotulo_Nombre;
        this._Pantalla_Ver_Etiqueta_nombre = o.Pantalla_Ver_Etiqueta_nombre;
        this._Elemento_Dic_Rotulo_Id = o.Elemento_Dic_Rotulo_Id;
        this._Elemento_Dic_Rotulo_Codigo = o.Elemento_Dic_Rotulo_Codigo;
        this._Elemento_Dic_Rotulo_Nombre = o.Elemento_Dic_Rotulo_Nombre;
        this._Elemento_Ver_Etiqueta_nombre = o.Elemento_Ver_Etiqueta_nombre;
    }
}
}
