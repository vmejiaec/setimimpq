
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Presupuesto : Entidad
    {
        // Atributos
        private String _Apu_Origen_Id;
        private String _Apu_Origen_Codigo;
        private String _Apu_Origen_Nombre;
        private String _Origen;
        private Decimal _Costo_Directo;
        private Decimal _Costo_Total;
        private Decimal _Costo_Indirecto;
        private Decimal _Costo_Otros;
        private String _Equipo_Apu_Indice_Id;
        private String _ManoObra_Apu_Indice_Id;
        private Decimal _Porcentaje_Costo_Indirecto;
        private String _Int_Sucursal_Id;
        private String _Apu_Mano_Obra_Id;
        private String _Fiscalizador_Per_Personal_Id;
        private String _Contratista_Per_Personal_Id;
        private DateTime _Fecha_Indices_Def;
        private DateTime _Fecha_Creacion;
        private String _Creacion_Per_Personal_Id;
        private DateTime _Fecha_Update;
        private String _Update_Per_Personal_Id;
        private String _Tipo;
        private Decimal _Indice_Sumatoria;
        private Decimal _Coeficiente_Sumatoria;
        private Decimal _Cuadrilla_Sumatoria;
        private Decimal _Cuadrilla_Coeficiente_Sumatoria;
        private Decimal _Suma_Porcentaje_Indice_Transporte;
        private String _Origen_Nombre;
        private String _Estado_Nombre;
        private String _Cadena_Indice;
        private String _Cadena_Cuadrilla;
        private String _Tipo_Nombre;
        private String _Codigo_Institucional;

        // Propiedades de la clase
        public String Apu_Origen_Id
        {
            get { return _Apu_Origen_Id; }
            set { _Apu_Origen_Id = value; }
        }

        public String Apu_Origen_Codigo
        {
            get { return _Apu_Origen_Codigo; }
            set { _Apu_Origen_Codigo = value; }
        }

        public String Apu_Origen_Nombre
        {
            get { return _Apu_Origen_Nombre; }
            set { _Apu_Origen_Nombre = value; }
        }

        public String Origen
        {
            get { return _Origen; }
            set { _Origen = value; }
        }

        public Decimal Costo_Directo
        {
            get { return _Costo_Directo; }
            set { _Costo_Directo = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public Decimal Costo_Indirecto
        {
            get { return _Costo_Indirecto; }
            set { _Costo_Indirecto = value; }
        }

        public Decimal Costo_Otros
        {
            get { return _Costo_Otros; }
            set { _Costo_Otros = value; }
        }

        public String Equipo_Apu_Indice_Id
        {
            get { return _Equipo_Apu_Indice_Id; }
            set { _Equipo_Apu_Indice_Id = value; }
        }

        public String ManoObra_Apu_Indice_Id
        {
            get { return _ManoObra_Apu_Indice_Id; }
            set { _ManoObra_Apu_Indice_Id = value; }
        }

        public Decimal Porcentaje_Costo_Indirecto
        {
            get { return _Porcentaje_Costo_Indirecto; }
            set { _Porcentaje_Costo_Indirecto = value; }
        }

        public String Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
        }

        public String Apu_Mano_Obra_Id
        {
            get { return _Apu_Mano_Obra_Id; }
            set { _Apu_Mano_Obra_Id = value; }
        }

        public String Fiscalizador_Per_Personal_Id
        {
            get { return _Fiscalizador_Per_Personal_Id; }
            set { _Fiscalizador_Per_Personal_Id = value; }
        }

        public String Contratista_Per_Personal_Id
        {
            get { return _Contratista_Per_Personal_Id; }
            set { _Contratista_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Indices_Def
        {
            get { return _Fecha_Indices_Def; }
            set { _Fecha_Indices_Def = value; }
        }

        public DateTime Fecha_Creacion
        {
            get { return _Fecha_Creacion; }
            set { _Fecha_Creacion = value; }
        }

        public String Creacion_Per_Personal_Id
        {
            get { return _Creacion_Per_Personal_Id; }
            set { _Creacion_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Update
        {
            get { return _Fecha_Update; }
            set { _Fecha_Update = value; }
        }

        public String Update_Per_Personal_Id
        {
            get { return _Update_Per_Personal_Id; }
            set { _Update_Per_Personal_Id = value; }
        }

        public String Tipo
        {
            get { return _Tipo; }
            set { _Tipo = value; }
        }

        public Decimal Indice_Sumatoria
        {
            get { return _Indice_Sumatoria; }
            set { _Indice_Sumatoria = value; }
        }

        public Decimal Coeficiente_Sumatoria
        {
            get { return _Coeficiente_Sumatoria; }
            set { _Coeficiente_Sumatoria = value; }
        }

        public Decimal Cuadrilla_Sumatoria
        {
            get { return _Cuadrilla_Sumatoria; }
            set { _Cuadrilla_Sumatoria = value; }
        }

        public Decimal Cuadrilla_Coeficiente_Sumatoria
        {
            get { return _Cuadrilla_Coeficiente_Sumatoria; }
            set { _Cuadrilla_Coeficiente_Sumatoria = value; }
        }

        public Decimal Suma_Porcentaje_Indice_Transporte
        {
            get { return _Suma_Porcentaje_Indice_Transporte; }
            set { _Suma_Porcentaje_Indice_Transporte = value; }
        }

        public String Origen_Nombre
        {
            get { return _Origen_Nombre; }
            set { _Origen_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        public String Cadena_Indice
        {
            get { return _Cadena_Indice; }
            set { _Cadena_Indice = value; }
        }

        public String Cadena_Cuadrilla
        {
            get { return _Cadena_Cuadrilla; }
            set { _Cadena_Cuadrilla = value; }
        }

        public String Tipo_Nombre
        {
            get { return _Tipo_Nombre; }
            set { _Tipo_Nombre = value; }
        }

        public String Codigo_Institucional
        {
            get { return _Codigo_Institucional; }
            set { _Codigo_Institucional = value; }
        }

        // Constructor
        public Apu_Presupuesto()
        {
        }
        public Apu_Presupuesto(String _Id, String _Codigo,  String _Estado, String _Apu_Origen_Id, String _Apu_Origen_Codigo, String _Apu_Origen_Nombre, String _Origen, Decimal _Costo_Directo, Decimal _Costo_Total, Decimal _Costo_Indirecto, Decimal _Costo_Otros, String _Equipo_Apu_Indice_Id, String _ManoObra_Apu_Indice_Id, Decimal _Porcentaje_Costo_Indirecto, String _Int_Sucursal_Id, String _Apu_Mano_Obra_Id, String _Fiscalizador_Per_Personal_Id, String _Contratista_Per_Personal_Id, DateTime _Fecha_Indices_Def, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Tipo, Decimal _Indice_Sumatoria, Decimal _Coeficiente_Sumatoria, Decimal _Cuadrilla_Sumatoria, Decimal _Cuadrilla_Coeficiente_Sumatoria, Decimal _Suma_Porcentaje_Indice_Transporte, String _Origen_Nombre, String _Estado_Nombre, String _Cadena_Indice, String _Cadena_Cuadrilla, String _Tipo_Nombre, String _Codigo_Institucional)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Apu_Origen_Id = _Apu_Origen_Id;
            this._Apu_Origen_Codigo = _Apu_Origen_Codigo;
            this._Apu_Origen_Nombre = _Apu_Origen_Nombre;
            this._Origen = _Origen;
            this._Costo_Directo = _Costo_Directo;
            this._Costo_Total = _Costo_Total;
            this._Costo_Indirecto = _Costo_Indirecto;
            this._Costo_Otros = _Costo_Otros;
            this._Equipo_Apu_Indice_Id = _Equipo_Apu_Indice_Id;
            this._ManoObra_Apu_Indice_Id = _ManoObra_Apu_Indice_Id;
            this._Porcentaje_Costo_Indirecto = _Porcentaje_Costo_Indirecto;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Apu_Mano_Obra_Id = _Apu_Mano_Obra_Id;
            this._Fiscalizador_Per_Personal_Id = _Fiscalizador_Per_Personal_Id;
            this._Contratista_Per_Personal_Id = _Contratista_Per_Personal_Id;
            this._Fecha_Indices_Def = _Fecha_Indices_Def;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Fecha_Update = _Fecha_Update;
            this._Update_Per_Personal_Id = _Update_Per_Personal_Id;
            this._Tipo = _Tipo;
            this._Indice_Sumatoria = _Indice_Sumatoria;
            this._Coeficiente_Sumatoria = _Coeficiente_Sumatoria;
            this._Cuadrilla_Sumatoria = _Cuadrilla_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = _Cuadrilla_Coeficiente_Sumatoria;
            this._Suma_Porcentaje_Indice_Transporte = _Suma_Porcentaje_Indice_Transporte;
            this._Origen_Nombre = _Origen_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Cadena_Indice = _Cadena_Indice;
            this._Cadena_Cuadrilla = _Cadena_Cuadrilla;
            this._Tipo_Nombre = _Tipo_Nombre;
            this._Codigo_Institucional = _Codigo_Institucional;
        }
        public Apu_Presupuesto(Apu_Presupuesto o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Apu_Origen_Id = o.Apu_Origen_Id;
            this._Apu_Origen_Codigo = o.Apu_Origen_Codigo;
            this._Apu_Origen_Nombre = o.Apu_Origen_Nombre;
            this._Origen = o.Origen;
            this._Costo_Directo = o.Costo_Directo;
            this._Costo_Total = o.Costo_Total;
            this._Costo_Indirecto = o.Costo_Indirecto;
            this._Costo_Otros = o.Costo_Otros;
            this._Equipo_Apu_Indice_Id = o.Equipo_Apu_Indice_Id;
            this._ManoObra_Apu_Indice_Id = o.ManoObra_Apu_Indice_Id;
            this._Porcentaje_Costo_Indirecto = o.Porcentaje_Costo_Indirecto;
            this._Int_Sucursal_Id = o.Int_Sucursal_Id;
            this._Apu_Mano_Obra_Id = o.Apu_Mano_Obra_Id;
            this._Fiscalizador_Per_Personal_Id = o.Fiscalizador_Per_Personal_Id;
            this._Contratista_Per_Personal_Id = o.Contratista_Per_Personal_Id;
            this._Fecha_Indices_Def = o.Fecha_Indices_Def;
            this._Fecha_Creacion = o.Fecha_Creacion;
            this._Creacion_Per_Personal_Id = o.Creacion_Per_Personal_Id;
            this._Fecha_Update = o.Fecha_Update;
            this._Update_Per_Personal_Id = o.Update_Per_Personal_Id;
            this._Tipo = o.Tipo;
            this._Indice_Sumatoria = o.Indice_Sumatoria;
            this._Coeficiente_Sumatoria = o.Coeficiente_Sumatoria;
            this._Cuadrilla_Sumatoria = o.Cuadrilla_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = o.Cuadrilla_Coeficiente_Sumatoria;
            this._Suma_Porcentaje_Indice_Transporte = o.Suma_Porcentaje_Indice_Transporte;
            this._Origen_Nombre = o.Origen_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Cadena_Indice = o.Cadena_Indice;
            this._Cadena_Cuadrilla = o.Cadena_Cuadrilla;
            this._Tipo_Nombre = o.Tipo_Nombre;
            this._Codigo_Institucional = o.Codigo_Institucional;
        }
    }
}
