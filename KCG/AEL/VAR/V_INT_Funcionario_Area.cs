using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AEL.VAR
{
    public class V_INT_Funcionario_Area
    {
        public string Area_Codigo { get; set; }
        public string Area_Nombre { get; set; }
        public string Persona_Codigo { get; set; }
        public string Persona_Nombre { get; set; }
        public string Persona_Cargo { get; set; }
        public string Persona_Usuario { get; set; }
        public string Persona_Password { get; set; }

        public V_INT_Funcionario_Area(
            string Area_Codigo,
            string Area_Nombre,
            string Persona_Codigo,
            string Persona_Nombre,
            string Persona_Cargo,
            string Persona_Usuario,
            string Persona_Password
            )
        {
            this.Area_Codigo = Area_Codigo;
            this.Area_Nombre = Area_Nombre;
            this.Persona_Codigo = Persona_Codigo;
            this.Persona_Nombre = Persona_Nombre;
            this.Persona_Cargo = Persona_Cargo;
            this.Persona_Usuario = Persona_Usuario;
            this.Persona_Password = Persona_Password;
        }

        public V_INT_Funcionario_Area()
        { }
    }
}
