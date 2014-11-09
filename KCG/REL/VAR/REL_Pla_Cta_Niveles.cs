using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace REL.VAR
{
    public class REL_Pla_Cta_Niveles: AEL.VAR.Pla_Cta_Rep_Niveles
    {
        // Propiedades para construir los niveles
        // Nivel 01
        int _Nivel01_Pla_Cta_Id;
        string _Nivel01_Pla_Cta_Codigo;
        string _Nivel01_Pla_Cta_Nombre;
        // Nivel 02
        int _Nivel02_Pla_Cta_Id;
        string _Nivel02_Pla_Cta_Codigo;
        string _Nivel02_Pla_Cta_Nombre;
        // Nivel 03
        int _Nivel03_Pla_Cta_Id;
        string _Nivel03_Pla_Cta_Codigo;
        string _Nivel03_Pla_Cta_Nombre;
        // Nivel 04
        int _Nivel04_Pla_Cta_Id;
        string _Nivel04_Pla_Cta_Codigo;
        string _Nivel04_Pla_Cta_Nombre;
        // Constructor
        public REL_Pla_Cta_Niveles()
        { }
        public REL_Pla_Cta_Niveles(AEL.VAR.Pla_Cta_Rep_Niveles o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Nivel01 = o.Nivel01;
            this.Nivel02 = o.Nivel02;
            this.Nivel03 = o.Nivel03;
            this.Nivel04 = o.Nivel04;
            this.Nombre = o.Nombre;
            this.Fecha_Ini = o.Fecha_Ini;
            this.Fecha_Fin = o.Fecha_Fin;
            this.Estado = o.Estado;
            this.Valor_Inicial = o.Valor_Inicial;
            this.Valor_Suma = o.Valor_Suma;
            this.Valor_Suma_Movs_Reasignacion = o.Valor_Suma_Movs_Reasignacion;
            this.Valor_Suma_Movs_Certificados = o.Valor_Suma_Movs_Certificados;
            // Construye los niveles
            string[] separador = new string[1];
            separador[0] = "<|>";
            //    Nivel 1
            string[] datNivel01 = this.Nivel01.Split(separador, System.StringSplitOptions.None);
            this.Nivel01_Pla_Cta_Id = Int32.Parse(datNivel01[0]);
            this.Nivel01_Pla_Cta_Codigo = datNivel01[1];
            this.Nivel01_Pla_Cta_Nombre = datNivel01[2];
            //    Nivel 2
            string[] datNivel02 = this.Nivel02.Split(separador, System.StringSplitOptions.None);
            this.Nivel02_Pla_Cta_Id = Int32.Parse(datNivel02[0]);
            this.Nivel02_Pla_Cta_Codigo = datNivel02[1];
            this.Nivel02_Pla_Cta_Nombre = datNivel02[2];
            //    Nivel 3
            string[] datNivel03 = this.Nivel03.Split(separador, System.StringSplitOptions.None);
            this.Nivel03_Pla_Cta_Id = Int32.Parse(datNivel03[0]);
            this.Nivel03_Pla_Cta_Codigo = datNivel03[1];
            this.Nivel03_Pla_Cta_Nombre = datNivel03[2];
            //    Nivel 4
            string[] datNivel04 = this.Nivel04.Split(separador, System.StringSplitOptions.None);
            this.Nivel04_Pla_Cta_Id = Int32.Parse(datNivel04[0]);
            this.Nivel04_Pla_Cta_Codigo = datNivel04[1];
            this.Nivel04_Pla_Cta_Nombre = datNivel04[2];
        }
        // Propiedades para Niveles
        public string Nivel04_Pla_Cta_Nombre
        {
            get { return _Nivel04_Pla_Cta_Nombre; }
            set { _Nivel04_Pla_Cta_Nombre = value; }
        }

        public string Nivel04_Pla_Cta_Codigo
        {
            get { return _Nivel04_Pla_Cta_Codigo; }
            set { _Nivel04_Pla_Cta_Codigo = value; }
        }

        public int Nivel04_Pla_Cta_Id
        {
            get { return _Nivel04_Pla_Cta_Id; }
            set { _Nivel04_Pla_Cta_Id = value; }
        }

        public string Nivel03_Pla_Cta_Nombre
        {
            get { return _Nivel03_Pla_Cta_Nombre; }
            set { _Nivel03_Pla_Cta_Nombre = value; }
        }

        public string Nivel03_Pla_Cta_Codigo
        {
            get { return _Nivel03_Pla_Cta_Codigo; }
            set { _Nivel03_Pla_Cta_Codigo = value; }
        }

        public int Nivel03_Pla_Cta_Id
        {
            get { return _Nivel03_Pla_Cta_Id; }
            set { _Nivel03_Pla_Cta_Id = value; }
        }

        public string Nivel02_Pla_Cta_Nombre
        {
            get { return _Nivel02_Pla_Cta_Nombre; }
            set { _Nivel02_Pla_Cta_Nombre = value; }
        }
        
        public string Nivel02_Pla_Cta_Codigo
        {
            get { return _Nivel02_Pla_Cta_Codigo; }
            set { _Nivel02_Pla_Cta_Codigo = value; }
        }

        public int Nivel02_Pla_Cta_Id
        {
            get { return _Nivel02_Pla_Cta_Id; }
            set { _Nivel02_Pla_Cta_Id = value; }
        }

        public string Nivel01_Pla_Cta_Nombre
        {
            get { return _Nivel01_Pla_Cta_Nombre; }
            set { _Nivel01_Pla_Cta_Nombre = value; }
        }
        public int Nivel01_Pla_Cta_Id
        {
            get { return _Nivel01_Pla_Cta_Id; }
            set { _Nivel01_Pla_Cta_Id = value; }
        }
        public string Nivel01_Pla_Cta_Codigo
        {
            get { return _Nivel01_Pla_Cta_Codigo; }
            set { _Nivel01_Pla_Cta_Codigo = value; }
        }
    }
}
