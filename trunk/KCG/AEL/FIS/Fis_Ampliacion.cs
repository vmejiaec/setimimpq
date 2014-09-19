
using System;
using System.Collections.Generic;
using System.Text;
namespace AEL.FIS
{
    public class Fis_Ampliacion : Entidad
    {
        // Atributos
        private String _Descripcion;
        private String _Apu_Presupuesto_Id;
        private DateTime _Fecha_Autorizacion;
        private Int32 _Plazo_Dias;
        private Int32 _Plazo_Total_Prorroga;
        private DateTime _Fecha_Final_Prorroga;
        private String _Estado_Nombre;

        // Propiedades de la clase
        public String Descripcion
        {
            get { return _Descripcion; }
            set { _Descripcion = value; }
        }

        public String Apu_Presupuesto_Id
        {
            get { return _Apu_Presupuesto_Id; }
            set { _Apu_Presupuesto_Id = value; }
        }

        public DateTime Fecha_Autorizacion
        {
            get { return _Fecha_Autorizacion; }
            set { _Fecha_Autorizacion = value; }
        }

        public Int32 Plazo_Dias
        {
            get { return _Plazo_Dias; }
            set { _Plazo_Dias = value; }
        }

        public Int32 Plazo_Total_Prorroga
        {
            get { return _Plazo_Total_Prorroga; }
            set { _Plazo_Total_Prorroga = value; }
        }

        public DateTime Fecha_Final_Prorroga
        {
            get { return _Fecha_Final_Prorroga; }
            set { _Fecha_Final_Prorroga = value; }
        }

        public String Estado_Nombre
        {
            get { return _Estado_Nombre; }
            set { _Estado_Nombre = value; }
        }

        // Constructor
        public Fis_Ampliacion()
        {
        }
        public Fis_Ampliacion(String _Id, String _Codigo, String _Nombre, String _Estado, String _Descripcion, String _Apu_Presupuesto_Id, DateTime _Fecha_Autorizacion, Int32 _Plazo_Dias, Int32 _Plazo_Total_Prorroga, DateTime _Fecha_Final_Prorroga, String _Estado_Nombre)
        {
            this.Id = _Id;
            this.Codigo = _Codigo;
            this.Nombre = _Nombre;
            this.Estado = _Estado;
            this._Descripcion = _Descripcion;
            this._Apu_Presupuesto_Id = _Apu_Presupuesto_Id;
            this._Fecha_Autorizacion = _Fecha_Autorizacion;
            this._Plazo_Dias = _Plazo_Dias;
            this._Plazo_Total_Prorroga = _Plazo_Total_Prorroga;
            this._Fecha_Final_Prorroga = _Fecha_Final_Prorroga;
            this._Estado_Nombre = _Estado_Nombre;
        }
        public Fis_Ampliacion(Fis_Ampliacion o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nombre = o.Nombre;
            this.Estado = o.Estado;
            this._Descripcion = o.Descripcion;
            this._Apu_Presupuesto_Id = o.Apu_Presupuesto_Id;
            this._Fecha_Autorizacion = o.Fecha_Autorizacion;
            this._Plazo_Dias = o.Plazo_Dias;
            this._Plazo_Total_Prorroga = o.Plazo_Total_Prorroga;
            this._Fecha_Final_Prorroga = o.Fecha_Final_Prorroga;
            this._Estado_Nombre = o.Estado_Nombre;
        }
    }
}
