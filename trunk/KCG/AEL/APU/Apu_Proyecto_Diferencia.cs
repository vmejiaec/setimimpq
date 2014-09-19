
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Diferencia: Entidad
{
// Atributos
private String _Apu_Proyecto_Id;
private String _Apu_proyecto_Codigo;
private String _Apu_proyecto_Nombre;
private String _Apu_proyecto_Etapa;
private String _Apu_Indice_Nombre;
private String _Apu_Indice_Codigo;
private Decimal _costo_total;
private Decimal _Coeficiente;
private String _Letra;

// Propiedades de la clase
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_proyecto_Codigo
{
get{return _Apu_proyecto_Codigo;}
set{_Apu_proyecto_Codigo=value;}
}
                  
public String Apu_proyecto_Nombre
{
get{return _Apu_proyecto_Nombre;}
set{_Apu_proyecto_Nombre=value;}
}
                  
public String Apu_proyecto_Etapa
{
get{return _Apu_proyecto_Etapa;}
set{_Apu_proyecto_Etapa=value;}
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
public Apu_Proyecto_Diferencia()
{
}
 public Apu_Proyecto_Diferencia(String _Apu_Proyecto_Id, String _Apu_proyecto_Codigo, String _Apu_proyecto_Nombre, String _Apu_proyecto_Etapa, String _Apu_Indice_Nombre, String _Apu_Indice_Codigo, Decimal _costo_total, Decimal _Coeficiente, String _Letra )
{

this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_proyecto_Codigo=_Apu_proyecto_Codigo;
this._Apu_proyecto_Nombre=_Apu_proyecto_Nombre;
this._Apu_proyecto_Etapa=_Apu_proyecto_Etapa;
this._Apu_Indice_Nombre=_Apu_Indice_Nombre;
this._Apu_Indice_Codigo=_Apu_Indice_Codigo;
this._costo_total=_costo_total;
this._Coeficiente=_Coeficiente;
this._Letra=_Letra;
}
}
}
