using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;

namespace zGeneraClases
{
    public class ExtraeMetaDatos
    {
        // Atributos
        public string xsdNombre;
        public string xsdNombreIniciales;
        public List<genTabla> BaseDatos = new List<genTabla>();
        public Dictionary<string, Type> tipos = new Dictionary<string, Type>();
        public XElement xml;
        public XNamespace ns = "http://www.w3.org/2001/XMLSchema";
        public XNamespace xmlns = "urn:schemas-microsoft-com:xml-msdatasource";
            
        // Constructor
        public ExtraeMetaDatos(string xsdDiseño)
        {
            // Carga los tipos reconocidos            
            tipos.Add("xs:int", typeof(int));
            tipos.Add("xs:string", typeof(System.String));
            tipos.Add("xs:dateTime", typeof(System.DateTime));
            tipos.Add("xs:decimal", typeof(System.Decimal));
            tipos.Add("xs:double", typeof(System.Double));
            // Carga el xml
            xml = XElement.Load(xsdDiseño); // xsdDiseño = @"..\..\Planificacion.xsd"
            // extrae los metadatos del archivo XSD
            xsdNombre = (string)xml.Element(ns + "element").Attribute("name");
            xsdNombreIniciales = xsdNombre.Substring(0, 3).ToUpper();
            // Extrae procedimientos y campos
            procedimientos();
            Campos();
        }
        // Escribe en consola los datos extraidos
        public void EscribeEnConsola()
        {
            foreach (var t in BaseDatos)
                {
                    Console.WriteLine("Clase: {0} - {1}", t.Nombre, t.AdapterNombre);
                    Console.WriteLine("-->Campos");
                    foreach (var cam in t.Campos)
                    {
                        Console.WriteLine("     {0} \t\t {1} \t {2}", cam.Nombre, cam.Tipo, cam.Comentario);
                    }
                    Console.WriteLine("-->Procedimientos Básicos");
                    Console.WriteLine("   {0}", t.procSelect.ProcNombre);
                    foreach (var param in t.procSelect.Parametros)
                    {
                        Console.WriteLine("      {0} \t\t {1} \t {2} \t {3}", param.ParamNombre, param.DbTipo, param.Direccion, param.SourceVersion);
                    }

                    foreach (var p in t.ProcBasicos)
                    {
                        Console.WriteLine("   {0}", p.ProcNombre);
                        foreach (var param in p.Parametros)
                        {
                            Console.WriteLine("      {0} \t\t {1} \t {2} \t {3}", param.ParamNombre, param.DbTipo, param.Direccion, param.SourceVersion);
                        }
                    }
                    
                    Console.WriteLine("-->Procedimientos Genéricos");
                    foreach (var pg in t.ProcGenericos)
                    {
                        Console.WriteLine("   {0}", pg.ProcNombre);
                        foreach (var param in pg.Parametros)
                        {
                            Console.WriteLine("      {0} \t\t {1} \t {2} \t {3}", param.ParamNombre, param.DbTipo, param.Direccion, param.SourceVersion);
                        }
                    }
                }
        }
        // Leectura de datos
        public void Campos()
        {
            var tablas = xml.Element(ns + "element").
                             Element(ns + "complexType").
                             Element(ns + "choice").
                             Elements(ns + "element");

            foreach (var tabla in tablas)
            {
                // Nombre de la tabla
                string tablaNombre = (string)tabla.Attribute("name");
                List<genCampo> _campos = new List<genCampo>();
                // Y las columnas
                var campos = tabla.Element(ns + "complexType").
                                    Element(ns + "sequence").
                                    Elements(ns + "element");
                foreach (var col in campos)
                {
                    string colNombre = (string)col.Attribute("name");
                    string colTipo = (string)col.Attribute("type");
                    if (colTipo == null)
                    {
                        colTipo = (string)col.Element(ns + "simpleType").
                                                Element(ns + "restriction").
                                                Attribute("base");
                    }
                    _campos.Add(new genCampo(colNombre, tipos[colTipo],"Comentario"));
                }

                // Añade a la base de datos los campos de la tabla
                var dbTabla = BaseDatos.Find(
                    delegate(genTabla genTab)
                    {
                        return genTab.Nombre == tablaNombre;
                    });
                dbTabla.Campos = _campos;
            }
        }
        // Extrae los procedimientos
        public void procedimientos()
        {
            var tablas = xml.Element(ns + "annotation")
                        .Element(ns + "appinfo")
                        .Element(xmlns + "DataSource")
                        .Element(xmlns + "Tables")
                        .Elements(xmlns + "TableAdapter");

            foreach (var t in tablas)
            { 
                // Creamos una tabla
                genTabla tabla = new genTabla();
                tabla.Nombre = (string) t.Attribute("Name");
                tabla.AdapterNombre = (string)t.Attribute("GeneratorDataComponentClassName");
                // Delete, Insert, Select y Update
                genProcedimiento procDel = new genProcedimiento();
                genProcedimiento procIns = new genProcedimiento();
                genProcedimiento procSel = new genProcedimiento();
                genProcedimiento procUpd = new genProcedimiento();
                // Procedimientos básicos de Del Ins Upd
                procDel.ProcNombre = "Delete";
                procIns.ProcNombre = "Insert";
                procUpd.ProcNombre = "Update";
                OperacionBasica(t, "DeleteCommand", procDel.Parametros);
                OperacionBasica(t, "InsertCommand", procIns.Parametros);                
                OperacionBasica(t, "UpdateCommand", procUpd.Parametros);
                tabla.ProcBasicos.Add(procIns);
                tabla.ProcBasicos.Add(procDel);
                tabla.ProcBasicos.Add(procUpd);
                // Procedimiento Select                
                procSel.ProcNombre = "Select";
                // Obtiene el valor de QueryType del elemento DbSource
                var dbSource = t.Element(xmlns + "MainSource")
                                .Element(xmlns + "DbSource");
                procSel.QueryType = (string)dbSource.Attribute("QueryType");
                OperacionBasica(t, "SelectCommand", procSel.Parametros);
                tabla.procSelect = procSel;                
                // Procedimientos genéricos
                procedimiento(t, tabla);
                // Añadimos la tabla a la base de datos
                BaseDatos.Add(tabla);
            }
        }

