
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol_Elemento: Entidad
{
    // Atributos
    private String _Seg_Rol_Id;
    private String _Dic_Con_Elemento_Id;
    private String _Estado_Nombre;
    private String _Seg_Rol_Codigo;
    private String _Seg_Rol_Nombre;
    private String _Dic_Con_Elemento_Codigo;
    private String _Dic_Con_Elemento_Nombre;
    private String _Dic_Rotulo_Id;
    private String _Dic_Rotulo_Codigo;
    private String _Dic_Rotulo_Nombre;
    private String _Tool_Dic_Rotulo_Id;
    private String _Tool_Dic_Rotulo_Codigo;
    private String _Tool_Dic_Rotulo_Nombre;
    private String _Dic_Contenedor_Id;
    private String _Dic_Contenedor_Codigo;
    private String _Dic_Contenedor_Nombre;
    private String _Ver_Etiqueta_Nombre;
    private String _Tool_Ver_Etiqueta_Nombre;

    // Propiedades de la clase
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

    public String Dic_Con_Elemento_Nombre
    {
        get { return _Dic_Con_Elemento_Nombre; }
        set { _Dic_Con_Elemento_Nombre = value; }
    }

    public String Dic_Rotulo_Id
    {
        get { return _Dic_Rotulo_Id; }
        set { _Dic_Rotulo_Id = value; }
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

    public String Tool_Dic_Rotulo_Id
    {
        get { return _Tool_Dic_Rotulo_Id; }
        set { _Tool_Dic_Rotulo_Id = value; }
    }

    public String Tool_Dic_Rotulo_Codigo
    {
        get { return _Tool_Dic_Rotulo_Codigo; }
        set { _Tool_Dic_Rotulo_Codigo = value; }
    }

    public String Tool_Dic_Rotulo_Nombre
    {
        get { return _Tool_Dic_Rotulo_Nombre; }
        set { _Tool_Dic_Rotulo_Nombre = value; }
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

    public String Ver_Etiqueta_Nombre
    {
        get { return _Ver_Etiqueta_Nombre; }
        set { _Ver_Etiqueta_Nombre = value; }
    }

    public String Tool_Ver_Etiqueta_Nombre
    {
        get { return _Tool_Ver_Etiqueta_Nombre; }
        set { _Tool_Ver_Etiqueta_Nombre = value; }
    }

    // Constructor
    public Seg_Rol_Elemento()
    {
    }
    public Seg_Rol_Elemento(String _Id, String _Codigo, String _Estado, String _Seg_Rol_Id, String _Dic_Con_Elemento_Id, String _Estado_Nombre, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Dic_Con_Elemento_Codigo, String _Dic_Con_Elemento_Nombre, String _Dic_Rotulo_Id, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_Nombre, String _Tool_Dic_Rotulo_Id, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_Nombre, String _Dic_Contenedor_Id, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Ver_Etiqueta_Nombre, String _Tool_Ver_Etiqueta_Nombre)
    {
        this.Id = _Id;
        this.Codigo = _Codigo;
        this.Estado = _Estado;
        this._Seg_Rol_Id = _Seg_Rol_Id;
        this._Dic_Con_Elemento_Id = _Dic_Con_Elemento_Id;
        this._Estado_Nombre = _Estado_Nombre;
        this._Seg_Rol_Codigo = _Seg_Rol_Codigo;
        this._Seg_Rol_Nombre = _Seg_Rol_Nombre;
        this._Dic_Con_Elemento_Codigo = _Dic_Con_Elemento_Codigo;
        this._Dic_Con_Elemento_Nombre = _Dic_Con_Elemento_Nombre;
        this._Dic_Rotulo_Id = _Dic_Rotulo_Id;
        this._Dic_Rotulo_Codigo = _Dic_Rotulo_Codigo;
        this._Dic_Rotulo_Nombre = _Dic_Rotulo_Nombre;
        this._Tool_Dic_Rotulo_Id = _Tool_Dic_Rotulo_Id;
        this._Tool_Dic_Rotulo_Codigo = _Tool_Dic_Rotulo_Codigo;
        this._Tool_Dic_Rotulo_Nombre = _Tool_Dic_Rotulo_Nombre;
        this._Dic_Contenedor_Id = _Dic_Contenedor_Id;
        this._Dic_Contenedor_Codigo = _Dic_Contenedor_Codigo;
        this._Dic_Contenedor_Nombre = _Dic_Contenedor_Nombre;
        this._Ver_Etiqueta_Nombre = _Ver_Etiqueta_Nombre;
        this._Tool_Ver_Etiqueta_Nombre = _Tool_Ver_Etiqueta_Nombre;
    }
    public Seg_Rol_Elemento(Seg_Rol_Elemento o)
    {
        this.Id = o.Id;
        this.Codigo = o.Codigo;
        this.Estado = o.Estado;
        this._Seg_Rol_Id = o.Seg_Rol_Id;
        this._Dic_Con_Elemento_Id = o.Dic_Con_Elemento_Id;
        this._Estado_Nombre = o.Estado_Nombre;
        this._Seg_Rol_Codigo = o.Seg_Rol_Codigo;
        this._Seg_Rol_Nombre = o.Seg_Rol_Nombre;
        this._Dic_Con_Elemento_Codigo = o.Dic_Con_Elemento_Codigo;
        this._Dic_Con_Elemento_Nombre = o.Dic_Con_Elemento_Nombre;
        this._Dic_Rotulo_Id = o.Dic_Rotulo_Id;
        this._Dic_Rotulo_Codigo = o.Dic_Rotulo_Codigo;
        this._Dic_Rotulo_Nombre = o.Dic_Rotulo_Nombre;
        this._Tool_Dic_Rotulo_Id = o.Tool_Dic_Rotulo_Id;
        this._Tool_Dic_Rotulo_Codigo = o.Tool_Dic_Rotulo_Codigo;
        this._Tool_Dic_Rotulo_Nombre = o.Tool_Dic_Rotulo_Nombre;
        this._Dic_Contenedor_Id = o.Dic_Contenedor_Id;
        this._Dic_Contenedor_Codigo = o.Dic_Contenedor_Codigo;
        this._Dic_Contenedor_Nombre = o.Dic_Contenedor_Nombre;
        this._Ver_Etiqueta_Nombre = o.Ver_Etiqueta_Nombre;
        this._Tool_Ver_Etiqueta_Nombre = o.Tool_Ver_Etiqueta_Nombre;
    }
}
}
