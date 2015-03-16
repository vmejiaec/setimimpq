using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Excel;
using System.Data;

namespace zTest
{
    public class CargaPOA2014
    {
        // Atributos
        string archivoExcelNombre; // Ejemplo archivoExcelNombre = @"../../POA_SIPRO_REFORMA.xlsx";
        
        FileStream stream;
        IExcelDataReader excelReader;

        List<EstructuraFila> datos = new List<EstructuraFila>();
        Dictionary<string, string> Log = new Dictionary<string, string>();
        // Constructores
        public CargaPOA2014(string archivo)
        {
            this.archivoExcelNombre = archivo;
        }
        // Métodos
        public bool AbrirArchivo()
        {
            bool res = true;
            // Carga el archivo excel
            stream = File.Open(archivoExcelNombre, FileMode.Open, FileAccess.Read);
            excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            // Si se desea cargar el archivo excel en un DataSet
            // DataSet result = excelReader.AsDataSet();
            // Lee los nombres de las columnas
            excelReader.Read();
            return res;
        }
        public bool ProcesarArchivo()
        {
            bool res = true;
            while (excelReader.Read())
            {
                if (!ProcesarFila(excelReader))
                {
                    res = false;
                    break;
                }
            }
            return res;
        }
        public bool ProcesarFila(IExcelDataReader excelReader)
        {
            bool res = true;
            // Carga la fila en la estructura de datos
            EstructuraFila fila = new EstructuraFila(excelReader);
            // La fila es CERO (0) en la primera columna entonces no será procesada
            if (fila._No_Fila == 0) return true;
            datos.Add(fila);
            // Añado un registro al Log
            Log.Add(fila._No_Fila.ToString(), string.Format("{0} {1} {2:N2}", fila._Actividad_Codigo, fila._Objeto, fila._Arrastre_2015));
            return res;
        }
        public void GuardarLog()
        {
            // Construye el nombre del Log con la fecha y la hora
            string timestamp = DateTime.Now.ToString("yyyy_MM_dd-hh:MM:ss");
            string archivoLogNombre = @"../../Log_" + timestamp + ".txt";
            // Guarda el archivo log
            System.IO.StreamWriter archivoLog = new StreamWriter(archivoLogNombre);
            archivoLog.WriteLine("Log del archivo : " + this.archivoExcelNombre);
            foreach (var fila in Log)
                    archivoLog.WriteLine("-- " + fila);
            archivoLog.Close();
        }
        public bool Procesar()
        {
            bool res = true;
            AbrirArchivo();
            ProcesarArchivo();
            GuardarLog();
            return res;
        }
    }

    // Estructura de datos del archivo excel de arrastres
    public class EstructuraFila
    { 
        // Atributos
        public string _Actividad_Codigo;
        public string _Tarea_Codigo;

        public int _No_Fila;
        public string _No_Contrato;
        public string _Proceso_Contratacion;
        public string _Proyecto;
        public string _Partida;
        public string _DPN;
        public string _CPM;
        public string _Contratista_Nombre;
        public string _Contratista_RUC;
        public string _No_Obra;
        public string _Objeto;
        public decimal _Arrastre_2015;

        // Constructor
        public EstructuraFila(IExcelDataReader fila)
        {
            this._No_Fila = fila.GetInt32(0);
            this._Actividad_Codigo = fila.GetString(4);
            this._No_Contrato = fila.GetString(1);
            this._No_Obra = fila.GetString(10);
            this._Objeto = fila.GetString(11);
            this._Arrastre_2015 = fila.GetDecimal(199);            
        }
    }
}
