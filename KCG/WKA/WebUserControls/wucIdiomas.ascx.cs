using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.VER;
using HER;

public partial class wucIdiomas : System.Web.UI.UserControl
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {   
            //Cargo el menu de los idiomas
            //Cargo el combo de version 
            List<Ver_Version> dtblversion = new List<Ver_Version>();
            dtblversion = LeerVersion();
            ddlIdiomas.DataSource = LeerVersion();
            ddlIdiomas.DataBind();
            Scope s = (Scope)Session["Scope"];
            ddlIdiomas.SelectedValue = s.Ver_Version_Id.ToString();
        }
    }

    private List<Ver_Version> LeerVersion()
    {
        //Cargo el combo de version 
        Scope s = (Scope)Session["Scope"];

        BO_Ver_Version version = new BO_Ver_Version();
        List<Ver_Version> dtblversion = new List<Ver_Version>();
        dtblversion = version.Get("Nombre",s);
        return dtblversion;
    }

    protected void ddlIdiomas_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ver_id = ddlIdiomas.SelectedValue.ToString();

        List<Ver_Version> dtaVersiones = LeerVersion();
        
        for(int i=0 ;i< dtaVersiones.Count;i++)
        {
            if(ver_id==dtaVersiones[i].Id)
            {
                Session["lenguaje"] = dtaVersiones[i].Abreviatura;
            }
        }
        Scope s = (Scope) Session["Scope"];
        s.Ver_Version_Id = ver_id;

        Response.Redirect(Request.FilePath);
    }
}
