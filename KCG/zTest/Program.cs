using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Excel;
using System.Data;

namespace zTest
{    
    class Program
    {
        //
        static BEL.Scope s = new BEL.Scope();
        static string anio = "2015";
        static List<AEL.PLA.Pla_Cta> ctas = new List<AEL.PLA.Pla_Cta>();
        static AEL.PLA.Pla_Cta cta = new AEL.PLA.Pla_Cta();
        static CEL.PLA.DO_Pla_Cta adpCta = new CEL.PLA.DO_Pla_Cta();
        static CEL.PLA.DO_Pla_Tarea adpTar = new CEL.PLA.DO_Pla_Tarea();
        static CEL.PLA.DO_Pla_Poa adpPoa = new CEL.PLA.DO_Pla_Poa();
        static CEL.PLA.DO_Pla_Partida adpPar = new CEL.PLA.DO_Pla_Partida();
        static CEL.VAR.DO_Pla_Cta_Codigo_Next adpCodigoNext = new CEL.VAR.DO_Pla_Cta_Codigo_Next();
        static PoaExcel filaNew = new PoaExcel();
        static PoaExcel filaOld = new PoaExcel();

        static int ctaPRG_Id;
        static int ctaPRY_Id;
        static int ctaPRD_Id;
        static int ctaACT_Id;

        static string ctaPRG_Nombre;
        static string ctaPRY_Nombre;
        static string ctaPRD_Nombre;
        static string ctaACT_Nombre;

        static void Main(string[] args)
        {
            //
            string filePath = @"../../PACPOA2015Modificado.xlsx";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();
            
            // Lee los nombres de las columnas
            excelReader.Read();
            bool esPrimeraCta = true;
            string codigo;
            
            while (excelReader.Read())
            {
                // Carga la fila en las variables
                filaNew = new PoaExcel(excelReader);
                // Programa
                if ( esPrimeraCta )
                {
                    ctaPRG_Id = CrearPrimeraCta(filaNew.programa);
                    ctaPRG_Nombre = filaNew.programa;
                    esPrimeraCta = false;
                    filaNew.programa = "";
                }
                if ( ! string.IsNullOrEmpty(filaNew.programa) )
                {
                    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRG_Id);
                    codigo = listaCtaCodigos[0].Cta_Bro_Next;
                    ctaPRG_Id = CrearCta(codigo, "PRG", filaNew.programa);
                    ctaPRG_Nombre = filaNew.programa;
                }
                // Proyecto
                if (!string.IsNullOrEmpty(filaNew.proyecto))
                {
                    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRG_Id);
                    codigo = listaCtaCodigos[0].Cta_Son_Next;
                    ctaPRY_Id = CrearCta(codigo, "PRY", filaNew.proyecto);
                    ctaPRY_Nombre = filaNew.proyecto;
                }
                // Producto
                if (!string.IsNullOrEmpty(filaNew.producto))
                {
                    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRY_Id);
                    codigo = listaCtaCodigos[0].Cta_Son_Next;
                    ctaPRD_Id = CrearCta(codigo, "PRD", filaNew.producto);
                    ctaPRD_Nombre = filaNew.producto;
                }
                // Actividad
                if (!string.IsNullOrEmpty(filaNew.actividad))
                {
                    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRD_Id);
                    codigo = listaCtaCodigos[0].Cta_Son_Next;
                    ctaACT_Id = CrearCta(codigo, "ACT", filaNew.actividad);
                    ctaACT_Nombre = filaNew.actividad;
                }
                // Tarea
                int Tarea_Id = CreaTarea(ctaACT_Id, filaNew.tarea, filaNew.fecha_inicio, filaNew.fecha_fin);
                // Partida y valor inicial del POA
                var listaPar = adpPar.GetByLikeCodigo(s, filaNew.partida);
                int Partida_Id;
                if (listaPar.Count == 0)
                    Partida_Id = CrearPartida(filaNew.partida);
                else
                    Partida_Id = listaPar[0].Id;
                int Poa_Id = CrearPOA(Tarea_Id, Partida_Id, filaNew.valor_inicial);
            }

            excelReader.Close();
        }

        private static int CrearPOA(int Tarea_Id, int Partida_Id, decimal valor_inicial)
        {
            return adpPoa.Insert_Con_Pla_Mov_SaldoInicialINT(
                s,
                "",
                Tarea_Id,
                Partida_Id,
                valor_inicial,
                "PEN"
                );
        }

        private static int CrearPartida(string partidaCodigo)
        {
            return adpPar.InsertINT(
                new AEL.PLA.Pla_Partida(
                    0,
                    partidaCodigo,
                    "---",
                    "PEN"
                    )
                );
        }

        private static int CreaTarea(int ctaACT_Id, string tareaNombre, DateTime fecha_ini, DateTime fecha_fin)
        {
            return adpTar.InsertINT(
                new AEL.PLA.Pla_Tarea(
                    0,
                    "0",
                    ctaACT_Id,"","","",
                    tareaNombre,
                    fecha_ini,
                    fecha_fin,
                    "PEN",
                    0,0,0,0)
                );
        }

        // Crear cuenta
        static int CrearCta(string codigo, string tipo, string nombre)
        {
            cta = new AEL.PLA.Pla_Cta(
                            0,
                            anio,
                            codigo,
                            tipo,
                            nombre,
                            "",
                            "PEN"
                            );
            return adpCta.InsertINT(cta);
        }
        // Crear la primera cuenta del año si no hay más cuentas en el año
        static int CrearPrimeraCta(string nombre)
        {
            var lista = adpCta.GetByAnio(s,anio);
            if (lista.Count == 0)
                return CrearCta("01.", "PRG", nombre);
            else
                return -1;
        }
        // 
    }

    // Clase para cargar el contenido del Excel
    public class PoaExcel
    {
        // Atributos
        public string programa;
        public string proyecto;
        public string producto;
        public string actividad;
        public string tarea;
        public DateTime fecha_inicio;
        public DateTime fecha_fin;
        public string partida;
        public decimal valor_inicial;
        // Constructor
        public PoaExcel()
        { }
        //
        public PoaExcel(
            string _programa,
            string _proyecto,
            string _producto,
            string _actividad,
            string _tarea,
            DateTime _fecha_inicio,
            DateTime _fecha_fin,
            string _partida,
            decimal _valor_inicial
            )
        {
            this.programa = _programa;
            this.proyecto = _proyecto;
            this.producto = _producto;
            this.actividad = _actividad;
            this.tarea = _tarea;
            this.fecha_inicio = _fecha_inicio;
            this.fecha_fin = _fecha_fin;
            this.partida = _partida;
            this.valor_inicial = _valor_inicial;
        }
        // carga una fila en los campos
        public PoaExcel(IExcelDataReader fila)
        {
            this.programa = fila.GetString(0);
            this.proyecto = fila.GetString(1);
            this.producto = fila.GetString(2);
            this.actividad = fila.GetString(3);
            this.tarea = fila.GetString(4);
            this.fecha_inicio = fila.GetDateTime(5);
            this.fecha_fin = fila.GetDateTime(6);
            this.partida = fila.GetString(7);
            this.valor_inicial = fila.GetDecimal(8);
        }
    }
}
