
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Version: Entidad
{
// Atributos
private String _Abreviatura;
private String _Predeterminada;
private String _Ruta_Imagen;
private String _Descripcion;
private String _Predeterminada_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Abreviatura
{
get{return _Abreviatura;}
set{_Abreviatura=value;}
}
                  
public String Predeterminada
{
get{return _Predeterminada;}
set{_Predeterminada=value;}
}
                  
public String Ruta_Imagen
{
get{return _Ruta_Imagen;}
set{_Ruta_Imagen=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Predeterminada_Nombre
{
get{return _Predeterminada_Nombre;}
set{_Predeterminada_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Ver_Version()
{
}
 public Ver_Version(String _Id,String _Codigo, String _Nombre,String _Estado,String _Abreviatura, String _Predeterminada, String _Ruta_Imagen, String _Descripcion, String _Predeterminada_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Abreviatura=_Abreviatura;
this._Predeterminada=_Predeterminada;
this._Ruta_Imagen=_Ruta_Imagen;
this._Descripcion=_Descripcion;
this._Predeterminada_Nombre=_Predeterminada_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
