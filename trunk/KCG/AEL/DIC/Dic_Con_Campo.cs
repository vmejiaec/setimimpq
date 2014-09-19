
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Con_Campo: Entidad
{
// Atributos
private String _Dic_Con_Objeto_Id;
private String _Dic_Campo_Id;
private String _Dic_Rotulo_Id;
private String _Tool_Dic_Rotulo_Id;
private Int32 _Ancho;
private Int32 _Orden;
private String _Dic_con_Objeto_Codigo;
private String _Dic_con_Objeto_Nombre;
private String _Dic_Objeto_Id;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Dic_Contenedor_Id;
private String _Dic_Contenedor_Codigo;
private String _Dic_Contenedor_Nombre;
private String _Dic_Campo_Codigo;
private String _Dic_Campo_Nombre;
private String _Campo_Dic_Objeto_Id;
private String _Campo_Dic_Objeto_Codigo;
private String _Campo_Dic_Objeto_Nombre;
private String _Dic_Rotulo_Codigo;
private String _Dic_Rotulo_nombre;
private String _Tool_Dic_Rotulo_Codigo;
private String _Tool_Dic_Rotulo_nombre;
private String _Estado_Nombre;
private String _Ver_etiqueta_nombre;
private String _Tool_Ver_etiqueta_nombre;

// Propiedades de la clase
public String Dic_Con_Objeto_Id
{
get{return _Dic_Con_Objeto_Id;}
set{_Dic_Con_Objeto_Id=value;}
}
                  
public String Dic_Campo_Id
{
get{return _Dic_Campo_Id;}
set{_Dic_Campo_Id=value;}
}
                  
public String Dic_Rotulo_Id
{
get{return _Dic_Rotulo_Id;}
set{_Dic_Rotulo_Id=value;}
}
                  
public String Tool_Dic_Rotulo_Id
{
get{return _Tool_Dic_Rotulo_Id;}
set{_Tool_Dic_Rotulo_Id=value;}
}
                  
public Int32 Ancho
{
get{return _Ancho;}
set{_Ancho=value;}
}
                  
public Int32 Orden
{
get{return _Orden;}
set{_Orden=value;}
}
                  
public String Dic_con_Objeto_Codigo
{
get{return _Dic_con_Objeto_Codigo;}
set{_Dic_con_Objeto_Codigo=value;}
}
                  
public String Dic_con_Objeto_Nombre
{
get{return _Dic_con_Objeto_Nombre;}
set{_Dic_con_Objeto_Nombre=value;}
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
                  
public String Dic_Contenedor_Id
{
get{return _Dic_Contenedor_Id;}
set{_Dic_Contenedor_Id=value;}
}
                  
public String Dic_Contenedor_Codigo
{
get{return _Dic_Contenedor_Codigo;}
set{_Dic_Contenedor_Codigo=value;}
}
                  
public String Dic_Contenedor_Nombre
{
get{return _Dic_Contenedor_Nombre;}
set{_Dic_Contenedor_Nombre=value;}
}
                  
public String Dic_Campo_Codigo
{
get{return _Dic_Campo_Codigo;}
set{_Dic_Campo_Codigo=value;}
}
                  
public String Dic_Campo_Nombre
{
get{return _Dic_Campo_Nombre;}
set{_Dic_Campo_Nombre=value;}
}
                  
public String Campo_Dic_Objeto_Id
{
get{return _Campo_Dic_Objeto_Id;}
set{_Campo_Dic_Objeto_Id=value;}
}
                  
public String Campo_Dic_Objeto_Codigo
{
get{return _Campo_Dic_Objeto_Codigo;}
set{_Campo_Dic_Objeto_Codigo=value;}
}
                  
public String Campo_Dic_Objeto_Nombre
{
get{return _Campo_Dic_Objeto_Nombre;}
set{_Campo_Dic_Objeto_Nombre=value;}
}
                  
public String Dic_Rotulo_Codigo
{
get{return _Dic_Rotulo_Codigo;}
set{_Dic_Rotulo_Codigo=value;}
}
                  
public String Dic_Rotulo_nombre
{
get{return _Dic_Rotulo_nombre;}
set{_Dic_Rotulo_nombre=value;}
}
                  
public String Tool_Dic_Rotulo_Codigo
{
get{return _Tool_Dic_Rotulo_Codigo;}
set{_Tool_Dic_Rotulo_Codigo=value;}
}
                  
public String Tool_Dic_Rotulo_nombre
{
get{return _Tool_Dic_Rotulo_nombre;}
set{_Tool_Dic_Rotulo_nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String Ver_etiqueta_nombre
{
get{return _Ver_etiqueta_nombre;}
set{_Ver_etiqueta_nombre=value;}
}
                  
public String Tool_Ver_etiqueta_nombre
{
get{return _Tool_Ver_etiqueta_nombre;}
set{_Tool_Ver_etiqueta_nombre=value;}
}
                  
// Constructor
public Dic_Con_Campo()
{
}
 public Dic_Con_Campo(String _Id,String _Codigo, String _Estado,String _Dic_Con_Objeto_Id, String _Dic_Campo_Id, String _Dic_Rotulo_Id, String _Tool_Dic_Rotulo_Id, Int32 _Ancho, Int32 _Orden, String _Dic_con_Objeto_Codigo, String _Dic_con_Objeto_Nombre, String _Dic_Objeto_Id, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Dic_Contenedor_Id, String _Dic_Contenedor_Codigo, String _Dic_Contenedor_Nombre, String _Dic_Campo_Codigo, String _Dic_Campo_Nombre, String _Campo_Dic_Objeto_Id, String _Campo_Dic_Objeto_Codigo, String _Campo_Dic_Objeto_Nombre, String _Dic_Rotulo_Codigo, String _Dic_Rotulo_nombre, String _Tool_Dic_Rotulo_Codigo, String _Tool_Dic_Rotulo_nombre, String _Estado_Nombre, String _Ver_etiqueta_nombre, String _Tool_Ver_etiqueta_nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Dic_Con_Objeto_Id=_Dic_Con_Objeto_Id;
this._Dic_Campo_Id=_Dic_Campo_Id;
this._Dic_Rotulo_Id=_Dic_Rotulo_Id;
this._Tool_Dic_Rotulo_Id=_Tool_Dic_Rotulo_Id;
this._Ancho=_Ancho;
this._Orden=_Orden;
this._Dic_con_Objeto_Codigo=_Dic_con_Objeto_Codigo;
this._Dic_con_Objeto_Nombre=_Dic_con_Objeto_Nombre;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Dic_Contenedor_Id=_Dic_Contenedor_Id;
this._Dic_Contenedor_Codigo=_Dic_Contenedor_Codigo;
this._Dic_Contenedor_Nombre=_Dic_Contenedor_Nombre;
this._Dic_Campo_Codigo=_Dic_Campo_Codigo;
this._Dic_Campo_Nombre=_Dic_Campo_Nombre;
this._Campo_Dic_Objeto_Id=_Campo_Dic_Objeto_Id;
this._Campo_Dic_Objeto_Codigo=_Campo_Dic_Objeto_Codigo;
this._Campo_Dic_Objeto_Nombre=_Campo_Dic_Objeto_Nombre;
this._Dic_Rotulo_Codigo=_Dic_Rotulo_Codigo;
this._Dic_Rotulo_nombre=_Dic_Rotulo_nombre;
this._Tool_Dic_Rotulo_Codigo=_Tool_Dic_Rotulo_Codigo;
this._Tool_Dic_Rotulo_nombre=_Tool_Dic_Rotulo_nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Ver_etiqueta_nombre=_Ver_etiqueta_nombre;
this._Tool_Ver_etiqueta_nombre=_Tool_Ver_etiqueta_nombre;
}
}
}
