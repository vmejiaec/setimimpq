using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using CEL.HIS;
using BEL;
using AEL.HIS;
using System.Collections.Generic;
using HER;

namespace EWS
{
    /// <summary>
    /// Summary description for WS_HIS1
    /// </summary>
    [WebService(Namespace = "http://koala.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class WS_HIS : System.Web.Services.WebService
    {

        #region Servicios para His_Historico
        // Objeto permanente para acceso a DO_His_Historico
        private DO_His_Historico _His_Historico;
        /// <summary>
        /// La propiedad para acceso a DO_His_Historico
        /// </summary>
        public DO_His_Historico His_Historico
        {
            get
            {
                if (_His_Historico == null)
                    _His_Historico = new DO_His_Historico();
                return _His_Historico;
            }
        }

        #region Obtención  de Datos
        [WebMethod]
        public List<His_Historico> His_Historico_Get(Scope s)
        {
            return His_Historico.Get(s);
        }
        /// <summary>
        /// Retorna todos los datos de His_Historico
        /// </summary>
        /// <returns>Todos los registros de His_Historico </returns>

        #endregion
        #region  Operaciones con datos de la tabla His_Historico
        /// <summary>
        /// Borra el objeto de His_Historico
        /// </summary>
        /// <param name="o">El objeto a borrar</param>
        /// <returns></returns>
        [WebMethod]
        public string His_Historico_Insert(Scope s, His_Historico o)
        {
            try
            {
                return His_Historico.Insert(s, o);
            }
            catch (Exception e)
            {
                throw Error.ConstruirExcepcion(e, Context.Request.Url.AbsoluteUri);
            }
        }
        /// <summary>
        /// Inserta el objeto en His_Historico
        /// </summary>
        /// <param name="s"></param>
        /// <param name="o">El objeto a insertar</param>
        /// <returns></returns>


        #endregion
        #endregion

    }
}