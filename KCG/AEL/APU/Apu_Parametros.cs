
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.APU
{
    public class Apu_Parametros : Entidad
    {
        // Atributos
        private String _Equipo_Apu_Indice_Id;
        private String _ManoObra_Apu_Indice_Id;
        private Decimal _Porcentaje_Costo_Indirecto;
        private String _Int_Sucursal_Id;
        private String _Apu_Mano_Obra_Id;
        private String _Apu_Subtitulo_Id_Oferta_Rubro_Pred;
        private String _Equipo_Apu_Indice_Codigo;
        private String _Equipo_Apu_Indice_Nombre;
        private String _ManoObra_Apu_Indice_Codigo;
        private String _ManoObra_Apu_Indice_Nombre;
        private String _Apu_Mano_Obra_Codigo;
        private String _Apu_Mano_Obra_Nombre;
        private String _Int_Sucursal_Codigo;
        private String _Int_Sucursal_Nombre;
        private String _Int_Empresa_Id;
        private String _Int_Empresa_Codigo;
        private String _Int_Empresa_Nombre;
        private String _Estado_Nombre;
        private String _Apu_Subtitulo_Codigo;
        private String _Apu_Subtitulo_Nombre;

        // Propiedades de la clase
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

        public String Apu_Subtitulo_Id_Oferta_Rubro_Pred
        {
            get { return _Apu_Subtitulo_Id_Oferta_Rubro_Pred; }
            set { _Apu_Subtitulo_Id_Oferta_Rubro_Pred = value; }
        }

        public String Equipo_Apu_Indice_Codigo
        {
            get { return _Equipo_Apu_Indice_Codigo; }
            set { _Equipo_Apu_Indice_Codigo = value; }
        }

        public String Equipo_Apu_Indice_Nombre
        {
            get { return _Equipo_Apu_Indice_Nombre; }
            set { _Equipo_Apu_Indice_Nombre = value; }
        }

        public String ManoObra_Apu_Indice_Codigo
        {
            get { return _ManoObra_Apu_Indice_Codigo; }
            set { _ManoObra_Apu_Indice_Codigo = value; }
        }

        public String ManoObra_Apu_Indice_Nombre
        {
            get { return _ManoObra_Apu_Indice_Nombre; }
            set { _ManoObra_Apu_Indice_Nombre = value; }
        }

        public String Apu_Mano_Obra_Codigo
        {
            get { return _Apu_Mano_Obra_Codigo; }
            set { _Apu_Mano_Obra_Codigo = value; }
        }

        public String Apu_Mano_Obra_Nombre
        {
            get { return _Apu_Mano_Obra_Nombre; }
            set { _Apu_Mano_Obra_Nombre = value; }
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

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
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

        // Constructor
        public Apu_Parametros()
        {
        }
        public Apu_Parametros(String _Id, String _Codigo, String _Estado, String _Equipo_Apu_Indice_Id, String _ManoObra_Apu_Indice_Id, Decimal _Porcentaje_Costo_Indirecto, String _Int_Sucursal_Id, String _Apu_Mano_Obra_Id, String _Apu_Subtitulo_Id_Oferta_Rubro_Pred, String _Equipo_Apu_Indice_Codigo, String _Equipo_Apu_Indice_Nombre, String _ManoObra_Apu_Indice_Codigo, String _ManoObra_Apu_Indice_Nombre, String _Apu_Mano_Obra_Codigo, String _Apu_Mano_Obra_Nombre, String _Int_Sucursal_Codigo, String _Int_Sucursal_Nombre, String _Int_Empresa_Id, String _Int_Empresa_Codigo, String _Int_Empresa_Nombre, String _Estado_Nombre, String _Apu_Subtitulo_Codigo, String _Apu_Subtitulo_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Estado = _Estado;
            this._Equipo_Apu_Indice_Id = _Equipo_Apu_Indice_Id;
            this._ManoObra_Apu_Indice_Id = _ManoObra_Apu_Indice_Id;
            this._Porcentaje_Costo_Indirecto = _Porcentaje_Costo_Indirecto;
            this._Int_Sucursal_Id = _Int_Sucursal_Id;
            this._Apu_Mano_Obra_Id = _Apu_Mano_Obra_Id;
            this._Apu_Subtitulo_Id_Oferta_Rubro_Pred = _Apu_Subtitulo_Id_Oferta_Rubro_Pred;
            this._Equipo_Apu_Indice_Codigo = _Equipo_Apu_Indice_Codigo;
            this._Equipo_Apu_Indice_Nombre = _Equipo_Apu_Indice_Nombre;
            this._ManoObra_Apu_Indice_Codigo = _ManoObra_Apu_Indice_Codigo;
            this._ManoObra_Apu_Indice_Nombre = _ManoObra_Apu_Indice_Nombre;
            this._Apu_Mano_Obra_Codigo = _Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = _Apu_Mano_Obra_Nombre;
            this._Int_Sucursal_Codigo = _Int_Sucursal_Codigo;
            this._Int_Sucursal_Nombre = _Int_Sucursal_Nombre;
            this._Int_Empresa_Id = _Int_Empresa_Id;
            this._Int_Empresa_Codigo = _Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = _Int_Empresa_Nombre;
            this._Estado_Nombre = _Estado_Nombre;
            this._Apu_Subtitulo_Codigo = _Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = _Apu_Subtitulo_Nombre;
        }
        public Apu_Parametros(Apu_Parametros o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Estado = o.Estado;
            this._Equipo_Apu_Indice_Id = o.Equipo_Apu_Indice_Id;
            this._ManoObra_Apu_Indice_Id = o.ManoObra_Apu_Indice_Id;
            this._Porcentaje_Costo_Indirecto = o.Porcentaje_Costo_Indirecto;
            this._Int_Sucursal_Id = o.Int_Sucursal_Id;
            this._Apu_Mano_Obra_Id = o.Apu_Mano_Obra_Id;
            this._Apu_Subtitulo_Id_Oferta_Rubro_Pred = o.Apu_Subtitulo_Id_Oferta_Rubro_Pred;
            this._Equipo_Apu_Indice_Codigo = o.Equipo_Apu_Indice_Codigo;
            this._Equipo_Apu_Indice_Nombre = o.Equipo_Apu_Indice_Nombre;
            this._ManoObra_Apu_Indice_Codigo = o.ManoObra_Apu_Indice_Codigo;
            this._ManoObra_Apu_Indice_Nombre = o.ManoObra_Apu_Indice_Nombre;
            this._Apu_Mano_Obra_Codigo = o.Apu_Mano_Obra_Codigo;
            this._Apu_Mano_Obra_Nombre = o.Apu_Mano_Obra_Nombre;
            this._Int_Sucursal_Codigo = o.Int_Sucursal_Codigo;
            this._Int_Sucursal_Nombre = o.Int_Sucursal_Nombre;
            this._Int_Empresa_Id = o.Int_Empresa_Id;
            this._Int_Empresa_Codigo = o.Int_Empresa_Codigo;
            this._Int_Empresa_Nombre = o.Int_Empresa_Nombre;
            this._Estado_Nombre = o.Estado_Nombre;
            this._Apu_Subtitulo_Codigo = o.Apu_Subtitulo_Codigo;
            this._Apu_Subtitulo_Nombre = o.Apu_Subtitulo_Nombre;
        }
    }
}
