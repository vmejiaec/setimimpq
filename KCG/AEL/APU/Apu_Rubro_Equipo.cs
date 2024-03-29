
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Rubro_Equipo: Entidad
{
// Atributos
private String _Apu_Rubro_Id;
private String _Apu_Equipo_Id;
private Decimal _Cantidad;
private String _Creacion_Per_Personal_Id;
private DateTime _Fecha_Creacion;
private String _Update_Per_Personal_Id;
private DateTime _Fecha_Update;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Equipo_Codigo;
private String _Apu_Equipo_Nombre;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private Decimal _costo_diario;
private Decimal _costo_hora;
private Decimal _costo_hora_x_cantidad;
private Decimal _costo_x_rendimiento_hora;
private Decimal _apu_rubro_rendimiento_Equipo_hora;
private String _int_moneda_simbolo;
private String _Estado_Nombre;
private String _Apu_Subtitulo_id;
private String _Apu_Subtitulo_Codigo;
private String _Apu_Subtitulo_Nombre;
private String _Apu_Titulo_Id;
private String _Apu_Titulo_Codigo;
private String _Apu_Titulo_Nombre;

// Propiedades de la clase
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
}
                  
public String Apu_Equipo_Id
{
get{return _Apu_Equipo_Id;}
set{_Apu_Equipo_Id=value;}
}
                  
public Decimal Cantidad
{
get{return _Cantidad;}
set{_Cantidad=value;}
}
                  
public String Creacion_Per_Personal_Id
{
get{return _Creacion_Per_Personal_Id;}
set{_Creacion_Per_Personal_Id=value;}
}
                  
public DateTime Fecha_Creacion
{
get{return _Fecha_Creacion;}
set{_Fecha_Creacion=value;}
}
                  
public String Update_Per_Personal_Id
{
get{return _Update_Per_Personal_Id;}
set{_Update_Per_Personal_Id=value;}
}
                  
public DateTime Fecha_Update
{
get{return _Fecha_Update;}
set{_Fecha_Update=value;}
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
                  
public Decimal costo_diario
{
get{return _costo_diario;}
set{_costo_diario=value;}
}
                  
public Decimal costo_hora
{
get{return _costo_hora;}
set{_costo_hora=value;}
}
                  
public Decimal costo_hora_x_cantidad
{
get{return _costo_hora_x_cantidad;}
set{_costo_hora_x_cantidad=value;}
}
                  
public Decimal costo_x_rendimiento_hora
{
get{return _costo_x_rendimiento_hora;}
set{_costo_x_rendimiento_hora=value;}
}
                  
public Decimal apu_rubro_rendimiento_Equipo_hora
{
get{return _apu_rubro_rendimiento_Equipo_hora;}
set{_apu_rubro_rendimiento_Equipo_hora=value;}
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
                  
public String Apu_Subtitulo_id
{
get{return _Apu_Subtitulo_id;}
set{_Apu_Subtitulo_id=value;}
}
                  
public String Apu_Subtitulo_Codigo
{
get{return _Apu_Subtitulo_Codigo;}
set{_Apu_Subtitulo_Codigo=value;}
}
                  
public String Apu_Subtitulo_Nombre
{
get{return _Apu_Subtitulo_Nombre;}
set{_Apu_Subtitulo_Nombre=value;}
}
                  
public String Apu_Titulo_Id
{
get{return _Apu_Titulo_Id;}
set{_Apu_Titulo_Id=value;}
}
                  
public String Apu_Titulo_Codigo
{
get{return _Apu_Titulo_Codigo;}
set{_Apu_Titulo_Codigo=value;}
}
                  
public String Apu_Titulo_Nombre
{
get{return _Apu_Titulo_Nombre;}
set{_Apu_Titulo_Nombre=value;}
}
                  
// Constructor
public Apu_Rubro_Equipo()
{
}
 public Apu_Rubro_Equipo(String _Id,String _Codigo, String _Estado,String _Apu_Rubro_Id, String _Apu_Equipo_Id, Decimal _Cantidad, String _Creacion_Per_Personal_Id, DateTime _Fecha_Creacion, String _Update_Per_Personal_Id, DateTime _Fecha_Update, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Equipo_Codigo, String _Apu_Equipo_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _costo_diario, Decimal _costo_hora, Decimal _costo_hora_x_cantidad, Decimal _costo_x_rendimiento_hora, Decimal _apu_rubro_rendimiento_Equipo_hora, String _int_moneda_simbolo, String _Estado_Nombre, String _Apu_Subtitulo_id, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_Id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Equipo_Id=_Apu_Equipo_Id;
this._Cantidad=_Cantidad;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._Fecha_Creacion=_Fecha_Creacion;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Fecha_Update=_Fecha_Update;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Equipo_Codigo=_Apu_Equipo_Codigo;
this._Apu_Equipo_Nombre=_Apu_Equipo_Nombre;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._costo_diario=_costo_diario;
this._costo_hora=_costo_hora;
this._costo_hora_x_cantidad=_costo_hora_x_cantidad;
this._costo_x_rendimiento_hora=_costo_x_rendimiento_hora;
this._apu_rubro_rendimiento_Equipo_hora=_apu_rubro_rendimiento_Equipo_hora;
this._int_moneda_simbolo=_int_moneda_simbolo;
this._Estado_Nombre=_Estado_Nombre;
this._Apu_Subtitulo_id=_Apu_Subtitulo_id;
this._Apu_Subtitulo_Codigo=_Apu_Subtitulo_Codigo;
this._Apu_Subtitulo_Nombre=_Apu_Subtitulo_Nombre;
this._Apu_Titulo_Id=_Apu_Titulo_Id;
this._Apu_Titulo_Codigo=_Apu_Titulo_Codigo;
this._Apu_Titulo_Nombre=_Apu_Titulo_Nombre;
}
}
}
