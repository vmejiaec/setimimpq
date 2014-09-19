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
using System.IO;

namespace WKC.VER
{
    public partial class browse : System.Web.UI.Page
    {
        string strPathDirectorio = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
                string strDir = Request.QueryString["d"];
                
                string strParent = strDir.Substring(0, strDir.LastIndexOf("\\"));
                strParent += strParent.EndsWith(":") ? "\\" : "";
                upLink.NavigateUrl = "browse.aspx?d=" + strParent;
                txtCurrentDir.Text = "Address: <b>" + strDir + "</b>";
                DirectoryInfo DirInfo = new DirectoryInfo(strDir);
                DirectoryInfo[] subDirs = DirInfo.GetDirectories();
                FileInfo[] Files = DirInfo.GetFiles();
                txtListing.Text = "<table>";
                for (int i = 0; i <= subDirs.Length - 1; i++)
                {
                    txtListing.Text += "<tr><td><img src='../Images/folder.gif' /><a href='browse.aspx?d=" + subDirs[i].FullName + "' class='entry'>" + subDirs[i].Name + "</a></td><td valign='bottom'>" + subDirs[i].LastWriteTime + "</td></tr>";
                    //strPathDirectorio = subDirs[i].FullName + subDirs[i].Name + subDirs[i].LastWriteTime;
                    strPathDirectorio = subDirs[i].FullName;
                }
                           
                txtListing.Text += "</table>";

            
           
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            Session["PathDirectorio"] = strPathDirectorio;
            Response.Write("<script language=javascript>close()</javascript>");
            

        }
    }
}
