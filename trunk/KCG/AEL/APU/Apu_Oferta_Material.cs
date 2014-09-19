
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Material: Entidad
{
// Atributos
private String _Apu_Oferta_Id;
private String _Apu_Indice_Id;
private String _Apu_Material_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Material_Codigo;
private String _Apu_Material_Nombre;
private String _Apu_Material_Unidad;
private String _Apu_Indice_Codigo;
private String _Apu_Indice_Nombre;
private Decimal _Costo;
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
                  
public String Apu_Material_Id
{
get{return _Apu_Material_Id;}
set{_Apu_Material_Id=value;}
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
                  
public String Apu_Material_Codigo
{
get{return _Apu_Material_Codigo;}
set{_Apu_Material_Codigo=value;}
}
                  
public String Apu_Material_Nombre
{
get{return _Apu_Material_Nombre;}
set{_Apu_Material_Nombre=value;}
}
                  
public String Apu_Material_Unidad
{
get{return _Apu_Material_Unidad;}
set{_Apu_Material_Unidad=value;}
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
                  
public Decimal Costo
{
get{return _Costo;}
set{_Costo=value;}
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
public Apu_Oferta_Material()
{
}
 public Apu_Oferta_Material(String _Id,String _Codigo, String _Estado,String _Apu_Oferta_Id, String _Apu_Indice_Id, String _Apu_Material_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Material_Codigo, String _Apu_Material_Nombre, String _Apu_Material_Unidad, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Costo, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Indice_Id=_Apu_Indice_Id;
this._Apu_Material_Id=_Apu_Material_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Material_Codigo=_Apu_Material_Codigo;
this._Apu_Material_Nombre=_Apu_Material_Nombre;
this._Apu_Material_Unidad=_Apu_Material_Unidad;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Costo=_Costo;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
