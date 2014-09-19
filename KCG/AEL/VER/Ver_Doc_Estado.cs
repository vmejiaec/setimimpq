
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Doc_Estado: Entidad
{
// Atributos
private String _Ver_Version_Id;
private String _Apr_Doc_Estado_Id;
private String _Descripcion;
private String _ver_version_codigo;
private String _ver_version_nombre;
private String _Apr_doc_estado_Codigo;
private String _Apr_doc_estado_Nombre;
private String _Dic_Campo_Id;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Apr_Estado_Dominio;
private String _estado_nombre;

// Propiedades de la clase
public String Ver_Version_Id
{
get{return _Ver_Version_Id;}
set{_Ver_Version_Id=value;}
}
                  
public String Apr_Doc_Estado_Id
{
get{return _Apr_Doc_Estado_Id;}
set{_Apr_Doc_Estado_Id=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
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
                  
public String Apr_doc_estado_Codigo
{
get{return _Apr_doc_estado_Codigo;}
set{_Apr_doc_estado_Codigo=value;}
}
                  
public String Apr_doc_estado_Nombre
{
get{return _Apr_doc_estado_Nombre;}
set{_Apr_doc_estado_Nombre=value;}
}
                  
public String Dic_Campo_Id
{
get{return _Dic_Campo_Id;}
set{_Dic_Campo_Id=value;}
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
                  
public String Apr_Estado_Dominio
{
get{return _Apr_Estado_Dominio;}
set{_Apr_Estado_Dominio=value;}
}
                  
public String estado_nombre
{
get{return _estado_nombre;}
set{_estado_nombre=value;}
}
                  
// Constructor
public Ver_Doc_Estado()
{
}
 public Ver_Doc_Estado(String _Id,String _Codigo,String _Nombre,String _Estado,String _Ver_Version_Id, String _Apr_Doc_Estado_Id, String _Descripcion, String _ver_version_codigo, String _ver_version_nombre, String _Apr_doc_estado_Codigo, String _Apr_doc_estado_Nombre, String _Dic_Campo_Id, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Apr_Estado_Dominio, String _estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Ver_Version_Id=_Ver_Version_Id;
this._Apr_Doc_Estado_Id=_Apr_Doc_Estado_Id;
this._Descripcion=_Descripcion;
this._ver_version_codigo=_ver_version_codigo;
this._ver_version_nombre=_ver_version_nombre;
this._Apr_doc_estado_Codigo=_Apr_doc_estado_Codigo;
this._Apr_doc_estado_Nombre=_Apr_doc_estado_Nombre;
this._Dic_Campo_Id=_Dic_Campo_Id;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Apr_Estado_Dominio=_Apr_Estado_Dominio;
this._estado_nombre=_estado_nombre;
}
}
}
