
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Documento: Entidad
{
// Atributos
private String _Apr_Documento_Id;
private String _Ver_Version_id;
private String _apr_Documento_Codigo;
private String _Apr_Documento_Nombre;
private String _ver_version_codigo;
private String _ver_version_nombre;
private String _Dic_Campo_id;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apr_Documento_Id
{
get{return _Apr_Documento_Id;}
set{_Apr_Documento_Id=value;}
}
                  
public String Ver_Version_id
{
get{return _Ver_Version_id;}
set{_Ver_Version_id=value;}
}
                  
public String apr_Documento_Codigo
{
get{return _apr_Documento_Codigo;}
set{_apr_Documento_Codigo=value;}
}
                  
public String Apr_Documento_Nombre
{
get{return _Apr_Documento_Nombre;}
set{_Apr_Documento_Nombre=value;}
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
                  
public String Dic_Campo_id
{
get{return _Dic_Campo_id;}
set{_Dic_Campo_id=value;}
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
                  
// Constructor
public Ver_Documento()
{
}
 public Ver_Documento(String _Id,String _Codigo, String _Nombre,String _Estado,String _Apr_Documento_Id, String _Ver_Version_id, String _apr_Documento_Codigo, String _Apr_Documento_Nombre, String _ver_version_codigo, String _ver_version_nombre, String _Dic_Campo_id, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 

this.Nombre=_Nombre;
this.Estado=_Estado;
this._Apr_Documento_Id=_Apr_Documento_Id;
this._Ver_Version_id=_Ver_Version_id;
this._apr_Documento_Codigo=_apr_Documento_Codigo;
this._Apr_Documento_Nombre=_Apr_Documento_Nombre;
this._ver_version_codigo=_ver_version_codigo;
this._ver_version_nombre=_ver_version_nombre;
this._Dic_Campo_id=_Dic_Campo_id;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
