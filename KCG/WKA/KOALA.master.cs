using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using HER;
using System.Collections.Generic;

public partial class KOALA : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnAyuda.OnClientClick = HER.DirectorioAyuda.ObtenerAyudaScript();
            KPagina pagina = ContentPlaceHolder1.Page as KPagina;
            btnAtras.Enabled = pagina.RutaNavegacionManager.ExisteSaltoAtras;
            btnAdelante.Enabled = pagina.RutaNavegacionManager.ExiteSaltoAdelante;
            VersionarBotones();
        }
        btnAtras.Click += new ImageClickEventHandler(btnAtras_Click);
        btnAdelante.Click += new ImageClickEventHandler(btnAdelante_Click);        
    }

    void btnAdelante_Click(object sender, ImageClickEventArgs e)
    {
        KPagina pagina = ContentPlaceHolder1.Page as KPagina;
        pagina.RutaNavegacionManager.IrAdelante();
    }

    void btnAtras_Click(object sender, ImageClickEventArgs e)
    {
        KPagina pagina = ContentPlaceHolder1.Page as KPagina;
        pagina.RutaNavegacionManager.IrAtras();
    }

    void VersionarBotones()
    {
        btnAtras.AccessKey = GetLocalResourceObject("Tec_AnteriorRecursoKCG.AccesKey").ToString();
        btnAdelante.AccessKey = GetLocalResourceObject("Tec_SiguienteRecursoKCG.AccesKey").ToString();
        btnAyuda.AccessKey = GetLocalResourceObject("Tec_AyudaRecursoKCG.AccesKey").ToString();
    }
}
