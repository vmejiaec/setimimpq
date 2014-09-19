using System;
using System.Collections.Generic;
using System.Text;

namespace ZMGR
{
    class FON_Oferta
    {
        // Atributos
        public int _Codigo_Oferta;
        public String _Oferta;
        public int _Porcentaje;
        public String _Ofertante;
        public DateTime _Fecha_Creacion;


        // Constructores
        public FON_Oferta()
        {
            _Codigo_Oferta = 0;
            _Oferta = "";
            _Porcentaje = 0;
            _Ofertante = "";
            _Fecha_Creacion = DateTime.Now;
        }
        public FON_Oferta(
            int Codigo_Oferta,
            String Oferta,
            int Porcentaje,
            String Ofertante,
            DateTime Fecha_Creacion)
        {
            _Codigo_Oferta = Codigo_Oferta;
            _Oferta = Oferta;
            _Porcentaje = Porcentaje;
            _Ofertante = Ofertante;
            _Fecha_Creacion = Fecha_Creacion;
        }
    }
}
