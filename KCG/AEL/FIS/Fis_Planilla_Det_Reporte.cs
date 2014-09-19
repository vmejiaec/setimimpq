
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
public class Fis_Planilla_Det_Reporte: Entidad
{
// Atributos
private String _Descripcion;
private String _Apu_Prespuesto_Rubro_Id;
private Decimal _Costo;
private Decimal _Cantidad;
private String _Fis_Planilla_Id;
private Decimal _Costo_x_Cantidad;
private Decimal _Cantidad_Anterior;
private Decimal _Cantidad_Actual;
private Decimal _Cantidad_Total;
private Decimal _Importe_Anterior;
private Decimal _Importe_Actual;
private Decimal _Importe_Total;
private Decimal _Incremento_Cantidad_1;
private Decimal _Incremento_Importe_1;
private Decimal _Incremento_Cantidad_2;
private Decimal _Incremento_Importe_2;
private String _Apu_Presupuesto_Rubro_Id;
private String _Apu_Presupuesto_Rubro_Codigo;
private String _Apu_Presupuesto_Rubro_Estado;
private String _Apu_Presupuesto_Rubro_Descripcion;
private String _Apu_Prespuesto_Id;
private String _Apu_Rubro_Id;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private Decimal _Apu_Rubro_Cantidad;
private Decimal _Apu_Rubro_Costo_Unitario;
private Decimal _Apu_Rubro_Costo_Total;
private String _Apu_Subtitulo_Id;
private String _Apu_Subtitulo_Nombre;
private String _Apu_Titulo_Id;
private String _Apu_Titulo_Nombre;

// Propiedades de la clase
public String Descripcion
{
get{return _Descripcion;}
set{_Descripcion=value;}
}
                  
public String Apu_Prespuesto_Rubro_Id
{
get{return _Apu_Prespuesto_Rubro_Id;}
set{_Apu_Prespuesto_Rubro_Id=value;}
}
                  
public Decimal Costo
{
get{return _Costo;}
set{_Costo=value;}
}
                  
public Decimal Cantidad
{
get{return _Cantidad;}
set{_Cantidad=value;}
}
                  
public String Fis_Planilla_Id
{
get{return _Fis_Planilla_Id;}
set{_Fis_Planilla_Id=value;}
}
                  
public Decimal Costo_x_Cantidad
{
get{return _Costo_x_Cantidad;}
set{_Costo_x_Cantidad=value;}
}
                  
public Decimal Cantidad_Anterior
{
get{return _Cantidad_Anterior;}
set{_Cantidad_Anterior=value;}
}
                  
public Decimal Cantidad_Actual
{
get{return _Cantidad_Actual;}
set{_Cantidad_Actual=value;}
}
                  
public Decimal Cantidad_Total
{
get{return _Cantidad_Total;}
set{_Cantidad_Total=value;}
}
                  
public Decimal Importe_Anterior
{
get{return _Importe_Anterior;}
set{_Importe_Anterior=value;}
}
                  
public Decimal Importe_Actual
{
get{return _Importe_Actual;}
set{_Importe_Actual=value;}
}
                  
public Decimal Importe_Total
{
get{return _Importe_Total;}
set{_Importe_Total=value;}
}
                  
public Decimal Incremento_Cantidad_1
{
get{return _Incremento_Cantidad_1;}
set{_Incremento_Cantidad_1=value;}
}
                  
public Decimal Incremento_Importe_1
{
get{return _Incremento_Importe_1;}
set{_Incremento_Importe_1=value;}
}
                  
public Decimal Incremento_Cantidad_2
{
get{return _Incremento_Cantidad_2;}
set{_Incremento_Cantidad_2=value;}
}
                  
public Decimal Incremento_Importe_2
{
get{return _Incremento_Importe_2;}
set{_Incremento_Importe_2=value;}
}
                  
public String Apu_Presupuesto_Rubro_Id
{
get{return _Apu_Presupuesto_Rubro_Id;}
set{_Apu_Presupuesto_Rubro_Id=value;}
}
                  
public String Apu_Presupuesto_Rubro_Codigo
{
get{return _Apu_Presupuesto_Rubro_Codigo;}
set{_Apu_Presupuesto_Rubro_Codigo=value;}
}
                  
public String Apu_Presupuesto_Rubro_Estado
{
get{return _Apu_Presupuesto_Rubro_Estado;}
set{_Apu_Presupuesto_Rubro_Estado=value;}
}
                  
public String Apu_Presupuesto_Rubro_Descripcion
{
get{return _Apu_Presupuesto_Rubro_Descripcion;}
set{_Apu_Presupuesto_Rubro_Descripcion=value;}
}
                  
public String Apu_Prespuesto_Id
{
get{return _Apu_Prespuesto_Id;}
set{_Apu_Prespuesto_Id=value;}
}
                  
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
}
                  
