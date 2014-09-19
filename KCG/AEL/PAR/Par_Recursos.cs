
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Recursos: Entidad
{
// Atributos
private String _Origen;
private String _Tipo;
private String _Ver_etiqueta_nombre;
private String _Tool_Ver_etiqueta_nombre;
private Int32 _orden;
private String _dic_objeto_nombre;

// Propiedades de la clase
public String Origen
{
get{return _Origen;}
set{_Origen=value;}
}
                  
public String Tipo
{
get{return _Tipo;}
set{_Tipo=value;}
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
                  
public Int32 orden
{
get{return _orden;}
set{_orden=value;}
}
                  
public String dic_objeto_nombre
{
get{return _dic_objeto_nombre;}
set{_dic_objeto_nombre=value;}
}
                  
// Constructor
public Par_Recursos()
{
}
 public Par_Recursos(String _Origen,String _Tipo,String _Nombre,String _Ver_etiqueta_nombre,String _Tool_Ver_etiqueta_nombre,Int32 _orden,String _dic_objeto_nombre )
{
this._Origen=_Origen;
this._Tipo=_Tipo;
this.Nombre=_Nombre;     
this._Ver_etiqueta_nombre=_Ver_etiqueta_nombre;
this._Tool_Ver_etiqueta_nombre=_Tool_Ver_etiqueta_nombre;
this._orden=_orden;
this._dic_objeto_nombre=_dic_objeto_nombre;
}
}
}
