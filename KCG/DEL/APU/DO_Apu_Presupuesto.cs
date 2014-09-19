using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using AEL.APU;
using BEL;
using CEL.APU;
using HER;

namespace DEL.APU
{
    public class DO_Apu_Presupuesto
    {
        #region Adapter

        private static CEL.APU.DO_Apu_Proyecto _adpApu_Proyecto;
        private static CEL.APU.DO_Apu_Proyecto adpApu_Proyecto
        {
            get
            {
                if (_adpApu_Proyecto == null)
                    _adpApu_Proyecto = new CEL.APU.DO_Apu_Proyecto();
                return _adpApu_Proyecto;
            }
        }

        private static CEL.APU.DO_Apu_Oferta _adpApu_Oferta;
        private static CEL.APU.DO_Apu_Oferta adpApu_Oferta
        {
            get
            {
                if (_adpApu_Oferta == null)
                    _adpApu_Oferta = new CEL.APU.DO_Apu_Oferta();
                return _adpApu_Oferta;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Rubro _adpApu_Proyecto_Rubro;
        private static CEL.APU.DO_Apu_Proyecto_Rubro adpApu_Proyecto_Rubro
        {
            get
            {
                if (_adpApu_Proyecto_Rubro == null)
                    _adpApu_Proyecto_Rubro = new CEL.APU.DO_Apu_Proyecto_Rubro();
                return _adpApu_Proyecto_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Rubro _adpApu_Oferta_Rubro;
        private static CEL.APU.DO_Apu_Oferta_Rubro adpApu_Oferta_Rubro
        {
            get
            {
                if (_adpApu_Oferta_Rubro == null)
                    _adpApu_Oferta_Rubro = new CEL.APU.DO_Apu_Oferta_Rubro();
                return _adpApu_Oferta_Rubro;
            }
        }

     
        private static CEL.APU.DO_Apu_Parametros _adpApu_Parametros;
        private static CEL.APU.DO_Apu_Parametros adpApu_Parametros
        {
            get
            {
                if (_adpApu_Parametros == null)
                    _adpApu_Parametros = new CEL.APU.DO_Apu_Parametros();
                return _adpApu_Parametros;

            }
        }


        private static CEL.APU.DO_Apu_Presupuesto _adpApu_Presupuesto;
        private static CEL.APU.DO_Apu_Presupuesto adpApu_Presupuesto
        {
            get
            {
                if (_adpApu_Presupuesto == null)
                    _adpApu_Presupuesto = new CEL.APU.DO_Apu_Presupuesto();
                return _adpApu_Presupuesto;
            }
        }

        private static CEL.APU.DO_Apu_Presupuesto_Rubro _adpApu_Presupuesto_Rubro;
        private static CEL.APU.DO_Apu_Presupuesto_Rubro adpApu_Presupuesto_Rubro
        {
            get
            {
                if (_adpApu_Presupuesto_Rubro == null)
                    _adpApu_Presupuesto_Rubro = new CEL.APU.DO_Apu_Presupuesto_Rubro();
                return _adpApu_Presupuesto_Rubro;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Indice _adpApu_Proyecto_Indice;
        private static CEL.APU.DO_Apu_Proyecto_Indice adpApu_Proyecto_Indice
        {
            get
            {
                if (_adpApu_Proyecto_Indice == null)
                    _adpApu_Proyecto_Indice = new CEL.APU.DO_Apu_Proyecto_Indice();
                return _adpApu_Proyecto_Indice;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Indice _adpApu_Oferta_Indice;
        private static CEL.APU.DO_Apu_Oferta_Indice adpApu_Oferta_Indice
        {
            get
            {
                if (_adpApu_Oferta_Indice == null)
                    _adpApu_Oferta_Indice = new DO_Apu_Oferta_Indice();
                return _adpApu_Oferta_Indice;
            }
        }

        private static CEL.APU.DO_Apu_Presupuesto_Formula _adpApu_Presupuesto_Formula;
        private static CEL.APU.DO_Apu_Presupuesto_Formula adpApu_Presupuesto_Formula
        {
            get
            {
                if (_adpApu_Presupuesto_Formula == null)
                    _adpApu_Presupuesto_Formula = new CEL.APU.DO_Apu_Presupuesto_Formula();
                return _adpApu_Presupuesto_Formula;
            }
        }

        private static CEL.APU.DO_Apu_Indice _adpApu_Indice;
        private static CEL.APU.DO_Apu_Indice adpApu_Indice
        {
            get
            {
                if (_adpApu_Indice == null)
                    _adpApu_Indice = new CEL.APU.DO_Apu_Indice();
                return _adpApu_Indice;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Diferencia _adpApu_Proyecto_Diferencia;
        private static CEL.APU.DO_Apu_Proyecto_Diferencia adpApu_Proyecto_Diferencia
        {
            get
            {
                if (_adpApu_Proyecto_Diferencia == null)
                    _adpApu_Proyecto_Diferencia = new CEL.APU.DO_Apu_Proyecto_Diferencia();
                return _adpApu_Proyecto_Diferencia;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Diferencia _adpApu_Oferta_Diferencia;
        private static CEL.APU.DO_Apu_Oferta_Diferencia adpApu_Oferta_Diferencia
        {
            get
            {
                if (_adpApu_Oferta_Diferencia == null)
                    _adpApu_Oferta_Diferencia = new DO_Apu_Oferta_Diferencia();
                return _adpApu_Oferta_Diferencia;
            }
        }


        private static CEL.APU.DO_Apu_Presupuesto_Cuadrilla _adpApu_Presupuesto_Cuadrilla;
        private static CEL.APU.DO_Apu_Presupuesto_Cuadrilla adpApu_Presupuesto_Cuadrilla
        {
            get
            {
                if (_adpApu_Presupuesto_Cuadrilla == null)
                    _adpApu_Presupuesto_Cuadrilla = new CEL.APU.DO_Apu_Presupuesto_Cuadrilla();
                return _adpApu_Presupuesto_Cuadrilla;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Cuadrilla _adpApu_Proyecto_Cuadrilla;
        private static CEL.APU.DO_Apu_Proyecto_Cuadrilla adpApu_Proyecto_Cuadrilla
        {
            get
            {
                if (_adpApu_Proyecto_Cuadrilla == null)
                    _adpApu_Proyecto_Cuadrilla = new CEL.APU.DO_Apu_Proyecto_Cuadrilla();
                return _adpApu_Proyecto_Cuadrilla;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Cuadrilla _adpApu_Oferta_Cuadrilla;
        private static CEL.APU.DO_Apu_Oferta_Cuadrilla adpApu_Oferta_Cuadrilla
        {
            get
            {
                if (_adpApu_Oferta_Cuadrilla == null)
                    _adpApu_Oferta_Cuadrilla = new DO_Apu_Oferta_Cuadrilla();
                return _adpApu_Oferta_Cuadrilla;
            }
        }

        private static CEL.APU.DO_Apu_Proyecto_Cuadrilla_Diferencia _adpApu_Proyecto_Cuadrilla_Diferencia;
        private static CEL.APU.DO_Apu_Proyecto_Cuadrilla_Diferencia adpApu_Proyecto_Cuadrilla_Diferencia
        {
            get
            {
                if (_adpApu_Proyecto_Cuadrilla_Diferencia == null)
                    _adpApu_Proyecto_Cuadrilla_Diferencia = new CEL.APU.DO_Apu_Proyecto_Cuadrilla_Diferencia();
                return _adpApu_Proyecto_Cuadrilla_Diferencia;
            }
        }

        private static CEL.APU.DO_Apu_Oferta_Cuadrilla_Diferencia _adpApu_Oferta_Cuadrilla_Diferencia;
        private static CEL.APU.DO_Apu_Oferta_Cuadrilla_Diferencia adpApu_Oferta_Cuadrilla_Diferencia
        {
            get
            {
                if (_adpApu_Oferta_Cuadrilla_Diferencia == null)
                    _adpApu_Oferta_Cuadrilla_Diferencia = new DO_Apu_Oferta_Cuadrilla_Diferencia();
                return _adpApu_Oferta_Cuadrilla_Diferencia;
            }
        }

        #endregion


        public static bool Insert_Proyecto(Scope s, object p_Objeto, SqlTransaction PTransaction, string Tipo)
        {

            bool resultado = true;
            bool resultado_ins_det = true;
            string apu_proyecto_id;
            string apu_presupuesto_id;
           
            Exception ex = new Exception("");

            Apu_Proyecto p_Objeto_ = (Apu_Proyecto)p_Objeto;

            try
            {
                if (p_Objeto_.Codigo_Institucion.Replace("-", "").Replace("_", "") == "")
                {
                    Error.EmitirExcepcion(TXT_Mensajes._MSJ110, ex.Message);
                }
                adpApu_Parametros.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto.Adapter.Transaction = PTransaction;

                apu_proyecto_id = p_Objeto_.Id;

                //Insercion de Parametros del Presupuesto

                List<Apu_Parametros> lstApu_Parametros = adpApu_Parametros.GetBySucursal(s);

                if (lstApu_Parametros.Count == 1)
                {
                    foreach (Apu_Parametros oApu_Parametros in lstApu_Parametros)
                    {
                        Apu_Presupuesto oApu_Presupuesto = new Apu_Presupuesto();
                        oApu_Presupuesto.Apu_Origen_Id = apu_proyecto_id;
                        oApu_Presupuesto.Apu_Origen_Codigo = p_Objeto_.Codigo;
                        oApu_Presupuesto.Apu_Origen_Nombre = p_Objeto_.Nombre;
                        oApu_Presupuesto.Origen = Tipo;
                        oApu_Presupuesto.Costo_Directo = p_Objeto_.Costo_Directo;
                        oApu_Presupuesto.Costo_Indirecto = p_Objeto_.Costo_Indirecto;
                        oApu_Presupuesto.Costo_Otros = p_Objeto_.Costo_Otros;
                        oApu_Presupuesto.Costo_Total = p_Objeto_.Costo_Total;

                        oApu_Presupuesto.Equipo_Apu_Indice_Id = oApu_Parametros.Equipo_Apu_Indice_Id;
                        oApu_Presupuesto.ManoObra_Apu_Indice_Id = oApu_Parametros.ManoObra_Apu_Indice_Id;
                        oApu_Presupuesto.Porcentaje_Costo_Indirecto = oApu_Parametros.Porcentaje_Costo_Indirecto;
                        oApu_Presupuesto.Int_Sucursal_Id = oApu_Parametros.Int_Sucursal_Id;
                        oApu_Presupuesto.Apu_Mano_Obra_Id = oApu_Parametros.Apu_Mano_Obra_Id;
                        oApu_Presupuesto.Estado = "DIS";
                        apu_presupuesto_id = adpApu_Presupuesto.Insert(s, oApu_Presupuesto);

                        resultado_ins_det = Insert_Proyecto_Det(s,p_Objeto_, oApu_Presupuesto, PTransaction,"DIS");

                        if (resultado_ins_det == false)
                            resultado = false;
                        else
                            resultado = true;

                    }
                }
                

            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;
        }


        public static bool Actualiza_Presupuesto(Scope s, object p_Objeto, SqlTransaction PTransaction, string Tipo)
        {

            bool resultado = true;
            bool resultado_ins_det = true;
            string apu_origen_id;
            string apu_presupuesto_id;

            Exception ex = new Exception("");

            Apu_Presupuesto p_Objeto_ = (Apu_Presupuesto)p_Objeto;

            try
            {
                apu_presupuesto_id = p_Objeto_.Id;
                apu_origen_id = p_Objeto_.Apu_Origen_Id;

                //adpApu_Presupuesto.Adapter.Transaction = PTransaction;
                adpApu_Proyecto.Adapter.Transaction = PTransaction;
                adpApu_Oferta.Adapter.Transaction = PTransaction;

                if (p_Objeto_.Origen == "PRO")
                {
                    Apu_Proyecto oApuProyecto = adpApu_Proyecto.GetById(s, apu_origen_id)[0];
                    resultado_ins_det = Insert_Proyecto_Det(s, oApuProyecto, p_Objeto_, PTransaction, "REA");
                }
                else
                {
                    Apu_Oferta oApuOferta = adpApu_Oferta.GetById(s, apu_origen_id)[0];
                    resultado_ins_det = Insert_Oferta_Det(s, oApuOferta, p_Objeto_, PTransaction, "REA");
                }


         

                if (resultado_ins_det == false)
                    resultado = false;
                else
                    resultado = true;


            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;
        }

        //public static bool Actualiza_Presupuesto_Oferta(Scope s, object p_Objeto, SqlTransaction PTransaction, string Tipo)
        //{

        //    bool resultado = true;
        //    bool resultado_ins_det = true;
        //    string apu_oferta_id;
        //    string apu_presupuesto_id;

        //    Exception ex = new Exception("");

        //    Apu_Presupuesto p_Objeto_ = (Apu_Presupuesto)p_Objeto;

        //    try
        //    {
        //        apu_presupuesto_id = p_Objeto_.Id;
        //        apu_oferta_id = p_Objeto_.Apu_Origen_Id;

        //        adpApu_Presupuesto.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto.Adapter.Transaction = PTransaction;
        //        Apu_Oferta oApuOferta = adpApu_Oferta.GetById(s, apu_oferta_id)[0];

        //        resultado_ins_det = Insert_Oferta_Det(s, oApuOferta, p_Objeto_, PTransaction, "REA");

        //        if (resultado_ins_det == false)
        //            resultado = false;
        //        else
        //            resultado = true;


        //    }
        //    catch (Exception e)
        //    {
        //        resultado = false;
        //        throw (e);
        //    }

        //    return resultado;
        //}


        public static bool Insert_Proyecto_Det(Scope s, Apu_Proyecto oApu_Proyecto, Apu_Presupuesto oApu_Presupuesto, SqlTransaction PTransaction, string Estado_Presupuesto)
        {
            string apu_proyecto_id, apu_presupuesto_id;
            string apu_indice_codigo_dif = "-1";
            decimal apu_coeficiente_dif = 0;
            decimal apu_costo_total_dif = 0;
            string resultado_ins;
            bool resultado=true;

            apu_proyecto_id = oApu_Proyecto.Id;
            apu_presupuesto_id = oApu_Presupuesto.Id;

            try
            {

                adpApu_Presupuesto_Formula.Adapter.Transaction = PTransaction;
                adpApu_Indice.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Rubro.Adapter.Transaction = PTransaction;
                adpApu_Proyecto_Rubro.Adapter.Transaction = PTransaction;

                //Insercion en Apu_Presupuesto_Rubro.

                List<Apu_Proyecto_Rubro> lstApu_Proyecto_Rubro = adpApu_Proyecto_Rubro.GetByProyecto(s, apu_proyecto_id);

                if (lstApu_Proyecto_Rubro.Count > 0)
                {
                    foreach (Apu_Proyecto_Rubro oApu_Proyecto_Rubro in lstApu_Proyecto_Rubro)
                    {
                        Apu_Presupuesto_Rubro oApu_Presupuesto_Rubro = new Apu_Presupuesto_Rubro();
                        oApu_Presupuesto_Rubro.Apu_Presupuesto_Id = apu_presupuesto_id;
                        oApu_Presupuesto_Rubro.Apu_Rubro_id = oApu_Proyecto_Rubro.Apu_Rubro_Id;
                        oApu_Presupuesto_Rubro.Apu_Rubro_Codigo = oApu_Proyecto_Rubro.Apu_Rubro_Codigo;
                        oApu_Presupuesto_Rubro.Apu_Rubro_Nombre = oApu_Proyecto_Rubro.Apu_Rubro_Nombre;
                        oApu_Presupuesto_Rubro.Apu_Rubro_Unidad = oApu_Proyecto_Rubro.Apu_Rubro_Unidad;
                        oApu_Presupuesto_Rubro.Apu_Rubro_Cantidad = oApu_Proyecto_Rubro.Cantidad;
                        oApu_Presupuesto_Rubro.Costo_Unitario = oApu_Proyecto_Rubro.Costo_Unitario;
                        oApu_Presupuesto_Rubro.Costo_Total = oApu_Proyecto_Rubro.Costo_Total;
                        oApu_Presupuesto_Rubro.Apu_Subtitulo_Id = oApu_Proyecto_Rubro.Apu_Subtitulo_id;
                        oApu_Presupuesto_Rubro.Estado = Estado_Presupuesto;
                        resultado_ins=adpApu_Presupuesto_Rubro.Insert(s, oApu_Presupuesto_Rubro);

                    }
                }


                //Insercion de Apu_Presupuesto_Formula.

                List<Apu_Proyecto_Diferencia> lstApu_Proyecto_Diferencia = adpApu_Proyecto_Diferencia.GetByProyecto(s, apu_proyecto_id);
                if (lstApu_Proyecto_Diferencia.Count > 0)
                {
                    apu_indice_codigo_dif = lstApu_Proyecto_Diferencia[0].Apu_Indice_Codigo;
                    apu_coeficiente_dif = lstApu_Proyecto_Diferencia[0].Coeficiente;
                    apu_costo_total_dif = lstApu_Proyecto_Diferencia[0].costo_total;
                }

                List<Apu_Proyecto_Indice> lstApu_Proyecto_Indice = adpApu_Proyecto_Indice.Get(s, apu_proyecto_id);
                if (lstApu_Proyecto_Indice.Count > 0)
                {
                    foreach (Apu_Proyecto_Indice oApu_Proyecto_Indice in lstApu_Proyecto_Indice)
                    {
                        if (oApu_Proyecto_Indice.Apu_Indice_Codigo != null)
                        {
                            Apu_Indice oApu_Indice = adpApu_Indice.GetByCodigo(s, oApu_Proyecto_Indice.Apu_Indice_Codigo)[0];
                            Apu_Presupuesto_Formula oApu_Presupuesto_Formula = new Apu_Presupuesto_Formula();
                            oApu_Presupuesto_Formula.Apu_Presupuesto_Id = apu_presupuesto_id;
                            oApu_Presupuesto_Formula.Apu_Indice_Id = oApu_Indice.Id;
                            oApu_Presupuesto_Formula.Apu_Indice_Codigo = oApu_Proyecto_Indice.Apu_Indice_Codigo;
                            oApu_Presupuesto_Formula.Apu_Indice_Nombre = oApu_Proyecto_Indice.Apu_Indice_Nombre;
                            if (oApu_Presupuesto_Formula.Apu_Indice_Codigo == apu_indice_codigo_dif && lstApu_Proyecto_Diferencia.Count > 0)
                            {
                                oApu_Proyecto_Indice.Coeficiente = oApu_Proyecto_Indice.Coeficiente + apu_coeficiente_dif;
                                oApu_Proyecto_Indice.Costo_Total = oApu_Proyecto_Indice.Costo_Total + apu_costo_total_dif;
                            }

                            oApu_Presupuesto_Formula.Costo_Total = oApu_Proyecto_Indice.Costo_Total;
                            oApu_Presupuesto_Formula.Coeficiente = oApu_Proyecto_Indice.Coeficiente;
                            oApu_Presupuesto_Formula.Letra = oApu_Proyecto_Indice.Letra;
                            oApu_Presupuesto_Formula.Estado = Estado_Presupuesto;
                            adpApu_Presupuesto_Formula.Insert(s, oApu_Presupuesto_Formula);
                        }
                    }
                }


                //Insercion en Apu_Presupuesto_Cuadrilla
                List<Apu_Proyecto_Cuadrilla_Diferencia> lstApu_Proyecto_Cuadrilla_Diferencia = adpApu_Proyecto_Cuadrilla_Diferencia.GetByProyecto(s, apu_proyecto_id);
                if (lstApu_Proyecto_Cuadrilla_Diferencia.Count > 0)
                {
                    apu_indice_codigo_dif = lstApu_Proyecto_Cuadrilla_Diferencia[0].Apu_Cuadrilla_Codigo;
                    apu_coeficiente_dif = lstApu_Proyecto_Cuadrilla_Diferencia[0].Coeficiente;
                    apu_costo_total_dif = lstApu_Proyecto_Cuadrilla_Diferencia[0].Costo_Total;
                }

                List<Apu_Proyecto_Cuadrilla> lstApu_Proyecto_Cuadrilla = adpApu_Proyecto_Cuadrilla.Get(s, apu_proyecto_id);
                if (lstApu_Proyecto_Cuadrilla.Count > 0)
                {
                    foreach (Apu_Proyecto_Cuadrilla oApu_Proyecto_Cuadrilla in lstApu_Proyecto_Cuadrilla)
                    {
                        Apu_Presupuesto_Cuadrilla oApu_Presupuesto_Cuadrilla = new Apu_Presupuesto_Cuadrilla();
                        oApu_Presupuesto_Cuadrilla.Apu_Presupuesto_Id = apu_presupuesto_id;
                        oApu_Presupuesto_Cuadrilla.Origen = oApu_Proyecto_Cuadrilla.Origen;
                        oApu_Presupuesto_Cuadrilla.Origen_Id = oApu_Proyecto_Cuadrilla.Apu_Categoria_Id;
                        oApu_Presupuesto_Cuadrilla.Origen_Codigo = oApu_Proyecto_Cuadrilla.Apu_Cuadrilla_Codigo;

                        if (oApu_Presupuesto_Cuadrilla.Origen_Codigo == apu_indice_codigo_dif && lstApu_Proyecto_Cuadrilla_Diferencia.Count > 0)
                        {
                            oApu_Proyecto_Cuadrilla.Coeficiente = oApu_Proyecto_Cuadrilla.Coeficiente + apu_coeficiente_dif;
                            oApu_Proyecto_Cuadrilla.Costo_Total = oApu_Proyecto_Cuadrilla.Costo_Total + apu_costo_total_dif;
                        }
                        oApu_Presupuesto_Cuadrilla.Origen_Nombre = oApu_Proyecto_Cuadrilla.Apu_Cuadrilla_Nombre;
                        oApu_Presupuesto_Cuadrilla.Costo_Total = oApu_Proyecto_Cuadrilla.Costo_Total;
                        oApu_Presupuesto_Cuadrilla.Salario_Real = oApu_Proyecto_Cuadrilla.Costo_Hora;
                        oApu_Presupuesto_Cuadrilla.Numero_Trabajadores = oApu_Proyecto_Cuadrilla.Numero_trabajadores;
                        oApu_Presupuesto_Cuadrilla.Coeficiente = oApu_Proyecto_Cuadrilla.Coeficiente;
                        oApu_Presupuesto_Cuadrilla.Estado = Estado_Presupuesto;
                        adpApu_Presupuesto_Cuadrilla.Insert(s, oApu_Presupuesto_Cuadrilla);
                    }
                }
                resultado = true;
            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }
            return resultado;

        }

        public static bool Insert_Oferta(Scope s, object p_Objeto, SqlTransaction PTransaction, string Tipo)
        {


            bool resultado = true;
            bool resultado_ins_det = true;
            string apu_oferta_id;
            string apu_presupuesto_id;

            Exception ex = new Exception("");

            Apu_Oferta p_Objeto_ = (Apu_Oferta)p_Objeto;

            try
            {
                if (p_Objeto_.Codigo_Institucion.Replace("-", "").Replace("_", "") == "")
                {
                    Error.EmitirExcepcion(TXT_Mensajes._MSJ110, ex.Message);
                }

                adpApu_Parametros.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Formula.Adapter.Transaction = PTransaction;
                adpApu_Indice.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Rubro.Adapter.Transaction = PTransaction;

                apu_oferta_id = p_Objeto_.Id;

                //Insercion de Parametros del Presupuesto

                List<Apu_Parametros> lstApu_Parametros = adpApu_Parametros.GetBySucursal(s);

                if (lstApu_Parametros.Count == 1)
                {
                    foreach (Apu_Parametros oApu_Parametros in lstApu_Parametros)
                    {
                        Apu_Presupuesto oApu_Presupuesto = new Apu_Presupuesto();
                        oApu_Presupuesto.Apu_Origen_Id = apu_oferta_id;
                        oApu_Presupuesto.Apu_Origen_Codigo = p_Objeto_.Codigo;
                        oApu_Presupuesto.Apu_Origen_Nombre = p_Objeto_.Nombre;
                        oApu_Presupuesto.Origen = Tipo;
                        oApu_Presupuesto.Costo_Directo = p_Objeto_.Costo_Directo;
                        oApu_Presupuesto.Costo_Indirecto = p_Objeto_.Costo_Indirecto;
                        oApu_Presupuesto.Costo_Otros = p_Objeto_.Costo_Otros;
                        oApu_Presupuesto.Costo_Total = p_Objeto_.Costo_Total;

                        oApu_Presupuesto.Equipo_Apu_Indice_Id = oApu_Parametros.Equipo_Apu_Indice_Id;
                        oApu_Presupuesto.ManoObra_Apu_Indice_Id = oApu_Parametros.ManoObra_Apu_Indice_Id;
                        oApu_Presupuesto.Porcentaje_Costo_Indirecto = oApu_Parametros.Porcentaje_Costo_Indirecto;
                        oApu_Presupuesto.Int_Sucursal_Id = oApu_Parametros.Int_Sucursal_Id;
                        oApu_Presupuesto.Apu_Mano_Obra_Id = oApu_Parametros.Apu_Mano_Obra_Id;
                        oApu_Presupuesto.Estado = "DIS";
                        apu_presupuesto_id = adpApu_Presupuesto.Insert(s, oApu_Presupuesto);

                        resultado_ins_det = Insert_Oferta_Det(s, p_Objeto_, oApu_Presupuesto, PTransaction, "DIS");

                        if (resultado_ins_det == false)
                            resultado = false;
                        else
                            resultado = true;


                     
                    }
                }
                resultado = true;

            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;
        }

        public static bool Insert_Oferta_Det(Scope s, Apu_Oferta oApu_Oferta, Apu_Presupuesto oApu_Presupuesto, SqlTransaction PTransaction, string Estado_Presupuesto)
        {

            bool resultado = true;
            string apu_oferta_id;
            string apu_presupuesto_id;
            string apu_indice_codigo_dif = "-1";
            decimal apu_coeficiente_dif = 0;
            decimal apu_costo_total_dif = 0;
            Exception ex = new Exception("");
            
            apu_oferta_id = oApu_Oferta.Id;
            apu_presupuesto_id = oApu_Presupuesto.Id;

            try
            {

                adpApu_Presupuesto_Formula.Adapter.Transaction = PTransaction;
                adpApu_Indice.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Rubro.Adapter.Transaction = PTransaction;


                    //Insercion en Apu_Presupuesto_Rubro.
                    List<Apu_Oferta_Rubro> lstApu_Oferta_Rubro = adpApu_Oferta_Rubro.GetByOferta(s, apu_oferta_id);
                    if (lstApu_Oferta_Rubro.Count > 0)
                    {
                        foreach (Apu_Oferta_Rubro oApu_Oferta_Rubro in lstApu_Oferta_Rubro)
                        {
                            Apu_Presupuesto_Rubro oApu_Presupuesto_Rubro = new Apu_Presupuesto_Rubro();
                            oApu_Presupuesto_Rubro.Apu_Presupuesto_Id = apu_presupuesto_id;
                            oApu_Presupuesto_Rubro.Apu_Rubro_id = oApu_Oferta_Rubro.Apu_Rubro_Id;
                            oApu_Presupuesto_Rubro.Apu_Rubro_Codigo = oApu_Oferta_Rubro.Apu_Rubro_Codigo;
                            oApu_Presupuesto_Rubro.Apu_Rubro_Nombre = oApu_Oferta_Rubro.Apu_Rubro_Nombre;
                            oApu_Presupuesto_Rubro.Apu_Rubro_Unidad = oApu_Oferta_Rubro.Apu_Rubro_Unidad;
                            oApu_Presupuesto_Rubro.Apu_Rubro_Cantidad = oApu_Oferta_Rubro.Cantidad;
                            oApu_Presupuesto_Rubro.Costo_Unitario = oApu_Oferta_Rubro.Costo_Unitario;
                            oApu_Presupuesto_Rubro.Costo_Total = oApu_Oferta_Rubro.Costo_Total;
                            oApu_Presupuesto_Rubro.Apu_Subtitulo_Id = null;
                            oApu_Presupuesto_Rubro.Estado = Estado_Presupuesto;
                            adpApu_Presupuesto_Rubro.Insert(s, oApu_Presupuesto_Rubro);

                        }
                    }

                    //Insercion de Apu_Presupuesto_Formula.
                    List<Apu_Oferta_Diferencia> lstApu_Oferta_Diferencia = adpApu_Oferta_Diferencia.GetByOferta(s, apu_oferta_id);
                    if (lstApu_Oferta_Diferencia.Count > 0)
                    {
                        apu_indice_codigo_dif = lstApu_Oferta_Diferencia[0].Apu_Indice_Codigo;
                        apu_coeficiente_dif = lstApu_Oferta_Diferencia[0].coeficiente;
                        apu_costo_total_dif = lstApu_Oferta_Diferencia[0].costo_total;
                    }

                    List<Apu_Oferta_Indice> lstApu_Oferta_Indice = adpApu_Oferta_Indice.Get(s, apu_oferta_id);
                    if (lstApu_Oferta_Indice.Count > 0)
                    {
                        foreach (Apu_Oferta_Indice oApu_Oferta_Indice in lstApu_Oferta_Indice)
                        {
                            if (oApu_Oferta_Indice.Apu_Indice_Codigo != null)
                            {
                                Apu_Indice oApu_Indice = adpApu_Indice.GetByCodigo(s, oApu_Oferta_Indice.Apu_Indice_Codigo)[0];
                                Apu_Presupuesto_Formula oApu_Presupuesto_Formula = new Apu_Presupuesto_Formula();
                                oApu_Presupuesto_Formula.Apu_Presupuesto_Id = apu_presupuesto_id;
                                oApu_Presupuesto_Formula.Apu_Indice_Id = oApu_Indice.Id;
                                oApu_Presupuesto_Formula.Apu_Indice_Codigo = oApu_Oferta_Indice.Apu_Indice_Codigo;
                                oApu_Presupuesto_Formula.Apu_Indice_Nombre = oApu_Oferta_Indice.Apu_Indice_Nombre;
                                if (oApu_Presupuesto_Formula.Apu_Indice_Codigo == apu_indice_codigo_dif)
                                {
                                    oApu_Oferta_Indice.Coeficiente = oApu_Oferta_Indice.Coeficiente + apu_coeficiente_dif;
                                    oApu_Oferta_Indice.Costo_Total = oApu_Oferta_Indice.Costo_Total + apu_costo_total_dif;
                                }

                                oApu_Presupuesto_Formula.Costo_Total = oApu_Oferta_Indice.Costo_Total;
                                oApu_Presupuesto_Formula.Coeficiente = oApu_Oferta_Indice.Coeficiente;
                                oApu_Presupuesto_Formula.Letra = oApu_Oferta_Indice.Letra;
                                oApu_Presupuesto_Formula.Estado = Estado_Presupuesto;
                                adpApu_Presupuesto_Formula.Insert(s, oApu_Presupuesto_Formula);
                            }

                        }
                    }

                    //Insercion en Apu_Presupuesto_Cuadrilla
                    List<Apu_Oferta_Cuadrilla_Diferencia> lstApu_Oferta_Cuadrilla_Diferencia = adpApu_Oferta_Cuadrilla_Diferencia.GetByOferta(s, apu_oferta_id);
                    if (lstApu_Oferta_Cuadrilla_Diferencia.Count > 0)
                    {
                        apu_indice_codigo_dif = lstApu_Oferta_Cuadrilla_Diferencia[0].Apu_Cuadrilla_Codigo;
                        apu_coeficiente_dif = lstApu_Oferta_Cuadrilla_Diferencia[0].Coeficiente;
                        apu_costo_total_dif = lstApu_Oferta_Cuadrilla_Diferencia[0].costo_total;
                    }

                    List<Apu_Oferta_Cuadrilla> lstApu_Oferta_Cuadrilla = adpApu_Oferta_Cuadrilla.Get(s, apu_oferta_id);
                    if (lstApu_Oferta_Cuadrilla.Count > 0)
                    {
                        foreach (Apu_Oferta_Cuadrilla oApu_Oferta_Cuadrilla in lstApu_Oferta_Cuadrilla)
                        {
                            Apu_Presupuesto_Cuadrilla oApu_Presupuesto_Cuadrilla = new Apu_Presupuesto_Cuadrilla();
                            oApu_Presupuesto_Cuadrilla.Apu_Presupuesto_Id = apu_presupuesto_id;
                            oApu_Presupuesto_Cuadrilla.Origen = oApu_Oferta_Cuadrilla.Origen;
                            oApu_Presupuesto_Cuadrilla.Origen_Id = oApu_Oferta_Cuadrilla.Apu_Categoria_Id;
                            oApu_Presupuesto_Cuadrilla.Origen_Codigo = oApu_Oferta_Cuadrilla.Apu_Cuadrilla_Codigo;

                            if (oApu_Presupuesto_Cuadrilla.Origen_Codigo == apu_indice_codigo_dif)
                            {
                                oApu_Oferta_Cuadrilla.Coeficiente = oApu_Oferta_Cuadrilla.Coeficiente + apu_coeficiente_dif;
                                oApu_Oferta_Cuadrilla.Costo_Total = oApu_Oferta_Cuadrilla.Costo_Total + apu_costo_total_dif;
                            }
                            oApu_Presupuesto_Cuadrilla.Origen_Nombre = oApu_Oferta_Cuadrilla.Apu_Cuadrilla_Nombre;
                            oApu_Presupuesto_Cuadrilla.Costo_Total = oApu_Oferta_Cuadrilla.Costo_Total;
                            oApu_Presupuesto_Cuadrilla.Salario_Real = oApu_Oferta_Cuadrilla.Costo_Hora;
                            oApu_Presupuesto_Cuadrilla.Numero_Trabajadores = oApu_Oferta_Cuadrilla.Numero_trabajadores;
                            oApu_Presupuesto_Cuadrilla.Coeficiente = oApu_Oferta_Cuadrilla.Coeficiente;
                            oApu_Presupuesto_Cuadrilla.Estado = Estado_Presupuesto;
                            adpApu_Presupuesto_Cuadrilla.Insert(s, oApu_Presupuesto_Cuadrilla);
                        }
                    }

                resultado = true;

            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;
        }

        public static bool Delete_Presupuesto(Scope s, object p_Objeto, SqlTransaction PTransaction, String Tipo )
        {
            bool resultado = true;
            string apu_origen_id;
            string apu_presupuesto_id;

            if (Tipo == "PRO")
            {
                Apu_Proyecto p_Objeto_p = (Apu_Proyecto)p_Objeto;
                apu_origen_id = p_Objeto_p.Id;
            }
            else
            {
                Apu_Oferta p_Objeto_o = (Apu_Oferta)p_Objeto;
                apu_origen_id = p_Objeto_o.Id;
            }
            try
            {

                adpApu_Presupuesto.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Rubro.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Formula.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaction;

                List<Apu_Presupuesto> lstApu_Presupuesto = adpApu_Presupuesto.GetByOrigen(s, apu_origen_id);
                if (lstApu_Presupuesto.Count > 0)
                {
                    Apu_Presupuesto oApu_Presupuesto = adpApu_Presupuesto.GetByOrigen(s, apu_origen_id)[0];
                    apu_presupuesto_id = oApu_Presupuesto.Id;
               

                    List<Apu_Presupuesto_Formula> lstApu_Presupuesto_Formula = adpApu_Presupuesto_Formula.GetByPresupuesto(s, apu_presupuesto_id,"DIS");
                    if (lstApu_Presupuesto_Formula.Count > 0)
                    {
                        foreach (Apu_Presupuesto_Formula oApu_PresupuestoFormula in lstApu_Presupuesto_Formula)
                        {
                            adpApu_Presupuesto_Formula.Delete(s, oApu_PresupuestoFormula);
                        }

                    }

                    List<Apu_Presupuesto_Cuadrilla> lstApu_Presupuesto_Cuadrilla = adpApu_Presupuesto_Cuadrilla.GetByPresupuesto(s, apu_presupuesto_id,"DIS");
                    if (lstApu_Presupuesto_Cuadrilla.Count > 0)
                    {
                        foreach (Apu_Presupuesto_Cuadrilla oApu_Presupuesto_Cuadrilla in lstApu_Presupuesto_Cuadrilla)
                        {
                            adpApu_Presupuesto_Cuadrilla.Delete(s, oApu_Presupuesto_Cuadrilla);
                        }
                    }

                 

                    List<Apu_Presupuesto_Rubro> lstApu_Presupuesto_Rubro = adpApu_Presupuesto_Rubro.GetByPresupuesto(s, apu_presupuesto_id,"DIS");
                    if (lstApu_Presupuesto_Rubro.Count > 0)
                    {
                        foreach (Apu_Presupuesto_Rubro oApu_Presupuesto_Rubro in lstApu_Presupuesto_Rubro)
                        {
                            adpApu_Presupuesto_Rubro.Delete(s, oApu_Presupuesto_Rubro);
                        }
                    }

                    adpApu_Presupuesto.Delete(s, oApu_Presupuesto);
                }
                resultado = true;

            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;

        }

        public static bool Delete_Presupuesto_Reajuste(Scope s, object p_Objeto, SqlTransaction PTransaction, String Tipo)
        {
            bool resultado = true;
            string apu_presupuesto_id;

            Apu_Presupuesto p_Objeto_ = (Apu_Presupuesto)p_Objeto;
            apu_presupuesto_id = p_Objeto_.Id;

            try
            {

                adpApu_Presupuesto_Rubro.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Formula.Adapter.Transaction = PTransaction;
                adpApu_Presupuesto_Cuadrilla.Adapter.Transaction = PTransaction;

                List<Apu_Presupuesto_Formula> lstApu_Presupuesto_Formula = adpApu_Presupuesto_Formula.GetByPresupuesto(s, apu_presupuesto_id,"REA");
                if (lstApu_Presupuesto_Formula.Count > 0)
                {
                    foreach (Apu_Presupuesto_Formula oApu_PresupuestoFormula in lstApu_Presupuesto_Formula)
                    {
                        adpApu_Presupuesto_Formula.Delete(s, oApu_PresupuestoFormula);
                    }
                }

                List<Apu_Presupuesto_Cuadrilla> lstApu_Presupuesto_Cuadrilla = adpApu_Presupuesto_Cuadrilla.GetByPresupuesto(s, apu_presupuesto_id,"REA");
                if (lstApu_Presupuesto_Cuadrilla.Count > 0)
                {
                    foreach (Apu_Presupuesto_Cuadrilla oApu_Presupuesto_Cuadrilla in lstApu_Presupuesto_Cuadrilla)
                    {
                        adpApu_Presupuesto_Cuadrilla.Delete(s, oApu_Presupuesto_Cuadrilla);
                    }
                }

                List<Apu_Presupuesto_Rubro> lstApu_Presupuesto_Rubro = adpApu_Presupuesto_Rubro.GetByPresupuesto(s, apu_presupuesto_id,"REA");
                if (lstApu_Presupuesto_Rubro.Count > 0)
                {
                    foreach (Apu_Presupuesto_Rubro oApu_Presupuesto_Rubro in lstApu_Presupuesto_Rubro)
                    {
                        adpApu_Presupuesto_Rubro.Delete(s, oApu_Presupuesto_Rubro);
                    }
                }

                resultado = true;

            }
            catch (Exception e)
            {
                resultado = false;
                throw (e);
            }

            return resultado;

        }

     


        //private bool Insercion_(Scope s, object p_Objeto, SqlTransaction PTransaction)
        //{

        //    bool resultado = true;
        //    string apu_proyecto_id;
        //    string apu_presupuesto_rubro_insumo_id;
        //    string apu_proyecto_rubro_id;

        //    Apu_Proyecto p_Objeto_ = (Apu_Proyecto)p_Objeto;

        //    try
        //    {
        //        adpApu_Presupuesto_Rubro_Insumo.Adapter.Transaction = PTransaction;
        //        adpApu_Presupuesto_Indice.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Rubro_Material.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Rubro.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Material.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Transporte_Indice.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Rubro_Equipo.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Equipo_Indice.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Rubro_Mano_Obra.Adapter.Transaction = PTransaction;
        //        adpApu_Proyecto_Mano_Obra.Adapter.Transaction = PTransaction;
        //        adpApu_Parametros.Adapter.Transaction = PTransaction;
        //        adpApu_Presupuesto.Adapter.Transaction = PTransaction;

        //        apu_proyecto_id = p_Objeto_.Id;

        //        //Insercion de Parametros del Presupuesto

        //        List<Apu_Parametros> lstApu_Parametros = adpApu_Parametros.GetBySucursal(s, s.Int_Sucursal_Id);

        //        if (lstApu_Parametros.Count > 0)
        //        {
        //            foreach (Apu_Parametros oApu_Parametros in lstApu_Parametros)
        //            {
        //                Apu_Presupuesto oApu_Presupuesto = new Apu_Presupuesto();
        //                oApu_Presupuesto.Apu_Origen_Id = apu_proyecto_id;
        //                oApu_Presupuesto.Apu_Origen_Codigo = p_Objeto_.Codigo;
        //                oApu_Presupuesto.Apu_Origen_Nombre = p_Objeto_.Nombre;
        //                oApu_Presupuesto.Origen = "PRO";
        //                oApu_Presupuesto.Costo_Directo = p_Objeto_.Costo_Directo;
        //                oApu_Presupuesto.Costo_Indirecto = p_Objeto_.Costo_Indirecto;
        //                oApu_Presupuesto.Costo_Otros = p_Objeto_.Costo_Otros;
        //                oApu_Presupuesto.Costo_Total = p_Objeto_.Costo_Total;

        //                oApu_Presupuesto.Equipo_Apu_Indice_Id = oApu_Parametros.Equipo_Apu_Indice_Id;
        //                oApu_Presupuesto.ManoObra_Apu_Indice_Id = oApu_Parametros.ManoObra_Apu_Indice_Id;
        //                oApu_Presupuesto.Porcentaje_Costo_Indirecto = oApu_Parametros.Porcentaje_Costo_Indirecto;
        //                oApu_Presupuesto.Int_Sucursal_Id = oApu_Parametros.Int_Sucursal_Id;
        //                oApu_Presupuesto.Apu_Mano_Obra_Id = oApu_Parametros.Apu_Mano_Obra_Id;
        //                oApu_Presupuesto.Estado = oApu_Parametros.Estado;
        //                adpApu_Presupuesto.Insert(s, oApu_Presupuesto);
        //            }
        //        }

        //        //Inserccion en la cabecera de la Tabla.
        //        //Inserccion de Materiales

        //        List<Apu_Proyecto_Rubro_Material> listApu_Proyecto_Rubro_Material = adpApu_Proyecto_Rubro_Material.GetByProyecto(s, apu_proyecto_id);
        //        if (listApu_Proyecto_Rubro_Material.Count > 0)
        //        {

        //            foreach (Apu_Proyecto_Rubro_Material oApu_Proyecto_Rubro_Material in listApu_Proyecto_Rubro_Material)
        //            {

        //                Apu_Proyecto_Rubro oApu_Proyecto_Rubro = adpApu_Proyecto_Rubro.GetById(s, oApu_Proyecto_Rubro_Material.Apu_Proyecto_Rubro_Id)[0];

        //                //Primer registro a insertar.
        //                Apu_Presupuesto_Rubro_Insumo oApu_Presupuesto_Rubro_Insumo = new Apu_Presupuesto_Rubro_Insumo();
        //                oApu_Presupuesto_Rubro_Insumo.Origen = "PRO";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Origen_Id = oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Id = oApu_Proyecto_Rubro_Material.Apu_Rubro_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Codigo = oApu_Proyecto_Rubro_Material.Apu_Rubro_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Nombre = oApu_Proyecto_Rubro_Material.Apu_Rubro_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Cantidad = oApu_Proyecto_Rubro.Cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Unidad = oApu_Proyecto_Rubro.Apu_Rubro_Unidad;
        //                oApu_Presupuesto_Rubro_Insumo.Insumo = "MAT";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Id = oApu_Proyecto_Rubro_Material.Apu_Material_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Codigo = oApu_Proyecto_Rubro_Material.Apu_Material_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Nombre = oApu_Proyecto_Rubro_Material.Apu_Material_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Id = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Codigo = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Nombre = null;
        //                oApu_Presupuesto_Rubro_Insumo.Costo_Diario = oApu_Proyecto_Rubro_Material.costo_unitario;
        //                oApu_Presupuesto_Rubro_Insumo.Rendimiento = 1;
        //                oApu_Presupuesto_Rubro_Insumo.Cantidad = oApu_Proyecto_Rubro_Material.Cantidad;
        //                apu_presupuesto_rubro_insumo_id = adpApu_Presupuesto_Rubro_Insumo.Insert(s, oApu_Presupuesto_Rubro_Insumo);

        //                //Segundo registro a insertar
        //                oApu_Presupuesto_Rubro_Insumo.Origen = "PRO";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Origen_Id = oApu_Proyecto_Rubro_Material.Apu_Proyecto_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Id = oApu_Proyecto_Rubro_Material.Apu_Rubro_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Codigo = oApu_Proyecto_Rubro_Material.Apu_Rubro_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Nombre = oApu_Proyecto_Rubro_Material.Apu_Rubro_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Cantidad = oApu_Proyecto_Rubro.Cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Unidad = oApu_Proyecto_Rubro.Apu_Rubro_Unidad;
        //                oApu_Presupuesto_Rubro_Insumo.Insumo = "TRA";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Id = oApu_Proyecto_Rubro_Material.Apu_Material_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Codigo = oApu_Proyecto_Rubro_Material.Apu_Material_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Nombre = oApu_Proyecto_Rubro_Material.Apu_Material_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Id = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Codigo = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Nombre = null;
        //                oApu_Presupuesto_Rubro_Insumo.Costo_Diario = oApu_Proyecto_Rubro_Material.costo_unitario_transporte;
        //                oApu_Presupuesto_Rubro_Insumo.Rendimiento = 1;
        //                oApu_Presupuesto_Rubro_Insumo.Cantidad = oApu_Proyecto_Rubro_Material.Cantidad;
        //                apu_presupuesto_rubro_insumo_id = adpApu_Presupuesto_Rubro_Insumo.Insert(s, oApu_Presupuesto_Rubro_Insumo);

        //            }

        //        }

        //        //Insercion de Equipos

        //        List<Apu_Proyecto_Rubro_Equipo> lstApu_Proyecto_Rubro_Equipo = adpApu_Proyecto_Rubro_Equipo.GetByProyecto(s, apu_proyecto_id);
        //        if (lstApu_Proyecto_Rubro_Equipo.Count > 0)
        //        {

        //            foreach (Apu_Proyecto_Rubro_Equipo oApu_Proyecto_Rubro_Equipo in lstApu_Proyecto_Rubro_Equipo)
        //            {
        //                Apu_Proyecto_Rubro oApu_Proyecto_Rubro = adpApu_Proyecto_Rubro.GetById(s, oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Rubro_Id)[0];

        //                Apu_Presupuesto_Rubro_Insumo oApu_Presupuesto_Rubro_Insumo = new Apu_Presupuesto_Rubro_Insumo();
        //                oApu_Presupuesto_Rubro_Insumo.Origen = "PRO";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Origen_Id = oApu_Proyecto_Rubro_Equipo.Apu_Proyecto_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Id = oApu_Proyecto_Rubro_Equipo.Apu_Rubro_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Codigo = oApu_Proyecto_Rubro_Equipo.Apu_Rubro_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Nombre = oApu_Proyecto_Rubro_Equipo.Apu_Rubro_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Cantidad = oApu_Proyecto_Rubro.Cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Unidad = oApu_Proyecto_Rubro_Equipo.Apu_Rubro_Unidad;
        //                oApu_Presupuesto_Rubro_Insumo.Insumo = "EQU";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Id = oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Codigo = oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Nombre = oApu_Proyecto_Rubro_Equipo.Apu_Equipo_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Id = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Codigo = null;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Nombre = null;
        //                oApu_Presupuesto_Rubro_Insumo.Costo_Diario = oApu_Proyecto_Rubro_Equipo.costo_hora_x_cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Rendimiento = oApu_Proyecto_Rubro_Equipo.rendimiento_equipo_hora;
        //                oApu_Presupuesto_Rubro_Insumo.Cantidad = oApu_Proyecto_Rubro_Equipo.Cantidad;
        //                apu_presupuesto_rubro_insumo_id = adpApu_Presupuesto_Rubro_Insumo.Insert(s, oApu_Presupuesto_Rubro_Insumo);
        //            }

        //        }

        //        //Insercion de Mano de Obra

        //        List<Apu_Proyecto_Rubro_Mano_Obra> lstApu_Proyecto_Rubro_Mano_Obra = adpApu_Proyecto_Rubro_Mano_Obra.GetByProyecto(s, apu_proyecto_id);
        //        if (lstApu_Proyecto_Rubro_Mano_Obra.Count > 0)
        //        {
        //            foreach (Apu_Proyecto_Rubro_Mano_Obra oApu_Proyecto_Rubro_Mano_Obra in lstApu_Proyecto_Rubro_Mano_Obra)
        //            {
        //                Apu_Proyecto_Rubro oApu_Proyecto_Rubro = adpApu_Proyecto_Rubro.GetById(s, oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Rubro_Id)[0];

        //                Apu_Presupuesto_Rubro_Insumo oApu_Presupuesto_Rubro_Insumo = new Apu_Presupuesto_Rubro_Insumo();
        //                oApu_Presupuesto_Rubro_Insumo.Origen = "PRO";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Origen_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Proyecto_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Rubro_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Codigo = oApu_Proyecto_Rubro_Mano_Obra.Apu_Rubro_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Nombre = oApu_Proyecto_Rubro_Mano_Obra.Apu_Rubro_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Cantidad = oApu_Proyecto_Rubro.Cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Rubro_Unidad = oApu_Proyecto_Rubro_Mano_Obra.Apu_Rubro_Unidad;
        //                oApu_Presupuesto_Rubro_Insumo.Insumo = "MAN";
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Codigo = oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Insumo_Nombre = oApu_Proyecto_Rubro_Mano_Obra.Apu_Mano_Obra_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Id = oApu_Proyecto_Rubro_Mano_Obra.Apu_Categoria_Id;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Codigo = oApu_Proyecto_Rubro_Mano_Obra.Apu_Categoria_Codigo;
        //                oApu_Presupuesto_Rubro_Insumo.Apu_Categoria_Nombre = oApu_Proyecto_Rubro_Mano_Obra.Apu_Categoria_Nombre;
        //                oApu_Presupuesto_Rubro_Insumo.Costo_Diario = oApu_Proyecto_Rubro_Mano_Obra.costo_hora_x_cantidad;
        //                oApu_Presupuesto_Rubro_Insumo.Rendimiento = oApu_Proyecto_Rubro_Mano_Obra.rendimiento_mano_obra_hora;
        //                oApu_Presupuesto_Rubro_Insumo.Cantidad = oApu_Proyecto_Rubro_Mano_Obra.Cantidad;
        //                apu_presupuesto_rubro_insumo_id = adpApu_Presupuesto_Rubro_Insumo.Insert(s, oApu_Presupuesto_Rubro_Insumo);
        //            }
        //        }


        //        //Inserción de los indices de Material

        //        List<Apu_Proyecto_Material> lstApu_Proyecto_Material = adpApu_Proyecto_Material.GetByProyecto(s, apu_proyecto_id);
        //        if (lstApu_Proyecto_Material.Count > 0)
        //        {
        //            foreach (Apu_Proyecto_Material oApu_Proyecto_Material in lstApu_Proyecto_Material)
        //            {
        //                Apu_Presupuesto_Indice oApu_Presupuesto_Indice = new Apu_Presupuesto_Indice();
        //                oApu_Presupuesto_Indice.Apu_Origen_Id = apu_proyecto_id;
        //                oApu_Presupuesto_Indice.Apu_Insumo_Id = oApu_Proyecto_Material.Apu_Material_Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Id = oApu_Proyecto_Material.Apu_Indice_Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Codigo = oApu_Proyecto_Material.Apu_Indice_Codigo;
        //                oApu_Presupuesto_Indice.Apu_Indice_Nombre = oApu_Proyecto_Material.Apu_Indice_Nombre;
        //                oApu_Presupuesto_Indice.Porcentaje = 100;
        //                oApu_Presupuesto_Indice.Costo_Total = oApu_Proyecto_Material.Cantidad_Material_X_Costo;
        //                adpApu_Presupuesto_Indice.Insert(s, oApu_Presupuesto_Indice);
        //            }
        //        }

        //        //Insercion de los indices de Transporte
        //        List<Apu_Proyecto_Transporte_Indice> lstApu_Proyecto_Transporte_Indice = adpApu_Proyecto_Transporte_Indice.GetByProyecto(s, apu_proyecto_id);
        //        if (lstApu_Proyecto_Transporte_Indice.Count > 0)
        //        {
        //            foreach (Apu_Proyecto_Transporte_Indice oApu_Proyecto_Transporte_Indice in lstApu_Proyecto_Transporte_Indice)
        //            {

        //                Apu_Presupuesto_Indice oApu_Presupuesto_Indice = new Apu_Presupuesto_Indice();
        //                oApu_Presupuesto_Indice.Apu_Origen_Id = apu_proyecto_id;
        //                oApu_Presupuesto_Indice.Apu_Insumo_Id = oApu_Proyecto_Transporte_Indice.Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Id = oApu_Proyecto_Transporte_Indice.Apu_Indice_Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Codigo = oApu_Proyecto_Transporte_Indice.Apu_Indice_Codigo;
        //                oApu_Presupuesto_Indice.Apu_Indice_Nombre = oApu_Proyecto_Transporte_Indice.Apu_Indice_Nombre;
        //                oApu_Presupuesto_Indice.Porcentaje = oApu_Proyecto_Transporte_Indice.Porcentaje;
        //                oApu_Presupuesto_Indice.Costo_Total = oApu_Proyecto_Transporte_Indice.Costo_Total;
        //                adpApu_Presupuesto_Indice.Insert(s, oApu_Presupuesto_Indice);
        //            }
        //        }


        //        //Inserción de los indices de Equipos
        //        List<Apu_Proyecto_Equipo_Indice> lstApu_Proyecto_Equipo_Indice = adpApu_Proyecto_Equipo_Indice.GetByProyecto(s, apu_proyecto_id);
        //        if (lstApu_Proyecto_Equipo_Indice.Count > 0)
        //        {
        //            foreach (Apu_Proyecto_Equipo_Indice oApu_Proyecto_Equipo_Indice in lstApu_Proyecto_Equipo_Indice)
        //            {

        //                Apu_Presupuesto_Indice oApu_Presupuesto_Indice = new Apu_Presupuesto_Indice();
        //                oApu_Presupuesto_Indice.Apu_Origen_Id = apu_proyecto_id;
        //                oApu_Presupuesto_Indice.Apu_Insumo_Id = oApu_Proyecto_Equipo_Indice.Apu_Equipo_Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Id = oApu_Proyecto_Equipo_Indice.Apu_Indice_Id;
        //                oApu_Presupuesto_Indice.Apu_Indice_Codigo = oApu_Proyecto_Equipo_Indice.Apu_Indice_Codigo;
        //                oApu_Presupuesto_Indice.Apu_Indice_Nombre = oApu_Proyecto_Equipo_Indice.Apu_Indice_Nombre;
        //                oApu_Presupuesto_Indice.Porcentaje = oApu_Proyecto_Equipo_Indice.Porcentaje;
        //                oApu_Presupuesto_Indice.Costo_Total = oApu_Proyecto_Equipo_Indice.Apu_Proyecto_Equipo_Costo_Total;
        //                oApu_Presupuesto_Indice.Costo_Indice = oApu_Proyecto_Equipo_Indice.Costo_Indice;
        //                adpApu_Presupuesto_Indice.Insert(s, oApu_Presupuesto_Indice);

        //            }
        //        }

        //        //Insercion de Indices de Mano de Obra
        //        List<Apu_Proyecto_Mano_Obra> lstApu_Proyecto_Mano_Obra = adpApu_Proyecto_Mano_Obra.GetByProyecto(s, apu_proyecto_id);
        //        foreach (Apu_Proyecto_Mano_Obra oApu_Proyecto_Mano_Obra in lstApu_Proyecto_Mano_Obra)
        //        {
        //            Apu_Presupuesto_Indice oApu_Presupuesto_Indice = new Apu_Presupuesto_Indice();
        //            oApu_Presupuesto_Indice.Apu_Origen_Id = apu_proyecto_id;
        //            oApu_Presupuesto_Indice.Apu_Insumo_Id = oApu_Proyecto_Mano_Obra.Apu_Mano_Obra_Id;
        //            oApu_Presupuesto_Indice.Apu_Indice_Id = oApu_Proyecto_Mano_Obra.Apu_Indice_Id;
        //            oApu_Presupuesto_Indice.Apu_Indice_Codigo = oApu_Proyecto_Mano_Obra.Apu_Indice_Codigo;
        //            oApu_Presupuesto_Indice.Apu_Indice_Nombre = oApu_Proyecto_Mano_Obra.Apu_Indice_Nombre;
        //            oApu_Presupuesto_Indice.Porcentaje = 100;
        //            oApu_Presupuesto_Indice.Costo_Total = oApu_Proyecto_Mano_Obra.Costo_Total;
        //            oApu_Presupuesto_Indice.Costo_Indice = oApu_Proyecto_Mano_Obra.Cantidad_Mano_Obra_X_Costo;
        //            adpApu_Presupuesto_Indice.Insert(s, oApu_Presupuesto_Indice);

        //        }

        //        resultado = true;

        //    }
        //    catch (Exception e)
        //    {
        //        resultado = false;
        //        throw (e);
        //    }

        //    return resultado;
        //}


    }
}
