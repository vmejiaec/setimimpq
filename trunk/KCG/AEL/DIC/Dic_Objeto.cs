
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Objeto: Entidad
{
// Atributos
private String _Dic_Modulo_Id;
private Int32 _Numero;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Dic_Modulo_Id
{
get{return _Dic_Modulo_Id;}
set{_Dic_Modulo_Id=value;}
}
                  
public Int32 Numero
{
get{return _Numero;}
set{_Numero=value;}
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
public Dic_Objeto()
{
}
 public Dic_Objeto(String _Id,String _Codigo, String _Nombre,String _Estado,String _Dic_Modulo_Id, Int32 _Numero, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Numero=_Numero;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
