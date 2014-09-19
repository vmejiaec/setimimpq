
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Dominio: Entidad
{
// Atributos
private String _Dic_Campo_Id;
private String _Dominio;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Dic_Objeto_Id;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Nombre;
private String _Dic_Modulo_Codigo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Dic_Campo_Id
{
get{return _Dic_Campo_Id;}
set{_Dic_Campo_Id=value;}
}
                  
public String Dominio
{
get{return _Dominio;}
set{_Dominio=value;}
}
                  
public String Dic_Campo_Codigo
{
get{return _Dic_Campo_Codigo;}
set{_Dic_Campo_Codigo=value;}
}
                  
public String Dic_Campo_Nombre
{
get{return _Dic_Campo_Nombre;}
set{_Dic_Campo_Nombre=value;}
}
                  
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
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
                  
public String Dic_Modulo_Id
{
get{return _Dic_Modulo_Id;}
set{_Dic_Modulo_Id=value;}
}
                  
public String Dic_Modulo_Nombre
{
get{return _Dic_Modulo_Nombre;}
set{_Dic_Modulo_Nombre=value;}
}
                  
public String Dic_Modulo_Codigo
{
get{return _Dic_Modulo_Codigo;}
set{_Dic_Modulo_Codigo=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Dic_Dominio()
{
}
 public Dic_Dominio(String _Id,String _Codigo, String _Nombre,String _Estado,String _Dic_Campo_Id, String _Dominio, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Nombre, String _Dic_Modulo_Codigo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Dic_Campo_Id=_Dic_Campo_Id;
this._Dominio=_Dominio;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
