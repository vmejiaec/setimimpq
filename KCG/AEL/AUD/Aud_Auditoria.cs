
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.AUD
{
public class Aud_Auditoria: Entidad
{
// Atributos
private String _Accion;
private DateTime _Fecha;
private String _Id_Origen;
private String _Codigo_Origen;
private String _Seg_Rol_Id;
private String _Dic_Objeto_Id;
private String _Int_Usuario_Id;
private String _Dic_Contenedor_Id;
private String _Int_Sucursal_Id;
private String _Campos;
private String _Dic_Objeto_Codigo;
private String _Dic_objeto_Nombre;
private String _Objeto_Dic_Modulo_Id;
private String _Objeto_Dic_modulo_codigo;
private String _Objeto_Dic_modulo_nombre;
private String _Seg_Rol_Codigo;
private String _Seg_Rol_Nombre;
private String _Int_Usuario_Codigo;
private String _Int_Usuario_Nombre;
private String _Int_Sucursal_codigo;
private String _Int_Sucursal_nombre;
private String _int_empresa_id;
private String _int_empresa_codigo;
private String _int_empresa_nombre;
private String _Int_Moneda_Id;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _Dic_contenedor_Codigo;
private String _Dic_contenedor_Nombre;
private String _Contenedor_Dic_Modulo_Id;
private String _Contenedor_Dic_modulo_codigo;
private String _Contenedor_Dic_modulo_nombre;
private String _Accion_Nombre;
private String _estado_Nombre;

// Propiedades de la clase
public String Accion
{
get{return _Accion;}
set{_Accion=value;}
}
                  
public DateTime Fecha
{
get{return _Fecha;}
set{_Fecha=value;}
}
                  
public String Id_Origen
{
get{return _Id_Origen;}
set{_Id_Origen=value;}
}
                  
public String Codigo_Origen
{
get{return _Codigo_Origen;}
set{_Codigo_Origen=value;}
}
                  
public String Seg_Rol_Id
{
get{return _Seg_Rol_Id;}
set{_Seg_Rol_Id=value;}
}
                  
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
}
                  
public String Int_Usuario_Id
{
get{return _Int_Usuario_Id;}
set{_Int_Usuario_Id=value;}
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
                  
public String Campos
{
get{return _Campos;}
set{_Campos=value;}
}
                  
public String Dic_Objeto_Codigo
{
get{return _Dic_Objeto_Codigo;}
set{_Dic_Objeto_Codigo=value;}
}
                  
public String Dic_objeto_Nombre
{
get{return _Dic_objeto_Nombre;}
set{_Dic_objeto_Nombre=value;}
}
                  
public String Objeto_Dic_Modulo_Id
{
get{return _Objeto_Dic_Modulo_Id;}
set{_Objeto_Dic_Modulo_Id=value;}
}
                  
public String Objeto_Dic_modulo_codigo
{
get{return _Objeto_Dic_modulo_codigo;}
set{_Objeto_Dic_modulo_codigo=value;}
}
                  
public String Objeto_Dic_modulo_nombre
{
get{return _Objeto_Dic_modulo_nombre;}
set{_Objeto_Dic_modulo_nombre=value;}
}
                  
public String Seg_Rol_Codigo
{
get{return _Seg_Rol_Codigo;}
set{_Seg_Rol_Codigo=value;}
}
                  
public String Seg_Rol_Nombre
{
get{return _Seg_Rol_Nombre;}
set{_Seg_Rol_Nombre=value;}
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
                  
public String Int_Sucursal_codigo
{
get{return _Int_Sucursal_codigo;}
set{_Int_Sucursal_codigo=value;}
}
                  
public String Int_Sucursal_nombre
{
get{return _Int_Sucursal_nombre;}
set{_Int_Sucursal_nombre=value;}
}
                  
public String int_empresa_id
{
get{return _int_empresa_id;}
set{_int_empresa_id=value;}
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
                  
public String Dic_contenedor_Codigo
{
get{return _Dic_contenedor_Codigo;}
set{_Dic_contenedor_Codigo=value;}
}
                  
public String Dic_contenedor_Nombre
{
get{return _Dic_contenedor_Nombre;}
set{_Dic_contenedor_Nombre=value;}
}
                  
public String Contenedor_Dic_Modulo_Id
{
get{return _Contenedor_Dic_Modulo_Id;}
set{_Contenedor_Dic_Modulo_Id=value;}
}
                  
public String Contenedor_Dic_modulo_codigo
{
get{return _Contenedor_Dic_modulo_codigo;}
set{_Contenedor_Dic_modulo_codigo=value;}
}
                  
public String Contenedor_Dic_modulo_nombre
{
get{return _Contenedor_Dic_modulo_nombre;}
set{_Contenedor_Dic_modulo_nombre=value;}
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
public Aud_Auditoria()
{
}
 public Aud_Auditoria(String _Id,String _Codigo, String _Nombre,String _Estado,String _Accion, DateTime _Fecha, String _Id_Origen, String _Codigo_Origen, String _Seg_Rol_Id, String _Dic_Objeto_Id, String _Int_Usuario_Id, String _Dic_Contenedor_Id, String _Int_Sucursal_Id, String _Campos, String _Dic_Objeto_Codigo, String _Dic_objeto_Nombre, String _Objeto_Dic_Modulo_Id, String _Objeto_Dic_modulo_codigo, String _Objeto_Dic_modulo_nombre, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Int_Usuario_Codigo, String _Int_Usuario_Nombre, String _Int_Sucursal_codigo, String _Int_Sucursal_nombre, String _int_empresa_id, String _int_empresa_codigo, String _int_empresa_nombre, String _Int_Moneda_Id, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Dic_contenedor_Codigo, String _Dic_contenedor_Nombre, String _Contenedor_Dic_Modulo_Id, String _Contenedor_Dic_modulo_codigo, String _Contenedor_Dic_modulo_nombre, String _Accion_Nombre, String _estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Accion=_Accion;
this._Fecha=_Fecha;
this._Id_Origen=_Id_Origen;
this._Codigo_Origen=_Codigo_Origen;
this._Seg_Rol_Id=_Seg_Rol_Id;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Int_Usuario_Id=_Int_Usuario_Id;
this._Dic_Contenedor_Id=_Dic_Contenedor_Id;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Campos=_Campos;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_objeto_Nombre=_Dic_objeto_Nombre;
this._Objeto_Dic_Modulo_Id=_Objeto_Dic_Modulo_Id;
this._Objeto_Dic_modulo_codigo=_Objeto_Dic_modulo_codigo;
this._Objeto_Dic_modulo_nombre=_Objeto_Dic_modulo_nombre;
this._Seg_Rol_Codigo=_Seg_Rol_Codigo;
this._Seg_Rol_Nombre=_Seg_Rol_Nombre;
this._Int_Usuario_Codigo=_Int_Usuario_Codigo;
this._Int_Usuario_Nombre=_Int_Usuario_Nombre;
this._Int_Sucursal_codigo=_Int_Sucursal_codigo;
this._Int_Sucursal_nombre=_Int_Sucursal_nombre;
this._int_empresa_id=_int_empresa_id;
this._int_empresa_codigo=_int_empresa_codigo;
this._int_empresa_nombre=_int_empresa_nombre;
this._Int_Moneda_Id=_Int_Moneda_Id;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._Dic_contenedor_Codigo=_Dic_contenedor_Codigo;
this._Dic_contenedor_Nombre=_Dic_contenedor_Nombre;
this._Contenedor_Dic_Modulo_Id=_Contenedor_Dic_Modulo_Id;
this._Contenedor_Dic_modulo_codigo=_Contenedor_Dic_modulo_codigo;
this._Contenedor_Dic_modulo_nombre=_Contenedor_Dic_modulo_nombre;
this._Accion_Nombre=_Accion_Nombre;
this._estado_Nombre=_estado_Nombre;
}
}
}
