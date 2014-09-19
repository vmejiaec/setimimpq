
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Provincia: Entidad
{
// Atributos
private String _Int_Empresa_Id;
private String _Int_empresa_Codigo;
private String _Int_Empresa_nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
}
                  
public String Int_empresa_Codigo
{
get{return _Int_empresa_Codigo;}
set{_Int_empresa_Codigo=value;}
}
                  
public String Int_Empresa_nombre
{
get{return _Int_Empresa_nombre;}
set{_Int_Empresa_nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Provincia()
{
}
 public Apu_Provincia(String _Id,String _Codigo, String _Nombre,String _Estado,String _Int_Empresa_Id, String _Int_empresa_Codigo, String _Int_Empresa_nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_empresa_Codigo=_Int_empresa_Codigo;
this._Int_Empresa_nombre=_Int_Empresa_nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
