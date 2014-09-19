
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Recursos_Base: Entidad
{
// Atributos
private String _Origen;
private String _Tipo;
private String _Ver_Etiqueta_Nombre;
private String _Tool_Ver_Etiqueta_Nombre;
private String _Ver_Etiqueta_Imagen_Activa;
private String _Ver_Etiqueta_Imagen_Desactiva;

// Propiedades de la clase
public String Origen
{
get{return _Origen;}
set{_Origen=value;}
}
                  
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Ver_Etiqueta_Nombre
{
get{return _Ver_Etiqueta_Nombre;}
set{_Ver_Etiqueta_Nombre=value;}
}
                  
public String Tool_Ver_Etiqueta_Nombre
{
get{return _Tool_Ver_Etiqueta_Nombre;}
set{_Tool_Ver_Etiqueta_Nombre=value;}
}
                  
public String Ver_Etiqueta_Imagen_Activa
{
get{return _Ver_Etiqueta_Imagen_Activa;}
set{_Ver_Etiqueta_Imagen_Activa=value;}
}
                  
public String Ver_Etiqueta_Imagen_Desactiva
{
get{return _Ver_Etiqueta_Imagen_Desactiva;}
set{_Ver_Etiqueta_Imagen_Desactiva=value;}
}
                  
// Constructor
public Par_Recursos_Base()
{
}
 public Par_Recursos_Base(String _Origen,String _Tipo,String _Nombre, String _Ver_Etiqueta_Nombre, String _Tool_Ver_Etiqueta_Nombre, String _Ver_Etiqueta_Imagen_Activa, String _Ver_Etiqueta_Imagen_Desactiva )
{
this._Origen=_Origen;
this._Tipo=_Tipo;
this.Nombre=_Nombre;
this._Ver_Etiqueta_Nombre=_Ver_Etiqueta_Nombre;
this._Tool_Ver_Etiqueta_Nombre=_Tool_Ver_Etiqueta_Nombre;
this._Ver_Etiqueta_Imagen_Activa=_Ver_Etiqueta_Imagen_Activa;
this._Ver_Etiqueta_Imagen_Desactiva=_Ver_Etiqueta_Imagen_Desactiva;
}
}
}
