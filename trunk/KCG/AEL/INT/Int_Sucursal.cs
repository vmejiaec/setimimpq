
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.INT
{
public class Int_Sucursal: Entidad
{
// Atributos
private String _Abreviatura;
private Int32 _Numero;
private String _Predeterminada;
private String _Int_Empresa_Id;
private String _Int_Moneda_Id;
private String _Descripcion;
private String _Int_empresa_Codigo;
private String _Int_Empresa_nombre;
private String _Int_Empresa_Imagen;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _Estado_Nombre;
private String _Int_Empresa_Abreviatura;

// Propiedades de la clase
public String Abreviatura
{
get{return _Abreviatura;}
set{_Abreviatura=value;}
}
                  
public Int32 Numero
{
get{return _Numero;}
set{_Numero=value;}
}
                  
public String Predeterminada
{
get{return _Predeterminada;}
set{_Predeterminada=value;}
}
                  
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public String Int_Moneda_Id
{
get{return _Int_Moneda_Id;}
set{_Int_Moneda_Id=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Int_empresa_Codigo
{
get{return _Int_empresa_Codigo;}
set{_Int_empresa_Codigo=value;}
}
                  
public String Int_Empresa_nombre
{
get{return _Int_Empresa_nombre;}
set{_Int_Empresa_nombre=value;}
}
                  
public String Int_Empresa_Imagen
{
get{return _Int_Empresa_Imagen;}
set{_Int_Empresa_Imagen=value;}
}
                  
public String Int_Moneda_Codigo
{
get{return _Int_Moneda_Codigo;}
set{_Int_Moneda_Codigo=value;}
}
                  
public String Int_Moneda_Nombre
{
get{return _Int_Moneda_Nombre;}
set{_Int_Moneda_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String Int_Empresa_Abreviatura
{
get{return _Int_Empresa_Abreviatura;}
set{_Int_Empresa_Abreviatura=value;}
}
                  
// Constructor
public Int_Sucursal()
{
}
 public Int_Sucursal(String _Id,String _Codigo,String _Nombre,String _Estado,String _Abreviatura, Int32 _Numero, String _Predeterminada, String _Int_Empresa_Id, String _Int_Moneda_Id, String _Descripcion, String _Int_empresa_Codigo, String _Int_Empresa_nombre, String _Int_Empresa_Imagen, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Estado_Nombre, String _Int_Empresa_Abreviatura )
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Abreviatura=_Abreviatura;
this._Numero=_Numero;
this._Predeterminada=_Predeterminada;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_Moneda_Id=_Int_Moneda_Id;
this._Descripcion=_Descripcion;
this._Int_empresa_Codigo=_Int_empresa_Codigo;
this._Int_Empresa_nombre=_Int_Empresa_nombre;
this._Int_Empresa_Imagen=_Int_Empresa_Imagen;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Int_Empresa_Abreviatura=_Int_Empresa_Abreviatura;
}
}
}
