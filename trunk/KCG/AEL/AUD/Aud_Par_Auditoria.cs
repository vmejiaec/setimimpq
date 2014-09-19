
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.AUD
{
public class Aud_Par_Auditoria: Entidad
{
// Atributos
private String _Int_Sucursal_Id;
private String _Dic_Objeto_Id;
private String _INS;
private String _UPD;
private String _DEL;
private String _UNI;
private String _SEL;
private String _BIN;
private String _BUP;
private String _BDE;
private String _Int_sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Int_empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Int_Moneda_id;
private String _Int_Moneda_Codigo;
private String _Int_Moneda_Nombre;
private String _INS_Nombre;
private String _UPD_Nombre;
private String _DEL_Nombre;
private String _UNI_Nombre;
private String _SEL_Nombre;
private String _BIN_Nombre;
private String _BUP_Nombre;
private String _BDE_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
}
                  
public String INS
{
get{return _INS;}
set{_INS=value;}
}
                  
public String UPD
{
get{return _UPD;}
set{_UPD=value;}
}
                  
public String DEL
{
get{return _DEL;}
set{_DEL=value;}
}
                  
public String UNI
{
get{return _UNI;}
set{_UNI=value;}
}
                  
public String SEL
{
get{return _SEL;}
set{_SEL=value;}
}
                  
public String BIN
{
get{return _BIN;}
set{_BIN=value;}
}
                  
public String BUP
{
get{return _BUP;}
set{_BUP=value;}
}
                  
public String BDE
{
get{return _BDE;}
set{_BDE=value;}
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
                  
public String Dic_Objeto_Codigo
{
get{return _Dic_Objeto_Codigo;}
set{_Dic_Objeto_Codigo=value;}
}
                  
public String Dic_Objeto_Nombre
{
get{return _Dic_Objeto_Nombre;}
set{_Dic_Objeto_Nombre=value;}
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
                  
public String Int_Moneda_id
{
get{return _Int_Moneda_id;}
set{_Int_Moneda_id=value;}
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
                  
public String INS_Nombre
{
get{return _INS_Nombre;}
set{_INS_Nombre=value;}
}
                  
public String UPD_Nombre
{
get{return _UPD_Nombre;}
set{_UPD_Nombre=value;}
}
                  
public String DEL_Nombre
{
get{return _DEL_Nombre;}
set{_DEL_Nombre=value;}
}
                  
public String UNI_Nombre
{
get{return _UNI_Nombre;}
set{_UNI_Nombre=value;}
}
                  
public String SEL_Nombre
{
get{return _SEL_Nombre;}
set{_SEL_Nombre=value;}
}
                  
public String BIN_Nombre
{
get{return _BIN_Nombre;}
set{_BIN_Nombre=value;}
}
                  
public String BUP_Nombre
{
get{return _BUP_Nombre;}
set{_BUP_Nombre=value;}
}
                  
public String BDE_Nombre
{
get{return _BDE_Nombre;}
set{_BDE_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Aud_Par_Auditoria()
{
}
 public Aud_Par_Auditoria(String _Id,String _Codigo, String _Estado,String _Int_Sucursal_Id, String _Dic_Objeto_Id, String _INS, String _UPD, String _DEL, String _UNI, String _SEL, String _BIN, String _BUP, String _BDE, String _Int_sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Int_Moneda_id, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _INS_Nombre, String _UPD_Nombre, String _DEL_Nombre, String _UNI_Nombre, String _SEL_Nombre, String _BIN_Nombre, String _BUP_Nombre, String _BDE_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._INS=_INS;
this._UPD=_UPD;
this._DEL=_DEL;
this._UNI=_UNI;
this._SEL=_SEL;
this._BIN=_BIN;
this._BUP=_BUP;
this._BDE=_BDE;
this._Int_sucursal_Codigo=_Int_sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Int_empresa_Id=_Int_empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Int_Moneda_id=_Int_Moneda_id;
this._Int_Moneda_Codigo=_Int_Moneda_Codigo;
this._Int_Moneda_Nombre=_Int_Moneda_Nombre;
this._INS_Nombre=_INS_Nombre;
this._UPD_Nombre=_UPD_Nombre;
this._DEL_Nombre=_DEL_Nombre;
this._UNI_Nombre=_UNI_Nombre;
this._SEL_Nombre=_SEL_Nombre;
this._BIN_Nombre=_BIN_Nombre;
this._BUP_Nombre=_BUP_Nombre;
this._BDE_Nombre=_BDE_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
