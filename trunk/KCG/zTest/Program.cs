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
            string filePath = @"../../POA_2015_SIPRO_ARRASTRES.xlsx";
            FileStream stream = File.Open(filePath, FileMode.Open, FileAccess.Read);
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            excelReader.IsFirstRowAsColumnNames = true;
            DataSet result = excelReader.AsDataSet();
            
            // Lee los nombres de las columnas
            excelReader.Read();
            bool esPrimeraCta = true;
            string codigo;
            
            // Clases para par_rason_social y per_persona
            CEL.PAR.DO_Par_Razon_Social adpRaz = new CEL.PAR.DO_Par_Razon_Social();            
            CEL.PER.DO_Per_Personal adpPer = new CEL.PER.DO_Per_Personal();            
            BEL.Scope scope = new BEL.Scope();
            scope.Ver_Version_Id = "1";
            scope.Int_Empresa_Id = "1";

            int noFilasProcesadas = 0;
            List<string> listaFilasNoProcesadas = new List<string>();
            List<Poa> listaPorReasignar = new List<Poa>();
            while (excelReader.Read())
            {
                Poa fila = new Poa(excelReader);
                // Verifica que existan las cuentas y el valor
                string res = fila.VerificaCtas();
                switch (res)
                {
                    case "NewPar":  // Crear partida
                        fila.CrearPAR();
                        break;
                    case "NewACT":
                        fila.CrearACT();
                        break;
                    case "UpdVal":
                        fila.ActualizaValorPoa();
                        break;
                    case "NewTAR":
                        fila.CrearTAR();
                        break;
                }
                // Añado a la lista para crear los movimientos de la reasignación.
                if (fila.DEBITO != 0 || fila.CREDITO != 0)
                    listaPorReasignar.Add(fila);
                // Reporte
                noFilasProcesadas++;
                listaFilasNoProcesadas.Add(String.Format("{0}: \t {1} - {2} - {3} - {4}", res, fila.Actividad_Codigo, fila.Tarea_Codigo, fila.Partida_Codigo, fila.Valor_Inicial));
            }
            excelReader.Close();

            // Crea la reasignación Doc
            Poa tmpPoa = new Poa();
            int DocId = tmpPoa.crearReasignacionDoc();
            listaFilasNoProcesadas.Add("---");
            listaFilasNoProcesadas.Add("Nueva reasignación POA creada con código: " + DocId);
            listaFilasNoProcesadas.Add("---");
            listaFilasNoProcesadas.Add("Movimientos de la reasignación:");
            listaFilasNoProcesadas.Add("---");
            // Crea los movimientos
            foreach (var fila in listaPorReasignar)
            {
                int MovId = fila.CrearReasignacionMov(tmpPoa);
                listaFilasNoProcesadas.Add(String.Format("  {0}: \t {1} {2} {3} {4} {5}",MovId, fila.oActividad.Codigo, fila.oTarea.Codigo, fila.oPartida.Codigo, fila.oMov.Tipo, fila.oMov.Valor));
            }

            // Publica mensajes y espera una tecla para terminar
            System.Console.WriteLine("No de filas procesadas: " + noFilasProcesadas);
            if (listaFilasNoProcesadas.Count > 0)
            {
                System.Console.WriteLine("Filas procesadas: ");
                foreach(var fila in listaFilasNoProcesadas)
                    System.Console.WriteLine("-- " + fila);
            }
            // Guarda en un archivo el resultado
            System.IO.StreamWriter archivoOUT = new StreamWriter(@"../../archivoOUT.txt");
            archivoOUT.WriteLine("No de filas procesadas: " + noFilasProcesadas);
            if (listaFilasNoProcesadas.Count > 0)
            {
                archivoOUT.WriteLine("Filas procesadas: ");
                foreach (var fila in listaFilasNoProcesadas)
                    archivoOUT.WriteLine("-- " + fila);
            }
            archivoOUT.Close();
            Console.ReadKey();
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

    // Clase para poa y filas de reasignación

    // Clase para cargar el POA para la reasignación
    public class Poa
    { 
        //Atributos del archivo
        public string Programa_Codigo;
        public string Programa_Nombre;
        public string Proyecto_Codigo;
        public string Proyecto_Nombre;
        public string Producto_Codigo;
        public string Producto_Nombre;
        public string Actividad_Codigo;
        public string Actividad_Nombre;
        public string Tarea_Codigo;
        public string Tarea_Nombre;
        public string Partida_Codigo;
        public decimal Valor_Inicial;
        public decimal DEBITO;
        public decimal CREDITO;
        // Atributos para conectarse a la base
        CEL.PLA.DO_Pla_Cta adpCta = new CEL.PLA.DO_Pla_Cta();
        CEL.PLA.DO_Pla_Partida adpPar = new CEL.PLA.DO_Pla_Partida();
        CEL.PLA.DO_Pla_Tarea adpTar = new CEL.PLA.DO_Pla_Tarea();
        CEL.PLA.DO_Pla_Poa adpPoa = new CEL.PLA.DO_Pla_Poa();
        CEL.PLA.DO_Pla_Mov adpMov = new CEL.PLA.DO_Pla_Mov();
        CEL.PLA.DO_Pla_Doc adpDoc = new CEL.PLA.DO_Pla_Doc();
        BEL.Scope scope = new BEL.Scope();
        // Objetos donde se recuperan los datos de la base
        AEL.PLA.Pla_Cta oProducto = new AEL.PLA.Pla_Cta();
        public AEL.PLA.Pla_Cta oActividad = new AEL.PLA.Pla_Cta();
        public AEL.PLA.Pla_Tarea oTarea = new AEL.PLA.Pla_Tarea();
        AEL.PLA.Pla_Poa oPoa = new AEL.PLA.Pla_Poa();
        public AEL.PLA.Pla_Partida oPartida = new AEL.PLA.Pla_Partida();
        AEL.PLA.Pla_Doc oDoc = new AEL.PLA.Pla_Doc();
        public AEL.PLA.Pla_Mov oMov = new AEL.PLA.Pla_Mov();
        // SP para obtener la siguiente cuenta del POA
        CEL.VAR.DO_Pla_Cta_Codigo_Next adpCodigoNext = new CEL.VAR.DO_Pla_Cta_Codigo_Next();
        // Constructores
        public Poa()
        { }

        public Poa(IExcelDataReader fila)
        { 
            Programa_Codigo= fila.GetString(0);
            Programa_Nombre= fila.GetString(1);
            Proyecto_Codigo= fila.GetString(2);
            Proyecto_Nombre= fila.GetString(3);
            Producto_Codigo= fila.GetString(4);
            Producto_Nombre= fila.GetString(5);
            Actividad_Codigo= fila.GetString(6);
            Actividad_Nombre= fila.GetString(7);
            Tarea_Codigo= fila.GetString(8);
            Tarea_Nombre= fila.GetString(9);
            Partida_Codigo= fila.GetString(10);
            Valor_Inicial= fila.GetDecimal(11);
            DEBITO = fila.GetDecimal(12);
            CREDITO = fila.GetDecimal(13);
        }

        public int crearReasignacionDoc()
        {
            oDoc = new AEL.PLA.Pla_Doc();
            oDoc.Tipo = "REP";
            oDoc.Fecha_Solicita = DateTime.Today;
            oDoc.Per_Personal_Id_Solicita = "00045011303308994";
            oDoc.Area_Codigo_Solicita = "100300";
            oDoc.Descripcion = "Reasignacion dispuesta por el usuario.";
            oDoc.Estado = "PEN";
            oDoc.Per_Personal_Id_Crea = "00045011303308994";
            oDoc.Per_Personal_Id_Modifica = "00045011303308994";
            oDoc.Valor_Solicita = 0;
            oDoc.Per_Personal_Id_Planifica = null;
            oDoc.Esta_Planificada = "PEN";
            oDoc.Per_Personal_Id_Contrata = null;
            oDoc.Esta_Contratada = "PEN";
            oDoc.PAC_Linea = "";
            oDoc.CPC_Codigo = "";
            oDoc.Fecha_Contrata = DateTime.Today;
            oDoc.Fecha_Planifica = DateTime.Today;
            oDoc.Cedula_Presup_Codigo = "";
            oDoc.Contrata_Desc = "";
            int DocId = adpDoc.InsertINT(oDoc);
            // recupera el registro insertado
            var listaDoc = adpDoc.GetById(scope, DocId);
            if (listaDoc.Count == 0) return -1;
            oDoc = listaDoc[0];
            return DocId;
        }

        public int CrearReasignacionMov(Poa pPoa)
        {
            oDoc = pPoa.oDoc;
            oMov = new AEL.PLA.Pla_Mov();
            oMov.Estado = "PEN";
            oMov.Tipo = (DEBITO == 0)? "CRE":"DEB";
            oMov.Valor = (DEBITO == 0) ? CREDITO : DEBITO;
            oMov.Pla_Poa_Id = oPoa.Id;
            oMov.Pla_Doc_Id = oDoc.Id;
            int MovId = adpMov.InsertINT(oMov);
            // recupero el registro insertado
            var listaMov = adpMov.GetById(scope, MovId);
            if (listaMov.Count == 0) return -1;
            oMov = listaMov[0];
            return MovId;
        }

        public int ActualizaValorPoa()
        {
            AEL.PLA.Pla_Poa newPoa = new AEL.PLA.Pla_Poa();
            var listaPoa = adpPoa.GetById(scope, oPoa.Id);
            if (listaPoa.Count == 0) return -1;
            newPoa = listaPoa[0];
            // Actualizo el valor
            newPoa.Valor_Inicial = Valor_Inicial;
            int res = adpPoa.Update_Con_Pla_Mov_SaldoInicialINT(scope,
                newPoa.Codigo,
                newPoa.Pla_Tarea_Id,
                newPoa.Pla_Partida_Id,
                newPoa.Estado,
                oPoa.Id,
                oPoa.Codigo,
                oPoa.Pla_Tarea_Id,
                oPoa.Pla_Partida_Id,
                oPoa.Estado,
                newPoa.Id,
                newPoa.Valor_Inicial);
            return res;
        }

        public int CrearPAR()
        {
            // Busco el id de la partida
            var listaPartidasParam = adpPar.GetByLikeCodigo(scope,Partida_Codigo);
            if (listaPartidasParam.Count == 0)
            {
                // Si no existe la partida la creamos
                oPartida.Codigo = Partida_Codigo;
                oPartida.Estado = "PEN";
                oPartida.Nombre = "----";
                int ParId = adpPar.InsertINT(oPartida);
                // Busca el registro recien creado
                listaPartidasParam = adpPar.GetById(scope, ParId);
            }
            oPartida = listaPartidasParam[0];
            // Inserta en el poa
            int PoaId = adpPoa.Insert_Con_Pla_Mov_SaldoInicialINT(scope, "1", oTarea.Id, oPartida.Id, Valor_Inicial, "PEN");
            // Recupera el poa insertado
            var listaPoa = adpPoa.GetById(scope, PoaId);
            if (listaPoa.Count == 0) return -1;
            oPoa = listaPoa[0];
            return PoaId;
        }

        public int CrearACT()
        { 
            // inserto una cuenta del tipo Actividad
            oActividad = new AEL.PLA.Pla_Cta();
            oActividad.Anio = "2015";           
            // obtiene la siguiente cuenta.
            var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(oActividad.Anio, oProducto.Id);
            oActividad.Codigo = listaCtaCodigos[0].Cta_Son_Next;
            oActividad.Descripcion = "";
            oActividad.Estado = "PEN";
            oActividad.Nivel = "ACT";
            oActividad.Nombre = Actividad_Nombre;
            int ActId = adpCta.InsertINT(oActividad);
            // Recupero el registro insertado
            var listaAct = adpCta.GetById(scope, ActId);
            if (listaAct.Count == 0) return -1;
            oActividad = listaAct[0];
            int PoaId = CrearTAR();
            return PoaId;
        }

        public int CrearTAR()
        {
            // inserto la tarea
            oTarea = new AEL.PLA.Pla_Tarea();
            oTarea.Nombre = Tarea_Nombre;
            oTarea.Codigo = "";
            oTarea.Fecha_Ini = DateTime.Today;
            oTarea.Fecha_Fin = DateTime.Today;
            oTarea.Estado = "PEN";
            oTarea.Pla_Cta_Id = oActividad.Id;
            int TarId = adpTar.InsertINT(oTarea);
            // Recupero el registro insertado
            var listaTar = adpTar.GetById(scope, TarId);
            if (listaTar.Count == 0) return -1;
            oTarea = listaTar[0];
            // Creamos el resto con PAR
            int PoaId = CrearPAR();
            return PoaId;
        }

        public string VerificaCtas()
        {
            // verifica PRG
            var listaCta = adpCta.GetByAnioLikeCodigo(scope, "2015", Programa_Codigo);
            if (listaCta.Count == 0) return "NewPRG"; 
            // verifica PRY
            listaCta = adpCta.GetByAnioLikeCodigo(scope, "2015", Proyecto_Codigo);
            if (listaCta.Count == 0) return "NewPRY"; 
            // verifica PRD
            listaCta = adpCta.GetByAnioLikeCodigo(scope, "2015", Producto_Codigo);
            if (listaCta.Count == 0) return "NewPRD";
            oProducto = new AEL.PLA.Pla_Cta();
            oProducto = listaCta[0];
            // verifica ACT
            listaCta = adpCta.GetByAnioLikeCodigo(scope, "2015", Actividad_Codigo);
            if (listaCta.Count == 0) return "NewACT";
            oActividad = new AEL.PLA.Pla_Cta();
            oActividad = listaCta[0];
            // verifica TARea
            var listaTar = adpTar.GetByAnioLikePla_Cta_Codigo(scope, "2015", oActividad.Codigo);
            bool bHayTarea = false;
            oTarea = new AEL.PLA.Pla_Tarea();
            foreach ( var filaTar in listaTar)
                if (filaTar.Codigo == Tarea_Codigo)
                {
                    bHayTarea = true;
                    oTarea = filaTar;
                }
            if (! bHayTarea ) 
                return "NewTAR"; 
            // verifica POA
            var listaPoa = adpPoa.GetByPla_Tarea_Id(scope, oTarea.Id);
            if (listaPoa.Count == 0) 
                return "NewPoa"; 
            // verifica PARtida
            bool bHayPartida = false;
            oPoa = new AEL.PLA.Pla_Poa();
            foreach (var filaPoa in listaPoa)
                if (filaPoa.Pla_Partida_Codigo == Partida_Codigo)
                {
                    bHayPartida = true;
                    oPoa = filaPoa;
                }
            if (!bHayPartida) 
                return "NewPar";
            // verifica VALor
            if (oPoa.Valor_Inicial != Valor_Inicial) 
                return "UpdVal";
            // La fila está Ok
            return "Ok";
        }
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


    // Programa para la carga del POA

                // Carga la fila en las variables
                //filaNew = new PoaExcel(excelReader);
                // Programa

                //    if ( esPrimeraCta )
                //{
                //    ctaPRG_Id = CrearPrimeraCta(filaNew.programa);
                //    ctaPRG_Nombre = filaNew.programa;
                //    esPrimeraCta = false;
                //    filaNew.programa = "";
                //}
                //if ( ! string.IsNullOrEmpty(filaNew.programa) )
                //{
                //    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRG_Id);
                //    codigo = listaCtaCodigos[0].Cta_Bro_Next;
                //    ctaPRG_Id = CrearCta(codigo, "PRG", filaNew.programa);
                //    ctaPRG_Nombre = filaNew.programa;
                //}
                //// Proyecto
                //if (!string.IsNullOrEmpty(filaNew.proyecto))
                //{
                //    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRG_Id);
                //    codigo = listaCtaCodigos[0].Cta_Son_Next;
                //    ctaPRY_Id = CrearCta(codigo, "PRY", filaNew.proyecto);
                //    ctaPRY_Nombre = filaNew.proyecto;
                //}
                //// Producto
                //if (!string.IsNullOrEmpty(filaNew.producto))
                //{
                //    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRY_Id);
                //    codigo = listaCtaCodigos[0].Cta_Son_Next;
                //    ctaPRD_Id = CrearCta(codigo, "PRD", filaNew.producto);
                //    ctaPRD_Nombre = filaNew.producto;
                //}
                //// Actividad
                //if (!string.IsNullOrEmpty(filaNew.actividad))
                //{
                //    var listaCtaCodigos = adpCodigoNext.GetByAnio_Cta_Id(anio, ctaPRD_Id);
                //    codigo = listaCtaCodigos[0].Cta_Son_Next;
                //    ctaACT_Id = CrearCta(codigo, "ACT", filaNew.actividad);
                //    ctaACT_Nombre = filaNew.actividad;
                //}
                //// Tarea
                //int Tarea_Id = CreaTarea(ctaACT_Id, filaNew.tarea, filaNew.fecha_inicio, filaNew.fecha_fin);
                //// Partida y valor inicial del POA
                //var listaPar = adpPar.GetByLikeCodigo(s, filaNew.partida);
                //int Partida_Id;
                //if (listaPar.Count == 0)
                //    Partida_Id = CrearPartida(filaNew.partida);
                //else
                //    Partida_Id = listaPar[0].Id;
                //int Poa_Id = CrearPOA(Tarea_Id, Partida_Id, filaNew.valor_inicial);


    // Contador para las personas creadas
            //int noPerCreadas = 0;
            //List<string> listaPerNoCreadas = new List<string>();
            //while (excelReader.Read())
            //{
            //    AEL.PAR.Par_Razon_Social oRaz = new AEL.PAR.Par_Razon_Social();
            //    AEL.PER.Per_Personal oPer = new AEL.PER.Per_Personal();
            //    // Carga los datos de cédula y nombre
            //    string cedula = excelReader.GetString(1);
            //    string nombre = excelReader.GetString(2);
            //    // Verifica Si ya está creado 
            //    var listaRaz = adpRaz.GetByLikeNumero(scope, "1", cedula);
            //    if (listaRaz.Count > 0 || listaRaz.Count > 0)
            //    {
            //        listaPerNoCreadas.Add(cedula + " : " + nombre);
            //        continue;
            //    }
                
            //    // Crea el objeto de Par_Razon_Social
            //    oRaz.Nombre = nombre;
            //    oRaz.Par_Tipo_Identificacion_Id = "1"; // 
            //    oRaz.Par_Tipo_Identificacion_Cedula = "S"; // tipo Cédula
            //    oRaz.Numero = cedula;
            //    oRaz.Nombre_Comercial = nombre;
            //    oRaz.Int_Empresa_Id = "1";
            //    // Guarda la razon social

            //    //string RazId = adpRaz.Insert(scope, oRaz);
            //    string RazId = DEL.PAR.DO_Par_Razon_Social.Insert(scope, oRaz);

            //    // Crea el objeto de persona
            //    oPer.Par_Razon_Social_Id = RazId;
            //    oPer.Coordinador = "N";
            //    oPer.Tecnico_Costos = "N";
            //    oPer.Int_Empresa_Id = "1";
            //    oPer.Jefe_Costos = "N";
            //    oPer.Tipo_Fiscalizacion = "N";
            //    oPer.Jefe_Fiscalizacion = "N";
            //    oPer.Fiscalizacion = "N";
            //    oPer.Contratista = "N";
            //    // Guarda la persona
            //    string sPerId = adpPer.Insert(scope, oPer);

            //    // Actualiza el contador
            //    noPerCreadas++;
            //}
            //excelReader.Close();
            //// Publica el numero de per creadas
            //System.Console.WriteLine("Personas creadas: " + noPerCreadas);
            //foreach (var persona in listaPerNoCreadas)
            //    System.Console.WriteLine(persona);
}
