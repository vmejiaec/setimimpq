using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace WKC
{
    public class BasePage : System.Web.UI.Page
    {
        public BasePage()
        {

        }

        protected override void InitializeCulture()
        {
            
            if (Request.QueryString["lenguaje"] != null)
            {
                UICulture = Request.QueryString["lenguaje"];
            }

            base.InitializeCulture();
        }


       
    }
}
