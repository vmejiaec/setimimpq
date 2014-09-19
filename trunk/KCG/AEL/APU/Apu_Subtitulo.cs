
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Subtitulo: Entidad
{
// Atributos
private String _Apu_Titulo_Id;
private String _Int_Empresa_Id;
private String _Int_empresa_Codigo;
private String _Int_Empresa_nombre;
private String _Apu_Titulo_Codigo;
private String _Apu_Titulo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Apu_Titulo_Id
{
get{return _Apu_Titulo_Id;}
set{_Apu_Titulo_Id=value;}
}
                  
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
                  
public String Apu_Titulo_Codigo
{
get{return _Apu_Titulo_Codigo;}
set{_Apu_Titulo_Codigo=value;}
}
                  
public String Apu_Titulo_Nombre
{
get{return _Apu_Titulo_Nombre;}
set{_Apu_Titulo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Apu_Subtitulo()
{
}
 public Apu_Subtitulo(String _Id,String _Codigo, String _Nombre,String _Estado,String _Apu_Titulo_Id, String _Int_Empresa_Id, String _Int_empresa_Codigo, String _Int_Empresa_nombre, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;  
this.Nombre=_Nombre;
this.Estado=_Estado;
this._Apu_Titulo_Id=_Apu_Titulo_Id;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_empresa_Codigo=_Int_empresa_Codigo;
this._Int_Empresa_nombre=_Int_Empresa_nombre;
this._Apu_Titulo_Codigo=_Apu_Titulo_Codigo;
this._Apu_Titulo_Nombre=_Apu_Titulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
