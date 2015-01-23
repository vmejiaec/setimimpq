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
        private string _Proyecto;
        private string _Producto;
        private string _Actividad;
        private string _Tarea;
        private string _Partida_Codigo_0;
        private string _Partida_Codigo_1;
        private string _Partida_Codigo_2;
        private string _Partida_Nombre_0;
        private string _Partida_Nombre_1;
        private string _Partida_Nombre_2;
        private decimal _Partida_Valor_0;
        private decimal _Partida_Valor_1;
        private decimal _Partida_Valor_2;

        private string _Per_Personal_Id_Solicita_Pie_Firma_Nombre;
        private string _Per_Personal_Id_Solicita_Pie_Firma_Cargo;
        private string _Per_Personal_Id_Contrata_Pie_Firma_Cargo;
        private string _Per_Personal_Id_Contrata_Pie_Firma_Nombre;
        private string _Per_Personal_Id_Planifica_Pie_Firma_Cargo;
        private string _Per_Personal_Id_Planifica_Pie_Firma_Nombre;        

        public string Per_Personal_Id_Solicita_Pie_Firma_Cargo
        {
            get { return _Per_Personal_Id_Solicita_Pie_Firma_Cargo; }
            set { _Per_Personal_Id_Solicita_Pie_Firma_Cargo = value; }
        }        

        public string Per_Personal_Id_Planifica_Pie_Firma_Nombre
        {
            get { return _Per_Personal_Id_Planifica_Pie_Firma_Nombre; }
            set { _Per_Personal_Id_Planifica_Pie_Firma_Nombre = value; }
        }
        

        public string Per_Personal_Id_Planifica_Pie_Firma_Cargo
        {
            get { return _Per_Personal_Id_Planifica_Pie_Firma_Cargo; }
            set { _Per_Personal_Id_Planifica_Pie_Firma_Cargo = value; }
        }
        

        public string Per_Personal_Id_Contrata_Pie_Firma_Nombre
        {
            get { return _Per_Personal_Id_Contrata_Pie_Firma_Nombre; }
            set { _Per_Personal_Id_Contrata_Pie_Firma_Nombre = value; }
        }
        

        public string Per_Personal_Id_Contrata_Pie_Firma_Cargo
        {
            get { return _Per_Personal_Id_Contrata_Pie_Firma_Cargo; }
            set { _Per_Personal_Id_Contrata_Pie_Firma_Cargo = value; }
        }

        public string Per_Personal_Id_Solicita_Pie_Firma_Nombre
        {
            get { return _Per_Personal_Id_Solicita_Pie_Firma_Nombre; }
            set { _Per_Personal_Id_Solicita_Pie_Firma_Nombre = value; }
        }
        public string Programa
        {
            get { return _Programa; }
            set { _Programa = value; }
        }        

        public string Proyecto
        {
            get { return _Proyecto; }
            set { _Proyecto = value; }
        }        

        public string Producto
        {
            get { return _Producto; }
            set { _Producto = value; }
        }        

        public string Actividad
        {
            get { return _Actividad; }
            set { _Actividad = value; }
        }        

        public string Tarea
        {
            get { return _Tarea; }
            set { _Tarea = value; }
        }        

        public string Partida_Codigo_0
        {
            get { return _Partida_Codigo_0; }
            set { _Partida_Codigo_0 = value; }
        }
        

        public string Partida_Codigo_1
        {
            get { return _Partida_Codigo_1; }
            set { _Partida_Codigo_1 = value; }
        }
        

        public string Partida_Codigo_2
        {
            get { return _Partida_Codigo_2; }
            set { _Partida_Codigo_2 = value; }
        }
        

        public string Partida_Nombre_0
        {
            get { return _Partida_Nombre_0; }
            set { _Partida_Nombre_0 = value; }
        }
        

        public string Partida_Nombre_1
        {
            get { return _Partida_Nombre_1; }
            set { _Partida_Nombre_1 = value; }
        }
        

        public string Partida_Nombre_2
        {
            get { return _Partida_Nombre_2; }
            set { _Partida_Nombre_2 = value; }
        }
        

        public decimal Partida_Valor_0
        {
            get { return _Partida_Valor_0; }
            set { _Partida_Valor_0 = value; }
        }
        

        public decimal Partida_Valor_1
        {
            get { return _Partida_Valor_1; }
            set { _Partida_Valor_1 = value; }
        }
        

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
            // Pongo los pies de firma
            CEL.PLA.DO_Pla_PersonalDatos adpPersonalDatos = new DO_Pla_PersonalDatos();
            //    Persona Solicita
            var listaPerDatSolicita = adpPersonalDatos.GetByPer_Personal_Id(new Scope(), this.Per_Personal_Id_Solicita);
            var filaPerDatSolicita = listaPerDatSolicita[0];
            this.Per_Personal_Id_Solicita_Pie_Firma_Nombre = filaPerDatSolicita.Pie_Firma_Nombre;
            this.Per_Personal_Id_Solicita_Pie_Firma_Cargo = filaPerDatSolicita.Pie_Firma_Cargo;
            //    Persona Planifica
            var listaPerDatPlanifica = adpPersonalDatos.GetByPer_Personal_Id(new Scope(), this.Per_Personal_Id_Planifica);
            if (listaPerDatPlanifica.Count != 0)
            {
                var filaPerDatPlanifica = listaPerDatPlanifica[0];
                this.Per_Personal_Id_Planifica_Pie_Firma_Nombre = filaPerDatPlanifica.Pie_Firma_Nombre;
                this.Per_Personal_Id_Planifica_Pie_Firma_Cargo = filaPerDatPlanifica.Pie_Firma_Cargo;
            }
            //    Persona Contrata
            var listaPerDatContrata = adpPersonalDatos.GetByPer_Personal_Id(new Scope(), this.Per_Personal_Id_Contrata);
            if (listaPerDatContrata.Count != 0)
            {
                var filaPerDatContrata = listaPerDatContrata[0];
                this.Per_Personal_Id_Contrata_Pie_Firma_Nombre = filaPerDatContrata.Pie_Firma_Nombre;
                this.Per_Personal_Id_Contrata_Pie_Firma_Cargo = filaPerDatContrata.Pie_Firma_Cargo;
            }
        }

        // Métodos para formatear los textos
        public string Llena_TextoSolicita()
        { 
            string Plantilla = 
                "Yo, {0} en mi calidad de {1}, " +
                "solicito de usted se sirva emitir certificación POA, PAC y "+
                "certificación presupuestaria de la siguiente contratación: {2} " +
                "por un valor de: USD$ {3:N2}, más IVA.";
            string TextoLleno = String.Format(Plantilla,
                //this.Per_Personal_Nombre_Solicita.ToUpper(),
                this.Per_Personal_Id_Solicita_Pie_Firma_Nombre.ToUpper(),
                this.Per_Personal_Id_Solicita_Pie_Firma_Cargo,
                //this.Area_Nombre_Solicita.ToUpper(),
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
                "que la  contratación  mencionada  por el (la) " +
                "{1}, {2} se encuentra contemplada en el POA,  de acuerdo al siguiente detalle: ";
            string TextoLleno = String.Format(Plantilla,
                this.Per_Personal_Nombre_Planifica.ToUpper(),
                //this.Area_Nombre_Solicita.ToUpper(),
                this.Per_Personal_Id_Solicita_Pie_Firma_Cargo,
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
                "la contratación requerida por el área: {1}, {2} se encuentra contemplada en " +
                "el PAC,  línea N° {3} y Código CPC: {4}";
            string TextoLleno = String.Format(Plantilla,
                //this.Per_Personal_Nombre_Contrata.ToUpper(),
                this.Per_Personal_Id_Contrata_Pie_Firma_Nombre,
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