
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol_Usuario_Det: Entidad
{
// Atributos
private String _Seg_Rol_Usuario_Id;
private String _Int_Sucursal_Id;
private String _seg_rol_usuario_codigo;
private String _seg_rol_usuario_nombre;
private String _Int_Sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_Empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Int_Moneda_Id;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _seg_rol_id;
private String _seg_rol_Codigo;
private String _seg_rol_Nombre;
private String _int_usuario_id;
private String _int_usuario_Codigo;
private String _int_usuario_Nombre;
private String _Estado_nombre;

// Propiedades de la clase
public String Seg_Rol_Usuario_Id
{
get{return _Seg_Rol_Usuario_Id;}
set{_Seg_Rol_Usuario_Id=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String seg_rol_usuario_codigo
{
get{return _seg_rol_usuario_codigo;}
set{_seg_rol_usuario_codigo=value;}
}
                  
public String seg_rol_usuario_nombre
{
get{return _seg_rol_usuario_nombre;}
set{_seg_rol_usuario_nombre=value;}
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
                  
public String Int_Moneda_Id
{
get{return _Int_Moneda_Id;}
set{_Int_Moneda_Id=value;}
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
                  
public String seg_rol_id
{
get{return _seg_rol_id;}
set{_seg_rol_id=value;}
}
                  
public String seg_rol_Codigo
{
get{return _seg_rol_Codigo;}
set{_seg_rol_Codigo=value;}
}
                  
public String seg_rol_Nombre
{
get{return _seg_rol_Nombre;}
set{_seg_rol_Nombre=value;}
}
                  
public String int_usuario_id
{
get{return _int_usuario_id;}
set{_int_usuario_id=value;}
}
                  
public String int_usuario_Codigo
{
get{return _int_usuario_Codigo;}
set{_int_usuario_Codigo=value;}
}
                  
public String int_usuario_Nombre
{
get{return _int_usuario_Nombre;}
set{_int_usuario_Nombre=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Seg_Rol_Usuario_Det()
{
}
 public Seg_Rol_Usuario_Det(String _Id,String _Codigo, String _Estado,String _Seg_Rol_Usuario_Id, String _Int_Sucursal_Id, String _seg_rol_usuario_codigo, String _seg_rol_usuario_nombre, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Int_Moneda_Id, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _seg_rol_id, String _seg_rol_Codigo, String _seg_rol_Nombre, String _int_usuario_id, String _int_usuario_Codigo, String _int_usuario_Nombre, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Seg_Rol_Usuario_Id=_Seg_Rol_Usuario_Id;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._seg_rol_usuario_codigo=_seg_rol_usuario_codigo;
this._seg_rol_usuario_nombre=_seg_rol_usuario_nombre;
this._Int_Sucursal_Codigo=_Int_Sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Int_Moneda_Id=_Int_Moneda_Id;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._seg_rol_id=_seg_rol_id;
this._seg_rol_Codigo=_seg_rol_Codigo;
this._seg_rol_Nombre=_seg_rol_Nombre;
this._int_usuario_id=_int_usuario_id;
this._int_usuario_Codigo=_int_usuario_Codigo;
this._int_usuario_Nombre=_int_usuario_Nombre;
this._Estado_nombre=_Estado_nombre;
}
}
}
