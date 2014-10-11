using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.VariosTableAdapters;
using AEL.VAR;
using BEL;

namespace CEL.VAR
{
    public class DO_V_INT_Funcionario_Area
    {
        // adapter
        public V_INT_Funcionario_AreaTableAdapter adp = new V_INT_Funcionario_AreaTableAdapter();
        // Select
        public List<V_INT_Funcionario_Area> Get(Scope s) {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>();
            var tabla = adp.Get();
            foreach (var fila in tabla)
            {
                lista.Add(new V_INT_Funcionario_Area(
                    fila.Area_Codigo,
                    fila.Area_Nombre,
                    fila.Persona_Codigo,
                    fila.Persona_Nombre,
                    fila.Persona_Cargo,
                    fila.Persona_Usuario,
                    fila.Persona_Password
                ));
            }
            return lista;
        }
        // Select los funcionarios que faltan de crear en el sistema
        public List<V_INT_Funcionario_Area> GetByFaltanEnRazonSocial(Scope s)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>();
            var tabla = adp.GetByFaltanEnRazonSocial();
            foreach (var fila in tabla)
            {
                lista.Add(new V_INT_Funcionario_Area(
                    fila.Area_Codigo,
                    fila.Area_Nombre,
                    fila.Persona_Codigo,
                    fila.Persona_Nombre,
                    fila.Persona_Cargo,
                    fila.Persona_Usuario,
                    fila.Persona_Password
                ));
            }
            return lista;
        }
        // Select un funcionario por su código
        public List<V_INT_Funcionario_Area> GetByPersona_Codigo(Scope s, string p_Persona_Codigo)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>();
            var tabla = adp.GetByPersona_Codigo(p_Persona_Codigo);
            foreach (var fila in tabla)
            {
                lista.Add(new V_INT_Funcionario_Area(
                    fila.Area_Codigo,
                    fila.Area_Nombre,
                    fila.Persona_Codigo,
                    fila.Persona_Nombre,
                    fila.Persona_Cargo,
                    fila.Persona_Usuario,
                    fila.Persona_Password
                ));
            }
            return lista;
        }
        // Select los funcionarios de coinciden con su nombre
        public List<V_INT_Funcionario_Area> GetByLikePersona_Nombre(Scope s, string p_Persona_Nombre)
        {
            List<V_INT_Funcionario_Area> lista = new List<V_INT_Funcionario_Area>();
            var tabla = adp.GetByLikePersona_Nombre(p_Persona_Nombre);
            foreach (var fila in tabla)
            {
                lista.Add(new V_INT_Funcionario_Area(
                    fila.Area_Codigo,
                    fila.Area_Nombre,
                    fila.Persona_Codigo,
                    fila.Persona_Nombre,
                    fila.Persona_Cargo,
                    fila.Persona_Usuario,
                    fila.Persona_Password
                ));
            }
            return lista;
        }
    }
}
