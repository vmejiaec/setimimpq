
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_General: Entidad
{
// Atributos
private String _Tipo;
private String _Dominio;
private Int32 _Orden;
private String _Dic_Rotulo_Id;
private String _Tool_Dic_Rotulo_Id;
private String _Dic_Rotulo_Codigo;
private String _Dic_Rotulo_nombre;
private String _Tool_Dic_Rotulo_Codigo;
private String _Tool_Dic_Rotulo_nombre;
private String _Ver_Version_Id;
private String _Ver_Version_Codigo;
private String _Ver_Version_Nombre;
private String _Dominio_Nombre;
private String _Estado_Nombre;
private String _Tipo_Nombre;
private String _Ver_Version_Nombre1;
private String _Tool_Ver_Version_Nombre;

// Propiedades de la clase
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Dominio
{
get{return _Dominio;}
set{_Dominio=value;}
}
                  
public Int32 Orden
{
get{return _Orden;}
set{_Orden=value;}
}
                  
public String Dic_Rotulo_Id
{
get{return _Dic_Rotulo_Id;}
set{_Dic_Rotulo_Id=value;}
}
                  
public String Tool_Dic_Rotulo_Id
{
get{return _Tool_Dic_Rotulo_Id;}
set{_Tool_Dic_Rotulo_Id=value;}
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
                  
public String Ver_Version_Id
{
get{return _Ver_Version_Id;}
set{_Ver_Version_Id=value;}
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
                  
public String Dominio_Nombre
{
get{return _Dominio_Nombre;}
set{_Dominio_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String Tipo_Nombre
{
get{return _Tipo_Nombre;}
set{_Tipo_Nombre=value;}
}
                  
public String Ver_Version_Nombre1
{
get{return _Ver_Version_Nombre1;}
set{_Ver_Version_Nombre1=value;}
}
                  
public String Tool_Ver_Version_Nombre
{
get{return _Tool_Ver_Version_Nombre;}
set{_Tool_Ver_Version_Nombre=value;}
}
                  
// Constructor
public Dic_General()
{
}
 public Dic_General(String _Id,String _Codigo, String _Nombre,String _Estado,String _Tipo, String _Dominio, Int32 _Orden, String _Dic_Rotulo_Id, String _Tool_Dic_Rotulo_Id, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_nombre, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_nombre, String _Ver_Version_Id, String _Ver_Version_Codigo, String _Ver_Version_Nombre, String _Dominio_Nombre, String _Estado_Nombre, String _Tipo_Nombre, String _Ver_Version_Nombre1, String _Tool_Ver_Version_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Tipo=_Tipo;
this._Dominio=_Dominio;
this._Orden=_Orden;
this._Dic_Rotulo_Id=_Dic_Rotulo_Id;
this._Tool_Dic_Rotulo_Id=_Tool_Dic_Rotulo_Id;
this._Dic_Rotulo_Codigo=_Dic_Rotulo_Codigo;
this._Dic_Rotulo_nombre=_Dic_Rotulo_nombre;
this._Tool_Dic_Rotulo_Codigo=_Tool_Dic_Rotulo_Codigo;
this._Tool_Dic_Rotulo_nombre=_Tool_Dic_Rotulo_nombre;
this._Ver_Version_Id=_Ver_Version_Id;
this._Ver_Version_Codigo=_Ver_Version_Codigo;
this._Ver_Version_Nombre=_Ver_Version_Nombre;
this._Dominio_Nombre=_Dominio_Nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Tipo_Nombre=_Tipo_Nombre;
this._Ver_Version_Nombre1=_Ver_Version_Nombre1;
this._Tool_Ver_Version_Nombre=_Tool_Ver_Version_Nombre;
}
}
}
