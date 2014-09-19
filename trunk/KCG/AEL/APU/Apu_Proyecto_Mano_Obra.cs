
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Mano_Obra: Entidad
{
// Atributos
private Decimal _Costo_Diario;
private String _Apu_Proyecto_Id;
private String _Apu_Mano_Obra_Id;
private String _Apu_Indice_Id;
private String _Apu_Categoria_Id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private String _Apu_Proyecto_Etapa;
private String _Apu_Mano_Obra_Codigo;
private String _Apu_Mano_Obra_Nombre;
private Decimal _Costo_Total;
private String _Apu_Categoria_Codigo;
private String _Apu_Categoria_Nombre;
private String _Int_Moneda_Simbolo;
private Decimal _Cantidad_Mano_Obra;
private Decimal _Cantidad_Mano_Obra_X_Costo;
private String _Apu_Indice_Codigo;
private String _Apu_Indice_Nombre;
private Decimal _Apu_Mano_Obra_Costo_Diario;
private Decimal _Costo_Hora;
private String _Estado_Nombre;

// Propiedades de la clase
public Decimal Costo_Diario
{
get{return _Costo_Diario;}
set{_Costo_Diario=value;}
}
                  
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Mano_Obra_Id
{
get{return _Apu_Mano_Obra_Id;}
set{_Apu_Mano_Obra_Id=value;}
}
                  
public String Apu_Indice_Id
{
get{return _Apu_Indice_Id;}
set{_Apu_Indice_Id=value;}
}
                  
public String Apu_Categoria_Id
{
get{return _Apu_Categoria_Id;}
set{_Apu_Categoria_Id=value;}
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
                  
public String Apu_Mano_Obra_Codigo
{
get{return _Apu_Mano_Obra_Codigo;}
set{_Apu_Mano_Obra_Codigo=value;}
}
                  
public String Apu_Mano_Obra_Nombre
{
get{return _Apu_Mano_Obra_Nombre;}
set{_Apu_Mano_Obra_Nombre=value;}
}
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
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
                  
public String Int_Moneda_Simbolo
{
get{return _Int_Moneda_Simbolo;}
set{_Int_Moneda_Simbolo=value;}
}
                  
public Decimal Cantidad_Mano_Obra
{
get{return _Cantidad_Mano_Obra;}
set{_Cantidad_Mano_Obra=value;}
}
                  
public Decimal Cantidad_Mano_Obra_X_Costo
{
get{return _Cantidad_Mano_Obra_X_Costo;}
set{_Cantidad_Mano_Obra_X_Costo=value;}
}
                  
public String Apu_Indice_Codigo
{
get{return _Apu_Indice_Codigo;}
set{_Apu_Indice_Codigo=value;}
}
                  
public String Apu_Indice_Nombre
{
get{return _Apu_Indice_Nombre;}
set{_Apu_Indice_Nombre=value;}
}
                  
public Decimal Apu_Mano_Obra_Costo_Diario
{
get{return _Apu_Mano_Obra_Costo_Diario;}
set{_Apu_Mano_Obra_Costo_Diario=value;}
}
                  
public Decimal Costo_Hora
{
get{return _Costo_Hora;}
set{_Costo_Hora=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Proyecto_Mano_Obra()
{
}
 public Apu_Proyecto_Mano_Obra(String _Id,String _Codigo, String _Estado,Decimal _Costo_Diario, String _Apu_Proyecto_Id, String _Apu_Mano_Obra_Id, String _Apu_Indice_Id, String _Apu_Categoria_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Mano_Obra_Codigo, String _Apu_Mano_Obra_Nombre, Decimal _Costo_Total, String _Apu_Categoria_Codigo, String _Apu_Categoria_Nombre, String _Int_Moneda_Simbolo, Decimal _Cantidad_Mano_Obra, Decimal _Cantidad_Mano_Obra_X_Costo, String _Apu_Indice_Codigo, String _Apu_Indice_Nombre, Decimal _Apu_Mano_Obra_Costo_Diario, Decimal _Costo_Hora, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Estado=_Estado;
this._Costo_Diario=_Costo_Diario;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Mano_Obra_Id=_Apu_Mano_Obra_Id;
this._Apu_Indice_Id=_Apu_Indice_Id;
this._Apu_Categoria_Id=_Apu_Categoria_Id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_Mano_Obra_Codigo=_Apu_Mano_Obra_Codigo;
this._Apu_Mano_Obra_Nombre=_Apu_Mano_Obra_Nombre;
this._Costo_Total=_Costo_Total;
this._Apu_Categoria_Codigo=_Apu_Categoria_Codigo;
this._Apu_Categoria_Nombre=_Apu_Categoria_Nombre;
this._Int_Moneda_Simbolo=_Int_Moneda_Simbolo;
this._Cantidad_Mano_Obra=_Cantidad_Mano_Obra;
this._Cantidad_Mano_Obra_X_Costo=_Cantidad_Mano_Obra_X_Costo;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Apu_Mano_Obra_Costo_Diario=_Apu_Mano_Obra_Costo_Diario;
this._Costo_Hora=_Costo_Hora;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
