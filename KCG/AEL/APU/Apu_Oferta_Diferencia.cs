
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Diferencia: Entidad
{
// Atributos
private String _Apu_Oferta_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Indice_Nombre;
private String _Apu_Indice_Codigo;
private Decimal _costo_total;
private Decimal _coeficiente;
private String _Letra;

// Propiedades de la clase
public String Apu_Oferta_Id
{
get{return _Apu_Oferta_Id;}
set{_Apu_Oferta_Id=value;}
}
                  
public String Apu_Oferta_Codigo
{
get{return _Apu_Oferta_Codigo;}
set{_Apu_Oferta_Codigo=value;}
}
                  
public String Apu_Oferta_Nombre
{
get{return _Apu_Oferta_Nombre;}
set{_Apu_Oferta_Nombre=value;}
}
                  
public String Apu_Oferta_Etapa
{
get{return _Apu_Oferta_Etapa;}
set{_Apu_Oferta_Etapa=value;}
}
                  
public String Apu_Indice_Nombre
{
get{return _Apu_Indice_Nombre;}
set{_Apu_Indice_Nombre=value;}
}
                  
public String Apu_Indice_Codigo
{
get{return _Apu_Indice_Codigo;}
set{_Apu_Indice_Codigo=value;}
}
                  
public Decimal costo_total
{
get{return _costo_total;}
set{_costo_total=value;}
}
                  
public Decimal coeficiente
{
get{return _coeficiente;}
set{_coeficiente=value;}
}
                  
public String Letra
{
get{return _Letra;}
set{_Letra=value;}
}
                  
// Constructor
public Apu_Oferta_Diferencia()
{
}
 public Apu_Oferta_Diferencia(String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Indice_Nombre, String _Apu_Indice_Codigo, Decimal _costo_total, Decimal _coeficiente, String _Letra )
{

this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._costo_total=_costo_total;
this._coeficiente=_coeficiente;
this._Letra=_Letra;
}
}
}
