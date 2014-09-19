
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Rubro_Mano_Obra: Entidad
{
// Atributos
private String _Apu_Proyecto_Rubro_Id;
private String _Apu_Mano_Obra_Id;
private Decimal _Cantidad;
private DateTime _Fecha_Creacion;
private String _Creacion_Per_Personal_Id;
private DateTime _Fecha_Update;
private String _Update_Per_Personal_Id;
private String _Apu_Proyecto_Rubro_Codigo;
private String _Apu_Proyecto_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Categoria_Id;
private String _Apu_Categoria_Codigo;
private String _Apu_Categoria_Nombre;
private String _Apu_Mano_Obra_Codigo;
private String _Apu_Mano_Obra_Nombre;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private Decimal _costo_diario;
private Decimal _costo_hora;
private Decimal _costo_hora_x_cantidad;
private Decimal _costo_x_rendimiento_hora;
private Decimal _rendimiento_mano_obra_hora;
private String _int_moneda_simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Proyecto_Rubro_Id
{
get{return _Apu_Proyecto_Rubro_Id;}
set{_Apu_Proyecto_Rubro_Id=value;}
}
                  
public String Apu_Mano_Obra_Id
{
get{return _Apu_Mano_Obra_Id;}
set{_Apu_Mano_Obra_Id=value;}
}
                  
public Decimal Cantidad
{
get{return _Cantidad;}
set{_Cantidad=value;}
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
                  
public String Apu_Proyecto_Rubro_Codigo
{
get{return _Apu_Proyecto_Rubro_Codigo;}
set{_Apu_Proyecto_Rubro_Codigo=value;}
}
                  
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
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
                  
public String Apu_Categoria_Id
{
get{return _Apu_Categoria_Id;}
set{_Apu_Categoria_Id=value;}
}
                  
public String Apu_Categoria_Codigo
{
get{return _Apu_Categoria_Codigo;}
set{_Apu_Categoria_Codigo=value;}
}
                  
public String Apu_Categoria_Nombre
{
get{return _Apu_Categoria_Nombre;}
set{_Apu_Categoria_Nombre=value;}
}
                  
public String Apu_Mano_Obra_Codigo
{
get{return _Apu_Mano_Obra_Codigo;}
set{_Apu_Mano_Obra_Codigo=value;}
}
                  
public String Apu_Mano_Obra_Nombre
{
get{return _Apu_Mano_Obra_Nombre;}
set{_Apu_Mano_Obra_Nombre=value;}
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
                  
public Decimal rendimiento_mano_obra_hora
{
get{return _rendimiento_mano_obra_hora;}
set{_rendimiento_mano_obra_hora=value;}
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
public Apu_Proyecto_Rubro_Mano_Obra()
{
}
 public Apu_Proyecto_Rubro_Mano_Obra(String _Id,String _Codigo, String _Estado,String _Apu_Proyecto_Rubro_Id, String _Apu_Mano_Obra_Id, Decimal _Cantidad, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Apu_Proyecto_Rubro_Codigo, String _Apu_Proyecto_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Categoria_Id, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Apu_Mano_Obra_Codigo, String _Apu_Mano_Obra_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _costo_diario, Decimal _costo_hora, Decimal _costo_hora_x_cantidad, Decimal _costo_x_rendimiento_hora, Decimal _rendimiento_mano_obra_hora, String _int_moneda_simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Apu_Proyecto_Rubro_Id=_Apu_Proyecto_Rubro_Id;
this._Apu_Mano_Obra_Id=_Apu_Mano_Obra_Id;
this._Cantidad=_Cantidad;
this._Fecha_Creacion=_Fecha_Creacion;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._Fecha_Update=_Fecha_Update;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Apu_Proyecto_Rubro_Codigo=_Apu_Proyecto_Rubro_Codigo;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Categoria_Id=_Apu_Categoria_Id;
this._Apu_Categoria_Codigo=_Apu_Categoria_Codigo;
this._Apu_Categoria_Nombre=_Apu_Categoria_Nombre;
this._Apu_Mano_Obra_Codigo=_Apu_Mano_Obra_Codigo;
this._Apu_Mano_Obra_Nombre=_Apu_Mano_Obra_Nombre;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._costo_diario=_costo_diario;
this._costo_hora=_costo_hora;
this._costo_hora_x_cantidad=_costo_hora_x_cantidad;
this._costo_x_rendimiento_hora=_costo_x_rendimiento_hora;
this._rendimiento_mano_obra_hora=_rendimiento_mano_obra_hora;
this._int_moneda_simbolo=_int_moneda_simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
