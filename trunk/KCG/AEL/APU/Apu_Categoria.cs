
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Categoria: Entidad
{
// Atributos
private String _Int_Empresa_Id;
private Decimal _Costo_Diario;
private Decimal _Costo_Hora;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Int_Moneda_Simbolo;
private String _Estado_Nombre;

// Propiedades de la clase
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public Decimal Costo_Diario
{
get{return _Costo_Diario;}
set{_Costo_Diario=value;}
}
                  
public Decimal Costo_Hora
{
get{return _Costo_Hora;}
set{_Costo_Hora=value;}
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
public Apu_Categoria()
{
}
 public Apu_Categoria(String _Id,String _Codigo, String _Nombre,String _Estado,String _Int_Empresa_Id, Decimal _Costo_Diario, Decimal _Costo_Hora, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Int_Moneda_Simbolo, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Costo_Diario=_Costo_Diario;
this._Costo_Hora=_Costo_Hora;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
