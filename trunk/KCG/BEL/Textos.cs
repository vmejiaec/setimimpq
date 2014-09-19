using System;
using System.Collections.Generic;
using System.Text;

namespace BEL
{
    public class Textos
    {
        // Dominios de Si o No
        public const string _BOOL_SI = "S";
        public const string _BOOL_NO = "N";

        // Errores Base de datos
        // Error de clave primaria 
        public const string _ERR_VIOLATION_UNIQUE_KEY = "Violation of PRIMARY KEY";

        // Registro de Auditoría
        // Dominio del contenido de Acción
        
        // Texto de los procesos individuales
        public const string _AUDITAR_ACCION_UPDATE = "UPD";
        public const string _AUDITAR_ACCION_INSERT = "INS";
        public const string _AUDITAR_ACCION_DELETE = "DEL";
        // Texto de  los procesos select  UNI 
        public const string _AUDITAR_ACCION_SELECT_UNI = "UNI";
        // Texto  de los  procesos  select  SEL
        public const string _AUDITAR_ACCION_SELECT_SEL = "SEL";
        // Texto  de los procesos  en  bloque
        public const string _AUDITAR_ACCION_BLOQUE_UPDATE = "BUP";
        public const string _AUDITAR_ACCION_BLOQUE_INSERT = "BIN";
        public const string _AUDITAR_ACCION_BLOQUE_DELETE = "BEL";
        public const string _INSERT_NULL = "Cannot insert the value NULL";

    }
}
