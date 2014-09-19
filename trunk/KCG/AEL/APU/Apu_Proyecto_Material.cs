
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Material: Entidad
{
// Atributos
private String _Apu_Material_Id;
private String _Apu_Proyecto_Id;
private Decimal _Costo_Parcial;
private Decimal _Costo_Otros;
private Decimal _Costo_Transporte;
private String _Apu_Indice_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Material_Codigo;
private String _Apu_Material_Nombre;
private String _Apu_Material_Unidad;
private Decimal _Apu_Material_Costo_Total;
private Decimal _Apu_Material_Costo_Parcial;
private Decimal _Apu_Material_Costo_Otros;
private Decimal _Costo_Total;
private Decimal _Costo_Total_Costo_Transporte;
private Decimal _Cantidad_Material;
private Decimal _Cantidad_Material_X_Costo;
private String _Apu_Indice_Codigo;
private String _Apu_Indice_Nombre;
private String _Int_Moneda_Simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Material_Id
{
get{return _Apu_Material_Id;}
set{_Apu_Material_Id=value;}
}
                  
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public Decimal Costo_Parcial
{
get{return _Costo_Parcial;}
set{_Costo_Parcial=value;}
}
                  
public Decimal Costo_Otros
{
get{return _Costo_Otros;}
set{_Costo_Otros=value;}
}
                  
public Decimal Costo_Transporte
{
get{return _Costo_Transporte;}
set{_Costo_Transporte=value;}
}
                  
public String Apu_Indice_Id
{
get{return _Apu_Indice_Id;}
set{_Apu_Indice_Id=value;}
}
                  
public String Apu_Proyecto_Codigo
{
get{return _Apu_Proyecto_Codigo;}
set{_Apu_Proyecto_Codigo=value;}
}
                  
public String Apu_Proyecto_Nombre
{
get{return _Apu_Proyecto_Nombre;}
set{_Apu_Proyecto_Nombre=value;}
}
                  
public String Apu_Proyecto_Etapa
{
get{return _Apu_Proyecto_Etapa;}
set{_Apu_Proyecto_Etapa=value;}
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
                  
public Decimal Apu_Material_Costo_Total
{
get{return _Apu_Material_Costo_Total;}
set{_Apu_Material_Costo_Total=value;}
}
                  
public Decimal Apu_Material_Costo_Parcial
{
get{return _Apu_Material_Costo_Parcial;}
set{_Apu_Material_Costo_Parcial=value;}
}
                  
public Decimal Apu_Material_Costo_Otros
{
get{return _Apu_Material_Costo_Otros;}
set{_Apu_Material_Costo_Otros=value;}
}
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
}
                  
public Decimal Costo_Total_Costo_Transporte
{
get{return _Costo_Total_Costo_Transporte;}
set{_Costo_Total_Costo_Transporte=value;}
}
                  
public Decimal Cantidad_Material
{
get{return _Cantidad_Material;}
set{_Cantidad_Material=value;}
}
                  
public Decimal Cantidad_Material_X_Costo
{
get{return _Cantidad_Material_X_Costo;}
set{_Cantidad_Material_X_Costo=value;}
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
public Apu_Proyecto_Material()
{
}
 public Apu_Proyecto_Material(String _Id,String _Codigo, String _Estado,String _Apu_Material_Id, String _Apu_Proyecto_Id, Decimal _Costo_Parcial, Decimal _Costo_Otros, Decimal _Costo_Transporte, String _Apu_Indice_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Material_Codigo, String _Apu_Material_Nombre, String _Apu_Material_Unidad, Decimal _Apu_Material_Costo_Total, Decimal _Apu_Material_Costo_Parcial, Decimal _Apu_Material_Costo_Otros, Decimal _Costo_Total, Decimal _Costo_Total_Costo_Transporte, Decimal _Cantidad_Material, Decimal _Cantidad_Material_X_Costo, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Material_Id=_Apu_Material_Id;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Costo_Parcial=_Costo_Parcial;
this._Costo_Otros=_Costo_Otros;
this._Costo_Transporte=_Costo_Transporte;
this._Apu_Indice_Id=_Apu_Indice_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Material_Codigo=_Apu_Material_Codigo;
this._Apu_Material_Nombre=_Apu_Material_Nombre;
this._Apu_Material_Unidad=_Apu_Material_Unidad;
this._Apu_Material_Costo_Total=_Apu_Material_Costo_Total;
this._Apu_Material_Costo_Parcial=_Apu_Material_Costo_Parcial;
this._Apu_Material_Costo_Otros=_Apu_Material_Costo_Otros;
this._Costo_Total=_Costo_Total;
this._Costo_Total_Costo_Transporte=_Costo_Total_Costo_Transporte;
this._Cantidad_Material=_Cantidad_Material;
this._Cantidad_Material_X_Costo=_Cantidad_Material_X_Costo;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
