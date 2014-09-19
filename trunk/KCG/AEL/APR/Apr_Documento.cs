
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APR
{
public class Apr_Documento: Entidad
{
// Atributos
private String _Abreviatura;
private String _Dic_Campo_id;
private String _Descripcion;
private String _Dic_campo_Codigo;
private String _Dic_campo_Nombre;
private String _Dic_Objeto_Id;
private String _Dic_Objeto_codigo;
private String _Dic_Objeto_nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Abreviatura
{
get{return _Abreviatura;}
set{_Abreviatura=value;}
}
                  
public String Dic_Campo_id
{
get{return _Dic_Campo_id;}
set{_Dic_Campo_id=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Dic_campo_Codigo
{
get{return _Dic_campo_Codigo;}
set{_Dic_campo_Codigo=value;}
}
                  
public String Dic_campo_Nombre
{
get{return _Dic_campo_Nombre;}
set{_Dic_campo_Nombre=value;}
}
                  
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
}
                  
public String Dic_Objeto_codigo
{
get{return _Dic_Objeto_codigo;}
set{_Dic_Objeto_codigo=value;}
}
                  
public String Dic_Objeto_nombre
{
get{return _Dic_Objeto_nombre;}
set{_Dic_Objeto_nombre=value;}
}
                  
public String Dic_Modulo_Id
{
get{return _Dic_Modulo_Id;}
set{_Dic_Modulo_Id=value;}
}
                  
public String Dic_Modulo_Codigo
{
get{return _Dic_Modulo_Codigo;}
set{_Dic_Modulo_Codigo=value;}
}
                  
public String Dic_Modulo_Nombre
{
get{return _Dic_Modulo_Nombre;}
set{_Dic_Modulo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apr_Documento()
{
}
 public Apr_Documento(String _Id,String _Codigo, String _Nombre,String _Estado,String _Abreviatura, String _Dic_Campo_id, String _Descripcion, String _Dic_campo_Codigo, String _Dic_campo_Nombre, String _Dic_Objeto_Id, String _Dic_Objeto_codigo, String _Dic_Objeto_nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Abreviatura=_Abreviatura;
this._Dic_Campo_id=_Dic_Campo_id;
this._Descripcion=_Descripcion;
this._Dic_campo_Codigo=_Dic_campo_Codigo;
this._Dic_campo_Nombre=_Dic_campo_Nombre;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_codigo=_Dic_Objeto_codigo;
this._Dic_Objeto_nombre=_Dic_Objeto_nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
