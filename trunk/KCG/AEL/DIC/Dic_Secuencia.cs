
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Secuencia: Entidad
{
// Atributos
private Int32 _Valor_Actual;
private Int32 _Valor_Minimo;
private Int32 _Valor_Maximo;
private Int32 _Incremento;
private String _Estado_nombre;

// Propiedades de la clase
public Int32 Valor_Actual
{
get{return _Valor_Actual;}
set{_Valor_Actual=value;}
}
                  
public Int32 Valor_Minimo
{
get{return _Valor_Minimo;}
set{_Valor_Minimo=value;}
}
                  
public Int32 Valor_Maximo
{
get{return _Valor_Maximo;}
set{_Valor_Maximo=value;}
}
                  
public Int32 Incremento
{
get{return _Incremento;}
set{_Incremento=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Dic_Secuencia()
{
}
 public Dic_Secuencia(String _Id,String _Codigo, String _Nombre,String _Estado,Int32 _Valor_Actual, Int32 _Valor_Minimo, Int32 _Valor_Maximo, Int32 _Incremento, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Valor_Actual=_Valor_Actual;
this._Valor_Minimo=_Valor_Minimo;
this._Valor_Maximo=_Valor_Maximo;
this._Incremento=_Incremento;
this._Estado_nombre=_Estado_nombre;
}
}
}
