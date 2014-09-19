
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Codigo: Entidad
{
// Atributos
private String _Tipo;
private Int32 _Orden;
private String _Dic_Campo_Id;
private String _Ref_Dic_Campo_Id;
private String _Dic_Secuencia_Id;
private String _Pre_Dic_Campo_Id;
private String _Constante;
private String _Funcion;
private String _Act_Dic_Campo_Id;
private String _Dic_Secuencia_Codigo;
private String _Dic_Secuencia_Nombre;
private String _Ref_dic_Campo_Codigo;
private String _Ref_Dic_Campo_Nombre;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Dic_Objeto_Id;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Ref_Dic_Modulo_Id;
private String _Ref_Dic_Modulo_Codigo;
private String _Ref_Dic_Modulo_Nombre;
private String _Ref_Dic_Objeto_Id;
private String _Ref_Dic_Objeto_Codigo;
private String _Ref_Dic_Objeto_Nombre;
private String _Act_Dic_Campo_Codigo;
private String _Act_Dic_Campo_Nombre;
private String _Act_Dic_Modulo_Id;
private String _Act_Dic_Modulo_Codigo;
private String _Act_Dic_Modulo_Nombre;
private String _Act_Dic_Objeto_Id;
private String _Act_Dic_Objeto_Codigo;
private String _Act_Dic_Objeto_Nombre;
private String _Pre_Dic_Campo_Codigo;
private String _Pre_Dic_Campo_Nombre;
private String _Pre_Dic_Objeto_Id;
private String _Pre_Dic_Objeto_Codigo;
private String _Pre_Dic_Objeto_Nombre;
private String _Estado_nombre;
private String _Tipo_nombre;

// Propiedades de la clase
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public Int32 Orden
{
get{return _Orden;}
set{_Orden=value;}
}
                  
public String Dic_Campo_Id
{
get{return _Dic_Campo_Id;}
set{_Dic_Campo_Id=value;}
}
                  
public String Ref_Dic_Campo_Id
{
get{return _Ref_Dic_Campo_Id;}
set{_Ref_Dic_Campo_Id=value;}
}
                  
public String Dic_Secuencia_Id
{
get{return _Dic_Secuencia_Id;}
set{_Dic_Secuencia_Id=value;}
}
                  
public String Pre_Dic_Campo_Id
{
get{return _Pre_Dic_Campo_Id;}
set{_Pre_Dic_Campo_Id=value;}
}
                  
public String Constante
{
get{return _Constante;}
set{_Constante=value;}
}
                  
public String Funcion
{
get{return _Funcion;}
set{_Funcion=value;}
}
                  
public String Act_Dic_Campo_Id
{
get{return _Act_Dic_Campo_Id;}
set{_Act_Dic_Campo_Id=value;}
}
                  
public String Dic_Secuencia_Codigo
{
get{return _Dic_Secuencia_Codigo;}
set{_Dic_Secuencia_Codigo=value;}
}
                  
public String Dic_Secuencia_Nombre
{
get{return _Dic_Secuencia_Nombre;}
set{_Dic_Secuencia_Nombre=value;}
}
                  
public String Ref_dic_Campo_Codigo
{
get{return _Ref_dic_Campo_Codigo;}
set{_Ref_dic_Campo_Codigo=value;}
}
                  
public String Ref_Dic_Campo_Nombre
{
get{return _Ref_Dic_Campo_Nombre;}
set{_Ref_Dic_Campo_Nombre=value;}
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
                  
public String Ref_Dic_Modulo_Id
{
get{return _Ref_Dic_Modulo_Id;}
set{_Ref_Dic_Modulo_Id=value;}
}
                  
public String Ref_Dic_Modulo_Codigo
{
get{return _Ref_Dic_Modulo_Codigo;}
set{_Ref_Dic_Modulo_Codigo=value;}
}
                  
public String Ref_Dic_Modulo_Nombre
{
get{return _Ref_Dic_Modulo_Nombre;}
set{_Ref_Dic_Modulo_Nombre=value;}
}
                  
public String Ref_Dic_Objeto_Id
{
get{return _Ref_Dic_Objeto_Id;}
set{_Ref_Dic_Objeto_Id=value;}
}
                  
public String Ref_Dic_Objeto_Codigo
{
get{return _Ref_Dic_Objeto_Codigo;}
set{_Ref_Dic_Objeto_Codigo=value;}
}
                  
public String Ref_Dic_Objeto_Nombre
{
get{return _Ref_Dic_Objeto_Nombre;}
set{_Ref_Dic_Objeto_Nombre=value;}
}
                  
public String Act_Dic_Campo_Codigo
{
get{return _Act_Dic_Campo_Codigo;}
set{_Act_Dic_Campo_Codigo=value;}
}
                  
public String Act_Dic_Campo_Nombre
{
get{return _Act_Dic_Campo_Nombre;}
set{_Act_Dic_Campo_Nombre=value;}
}
                  
public String Act_Dic_Modulo_Id
{
get{return _Act_Dic_Modulo_Id;}
set{_Act_Dic_Modulo_Id=value;}
}
                  
public String Act_Dic_Modulo_Codigo
{
get{return _Act_Dic_Modulo_Codigo;}
set{_Act_Dic_Modulo_Codigo=value;}
}
                  
public String Act_Dic_Modulo_Nombre
{
get{return _Act_Dic_Modulo_Nombre;}
set{_Act_Dic_Modulo_Nombre=value;}
}
                  
public String Act_Dic_Objeto_Id
{
get{return _Act_Dic_Objeto_Id;}
set{_Act_Dic_Objeto_Id=value;}
}
                  
public String Act_Dic_Objeto_Codigo
{
get{return _Act_Dic_Objeto_Codigo;}
set{_Act_Dic_Objeto_Codigo=value;}
}
                  
public String Act_Dic_Objeto_Nombre
{
get{return _Act_Dic_Objeto_Nombre;}
set{_Act_Dic_Objeto_Nombre=value;}
}
                  
public String Pre_Dic_Campo_Codigo
{
get{return _Pre_Dic_Campo_Codigo;}
set{_Pre_Dic_Campo_Codigo=value;}
}
                  
public String Pre_Dic_Campo_Nombre
{
get{return _Pre_Dic_Campo_Nombre;}
set{_Pre_Dic_Campo_Nombre=value;}
}
                  
public String Pre_Dic_Objeto_Id
{
get{return _Pre_Dic_Objeto_Id;}
set{_Pre_Dic_Objeto_Id=value;}
}
                  
public String Pre_Dic_Objeto_Codigo
{
get{return _Pre_Dic_Objeto_Codigo;}
set{_Pre_Dic_Objeto_Codigo=value;}
}
                  
public String Pre_Dic_Objeto_Nombre
{
get{return _Pre_Dic_Objeto_Nombre;}
set{_Pre_Dic_Objeto_Nombre=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
public String Tipo_nombre
{
get{return _Tipo_nombre;}
set{_Tipo_nombre=value;}
}
                  
// Constructor
public Dic_Codigo()
{
}
 public Dic_Codigo(String _Id,String _Codigo, String _Estado,String _Tipo, Int32 _Orden, String _Dic_Campo_Id, String _Ref_Dic_Campo_Id, String _Dic_Secuencia_Id, String _Pre_Dic_Campo_Id, String _Constante, String _Funcion, String _Act_Dic_Campo_Id, String _Dic_Secuencia_Codigo, String _Dic_Secuencia_Nombre, String _Ref_dic_Campo_Codigo, String _Ref_Dic_Campo_Nombre, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Ref_Dic_Modulo_Id, String _Ref_Dic_Modulo_Codigo, String _Ref_Dic_Modulo_Nombre, String _Ref_Dic_Objeto_Id, String _Ref_Dic_Objeto_Codigo, String _Ref_Dic_Objeto_Nombre, String _Act_Dic_Campo_Codigo, String _Act_Dic_Campo_Nombre, String _Act_Dic_Modulo_Id, String _Act_Dic_Modulo_Codigo, String _Act_Dic_Modulo_Nombre, String _Act_Dic_Objeto_Id, String _Act_Dic_Objeto_Codigo, String _Act_Dic_Objeto_Nombre, String _Pre_Dic_Campo_Codigo, String _Pre_Dic_Campo_Nombre, String _Pre_Dic_Objeto_Id, String _Pre_Dic_Objeto_Codigo, String _Pre_Dic_Objeto_Nombre, String _Estado_nombre, String _Tipo_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Tipo=_Tipo;
this._Orden=_Orden;
this._Dic_Campo_Id=_Dic_Campo_Id;
this._Ref_Dic_Campo_Id=_Ref_Dic_Campo_Id;
this._Dic_Secuencia_Id=_Dic_Secuencia_Id;
this._Pre_Dic_Campo_Id=_Pre_Dic_Campo_Id;
this._Constante=_Constante;
this._Funcion=_Funcion;
this._Act_Dic_Campo_Id=_Act_Dic_Campo_Id;
this._Dic_Secuencia_Codigo=_Dic_Secuencia_Codigo;
this._Dic_Secuencia_Nombre=_Dic_Secuencia_Nombre;
this._Ref_dic_Campo_Codigo=_Ref_dic_Campo_Codigo;
this._Ref_Dic_Campo_Nombre=_Ref_Dic_Campo_Nombre;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Ref_Dic_Modulo_Id=_Ref_Dic_Modulo_Id;
this._Ref_Dic_Modulo_Codigo=_Ref_Dic_Modulo_Codigo;
this._Ref_Dic_Modulo_Nombre=_Ref_Dic_Modulo_Nombre;
this._Ref_Dic_Objeto_Id=_Ref_Dic_Objeto_Id;
this._Ref_Dic_Objeto_Codigo=_Ref_Dic_Objeto_Codigo;
this._Ref_Dic_Objeto_Nombre=_Ref_Dic_Objeto_Nombre;
this._Act_Dic_Campo_Codigo=_Act_Dic_Campo_Codigo;
this._Act_Dic_Campo_Nombre=_Act_Dic_Campo_Nombre;
this._Act_Dic_Modulo_Id=_Act_Dic_Modulo_Id;
this._Act_Dic_Modulo_Codigo=_Act_Dic_Modulo_Codigo;
this._Act_Dic_Modulo_Nombre=_Act_Dic_Modulo_Nombre;
this._Act_Dic_Objeto_Id=_Act_Dic_Objeto_Id;
this._Act_Dic_Objeto_Codigo=_Act_Dic_Objeto_Codigo;
this._Act_Dic_Objeto_Nombre=_Act_Dic_Objeto_Nombre;
this._Pre_Dic_Campo_Codigo=_Pre_Dic_Campo_Codigo;
this._Pre_Dic_Campo_Nombre=_Pre_Dic_Campo_Nombre;
this._Pre_Dic_Objeto_Id=_Pre_Dic_Objeto_Id;
this._Pre_Dic_Objeto_Codigo=_Pre_Dic_Objeto_Codigo;
this._Pre_Dic_Objeto_Nombre=_Pre_Dic_Objeto_Nombre;
this._Estado_nombre=_Estado_nombre;
this._Tipo_nombre=_Tipo_nombre;
}
}
}
