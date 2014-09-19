
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.SEG
{
public class Seg_Rol_Usuario: Entidad
{
// Atributos
private String _Seg_Rol_Id;
private String _Int_Usuario_Id;
private String _Seg_Rol_Codigo;
private String _Seg_Rol_Nombre;
private String _Int_usuario_codigo;
private String _Int_usuario_nombre;
private String _Estado_nombre;

// Propiedades de la clase
public String Seg_Rol_Id
{
get{return _Seg_Rol_Id;}
set{_Seg_Rol_Id=value;}
}
                  
public String Int_Usuario_Id
{
get{return _Int_Usuario_Id;}
set{_Int_Usuario_Id=value;}
}
                  
public String Seg_Rol_Codigo
{
get{return _Seg_Rol_Codigo;}
set{_Seg_Rol_Codigo=value;}
}
                  
public String Seg_Rol_Nombre
{
get{return _Seg_Rol_Nombre;}
set{_Seg_Rol_Nombre=value;}
}
                  
public String Int_usuario_codigo
{
get{return _Int_usuario_codigo;}
set{_Int_usuario_codigo=value;}
}
                  
public String Int_usuario_nombre
{
get{return _Int_usuario_nombre;}
set{_Int_usuario_nombre=value;}
}
                  
public String Estado_nombre
{
get{return _Estado_nombre;}
set{_Estado_nombre=value;}
}
                  
// Constructor
public Seg_Rol_Usuario()
{
}
 public Seg_Rol_Usuario(String _Id,String _Codigo,String _Estado,String _Seg_Rol_Id, String _Int_Usuario_Id, String _Seg_Rol_Codigo, String _Seg_Rol_Nombre, String _Int_usuario_codigo, String _Int_usuario_nombre, String _Estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Estado=_Estado;
this._Seg_Rol_Id=_Seg_Rol_Id;
this._Int_Usuario_Id=_Int_Usuario_Id;
this._Seg_Rol_Codigo=_Seg_Rol_Codigo;
this._Seg_Rol_Nombre=_Seg_Rol_Nombre;
this._Int_usuario_codigo=_Int_usuario_codigo;
this._Int_usuario_nombre=_Int_usuario_nombre;
this._Estado_nombre=_Estado_nombre;
}
}
}
