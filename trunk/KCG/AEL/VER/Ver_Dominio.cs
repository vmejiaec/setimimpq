
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Dominio: Entidad
{
// Atributos
private String _Ver_Version_id;
private String _Dic_Dominio_id;
private String _ver_version_codigo;
private String _ver_version_nombre;
private String _dic_dominio_codigo;
private String _dic_dominio_nombre;
private String _Dic_Dominio_Dominio;
private String _Dic_campo_id;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Estado_Nombre;
private String _Dic_objeto_id;
private String _Dic_Objeto_codigo;
private String _Dic_Objeto_nombre;

// Propiedades de la clase
public String Ver_Version_id
{
get{return _Ver_Version_id;}
set{_Ver_Version_id=value;}
}
                  
public String Dic_Dominio_id
{
get{return _Dic_Dominio_id;}
set{_Dic_Dominio_id=value;}
}
                  
public String ver_version_codigo
{
get{return _ver_version_codigo;}
set{_ver_version_codigo=value;}
}
                  
public String ver_version_nombre
{
get{return _ver_version_nombre;}
set{_ver_version_nombre=value;}
}
                  
public String dic_dominio_codigo
{
get{return _dic_dominio_codigo;}
set{_dic_dominio_codigo=value;}
}
                  
public String dic_dominio_nombre
{
get{return _dic_dominio_nombre;}
set{_dic_dominio_nombre=value;}
}
                  
public String Dic_Dominio_Dominio
{
get{return _Dic_Dominio_Dominio;}
set{_Dic_Dominio_Dominio=value;}
}
                  
public String Dic_campo_id
{
get{return _Dic_campo_id;}
set{_Dic_campo_id=value;}
}
                  
public String Dic_Campo_Codigo
{
get{return _Dic_Campo_Codigo;}
set{_Dic_Campo_Codigo=value;}
}
                  
public String Dic_Campo_Nombre
{
get{return _Dic_Campo_Nombre;}
set{_Dic_Campo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String Dic_objeto_id
{
get{return _Dic_objeto_id;}
set{_Dic_objeto_id=value;}
}
                  
public String Dic_Objeto_codigo
{
get{return _Dic_Objeto_codigo;}
set{_Dic_Objeto_codigo=value;}
}
                  
public String Dic_Objeto_nombre
{
get{return _Dic_Objeto_nombre;}
set{_Dic_Objeto_nombre=value;}
}
                  
// Constructor
public Ver_Dominio()
{
}
 public Ver_Dominio(String _Id,String _Codigo,  String _Nombre,String _Estado,String _Ver_Version_id, String _Dic_Dominio_id, String _ver_version_codigo, String _ver_version_nombre, String _dic_dominio_codigo, String _dic_dominio_nombre, String _Dic_Dominio_Dominio, String _Dic_campo_id, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Estado_Nombre, String _Dic_objeto_id, String _Dic_Objeto_codigo, String _Dic_Objeto_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Ver_Version_id=_Ver_Version_id;
this._Dic_Dominio_id=_Dic_Dominio_id;
this._ver_version_codigo=_ver_version_codigo;
this._ver_version_nombre=_ver_version_nombre;
this._dic_dominio_codigo=_dic_dominio_codigo;
this._dic_dominio_nombre=_dic_dominio_nombre;
this._Dic_Dominio_Dominio=_Dic_Dominio_Dominio;
this._Dic_campo_id=_Dic_campo_id;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Dic_objeto_id=_Dic_objeto_id;
this._Dic_Objeto_codigo=_Dic_Objeto_codigo;
this._Dic_Objeto_nombre=_Dic_Objeto_nombre;
}
}
}
