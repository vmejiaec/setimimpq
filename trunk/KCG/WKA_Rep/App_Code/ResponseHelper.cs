using System;
using System.Web;
using System.Web.UI;

namespace WKA_Rep
{
    public class ResponseHelper
    {
        public static void Redirect(string url, string target, string windowFeatures)
        {
            HttpContext context = HttpContext.Current;


            if ((String.IsNullOrEmpty(target) ||
                 target.Equals("_self", StringComparison.OrdinalIgnoreCase)) &&
                String.IsNullOrEmpty(windowFeatures))
            {
                context.Response.Redirect(url);
            }

            else
            {
                Page page = (Page) context.Handler;

                if (page == null)
                {
                    throw new InvalidOperationException(
                        "Cannot redirect to new window outside Page context.");
                }

                url = page.ResolveClientUrl(url);


                string script;

                if (!String.IsNullOrEmpty(windowFeatures))
                {
                    script = @"window.open(""{0}"", ""{1}"", ""{2}"");";
                }

                else
                {
                    script = @"window.open(""{0}"", ""{1}"");";
                }


                script = String.Format(script, url, target, windowFeatures);

                ScriptManager.RegisterStartupScript(page,
                                                    typeof (Page),
                                                    "Redirect",
                                                    script,
                                                    true);
            }
        }

        public static void Redirect(string url)
        {
            Redirect(url, "_blank", "with=1000, height=600,toolbar=no,menubar=no");
        }
    }
}