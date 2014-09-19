
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Fiscalizacion : Entidad
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
        private String _Codigo_Institucion;
        private String _Tipo_Contrato;
        private DateTime _Fecha_Cierre;
        private DateTime _Fecha_APU;
        private DateTime _Fecha_Ini_Contrato;
        private Int32 _Plazo_Contrato;
        private DateTime _Fecha_Fin_Contrato;
        private Decimal _Valor_Anticipo;
        private Decimal _Porcentaje_Anticipo;
        private String _Coordinador_1;
        private String _Coordinador_2;
        private String _Lugar;
        private String _Publicacion_Base;
        private String _Publicacion_Base_Def;
        private String _Contrato_Tipo;
        private String _Proyecto_Costos;
        private String _SubProyecto_Costos;
        private String _Programa_Costos;
        private String _Tipo_Contrato_Costos;
        private String _Ubicacion_Costos;
        private DateTime _Fecha_Indice_Base;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Update_Per_Personal_Codigo;
        private String _Update_Per_Personal_Nombre;
        private String _Fiscalizador_Per_Personal_Codigo;
        private String _Fiscalizador_Per_Personal_Nombre;
        private String _Contratista_Per_Personal_Codigo;
        private String _Contratista_Per_Personal_Nombre;
        private String _Tipo_Fiscalizacion;
        private String _Tipo_Fiscalizacion_Nombre;
        private String _Jefe_Fiscalizacion;
        private String _Jefe_Fiscalizacion_Nombre;
        private String _Origen_Nombre;
        private String _Estado_Nombre;
        private Decimal _Coeficiente_Sumatoria;
        private Decimal _Cuadrilla_Coeficiente_Sumatoria;
        private Decimal _SRD_x_Coeficiente_Sumatoria;
        private Decimal _Costo_Total_Dis;
        private Decimal _Costo_Total_Rea;
        private Decimal _SRD_x_Coeficiente_Sumatoria_Rea;
        private Int32 _Plazo_Ampliacion;
        private DateTime _Fecha_Final_Ampliacion;
        private Int32 _Plazo_Ampliacion_Only;

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

        public String Codigo_Institucion
        {
            get { return _Codigo_Institucion; }
            set { _Codigo_Institucion = value; }
        }

        public String Tipo_Contrato
        {
            get { return _Tipo_Contrato; }
            set { _Tipo_Contrato = value; }
        }

        public DateTime Fecha_Cierre
        {
            get { return _Fecha_Cierre; }
            set { _Fecha_Cierre = value; }
        }

        public DateTime Fecha_APU
        {
            get { return _Fecha_APU; }
            set { _Fecha_APU = value; }
        }

        public DateTime Fecha_Ini_Contrato
        {
            get { return _Fecha_Ini_Contrato; }
            set { _Fecha_Ini_Contrato = value; }
        }

        public Int32 Plazo_Contrato
        {
            get { return _Plazo_Contrato; }
            set { _Plazo_Contrato = value; }
        }

        public DateTime Fecha_Fin_Contrato
        {
            get { return _Fecha_Fin_Contrato; }
            set { _Fecha_Fin_Contrato = value; }
        }

        public Decimal Valor_Anticipo
        {
            get { return _Valor_Anticipo; }
            set { _Valor_Anticipo = value; }
        }

        public Decimal Porcentaje_Anticipo
        {
            get { return _Porcentaje_Anticipo; }
            set { _Porcentaje_Anticipo = value; }
        }

        public String Coordinador_1
        {
            get { return _Coordinador_1; }
            set { _Coordinador_1 = value; }
        }

        public String Coordinador_2
        {
            get { return _Coordinador_2; }
            set { _Coordinador_2 = value; }
        }

        public String Lugar
        {
            get { return _Lugar; }
            set { _Lugar = value; }
        }

        public String Publicacion_Base
        {
            get { return _Publicacion_Base; }
            set { _Publicacion_Base = value; }
        }

        public String Publicacion_Base_Def
        {
            get { return _Publicacion_Base_Def; }
            set { _Publicacion_Base_Def = value; }
        }

        public String Contrato_Tipo
        {
            get { return _Contrato_Tipo; }
            set { _Contrato_Tipo = value; }
        }

        public String Proyecto_Costos
        {
            get { return _Proyecto_Costos; }
            set { _Proyecto_Costos = value; }
        }

        public String SubProyecto_Costos
        {
            get { return _SubProyecto_Costos; }
            set { _SubProyecto_Costos = value; }
        }

        public String Programa_Costos
        {
            get { return _Programa_Costos; }
            set { _Programa_Costos = value; }
        }

        public String Tipo_Contrato_Costos
        {
            get { return _Tipo_Contrato_Costos; }
            set { _Tipo_Contrato_Costos = value; }
        }

        public String Ubicacion_Costos
        {
            get { return _Ubicacion_Costos; }
            set { _Ubicacion_Costos = value; }
        }

        public DateTime Fecha_Indice_Base
        {
            get { return _Fecha_Indice_Base; }
            set { _Fecha_Indice_Base = value; }
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

        public String Fiscalizador_Per_Personal_Codigo
        {
            get { return _Fiscalizador_Per_Personal_Codigo; }
            set { _Fiscalizador_Per_Personal_Codigo = value; }
        }

        public String Fiscalizador_Per_Personal_Nombre
        {
            get { return _Fiscalizador_Per_Personal_Nombre; }
            set { _Fiscalizador_Per_Personal_Nombre = value; }
        }

        public String Contratista_Per_Personal_Codigo
        {
            get { return _Contratista_Per_Personal_Codigo; }
            set { _Contratista_Per_Personal_Codigo = value; }
        }

        public String Contratista_Per_Personal_Nombre
        {
            get { return _Contratista_Per_Personal_Nombre; }
            set { _Contratista_Per_Personal_Nombre = value; }
        }

        public String Tipo_Fiscalizacion
        {
            get { return _Tipo_Fiscalizacion; }
            set { _Tipo_Fiscalizacion = value; }
        }

        public String Tipo_Fiscalizacion_Nombre
        {
            get { return _Tipo_Fiscalizacion_Nombre; }
            set { _Tipo_Fiscalizacion_Nombre = value; }
        }

        public String Jefe_Fiscalizacion
        {
            get { return _Jefe_Fiscalizacion; }
            set { _Jefe_Fiscalizacion = value; }
        }

        public String Jefe_Fiscalizacion_Nombre
        {
            get { return _Jefe_Fiscalizacion_Nombre; }
            set { _Jefe_Fiscalizacion_Nombre = value; }
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

        public Decimal Coeficiente_Sumatoria
        {
            get { return _Coeficiente_Sumatoria; }
            set { _Coeficiente_Sumatoria = value; }
        }

        public Decimal Cuadrilla_Coeficiente_Sumatoria
        {
            get { return _Cuadrilla_Coeficiente_Sumatoria; }
            set { _Cuadrilla_Coeficiente_Sumatoria = value; }
        }

        public Decimal SRD_x_Coeficiente_Sumatoria
        {
            get { return _SRD_x_Coeficiente_Sumatoria; }
            set { _SRD_x_Coeficiente_Sumatoria = value; }
        }

        public Decimal Costo_Total_Dis
        {
            get { return _Costo_Total_Dis; }
            set { _Costo_Total_Dis = value; }
        }

        public Decimal Costo_Total_Rea
        {
            get { return _Costo_Total_Rea; }
            set { _Costo_Total_Rea = value; }
        }

        public Decimal SRD_x_Coeficiente_Sumatoria_Rea
        {
            get { return _SRD_x_Coeficiente_Sumatoria_Rea; }
            set { _SRD_x_Coeficiente_Sumatoria_Rea = value; }
        }

        public Int32 Plazo_Ampliacion
        {
            get { return _Plazo_Ampliacion; }
            set { _Plazo_Ampliacion = value; }
        }

        public DateTime Fecha_Final_Ampliacion
        {
            get { return _Fecha_Final_Ampliacion; }
            set { _Fecha_Final_Ampliacion = value; }
        }

        public Int32 Plazo_Ampliacion_Only
        {
            get { return _Plazo_Ampliacion_Only; }
            set { _Plazo_Ampliacion_Only = value; }
        }

        // Constructor
        public Fis_Fiscalizacion()
        {
        }
        public Fis_Fiscalizacion(String _Id, String _Codigo, String _Estado, String _Apu_Origen_Id, String _Apu_Origen_Codigo, String _Apu_Origen_Nombre, String _Origen, Decimal _Costo_Directo, Decimal _Costo_Total, Decimal _Costo_Indirecto, Decimal _Costo_Otros, String _Equipo_Apu_Indice_Id, String _ManoObra_Apu_Indice_Id, Decimal _Porcentaje_Costo_Indirecto, String _Int_Sucursal_Id, String _Apu_Mano_Obra_Id, String _Fiscalizador_Per_Personal_Id, String _Contratista_Per_Personal_Id, DateTime _Fecha_Indices_Def, DateTime _Fecha_Creacion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Update, String _Update_Per_Personal_Id, String _Tipo, String _Codigo_Institucion, String _Tipo_Contrato, DateTime _Fecha_Cierre, DateTime _Fecha_APU, DateTime _Fecha_Ini_Contrato, Int32 _Plazo_Contrato, DateTime _Fecha_Fin_Contrato, Decimal _Valor_Anticipo, Decimal _Porcentaje_Anticipo, String _Coordinador_1, String _Coordinador_2, String _Lugar, String _Publicacion_Base, String _Publicacion_Base_Def, String _Contrato_Tipo, String _Proyecto_Costos, String _SubProyecto_Costos, String _Programa_Costos, String _Tipo_Contrato_Costos, String _Ubicacion_Costos, DateTime _Fecha_Indice_Base, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, String _Fiscalizador_Per_Personal_Codigo, String _Fiscalizador_Per_Personal_Nombre, String _Contratista_Per_Personal_Codigo, String _Contratista_Per_Personal_Nombre, String _Tipo_Fiscalizacion, String _Tipo_Fiscalizacion_Nombre, String _Jefe_Fiscalizacion, String _Jefe_Fiscalizacion_Nombre, String _Origen_Nombre, String _Estado_Nombre, Decimal _Coeficiente_Sumatoria, Decimal _Cuadrilla_Coeficiente_Sumatoria, Decimal _SRD_x_Coeficiente_Sumatoria, Decimal _Costo_Total_Dis, Decimal _Costo_Total_Rea, Decimal _SRD_x_Coeficiente_Sumatoria_Rea, Int32 _Plazo_Ampliacion, DateTime _Fecha_Final_Ampliacion, Int32 _Plazo_Ampliacion_Only)
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
            this._Codigo_Institucion = _Codigo_Institucion;
            this._Tipo_Contrato = _Tipo_Contrato;
            this._Fecha_Cierre = _Fecha_Cierre;
            this._Fecha_APU = _Fecha_APU;
            this._Fecha_Ini_Contrato = _Fecha_Ini_Contrato;
            this._Plazo_Contrato = _Plazo_Contrato;
            this._Fecha_Fin_Contrato = _Fecha_Fin_Contrato;
            this._Valor_Anticipo = _Valor_Anticipo;
            this._Porcentaje_Anticipo = _Porcentaje_Anticipo;
            this._Coordinador_1 = _Coordinador_1;
            this._Coordinador_2 = _Coordinador_2;
            this._Lugar = _Lugar;
            this._Publicacion_Base = _Publicacion_Base;
            this._Publicacion_Base_Def = _Publicacion_Base_Def;
            this._Contrato_Tipo = _Contrato_Tipo;
            this._Proyecto_Costos = _Proyecto_Costos;
            this._SubProyecto_Costos = _SubProyecto_Costos;
            this._Programa_Costos = _Programa_Costos;
            this._Tipo_Contrato_Costos = _Tipo_Contrato_Costos;
            this._Ubicacion_Costos = _Ubicacion_Costos;
            this._Fecha_Indice_Base = _Fecha_Indice_Base;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = _Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = _Update_Per_Personal_Nombre;
            this._Fiscalizador_Per_Personal_Codigo = _Fiscalizador_Per_Personal_Codigo;
            this._Fiscalizador_Per_Personal_Nombre = _Fiscalizador_Per_Personal_Nombre;
            this._Contratista_Per_Personal_Codigo = _Contratista_Per_Personal_Codigo;
            this._Contratista_Per_Personal_Nombre = _Contratista_Per_Personal_Nombre;
            this._Tipo_Fiscalizacion = _Tipo_Fiscalizacion;
            this._Tipo_Fiscalizacion_Nombre = _Tipo_Fiscalizacion_Nombre;
            this._Jefe_Fiscalizacion = _Jefe_Fiscalizacion;
            this._Jefe_Fiscalizacion_Nombre = _Jefe_Fiscalizacion_Nombre;
            this._Origen_Nombre = _Origen_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Coeficiente_Sumatoria = _Coeficiente_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = _Cuadrilla_Coeficiente_Sumatoria;
            this._SRD_x_Coeficiente_Sumatoria = _SRD_x_Coeficiente_Sumatoria;
            this._Costo_Total_Dis = _Costo_Total_Dis;
            this._Costo_Total_Rea = _Costo_Total_Rea;
            this._SRD_x_Coeficiente_Sumatoria_Rea = _SRD_x_Coeficiente_Sumatoria_Rea;
            this._Plazo_Ampliacion = _Plazo_Ampliacion;
            this._Fecha_Final_Ampliacion = _Fecha_Final_Ampliacion;
            this._Plazo_Ampliacion_Only = _Plazo_Ampliacion_Only;
        }
        public Fis_Fiscalizacion(Fis_Fiscalizacion o)
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
            this._Codigo_Institucion = o.Codigo_Institucion;
            this._Tipo_Contrato = o.Tipo_Contrato;
            this._Fecha_Cierre = o.Fecha_Cierre;
            this._Fecha_APU = o.Fecha_APU;
            this._Fecha_Ini_Contrato = o.Fecha_Ini_Contrato;
            this._Plazo_Contrato = o.Plazo_Contrato;
            this._Fecha_Fin_Contrato = o.Fecha_Fin_Contrato;
            this._Valor_Anticipo = o.Valor_Anticipo;
            this._Porcentaje_Anticipo = o.Porcentaje_Anticipo;
            this._Coordinador_1 = o.Coordinador_1;
            this._Coordinador_2 = o.Coordinador_2;
            this._Lugar = o.Lugar;
            this._Publicacion_Base = o.Publicacion_Base;
            this._Publicacion_Base_Def = o.Publicacion_Base_Def;
            this._Contrato_Tipo = o.Contrato_Tipo;
            this._Proyecto_Costos = o.Proyecto_Costos;
            this._SubProyecto_Costos = o.SubProyecto_Costos;
            this._Programa_Costos = o.Programa_Costos;
            this._Tipo_Contrato_Costos = o.Tipo_Contrato_Costos;
            this._Ubicacion_Costos = o.Ubicacion_Costos;
            this._Fecha_Indice_Base = o.Fecha_Indice_Base;
            this._Creacion_Per_Personal_Codigo = o.Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = o.Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = o.Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = o.Update_Per_Personal_Nombre;
            this._Fiscalizador_Per_Personal_Codigo = o.Fiscalizador_Per_Personal_Codigo;
            this._Fiscalizador_Per_Personal_Nombre = o.Fiscalizador_Per_Personal_Nombre;
            this._Contratista_Per_Personal_Codigo = o.Contratista_Per_Personal_Codigo;
            this._Contratista_Per_Personal_Nombre = o.Contratista_Per_Personal_Nombre;
            this._Tipo_Fiscalizacion = o.Tipo_Fiscalizacion;
            this._Tipo_Fiscalizacion_Nombre = o.Tipo_Fiscalizacion_Nombre;
            this._Jefe_Fiscalizacion = o.Jefe_Fiscalizacion;
            this._Jefe_Fiscalizacion_Nombre = o.Jefe_Fiscalizacion_Nombre;
            this._Origen_Nombre = o.Origen_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Coeficiente_Sumatoria = o.Coeficiente_Sumatoria;
            this._Cuadrilla_Coeficiente_Sumatoria = o.Cuadrilla_Coeficiente_Sumatoria;
            this._SRD_x_Coeficiente_Sumatoria = o.SRD_x_Coeficiente_Sumatoria;
            this._Costo_Total_Dis = o.Costo_Total_Dis;
            this._Costo_Total_Rea = o.Costo_Total_Rea;
            this._SRD_x_Coeficiente_Sumatoria_Rea = o.SRD_x_Coeficiente_Sumatoria_Rea;
            this._Plazo_Ampliacion = o.Plazo_Ampliacion;
            this._Fecha_Final_Ampliacion = o.Fecha_Final_Ampliacion;
            this._Plazo_Ampliacion_Only = o.Plazo_Ampliacion_Only;
        }
    }
}
