
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Equipo: Entidad
{
// Atributos
private String _Apu_Oferta_Id;
private String _Apu_Equipo_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Equipo_Codigo;
private String _Apu_Equipo_Nombre;
private Decimal _Costo;
private Decimal _Suma_porcentaje_Equipo_Indice;
private Decimal _Suma_porcentaje_Equipo_Indice_1;
private String _Int_Moneda_Simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Oferta_Id
{
get{return _Apu_Oferta_Id;}
set{_Apu_Oferta_Id=value;}
}
                  
public String Apu_Equipo_Id
{
get{return _Apu_Equipo_Id;}
set{_Apu_Equipo_Id=value;}
}
                  
public String Apu_Oferta_Codigo
{
get{return _Apu_Oferta_Codigo;}
set{_Apu_Oferta_Codigo=value;}
}
                  
public String Apu_Oferta_Nombre
{
get{return _Apu_Oferta_Nombre;}
set{_Apu_Oferta_Nombre=value;}
}
                  
public String Apu_Oferta_Etapa
{
get{return _Apu_Oferta_Etapa;}
set{_Apu_Oferta_Etapa=value;}
}
                  
public String Apu_Equipo_Codigo
{
get{return _Apu_Equipo_Codigo;}
set{_Apu_Equipo_Codigo=value;}
}
                  
public String Apu_Equipo_Nombre
{
get{return _Apu_Equipo_Nombre;}
set{_Apu_Equipo_Nombre=value;}
}
                  
public Decimal Costo
{
get{return _Costo;}
set{_Costo=value;}
}
                  
public Decimal Suma_porcentaje_Equipo_Indice
{
get{return _Suma_porcentaje_Equipo_Indice;}
set{_Suma_porcentaje_Equipo_Indice=value;}
}
                  
public Decimal Suma_porcentaje_Equipo_Indice_1
{
get{return _Suma_porcentaje_Equipo_Indice_1;}
set{_Suma_porcentaje_Equipo_Indice_1=value;}
}
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Oferta_Equipo()
{
}
 public Apu_Oferta_Equipo(String _Id,String _Codigo, String _Estado,String _Apu_Oferta_Id, String _Apu_Equipo_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Equipo_Codigo, String _Apu_Equipo_Nombre, Decimal _Costo, Decimal _Suma_porcentaje_Equipo_Indice, Decimal _Suma_porcentaje_Equipo_Indice_1, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Equipo_Id=_Apu_Equipo_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Equipo_Codigo=_Apu_Equipo_Codigo;
this._Apu_Equipo_Nombre=_Apu_Equipo_Nombre;
this._Costo=_Costo;
this._Suma_porcentaje_Equipo_Indice=_Suma_porcentaje_Equipo_Indice;
this._Suma_porcentaje_Equipo_Indice_1=_Suma_porcentaje_Equipo_Indice_1;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
