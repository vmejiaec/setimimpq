
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Mensaje: Entidad
{
// Atributos
private String _Codigo_Mensaje;
private String _Tipo;
private String _Tipo_Nombre;
private String _Estado_Nombre;
private String _Ver_etiqueta_nombre;
private String _Tool_Ver_etiqueta_nombre;

// Propiedades de la clase
public String Codigo_Mensaje
{
get{return _Codigo_Mensaje;}
set{_Codigo_Mensaje=value;}
}
                  
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Tipo_Nombre
{
get{return _Tipo_Nombre;}
set{_Tipo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String Ver_etiqueta_nombre
{
get{return _Ver_etiqueta_nombre;}
set{_Ver_etiqueta_nombre=value;}
}
                  
public String Tool_Ver_etiqueta_nombre
{
get{return _Tool_Ver_etiqueta_nombre;}
set{_Tool_Ver_etiqueta_nombre=value;}
}
                  
// Constructor
public Par_Mensaje()
{
}
 public Par_Mensaje(String _Id,String _Codigo, String _Nombre,String _Estado,String _Codigo_Mensaje, String _Tipo, String _Tipo_Nombre, String _Estado_Nombre, String _Ver_etiqueta_nombre, String _Tool_Ver_etiqueta_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Codigo_Mensaje=_Codigo_Mensaje;
this._Tipo=_Tipo;
this._Tipo_Nombre=_Tipo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Ver_etiqueta_nombre=_Ver_etiqueta_nombre;
this._Tool_Ver_etiqueta_nombre=_Tool_Ver_etiqueta_nombre;
}
}
}
