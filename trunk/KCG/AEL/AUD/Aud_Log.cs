
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.AUD
{
public class Aud_Log: Entidad
{
// Atributos
private DateTime _Fecha;
private String _Accion;
private String _Dic_Contenedor_Id;
private String _Int_Sucursal_Id;
private String _Seg_Rol_Id;
private String _Int_Usuario_Id;
private String _Ver_Version_Id;
private String _Par_Mensaje_Id;
private String _Procedimiento;
private String _Parametros;
private String _Datos;
private String _Dic_Contenedor_Codigo;
private String _Dic_Contenedor_Nombre;
private String _Dic_Modulo_id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Int_Sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_empresa_Id;
private String _int_empresa_codigo;
private String _int_empresa_nombre;
private String _Int_moneda_id;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _seg_rol_codigo;
private String _seg_rol_nombre;
private String _Int_Usuario_Codigo;
private String _Int_Usuario_Nombre;
private String _Per_Personal_Id;
private String _Per_Personal_Codigo;
private String _Per_Personal_Nombre;
private String _ver_version_codigo;
private String _Ver_version_Nombre;
private String _par_mensaje_codigo;
private String _par_mensaje_nombre;
private String _Accion_Nombre;
private String _estado_Nombre;

// Propiedades de la clase
public DateTime Fecha
{
get{return _Fecha;}
set{_Fecha=value;}
}
                  
public String Accion
{
get{return _Accion;}
set{_Accion=value;}
}
                  
public String Dic_Contenedor_Id
{
get{return _Dic_Contenedor_Id;}
set{_Dic_Contenedor_Id=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String Seg_Rol_Id
{
get{return _Seg_Rol_Id;}
set{_Seg_Rol_Id=value;}
}
                  
public String Int_Usuario_Id
{
get{return _Int_Usuario_Id;}
set{_Int_Usuario_Id=value;}
}
                  
public String Ver_Version_Id
{
get{return _Ver_Version_Id;}
set{_Ver_Version_Id=value;}
}
                  
public String Par_Mensaje_Id
{
get{return _Par_Mensaje_Id;}
set{_Par_Mensaje_Id=value;}
}
                  
public String Procedimiento
{
get{return _Procedimiento;}
set{_Procedimiento=value;}
}
                  
public String Parametros
{
get{return _Parametros;}
set{_Parametros=value;}
}
                  
public String Datos
{
get{return _Datos;}
set{_Datos=value;}
}
                  
public String Dic_Contenedor_Codigo
{
get{return _Dic_Contenedor_Codigo;}
set{_Dic_Contenedor_Codigo=value;}
}
                  
public String Dic_Contenedor_Nombre
{
get{return _Dic_Contenedor_Nombre;}
set{_Dic_Contenedor_Nombre=value;}
}
                  
public String Dic_Modulo_id
{
get{return _Dic_Modulo_id;}
set{_Dic_Modulo_id=value;}
}
                  
public String Dic_Modulo_Codigo
{
get{return _Dic_Modulo_Codigo;}
set{_Dic_Modulo_Codigo=value;}
}
                  
public String Dic_Modulo_Nombre
{
get{return _Dic_Modulo_Nombre;}
set{_Dic_Modulo_Nombre=value;}
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
                  
public String Int_empresa_Id
{
get{return _Int_empresa_Id;}
set{_Int_empresa_Id=value;}
}
                  
public String int_empresa_codigo
{
get{return _int_empresa_codigo;}
set{_int_empresa_codigo=value;}
}
                  
public String int_empresa_nombre
{
get{return _int_empresa_nombre;}
set{_int_empresa_nombre=value;}
}
                  
public String Int_moneda_id
{
get{return _Int_moneda_id;}
set{_Int_moneda_id=value;}
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
                  
public String seg_rol_codigo
{
get{return _seg_rol_codigo;}
set{_seg_rol_codigo=value;}
}
                  
public String seg_rol_nombre
{
get{return _seg_rol_nombre;}
set{_seg_rol_nombre=value;}
}
                  
public String Int_Usuario_Codigo
{
get{return _Int_Usuario_Codigo;}
set{_Int_Usuario_Codigo=value;}
}
                  
public String Int_Usuario_Nombre
{
get{return _Int_Usuario_Nombre;}
set{_Int_Usuario_Nombre=value;}
}
                  
public String Per_Personal_Id
{
get{return _Per_Personal_Id;}
set{_Per_Personal_Id=value;}
}
                  
public String Per_Personal_Codigo
{
get{return _Per_Personal_Codigo;}
set{_Per_Personal_Codigo=value;}
}
                  
public String Per_Personal_Nombre
{
get{return _Per_Personal_Nombre;}
set{_Per_Personal_Nombre=value;}
}
                  
public String ver_version_codigo
{
get{return _ver_version_codigo;}
set{_ver_version_codigo=value;}
}
                  
public String Ver_version_Nombre
{
get{return _Ver_version_Nombre;}
set{_Ver_version_Nombre=value;}
}
                  
public String par_mensaje_codigo
{
get{return _par_mensaje_codigo;}
set{_par_mensaje_codigo=value;}
}
                  
public String par_mensaje_nombre
{
get{return _par_mensaje_nombre;}
set{_par_mensaje_nombre=value;}
}
                  
public String Accion_Nombre
{
get{return _Accion_Nombre;}
set{_Accion_Nombre=value;}
}
                  
public String estado_Nombre
{
get{return _estado_Nombre;}
set{_estado_Nombre=value;}
}
                  
// Constructor
public Aud_Log()
{
}
 public Aud_Log(String _Id,String _Codigo, String _Estado,DateTime _Fecha, String _Accion, String _Dic_Contenedor_Id, String _Int_Sucursal_Id, String _Seg_Rol_Id, String _Int_Usuario_Id, String _Ver_Version_Id, String _Par_Mensaje_Id, String _Procedimiento, String _Parametros, String _Datos, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Dic_Modulo_id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_empresa_Id, String _int_empresa_codigo, String _int_empresa_nombre, String _Int_moneda_id, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _seg_rol_codigo, String _seg_rol_nombre, String _Int_Usuario_Codigo, String _Int_Usuario_Nombre, String _Per_Personal_Id, String _Per_Personal_Codigo, String _Per_Personal_Nombre, String _ver_version_codigo, String _Ver_version_Nombre, String _par_mensaje_codigo, String _par_mensaje_nombre, String _Accion_Nombre, String _estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Fecha=_Fecha;
this._Accion=_Accion;
this._Dic_Contenedor_Id=_Dic_Contenedor_Id;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Seg_Rol_Id=_Seg_Rol_Id;
this._Int_Usuario_Id=_Int_Usuario_Id;
this._Ver_Version_Id=_Ver_Version_Id;
this._Par_Mensaje_Id=_Par_Mensaje_Id;
this._Procedimiento=_Procedimiento;
this._Parametros=_Parametros;
this._Datos=_Datos;
this._Dic_Contenedor_Codigo=_Dic_Contenedor_Codigo;
this._Dic_Contenedor_Nombre=_Dic_Contenedor_Nombre;
this._Dic_Modulo_id=_Dic_Modulo_id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Int_Sucursal_Codigo=_Int_Sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_empresa_Id=_Int_empresa_Id;
this._int_empresa_codigo=_int_empresa_codigo;
this._int_empresa_nombre=_int_empresa_nombre;
this._Int_moneda_id=_Int_moneda_id;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._seg_rol_codigo=_seg_rol_codigo;
this._seg_rol_nombre=_seg_rol_nombre;
this._Int_Usuario_Codigo=_Int_Usuario_Codigo;
this._Int_Usuario_Nombre=_Int_Usuario_Nombre;
this._Per_Personal_Id=_Per_Personal_Id;
this._Per_Personal_Codigo=_Per_Personal_Codigo;
this._Per_Personal_Nombre=_Per_Personal_Nombre;
this._ver_version_codigo=_ver_version_codigo;
this._Ver_version_Nombre=_Ver_version_Nombre;
this._par_mensaje_codigo=_par_mensaje_codigo;
this._par_mensaje_nombre=_par_mensaje_nombre;
this._Accion_Nombre=_Accion_Nombre;
this._estado_Nombre=_estado_Nombre;
}
}
}
