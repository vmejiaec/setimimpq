
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Proyecto : Entidad
    {
        // Atributos
        private String _Codigo_Institucion;
        private String _Apu_Lugar_Id;
        private Decimal _Area;
        private Decimal _Porcentaje_Costo_Indirecto;
        private Decimal _Porcentaje_Costo_Otros;
        private DateTime _Fecha_Creacion;
        private String _Coordinador_Per_Personal_Id;
        private String _Tecnico_Per_Personal_Id;
        private String _Etapa;
        private String _Int_Sucursal_Id;
        private String _Int_Moneda_Id;
        private DateTime _Fecha_Update;
        private String _Creacion_Per_Personal_Id;
        private String _Update_Per_Personal_Id;
        private Decimal _Costo_Directo;
        private Decimal _Costo_Total;
        private Decimal _Costo_Indirecto;
        private Decimal _Costo_Otros;
        private String _Descripcion;
        private String _Tipo_Contrato;
        private String _Apu_Lugar_Codigo;
        private String _Apu_Lugar_Nombre;
        private String _Apu_provincia_id;
        private String _Apu_Provincia_Codigo;
        private String _Apu_Provincia_Nombre;
        private String _Int_Sucursal_Codigo;
        private String _Int_Sucursal_Nombre;
        private String _Int_Empresa_Id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Update_Per_Personal_Codigo;
        private String _Update_Per_Personal_Nombre;
        private String _Coordinador_Per_Personal_Codigo;
        private String _Coordinador_Per_Personal_Nombre;
        private String _Tecnico_Per_Personal_Codigo;
        private String _Tecnico_Per_Personal_Nombre;
        private String _Int_Moneda_Codigo;
        private String _Int_Moneda_Nombre;
        private String _Int_Moneda_Simbolo;
        private Decimal _Costo_Equipo;
        private Decimal _Costo_Mano_Obra;
        private Decimal _Costo_Material;
        private Decimal _Costo_Transporte;
        private Decimal _Costo_Metro_Cuadrado;
        private Decimal _Costo_Indirecto_Otros;
        private Decimal _Porcentaje_Costo_Indirecto_Otros;
        private Decimal _Indice_Sumatoria;
        private Decimal _Coeficiente_Sumatoria;
        private Decimal _Cuadrilla_Sumatoria;
        private Decimal _Cuadrilla_Coeficiente_Sumatoria;
        private Decimal _Suma_Porcentaje_Indice_Transporte;
        private String _Etapa_Nombre;
        private String _Estado_Nombre;
        private String _Cadena_Indice;
        private String _Cadena_Cuadrilla;
        private String _Apu_Presupuesto_Estado;
        private String _Apu_Presupuesto_Estado_Nombre;
        private String _Tipo_Nombre;

        // Propiedades de la clase
        public String Codigo_Institucion
        {
            get { return _Codigo_Institucion; }
            set { _Codigo_Institucion = value; }
        }

        public String Apu_Lugar_Id
        {
            get { return _Apu_Lugar_Id; }
            set { _Apu_Lugar_Id = value; }
        }

        public Decimal Area
        {
            get { return _Area; }
            set { _Area = value; }
        }

        public Decimal Porcentaje_Costo_Indirecto
        {
            get { return _Porcentaje_Costo_Indirecto; }
            set { _Porcentaje_Costo_Indirecto = value; }
        }

        public Decimal Porcentaje_Costo_Otros
        {
            get { return _Porcentaje_Costo_Otros; }
            set { _Porcentaje_Costo_Otros = value; }
        }

        public DateTime Fecha_Creacion
        {
            get { return _Fecha_Creacion; }
            set { _Fecha_Creacion = value; }
        }

        public String Coordinador_Per_Personal_Id
        {
            get { return _Coordinador_Per_Personal_Id; }
            set { _Coordinador_Per_Personal_Id = value; }
        }

        public String Tecnico_Per_Personal_Id
        {
            get { return _Tecnico_Per_Personal_Id; }
            set { _Tecnico_Per_Personal_Id = value; }
        }

        public String Etapa
        {
            get { return _Etapa; }
            set { _Etapa = value; }
        }

        public String Int_Sucursal_Id
        {
            get { return _Int_Sucursal_Id; }
            set { _Int_Sucursal_Id = value; }
        }

        public String Int_Moneda_Id
        {
            get { return _Int_Moneda_Id; }
            set { _Int_Moneda_Id = value; }
        }

        public DateTime Fecha_Update
        {
            get { return _Fecha_Update; }
            set { _Fecha_Update = value; }
        }

        public String Creacion_Per_Personal_Id
        {
            get { return _Creacion_Per_Personal_Id; }
            set { _Creacion_Per_Personal_Id = value; }
        }

        public String Update_Per_Personal_Id
        {
            get { return _Update_Per_Personal_Id; }
            set { _Update_Per_Personal_Id = value; }
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

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Tipo_Contrato
        {
            get { return _Tipo_Contrato; }
            set { _Tipo_Contrato = value; }
        }

        public String Apu_Lugar_Codigo
        {
            get { return _Apu_Lugar_Codigo; }
            set { _Apu_Lugar_Codigo = value; }
        }

        public String Apu_Lugar_Nombre
        {
            get { return _Apu_Lugar_Nombre; }
            set { _Apu_Lugar_Nombre = value; }
        }

        public String Apu_provincia_id
        {
            get { return _Apu_provincia_id; }
            set { _Apu_provincia_id = value; }
        }

        public String Apu_Provincia_Codigo
        {
            get { return _Apu_Provincia_Codigo; }
            set { _Apu_Provincia_Codigo = value; }
        }

        public String Apu_Provincia_Nombre
        {
            get { return _Apu_Provincia_Nombre; }
            set { _Apu_Provincia_Nombre = value; }
        }

        public String Int_Sucursal_Codigo
        {
            get { return _Int_Sucursal_Codigo; }
            set { _Int_Sucursal_Codigo = value; }
        }

        public String Int_Sucursal_Nombre
        {
            get { return _Int_Sucursal_Nombre; }
            set { _Int_Sucursal_Nombre = value; }
        }

        public String Int_Empresa_Id
        {
            get { return _Int_Empresa_Id; }
            set { _Int_Empresa_Id = value; }
        }

        public String Int_Empresa_Codigo
        {
            get { return _Int_Empresa_Codigo; }
            set { _Int_Empresa_Codigo = value; }
        }

        public String Int_Empresa_Nombre
        {
            get { return _Int_Empresa_Nombre; }
            set { _Int_Empresa_Nombre = value; }
        }

        public String Creacion_Per_Personal_Codigo
        {
            get { return _Creacion_Per_Personal_Codigo; }
            set { _Creacion_Per_Personal_Codigo = value; }
        }

        public String Creacion_Per_Personal_Nombre
        {
            get { return _Creacion_Per_Personal_Nombre; }
            set { _Creacion_Per_Personal_Nombre = value; }
        }

        public String Update_Per_Personal_Codigo
        {
            get { return _Update_Per_Personal_Codigo; }
            set { _Update_Per_Personal_Codigo = value; }
        }

        public String Update_Per_Personal_Nombre
        {
            get { return _Update_Per_Personal_Nombre; }
            set { _Update_Per_Personal_Nombre = value; }
        }

        public String Coordinador_Per_Personal_Codigo
        {
            get { return _Coordinador_Per_Personal_Codigo; }
            set { _Coordinador_Per_Personal_Codigo = value; }
        }

        public String Coordinador_Per_Personal_Nombre
        {
            get { return _Coordinador_Per_Personal_Nombre; }
            set { _Coordinador_Per_Personal_Nombre = value; }
        }

        public String Tecnico_Per_Personal_Codigo
        {
            get { return _Tecnico_Per_Personal_Codigo; }
            set { _Tecnico_Per_Personal_Codigo = value; }
        }

        public String Tecnico_Per_Personal_Nombre
        {
            get { return _Tecnico_Per_Personal_Nombre; }
            set { _Tecnico_Per_Personal_Nombre = value; }
        }

        public String Int_Moneda_Codigo
        {
            get { return _Int_Moneda_Codigo; }
            set { _Int_Moneda_Codigo = value; }
        }

        public String Int_Moneda_Nombre
        {
            get { return _Int_Moneda_Nombre; }
            set { _Int_Moneda_Nombre = value; }
        }

        public String Int_Moneda_Simbolo
        {
            get { return _Int_Moneda_Simbolo; }
            set { _Int_Moneda_Simbolo = value; }
        }

        public Decimal Costo_Equipo
        {
            get { return _Costo_Equipo; }
            set { _Costo_Equipo = value; }
        }

        public Decimal Costo_Mano_Obra
        {
            get { return _Costo_Mano_Obra; }
            set { _Costo_Mano_Obra = value; }
        }

        public Decimal Costo_Material
        {
            get { return _Costo_Material; }
            set { _Costo_Material = value; }
        }

        public Decimal Costo_Transporte
        {
            get { return _Costo_Transporte; }
            set { _Costo_Transporte = value; }
        }

        public Decimal Costo_Metro_Cuadrado
        {
            get { return _Costo_Metro_Cuadrado; }
            set { _Costo_Metro_Cuadrado = value; }
        }

        public Decimal Costo_Indirecto_Otros
        {
            get { return _Costo_Indirecto_Otros; }
            set { _Costo_Indirecto_Otros = value; }
        }

        public Decimal Porcentaje_Costo_Indirecto_Otros
        {
            get { return _Porcentaje_Costo_Indirecto_Otros; }
            set { _Porcentaje_Costo_Indirecto_Otros = value; }
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

        public String Etapa_Nombre
        {
            get { return _Etapa_Nombre; }
            set { _Etapa_Nombre = value; }
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

        public String Apu_Presupuesto_Estado
        {
            get { return _Apu_Presupuesto_Estado; }
            set { _Apu_Presupuesto_Estado = value; }
        }

        public String Apu_Presupuesto_Estado_Nombre
        {
            get { return _Apu_Presupuesto_Estado_Nombre; }
            set { _Apu_Presupuesto_Estado_Nombre = value; }
        }

        public String Tipo_Nombre
        {
            get { return _Tipo_Nombre; }
            set { _Tipo_Nombre = value; }
        }

        // Constructor
        public Apu_Proyecto()
        {
        }
        public Apu_Proyecto(String _Id, String _Codigo, String _Nombre, String _Estado, String _Codigo_Institucion, String _Apu_Lugar_Id, Decimal _Area, Decimal _Porcentaje_Costo_Indirecto, Decimal _Porcentaje_Costo_Otros, DateTime _Fecha_Creacion, String _Coordinador_Per_Personal_Id, String _Tecnico_Per_Personal_Id, String _Etapa, String _Int_Sucursal_Id, String _Int_Moneda_Id, DateTime _Fecha_Update, String _Creacion_Per_Personal_Id, String _Update_Per_Personal_Id, Decimal _Costo_Directo, Decimal _Costo_Total, Decimal _Costo_Indirecto, Decimal _Costo_Otros, String _Descripcion, String _Tipo_Contrato, String _Apu_Lugar_Codigo, String _Apu_Lugar_Nombre, String _Apu_provincia_id, String _Apu_Provincia_Codigo, String _Apu_Provincia_Nombre, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, String _Coordinador_Per_Personal_Codigo, String _Coordinador_Per_Personal_Nombre, String _Tecnico_Per_Personal_Codigo, String _Tecnico_Per_Personal_Nombre, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Int_Moneda_Simbolo, Decimal _Costo_Equipo, Decimal _Costo_Mano_Obra, Decimal _Costo_Material, Decimal _Costo_Transporte, Decimal _Costo_Metro_Cuadrado, Decimal _Costo_Indirecto_Otros, Decimal _Porcentaje_Costo_Indirecto_Otros, Decimal _Indice_Sumatoria, Decimal _Coeficiente_Sumatoria, Decimal _Cuadrilla_Sumatoria, Decimal _Cuadrilla_Coeficiente_Sumatoria, Decimal _Suma_Porcentaje_Indice_Transporte, String _Etapa_Nombre, String _Estado_Nombre, String _Cadena_Indice, String _Cadena_Cuadrilla, String _Apu_Presupuesto_Estado, String _Apu_Presupuesto_Estado_Nombre, String _Tipo_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Codigo_Institucion = _Codigo_Institucion;
            this._Apu_Lugar_Id = _Apu_Lugar_Id;
            this._Area = _Area;
            this._Porcentaje_Costo_Indirecto = _Porcentaje_Costo_Indirecto;
            this._Porcentaje_Costo_Otros = _Porcentaje_Costo_Otros;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Coordinador_Per_Personal_Id = _Coordinador_Per_Personal_Id;
            this._Tecnico_Per_Personal_Id = _Tecnico_Per_Personal_Id;
            this._Etapa = _Etapa;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Int_Moneda_Id = _Int_Moneda_Id;
            this._Fecha_Update = _Fecha_Update;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Update_Per_Personal_Id = _Update_Per_Personal_Id;
            this._Costo_Directo = _Costo_Directo;
            this._Costo_Total = _Costo_Total;
            this._Costo_Indirecto = _Costo_Indirecto;
            this._Costo_Otros = _Costo_Otros;
            this._Descripcion = _Descripcion;
            this._Tipo_Contrato = _Tipo_Contrato;
            this._Apu_Lugar_Codigo = _Apu_Lugar_Codigo;
            this._Apu_Lugar_Nombre = _Apu_Lugar_Nombre;
            this._Apu_provincia_id = _Apu_provincia_id;
            this._Apu_Provincia_Codigo = _Apu_Provincia_Codigo;
            this._Apu_Provincia_Nombre = _Apu_Provincia_Nombre;
            this._Int_Sucursal_Codigo = _Int_Sucursal_Codigo;
            this._Int_Sucursal_Nombre = _Int_Sucursal_Nombre;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = _Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = _Update_Per_Personal_Nombre;
            this._Coordinador_Per_Personal_Codigo = _Coordinador_Per_Personal_Codigo;
            this._Coordinador_Per_Personal_Nombre = _Coordinador_Per_Personal_Nombre;
            this._Tecnico_Per_Personal_Codigo = _Tecnico_Per_Personal_Codigo;
            this._Tecnico_Per_Personal_Nombre = _Tecnico_Per_Personal_Nombre;
            this._Int_Moneda_Codigo = _Int_Moneda_Codigo;
            this._Int_Moneda_Nombre = _Int_Moneda_Nombre;
            this._Int_Moneda_Simbolo = _Int_Moneda_Simbolo;
            this._Costo_Equipo = _Costo_Equipo;
            this._Costo_Mano_Obra = _Costo_Mano_Obra;
            this._Costo_Material = _Costo_Material;
            this._Costo_Transporte = _Costo_Transporte;
            this._Costo_Metro_Cuadrado = _Costo_Metro_Cuadrado;
            this._Costo_Indirecto_Otros = _Costo_Indirecto_Otros;
            this._Porcentaje_Costo_Indirecto_Otros = _Porcentaje_Costo_Indirecto_Otros;
            this._Indice_Sumatoria = _Indice_Sumatoria;
            this._Coeficiente_Sumatoria = _Coeficiente_Sumatoria;
            this._Cuadrilla_Sumatoria = _Cuadrilla_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = _Cuadrilla_Coeficiente_Sumatoria;
            this._Suma_Porcentaje_Indice_Transporte = _Suma_Porcentaje_Indice_Transporte;
            this._Etapa_Nombre = _Etapa_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Cadena_Indice = _Cadena_Indice;
            this._Cadena_Cuadrilla = _Cadena_Cuadrilla;
            this._Apu_Presupuesto_Estado = _Apu_Presupuesto_Estado;
            this._Apu_Presupuesto_Estado_Nombre = _Apu_Presupuesto_Estado_Nombre;
            this._Tipo_Nombre = _Tipo_Nombre;
        }
        public Apu_Proyecto(Apu_Proyecto o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Codigo_Institucion = o.Codigo_Institucion;
            this._Apu_Lugar_Id = o.Apu_Lugar_Id;
            this._Area = o.Area;
            this._Porcentaje_Costo_Indirecto = o.Porcentaje_Costo_Indirecto;
            this._Porcentaje_Costo_Otros = o.Porcentaje_Costo_Otros;
            this._Fecha_Creacion = o.Fecha_Creacion;
            this._Coordinador_Per_Personal_Id = o.Coordinador_Per_Personal_Id;
            this._Tecnico_Per_Personal_Id = o.Tecnico_Per_Personal_Id;
            this._Etapa = o.Etapa;
            this._Int_Sucursal_Id = o.Int_Sucursal_Id;
            this._Int_Moneda_Id = o.Int_Moneda_Id;
            this._Fecha_Update = o.Fecha_Update;
            this._Creacion_Per_Personal_Id = o.Creacion_Per_Personal_Id;
            this._Update_Per_Personal_Id = o.Update_Per_Personal_Id;
            this._Costo_Directo = o.Costo_Directo;
            this._Costo_Total = o.Costo_Total;
            this._Costo_Indirecto = o.Costo_Indirecto;
            this._Costo_Otros = o.Costo_Otros;
            this._Descripcion = o.Descripcion;
            this._Tipo_Contrato = o.Tipo_Contrato;
            this._Apu_Lugar_Codigo = o.Apu_Lugar_Codigo;
            this._Apu_Lugar_Nombre = o.Apu_Lugar_Nombre;
            this._Apu_provincia_id = o.Apu_provincia_id;
            this._Apu_Provincia_Codigo = o.Apu_Provincia_Codigo;
            this._Apu_Provincia_Nombre = o.Apu_Provincia_Nombre;
            this._Int_Sucursal_Codigo = o.Int_Sucursal_Codigo;
            this._Int_Sucursal_Nombre = o.Int_Sucursal_Nombre;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Creacion_Per_Personal_Codigo = o.Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = o.Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = o.Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = o.Update_Per_Personal_Nombre;
            this._Coordinador_Per_Personal_Codigo = o.Coordinador_Per_Personal_Codigo;
            this._Coordinador_Per_Personal_Nombre = o.Coordinador_Per_Personal_Nombre;
            this._Tecnico_Per_Personal_Codigo = o.Tecnico_Per_Personal_Codigo;
            this._Tecnico_Per_Personal_Nombre = o.Tecnico_Per_Personal_Nombre;
            this._Int_Moneda_Codigo = o.Int_Moneda_Codigo;
            this._Int_Moneda_Nombre = o.Int_Moneda_Nombre;
            this._Int_Moneda_Simbolo = o.Int_Moneda_Simbolo;
            this._Costo_Equipo = o.Costo_Equipo;
            this._Costo_Mano_Obra = o.Costo_Mano_Obra;
            this._Costo_Material = o.Costo_Material;
            this._Costo_Transporte = o.Costo_Transporte;
            this._Costo_Metro_Cuadrado = o.Costo_Metro_Cuadrado;
            this._Costo_Indirecto_Otros = o.Costo_Indirecto_Otros;
            this._Porcentaje_Costo_Indirecto_Otros = o.Porcentaje_Costo_Indirecto_Otros;
            this._Indice_Sumatoria = o.Indice_Sumatoria;
            this._Coeficiente_Sumatoria = o.Coeficiente_Sumatoria;
            this._Cuadrilla_Sumatoria = o.Cuadrilla_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = o.Cuadrilla_Coeficiente_Sumatoria;
            this._Suma_Porcentaje_Indice_Transporte = o.Suma_Porcentaje_Indice_Transporte;
            this._Etapa_Nombre = o.Etapa_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Cadena_Indice = o.Cadena_Indice;
            this._Cadena_Cuadrilla = o.Cadena_Cuadrilla;
            this._Apu_Presupuesto_Estado = o.Apu_Presupuesto_Estado;
            this._Apu_Presupuesto_Estado_Nombre = o.Apu_Presupuesto_Estado_Nombre;
            this._Tipo_Nombre = o.Tipo_Nombre;
        }
    }
}
