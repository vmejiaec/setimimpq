
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Rubro_Tecnica: Entidad
{
// Atributos
private String _Apu_Proyecto_Rubro_Id;
private String _Imagen;
private String _Origen_Imagen;
private String _Definicion;
private String _Especificacion;
private String _Medicion;
private String _Apu_Proyecto_Rubro_Codigo;
private String _Path_Imagen;
private String _Path_Origen_Imagen;
private String _Apu_Proyecto_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Subtitulo_Id;
private String _Apu_Subtitulo_Codigo;
private String _Apu_Subtitulo_Nombre;
private String _Apu_Titulo_Id;
private String _Apu_Titulo_Codigo;
private String _Apu_Titulo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Proyecto_Rubro_Id
{
get{return _Apu_Proyecto_Rubro_Id;}
set{_Apu_Proyecto_Rubro_Id=value;}
}
                  
public String Imagen
{
get{return _Imagen;}
set{_Imagen=value;}
}
                  
public String Origen_Imagen
{
get{return _Origen_Imagen;}
set{_Origen_Imagen=value;}
}
                  
public String Definicion
{
get{return _Definicion;}
set{_Definicion=value;}
}
                  
public String Especificacion
{
get{return _Especificacion;}
set{_Especificacion=value;}
}
                  
public String Medicion
{
get{return _Medicion;}
set{_Medicion=value;}
}
                  
public String Apu_Proyecto_Rubro_Codigo
{
get{return _Apu_Proyecto_Rubro_Codigo;}
set{_Apu_Proyecto_Rubro_Codigo=value;}
}
                  
public String Path_Imagen
{
get{return _Path_Imagen;}
set{_Path_Imagen=value;}
}
                  
public String Path_Origen_Imagen
{
get{return _Path_Origen_Imagen;}
set{_Path_Origen_Imagen=value;}
}
                  
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Proyecto_Codigo
{
get{return _Apu_Proyecto_Codigo;}
set{_Apu_Proyecto_Codigo=value;}
}
                  
public String Apu_Proyecto_Nombre
{
get{return _Apu_Proyecto_Nombre;}
set{_Apu_Proyecto_Nombre=value;}
}
                  
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
}
                  
public String Apu_Rubro_Codigo
{
get{return _Apu_Rubro_Codigo;}
set{_Apu_Rubro_Codigo=value;}
}
                  
public String Apu_Rubro_Nombre
{
get{return _Apu_Rubro_Nombre;}
set{_Apu_Rubro_Nombre=value;}
}
                  
public String Apu_Rubro_Unidad
{
get{return _Apu_Rubro_Unidad;}
set{_Apu_Rubro_Unidad=value;}
}
                  
public String Apu_Subtitulo_Id
{
get{return _Apu_Subtitulo_Id;}
set{_Apu_Subtitulo_Id=value;}
}
                  
public String Apu_Subtitulo_Codigo
{
get{return _Apu_Subtitulo_Codigo;}
set{_Apu_Subtitulo_Codigo=value;}
}
                  
public String Apu_Subtitulo_Nombre
{
get{return _Apu_Subtitulo_Nombre;}
set{_Apu_Subtitulo_Nombre=value;}
}
                  
public String Apu_Titulo_Id
{
get{return _Apu_Titulo_Id;}
set{_Apu_Titulo_Id=value;}
}
                  
public String Apu_Titulo_Codigo
{
get{return _Apu_Titulo_Codigo;}
set{_Apu_Titulo_Codigo=value;}
}
                  
public String Apu_Titulo_Nombre
{
get{return _Apu_Titulo_Nombre;}
set{_Apu_Titulo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Proyecto_Rubro_Tecnica()
{
}
 public Apu_Proyecto_Rubro_Tecnica(String _Id,String _Codigo, String _Estado,String _Apu_Proyecto_Rubro_Id, String _Imagen, String _Origen_Imagen, String _Definicion, String _Especificacion, String _Medicion, String _Apu_Proyecto_Rubro_Codigo, String _Path_Imagen, String _Path_Origen_Imagen, String _Apu_Proyecto_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Subtitulo_Id, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_Id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Proyecto_Rubro_Id=_Apu_Proyecto_Rubro_Id;
this._Imagen=_Imagen;
this._Origen_Imagen=_Origen_Imagen;
this._Definicion=_Definicion;
this._Especificacion=_Especificacion;
this._Medicion=_Medicion;
this._Apu_Proyecto_Rubro_Codigo=_Apu_Proyecto_Rubro_Codigo;
this._Path_Imagen=_Path_Imagen;
this._Path_Origen_Imagen=_Path_Origen_Imagen;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Subtitulo_Id=_Apu_Subtitulo_Id;
this._Apu_Subtitulo_Codigo=_Apu_Subtitulo_Codigo;
this._Apu_Subtitulo_Nombre=_Apu_Subtitulo_Nombre;
this._Apu_Titulo_Id=_Apu_Titulo_Id;
this._Apu_Titulo_Codigo=_Apu_Titulo_Codigo;
this._Apu_Titulo_Nombre=_Apu_Titulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
