
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.AUD
{
public class Aud_Par_Log: Entidad
{
// Atributos
private String _Int_Sucursal_Id;
private String _Dic_Contenedor_Id;
private String _ERR;
private String _USR;
private String _DDL;
private String _EJE;
private String _Dic_Contenedor_Codigo;
private String _Dic_contenedor_Nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Int_sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Int_moneda_id;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _ERR_Nombre;
private String _USR_Nombre;
private String _DDL_Nombre;
private String _EJE_Nombre;
private String _Estado_nombre;

// Propiedades de la clase
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String Dic_Contenedor_Id
{
get{return _Dic_Contenedor_Id;}
set{_Dic_Contenedor_Id=value;}
}
                  
public String ERR
{
get{return _ERR;}
set{_ERR=value;}
}
                  
public String USR
{
get{return _USR;}
set{_USR=value;}
}
                  
public String DDL
{
get{return _DDL;}
set{_DDL=value;}
}
                  
public String EJE
{
get{return _EJE;}
set{_EJE=value;}
}
                  
public String Dic_Contenedor_Codigo
{
get{return _Dic_Contenedor_Codigo;}
set{_Dic_Contenedor_Codigo=value;}
}
                  
public String Dic_contenedor_Nombre
{
get{return _Dic_contenedor_Nombre;}
set{_Dic_contenedor_Nombre=value;}
}
                  
public String Dic_Modulo_Id
{
get{return _Dic_Modulo_Id;}
set{_Dic_Modulo_Id=value;}
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
                  
public String Int_sucursal_Codigo
{
get{return _Int_sucursal_Codigo;}
set{_Int_sucursal_Codigo=value;}
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
                  
public String ERR_Nombre
{
get{return _ERR_Nombre;}
set{_ERR_Nombre=value;}
}
                  
public String USR_Nombre
{
get{return _USR_Nombre;}
set{_USR_Nombre=value;}
}
                  
public String DDL_Nombre
{
get{return _DDL_Nombre;}
set{_DDL_Nombre=value;}
}
                  
public String EJE_Nombre
{
get{return _EJE_Nombre;}
set{_EJE_Nombre=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Aud_Par_Log()
{
}
 public Aud_Par_Log(String _Id,String _Codigo, String _Estado,String _Int_Sucursal_Id, String _Dic_Contenedor_Id, String _ERR, String _USR, String _DDL, String _EJE, String _Dic_Contenedor_Codigo, String _Dic_contenedor_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Int_sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Int_moneda_id, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _ERR_Nombre, String _USR_Nombre, String _DDL_Nombre, String _EJE_Nombre, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Dic_Contenedor_Id=_Dic_Contenedor_Id;
this._ERR=_ERR;
this._USR=_USR;
this._DDL=_DDL;
this._EJE=_EJE;
this._Dic_Contenedor_Codigo=_Dic_Contenedor_Codigo;
this._Dic_contenedor_Nombre=_Dic_contenedor_Nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Int_sucursal_Codigo=_Int_sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_empresa_Id=_Int_empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Int_moneda_id=_Int_moneda_id;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._ERR_Nombre=_ERR_Nombre;
this._USR_Nombre=_USR_Nombre;
this._DDL_Nombre=_DDL_Nombre;
this._EJE_Nombre=_EJE_Nombre;
this._Estado_nombre=_Estado_nombre;
}
}
}
