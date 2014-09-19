using System;
using System.Collections.Generic;
using System.Text;

namespace FEL.APROBACION
{
    public class BO_Aprobacion_Estado
    {
        #region  Adapter
        private WS_APROBACION_ESTADO _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public WS_APROBACION_ESTADO Adapter
        {
            get
            {
                if (_Adapter == null)
                {
                    _Adapter = new WS_APROBACION_ESTADO();
                    _Adapter.Timeout = -1;
                }
                return _Adapter;
            }
        }
        #endregion

        public bool Ejecutar(Scope s, string p_Accion, string p_Objeto, string p_Campo, string p_Id, string p_Proceso)
        {
            return Adapter.Ejecutar(s, p_Accion, p_Objeto, p_Campo, p_Id, p_Proceso);
        }
    }
}
