
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Rubro_Equipo: Entidad
{
// Atributos
private String _Apu_Oferta_Rubro_Id;
private String _Apu_Equipo_Id;
private Decimal _Costo;
private DateTime _Fecha_Creacion;
private String _Creacion_Per_Personal_Id;
private DateTime _Fecha_Update;
private String _Update_Per_Personal_Id;
private String _Apu_Oferta_Rubro_Codigo;
private String _Apu_Oferta_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Equipo_Codigo;
private String _Apu_Equipo_Nombre;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private String _int_moneda_simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Oferta_Rubro_Id
{
get{return _Apu_Oferta_Rubro_Id;}
set{_Apu_Oferta_Rubro_Id=value;}
}
                  
public String Apu_Equipo_Id
{
get{return _Apu_Equipo_Id;}
set{_Apu_Equipo_Id=value;}
}
                  
public Decimal Costo
{
get{return _Costo;}
set{_Costo=value;}
}
                  
public DateTime Fecha_Creacion
{
get{return _Fecha_Creacion;}
set{_Fecha_Creacion=value;}
}
                  
public String Creacion_Per_Personal_Id
{
get{return _Creacion_Per_Personal_Id;}
set{_Creacion_Per_Personal_Id=value;}
}
                  
public DateTime Fecha_Update
{
get{return _Fecha_Update;}
set{_Fecha_Update=value;}
}
                  
public String Update_Per_Personal_Id
{
get{return _Update_Per_Personal_Id;}
set{_Update_Per_Personal_Id=value;}
}
                  
public String Apu_Oferta_Rubro_Codigo
{
get{return _Apu_Oferta_Rubro_Codigo;}
set{_Apu_Oferta_Rubro_Codigo=value;}
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
                  
public String Creacion_Per_Personal_Codigo
{
get{return _Creacion_Per_Personal_Codigo;}
set{_Creacion_Per_Personal_Codigo=value;}
}
                  
public String Creacion_Per_Personal_Nombre
{
get{return _Creacion_Per_Personal_Nombre;}
set{_Creacion_Per_Personal_Nombre=value;}
}
                  
public String Update_Per_Personal_Codigo
{
get{return _Update_Per_Personal_Codigo;}
set{_Update_Per_Personal_Codigo=value;}
}
                  
public String Update_Per_Personal_Nombre
{
get{return _Update_Per_Personal_Nombre;}
set{_Update_Per_Personal_Nombre=value;}
}
                  
public String int_moneda_simbolo
{
get{return _int_moneda_simbolo;}
set{_int_moneda_simbolo=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Oferta_Rubro_Equipo()
{
}
 public Apu_Oferta_Rubro_Equipo(String _Id,String _Codigo, String _Estado,String _Apu_Oferta_Rubro_Id, String _Apu_Equipo_Id, Decimal _Costo, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Apu_Oferta_Rubro_Codigo, String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Equipo_Codigo, String _Apu_Equipo_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, String _int_moneda_simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Oferta_Rubro_Id=_Apu_Oferta_Rubro_Id;
this._Apu_Equipo_Id=_Apu_Equipo_Id;
this._Costo=_Costo;
this._Fecha_Creacion=_Fecha_Creacion;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._Fecha_Update=_Fecha_Update;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Apu_Oferta_Rubro_Codigo=_Apu_Oferta_Rubro_Codigo;
this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Equipo_Codigo=_Apu_Equipo_Codigo;
this._Apu_Equipo_Nombre=_Apu_Equipo_Nombre;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._int_moneda_simbolo=_int_moneda_simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
