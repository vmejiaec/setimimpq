using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CEL.PLA;
using BEL;
using AEL.PLA;

namespace REL.COM
{
    public class REL_Com_Contrato_Perfil : AEL.COM.Com_Contrato
    {
        // Atributos adicionales
        //[@pr_Persona_Elaborado_Nombre]
        //[@pr_Persona_Administrador_Nombre]
        //[@pr_Persona_Aprobado_Nombre]

        string _Programa;

        public string Programa
        {
            get { return _Programa; }
            set { _Programa = value; }
        }
        string _Proyecto;

        public string Proyecto
        {
            get { return _Proyecto; }
            set { _Proyecto = value; }
        }
        string _Producto;

        public string Producto
        {
            get { return _Producto; }
            set { _Producto = value; }
        }
        string _Actividad;

        public string Actividad
        {
            get { return _Actividad; }
            set { _Actividad = value; }
        }

        string _Persona_Elaborado_Pie_Firma_Nombre;

        public string Persona_Elaborado_Pie_Firma_Nombre
        {
            get { return _Persona_Elaborado_Pie_Firma_Nombre; }
            set { _Persona_Elaborado_Pie_Firma_Nombre = value; }
        }
        string _Persona_Elaborado_Pie_Firma_Cargo;

        public string Persona_Elaborado_Pie_Firma_Cargo
        {
            get { return _Persona_Elaborado_Pie_Firma_Cargo; }
            set { _Persona_Elaborado_Pie_Firma_Cargo = value; }
        }

        string _Persona_Administrador_Pie_Firma_Nombre;

        public string Persona_Administrador_Pie_Firma_Nombre
        {
            get { return _Persona_Administrador_Pie_Firma_Nombre; }
            set { _Persona_Administrador_Pie_Firma_Nombre = value; }
        }
        string _Persona_Administrador_Pie_Firma_Cargo;

        public string Persona_Administrador_Pie_Firma_Cargo
        {
            get { return _Persona_Administrador_Pie_Firma_Cargo; }
            set { _Persona_Administrador_Pie_Firma_Cargo = value; }
        }

        string _Persona_Aprobado_Pie_Firma_Nombre;

        public string Persona_Aprobado_Pie_Firma_Nombre
        {
            get { return _Persona_Aprobado_Pie_Firma_Nombre; }
            set { _Persona_Aprobado_Pie_Firma_Nombre = value; }
        }
        string _Persona_Aprobado_Pie_Firma_Cargo;

        public string Persona_Aprobado_Pie_Firma_Cargo
        {
            get { return _Persona_Aprobado_Pie_Firma_Cargo; }
            set { _Persona_Aprobado_Pie_Firma_Cargo = value; }
        }

        private string _Partida_Codigo_0 = "";
        private string _Partida_Codigo_1 = "";
        private string _Partida_Codigo_2 = "";
        private string _Partida_Nombre_0 = "";
        private string _Partida_Nombre_1 = "";
        private string _Partida_Nombre_2 = "";
        private decimal _Partida_Valor_0 ;
        private decimal _Partida_Valor_1 ;
        private decimal _Partida_Valor_2 ;

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

