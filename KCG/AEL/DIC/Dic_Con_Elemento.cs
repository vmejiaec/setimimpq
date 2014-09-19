
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Con_Elemento: Entidad
{
// Atributos
private String _Tipo;
private String _Dic_Contenedor_id;
private String _Dic_Rotulo_id;
private String _Tool_Dic_Rotulo_Id;
private String _Tipo_Nombre;
private String _Dic_Contenedor_Codigo;
private String _Dic_Contenedor_Nombre;
private String _Contenedor_Dic_Modulo_Id;
private String _Contenedor_Dic_Modulo_Codigo;
private String _Contenedor_Dic_Modulo_Nombre;
private String _Dic_Rotulo_Codigo;
private String _Dic_Rotulo_nombre;
private String _Tool_Dic_Rotulo_Codigo;
private String _Tool_Dic_Rotulo_nombre;
private String _Estado_Nombre;
private String _Ver_etiqueta_nombre;
private String _Tool_Ver_etiqueta_nombre;

// Propiedades de la clase
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Dic_Contenedor_id
{
get{return _Dic_Contenedor_id;}
set{_Dic_Contenedor_id=value;}
}
                  
public String Dic_Rotulo_id
{
get{return _Dic_Rotulo_id;}
set{_Dic_Rotulo_id=value;}
}
                  
public String Tool_Dic_Rotulo_Id
{
get{return _Tool_Dic_Rotulo_Id;}
set{_Tool_Dic_Rotulo_Id=value;}
}
                  
public String Tipo_Nombre
{
get{return _Tipo_Nombre;}
set{_Tipo_Nombre=value;}
}
                  
public String Dic_Contenedor_Codigo
{
get{return _Dic_Contenedor_Codigo;}
set{_Dic_Contenedor_Codigo=value;}
}
                  
public String Dic_Contenedor_Nombre
{
get{return _Dic_Contenedor_Nombre;}
set{_Dic_Contenedor_Nombre=value;}
}
                  
public String Contenedor_Dic_Modulo_Id
{
get{return _Contenedor_Dic_Modulo_Id;}
set{_Contenedor_Dic_Modulo_Id=value;}
}
                  
public String Contenedor_Dic_Modulo_Codigo
{
get{return _Contenedor_Dic_Modulo_Codigo;}
set{_Contenedor_Dic_Modulo_Codigo=value;}
}
                  
public String Contenedor_Dic_Modulo_Nombre
{
get{return _Contenedor_Dic_Modulo_Nombre;}
set{_Contenedor_Dic_Modulo_Nombre=value;}
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
                  
public String Tool_Dic_Rotulo_Codigo
{
get{return _Tool_Dic_Rotulo_Codigo;}
set{_Tool_Dic_Rotulo_Codigo=value;}
}
                  
public String Tool_Dic_Rotulo_nombre
{
get{return _Tool_Dic_Rotulo_nombre;}
set{_Tool_Dic_Rotulo_nombre=value;}
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
public Dic_Con_Elemento()
{
}
 public Dic_Con_Elemento(String _Id,String _Codigo, String _Nombre,String _Estado,String _Tipo, String _Dic_Contenedor_id, String _Dic_Rotulo_id, String _Tool_Dic_Rotulo_Id, String _Tipo_Nombre, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Contenedor_Dic_Modulo_Id, String _Contenedor_Dic_Modulo_Codigo, String _Contenedor_Dic_Modulo_Nombre, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_nombre, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_nombre, String _Estado_Nombre, String _Ver_etiqueta_nombre, String _Tool_Ver_etiqueta_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Tipo=_Tipo;
this._Dic_Contenedor_id=_Dic_Contenedor_id;
this._Dic_Rotulo_id=_Dic_Rotulo_id;
this._Tool_Dic_Rotulo_Id=_Tool_Dic_Rotulo_Id;
this._Tipo_Nombre=_Tipo_Nombre;
this._Dic_Contenedor_Codigo=_Dic_Contenedor_Codigo;
this._Dic_Contenedor_Nombre=_Dic_Contenedor_Nombre;
this._Contenedor_Dic_Modulo_Id=_Contenedor_Dic_Modulo_Id;
this._Contenedor_Dic_Modulo_Codigo=_Contenedor_Dic_Modulo_Codigo;
this._Contenedor_Dic_Modulo_Nombre=_Contenedor_Dic_Modulo_Nombre;
this._Dic_Rotulo_Codigo=_Dic_Rotulo_Codigo;
this._Dic_Rotulo_nombre=_Dic_Rotulo_nombre;
this._Tool_Dic_Rotulo_Codigo=_Tool_Dic_Rotulo_Codigo;
this._Tool_Dic_Rotulo_nombre=_Tool_Dic_Rotulo_nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Ver_etiqueta_nombre=_Ver_etiqueta_nombre;
this._Tool_Ver_etiqueta_nombre=_Tool_Ver_etiqueta_nombre;
}
}
}
