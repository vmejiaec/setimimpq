using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using CEL.PLA;
using BEL;
using AEL.PLA;

namespace REL.PLA
{
    public class REL_Pla_Doc : AEL.PLA.Pla_Doc
    { 
        // Atributos para el reporte
        private string _Programa;

        public string Programa
        {
            get { return _Programa; }
            set { _Programa = value; }
        }
        private string _Proyecto;

        public string Proyecto
        {
            get { return _Proyecto; }
            set { _Proyecto = value; }
        }
        private string _Producto;

        public string Producto
        {
            get { return _Producto; }
            set { _Producto = value; }
        }
        private string _Actividad;

        public string Actividad
        {
            get { return _Actividad; }
            set { _Actividad = value; }
        }
        private string _Tarea;

        public string Tarea
        {
            get { return _Tarea; }
            set { _Tarea = value; }
        }
        private string _Partida_Codigo_0;

        public string Partida_Codigo_0
        {
            get { return _Partida_Codigo_0; }
            set { _Partida_Codigo_0 = value; }
        }
        private string _Partida_Codigo_1;

        public string Partida_Codigo_1
        {
            get { return _Partida_Codigo_1; }
            set { _Partida_Codigo_1 = value; }
        }
        private string _Partida_Codigo_2;

        public string Partida_Codigo_2
        {
            get { return _Partida_Codigo_2; }
            set { _Partida_Codigo_2 = value; }
        }
        private string _Partida_Nombre_0;

        public string Partida_Nombre_0
        {
            get { return _Partida_Nombre_0; }
            set { _Partida_Nombre_0 = value; }
        }
        private string _Partida_Nombre_1;

        public string Partida_Nombre_1
        {
            get { return _Partida_Nombre_1; }
            set { _Partida_Nombre_1 = value; }
        }
        private string _Partida_Nombre_2;

        public string Partida_Nombre_2
        {
            get { return _Partida_Nombre_2; }
            set { _Partida_Nombre_2 = value; }
        }
        private decimal _Partida_Valor_0;

        public decimal Partida_Valor_0
        {
            get { return _Partida_Valor_0; }
            set { _Partida_Valor_0 = value; }
        }
        private decimal _Partida_Valor_1;

        public decimal Partida_Valor_1
        {
            get { return _Partida_Valor_1; }
            set { _Partida_Valor_1 = value; }
        }
        private decimal _Partida_Valor_2;

        public decimal Partida_Valor_2
        {
            get { return _Partida_Valor_2; }
            set { _Partida_Valor_2 = value; }
        }

        // Constructor que crea los datos para el reporte
        public REL_Pla_Doc()
        {
            Consulta_Datos();
        }

        public string TextoSolicita
        {
            get { return Llena_TextoSolicita(); }            
        }

        public string TextoPlanifica
        {
            get { return Llena_TextoPlanifica(); }
        }

        public string TextoContrata
        {
            get { return Llena_TextoContrata(); }
        }

        // Obtener el arbol de cuentas
        public void Consulta_Datos()
        {
            int p_Pla_Tarea_Id;
            // Scope
            Scope s = new Scope();
            // Consulto los movimientos
            CEL.PLA.DO_Pla_Mov adpMov = new DO_Pla_Mov();
            var listaMov = adpMov.GetByPla_Doc_Id(s, this.Id);
            if (listaMov.Count > 0)
            {
                // Obtengo la tarea del primer movimiento bajo el supuesto que 
                // todos los movimientos de este POA son de la misma tares
                var filaMov = listaMov[0];
                p_Pla_Tarea_Id = filaMov.Pla_Tarea_Id;
                this.Tarea = filaMov.Pla_Tarea_Nombre;
                // Obtengo el arbol
                CEL.PLA.DO_Pla_Cta adpCta = new DO_Pla_Cta();
                var listaArbol = adpCta.GetByAnioArbolPla_Tarea_Id(s, p_Pla_Tarea_Id);
                // Pongo los datos de programa, proyecto, producto y actividad
                this.Programa = listaArbol[0].Nombre;
                this.Proyecto = listaArbol[1].Nombre;
                this.Producto = listaArbol[2].Nombre;
                this.Actividad = listaArbol[3].Nombre;
                // Pongo los datos de partidas 
                this.Partida_Codigo_0 = listaMov[0].Pla_Partida_Codigo;
                this.Partida_Nombre_0 = listaMov[0].Pla_Partida_Nombre;
                this.Partida_Valor_0 = listaMov[0].Valor;
                if (listaMov.Count() > 1)
                {
                    this.Partida_Codigo_1 = listaMov[1].Pla_Partida_Codigo;
                    this.Partida_Nombre_1 = listaMov[1].Pla_Partida_Nombre;
                    this.Partida_Valor_1 = listaMov[1].Valor;
                }
                if (listaMov.Count() > 2)
                {
                    this.Partida_Codigo_2 = listaMov[2].Pla_Partida_Codigo;
                    this.Partida_Nombre_2 = listaMov[2].Pla_Partida_Nombre;
                    this.Partida_Valor_2 = listaMov[2].Valor;
                }
            }
        }

