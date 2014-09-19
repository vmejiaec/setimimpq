using System;
using System.Collections.Generic;
using System.Text;

namespace FEL.META
{
    public class BO_META
    {
        #region  Adapter
        private static WS_META _Adapter;
        /// <summary>
        /// Acceso al servicio
        /// </summary>
        public static WS_META Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new WS_META();
                return _Adapter;
            }
        }
        #endregion
        public static int DIC_MANTENIMIENTO_PAR_PAGINACION (Scope s)
        {
            return Adapter.DIC_MANTENIMIENTO_PAR_PAGINACION(s);
            
        }
        public static int APR_MANTENIMIENTO_DOC_ESTADO(Scope s)
        {
            return Adapter.APR_MANTENIMIENTO_DOC_ESTADO(s);

        }
        public static int PAR_MANTENIMIENTO_MENSAJE(Scope s)
        {
            return Adapter.PAR_MANTENIMIENTO_MENSAJE(s);

        }
        public static int APR_MANTENIMIENTO_DOCUMENTO(Scope s)
        {
            return Adapter.APR_MANTENIMIENTO_DOCUMENTO(s);

        }

        public static int DIC_MANTENIMIENTO_DOMINIO(Scope s)
        {
            return Adapter.DIC_MANTENIMIENTO_DOMINIO(s);

        }
        public static int DIC_MANTENIMIENTO_ROTULO(Scope s)
        {
            return Adapter.DIC_MANTENIMIENTO_ROTULO(s);

        }


        public static int AUD_MANTENIMIENTO_PAR_AUDITORIA(Scope s)
        {
            return Adapter.AUD_MANTENIMIENTO_PAR_AUDITORIA(s);

        }

        public static int VER_MANTENIMIENTO_VERSION(Scope s)
        {
            return Adapter.VER_MANTENIMIENTO_VERSION(s);

        }

        public static string VER_VERSION_EXISTE_REGISTROS(Scope s,string VersionPredeterminada)
        {
            return Adapter.VER_VERSION_EXISTE_REGISTROS(s,VersionPredeterminada);

        }
    }
}
