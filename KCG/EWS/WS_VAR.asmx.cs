using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

using CEL.VAR;
using AEL.VAR;
using BEL;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_VAR
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WS_VAR : System.Web.Services.WebService
    {
        #region Servicios para VAR_V_INT_Funcionarios_Area
        private DO_V_INT_Funcionario_Area adpVAR_V_INT_Funcionario_Area;
        public DO_V_INT_Funcionario_Area AdpVAR_V_INT_Funcionario_Area
        {
            get
            {
                if (adpVAR_V_INT_Funcionario_Area == null)
                    adpVAR_V_INT_Funcionario_Area = new DO_V_INT_Funcionario_Area();
                return adpVAR_V_INT_Funcionario_Area;
            }
        }
        [WebMethod]
        public List<V_INT_Funcionario_Area> V_INT_Funcionario_Area_Get(Scope s)
        {
            return AdpVAR_V_INT_Funcionario_Area.Get(s);
        }
        [WebMethod]
        public List<V_INT_Funcionario_Area> V_INT_Funcionario_Area_GetByFaltanEnRazonSocial(Scope s)
        {
            return AdpVAR_V_INT_Funcionario_Area.GetByFaltanEnRazonSocial(s);
        }
        [WebMethod]
        public List<V_INT_Funcionario_Area> V_INT_Funcionario_Area_GetByLikePersona_Nombre(Scope s, string p_Persona_Nombre)
        {
            return AdpVAR_V_INT_Funcionario_Area.GetByLikePersona_Nombre(s,p_Persona_Nombre);
        }
        [WebMethod]
        public List<V_INT_Funcionario_Area> V_INT_Funcionario_Area_GetByPersona_Codigo(Scope s, string p_Persona_Codigo)
        {
            return AdpVAR_V_INT_Funcionario_Area.GetByPersona_Codigo(s, p_Persona_Codigo);
        }
        [WebMethod]
        public string V_INT_Funcionario_Area_Insert(Scope s, V_INT_Funcionario_Area n)
        {
            return DEL.VAR.DO_V_INT_Funcionario_Area.Insert(s, n);
        }
        #endregion

        #region V_INT_Area
        private DO_V_INT_Area adpVAR_V_INT_Area;
        public DO_V_INT_Area AdpVAR_V_INT_Area
        {
            get
            {
                if (adpVAR_V_INT_Area == null)
                    adpVAR_V_INT_Area = new DO_V_INT_Area();
                return adpVAR_V_INT_Area;
            }
        }
        [WebMethod]
        public List<V_INT_Area> V_INT_Area_Get(Scope s)
        {
            return AdpVAR_V_INT_Area.Get(s);
        }
        [WebMethod]
        public List<V_INT_Area> V_INT_Area_GetByCodigo(Scope s, string Codigo)
        {
            return AdpVAR_V_INT_Area.GetByCodigo(s, Codigo);
        }
        #endregion
    }
}
