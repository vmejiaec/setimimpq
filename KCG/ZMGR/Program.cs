using System;
using System.Collections.Generic;
using System.Text;
using System.Data.OleDb;
using System.Data;
using BEL;

namespace ZMGR
{
    class Program
    {
        static void Main(string[] args)
        {
            // Código de la oferta a migrar
            string codigo_oferta = "791";
            // Conección con Access
            string CadenaConeccion = Base.Default.ApuAccess;
            OleDbConnection baseOrigen = new OleDbConnection(CadenaConeccion);
            baseOrigen.Open();
            // Consulta de una oferta
            string consultaOferta = "select * from oferta where codigo_oferta = " + codigo_oferta ;
            OleDbCommand cmdConsultar = new OleDbCommand(consultaOferta, baseOrigen);
            cmdConsultar.CommandType = CommandType.Text;
            OleDbDataReader filas = cmdConsultar.ExecuteReader();
            // Leer uno a uno el resultado de la consulta
            List<FON_Oferta> lstFon_Oferta = new List<FON_Oferta>();
            while (filas.Read())
            {
                FON_Oferta fOferta = new FON_Oferta();
                fOferta._Codigo_Oferta = filas.GetInt32(0);
                fOferta._Oferta = filas.GetString(1);
                fOferta._Porcentaje = filas.GetInt16(6);
                fOferta._Ofertante = filas.GetString(8);
                fOferta._Fecha_Creacion = filas.GetDateTime(10);
                lstFon_Oferta.Add(fOferta);
            }
            filas.Close();

            // Consulta los rubros de la oferta
            string consultaOfertaRubros = " select r.codigo_rubro, " + // 0
                                          "    r.rubro, "            + // 1
                                          "    fr.volumen, "         + // 2
                                          "    fr.unidad, "          + // 3
                                          "    fr.costo_usd "        + // 4
                                          " from " +
                                          " oferta_rubro fr, o_rubro r"+
                                          " where " +
                                          " fr.codigo_oferta = " + codigo_oferta + " and " +
                                          " fr.codigo_rubro = r.codigo_rubro ";
            cmdConsultar = new OleDbCommand(consultaOfertaRubros, baseOrigen);
            cmdConsultar.CommandType = CommandType.Text;
            OleDbDataReader filas1 = cmdConsultar.ExecuteReader();
            // Leer uno a uno el resultado de la consulta
            List<FON_Oferta_Rubro> lstFon_Oferta_Rubro = new List<FON_Oferta_Rubro>();
            while (filas1.Read())
            {
                FON_Oferta_Rubro fonOfertaRubro = new FON_Oferta_Rubro ();
                fonOfertaRubro._Codigo_Rubro = filas1.GetInt32(0);
                fonOfertaRubro._Rubro = ((filas1.GetString(1)).TrimStart()).TrimEnd();
                fonOfertaRubro._Volumen = (Decimal)filas1.GetDouble(2);
                fonOfertaRubro._Unidad = (filas1.GetString(3)) ?? "Und.";
                fonOfertaRubro._Costo_Usd = (Decimal)filas1.GetDouble(4);
                

                // Consulto los materiales
                string consultaMateriales = " select "+
                                            "  m.codigo_material,"+
                                            "  m.material," +
                                            "  fm.total_usd" +
                                            " from "+
                                            " o_material m, oferta_material fm "+
                                            " where "+
                                            " fm.codigo_oferta = " + codigo_oferta + 
                                            " and " +
                                            " fm.codigo_rubro = " + fonOfertaRubro._Codigo_Rubro.ToString() +
                                            " and " +
                                            " fm.codigo_material = m.codigo_material ";
                OleDbCommand cmdConsultarMat = new OleDbCommand(consultaMateriales, baseOrigen);
                cmdConsultarMat.CommandType = CommandType.Text;
                OleDbDataReader filasMat = cmdConsultarMat.ExecuteReader();
                List<FON_Oferta_Rubro_Material> lstFon_Oferta_Material =
                    new List<FON_Oferta_Rubro_Material>();
                while (filasMat.Read()) 
                {
                    FON_Oferta_Rubro_Material oRubroMat = new FON_Oferta_Rubro_Material();
                    oRubroMat._Codigo_Material = filasMat.GetInt32(0);
                    oRubroMat._Material = ((filasMat.GetString(1)).TrimStart()).TrimEnd();
                    oRubroMat._Total_Usd = (Decimal)filasMat.GetDouble(2);
                    lstFon_Oferta_Material.Add(oRubroMat);
                }
                fonOfertaRubro._Mat = lstFon_Oferta_Material;
                filasMat.Close();
                // Consulto la mano de obra
                string consultaManoObra = " select " +
                                            "  m.codigo_mano," +
                                            "  m.mano," +
                                            "  fm.total_usd" +
                                            " from " +
                                            " o_manoobra m, oferta_manoobra fm " +
                                            " where " +
                                            " fm.codigo_oferta = " + codigo_oferta +
                                            " and " +
                                            " fm.codigo_rubro = " + fonOfertaRubro._Codigo_Rubro.ToString() +
                                            " and " +
                                            " fm.codigo_mano = m.codigo_mano ";
                OleDbCommand cmdConsultarMan = new OleDbCommand(consultaManoObra, baseOrigen);
                cmdConsultarMan.CommandType = CommandType.Text;
                OleDbDataReader filasMan = cmdConsultarMan.ExecuteReader();
                List<FON_Oferta_Rubro_ManoObra> lstFon_Oferta_Mano =
                    new List<FON_Oferta_Rubro_ManoObra> ();
                while (filasMan.Read())
                {
                    FON_Oferta_Rubro_ManoObra oRubroMan = new FON_Oferta_Rubro_ManoObra();
                    oRubroMan._Codigo_Mano = filasMan.GetInt32(0);
                    oRubroMan._Mano = ((filasMan.GetString(1)).TrimStart()).TrimEnd();
                    oRubroMan._Total_Usd = (Decimal)filasMan.GetDouble(2);
                    lstFon_Oferta_Mano.Add(oRubroMan);
                }
                fonOfertaRubro._Man = lstFon_Oferta_Mano;
                filasMan.Close();
                // Consulto la maquinaria
                string consultaEquipo = " select " +
                                            "  m.codigo_maquinaria," +
                                            "  m.maquinaria," +
                                            "  fm.total_usd" +
                                            " from " +
                                            " o_maquinaria m, oferta_maquinaria fm " +
                                            " where " +
                                            " fm.codigo_oferta = " + codigo_oferta +
                                            " and " +
                                            " fm.codigo_rubro = " + fonOfertaRubro._Codigo_Rubro.ToString() +
                                            " and " +
                                            " fm.codigo_maquinaria = m.codigo_maquinaria ";
                OleDbCommand cmdConsultarMaq = new OleDbCommand(consultaEquipo, baseOrigen);
                cmdConsultarMaq.CommandType = CommandType.Text;
                OleDbDataReader filasMaq = cmdConsultarMaq.ExecuteReader();
                List<FON_Oferta_Rubro_Maquinaria> lstFon_Oferta_Maq =
                    new List<FON_Oferta_Rubro_Maquinaria>();
                while (filasMaq.Read())
                {
                    FON_Oferta_Rubro_Maquinaria oRubroMaq = new FON_Oferta_Rubro_Maquinaria();
                    oRubroMaq._Codigo_Maquinaria = filasMaq.GetInt32(0);
                    oRubroMaq._Maquinaria = ((filasMaq.GetString(1)).TrimStart()).TrimEnd();
                    oRubroMaq._Total_Usd = (Decimal)filasMaq.GetDouble(2);
                    lstFon_Oferta_Maq.Add(oRubroMaq);
                }
                fonOfertaRubro._Maq = lstFon_Oferta_Maq;
                filasMaq.Close();
                // añado el rubro a la oferta
                lstFon_Oferta_Rubro.Add(fonOfertaRubro);
            }
            filas1.Close();
            baseOrigen.Close();

            // Insertamos en el sistema la oferta y los rubros
            // Listados a insertar
            AEL.APU.Apu_Oferta oOferta = new AEL.APU.Apu_Oferta();
            List<AEL.APU.Apu_Oferta_Rubro> lstOferta_Rubro = new List<AEL.APU.Apu_Oferta_Rubro>();
            List<AEL.APU.Apu_Oferta_Rubro_Material> lstOferta_Material = new List<AEL.APU.Apu_Oferta_Rubro_Material>();
            List<AEL.APU.Apu_Oferta_Rubro_Equipo> lstOferta_Equipo = new List<AEL.APU.Apu_Oferta_Rubro_Equipo>();
            List<AEL.APU.Apu_Oferta_Rubro_Mano_Obra> lstOferta_Mano = new List<AEL.APU.Apu_Oferta_Rubro_Mano_Obra>();

            // El usuario de AdmSistemas
            Scope s = new Scope();
            s.Int_Empresa_Id = "1";
            s.Int_Sucursal_Id = "1";
            s.Int_Usuario_Id = "1";
            s.Int_Moneda_Id = "1";
            s.Per_Personal_Id = "1";
            s.Ver_Version_Id = "1";
            // El objeto a insertar
            
            oOferta.Apu_Lugar_Id = "00049013117902126";
            oOferta.Area = 1;
            oOferta.Porcentaje_Costo_Otros = 0;
            oOferta.Creacion_Per_Personal_Id = "1";
            oOferta.Tecnico_Per_Personal_Id = "1";
            oOferta.Etapa = "BOR";
            oOferta.Estado = "BOR";
            oOferta.Tipo_Contrato = "PRI";
            // Información útil
            oOferta.Nombre = lstFon_Oferta[0]._Oferta;
            oOferta.Porcentaje_Costo_Indirecto = lstFon_Oferta[0]._Porcentaje;
            oOferta.Descripcion = lstFon_Oferta[0]._Codigo_Oferta.ToString();
            // Insertar la oferta
            String oOferta_Id;
            oOferta_Id = DEL.APU.DO_Apu_Oferta.Insert(s, oOferta);


            // Insertar rubros en la oferta
            CEL.APU.DO_Apu_Rubro adpCEL_Apu_Rubro = new CEL.APU.DO_Apu_Rubro();
            List<AEL.APU.Apu_Rubro> lstResultadoApu_Rubro = new List<AEL.APU.Apu_Rubro>();

            CEL.APU.DO_Apu_Material adpCEL_Apu_Material = new CEL.APU.DO_Apu_Material();
            List<AEL.APU.Apu_Material> lstResultadoApu_Material = new List<AEL.APU.Apu_Material>();

            CEL.APU.DO_Apu_Equipo adpCEL_Apu_Equipo = new CEL.APU.DO_Apu_Equipo();
            List<AEL.APU.Apu_Equipo> lstResultadoApu_Equipo = new List<AEL.APU.Apu_Equipo>();

            CEL.APU.DO_Apu_Mano_Obra adpCEL_Apu_Mano_Obra = new CEL.APU.DO_Apu_Mano_Obra();
            List<AEL.APU.Apu_Mano_Obra> lstResultadoApu_Mano_Obra = new List<AEL.APU.Apu_Mano_Obra>();
            
            foreach (FON_Oferta_Rubro rubro in lstFon_Oferta_Rubro)
	        {
                AEL.APU.Apu_Oferta_Rubro oOfertaRubro = new AEL.APU.Apu_Oferta_Rubro();
               // Consulta el rubro en la base de rubros por el nombre
                lstResultadoApu_Rubro = adpCEL_Apu_Rubro.GetByNombre(s, rubro._Rubro.TrimEnd().TrimStart(),"1");
                // Inserta el rubro en la oferta
                oOfertaRubro.Apu_Oferta_Id = oOferta_Id;
                oOfertaRubro.Cantidad = rubro._Volumen;
                if (lstResultadoApu_Rubro.Count == 0)
                {   
                    oOfertaRubro.Apu_Rubro_Nombre = rubro._Rubro;
                    oOfertaRubro.Apu_Rubro_Unidad = rubro._Unidad;
                }
                else
                {
                    oOfertaRubro.Apu_Rubro_Id = lstResultadoApu_Rubro[0].Id;
                }
                String oferta_rubro_Id = DEL.APU.DO_Apu_Oferta_Rubro.Insert(s, oOfertaRubro);
                // Inserta los materiales en el rubro de la oferta
                foreach (FON_Oferta_Rubro_Material material in rubro._Mat)
                {
                    // Inserta el material en la base de materiales
                    AEL.APU.Apu_Material oApuMaterial = new AEL.APU.Apu_Material();
                    lstResultadoApu_Material = adpCEL_Apu_Material.GetByNombre(s, material._Material.TrimEnd().TrimStart(), "1");
                    AEL.APU.Apu_Oferta_Rubro_Material oOfertaRubroMaterial = new AEL.APU.Apu_Oferta_Rubro_Material();
                    string Apu_Material_Id;
                    if (lstResultadoApu_Material.Count == 0)
                    {
                        oApuMaterial.Nombre = material._Material;
                        oApuMaterial.Unidad = "Und.";
                        oApuMaterial.Costo_Parcial = material._Total_Usd;
                        oApuMaterial.Disponible = "S";
                        oApuMaterial.Int_Sucursal_Id = "1";
                        oApuMaterial.Int_Moneda_Id = "1";
                        Apu_Material_Id = adpCEL_Apu_Material.Insert(s, oApuMaterial);
                    }
                    else
                        Apu_Material_Id = lstResultadoApu_Material[0].Id;
                    // Inserta el material en la oferta
                    oOfertaRubroMaterial.Apu_Oferta_Id = oOferta_Id;
                    oOfertaRubroMaterial.Apu_Oferta_Rubro_Id = oferta_rubro_Id;
                    oOfertaRubroMaterial.Apu_Material_Id = Apu_Material_Id;
                    oOfertaRubroMaterial.Costo = material._Total_Usd;
                    DEL.APU.DO_Apu_Oferta_Rubro_Material.Insert(s, oOfertaRubroMaterial);
                }
                // Inserta el equipo en la oferta
                foreach (FON_Oferta_Rubro_Maquinaria equipo in rubro._Maq)
                {
                    // Inserta el equipo en la base de equipos
                    AEL.APU.Apu_Equipo oApuEquipo = new AEL.APU.Apu_Equipo();
                    lstResultadoApu_Equipo = adpCEL_Apu_Equipo.GetByNombre(s, equipo._Maquinaria.TrimEnd().TrimStart(), "1");
                    AEL.APU.Apu_Oferta_Rubro_Equipo oOfertaRubroEquipo = new AEL.APU.Apu_Oferta_Rubro_Equipo();
                    string Apu_Equipo_Id;
                    if (lstResultadoApu_Equipo.Count == 0)
                    {
                        oApuEquipo.Nombre = equipo._Maquinaria;
                        oApuEquipo.Disponible = "S";
                        oApuEquipo.Costo_Otros = equipo._Total_Usd;
                        oApuEquipo.Int_Sucursal_Id = "1";
                        oApuEquipo.Int_Moneda_Id = "1";
                        Apu_Equipo_Id = adpCEL_Apu_Equipo.Insert(s, oApuEquipo);
                    }
                    else
                        Apu_Equipo_Id = lstResultadoApu_Equipo[0].Id;
                    oOfertaRubroEquipo.Apu_Oferta_Id = oOferta_Id;
                    oOfertaRubroEquipo.Apu_Oferta_Rubro_Id = oferta_rubro_Id;
                    oOfertaRubroEquipo.Apu_Equipo_Id = Apu_Equipo_Id;
                    oOfertaRubroEquipo.Costo = equipo._Total_Usd;
                    DEL.APU.DO_Apu_Oferta_Rubro_Equipo.Insert(s, oOfertaRubroEquipo);
                }
                // Inserta la mano de obra en la oferta
                foreach (FON_Oferta_Rubro_ManoObra mano in rubro._Man)
                {
                    // Inserta la mano de obra en la base general
                    AEL.APU.Apu_Mano_Obra oApuManoObra = new AEL.APU.Apu_Mano_Obra();
                    lstResultadoApu_Mano_Obra = adpCEL_Apu_Mano_Obra.GetByNombre(s, mano._Mano.TrimEnd().TrimStart(), "1");
                    AEL.APU.Apu_Oferta_Rubro_Mano_Obra oOfertaRubroMano = new AEL.APU.Apu_Oferta_Rubro_Mano_Obra();
                    string Apu_Mano_Obra_Id;
                    if (lstResultadoApu_Mano_Obra.Count == 0)
                    {
                        oApuManoObra.Nombre = mano._Mano;
                        oApuManoObra.Disponible = "S";
                        oApuManoObra.Costo_Diario =(decimal) 15.48;
                        oApuManoObra.Int_Sucursal_Id = "1";
                        oApuManoObra.Int_Moneda_Id = "1";
                        Apu_Mano_Obra_Id = adpCEL_Apu_Mano_Obra.Insert(s, oApuManoObra);
                    }
                    else
                        Apu_Mano_Obra_Id = lstResultadoApu_Mano_Obra[0].Id;
                    oOfertaRubroMano.Apu_Oferta_Id = oOferta_Id;
                    oOfertaRubroMano.Apu_Oferta_Rubro_Id = oferta_rubro_Id;
                    oOfertaRubroMano.Apu_Mano_Obra_Id = Apu_Mano_Obra_Id;
                    oOfertaRubroMano.Costo = mano._Total_Usd;
                    DEL.APU.DO_Apu_Oferta_Rubro_Mano_Obra.Insert(s, oOfertaRubroMano);
                }
	        } 

        }
    }
}
