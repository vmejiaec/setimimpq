using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Runtime.Remoting;
using System.Text;
using AEL;
using BEL;

namespace APR
{
    public class AP_Ejecutar
    {
        public static bool Ejecutar(Scope s, string p_Accion, string p_Objeto,
            string p_Campo, string p_Id, string p_Proceso)
        {
            Type tipoObjeto = ObtenerTipoAprobacion(p_Objeto);
            IAPR iAprobacion = (IAPR)Activator.CreateInstance(tipoObjeto);
            object objetoo = iAprobacion.GetById(s, p_Id);

            switch (p_Accion)
            {
                case "ADELANTE":
                    return iAprobacion.Adelante(s, objetoo, p_Proceso);
                case "ATRAS":
                    return iAprobacion.Atras(s, objetoo, p_Proceso);
            }
            return false;
        }

        private const string BUSINESS_ASSEMBLY = "APR.AP_";
        private static Type ObtenerTipoAprobacion(string p_Objeto)
        {
            Type type = null;
            Assembly assembly = System.Reflection.Assembly.GetExecutingAssembly();
            if (assembly == null)
                throw new Exception("No se puede encontrar el ensamblado en AP_Ejecutar");

            string tipoNombre = BUSINESS_ASSEMBLY + p_Objeto;
            type = assembly.GetType(tipoNombre);
            if (type == null)
                throw new Exception("No se encuentra el tipo " + tipoNombre);
            return type;
        }


    }
}
