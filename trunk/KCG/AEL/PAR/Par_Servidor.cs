
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Servidor: Entidad
{
// Atributos
private String _Descripcion;
private String _Ruta;
private String _estado_nombre;

// Propiedades de la clase
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Ruta
{
get{return _Ruta;}
set{_Ruta=value;}
}
                  
public String estado_nombre
{
get{return _estado_nombre;}
set{_estado_nombre=value;}
}
                  
// Constructor
public Par_Servidor()
{
}
 public Par_Servidor(String _Id,String _Codigo, String _Nombre,String _Estado,String _Descripcion, String _Ruta, String _estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Descripcion=_Descripcion;
this._Ruta=_Ruta;
this._estado_nombre=_estado_nombre;
}
}
}
