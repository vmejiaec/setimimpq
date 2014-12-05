using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using BEL;

namespace DEL.VAR
{
    /// <summary>
    /// Construye un diccionario con los datos de un contrato
    /// </summary>
    public class DO_Com_Contrato_Info
    {

        // Atributos y propiedades
        string key;

        public string Key
        {
            get { return key; }
            set { key = value; }
        }
        string valor;

        public string Valor
        {
            get { return valor; }
            set { valor = value; }
        }

        //Constructor
        public DO_Com_Contrato_Info()
        { }

        public DO_Com_Contrato_Info(string _Key, string _Valor)
        {
            this.Key = _Key;
            this.Valor = _Valor;
        }

        // Métodos Get
        public List<DO_Com_Contrato_Info> GetByCom_Contrato_Id(int Com_Contrato_Id)
        {
            List<DO_Com_Contrato_Info> datos = new List<DO_Com_Contrato_Info>();
            Scope s = new Scope();
            // Consulto el contrato
            CEL.COM.DO_Com_Contrato adpCon = new CEL.COM.DO_Com_Contrato();
            var listaCon = adpCon.GetById(s, Com_Contrato_Id);
            if (listaCon.Count == 0) return null;
            var oCon = listaCon[0];
            // Consulto los datos del contrato_Legal
            CEL.COM.DO_Com_Contrato_Legal adpConLegal = new CEL.COM.DO_Com_Contrato_Legal();
            var listaConLegal = adpConLegal.GetByCom_Contrato_Id(s, Com_Contrato_Id);
            AEL.COM.Com_Contrato_Legal oConLegal = new AEL.COM.Com_Contrato_Legal();
            if (listaConLegal.Count == 0)
                oConLegal = null;
            else
                oConLegal = listaConLegal[0];
            // Consulto los datos de Doc
            // ...
            // Consulto el representante legal
            CEL.PLA.DO_Pla_Param adpParam = new CEL.PLA.DO_Pla_Param();
            var oParam = adpParam.Get(s)[0];
            // Prepara algunas HERramientas
            HER.EscribirEnteroALetras oNumeroALetras = new HER.EscribirEnteroALetras();
            // Alimento los datos
            datos.Add( new DO_Com_Contrato_Info( "Nombre del Proyecto",                    oCon.Pla_Tarea_Nombre));
            datos.Add( new DO_Com_Contrato_Info( "Representante Legal",                    oParam.Rep_Legal_Pie_Firma_Nombre));
            datos.Add( new DO_Com_Contrato_Info( "Código SERCOP",                          oCon.Codigo_Sercop));
            datos.Add( new DO_Com_Contrato_Info( "Nombre del Contratista",                 oCon.Par_Razon_Social_Nombre_Contratista));
            datos.Add( new DO_Com_Contrato_Info( "RUC del Contratista",                    oCon.Par_Razon_Social_Numero_Contratista));
            datos.Add( new DO_Com_Contrato_Info( "Plazo del Contrato",                     string.Format("{0}", oCon.Plazo_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Plazo del Contrato en Letras",           oNumeroALetras.FormatoParaEnteros(oCon.Plazo_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Valor del Contrato",                     string.Format("{0:N2}", oCon.Valor_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Valor del Contrato en Letras",           oNumeroALetras.FormatoParaContrato(oCon.Valor_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Porcentaje del Anticipo",                string.Format("{0:#0.##%}", oCon.Porcentaje_Anticipo_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Porcentaje del Anticipo en Letras",      oNumeroALetras.FormatoParaProcentajes(oCon.Porcentaje_Anticipo_Contrato)));
            datos.Add( new DO_Com_Contrato_Info( "Tipo de Procedimiento SERCOP",           oCon.Com_Procedimiento_Nombre));
            datos.Add( new DO_Com_Contrato_Info( "Código de la Cédula Presupuestaria",     oCon.Pla_Doc_Cedula_Presup_Codigo));
            datos.Add( new DO_Com_Contrato_Info( "Código CPC",                             oCon.Pla_Doc_CPC_Codigo));
            datos.Add( new DO_Com_Contrato_Info( "Número de Línea del PAC",                oCon.Pla_Doc_PAC_Linea));

            // Consulta el representante legal
            datos.Add(new DO_Com_Contrato_Info(  "Representante Legal",                     oParam.Rep_Legal_Pie_Firma_Nombre));
            // Fecha del contrato ingresada en la pantalla legal
            if(oConLegal != null)
                datos.Add(new DO_Com_Contrato_Info("Fecha del Contrato", string.Format("{0:D}", oConLegal.Fecha_Contrato)));
            else
                datos.Add(new DO_Com_Contrato_Info("Fecha del Contrato", "Sin fecha"));

            return datos;
        }

        // Métodos Get Meta Datos
        public List<DO_Com_Contrato_Info> GetCampos()
        {
            List<DO_Com_Contrato_Info> campos = new List<DO_Com_Contrato_Info>();
            // Alimento con los campos
            campos.Add(new DO_Com_Contrato_Info("c00", ""));
            campos.Add(new DO_Com_Contrato_Info("c01", "Nombre del Proyecto"));
            campos.Add(new DO_Com_Contrato_Info("c02", "Representante Legal"));
            campos.Add(new DO_Com_Contrato_Info("c03", "Código SERCOP"));
            campos.Add(new DO_Com_Contrato_Info("c04", "Nombre del Contratista"));
            campos.Add(new DO_Com_Contrato_Info("c05", "RUC del Contratista"));
            campos.Add(new DO_Com_Contrato_Info("c06", "Plazo del Contrato"));
            campos.Add(new DO_Com_Contrato_Info("c07", "Plazo del Contrato en Letras"));
            campos.Add(new DO_Com_Contrato_Info("c08", "Valor del Contrato"));
            campos.Add(new DO_Com_Contrato_Info("c09", "Valor del Contrato en Letras"));
            campos.Add(new DO_Com_Contrato_Info("c10", "Porcentaje del Anticipo"));
            campos.Add(new DO_Com_Contrato_Info("c11", "Porcentaje del Anticipo en Letras"));
            campos.Add(new DO_Com_Contrato_Info("c12", "Tipo de Procedimiento SERCOP"));
            campos.Add(new DO_Com_Contrato_Info("c13", "Código de la Cédula Presupuestaria"));
            campos.Add(new DO_Com_Contrato_Info("c14", "Código CPC"));
            campos.Add(new DO_Com_Contrato_Info("c15", "Número de Línea del PAC"));
            campos.Add(new DO_Com_Contrato_Info("c16", "Representante Legal"));
            campos.Add(new DO_Com_Contrato_Info("c17", "Fecha del Contrato"));
            //
            return campos;
        }
    }
}
