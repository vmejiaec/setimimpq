using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using BEL;
using META;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_META
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_META : System.Web.Services.WebService
    {

        [WebMethod]
        public int DIC_MANTENIMIENTO_PAR_PAGINACION(Scope s)
        {
            return Meta.DIC_MANTENIMIENTO_PAR_PAGINACION(s);
        }
        [WebMethod]
        public int APR_MANTENIMIENTO_DOC_ESTADO(Scope s)
        {
            return Meta.APR_MANTENIMIENTO_DOC_ESTADO(s);
        }
        
            [WebMethod]
        public int PAR_MANTENIMIENTO_MENSAJE(Scope s)
        {
            return Meta.PAR_MANTENIMIENTO_MENSAJE(s);
        }
        [WebMethod]
        public int APR_MANTENIMIENTO_DOCUMENTO(Scope s)
        {
            return Meta.APR_MANTENIMIENTO_DOCUMENTO(s);
        }
        
        [WebMethod]
        public int DIC_MANTENIMIENTO_DOMINIO(Scope s)
        {
            return Meta.DIC_MANTENIMIENTO_DOMINIO(s);
        }
        [WebMethod]
        public int DIC_MANTENIMIENTO_ROTULO(Scope s)
        {
            return Meta.DIC_MANTENIMIENTO_ROTULO(s);
        }
        
             [WebMethod]
        public int AUD_MANTENIMIENTO_PAR_AUDITORIA(Scope s)
        {
            return Meta.AUD_MANTENIMIENTO_PAR_AUDITORIA(s);
        }
           [WebMethod]
        public int VER_MANTENIMIENTO_VERSION(Scope s)
        {
            return Meta.VER_MANTENIMIENTO_VERSION(s);
        }
        
               [WebMethod]
        public string VER_VERSION_EXISTE_REGISTROS(Scope s,string  VersionPredeterminada)
        {
            return Meta.VER_VERSION_EXISTE_REGISTROS(s,VersionPredeterminada);
        }
    }
}
