
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol: Entidad
{
// Atributos
private String _Descripcion;
private String _Estado_Nombre;

// Propiedades de la clase
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Seg_Rol()
{
}
 public Seg_Rol(String _Id,String _Codigo, String _Nombre,String _Estado,String _Descripcion, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Descripcion=_Descripcion;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
