
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.INT
{
public class Int_Moneda: Entidad
{
// Atributos
private String _Abreviatura;
private String _Moneda_Id_Ref;
private String _Simbolo;
private String _Descripcion;
private String _Estado_nombre;

// Propiedades de la clase
public String Abreviatura
{
get{return _Abreviatura;}
set{_Abreviatura=value;}
}
                  
public String Moneda_Id_Ref
{
get{return _Moneda_Id_Ref;}
set{_Moneda_Id_Ref=value;}
}
                  
public String Simbolo
{
get{return _Simbolo;}
set{_Simbolo=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Int_Moneda()
{
}
 public Int_Moneda(String _Id,String _Codigo, String _Nombre,String _Estado,String _Abreviatura, String _Moneda_Id_Ref, String _Simbolo, String _Descripcion, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Abreviatura=_Abreviatura;
this._Moneda_Id_Ref=_Moneda_Id_Ref;
this._Simbolo=_Simbolo;
this._Descripcion=_Descripcion;
this._Estado_nombre=_Estado_nombre;
}
}
}
