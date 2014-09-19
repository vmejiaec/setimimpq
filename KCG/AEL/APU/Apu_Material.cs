
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Material: Entidad
{
// Atributos
private String _Unidad;
private Decimal _Costo_Parcial;
private Decimal _Costo_Otros;
private Decimal _Costo_Transporte;
private String _Disponible;
private String _Int_Sucursal_Id;
private String _Int_Moneda_Id;
private DateTime _Fecha_Creacion;
private String _Creacion_Per_Personal_Id;
private DateTime _Fecha_Update;
private String _Update_Per_Personal_Id;
private String _Int_Sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _Int_Empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Creacion_Per_Personal_Codigo;
private String _Creacion_Per_Personal_Nombre;
private String _Update_Per_Personal_Codigo;
private String _Update_Per_Personal_Nombre;
private Decimal _Costo_Total;
private Decimal _Costo_Total_Costo_Transporte;
private String _Int_Moneda_Simbolo;
private String _Disponible_Nombre;
private String _estado_nombre;
    private Decimal _Sort_Codigo;

// Propiedades de la clase
public String Unidad
{
get{return _Unidad;}
set{_Unidad=value;}
}

    public Decimal Sort_Codigo
    {
        get { return _Sort_Codigo; }
        set { _Sort_Codigo = value; }
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
                  
public String Disponible
{
get{return _Disponible;}
set{_Disponible=value;}
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
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
}
                  
public String Disponible_Nombre
{
get{return _Disponible_Nombre;}
set{_Disponible_Nombre=value;}
}
                  
public String estado_nombre
{
get{return _estado_nombre;}
set{_estado_nombre=value;}
}
                  
// Constructor
public Apu_Material()
{
}
 public Apu_Material(String _Id,String _Codigo, String _Nombre,String _Estado,String _Unidad, Decimal _Costo_Parcial, Decimal _Costo_Otros, Decimal _Costo_Transporte, String _Disponible, String _Int_Sucursal_Id, String _Int_Moneda_Id, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _Costo_Total, Decimal _Costo_Total_Costo_Transporte, String _Int_Moneda_Simbolo, String _Disponible_Nombre, String _estado_nombre )
{
this.Id=_Id;
this._Sort_Codigo = Decimal.Parse(_Codigo);
this.Codigo=_Codigo; 
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Unidad=_Unidad;
this._Costo_Parcial=_Costo_Parcial;
this._Costo_Otros=_Costo_Otros;
this._Costo_Transporte=_Costo_Transporte;
this._Disponible=_Disponible;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Int_Moneda_Id=_Int_Moneda_Id;
this._Fecha_Creacion=_Fecha_Creacion;
this._Creacion_Per_Personal_Id=_Creacion_Per_Personal_Id;
this._Fecha_Update=_Fecha_Update;
this._Update_Per_Personal_Id=_Update_Per_Personal_Id;
this._Int_Sucursal_Codigo=_Int_Sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Creacion_Per_Personal_Codigo=_Creacion_Per_Personal_Codigo;
this._Creacion_Per_Personal_Nombre=_Creacion_Per_Personal_Nombre;
this._Update_Per_Personal_Codigo=_Update_Per_Personal_Codigo;
this._Update_Per_Personal_Nombre=_Update_Per_Personal_Nombre;
this._Costo_Total=_Costo_Total;
this._Costo_Total_Costo_Transporte=_Costo_Total_Costo_Transporte;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Disponible_Nombre=_Disponible_Nombre;
this._estado_nombre=_estado_nombre;
}
}
}
