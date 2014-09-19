
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
public class Apu_Proyecto_Cuadrilla_Diferencia : Entidad
{
    // Atributos
    private String _Apu_Proyecto_Id;
    private String _Apu_Proyecto_Codigo;
    private String _Apu_Proyecto_Nombre;
    private String _Apu_Proyecto_Etapa;
    private String _Apu_Cuadrilla_Codigo;
    private String _Apu_Cuadrilla_Nombre;
    private Decimal _Costo_Total;
    private Decimal _Costo_Hora;
    private Decimal _Numero_trabajadores;
    private Decimal _Coeficiente;

    // Propiedades de la clase
    public String Apu_Proyecto_Id
    {
        get { return _Apu_Proyecto_Id; }
        set { _Apu_Proyecto_Id = value; }
    }

    public String Apu_Proyecto_Codigo
    {
        get { return _Apu_Proyecto_Codigo; }
        set { _Apu_Proyecto_Codigo = value; }
    }

    public String Apu_Proyecto_Nombre
    {
        get { return _Apu_Proyecto_Nombre; }
        set { _Apu_Proyecto_Nombre = value; }
    }

    public String Apu_Proyecto_Etapa
    {
        get { return _Apu_Proyecto_Etapa; }
        set { _Apu_Proyecto_Etapa = value; }
    }

    public String Apu_Cuadrilla_Codigo
    {
        get { return _Apu_Cuadrilla_Codigo; }
        set { _Apu_Cuadrilla_Codigo = value; }
    }

    public Decimal Costo_Total
    {
        get { return _Costo_Total; }
        set { _Costo_Total = value; }
    }

    public String Apu_Cuadrilla_Nombre
    {
        get { return _Apu_Cuadrilla_Nombre; }
        set { _Apu_Cuadrilla_Nombre = value; }
    }

    public Decimal Costo_Hora
    {
        get { return _Costo_Hora; }
        set { _Costo_Hora = value; }
    }

    public Decimal Numero_trabajadores
    {
        get { return _Numero_trabajadores; }
        set { _Numero_trabajadores = value; }
    }

    public Decimal Coeficiente
    {
        get { return _Coeficiente; }
        set { _Coeficiente = value; }
    }

    // Constructor
    public Apu_Proyecto_Cuadrilla_Diferencia()
    {
    }


    public Apu_Proyecto_Cuadrilla_Diferencia(String _Apu_Proyecto_Id, String _Apu_Proyecto_Codigo, String _Apu_Proyecto_Nombre, String _Apu_Proyecto_Etapa, String _Apu_Cuadrilla_Codigo, String _Apu_Cuadrilla_Nombre, Decimal _Costo_Total, Decimal _Costo_Hora, Decimal _Numero_trabajadores, Decimal _Coeficiente)
    {
 
        this._Apu_Proyecto_Id = _Apu_Proyecto_Id;
        this._Apu_Proyecto_Codigo = _Apu_Proyecto_Codigo;
        this._Apu_Proyecto_Nombre = _Apu_Proyecto_Nombre;
        this._Apu_Proyecto_Etapa = _Apu_Proyecto_Etapa;
        this._Apu_Cuadrilla_Codigo = _Apu_Cuadrilla_Codigo;
        this._Apu_Cuadrilla_Nombre = _Apu_Cuadrilla_Nombre;
        this._Costo_Total = _Costo_Total;
        this._Costo_Hora = _Costo_Hora;
        this._Numero_trabajadores = _Numero_trabajadores;
        this._Coeficiente = _Coeficiente;
    }
}
}