        // Métodos para formatear los textos
        public string Llena_TextoSolicita()
        { 
            string Plantilla = 
                "Yo, {0} en mi calidad de Director(a) de {1}, " +
                "solicito de usted se sirva emitir certificación POA, PAC y "+
                "certificación presupuestaria de la siguiente contratación: {2} " +
                "por un valor de: USD$ {3}, más IVA.";
            string TextoLleno = String.Format(Plantilla,
                this.Per_Personal_Nombre_Solicita.ToUpper(),
                this.Area_Nombre_Solicita.ToUpper(),
                this.Descripcion.ToUpper(),
                this.Valor_Solicita
                );
            return TextoLleno;
        }

        public string Llena_TextoPlanifica()
        {
            //Conversión del SIP o NOP, a, SI y NO
            string sEsta_Planificada = "";
            switch (this.Esta_Planificada)
            {
                case "PEN": sEsta_Planificada = ""; break;
                case "SIP": sEsta_Planificada = "SI"; break;
                case "NOP": sEsta_Planificada = "NO"; break;
            }
            //
            string Plantilla =
                "Yo, {0},  en  calidad de Jefe(a)  de  Planificación,  certifico " +
                "que la  contratación  mencionada  por el (la)  Director(a) de " +
                "{1}, {2} se encuentra contemplada en el POA,  de acuerdo al siguiente detalle: ";
            string TextoLleno = String.Format(Plantilla,
                this.Per_Personal_Nombre_Planifica.ToUpper(),
                this.Area_Nombre_Solicita.ToUpper(),
                sEsta_Planificada
                );
            return TextoLleno;
        }

        public string Llena_TextoContrata()
        {
            //Conversión del SIP o NOP, a, SI y NO
            string sEsta_Contrata = "";
            switch(this.Esta_Contratada)
            {
                case "PEN": sEsta_Contrata = ""; break;
                case "SIC": sEsta_Contrata = "SI"; break;
                case "NOC": sEsta_Contrata = "NO"; break;
            }
            //
            string Plantilla =
                "Yo, {0} en mi calidad de Responsable de la Unidad de Contratación,  certifico que " +
                "la contratación requerida por la Dirección de {1}, {2} se encuentra contemplada en " +
                "el PAC,  línea N° {3} y Código CPC: {4}";
            string TextoLleno = String.Format(Plantilla,
                this.Per_Personal_Nombre_Contrata.ToUpper(),
                this.Area_Nombre_Solicita.ToUpper(),
                sEsta_Contrata,
                this.PAC_Linea,
                this.CPC_Codigo
                );
            return TextoLleno;
        }

        // Constructor para transformar la clase CEL en la REL 
        public REL_Pla_Doc(AEL.PLA.Pla_Doc o)
        {
            this.Id = o.Id;
            this.Codigo = o.Codigo;
            this.Tipo = o.Tipo;
            this.Fecha_Solicita = o.Fecha_Solicita;
            this.Per_Personal_Id_Solicita = o.Per_Personal_Id_Solicita;
            this.Area_Codigo_Solicita = o.Area_Codigo_Solicita;
            this.Descripcion = o.Descripcion;
            this.Estado = o.Estado;
            this.Per_Personal_Id_Crea = o.Per_Personal_Id_Crea;
            this.Per_Personal_Id_Modifica = o.Per_Personal_Id_Modifica;
            this.Valor_Solicita = o.Valor_Solicita;
            this.Per_Personal_Id_Planifica = o.Per_Personal_Id_Planifica;
            this.Esta_Planificada = o.Esta_Planificada;
            this.Per_Personal_Id_Contrata = o.Per_Personal_Id_Contrata;
            this.Esta_Contratada = o.Esta_Contratada;
            this.PAC_Linea = o.PAC_Linea;
            this.CPC_Codigo = o.CPC_Codigo;
            this.Fecha_Contrata = o.Fecha_Contrata;
            this.Fecha_Planifica = o.Fecha_Planifica;
            this.Per_Personal_Nombre_Solicita = o.Per_Personal_Nombre_Solicita;
            this.Area_Nombre_Solicita = o.Area_Nombre_Solicita;
            this.Per_Personal_Nombre_Crea = o.Per_Personal_Nombre_Crea;
            this.Per_Personal_Nombre_Modifica = o.Per_Personal_Nombre_Modifica;
            this.Per_Personal_Nombre_Planifica = o.Per_Personal_Nombre_Planifica;
            this.Per_Personal_Nombre_Contrata = o.Per_Personal_Nombre_Contrata;
            this.Valor_Suma_Movs = o.Valor_Suma_Movs;
            this.Cedula_Presup_Codigo = o.Cedula_Presup_Codigo;
            this.Contrata_Desc = o.Contrata_Desc;
            // Consulta el resto de datos para el reporte
            Consulta_Datos();
        }
    }
}