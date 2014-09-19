
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Equipo: Entidad
{
// Atributos
private Decimal _Costo_Combustible;
private Decimal _Costo_Repuesto;
private Decimal _Costo_Mantenimiento;
private Decimal _Costo_Alquiler;
private Decimal _Costo_Otros;
private String _Apu_Proyecto_Id;
private String _Apu_Equipo_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Equipo_Codigo;
private String _Apu_Equipo_Nombre;
private Decimal _Apu_Equipo_Costo_Combustible;
private Decimal _Apu_Equipo_Costo_Repuesto;
private Decimal _Apu_Equipo_Costo_Mantenimiento;
private Decimal _Apu_Equipo_Costo_Alquiler;
private Decimal _Apu_Equipo_Costo_Otros;
private String _Int_Moneda_Simbolo;
private Decimal _Cantidad_equipo;
private Decimal _Cantidad_equipo_X_Costo;
private Decimal _Suma_porcentaje_Equipo;
private Decimal _Suma_porcentaje_Equipo_1;
private String _Estado_Nombre;
private Decimal _Costo_Total;
private Decimal _Costo_Hora;

// Propiedades de la clase
public Decimal Costo_Combustible
{
get{return _Costo_Combustible;}
set{_Costo_Combustible=value;}
}
                  
public Decimal Costo_Repuesto
{
get{return _Costo_Repuesto;}
set{_Costo_Repuesto=value;}
}
                  
public Decimal Costo_Mantenimiento
{
get{return _Costo_Mantenimiento;}
set{_Costo_Mantenimiento=value;}
}
                  
public Decimal Costo_Alquiler
{
get{return _Costo_Alquiler;}
set{_Costo_Alquiler=value;}
}
                  
public Decimal Costo_Otros
{
get{return _Costo_Otros;}
set{_Costo_Otros=value;}
}
                  
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Equipo_Id
{
get{return _Apu_Equipo_Id;}
set{_Apu_Equipo_Id=value;}
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
                  
public Decimal Apu_Equipo_Costo_Combustible
{
get{return _Apu_Equipo_Costo_Combustible;}
set{_Apu_Equipo_Costo_Combustible=value;}
}
                  
public Decimal Apu_Equipo_Costo_Repuesto
{
get{return _Apu_Equipo_Costo_Repuesto;}
set{_Apu_Equipo_Costo_Repuesto=value;}
}
                  
public Decimal Apu_Equipo_Costo_Mantenimiento
{
get{return _Apu_Equipo_Costo_Mantenimiento;}
set{_Apu_Equipo_Costo_Mantenimiento=value;}
}
                  
public Decimal Apu_Equipo_Costo_Alquiler
{
get{return _Apu_Equipo_Costo_Alquiler;}
set{_Apu_Equipo_Costo_Alquiler=value;}
}
                  
public Decimal Apu_Equipo_Costo_Otros
{
get{return _Apu_Equipo_Costo_Otros;}
set{_Apu_Equipo_Costo_Otros=value;}
}
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
}
                  
public Decimal Cantidad_equipo
{
get{return _Cantidad_equipo;}
set{_Cantidad_equipo=value;}
}
                  
public Decimal Cantidad_equipo_X_Costo
{
get{return _Cantidad_equipo_X_Costo;}
set{_Cantidad_equipo_X_Costo=value;}
}
                  
public Decimal Suma_porcentaje_Equipo
{
get{return _Suma_porcentaje_Equipo;}
set{_Suma_porcentaje_Equipo=value;}
}
                  
public Decimal Suma_porcentaje_Equipo_1
{
get{return _Suma_porcentaje_Equipo_1;}
set{_Suma_porcentaje_Equipo_1=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
}
                  
public Decimal Costo_Hora
{
get{return _Costo_Hora;}
set{_Costo_Hora=value;}
}
                  
// Constructor
public Apu_Proyecto_Equipo()
{
}
 public Apu_Proyecto_Equipo(String _Id,String _Codigo, String _Estado,Decimal _Costo_Combustible, Decimal _Costo_Repuesto, Decimal _Costo_Mantenimiento, Decimal _Costo_Alquiler, Decimal _Costo_Otros, String _Apu_Proyecto_Id, String _Apu_Equipo_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Equipo_Codigo, String _Apu_Equipo_Nombre, Decimal _Apu_Equipo_Costo_Combustible, Decimal _Apu_Equipo_Costo_Repuesto, Decimal _Apu_Equipo_Costo_Mantenimiento, Decimal _Apu_Equipo_Costo_Alquiler, Decimal _Apu_Equipo_Costo_Otros, String _Int_Moneda_Simbolo, Decimal _Cantidad_equipo, Decimal _Cantidad_equipo_X_Costo, Decimal _Suma_porcentaje_Equipo, Decimal _Suma_porcentaje_Equipo_1, String _Estado_Nombre, Decimal _Costo_Total, Decimal _Costo_Hora )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Costo_Combustible=_Costo_Combustible;
this._Costo_Repuesto=_Costo_Repuesto;
this._Costo_Mantenimiento=_Costo_Mantenimiento;
this._Costo_Alquiler=_Costo_Alquiler;
this._Costo_Otros=_Costo_Otros;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Equipo_Id=_Apu_Equipo_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Equipo_Codigo=_Apu_Equipo_Codigo;
this._Apu_Equipo_Nombre=_Apu_Equipo_Nombre;
this._Apu_Equipo_Costo_Combustible=_Apu_Equipo_Costo_Combustible;
this._Apu_Equipo_Costo_Repuesto=_Apu_Equipo_Costo_Repuesto;
this._Apu_Equipo_Costo_Mantenimiento=_Apu_Equipo_Costo_Mantenimiento;
this._Apu_Equipo_Costo_Alquiler=_Apu_Equipo_Costo_Alquiler;
this._Apu_Equipo_Costo_Otros=_Apu_Equipo_Costo_Otros;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Cantidad_equipo=_Cantidad_equipo;
this._Cantidad_equipo_X_Costo=_Cantidad_equipo_X_Costo;
this._Suma_porcentaje_Equipo=_Suma_porcentaje_Equipo;
this._Suma_porcentaje_Equipo_1=_Suma_porcentaje_Equipo_1;
this._Estado_Nombre=_Estado_Nombre;
this._Costo_Total=_Costo_Total;
this._Costo_Hora=_Costo_Hora;
}
}
}
