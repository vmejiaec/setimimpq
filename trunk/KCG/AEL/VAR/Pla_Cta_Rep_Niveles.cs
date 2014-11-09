using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AEL.VAR
{
    public class Pla_Cta_Rep_Niveles
    {
        int _Id;
        string _Codigo;
        string _Nivel01;
        string _Nivel02;
        string _Nivel03;
        string _Nivel04;
        string _Nombre;
        DateTime _Fecha_Ini;
        DateTime _Fecha_Fin;
        string _Estado;
        decimal _Valor_Inicial;
        decimal _Valor_Suma;
        decimal _Valor_Suma_Movs_Reasignacion;
        decimal _Valor_Suma_Movs_Certificados;
        
        // Constructor
        public Pla_Cta_Rep_Niveles()
        { }
        //
        public Pla_Cta_Rep_Niveles(
            int p_Id,
            string p_Codigo,
            string p_Nivel01,
            string p_Nivel02,
            string p_Nivel03,
            string p_Nivel04,
            string p_Nombre,
            DateTime p_Fecha_Ini,
            DateTime p_Fecha_Fin,
            string p_Estado,
            decimal p_Valor_Inicial,
            decimal p_Valor_Suma,
            decimal p_Valor_Suma_Movs_Reasignacion,
            decimal p_Valor_Suma_Movs_Certificados
            )
        {
            this.Id = p_Id;
            this.Codigo = p_Codigo;
            this.Nivel01 = p_Nivel01;
            this.Nivel02 = p_Nivel02;
            this.Nivel03 = p_Nivel03;
            this.Nivel04 = p_Nivel04;
            this.Nombre = p_Nombre;
            this.Fecha_Ini = p_Fecha_Ini;
            this.Fecha_Fin = p_Fecha_Fin;
            this.Estado = p_Estado;
            this.Valor_Inicial = p_Valor_Inicial;
            this.Valor_Suma = p_Valor_Suma;
            this.Valor_Suma_Movs_Reasignacion = p_Valor_Suma_Movs_Reasignacion;
            this.Valor_Suma_Movs_Certificados = p_Valor_Suma_Movs_Certificados;
        }

        //

        public decimal Valor_Suma_Movs_Certificados
        {
            get { return _Valor_Suma_Movs_Certificados; }
            set { _Valor_Suma_Movs_Certificados = value; }
        }

        public decimal Valor_Suma_Movs_Reasignacion
        {
            get { return _Valor_Suma_Movs_Reasignacion; }
            set { _Valor_Suma_Movs_Reasignacion = value; }
        }

        public decimal Valor_Suma
        {
            get { return _Valor_Suma; }
            set { _Valor_Suma = value; }
        }

        public decimal Valor_Inicial
        {
            get { return _Valor_Inicial; }
            set { _Valor_Inicial = value; }
        }

        public string Estado
        {
            get { return _Estado; }
            set { _Estado = value; }
        }

        public DateTime Fecha_Fin
        {
            get { return _Fecha_Fin; }
            set { _Fecha_Fin = value; }
        }

        public DateTime Fecha_Ini
        {
            get { return _Fecha_Ini; }
            set { _Fecha_Ini = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public string Nivel04
        {
            get { return _Nivel04; }
            set { _Nivel04 = value; }
        }

        public string Nivel03
        {
            get { return _Nivel03; }
            set { _Nivel03 = value; }
        }

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }
        public string Codigo
        {
            get { return _Codigo; }
            set { _Codigo = value; }
        }

        public string Nivel01
        {
            get { return _Nivel01; }
            set { _Nivel01 = value; }
        }
        public string Nivel02
        {
            get { return _Nivel02; }
            set { _Nivel02 = value; }
        }
    }
}
