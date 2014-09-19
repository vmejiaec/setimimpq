using System;
using System.Collections.Generic;
using System.Text;

namespace ZMGR
{
    public class FON_Oferta_Rubro
    {
        public int _Codigo_Rubro;
        public String _Rubro;
        public Decimal _Volumen;
        public Decimal _Costo_Usd;
        public String _Unidad;
        // Insumos del rubro
        public List<FON_Oferta_Rubro_Material> _Mat = new List<FON_Oferta_Rubro_Material>();
        public List<FON_Oferta_Rubro_Maquinaria> _Maq = new List<FON_Oferta_Rubro_Maquinaria>();
        public List<FON_Oferta_Rubro_ManoObra> _Man = new List<FON_Oferta_Rubro_ManoObra>();
    }
}
