using System;
using System.Web.UI;
using BEL;

namespace WKA_Rep
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Verificar si el scope existe en Sessión, usarlo,
                // caso contrario, crear nuevo.
                Scope s = new Scope();
                s.Ver_Version_Id = "1";
                s.Int_Empresa_Id = "1";
                s.Int_Empresa_Nombre = "MUNICIPIO DEL DISTRITO METROPOLITANO DE QUITO";
                s.Int_Sucursal_Id = "1";
                s.Int_Sucursal_Nombre = "FONDO DE SALVAMENTO";
                s.Int_Usuario_Id = "6";
                s.Int_Usuario_Nombre = "Usuario Nombre";
                s.Par_Servidor_Id = "1";
                Session["Scope"] = s;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_RUBRO_REPORTE.aspx" +
                                    Scope_Factory.Get_QueryString(s));

        }

        protected void Button17_Click(object sender, EventArgs e)
        {
            //Scope s = (Scope) Session["Scope"];
            //ResponseHelper.Redirect("http://localhost:1773/APU_RUBRO_REPORTE.aspx" +
            //                        Scope_Factory.Get_QueryString(s));

            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_RUBRO_LISTADO.aspx" +
                                    Scope_Factory.Get_QueryString(s));
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_RUBRO_BASICO_REPORTE.aspx" +
                                   Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
                                    
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
             Scope s = (Scope)Session["Scope"];
             ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_RUBRO_REPORTE.aspx" +
                                    Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_RUBRO_TECNICA_REPORTE.aspx" +
                                    Scope_Factory.Get_QueryString(s)+
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_RUBRO_MATERIAL_REPORTE.aspx" +
                                    //Scope_Factory.Get_QueryString(s));
                                    Scope_Factory.Get_QueryString(s)+
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
                                    
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_RUBRO_INSUMO_REPORTE.aspx" +
                                 Scope_Factory.Get_QueryString(s)+
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_INDICE_REPORTE.aspx" +
                                    Scope_Factory.Get_QueryString(s)+
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
                                    
                                    

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_PROYECTO_CUADRILLA_REPORTE.aspx" +
                                   Scope_Factory.Get_QueryString(s)+
                                    "&Apu_Proyecto_Codigo=" + tb_Apu_Proyecto_Id.Text);
            

        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_RUBRO_REPORTE.aspx" +
              Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_RUBRO_BASICO_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);

        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_RUBRO_MATERIAL_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_RUBRO_INSUMO_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
             Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_INDICE_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);
        
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_OFERTA_CUADRILLA_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Oferta_Codigo=" + tb_Apu_Oferta_Id.Text);

        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_RUBRO_INSUMO_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Rubro_Codigo=" + tb_Apu_Oferta_Id.Text);
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            Scope s = (Scope)Session["Scope"];
            ResponseHelper.Redirect("http://localhost:1773/APU_RUBRO_INSUMO_BASICO_REPORTE.aspx" +
               Scope_Factory.Get_QueryString(s) +
                                    "&Apu_Rubro_Codigo=" + tb_Apu_Oferta_Id.Text);
        }
        
    }
}