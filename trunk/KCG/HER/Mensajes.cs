using System;
using System.Collections.Generic;
using System.Text;

namespace HER
{
    public class Mensajes
    {
        public enum Tipo: byte
        {
            ItemInserted = 0,
            ItemUpdated = 1,
            ItemDeleted = 2
        }
        public static string Error(Tipo error)
        {
            switch(error)
            {
                case Tipo.ItemInserted:
                    return "Error al insertar el registro.";
                case Tipo.ItemUpdated:
                    return "Error al actualizar el registro. Otro usuario lo ha actualizado primero.";
                case Tipo.ItemDeleted:
                    return "Error al borrar el registro.";
                default:
                    throw new ArgumentOutOfRangeException("error");
            }
        }
    }
}