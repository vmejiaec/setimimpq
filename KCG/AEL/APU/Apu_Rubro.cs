
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Rubro : Entidad
    {
        // Atributos
        private String _Unidad;
        private String _Int_Sucursal_Id;
        private String _Int_Moneda_Id;
        private Decimal _Rendimiento_Mano_Obra;
        private Decimal _Rendimiento_Equipo;
        private String _Especial;
        private String _Disponible;
        private String _Descripcion;
        private String _Creacion_Per_Personal_Id;
        private DateTime _Fecha_Creacion;
        private String _Update_Per_Personal_Id;
        private DateTime _Fecha_Update;
        private String _Apu_Subtitulo_id;
        private String _Int_Sucursal_Codigo;
        private String _Int_Sucursal_Nombre;
        private String _Int_Empresa_Id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Apu_Subtitulo_Codigo;
        private String _Apu_Subtitulo_Nombre;
        private String _Apu_Titulo_id;
        private String _Apu_Titulo_Codigo;
        private String _Apu_Titulo_Nombre;
        private String _Int_Moneda_Codigo;
        private String _Int_Moneda_Nombre;
        private String _Int_Moneda_Simbolo;
        private String _Creacion_Per_Personal_Codigo;
        private String _Creacion_Per_Personal_Nombre;
        private String _Update_Per_Personal_Codigo;
        private String _Update_Per_Personal_Nombre;
        private Decimal _Rendimiento_Mano_Obra_Hora;
        private Decimal _Rendimiento_Equipo_Hora;
        private Decimal _Apu_rubro_material_costo_total;
        private Decimal _Apu_rubro_transporte_costo_total;
        private Decimal _Apu_rubro_material_transporte_costo_total;
        private Decimal _Apu_rubro_mano_obra_costo_total;
        private Decimal _Apu_rubro_equipo_costo_total;
        private DateTime _Apu_rubro_material_ultima_fecha_update;
        private DateTime _Apu_rubro_transporte_ultima_fecha_update;
        private DateTime _Apu_rubro_mano_obra_ultima_fecha_update;
        private DateTime _Apu_rubro_equipo_ultima_fecha_update;
        private Decimal _Costo_Directo;
        private Decimal _Costo_Indirecto;
        private Decimal _Costo_Total;
        private Decimal _Porcentaje_costo_indirecto;
        private String _Disponible_Nombre;
        private String _Especial_Nombre;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Unidad
        {
            get { return _Unidad; }
            set { _Unidad = value; }
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

        public Decimal Rendimiento_Mano_Obra
        {
            get { return _Rendimiento_Mano_Obra; }
            set { _Rendimiento_Mano_Obra = value; }
        }

        public Decimal Rendimiento_Equipo
        {
            get { return _Rendimiento_Equipo; }
            set { _Rendimiento_Equipo = value; }
        }

        public String Especial
        {
            get { return _Especial; }
            set { _Especial = value; }
        }

        public String Disponible
        {
            get { return _Disponible; }
            set { _Disponible = value; }
        }

        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Creacion_Per_Personal_Id
        {
            get { return _Creacion_Per_Personal_Id; }
            set { _Creacion_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Creacion
        {
            get { return _Fecha_Creacion; }
            set { _Fecha_Creacion = value; }
        }

        public String Update_Per_Personal_Id
        {
            get { return _Update_Per_Personal_Id; }
            set { _Update_Per_Personal_Id = value; }
        }

        public DateTime Fecha_Update
        {
            get { return _Fecha_Update; }
            set { _Fecha_Update = value; }
        }

        public String Apu_Subtitulo_id
        {
            get { return _Apu_Subtitulo_id; }
            set { _Apu_Subtitulo_id = value; }
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

        public String Apu_Subtitulo_Codigo
        {
            get { return _Apu_Subtitulo_Codigo; }
            set { _Apu_Subtitulo_Codigo = value; }
        }

        public String Apu_Subtitulo_Nombre
        {
            get { return _Apu_Subtitulo_Nombre; }
            set { _Apu_Subtitulo_Nombre = value; }
        }

        public String Apu_Titulo_id
        {
            get { return _Apu_Titulo_id; }
            set { _Apu_Titulo_id = value; }
        }

        public String Apu_Titulo_Codigo
        {
            get { return _Apu_Titulo_Codigo; }
            set { _Apu_Titulo_Codigo = value; }
        }

        public String Apu_Titulo_Nombre
        {
            get { return _Apu_Titulo_Nombre; }
            set { _Apu_Titulo_Nombre = value; }
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

        public Decimal Rendimiento_Mano_Obra_Hora
        {
            get { return _Rendimiento_Mano_Obra_Hora; }
            set { _Rendimiento_Mano_Obra_Hora = value; }
        }

        public Decimal Rendimiento_Equipo_Hora
        {
            get { return _Rendimiento_Equipo_Hora; }
            set { _Rendimiento_Equipo_Hora = value; }
        }

        public Decimal Apu_rubro_material_costo_total
        {
            get { return _Apu_rubro_material_costo_total; }
            set { _Apu_rubro_material_costo_total = value; }
        }

        public Decimal Apu_rubro_transporte_costo_total
        {
            get { return _Apu_rubro_transporte_costo_total; }
            set { _Apu_rubro_transporte_costo_total = value; }
        }

        public Decimal Apu_rubro_material_transporte_costo_total
        {
            get { return _Apu_rubro_material_transporte_costo_total; }
            set { _Apu_rubro_material_transporte_costo_total = value; }
        }

        public Decimal Apu_rubro_mano_obra_costo_total
        {
            get { return _Apu_rubro_mano_obra_costo_total; }
            set { _Apu_rubro_mano_obra_costo_total = value; }
        }

        public Decimal Apu_rubro_equipo_costo_total
        {
            get { return _Apu_rubro_equipo_costo_total; }
            set { _Apu_rubro_equipo_costo_total = value; }
        }

        public DateTime Apu_rubro_material_ultima_fecha_update
        {
            get { return _Apu_rubro_material_ultima_fecha_update; }
            set { _Apu_rubro_material_ultima_fecha_update = value; }
        }

        public DateTime Apu_rubro_transporte_ultima_fecha_update
        {
            get { return _Apu_rubro_transporte_ultima_fecha_update; }
            set { _Apu_rubro_transporte_ultima_fecha_update = value; }
        }

        public DateTime Apu_rubro_mano_obra_ultima_fecha_update
        {
            get { return _Apu_rubro_mano_obra_ultima_fecha_update; }
            set { _Apu_rubro_mano_obra_ultima_fecha_update = value; }
        }

        public DateTime Apu_rubro_equipo_ultima_fecha_update
        {
            get { return _Apu_rubro_equipo_ultima_fecha_update; }
            set { _Apu_rubro_equipo_ultima_fecha_update = value; }
        }

        public Decimal Costo_Directo
        {
            get { return _Costo_Directo; }
            set { _Costo_Directo = value; }
        }

        public Decimal Costo_Indirecto
        {
            get { return _Costo_Indirecto; }
            set { _Costo_Indirecto = value; }
        }

        public Decimal Costo_Total
        {
            get { return _Costo_Total; }
            set { _Costo_Total = value; }
        }

        public Decimal Porcentaje_costo_indirecto
        {
            get { return _Porcentaje_costo_indirecto; }
            set { _Porcentaje_costo_indirecto = value; }
        }

        public String Disponible_Nombre
        {
            get { return _Disponible_Nombre; }
            set { _Disponible_Nombre = value; }
        }

        public String Especial_Nombre
        {
            get { return _Especial_Nombre; }
            set { _Especial_Nombre = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Apu_Rubro()
        {
        }

        public Apu_Rubro(String _Id, String _Codigo, String _Nombre, String _Estado, String _Unidad, String _Int_Sucursal_Id, String _Int_Moneda_Id, Decimal _Rendimiento_Mano_Obra, Decimal _Rendimiento_Equipo, String _Especial, String _Disponible, String _Descripcion, String _Creacion_Per_Personal_Id, DateTime _Fecha_Creacion, String _Update_Per_Personal_Id, DateTime _Fecha_Update, String _Apu_Subtitulo_id, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre, String _Apu_Titulo_id, String _Apu_Titulo_Codigo, String _Apu_Titulo_Nombre, String _Int_Moneda_Codigo, String _Int_Moneda_Nombre, String _Int_Moneda_Simbolo, String _Creacion_Per_Personal_Codigo, String _Creacion_Per_Personal_Nombre, String _Update_Per_Personal_Codigo, String _Update_Per_Personal_Nombre, Decimal _Rendimiento_Mano_Obra_Hora, Decimal _Rendimiento_Equipo_Hora, Decimal _Apu_rubro_material_costo_total, Decimal _Apu_rubro_transporte_costo_total, Decimal _Apu_rubro_material_transporte_costo_total, Decimal _Apu_rubro_mano_obra_costo_total, Decimal _Apu_rubro_equipo_costo_total, DateTime _Apu_rubro_material_ultima_fecha_update, DateTime _Apu_rubro_transporte_ultima_fecha_update, DateTime _Apu_rubro_mano_obra_ultima_fecha_update, DateTime _Apu_rubro_equipo_ultima_fecha_update, Decimal _Costo_Directo, Decimal _Costo_Indirecto, Decimal _Costo_Total, Decimal _Porcentaje_costo_indirecto, String _Disponible_Nombre, String _Especial_Nombre, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Unidad = _Unidad;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Int_Moneda_Id = _Int_Moneda_Id;
            this._Rendimiento_Mano_Obra = _Rendimiento_Mano_Obra;
            this._Rendimiento_Equipo = _Rendimiento_Equipo;
            this._Especial = _Especial;
            this._Disponible = _Disponible;
            this._Descripcion = _Descripcion;
            this._Creacion_Per_Personal_Id = _Creacion_Per_Personal_Id;
            this._Fecha_Creacion = _Fecha_Creacion;
            this._Update_Per_Personal_Id = _Update_Per_Personal_Id;
            this._Fecha_Update = _Fecha_Update;
            this._Apu_Subtitulo_id = _Apu_Subtitulo_id;
            this._Int_Sucursal_Codigo = _Int_Sucursal_Codigo;
            this._Int_Sucursal_Nombre = _Int_Sucursal_Nombre;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Apu_Subtitulo_Codigo = _Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = _Apu_Subtitulo_Nombre;
            this._Apu_Titulo_id = _Apu_Titulo_id;
            this._Apu_Titulo_Codigo = _Apu_Titulo_Codigo;
            this._Apu_Titulo_Nombre = _Apu_Titulo_Nombre;
            this._Int_Moneda_Codigo = _Int_Moneda_Codigo;
            this._Int_Moneda_Nombre = _Int_Moneda_Nombre;
            this._Int_Moneda_Simbolo = _Int_Moneda_Simbolo;
            this._Creacion_Per_Personal_Codigo = _Creacion_Per_Personal_Codigo;
            this._Creacion_Per_Personal_Nombre = _Creacion_Per_Personal_Nombre;
            this._Update_Per_Personal_Codigo = _Update_Per_Personal_Codigo;
            this._Update_Per_Personal_Nombre = _Update_Per_Personal_Nombre;
            this._Rendimiento_Mano_Obra_Hora = _Rendimiento_Mano_Obra_Hora;
            this._Rendimiento_Equipo_Hora = _Rendimiento_Equipo_Hora;
            this._Apu_rubro_material_costo_total = _Apu_rubro_material_costo_total;
            this._Apu_rubro_transporte_costo_total = _Apu_rubro_transporte_costo_total;
            this._Apu_rubro_material_transporte_costo_total = _Apu_rubro_material_transporte_costo_total;
            this._Apu_rubro_mano_obra_costo_total = _Apu_rubro_mano_obra_costo_total;
            this._Apu_rubro_equipo_costo_total = _Apu_rubro_equipo_costo_total;
            this._Apu_rubro_material_ultima_fecha_update = _Apu_rubro_material_ultima_fecha_update;
            this._Apu_rubro_transporte_ultima_fecha_update = _Apu_rubro_transporte_ultima_fecha_update;
            this._Apu_rubro_mano_obra_ultima_fecha_update = _Apu_rubro_mano_obra_ultima_fecha_update;
            this._Apu_rubro_equipo_ultima_fecha_update = _Apu_rubro_equipo_ultima_fecha_update;
            this._Costo_Directo = _Costo_Directo;
            this._Costo_Indirecto = _Costo_Indirecto;
            this._Costo_Total = _Costo_Total;
            this._Porcentaje_costo_indirecto = _Porcentaje_costo_indirecto;
            this._Disponible_Nombre = _Disponible_Nombre;
            this._Especial_Nombre = _Especial_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
        }
    }
}
