
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Mano_Obra: Entidad
{
// Atributos
private String _Disponible;
private Decimal _Costo_Diario;
private String _Apu_Categoria_Id;
private String _Int_Sucursal_Id;
private String _Int_Moneda_Id;
private DateTime _Fecha_Creacion;
private String _Creacion_Per_Personal_Id;
private DateTime _Fecha_Update;
private String _Update_Per_Personal_Id;
private String _Apu_Categoria_Codigo;
private String _Apu_Categoria_Nombre;
private String _Int_Sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_Empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _Int_Moneda_Simbolo;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private Decimal _Costo_Hora;
private String _Disponible_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Disponible
{
get{return _Disponible;}
set{_Disponible=value;}
}
                  
public Decimal Costo_Diario
{
get{return _Costo_Diario;}
set{_Costo_Diario=value;}
}
                  
public String Apu_Categoria_Id
{
get{return _Apu_Categoria_Id;}
set{_Apu_Categoria_Id=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String Int_Moneda_Id
{
get{return _Int_Moneda_Id;}
set{_Int_Moneda_Id=value;}
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
                  
public String Int_Sucursal_Codigo
{
get{return _Int_Sucursal_Codigo;}
set{_Int_Sucursal_Codigo=value;}
}
                  
public String Int_Sucursal_Nombre
{
get{return _Int_Sucursal_Nombre;}
set{_Int_Sucursal_Nombre=value;}
}
                  
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public String Int_Empresa_Codigo
{
get{return _Int_Empresa_Codigo;}
set{_Int_Empresa_Codigo=value;}
}
                  
public String Int_Empresa_Nombre
{
get{return _Int_Empresa_Nombre;}
set{_Int_Empresa_Nombre=value;}
}
                  
public String Int_Moneda_Codigo
{
get{return _Int_Moneda_Codigo;}
set{_Int_Moneda_Codigo=value;}
}
                  
public String Int_Moneda_Nombre
{
get{return _Int_Moneda_Nombre;}
set{_Int_Moneda_Nombre=value;}
}
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
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
                  
public Decimal Costo_Hora
{
get{return _Costo_Hora;}
set{_Costo_Hora=value;}
}
                  
public String Disponible_Nombre
{
get{return _Disponible_Nombre;}
set{_Disponible_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Mano_Obra()
{
}
 public Apu_Mano_Obra(String _Id,String _Codigo, String _Nombre,String _Estado,String _Disponible, Decimal _Costo_Diario, String _Apu_Categoria_Id, String _Int_Sucursal_Id, String _Int_Moneda_Id, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Int_Moneda_Simbolo, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _Costo_Hora, String _Disponible_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Disponible=_Disponible;
this._Costo_Diario=_Costo_Diario;
this._Apu_Categoria_Id=_Apu_Categoria_Id;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Int_Moneda_Id=_Int_Moneda_Id;
this._Fecha_Creacion=_Fecha_Creacion;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._Fecha_Update=_Fecha_Update;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Apu_Categoria_Codigo=_Apu_Categoria_Codigo;
this._Apu_Categoria_Nombre=_Apu_Categoria_Nombre;
this._Int_Sucursal_Codigo=_Int_Sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._Costo_Hora=_Costo_Hora;
this._Disponible_Nombre=_Disponible_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
