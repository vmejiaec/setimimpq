
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.PAR
{
public class Par_Servidor_Det: Entidad
{
// Atributos
private String _Par_Servidor_Id;
private String _Dic_Contenedor_Id;
private String _Referencia;
private String _Estado_Nombre;
private String _par_servidor_codigo;
private String _par_servidor_nombre;
private String _dic_contenedor_codigo;
private String _dic_contenedor_nombre;
private String _Dic_Modulo_id;
private String _Dic_Modulo_Codigo;
private String _Dic_Modulo_Nombre;

// Propiedades de la clase
public String Par_Servidor_Id
{
get{return _Par_Servidor_Id;}
set{_Par_Servidor_Id=value;}
}
                  
public String Dic_Contenedor_Id
{
get{return _Dic_Contenedor_Id;}
set{_Dic_Contenedor_Id=value;}
}
                  
public String Referencia
{
get{return _Referencia;}
set{_Referencia=value;}
}
                  
public String Estado_Nombre
{
get{return _Estado_Nombre;}
set{_Estado_Nombre=value;}
}
                  
public String par_servidor_codigo
{
get{return _par_servidor_codigo;}
set{_par_servidor_codigo=value;}
}
                  
public String par_servidor_nombre
{
get{return _par_servidor_nombre;}
set{_par_servidor_nombre=value;}
}
                  
public String dic_contenedor_codigo
{
get{return _dic_contenedor_codigo;}
set{_dic_contenedor_codigo=value;}
}
                  
public String dic_contenedor_nombre
{
get{return _dic_contenedor_nombre;}
set{_dic_contenedor_nombre=value;}
}
                  
public String Dic_Modulo_id
{
get{return _Dic_Modulo_id;}
set{_Dic_Modulo_id=value;}
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
                  
// Constructor
public Par_Servidor_Det()
{
}
 public Par_Servidor_Det(String _Id,String _Codigo, String _Estado,String _Par_Servidor_Id, String _Dic_Contenedor_Id, String _Referencia, String _Estado_Nombre, String _par_servidor_codigo, String _par_servidor_nombre, String _dic_contenedor_codigo, String _dic_contenedor_nombre, String _Dic_Modulo_id, String _Dic_Modulo_Codigo, String _Dic_Modulo_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo; 
this.Estado=_Estado;
this._Par_Servidor_Id=_Par_Servidor_Id;
this._Dic_Contenedor_Id=_Dic_Contenedor_Id;
this._Referencia=_Referencia;
this._Estado_Nombre=_Estado_Nombre;
this._par_servidor_codigo=_par_servidor_codigo;
this._par_servidor_nombre=_par_servidor_nombre;
this._dic_contenedor_codigo=_dic_contenedor_codigo;
this._dic_contenedor_nombre=_dic_contenedor_nombre;
this._Dic_Modulo_id=_Dic_Modulo_id;
this._Dic_Modulo_Codigo=_Dic_Modulo_Codigo;
this._Dic_Modulo_Nombre=_Dic_Modulo_Nombre;
}
}
}
