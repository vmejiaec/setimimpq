
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Mensajeria: Entidad
{
// Atributos
private DateTime _Fecha;
private String _Int_Usuario_Id;
private String _Dic_Con_Objeto_Id;
private String _Id_Origen;
private String _Descripcion;
private String _Int_Usuario_Codigo;
private String _Int_Usuario_Nombre;
private String _Dic_con_objeto_codigo;
private String _Dic_con_objeto_nombre;
private String _Dic_contenedor_Id;
private String _Dic_contenedor_codigo;
private String _Dic_contenedor_nombre;
private String _Dic_Objeto_Id;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _estado_nombre;

// Propiedades de la clase
public DateTime Fecha
{
get{return _Fecha;}
set{_Fecha=value;}
}
                  
public String Int_Usuario_Id
{
get{return _Int_Usuario_Id;}
set{_Int_Usuario_Id=value;}
}
                  
public String Dic_Con_Objeto_Id
{
get{return _Dic_Con_Objeto_Id;}
set{_Dic_Con_Objeto_Id=value;}
}
                  
public String Id_Origen
{
get{return _Id_Origen;}
set{_Id_Origen=value;}
}
                  
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
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
                  
public String Dic_con_objeto_codigo
{
get{return _Dic_con_objeto_codigo;}
set{_Dic_con_objeto_codigo=value;}
}
                  
public String Dic_con_objeto_nombre
{
get{return _Dic_con_objeto_nombre;}
set{_Dic_con_objeto_nombre=value;}
}
                  
public String Dic_contenedor_Id
{
get{return _Dic_contenedor_Id;}
set{_Dic_contenedor_Id=value;}
}
                  
public String Dic_contenedor_codigo
{
get{return _Dic_contenedor_codigo;}
set{_Dic_contenedor_codigo=value;}
}
                  
public String Dic_contenedor_nombre
{
get{return _Dic_contenedor_nombre;}
set{_Dic_contenedor_nombre=value;}
}
                  
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
                  
public String Dic_Objeto_Nombre
{
get{return _Dic_Objeto_Nombre;}
set{_Dic_Objeto_Nombre=value;}
}
                  
public String estado_nombre
{
get{return _estado_nombre;}
set{_estado_nombre=value;}
}
                  
// Constructor
public Par_Mensajeria()
{
}
 public Par_Mensajeria(String _Id,String _Codigo, String _Estado,DateTime _Fecha, String _Int_Usuario_Id, String _Dic_Con_Objeto_Id, String _Id_Origen, String _Descripcion, String _Int_Usuario_Codigo, String _Int_Usuario_Nombre, String _Dic_con_objeto_codigo, String _Dic_con_objeto_nombre, String _Dic_contenedor_Id, String _Dic_contenedor_codigo, String _Dic_contenedor_nombre, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _estado_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Fecha=_Fecha;
this._Int_Usuario_Id=_Int_Usuario_Id;
this._Dic_Con_Objeto_Id=_Dic_Con_Objeto_Id;
this._Id_Origen=_Id_Origen;
this._Descripcion=_Descripcion;
this._Int_Usuario_Codigo=_Int_Usuario_Codigo;
this._Int_Usuario_Nombre=_Int_Usuario_Nombre;
this._Dic_con_objeto_codigo=_Dic_con_objeto_codigo;
this._Dic_con_objeto_nombre=_Dic_con_objeto_nombre;
this._Dic_contenedor_Id=_Dic_contenedor_Id;
this._Dic_contenedor_codigo=_Dic_contenedor_codigo;
this._Dic_contenedor_nombre=_Dic_contenedor_nombre;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._estado_nombre=_estado_nombre;
}
}
}
