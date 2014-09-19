using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Web.UI.WebControls;
using AEL.APU;
using BEL;
using REL.APU;
using Microsoft.Reporting.WebForms;

namespace WKA_Rep
{
    public partial class APU_RUBRO_LISTADO : KPaginaReporte
    {
        Scope s;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///Seteo del Idioma
            DateTimeFormatInfo dfi = new DateTimeFormatInfo();
            CultureInfo ci = new CultureInfo("es-ES");

            //Capturo los valores de dia mes y año
            DateTime dl = DateTime.Now.Date;
            string dia_nombre = dl.ToString("dddd", ci);
            string mes_nombre = dl.ToString("m", ci);
            string anio = dl.Year.ToString();
            string fecha = dia_nombre + ", " + mes_nombre + " del " + anio;

            s = Scope_Factory.Get(Request.QueryString);
            Session["Scope"] = s;
            Session["Int_Empresa_Id"] = s.Int_Empresa_Id;            
            ReportParameter[] parametros = new ReportParameter[4];
            if (!IsPostBack)
            {
                parametros[0] = new ReportParameter("pr_dat_empresa_nombre", s.Int_Empresa_Nombre);
                parametros[1] = new ReportParameter("pr_dat_sucursal_nombre", s.Int_Sucursal_Nombre);
                parametros[2] = new ReportParameter("pr_dat_fecha", fecha);
                parametros[3] = new ReportParameter("pr_dat_empresa_imagen", ObtenerUrlCompleta(Empresa.Imagen));

                rpApuListadoRubro.LocalReport.SetParameters(parametros);
                rpApuListadoRubro.LocalReport.SubreportProcessing += new SubreportProcessingEventHandler(LocalReport_SubreportProcessingTecnica);                
                rpApuListadoRubro.LocalReport.Refresh();
            }
        }

        void LocalReport_SubreportProcessingTecnica(object sender, SubreportProcessingEventArgs e)
        {
            switch(e.ReportPath)
            {
                case "APU_RUBRO_LISTADO_TECNICA":
                {
                    // Datos de Rubro Técnica           
                    DataTable dtbRubroTecnica = RO_Apu_Rubro_Tecnica.GetByRubro(s, e.Parameters["pr_dat_apu_rubro_id"].Values[0], s.Par_Servidor_Id);
                    e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], dtbRubroTecnica));
                    break;
                }
                case "APU_RUBRO_LISTADO_EQUIPO":
                {
                    // Datos de Rubro Equipo
                    DataTable dtbRubroEquipo = RO_Apu_Rubro_Equipo.GetByRubro(s, e.Parameters["pr_dat_apu_rubro_id"].Values[0]);
                    e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], dtbRubroEquipo));
                    break;
                }
                case "APU_RUBRO_LISTADO_MANO_OBRA":
                {
                    // Datos de Rubro Mano Obra
                    DataTable dtbRubroManoObra = RO_Apu_Rubro_Mano_Obra.GetByRubro(s, e.Parameters["pr_dat_apu_rubro_id"].Values[0]);
                    e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], dtbRubroManoObra));
                    break;
                }
                case "APU_RUBRO_LISTADO_MATERIALES":
                {
                    // Datos de Rubro Material
                    DataTable dtbRubroMaterial = RO_Apu_Rubro_Material.GetByRubro(s, e.Parameters["pr_dat_apu_rubro_id"].Values[0]);
                    e.DataSources.Add(new ReportDataSource(e.DataSourceNames[0], dtbRubroMaterial));
                    break;
                }
            }
        }
    }
}
