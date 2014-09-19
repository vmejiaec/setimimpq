
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Insumo: Entidad
{
// Atributos
private String _Apu_Proyecto_Id;
private String _Apu_Insumo_Id;
private String _Tipo;
private String _Tipo_Nombre;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Insumo_Codigo;
private String _Apu_Insumo_Nombre;
private Decimal _Costo_Parametros;
private Decimal _Costo_Proyecto;
private String _Int_Sucursal_Id;

// Propiedades de la clase
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Insumo_Id
{
get{return _Apu_Insumo_Id;}
set{_Apu_Insumo_Id=value;}
}
                  
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
}
                  
public String Tipo_Nombre
{
get{return _Tipo_Nombre;}
set{_Tipo_Nombre=value;}
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
                  
public String Apu_Insumo_Codigo
{
get{return _Apu_Insumo_Codigo;}
set{_Apu_Insumo_Codigo=value;}
}
                  
public String Apu_Insumo_Nombre
{
get{return _Apu_Insumo_Nombre;}
set{_Apu_Insumo_Nombre=value;}
}
                  
public Decimal Costo_Parametros
{
get{return _Costo_Parametros;}
set{_Costo_Parametros=value;}
}
                  
public Decimal Costo_Proyecto
{
get{return _Costo_Proyecto;}
set{_Costo_Proyecto=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
// Constructor
public Apu_Proyecto_Insumo()
{
}
 public Apu_Proyecto_Insumo(String _Id,String _Codigo, String _Apu_Proyecto_Id, String _Apu_Insumo_Id, String _Tipo, String _Tipo_Nombre, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Insumo_Codigo, String _Apu_Insumo_Nombre, Decimal _Costo_Parametros, Decimal _Costo_Proyecto, String _Int_Sucursal_Id )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Insumo_Id=_Apu_Insumo_Id;
this._Tipo=_Tipo;
this._Tipo_Nombre=_Tipo_Nombre;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Insumo_Codigo=_Apu_Insumo_Codigo;
this._Apu_Insumo_Nombre=_Apu_Insumo_Nombre;
this._Costo_Parametros=_Costo_Parametros;
this._Costo_Proyecto=_Costo_Proyecto;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
}
}
}