        // Constructor
        public REL_Com_Contrato_Perfil(AEL.COM.Com_Contrato o)
        {
            this.Id = o.Id;
            this.Pla_Doc_Id = o.Pla_Doc_Id;
            this.Estado = o.Estado;
            this.Com_Procedimiento_Id = o.Com_Procedimiento_Id;
            this.Porcentaje_Anticipo_Ref = o.Porcentaje_Anticipo_Ref;
            this.Plazo_Ref = o.Plazo_Ref;
            this.Codigo_Sercop = o.Codigo_Sercop;
            this.Per_Personal_Resp_Exp = o.Per_Personal_Resp_Exp;
            this.Fecha_Cierre_Rec_Ofertas = o.Fecha_Cierre_Rec_Ofertas;
            this.Par_Razon_Social_Id_Contratista = o.Par_Razon_Social_Id_Contratista;
            this.Valor_Contrato = o.Valor_Contrato;
            this.Plazo_Contrato = o.Plazo_Contrato;
            this.Fecha_Inicio_Contrato = o.Fecha_Inicio_Contrato;
            this.Porcentaje_Anticipo_Contrato = o.Porcentaje_Anticipo_Contrato;
            this.Per_Personal_Id_Admin = o.Per_Personal_Id_Admin;
            this.Desc_Contrata = o.Desc_Contrata;
            this.Fecha_Crea = o.Fecha_Crea;
            this.Pla_Tarea_Id = o.Pla_Tarea_Id;
            this.Pla_Tarea_Codigo = o.Pla_Tarea_Codigo;
            this.Pla_Tarea_Nombre = o.Pla_Tarea_Nombre;
            this.Per_Personal_Nombre_Admin = o.Per_Personal_Nombre_Admin;
            this.Valor_Suma_Movs = o.Valor_Suma_Movs;
            this.Com_Procedimiento_Tipo = o.Com_Procedimiento_Tipo;
            this.Com_Procedimiento_Nombre = o.Com_Procedimiento_Nombre;
            this.Per_Personal_Nombre_Resp_Exp = o.Per_Personal_Nombre_Resp_Exp;
            this.Per_Personal_Id_Solicita = o.Per_Personal_Id_Solicita;
            this.Per_Personal_Nombre_Solicita = o.Per_Personal_Nombre_Solicita;
            this.Par_Razon_Social_Nombre_Contratista = o.Par_Razon_Social_Nombre_Contratista;
            this.Par_Razon_Social_Numero_Contratista = o.Par_Razon_Social_Numero_Contratista;
            this.Pla_Doc_Cedula_Presup_Codigo = o.Pla_Doc_Cedula_Presup_Codigo;
            this.Pla_Doc_CPC_Codigo = o.Pla_Doc_CPC_Codigo;
            this.Pla_Doc_PAC_Linea = o.Pla_Doc_PAC_Linea;
            this.Pla_Doc_Codigo = o.Pla_Doc_Codigo;
            this.Pla_Cta_Id = o.Pla_Cta_Id;
            this.Pla_Cta_Codigo = o.Pla_Cta_Codigo;
            this.Pla_Cta_Nombre = o.Pla_Cta_Nombre;
            this.Pla_Doc_Valor_Solicita = o.Pla_Doc_Valor_Solicita;
            this.Com_Procedimiento_Desc = o.Com_Procedimiento_Desc;
            this.Estado_Portal = o.Estado_Portal;
            this.Estado_Contratacion = o.Estado_Contratacion;
            this.Fecha_Inicio_Elabora_Pliegos = o.Fecha_Inicio_Elabora_Pliegos;
            this.Fecha_Publicacion_Portal = o.Fecha_Publicacion_Portal;
            this.Fecha_Calificaciones = o.Fecha_Calificaciones;
            this.Fecha_Estimada_Adjudicacion = o.Fecha_Estimada_Adjudicacion;
            this.Fecha_Adjudicacion = o.Fecha_Adjudicacion;
            this.Fecha_Juridico = o.Fecha_Juridico;

            //Carga los pies de firma
            // Pongo los pies de firma
            CEL.PLA.DO_Pla_PersonalDatos adpPerDat = new DO_Pla_PersonalDatos();
            // Elaborado Por
            List<Pla_PersonalDatos> listaPerDat = new List<Pla_PersonalDatos>();
            Pla_PersonalDatos filaPerDat = new Pla_PersonalDatos();
            if (!string.IsNullOrEmpty(this.Per_Personal_Resp_Exp))
            {
                listaPerDat = adpPerDat.GetByPer_Personal_Id(new Scope(), this.Per_Personal_Resp_Exp);
                filaPerDat = listaPerDat[0];
                this.Persona_Elaborado_Pie_Firma_Nombre = filaPerDat.Pie_Firma_Nombre;
                this.Persona_Elaborado_Pie_Firma_Cargo = filaPerDat.Pie_Firma_Cargo;
            }
            // Administrador
            if (!string.IsNullOrEmpty(this.Per_Personal_Id_Admin))
            {
                listaPerDat = adpPerDat.GetByPer_Personal_Id(new Scope(), this.Per_Personal_Id_Admin);
                filaPerDat = listaPerDat[0];
                this.Persona_Administrador_Pie_Firma_Nombre = filaPerDat.Pie_Firma_Nombre;
                this.Persona_Administrador_Pie_Firma_Cargo = filaPerDat.Pie_Firma_Cargo;
            }
            // Aprobado por
            // Buscamos el director del area solicitante
            CEL.PLA.DO_Pla_Doc adpDoc = new DO_Pla_Doc();
            var listaDoc = adpDoc.GetById(new Scope(), this.Pla_Doc_Id);
            var filaDoc = listaDoc[0];
            listaPerDat = adpPerDat.GetByPer_Personal_Id(new Scope(), filaDoc.Per_Personal_Id_Solicita);
            filaPerDat = listaPerDat[0];
            this.Persona_Aprobado_Pie_Firma_Nombre = filaPerDat.Pie_Firma_Nombre;
            this.Persona_Aprobado_Pie_Firma_Cargo = filaPerDat.Pie_Firma_Cargo;

            // Obtengo el arbol
            CEL.PLA.DO_Pla_Cta adpCta = new DO_Pla_Cta();
            var listaArbol = adpCta.GetByAnioArbolPla_Tarea_Id(new Scope(), filaDoc.Pla_Tarea_Id );
            // Pongo los datos de programa, proyecto, producto y actividad
            this.Programa = listaArbol[0].Nombre;
            this.Proyecto = listaArbol[1].Nombre;
            this.Producto = listaArbol[2].Nombre;
            this.Actividad = listaArbol[3].Nombre;
            // Consulto los movimientos
            CEL.PLA.DO_Pla_Mov adpMov = new DO_Pla_Mov();
            var listaMov = adpMov.GetByPla_Doc_Id(new Scope(), this.Pla_Doc_Id );
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
}
