
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Rubro_Documento: Entidad
{
// Atributos
private String _Apu_Proyecto_Rubro_Id;
private String _Ruta;
private String _Descripcion;
private String _Apu_Proyecto_Rubro_Codigo;
private String _Apu_Proyecto_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Path_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Proyecto_Rubro_Id
{
get{return _Apu_Proyecto_Rubro_Id;}
set{_Apu_Proyecto_Rubro_Id=value;}
}
                  
public String Ruta
{
get{return _Ruta;}
set{_Ruta=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Apu_Proyecto_Rubro_Codigo
{
get{return _Apu_Proyecto_Rubro_Codigo;}
set{_Apu_Proyecto_Rubro_Codigo=value;}
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
                  
public String Path_Nombre
{
get{return _Path_Nombre;}
set{_Path_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Proyecto_Rubro_Documento()
{
}
 public Apu_Proyecto_Rubro_Documento(String _Id,String _Codigo, String _Nombre,String _Estado,String _Apu_Proyecto_Rubro_Id, String _Ruta, String _Descripcion, String _Apu_Proyecto_Rubro_Codigo, String _Apu_Proyecto_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Path_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Apu_Proyecto_Rubro_Id=_Apu_Proyecto_Rubro_Id;
this._Ruta=_Ruta;
this._Descripcion=_Descripcion;
this._Apu_Proyecto_Rubro_Codigo=_Apu_Proyecto_Rubro_Codigo;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Path_Nombre=_Path_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
