
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.HIS
{
public class His_Historico: Entidad
{
// Atributos
private String _Dic_Objeto_Id;
private String _Dic_Objeto_Codigo;
private DateTime _Fecha_Creacion;
private String _Dic_Objeto_Nombe;
private String _Per_Personal_Id;
private String _Per_Personal_Codigo;
private String _Per_Personal_Nombre;
private String _Int_Usuario_Id;
private String _Int_Usuario_Codigo;
private String _Int_Usuario_Nombre;
private String _Int_Empresa_Id;
private String _Int_Empresa_Codigo;
private String _Int_Empresa_Nombre;
private String _Int_Sucursal_Id;
private String _Int_Sucursal_Codigo;
private String _Int_Sucursal_Nombre;
private String _Descripcion;

// Propiedades de la clase
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
}
                  
public String Dic_Objeto_Codigo
{
get{return _Dic_Objeto_Codigo;}
set{_Dic_Objeto_Codigo=value;}
}
                  
public DateTime Fecha_Creacion
{
get{return _Fecha_Creacion;}
set{_Fecha_Creacion=value;}
}
                  
public String Dic_Objeto_Nombe
{
get{return _Dic_Objeto_Nombe;}
set{_Dic_Objeto_Nombe=value;}
}
                  
public String Per_Personal_Id
{
get{return _Per_Personal_Id;}
set{_Per_Personal_Id=value;}
}
                  
public String Per_Personal_Codigo
{
get{return _Per_Personal_Codigo;}
set{_Per_Personal_Codigo=value;}
}
                  
public String Per_Personal_Nombre
{
get{return _Per_Personal_Nombre;}
set{_Per_Personal_Nombre=value;}
}
                  
public String Int_Usuario_Id
{
get{return _Int_Usuario_Id;}
set{_Int_Usuario_Id=value;}
}
                  
public String Int_Usuario_Codigo
{
get{return _Int_Usuario_Codigo;}
set{_Int_Usuario_Codigo=value;}
}
                  
public String Int_Usuario_Nombre
{
get{return _Int_Usuario_Nombre;}
set{_Int_Usuario_Nombre=value;}
}
                  
public String Int_Empresa_Id
{
get{return _Int_Empresa_Id;}
set{_Int_Empresa_Id=value;}
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
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public String Int_Sucursal_Codigo
{
get{return _Int_Sucursal_Codigo;}
set{_Int_Sucursal_Codigo=value;}
}
                  
public String Int_Sucursal_Nombre
{
get{return _Int_Sucursal_Nombre;}
set{_Int_Sucursal_Nombre=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
// Constructor
public His_Historico()
{
}
    public His_Historico(String _Id, String _Codigo, String _Estado, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, DateTime _Fecha_Creacion, String _Dic_Objeto_Nombe, String _Per_Personal_Id, String _Per_Personal_Codigo, String _Per_Personal_Nombre, String _Int_Usuario_Id, String _Int_Usuario_Codigo, String _Int_Usuario_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Int_Sucursal_Id, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Descripcion)
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Estado=_Estado;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Fecha_Creacion=_Fecha_Creacion;
this._Dic_Objeto_Nombe=_Dic_Objeto_Nombe;
this._Per_Personal_Id=_Per_Personal_Id;
this._Per_Personal_Codigo=_Per_Personal_Codigo;
this._Per_Personal_Nombre=_Per_Personal_Nombre;
this._Int_Usuario_Id=_Int_Usuario_Id;
this._Int_Usuario_Codigo=_Int_Usuario_Codigo;
this._Int_Usuario_Nombre=_Int_Usuario_Nombre;
this._Int_Empresa_Id=_Int_Empresa_Id;
this._Int_Empresa_Codigo=_Int_Empresa_Codigo;
this._Int_Empresa_Nombre=_Int_Empresa_Nombre;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Int_Sucursal_Codigo=_Int_Sucursal_Codigo;
this._Int_Sucursal_Nombre=_Int_Sucursal_Nombre;
this._Descripcion=_Descripcion;
}
}
}
