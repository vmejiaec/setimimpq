
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Rubro_Material: Entidad
{
// Atributos
private String _Apu_Rubro_Id;
private String _Apu_Material_Id;
private Decimal _Cantidad;
private DateTime _Fecha_Update;
private String _Update_Per_Personal_Id;
private DateTime _Fecha_Creacion;
private String _Creacion_Per_Personal_Id;
private String _UpdateTransporte_Per_Personal_Id;
private DateTime _Fecha_UpdateTransporte;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Material_Codigo;
private String _Apu_Material_Nombre;
private String _Apu_Material_Unidad;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private String _UpdateTransporte_Per_Personal_Codigo;
private String _UpdateTransporte_Per_Personal_Nombre;
private Decimal _costo_unitario;
private Decimal _costo_unitario_transporte;
private Decimal _costo_total;
private Decimal _costo_total_transporte;
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
                  
public String Apu_Material_Id
{
get{return _Apu_Material_Id;}
set{_Apu_Material_Id=value;}
}
                  
public Decimal Cantidad
{
get{return _Cantidad;}
set{_Cantidad=value;}
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
                  
public String UpdateTransporte_Per_Personal_Id
{
get{return _UpdateTransporte_Per_Personal_Id;}
set{_UpdateTransporte_Per_Personal_Id=value;}
}
                  
public DateTime Fecha_UpdateTransporte
{
get{return _Fecha_UpdateTransporte;}
set{_Fecha_UpdateTransporte=value;}
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
                  
public String UpdateTransporte_Per_Personal_Codigo
{
get{return _UpdateTransporte_Per_Personal_Codigo;}
set{_UpdateTransporte_Per_Personal_Codigo=value;}
}
                  
public String UpdateTransporte_Per_Personal_Nombre
{
get{return _UpdateTransporte_Per_Personal_Nombre;}
set{_UpdateTransporte_Per_Personal_Nombre=value;}
}
                  
public Decimal costo_unitario
{
get{return _costo_unitario;}
set{_costo_unitario=value;}
}
                  
public Decimal costo_unitario_transporte
{
get{return _costo_unitario_transporte;}
set{_costo_unitario_transporte=value;}
}
                  
public Decimal costo_total
{
get{return _costo_total;}
set{_costo_total=value;}
}
                  
public Decimal costo_total_transporte
{
get{return _costo_total_transporte;}
set{_costo_total_transporte=value;}
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
public Apu_Rubro_Material()
{
}
 public Apu_Rubro_Material(String _Id,String _Codigo, String _Estado,String _Apu_Rubro_Id, String _Apu_Material_Id, Decimal _Cantidad, DateTime _Fecha_Update, String _Update_Per_Personal_Id, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, String _UpdateTransporte_Per_Personal_Id, DateTime _Fecha_UpdateTransporte, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Material_Codigo, String _Apu_Material_Nombre, String _Apu_Material_Unidad, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, String _UpdateTransporte_Per_Personal_Codigo, String _UpdateTransporte_Per_Personal_Nombre, Decimal _costo_unitario, Decimal _costo_unitario_transporte, Decimal _costo_total, Decimal _costo_total_transporte, String _int_moneda_simbolo, String _Estado_Nombre, String _Apu_Subtitulo_id, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_Id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Material_Id=_Apu_Material_Id;
this._Cantidad=_Cantidad;
this._Fecha_Update=_Fecha_Update;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Fecha_Creacion=_Fecha_Creacion;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._UpdateTransporte_Per_Personal_Id=_UpdateTransporte_Per_Personal_Id;
this._Fecha_UpdateTransporte=_Fecha_UpdateTransporte;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Material_Codigo=_Apu_Material_Codigo;
this._Apu_Material_Nombre=_Apu_Material_Nombre;
this._Apu_Material_Unidad=_Apu_Material_Unidad;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._UpdateTransporte_Per_Personal_Codigo=_UpdateTransporte_Per_Personal_Codigo;
this._UpdateTransporte_Per_Personal_Nombre=_UpdateTransporte_Per_Personal_Nombre;
this._costo_unitario=_costo_unitario;
this._costo_unitario_transporte=_costo_unitario_transporte;
this._costo_total=_costo_total;
this._costo_total_transporte=_costo_total_transporte;
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
