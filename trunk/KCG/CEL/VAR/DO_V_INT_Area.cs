using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.VariosTableAdapters;
using AEL.VAR;
using BEL;

namespace CEL.VAR
{
    public class DO_V_INT_Area
    {
        // adapter
        public V_INT_AreaTableAdapter adp = new V_INT_AreaTableAdapter();
        // Select
        public List<V_INT_Area> Get(Scope s) {
            List<V_INT_Area> lista = new List<V_INT_Area>();
            var tabla = adp.Get();
            foreach(var fila in tabla)
            {
                lista.Add( new V_INT_Area(
                    fila.Codigo,
                    fila.Nombre
                    )
                );
            }
            return lista;
        }
        // Select por código
        public List<V_INT_Area> GetByCodigo(Scope s, string Codigo) {
            List<V_INT_Area> lista = new List<V_INT_Area>();
            var tabla = adp.GetByCodigo(Codigo);
            foreach(var fila in tabla)
            {
                lista.Add( new V_INT_Area(
                    fila.Codigo,
                    fila.Nombre
                    )
                );
            }
            return lista;
        }
    }
}