        // Extrae una operación básica
        public void OperacionBasica(XElement adapter, string procNombre, List<genParametro> parametros)
        {
            var operBas = adapter.Element(xmlns + "MainSource")
                               .Element(xmlns + "DbSource")
                               .Element(xmlns + procNombre)  
                               .Element(xmlns + "DbCommand")
                               .Element(xmlns + "Parameters")
                               .Elements(xmlns + "Parameter");
            foreach (var param in operBas)
            {
                // verifica que la dirección sea input y que no sea parámetro isNULL
                string direccion = (string)param.Attribute("Direction");  // "ReturnValue" o "Input"
                bool sourceColumnNullMapping = (bool)param.Attribute("SourceColumnNullMapping"); // es falso cuando tiene el control de IS NULL
                if (direccion == "Input")
                    if (!sourceColumnNullMapping)
                    {
                        string paramNombre = (string)param.Attribute("ParameterName");
                        string dbTipo = (string)param.Attribute("DbType");
                        string sourceVersion = (string)param.Attribute("SourceVersion"); // Es Current para "n" y Original para "o"
                        parametros.Add(new genParametro(direccion, paramNombre, dbTipo, sourceVersion));
                    }
            }
        }
        // Estrae los procedimientos genéricos
        public void procedimiento(XElement adapter, genTabla tabla)
        {
            // Verifica que existan procedimientos genéricos
            var fuente = adapter.Element(xmlns + "Sources");
            if (!fuente.IsEmpty)
            {
                var procesos = fuente.Elements(xmlns + "DbSource");
                foreach (var proc in procesos)
                {
                    genProcedimiento genProc = new genProcedimiento();
                    string queryType = (string)proc.Attribute("QueryType"); // "Rowset" o "Scalar"
                    string userGetMethodName = (string)proc.Attribute("UserGetMethodName"); // Tiene el nombre Si Rowset 
                    string userSourceName = (string)proc.Attribute("UserSourceName"); // Tiene el nombre si Scalar
                    if (queryType == "Rowset") 
                    {
                        genProc.ProcNombre = userGetMethodName;
                    }
                    else // queryType == "Scalar"
                    {
                        genProc.ProcNombre = userSourceName;
                    }
                    genProc.QueryType = queryType;
                    // Saca los parámetros
                    var procParametros = proc.Element(xmlns + "SelectCommand")
                                        .Element(xmlns + "DbCommand")
                                        .Element(xmlns + "Parameters")
                                        .Elements(xmlns + "Parameter");
                    foreach (var procParam in procParametros)
                    {
                        string paramNombre = (string)procParam.Attribute("ParameterName");
                        string dbTipo = (string)procParam.Attribute("DbType");
                        string sourceVersion = (string)procParam.Attribute("SourceVersion"); // Es Current para "n" y Original para "o"
                        //string sourceColumnNullMapping = (string)procParam.Attribute("SourceColumnNullMapping"); // es falso cuando tiene el control de IS NULL
                        string direccion = (string)procParam.Attribute("Direction");
                        genProc.Parametros.Add(new genParametro(direccion,paramNombre, dbTipo, sourceVersion));
                    }
                    tabla.ProcGenericos.Add(genProc);
                }
            }
        }
    }
}