public String Apu_Rubro_Codigo
{
get{return _Apu_Rubro_Codigo;}
set{_Apu_Rubro_Codigo=value;}
}
                  
public String Apu_Rubro_Nombre
{
get{return _Apu_Rubro_Nombre;}
set{_Apu_Rubro_Nombre=value;}
}
                  
public String Apu_Rubro_Unidad
{
get{return _Apu_Rubro_Unidad;}
set{_Apu_Rubro_Unidad=value;}
}
                  
public Decimal Apu_Rubro_Cantidad
{
get{return _Apu_Rubro_Cantidad;}
set{_Apu_Rubro_Cantidad=value;}
}
                  
public Decimal Apu_Rubro_Costo_Unitario
{
get{return _Apu_Rubro_Costo_Unitario;}
set{_Apu_Rubro_Costo_Unitario=value;}
}
                  
public Decimal Apu_Rubro_Costo_Total
{
get{return _Apu_Rubro_Costo_Total;}
set{_Apu_Rubro_Costo_Total=value;}
}
                  
public String Apu_Subtitulo_Id
{
get{return _Apu_Subtitulo_Id;}
set{_Apu_Subtitulo_Id=value;}
}
                  
public String Apu_Subtitulo_Nombre
{
get{return _Apu_Subtitulo_Nombre;}
set{_Apu_Subtitulo_Nombre=value;}
}
                  
public String Apu_Titulo_Id
{
get{return _Apu_Titulo_Id;}
set{_Apu_Titulo_Id=value;}
}
                  
public String Apu_Titulo_Nombre
{
get{return _Apu_Titulo_Nombre;}
set{_Apu_Titulo_Nombre=value;}
}
                  
