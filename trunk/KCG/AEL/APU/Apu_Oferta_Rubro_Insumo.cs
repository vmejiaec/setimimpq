
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Rubro_Insumo: Entidad
{
// Atributos
private String _Tipo;
private String _Tipo_Nombre;
private String _Apu_Insumo_Id;
private String _Apu_Oferta_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Insumo_Codigo;
private String _Apu_Insumo_Nombre;
private Decimal _Costo_Insumo;
private Decimal _Costo_x_Cantidad;
private String _Int_Sucursal_Id;
private Decimal _Apu_Oferta_Rubro_Cantidad;
private Decimal _Apu_Oferta_Rubro_Costo_Directo;
private Decimal _Apu_Oferta_Rubro_Costo_Indirecto;
private Decimal _Apu_Oferta_Rubro_Costo;

// Propiedades de la clase
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Tipo_Nombre
{
get{return _Tipo_Nombre;}
set{_Tipo_Nombre=value;}
}
                  
public String Apu_Insumo_Id
{
get{return _Apu_Insumo_Id;}
set{_Apu_Insumo_Id=value;}
}
                  
public String Apu_Oferta_Id
{
get{return _Apu_Oferta_Id;}
set{_Apu_Oferta_Id=value;}
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
                  
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
}
                  
public String Apu_Rubro_Codigo
{
get{return _Apu_Rubro_Codigo;}
set{_Apu_Rubro_Codigo=value;}
}
                  
public String Apu_Rubro_Nombre
{
get{return _Apu_Rubro_Nombre;}
set{_Apu_Rubro_Nombre=value;}
}
                  
public String Apu_Rubro_Unidad
{
get{return _Apu_Rubro_Unidad;}
set{_Apu_Rubro_Unidad=value;}
}
                  
public String Apu_Insumo_Codigo
{
get{return _Apu_Insumo_Codigo;}
set{_Apu_Insumo_Codigo=value;}
}
                  
public String Apu_Insumo_Nombre
{
get{return _Apu_Insumo_Nombre;}
set{_Apu_Insumo_Nombre=value;}
}
                  
public Decimal Costo_Insumo
{
get{return _Costo_Insumo;}
set{_Costo_Insumo=value;}
}
                  
public Decimal Costo_x_Cantidad
{
get{return _Costo_x_Cantidad;}
set{_Costo_x_Cantidad=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public Decimal Apu_Oferta_Rubro_Cantidad
{
get{return _Apu_Oferta_Rubro_Cantidad;}
set{_Apu_Oferta_Rubro_Cantidad=value;}
}
                  
public Decimal Apu_Oferta_Rubro_Costo_Directo
{
get{return _Apu_Oferta_Rubro_Costo_Directo;}
set{_Apu_Oferta_Rubro_Costo_Directo=value;}
}
                  
public Decimal Apu_Oferta_Rubro_Costo_Indirecto
{
get{return _Apu_Oferta_Rubro_Costo_Indirecto;}
set{_Apu_Oferta_Rubro_Costo_Indirecto=value;}
}
                  
public Decimal Apu_Oferta_Rubro_Costo
{
get{return _Apu_Oferta_Rubro_Costo;}
set{_Apu_Oferta_Rubro_Costo=value;}
}
                  
// Constructor
public Apu_Oferta_Rubro_Insumo()
{
}
 public Apu_Oferta_Rubro_Insumo(String _Tipo, String _Tipo_Nombre, String _Apu_Insumo_Id, String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Insumo_Codigo, String _Apu_Insumo_Nombre, Decimal _Costo_Insumo, Decimal _Costo_x_Cantidad, String _Int_Sucursal_Id, Decimal _Apu_Oferta_Rubro_Cantidad, Decimal _Apu_Oferta_Rubro_Costo_Directo, Decimal _Apu_Oferta_Rubro_Costo_Indirecto, Decimal _Apu_Oferta_Rubro_Costo )
{
this._Tipo=_Tipo;
this._Tipo_Nombre=_Tipo_Nombre;
this._Apu_Insumo_Id=_Apu_Insumo_Id;
this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Insumo_Codigo=_Apu_Insumo_Codigo;
this._Apu_Insumo_Nombre=_Apu_Insumo_Nombre;
this._Costo_Insumo=_Costo_Insumo;
this._Costo_x_Cantidad=_Costo_x_Cantidad;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Apu_Oferta_Rubro_Cantidad=_Apu_Oferta_Rubro_Cantidad;
this._Apu_Oferta_Rubro_Costo_Directo=_Apu_Oferta_Rubro_Costo_Directo;
this._Apu_Oferta_Rubro_Costo_Indirecto=_Apu_Oferta_Rubro_Costo_Indirecto;
this._Apu_Oferta_Rubro_Costo=_Apu_Oferta_Rubro_Costo;
}
}
}
