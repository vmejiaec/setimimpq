using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using AEL.EST;
using BEL;
using CEL.EST;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_EST
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_EST : System.Web.Services.WebService
    {
        # region Servicio para Est_Menu_Arbol
        // Objeto permanente para acceso a DO_Par_Mensaje
        private DO_Est_Menu_Arbol _Est_Menu_Arbol ;
        /// <summary>
        /// La propiedad para acceso a DO_Par_Mensaje
        /// </summary>
        private DO_Est_Menu_Arbol Est_Menu_Arbol
        {
            get
            {
                if (_Est_Menu_Arbol == null)
                    _Est_Menu_Arbol = new DO_Est_Menu_Arbol();
                return _Est_Menu_Arbol;
            }
        }
        # region Obtención de Datos
        [WebMethod]
        public List<Est_Menu_Arbol> Est_Menu_Arbol_Get(Scope s)
        {
            return Est_Menu_Arbol.Get(s);
        }
        #endregion
        #endregion
    }
}
