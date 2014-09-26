using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace zGeneraClases
{    
    public static class constantes
    {
        // Diccionario para transformar dbType a .NET type
        public static Dictionary<string, string> cambiaTipo = new Dictionary<string, string>() 
        { 
            {"Boolean",                 "Boolean"},
            {"DateTime",                "DateTime"},
            {"Decimal",                 "Decimal"},
            {"Int16",                   "Int16"},
            {"Int32",                   "Int32"},
            {"Int64",                   "Int64"},
            {"AnsiString",              "string"},
            {"String",                  "string"},
            {"AnsiStringFixedLength",   "string"},
            {"StringFixedLength",       "string"}
        };
        // Diccionario para transformar las últimas tres letras de un SP escalar a un tipo de dato
        public static Dictionary<string, string> cambiaTipoSP = new Dictionary<string, string>()
        {
            {"BOL",                 "Boolean"},
            {"DTM",                 "DateTime?"},
            {"DEC",                 "Decimal"},
            {"INT",                 "int"},
            {"STR",                 "string"}
        };
        // Lista de campos que no serán tomados en cuenta para los validadores en el ASP
        public static List<string> CamposNoValidar = new List<string>() 
        { "Id","Estado","Descripcion" };
    }
    // Clase para guardar las tablas y sus campos
    public class genTabla
    {
        public string Nombre;
        public string AdapterNombre;
        public List<genCampo> Campos = new List<genCampo>();
        public genProcedimiento procSelect = new genProcedimiento();
        public List<genProcedimiento> ProcBasicos = new List<genProcedimiento>();
        public List<genProcedimiento> ProcGenericos = new List<genProcedimiento>();
        // Obtienes una lista de los campos separados por comas y en varias líneas
        public string listaCampos(string prefijo)
        {
            string lista = "";
            foreach (var campo in Campos)
            {
                lista += prefijo + campo.Nombre + ",\r\n";
            }
            lista = lista.TrimEnd('\n').TrimEnd('\r').TrimEnd(',');
            return lista;
        }
        // Lista de parámetros de un procedimiento de Ins, Del y Upd
        public string listaParams(genProcedimiento proc)
        {
            string lista = "";
            foreach (var param in proc.Parametros)
            {
                lista += param.ParamNombre + ",\r\n";
            }
            lista = lista.TrimEnd('\n').TrimEnd('\r').TrimEnd(',');
            lista = lista.Replace("@Original_", "o.").Replace("@", "n.");
            return lista;
        }
        // Lista de procedimientos genéricos tipo Get que retornan Rowset
        public List<genProcedimiento> ProcGenericosGet
        {
            get { return ProcGenericos.FindAll(x => x.QueryType == "Rowset"); }
        }
        // Lista de procedimientos genéricos tipo scalar
        public List<genProcedimiento> ProcGenericosScalar
        {
            get { return ProcGenericos.FindAll(x => x.QueryType == "Scalar"); }
        }
    }

    // Clase para guardar el nombre del campo y su tipo 
    public class genCampo
    {
        public string Nombre;  // Con la primera letra en mayúscula
        public Type Tipo;
        public string Comentario;
        public genCampo(string nombre, Type tipo, string comentario)
        {
            this.Nombre = nombre;
            this.Tipo = tipo;
            this.Comentario = comentario;
        }

        public string propiedad  // Nombre
        {
            get { return Nombre; }
        }
        public string atributo// _Nombre
        {
            get { return "_" + Nombre; }
        }
        public string parametro // nombre
        {
            get
            {
                return Nombre.Substring(0, 1).ToLower() +
                       Nombre.Substring(1);
            }
        }
    } // genCampo

    public class genProcedimiento
    {
        public string ProcNombre;
        public string QueryType;
        public List<genParametro> Parametros;
        public genProcedimiento()
        {
            Parametros = new List<genParametro>();
        }
        // Lista de parámetros de un procedimiento para el método (tipo nombre)
        public string listaParamsMET()
        {
            string lista = "*";
            foreach (var param in Parametros.Where(x => x.Direccion == "Input"))
            {
                lista += ", " + constantes.cambiaTipo[param.DbTipo] + " " + param.ParamNombre ;
            }
            lista = lista.Replace("*,", ",").Replace("@", "");
            return lista;
        }
        // Lista de parámetros de un procedimiento para el SP (nombre)
        public string listaParamsSP()
        {
            string lista = "*";
            foreach (var param in Parametros.Where(x => x.Direccion == "Input"))
            {
                lista += ", " + param.ParamNombre;
            }
            lista = lista.Replace("*,","").Replace("@", "");
            return lista;
        }
        // El tipo de dato que devuelve la funcion
        public string TipoDevuelto 
        {
            get {
                return constantes.cambiaTipo[Parametros.Find(x => x.Direccion == "ReturnValue").DbTipo];
            }
        }
        // El tipo de dato que devuelve un SP escalar de acuerdo con sus tres últimas letras
        public string TipoDevueltoEscalar
        {
            get
            {
                return constantes.cambiaTipoSP[ProcNombre.Substring(ProcNombre.Length-3)];
            }
        }
        // Retorna el texto para el filtro de la pagina
        public string ProcNombreFiltro
        {
            get
            {
                int ini = ProcNombre.IndexOf("Like")+4;
                int fin = ProcNombre.Length;
                return (ProcNombre.Contains("Like"))? ProcNombre.Substring(ini):"";
            }
        }
    }

    public class genParametro
    {
        public string Direccion;  // "ReturnValue" o "Input"
        public string ParamNombre;
        public string DbTipo;
        public string SourceVersion;

        public string Tipo {
            get { return constantes.cambiaTipo[this.DbTipo]; }
        }

        public string Nombre {
            get { return ParamNombre.Replace("@","");}
        }

        public genParametro(string direccion, string paramNombre, string dbTipo, string sourceVersion)
        {
            this.Direccion = direccion;
            this.ParamNombre = paramNombre;
            this.DbTipo = dbTipo;
            this.SourceVersion = sourceVersion;
        }
    }
}
