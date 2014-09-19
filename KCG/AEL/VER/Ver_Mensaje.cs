
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.VER
{
public class Ver_Mensaje: Entidad
{
// Atributos
private String _Ver_Version_Id;
private String _Par_Mensaje_Id;
private String _ver_version_codigo;
private String _ver_version_nombre;
private String _par_mensaje_codigo;
private String _par_mensaje_nombre;
private String _par_mensaje_codigo_mensaje;
private String _Estado_nombre;

// Propiedades de la clase
public String Ver_Version_Id
{
get{return _Ver_Version_Id;}
set{_Ver_Version_Id=value;}
}
                  
public String Par_Mensaje_Id
{
get{return _Par_Mensaje_Id;}
set{_Par_Mensaje_Id=value;}
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
                  
public String par_mensaje_codigo
{
get{return _par_mensaje_codigo;}
set{_par_mensaje_codigo=value;}
}
                  
public String par_mensaje_nombre
{
get{return _par_mensaje_nombre;}
set{_par_mensaje_nombre=value;}
}
                  
public String par_mensaje_codigo_mensaje
{
get{return _par_mensaje_codigo_mensaje;}
set{_par_mensaje_codigo_mensaje=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Ver_Mensaje()
{
}
 public Ver_Mensaje(String _Id,String _Codigo, String _Nombre,String _Estado,String _Ver_Version_Id, String _Par_Mensaje_Id, String _ver_version_codigo, String _ver_version_nombre, String _par_mensaje_codigo, String _par_mensaje_nombre, String _par_mensaje_codigo_mensaje, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Ver_Version_Id=_Ver_Version_Id;
this._Par_Mensaje_Id=_Par_Mensaje_Id;
this._ver_version_codigo=_ver_version_codigo;
this._ver_version_nombre=_ver_version_nombre;
this._par_mensaje_codigo=_par_mensaje_codigo;
this._par_mensaje_nombre=_par_mensaje_nombre;
this._par_mensaje_codigo_mensaje=_par_mensaje_codigo_mensaje;
this._Estado_nombre=_Estado_nombre;
}
}
}
