
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Indice_Equipo: Entidad
{
// Atributos
private String _Apu_Indice_Id;
private Decimal _Porcentaje;
private String _Int_Empresa_Id;
private String _Apu_Indice_Codigo;
private String _Apu_Indice_Nombre;
private String _Int_empresa_Codigo;
private String _Int_Empresa_nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Indice_Id
{
get{return _Apu_Indice_Id;}
set{_Apu_Indice_Id=value;}
}
                  
public Decimal Porcentaje
{
get{return _Porcentaje;}
set{_Porcentaje=value;}
}
                  
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public String Apu_Indice_Codigo
{
get{return _Apu_Indice_Codigo;}
set{_Apu_Indice_Codigo=value;}
}
                  
public String Apu_Indice_Nombre
{
get{return _Apu_Indice_Nombre;}
set{_Apu_Indice_Nombre=value;}
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
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Indice_Equipo()
{
}
 public Apu_Indice_Equipo(String _Id,String _Codigo, String _Estado,String _Apu_Indice_Id, Decimal _Porcentaje, String _Int_Empresa_Id, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, String _Int_empresa_Codigo, String _Int_Empresa_nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Indice_Id=_Apu_Indice_Id;
this._Porcentaje=_Porcentaje;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Int_empresa_Codigo=_Int_empresa_Codigo;
this._Int_Empresa_nombre=_Int_Empresa_nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
