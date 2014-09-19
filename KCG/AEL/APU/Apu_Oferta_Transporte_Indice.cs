
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Transporte_Indice: Entidad
{
// Atributos
private String _Apu_Oferta_Id;
private String _Apu_Indice_Id;
private Decimal _Porcentaje;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Indice_Codigo;
private String _Apu_Indice_Nombre;
private Decimal _Costo_Total;
private Decimal _Costo_Indice;
private String _Int_Moneda_Simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Oferta_Id
{
get{return _Apu_Oferta_Id;}
set{_Apu_Oferta_Id=value;}
}
                  
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
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
}
                  
public Decimal Costo_Indice
{
get{return _Costo_Indice;}
set{_Costo_Indice=value;}
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
public Apu_Oferta_Transporte_Indice()
{
}
 public Apu_Oferta_Transporte_Indice(String _Id,String _Codigo, String _Estado,String _Apu_Oferta_Id, String _Apu_Indice_Id, Decimal _Porcentaje, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Costo_Total, Decimal _Costo_Indice, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Indice_Id=_Apu_Indice_Id;
this._Porcentaje=_Porcentaje;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Costo_Total=_Costo_Total;
this._Costo_Indice=_Costo_Indice;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
