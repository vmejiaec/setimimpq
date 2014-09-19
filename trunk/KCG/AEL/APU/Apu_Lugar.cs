
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Lugar: Entidad
{
// Atributos
private String _Apu_Provincia_Id;
private String _Int_Empresa_Id;
private String _Predeterminada;
private String _Int_empresa_Codigo;
private String _Int_Empresa_nombre;
private String _Apu_Provincia_Codigo;
private String _Apu_Provincia_Nombre;
private String _Predeterminada_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Provincia_Id
{
get{return _Apu_Provincia_Id;}
set{_Apu_Provincia_Id=value;}
}
                  
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public String Predeterminada
{
get{return _Predeterminada;}
set{_Predeterminada=value;}
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
                  
public String Apu_Provincia_Codigo
{
get{return _Apu_Provincia_Codigo;}
set{_Apu_Provincia_Codigo=value;}
}
                  
public String Apu_Provincia_Nombre
{
get{return _Apu_Provincia_Nombre;}
set{_Apu_Provincia_Nombre=value;}
}
                  
public String Predeterminada_Nombre
{
get{return _Predeterminada_Nombre;}
set{_Predeterminada_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Lugar()
{
}
 public Apu_Lugar(String _Id,String _Codigo, String _Nombre,String _Estado,String _Apu_Provincia_Id, String _Int_Empresa_Id, String _Predeterminada, String _Int_empresa_Codigo, String _Int_Empresa_nombre, String _Apu_Provincia_Codigo, String _Apu_Provincia_Nombre, String _Predeterminada_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Apu_Provincia_Id=_Apu_Provincia_Id;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Predeterminada=_Predeterminada;
this._Int_empresa_Codigo=_Int_empresa_Codigo;
this._Int_Empresa_nombre=_Int_Empresa_nombre;
this._Apu_Provincia_Codigo=_Apu_Provincia_Codigo;
this._Apu_Provincia_Nombre=_Apu_Provincia_Nombre;
this._Predeterminada_Nombre=_Predeterminada_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
