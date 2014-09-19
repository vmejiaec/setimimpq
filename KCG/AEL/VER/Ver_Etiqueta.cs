
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Etiqueta: Entidad
{
// Atributos
private String _Ver_Version_Id;
private String _Dic_Rotulo_Id;
private String _Imagen_Activa;
private String _Imagen_Desactiva;
private String _Ver_Version_Codigo;
private String _Ver_Version_Nombre;
private String _Dic_Rotulo_Codigo;
private String _Dic_Rotulo_nombre;
private String _estado_nombre;

// Propiedades de la clase
public String Ver_Version_Id
{
get{return _Ver_Version_Id;}
set{_Ver_Version_Id=value;}
}
                  
public String Dic_Rotulo_Id
{
get{return _Dic_Rotulo_Id;}
set{_Dic_Rotulo_Id=value;}
}
                  
public String Imagen_Activa
{
get{return _Imagen_Activa;}
set{_Imagen_Activa=value;}
}
                  
public String Imagen_Desactiva
{
get{return _Imagen_Desactiva;}
set{_Imagen_Desactiva=value;}
}
                  
public String Ver_Version_Codigo
{
get{return _Ver_Version_Codigo;}
set{_Ver_Version_Codigo=value;}
}
                  
public String Ver_Version_Nombre
{
get{return _Ver_Version_Nombre;}
set{_Ver_Version_Nombre=value;}
}
                  
public String Dic_Rotulo_Codigo
{
get{return _Dic_Rotulo_Codigo;}
set{_Dic_Rotulo_Codigo=value;}
}
                  
public String Dic_Rotulo_nombre
{
get{return _Dic_Rotulo_nombre;}
set{_Dic_Rotulo_nombre=value;}
}
                  
public String estado_nombre
{
get{return _estado_nombre;}
set{_estado_nombre=value;}
}
                  
// Constructor
public Ver_Etiqueta()
{
}
 public Ver_Etiqueta(String _Id,String _Codigo, String _Nombre,String _Estado,String _Ver_Version_Id, String _Dic_Rotulo_Id, String _Imagen_Activa, String _Imagen_Desactiva, String _Ver_Version_Codigo, String _Ver_Version_Nombre, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_nombre, String _estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Ver_Version_Id=_Ver_Version_Id;
this._Dic_Rotulo_Id=_Dic_Rotulo_Id;
this._Imagen_Activa=_Imagen_Activa;
this._Imagen_Desactiva=_Imagen_Desactiva;
this._Ver_Version_Codigo=_Ver_Version_Codigo;
this._Ver_Version_Nombre=_Ver_Version_Nombre;
this._Dic_Rotulo_Codigo=_Dic_Rotulo_Codigo;
this._Dic_Rotulo_nombre=_Dic_Rotulo_nombre;
this._estado_nombre=_estado_nombre;
}
}
}
