using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI.WebControls;

namespace HER
{
    public class PermisosMovimientos
    {                         
        //************************ FUNCIONES NUEVAS ***************************************

        // Programación: Adrián Armijos
        // Orden: Elizabeth Loaiza
        // Ultima fecha de modificación : 3 de Octubre 2008;  


        public enum ModoOperacion { Nuevo, Editar, Eliminar, Copiar };

        private static void LanzarExcepcion()
        {
            throw new Exception("El estado evaluado en HER.PermisosMovimientos no puede ser null");
        }

        public static bool Movimiento_Apu_Proyecto_Transporte_Indice(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {               
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Equipo_Indice(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Nuevo:
                case ModoOperacion.Eliminar:
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Equipo(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase);
                    break;                
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Nuevo:
                    respuesta = true;
                    break;

                case ModoOperacion.Eliminar:                    
                case ModoOperacion.Editar:
                    respuesta = estado.ToString().Equals("BOR", StringComparison.OrdinalIgnoreCase);
                    break;
            }

            return respuesta;
        }

        public static bool Movimiento_Com_Solicitud_Aprobar(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Nuevo:
                case ModoOperacion.Eliminar:
                    respuesta = true;
                    break;

                case ModoOperacion.Editar:
                    respuesta = estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase)
                             || estado.ToString().Equals("NEG", StringComparison.OrdinalIgnoreCase)
                             || estado.ToString().Equals("APR", StringComparison.OrdinalIgnoreCase);
                    break;
            }

            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            { 
                case ModoOperacion.Editar:
                    respuesta = estado.ToString().Equals("BOR", StringComparison.OrdinalIgnoreCase);                        
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = estado.ToString().Equals("BOR", StringComparison.OrdinalIgnoreCase);                       
                    break;
                    
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Material(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Mano_Obra(object estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Rubro(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase) 
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);                    
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Rubro_Equipo(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Rubro_Mano_Obra(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;                
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Rubro_Material(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Proyecto_Formula_Material(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;                
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Rubro(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Rubro_Equipo(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Rubro_Mano_Obra(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Rubro_Material(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Equipo_Indice(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Material(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }

        public static bool Movimiento_Apu_Oferta_Transporte_Indice(object estado, object presupuesto_estado, ModoOperacion modo)
        {
            if (estado == null) LanzarExcepcion();
            bool respuesta = false;

            switch (modo)
            {
                case ModoOperacion.Editar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Eliminar:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
                case ModoOperacion.Nuevo:
                    respuesta = !estado.ToString().Equals("DIS", StringComparison.OrdinalIgnoreCase)
                            || presupuesto_estado.ToString().Equals("PEN", StringComparison.OrdinalIgnoreCase);
                    break;
            }
            return respuesta;
        }
    }
}
