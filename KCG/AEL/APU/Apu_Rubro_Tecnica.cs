
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Rubro_Tecnica: Entidad
{
// Atributos
private String _Apu_Rubro_Id;
private String _Imagen;
private String _Origen_Imagen;
private String _Definicion;
private String _Especificacion;
private String _Medicion;
private String _Path_Imagen;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
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
                  
public String Path_Imagen
{
get{return _Path_Imagen;}
set{_Path_Imagen=value;}
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
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Rubro_Tecnica()
{
}
 public Apu_Rubro_Tecnica(String _Id,String _Codigo, String _Estado,String _Apu_Rubro_Id, String _Imagen, String _Origen_Imagen, String _Definicion, String _Especificacion, String _Medicion, String _Path_Imagen, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Imagen=_Imagen;
this._Origen_Imagen=_Origen_Imagen;
this._Definicion=_Definicion;
this._Especificacion=_Especificacion;
this._Medicion=_Medicion;
this._Path_Imagen=_Path_Imagen;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
