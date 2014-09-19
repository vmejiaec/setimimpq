using System;
using System.Collections.Generic;
using System.Text;


namespace Koala.KoalaWebControls
{
    
    public class KControlEventArgs : EventArgs
    {
        private Exception _excepcion;

        public Exception Excepcion
        {
            get { return _excepcion; }
        }

        private bool _excepcionManejada;

        public bool ExcepcionManejada
        {
            get { return _excepcionManejada; }
            set { _excepcionManejada = value; }
        }

        public KControlEventArgs (Exception excepcion)
        {
            if (excepcion == null)
            {
                _excepcion = null;
                _excepcionManejada = true;
            }
            else
            {
                _excepcion = excepcion;
                _excepcionManejada = false;
            }
        }

        public KControlEventArgs ()
        {
            _excepcion = null;
            _excepcionManejada = true;
        }
    }

}
