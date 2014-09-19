
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Rubro: Entidad
{
// Atributos
private String _Apu_Proyecto_Id;
private String _Apu_Rubro_Id;
private Decimal _Cantidad;
private Decimal _Rendimiento_Mano_Obra;
private Decimal _Rendimiento_Equipo;
private String _Apu_Subtitulo_id;
private String _Apu_Proyecto_Codigo;
private String _Apu_Proyecto_Nombre;
private Decimal _Apu_Proyecto_Costo_Total;
private String _Apu_Subtitulo_Codigo;
private String _Apu_Subtitulo_Nombre;
private String _Apu_Rubro_Codigo;
private String _Apu_Rubro_Nombre;
private String _Apu_Rubro_Unidad;
private String _Apu_Titulo_id;
private String _Apu_Titulo_Codigo;
private String _Apu_Titulo_Nombre;
private String _Estado_Nombre;
private Decimal _Rendimiento_Mano_Obra_Hora;
private Decimal _Rendimiento_Equipo_Hora;
private Decimal _Material_costo_total;
private Decimal _Transporte_costo_total;
private Decimal _Mano_obra_costo_total;
private Decimal _Equipo_costo_total;
private Decimal _Costo_Unitario;
private Decimal _Costo_Total;
private String _Apu_Proyecto_Etapa;
private Decimal _Apu_rubro_Costo_Total;
private DateTime _Material_ultima_fecha_update;
private DateTime _Transporte_ultima_fecha_update;
private DateTime _Mano_obra_ultima_fecha_update;
private DateTime _Equipo_ultima_fecha_update;
private String _Int_moneda_simbolo;
private String _Int_Sucursal_Id;
private Decimal _Costo_Indirecto;
private Decimal _Costo_Directo_Indirecto;
private int _Apu_Rubro_Codigo_Int;

// Propiedades de la clase
public String Apu_Proyecto_Id
{
get{return _Apu_Proyecto_Id;}
set{_Apu_Proyecto_Id=value;}
}
                  
public String Apu_Rubro_Id
{
get{return _Apu_Rubro_Id;}
set{_Apu_Rubro_Id=value;}
}
                  
public Decimal Cantidad
{
get{return _Cantidad;}
set{_Cantidad=value;}
}
                  
public Decimal Rendimiento_Mano_Obra
{
get{return _Rendimiento_Mano_Obra;}
set{_Rendimiento_Mano_Obra=value;}
}
                  
public Decimal Rendimiento_Equipo
{
get{return _Rendimiento_Equipo;}
set{_Rendimiento_Equipo=value;}
}
                  
public String Apu_Subtitulo_id
{
get{return _Apu_Subtitulo_id;}
set{_Apu_Subtitulo_id=value;}
}
                  
public String Apu_Proyecto_Codigo
{
get{return _Apu_Proyecto_Codigo;}
set{_Apu_Proyecto_Codigo=value;}
}
                  
public String Apu_Proyecto_Nombre
{
get{return _Apu_Proyecto_Nombre;}
set{_Apu_Proyecto_Nombre=value;}
}
                  
public Decimal Apu_Proyecto_Costo_Total
{
get{return _Apu_Proyecto_Costo_Total;}
set{_Apu_Proyecto_Costo_Total=value;}
}
                  
public String Apu_Subtitulo_Codigo
{
get{return _Apu_Subtitulo_Codigo;}
set{_Apu_Subtitulo_Codigo=value;}
}
                  
public String Apu_Subtitulo_Nombre
{
get{return _Apu_Subtitulo_Nombre;}
set{_Apu_Subtitulo_Nombre=value;}
}
                  
public String Apu_Rubro_Codigo
{
get{return _Apu_Rubro_Codigo;}
set{_Apu_Rubro_Codigo=value;}
}

public int Apu_Rubro_Codigo_Int
{
    get
    {
        int resultado = 0;
        try
        {
            resultado = Convert.ToInt32(Apu_Rubro_Codigo);
        }
        catch { }
        return resultado;
    }
    set { _Apu_Rubro_Codigo_Int = value; }
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
                  
public String Apu_Titulo_id
{
get{return _Apu_Titulo_id;}
set{_Apu_Titulo_id=value;}
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
                  
public Decimal Rendimiento_Mano_Obra_Hora
{
get{return _Rendimiento_Mano_Obra_Hora;}
set{_Rendimiento_Mano_Obra_Hora=value;}
}
                  
public Decimal Rendimiento_Equipo_Hora
{
get{return _Rendimiento_Equipo_Hora;}
set{_Rendimiento_Equipo_Hora=value;}
}
                  
public Decimal Material_costo_total
{
get{return _Material_costo_total;}
set{_Material_costo_total=value;}
}
                  
public Decimal Transporte_costo_total
{
get{return _Transporte_costo_total;}
set{_Transporte_costo_total=value;}
}
                  
public Decimal Mano_obra_costo_total
{
get{return _Mano_obra_costo_total;}
set{_Mano_obra_costo_total=value;}
}
                  
public Decimal Equipo_costo_total
{
get{return _Equipo_costo_total;}
set{_Equipo_costo_total=value;}
}
                  
public Decimal Costo_Unitario
{
get{return _Costo_Unitario;}
set{_Costo_Unitario=value;}
}
                  
public Decimal Costo_Total
{
get{return _Costo_Total;}
set{_Costo_Total=value;}
}
                  
public String Apu_Proyecto_Etapa
{
get{return _Apu_Proyecto_Etapa;}
set{_Apu_Proyecto_Etapa=value;}
}
                  
public Decimal Apu_rubro_Costo_Total
{
get{return _Apu_rubro_Costo_Total;}
set{_Apu_rubro_Costo_Total=value;}
}
                  
public DateTime Material_ultima_fecha_update
{
get{return _Material_ultima_fecha_update;}
set{_Material_ultima_fecha_update=value;}
}
                  
public DateTime Transporte_ultima_fecha_update
{
get{return _Transporte_ultima_fecha_update;}
set{_Transporte_ultima_fecha_update=value;}
}
                  
public DateTime Mano_obra_ultima_fecha_update
{
get{return _Mano_obra_ultima_fecha_update;}
set{_Mano_obra_ultima_fecha_update=value;}
}
                  
public DateTime Equipo_ultima_fecha_update
{
get{return _Equipo_ultima_fecha_update;}
set{_Equipo_ultima_fecha_update=value;}
}
                  
public String Int_moneda_simbolo
{
get{return _Int_moneda_simbolo;}
set{_Int_moneda_simbolo=value;}
}
                  
public String Int_Sucursal_Id
{
get{return _Int_Sucursal_Id;}
set{_Int_Sucursal_Id=value;}
}
                  
public Decimal Costo_Indirecto
{
get{return _Costo_Indirecto;}
set{_Costo_Indirecto=value;}
}
                  
public Decimal Costo_Directo_Indirecto
{
get{return _Costo_Directo_Indirecto;}
set{_Costo_Directo_Indirecto=value;}
}
                  
// Constructor
public Apu_Proyecto_Rubro()
{
}
 public Apu_Proyecto_Rubro(String _Id,String _Codigo,String _Estado,String _Apu_Proyecto_Id, String _Apu_Rubro_Id, Decimal _Cantidad, Decimal _Rendimiento_Mano_Obra, Decimal _Rendimiento_Equipo, String _Apu_Subtitulo_id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, Decimal _Apu_Proyecto_Costo_Total, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Rubro_Codigo, String _Apu_Rubro_Nombre, String _Apu_Rubro_Unidad, String _Apu_Titulo_id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, String _Estado_Nombre, Decimal _Rendimiento_Mano_Obra_Hora, Decimal _Rendimiento_Equipo_Hora, Decimal _Material_costo_total, Decimal _Transporte_costo_total, Decimal _Mano_obra_costo_total, Decimal _Equipo_costo_total, Decimal _Costo_Unitario, Decimal _Costo_Total, String _Apu_Proyecto_Etapa, Decimal _Apu_rubro_Costo_Total, DateTime _Material_ultima_fecha_update, DateTime _Transporte_ultima_fecha_update, DateTime _Mano_obra_ultima_fecha_update, DateTime _Equipo_ultima_fecha_update, String _Int_moneda_simbolo, String _Int_Sucursal_Id, Decimal _Costo_Indirecto, Decimal _Costo_Directo_Indirecto )
{
this.Id=_Id;
this.Codigo=_Codigo;
this.Estado=_Estado;
this._Apu_Proyecto_Id=_Apu_Proyecto_Id;
this._Apu_Rubro_Id=_Apu_Rubro_Id;
this._Cantidad=_Cantidad;
this._Rendimiento_Mano_Obra=_Rendimiento_Mano_Obra;
this._Rendimiento_Equipo=_Rendimiento_Equipo;
this._Apu_Subtitulo_id=_Apu_Subtitulo_id;
this._Apu_Proyecto_Codigo=_Apu_Proyecto_Codigo;
this._Apu_Proyecto_Nombre=_Apu_Proyecto_Nombre;
this._Apu_Proyecto_Costo_Total=_Apu_Proyecto_Costo_Total;
this._Apu_Subtitulo_Codigo=_Apu_Subtitulo_Codigo;
this._Apu_Subtitulo_Nombre=_Apu_Subtitulo_Nombre;
this._Apu_Rubro_Codigo=_Apu_Rubro_Codigo;
this._Apu_Rubro_Nombre=_Apu_Rubro_Nombre;
this._Apu_Rubro_Unidad=_Apu_Rubro_Unidad;
this._Apu_Titulo_id=_Apu_Titulo_id;
this._Apu_Titulo_Codigo=_Apu_Titulo_Codigo;
this._Apu_Titulo_Nombre=_Apu_Titulo_Nombre;
this._Estado_Nombre=_Estado_Nombre;
this._Rendimiento_Mano_Obra_Hora=_Rendimiento_Mano_Obra_Hora;
this._Rendimiento_Equipo_Hora=_Rendimiento_Equipo_Hora;
this._Material_costo_total=_Material_costo_total;
this._Transporte_costo_total=_Transporte_costo_total;
this._Mano_obra_costo_total=_Mano_obra_costo_total;
this._Equipo_costo_total=_Equipo_costo_total;
this._Costo_Unitario=_Costo_Unitario;
this._Costo_Total=_Costo_Total;
this._Apu_Proyecto_Etapa=_Apu_Proyecto_Etapa;
this._Apu_rubro_Costo_Total=_Apu_rubro_Costo_Total;
this._Material_ultima_fecha_update=_Material_ultima_fecha_update;
this._Transporte_ultima_fecha_update=_Transporte_ultima_fecha_update;
this._Mano_obra_ultima_fecha_update=_Mano_obra_ultima_fecha_update;
this._Equipo_ultima_fecha_update=_Equipo_ultima_fecha_update;
this._Int_moneda_simbolo=_Int_moneda_simbolo;
this._Int_Sucursal_Id=_Int_Sucursal_Id;
this._Costo_Indirecto=_Costo_Indirecto;
this._Costo_Directo_Indirecto=_Costo_Directo_Indirecto;
}
}
}

