
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Oferta_Indice: Entidad
{
// Atributos
private String _Apu_Oferta_Id;
private String _Apu_Oferta_Codigo;
private String _Apu_Oferta_Nombre;
private String _Apu_Oferta_Etapa;
private String _Apu_Indice_Nombre;
private String _Apu_Indice_Codigo;
private Decimal _Costo_Total;
private Decimal _Coeficiente;
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
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
}
                  
public Decimal Coeficiente
{
get{return _Coeficiente;}
set{_Coeficiente=value;}
}
                  
public String Letra
{
get{return _Letra;}
set{_Letra=value;}
}
                  
// Constructor
public Apu_Oferta_Indice()
{
}
 public Apu_Oferta_Indice(String _Apu_Oferta_Id, String _Apu_Oferta_Codigo, String _Apu_Oferta_Nombre, String _Apu_Oferta_Etapa, String _Apu_Indice_Nombre, String _Apu_Indice_Codigo, Decimal _Costo_Total, Decimal _Coeficiente, String _Letra )
{

this._Apu_Oferta_Id=_Apu_Oferta_Id;
this._Apu_Oferta_Codigo=_Apu_Oferta_Codigo;
this._Apu_Oferta_Nombre=_Apu_Oferta_Nombre;
this._Apu_Oferta_Etapa=_Apu_Oferta_Etapa;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._Costo_Total=_Costo_Total;
this._Coeficiente=_Coeficiente;
this._Letra=_Letra;
}
}
}
