using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using BEL;
using HER;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_APROBACION_ESTADO
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_APROBACION_ESTADO : System.Web.Services.WebService
    {

        [WebMethod]
        public bool Ejecutar(Scope s, string p_Accion, string p_Objeto, string p_Campo, string p_Id, string p_Proceso)
        {
            try
            {
                return APR.AP_Ejecutar.Ejecutar(s, p_Accion, p_Objeto, p_Campo, p_Id, p_Proceso);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
    }
}