// Constructor
public Fis_Planilla_Det_Reporte()
{
}
 public Fis_Planilla_Det_Reporte(String _Id,String _Codigo,String _Estado,String _Descripcion, String _Apu_Prespuesto_Rubro_Id, Decimal _Costo, Decimal _Cantidad, String _Fis_Planilla_Id, Decimal _Costo_x_Cantidad, Decimal _Cantidad_Anterior, Decimal _Cantidad_Actual, Decimal _Cantidad_Total, Decimal _Importe_Anterior, Decimal _Importe_Actual, Decimal _Importe_Total, Decimal _Incremento_Cantidad_1, Decimal _Incremento_Importe_1, Decimal _Incremento_Cantidad_2, Decimal _Incremento_Importe_2, String _Apu_Presupuesto_Rubro_Id, String _Apu_Presupuesto_Rubro_Codigo, String _Apu_Presupuesto_Rubro_Estado, String _Apu_Presupuesto_Rubro_Descripcion, String _Apu_Prespuesto_Id, String _Apu_Rubro_Id, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, Decimal _Apu_Rubro_Cantidad, Decimal _Apu_Rubro_Costo_Unitario, Decimal _Apu_Rubro_Costo_Total, String _Apu_Subtitulo_Id, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_Id, String _Apu_Titulo_Nombre )
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Estado=_Estado;
this._Descripcion=_Descripcion;
this._Apu_Prespuesto_Rubro_Id=_Apu_Prespuesto_Rubro_Id;
this._Costo=_Costo;
this._Cantidad=_Cantidad;
this._Fis_Planilla_Id=_Fis_Planilla_Id;
this._Costo_x_Cantidad=_Costo_x_Cantidad;
this._Cantidad_Anterior=_Cantidad_Anterior;
this._Cantidad_Actual=_Cantidad_Actual;
this._Cantidad_Total=_Cantidad_Total;
this._Importe_Anterior=_Importe_Anterior;
this._Importe_Actual=_Importe_Actual;
this._Importe_Total=_Importe_Total;
this._Incremento_Cantidad_1=_Incremento_Cantidad_1;
this._Incremento_Importe_1=_Incremento_Importe_1;
this._Incremento_Cantidad_2=_Incremento_Cantidad_2;
this._Incremento_Importe_2=_Incremento_Importe_2;
this._Apu_Presupuesto_Rubro_Id=_Apu_Presupuesto_Rubro_Id;
this._Apu_Presupuesto_Rubro_Codigo=_Apu_Presupuesto_Rubro_Codigo;
this._Apu_Presupuesto_Rubro_Estado=_Apu_Presupuesto_Rubro_Estado;
this._Apu_Presupuesto_Rubro_Descripcion=_Apu_Presupuesto_Rubro_Descripcion;
this._Apu_Prespuesto_Id=_Apu_Prespuesto_Id;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Rubro_Cantidad=_Apu_Rubro_Cantidad;
this._Apu_Rubro_Costo_Unitario=_Apu_Rubro_Costo_Unitario;
this._Apu_Rubro_Costo_Total=_Apu_Rubro_Costo_Total;
this._Apu_Subtitulo_Id=_Apu_Subtitulo_Id;
this._Apu_Subtitulo_Nombre=_Apu_Subtitulo_Nombre;
this._Apu_Titulo_Id=_Apu_Titulo_Id;
this._Apu_Titulo_Nombre=_Apu_Titulo_Nombre;
}
public Fis_Planilla_Det_Reporte(Fis_Planilla_Det_Reporte o )
{
this.Id=o.Id;
this.Codigo=o.Codigo;
this.Estado=o.Estado;
this._Descripcion=o.Descripcion;
this._Apu_Prespuesto_Rubro_Id=o.Apu_Prespuesto_Rubro_Id;
this._Costo=o.Costo;
this._Cantidad=o.Cantidad;
this._Fis_Planilla_Id=o.Fis_Planilla_Id;
this._Costo_x_Cantidad=o.Costo_x_Cantidad;
this._Cantidad_Anterior=o.Cantidad_Anterior;
this._Cantidad_Actual=o.Cantidad_Actual;
this._Cantidad_Total=o.Cantidad_Total;
this._Importe_Anterior=o.Importe_Anterior;
this._Importe_Actual=o.Importe_Actual;
this._Importe_Total=o.Importe_Total;
this._Incremento_Cantidad_1=o.Incremento_Cantidad_1;
this._Incremento_Importe_1=o.Incremento_Importe_1;
this._Incremento_Cantidad_2=o.Incremento_Cantidad_2;
this._Incremento_Importe_2=o.Incremento_Importe_2;
this._Apu_Presupuesto_Rubro_Id=o.Apu_Presupuesto_Rubro_Id;
this._Apu_Presupuesto_Rubro_Codigo=o.Apu_Presupuesto_Rubro_Codigo;
this._Apu_Presupuesto_Rubro_Estado=o.Apu_Presupuesto_Rubro_Estado;
this._Apu_Presupuesto_Rubro_Descripcion=o.Apu_Presupuesto_Rubro_Descripcion;
this._Apu_Prespuesto_Id=o.Apu_Prespuesto_Id;
this._Apu_Rubro_Id=o.Apu_Rubro_Id;
this._Apu_Rubro_Codigo=o.Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=o.Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=o.Apu_Rubro_Unidad;
this._Apu_Rubro_Cantidad=o.Apu_Rubro_Cantidad;
this._Apu_Rubro_Costo_Unitario=o.Apu_Rubro_Costo_Unitario;
this._Apu_Rubro_Costo_Total=o.Apu_Rubro_Costo_Total;
this._Apu_Subtitulo_Id=o.Apu_Subtitulo_Id;
this._Apu_Subtitulo_Nombre=o.Apu_Subtitulo_Nombre;
this._Apu_Titulo_Id=o.Apu_Titulo_Id;
this._Apu_Titulo_Nombre=o.Apu_Titulo_Nombre;
}
}
}
