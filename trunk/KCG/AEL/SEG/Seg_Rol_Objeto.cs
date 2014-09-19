
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol_Objeto: Entidad
{
// Atributos
private String _Seg_Rol_Id;
private String _Dic_Con_Objeto_Id;
private String _Tipo;
private String _Seg_Rol_Codigo;
private String _Seg_Rol_Nombre;
private String _Dic_con_Objeto_Codigo;
private String _Dic_Con_Objeto_Nombre;
private String _Dic_Objeto_id;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Dic_contenedor_Id;
private String _Dic_contenedor_Codigo;
private String _Dic_contenedor_Nombre;
private String _Tipo_nombre;
private String _Estado_nombre;

// Propiedades de la clase
public String Seg_Rol_Id
{
get{return _Seg_Rol_Id;}
set{_Seg_Rol_Id=value;}
}
                  
public String Dic_Con_Objeto_Id
{
get{return _Dic_Con_Objeto_Id;}
set{_Dic_Con_Objeto_Id=value;}
}
                  
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Seg_Rol_Codigo
{
get{return _Seg_Rol_Codigo;}
set{_Seg_Rol_Codigo=value;}
}
                  
public String Seg_Rol_Nombre
{
get{return _Seg_Rol_Nombre;}
set{_Seg_Rol_Nombre=value;}
}
                  
public String Dic_con_Objeto_Codigo
{
get{return _Dic_con_Objeto_Codigo;}
set{_Dic_con_Objeto_Codigo=value;}
}
                  
public String Dic_Con_Objeto_Nombre
{
get{return _Dic_Con_Objeto_Nombre;}
set{_Dic_Con_Objeto_Nombre=value;}
}
                  
public String Dic_Objeto_id
{
get{return _Dic_Objeto_id;}
set{_Dic_Objeto_id=value;}
}
                  
public String Dic_Objeto_Codigo
{
get{return _Dic_Objeto_Codigo;}
set{_Dic_Objeto_Codigo=value;}
}
                  
public String Dic_Objeto_Nombre
{
get{return _Dic_Objeto_Nombre;}
set{_Dic_Objeto_Nombre=value;}
}
                  
public String Dic_contenedor_Id
{
get{return _Dic_contenedor_Id;}
set{_Dic_contenedor_Id=value;}
}
                  
public String Dic_contenedor_Codigo
{
get{return _Dic_contenedor_Codigo;}
set{_Dic_contenedor_Codigo=value;}
}
                  
public String Dic_contenedor_Nombre
{
get{return _Dic_contenedor_Nombre;}
set{_Dic_contenedor_Nombre=value;}
}
                  
public String Tipo_nombre
{
get{return _Tipo_nombre;}
set{_Tipo_nombre=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Seg_Rol_Objeto()
{
}
 public Seg_Rol_Objeto(String _Id,String _Codigo, String _Estado,String _Seg_Rol_Id, String _Dic_Con_Objeto_Id, String _Tipo, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Dic_con_Objeto_Codigo, String _Dic_Con_Objeto_Nombre, String _Dic_Objeto_id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Dic_contenedor_Id, String _Dic_contenedor_Codigo, String _Dic_contenedor_Nombre, String _Tipo_nombre, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Seg_Rol_Id=_Seg_Rol_Id;
this._Dic_Con_Objeto_Id=_Dic_Con_Objeto_Id;
this._Tipo=_Tipo;
this._Seg_Rol_Codigo=_Seg_Rol_Codigo;
this._Seg_Rol_Nombre=_Seg_Rol_Nombre;
this._Dic_con_Objeto_Codigo=_Dic_con_Objeto_Codigo;
this._Dic_Con_Objeto_Nombre=_Dic_Con_Objeto_Nombre;
this._Dic_Objeto_id=_Dic_Objeto_id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Dic_contenedor_Id=_Dic_contenedor_Id;
this._Dic_contenedor_Codigo=_Dic_contenedor_Codigo;
this._Dic_contenedor_Nombre=_Dic_contenedor_Nombre;
this._Tipo_nombre=_Tipo_nombre;
this._Estado_nombre=_Estado_nombre;
}
}
}
