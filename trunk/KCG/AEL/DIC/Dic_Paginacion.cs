
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.DIC
{
public class Dic_Paginacion: Entidad
{
// Atributos
private String _Dic_Objeto_Id;
private String _Par_Servidor_Id;
private String _Id_Inicial;
private String _Id_Final;
private Int32 _Secuencia;
private String _Dic_Objeto_Codigo;
private String _Dic_Objeto_Nombre;
private String _Par_Servidor_Codigo;
private String _Par_Servidor_Nombre;
private String _Dic_Modulo_Id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;
private String _Estado_Nombre;

// Propiedades de la clase
public String Dic_Objeto_Id
{
get{return _Dic_Objeto_Id;}
set{_Dic_Objeto_Id=value;}
}
                  
public String Par_Servidor_Id
{
get{return _Par_Servidor_Id;}
set{_Par_Servidor_Id=value;}
}
                  
public String Id_Inicial
{
get{return _Id_Inicial;}
set{_Id_Inicial=value;}
}
                  
public String Id_Final
{
get{return _Id_Final;}
set{_Id_Final=value;}
}
                  
public Int32 Secuencia
{
get{return _Secuencia;}
set{_Secuencia=value;}
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
                  
public String Par_Servidor_Codigo
{
get{return _Par_Servidor_Codigo;}
set{_Par_Servidor_Codigo=value;}
}
                  
public String Par_Servidor_Nombre
{
get{return _Par_Servidor_Nombre;}
set{_Par_Servidor_Nombre=value;}
}
                  
public String Dic_Modulo_Id
{
get{return _Dic_Modulo_Id;}
set{_Dic_Modulo_Id=value;}
}
                  
public String Dic_Modulo_Codigo
{
get{return _Dic_Modulo_Codigo;}
set{_Dic_Modulo_Codigo=value;}
}
                  
public String Dic_Modulo_Nombre
{
get{return _Dic_Modulo_Nombre;}
set{_Dic_Modulo_Nombre=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
// Constructor
public Dic_Paginacion()
{
}
 public Dic_Paginacion(String _Id,String _Codigo, String _Estado,String _Dic_Objeto_Id, String _Par_Servidor_Id, String _Id_Inicial, String _Id_Final, Int32 _Secuencia, String _Dic_Objeto_Codigo, String _Dic_Objeto_Nombre, String _Par_Servidor_Codigo, String _Par_Servidor_Nombre, String _Dic_Modulo_Id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre, String _Estado_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Dic_Objeto_Id=_Dic_Objeto_Id;
this._Par_Servidor_Id=_Par_Servidor_Id;
this._Id_Inicial=_Id_Inicial;
this._Id_Final=_Id_Final;
this._Secuencia=_Secuencia;
this._Dic_Objeto_Codigo=_Dic_Objeto_Codigo;
this._Dic_Objeto_Nombre=_Dic_Objeto_Nombre;
this._Par_Servidor_Codigo=_Par_Servidor_Codigo;
this._Par_Servidor_Nombre=_Par_Servidor_Nombre;
this._Dic_Modulo_Id=_Dic_Modulo_Id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
}
}
}
