
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Categoria: Entidad
{
// Atributos
private String _Apu_Proyecto_Id;
private String _Apu_Categoria_Id;
private Decimal _Costo_Diario;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Categoria_Codigo;
private String _Apu_Categoria_Nombre;
private String _Int_Empresa_id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private Decimal _Costo_Hora;
private String _Int_Moneda_Simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Categoria_Id
{
get{return _Apu_Categoria_Id;}
set{_Apu_Categoria_Id=value;}
}
                  
public Decimal Costo_Diario
{
get{return _Costo_Diario;}
set{_Costo_Diario=value;}
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
                  
public String Int_Empresa_id
{
get{return _Int_Empresa_id;}
set{_Int_Empresa_id=value;}
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
                  
public Decimal Costo_Hora
{
get{return _Costo_Hora;}
set{_Costo_Hora=value;}
}
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Proyecto_Categoria()
{
}
 public Apu_Proyecto_Categoria(String _Id,String _Codigo, String _Estado,String _Apu_Proyecto_Id, String _Apu_Categoria_Id, Decimal _Costo_Diario, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Int_Empresa_id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, Decimal _Costo_Hora, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Categoria_Id=_Apu_Categoria_Id;
this._Costo_Diario=_Costo_Diario;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Categoria_Codigo=_Apu_Categoria_Codigo;
this._Apu_Categoria_Nombre=_Apu_Categoria_Nombre;
this._Int_Empresa_id=_Int_Empresa_id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Costo_Hora=_Costo_Hora;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
