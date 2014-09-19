using System;
using System.Collections.Generic;
using ADL;
using ADL.DiccionarioTableAdapters;
using AEL.DIC;

namespace AEL
{
    public class GenerarCodigo
    {
        #region  Generar el Codigo

        public string GenCodigo(string Ver_Version_Id, string Codigo, string Objeto_Nombre)
        {
            return GenCodigo(Ver_Version_Id, Codigo, Objeto_Nombre, "Codigo");
        }

        public string GenCodigo(string Ver_Version_Id, string VerificarCodigo, string Dic_Objeto_Nombre,
                                       string Dic_Campo_Nombre)
        {
            string Codigo = "";
            int numerosecuencia;
            string cadena = "";

            #region  Ejecutamos el metodo GetByCampo de Dic  Codigo

            Diccionario.Dic_CodigoDataTable tablaCodigo =
                Adapter.GetByCampo(Ver_Version_Id, Dic_Objeto_Nombre, Dic_Campo_Nombre);

            List<Dic_Codigo> listaGetByCampo = new List<Dic_Codigo>();

            foreach (Diccionario.Dic_CodigoRow fila in tablaCodigo)
                listaGetByCampo.Add(new Dic_Codigo(
                                        fila.Id,
                                        fila.Codigo,
                                        fila.Estado,
                                        fila.Tipo,
                                        fila.Orden,
                                        fila.Dic_Campo_Id,
                                        fila.Ref_Dic_Campo_Id,
                                        fila.Dic_Secuencia_Id,
                                        fila.Pre_Dic_Campo_Id,
                                        fila.Constante,
                                        fila.Funcion,
                                        fila.Act_Dic_Campo_Id,
                                        fila.Dic_Secuencia_Codigo,
                                        fila.Dic_Secuencia_Nombre,
                                        fila.Ref_dic_Campo_Codigo,
                                        fila.Ref_Dic_Campo_Nombre,
                                        fila.Dic_Campo_Codigo,
                                        fila.Dic_Campo_Nombre,
                                        fila.Dic_Objeto_Id,
                                        fila.Dic_Objeto_Codigo,
                                        fila.Dic_Objeto_Nombre,
                                        fila.Dic_Modulo_Id,
                                        fila.Dic_Modulo_Codigo,
                                        fila.Dic_Modulo_Nombre,
                                        fila.Ref_Dic_Modulo_Id,
                                        fila.Ref_Dic_Modulo_Codigo,
                                        fila.Ref_Dic_Modulo_Nombre,
                                        fila.Ref_Dic_Objeto_Id,
                                        fila.Ref_Dic_Objeto_Codigo,
                                        fila.Ref_Dic_Objeto_Nombre,
                                        fila.Act_Dic_Campo_Codigo,
                                        fila.Act_Dic_Campo_Nombre,
                                        fila.Act_Dic_Modulo_Id,
                                        fila.Act_Dic_Modulo_Codigo,
                                        fila.Act_Dic_Modulo_Nombre,
                                        fila.Act_Dic_Objeto_Id,
                                        fila.Act_Dic_Objeto_Codigo,
                                        fila.Act_Dic_Objeto_Nombre,
                                        fila.Pre_Dic_Campo_Codigo,
                                        fila.Pre_Dic_Campo_Nombre,
                                        fila.Pre_Dic_Objeto_Id,
                                        fila.Pre_Dic_Objeto_Codigo,
                                        fila.Pre_Dic_Objeto_Nombre,
                                        fila.Estado_nombre,
                                        fila.Tipo_nombre));

            #endregion

            #region  Ejecutamos el  metodo  de GetById  de Dic Secuencia

            if (listaGetByCampo.Count == 0)
                return null;

            Diccionario.Dic_SecuenciaDataTable tablaSecuencia =
                AdapterSecuencia.GetById(Ver_Version_Id, listaGetByCampo[0].Dic_Secuencia_Id);
            List<Dic_Secuencia> listaSecuenciaGetById = new List<Dic_Secuencia>();
            foreach (Diccionario.Dic_SecuenciaRow filasecuencia in tablaSecuencia)
                listaSecuenciaGetById.Add(new Dic_Secuencia(
                                              filasecuencia.Id,
                                              filasecuencia.Codigo,
                                              filasecuencia.Nombre,
                                              filasecuencia.Estado,
                                              filasecuencia.Valor_Actual,
                                              filasecuencia.Valor_Minimo,
                                              filasecuencia.Valor_Maximo,
                                              filasecuencia.Incremento,
                                              filasecuencia.Estado_nombre));

            #endregion

            #region Procedimiento  de la Generación  de secuencia

            for (int i = 0; i < listaGetByCampo.Count; i++)
            {
                if (VerificarCodigo != null)
                {
                    Codigo = VerificarCodigo;

                    //Update a los registros
                    Dic_Secuencia registroAnterior = new Dic_Secuencia();
                    registroAnterior.Id = listaSecuenciaGetById[0].Id;
                    registroAnterior.Codigo = listaSecuenciaGetById[0].Codigo;
                    registroAnterior.Nombre = listaSecuenciaGetById[0].Nombre;
                    registroAnterior.Valor_Actual = listaSecuenciaGetById[0].Valor_Actual;
                    registroAnterior.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                    registroAnterior.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                    registroAnterior.Incremento = listaSecuenciaGetById[0].Incremento;

                    //Registro  actual  de datos  para dic_secuencia
                    Dic_Secuencia registroActual = new Dic_Secuencia();
                    registroActual.Id = listaSecuenciaGetById[0].Id;
                    registroActual.Codigo = listaSecuenciaGetById[0].Codigo;
                    registroActual.Nombre = listaSecuenciaGetById[0].Nombre;
                    registroActual.Valor_Actual = Convert.ToInt16(Codigo);
                    registroActual.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                    registroActual.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                    registroActual.Incremento = listaSecuenciaGetById[0].Incremento;
                    Update(registroActual, registroAnterior);
                }
                else
                {
                    //Verifica si el codigo para generar  es de tipo  Secuencia
                    if (listaGetByCampo[i].Tipo == "SEC")
                    {
                        if (listaSecuenciaGetById[0].Valor_Actual + listaSecuenciaGetById[0].Incremento <
                            listaSecuenciaGetById[0].Valor_Maximo &&
                            listaSecuenciaGetById[0].Valor_Actual >= listaSecuenciaGetById[0].Valor_Maximo)
                        {
                            return "MSJ17";
                        }
                        else
                        {
                            #region  Región de Dic Secuencia

                            //Se obtiene  la secuencia 
                            numerosecuencia = listaSecuenciaGetById[0].Valor_Actual +
                                              listaSecuenciaGetById[0].Incremento;
                            cadena = cadena + numerosecuencia;
                            //Update a los registros
                            Dic_Secuencia registroAnterior = new Dic_Secuencia();
                            registroAnterior.Id = listaSecuenciaGetById[0].Id;
                            registroAnterior.Codigo = listaSecuenciaGetById[0].Codigo;
                            registroAnterior.Nombre = listaSecuenciaGetById[0].Nombre;
                            registroAnterior.Valor_Actual = listaSecuenciaGetById[0].Valor_Actual;
                            registroAnterior.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                            registroAnterior.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                            registroAnterior.Incremento = listaSecuenciaGetById[0].Incremento;

                            //Registro  actual  de datos  para dic_secuencia
                            Dic_Secuencia registroActual = new Dic_Secuencia();
                            registroActual.Id = listaSecuenciaGetById[0].Id;
                            registroActual.Codigo = listaSecuenciaGetById[0].Codigo;
                            registroActual.Nombre = listaSecuenciaGetById[0].Nombre;
                            registroActual.Valor_Actual = numerosecuencia;
                            registroActual.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                            registroActual.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                            registroActual.Incremento = listaSecuenciaGetById[0].Incremento;
                            Update(registroActual, registroAnterior);
                            Codigo = numerosecuencia.ToString();

                            #endregion
                        }
                    }
                        //Verifica si el codigo para generar  es de tipo  Constante
                    else if (listaGetByCampo[i].Tipo == "CON")
                    {
                        //Falta Implementar 
                    }
                        //Verifica si el codigo para generar  es de tipo  Función
                    else if (listaGetByCampo[i].Tipo == "FUN")
                    {
                        //Falta Implementar 
                    }
                        //Verifica si el codigo para generar  es de tipo  Referencia
                    else if (listaGetByCampo[i].Tipo == "REF")
                    {
                        //Falta Implementar 
                    }
                }
            }

            #endregion

            return Codigo;
        }

        #endregion

        #region Generar  el Numero

        public int GenNumero(string Ver_Version_Id, string Objeto_Nombre)
        {
            int Numero = 0;
            Numero = GenNumero(Ver_Version_Id, Numero.ToString(), Objeto_Nombre, "Numero");
            return Numero;
        }

        public int GenNumero(string Ver_Version_Id, string VerificarCodigo, string Dic_Objeto_Nombre,
                                    string Dic_Campo_Nombre)
        {
            int numerosecuencia = 0;
            string cadena = "";

            #region  Ejecutamos el metodo GetByCampo de Dic  Codigo

            Diccionario.Dic_CodigoDataTable tablaCodigo =
                Adapter.GetByCampo(Ver_Version_Id, Dic_Objeto_Nombre, Dic_Campo_Nombre);

            List<Dic_Codigo> listaGetByCampo = new List<Dic_Codigo>();

            foreach (Diccionario.Dic_CodigoRow fila in tablaCodigo)
                listaGetByCampo.Add(new Dic_Codigo(
                                        fila.Id,
                                        fila.Codigo,
                                        fila.Estado,
                                        fila.Tipo,
                                        fila.Orden,
                                        fila.Dic_Campo_Id,
                                        fila.Ref_Dic_Campo_Id,
                                        fila.Dic_Secuencia_Id,
                                        fila.Pre_Dic_Campo_Id,
                                        fila.Constante,
                                        fila.Funcion,
                                        fila.Act_Dic_Campo_Id,
                                        fila.Dic_Secuencia_Codigo,
                                        fila.Dic_Secuencia_Nombre,
                                        fila.Ref_dic_Campo_Codigo,
                                        fila.Ref_Dic_Campo_Nombre,
                                        fila.Dic_Campo_Codigo,
                                        fila.Dic_Campo_Nombre,
                                        fila.Dic_Objeto_Id,
                                        fila.Dic_Objeto_Codigo,
                                        fila.Dic_Objeto_Nombre,
                                        fila.Dic_Modulo_Id,
                                        fila.Dic_Modulo_Codigo,
                                        fila.Dic_Modulo_Nombre,
                                        fila.Ref_Dic_Modulo_Id,
                                        fila.Ref_Dic_Modulo_Codigo,
                                        fila.Ref_Dic_Modulo_Nombre,
                                        fila.Ref_Dic_Objeto_Id,
                                        fila.Ref_Dic_Objeto_Codigo,
                                        fila.Ref_Dic_Objeto_Nombre,
                                        fila.Act_Dic_Campo_Codigo,
                                        fila.Act_Dic_Campo_Nombre,
                                        fila.Act_Dic_Modulo_Id,
                                        fila.Act_Dic_Modulo_Codigo,
                                        fila.Act_Dic_Modulo_Nombre,
                                        fila.Act_Dic_Objeto_Id,
                                        fila.Act_Dic_Objeto_Codigo,
                                        fila.Act_Dic_Objeto_Nombre,
                                        fila.Pre_Dic_Campo_Codigo,
                                        fila.Pre_Dic_Campo_Nombre,
                                        fila.Pre_Dic_Objeto_Id,
                                        fila.Pre_Dic_Objeto_Codigo,
                                        fila.Pre_Dic_Objeto_Nombre,
                                        fila.Estado_nombre,
                                        fila.Tipo_nombre));

            #endregion

            #region  Ejecutamos el  metodo  de GetById  de Dic Secuencia

            Diccionario.Dic_SecuenciaDataTable tablaSecuencia =
                AdapterSecuencia.GetById(Ver_Version_Id, listaGetByCampo[0].Dic_Secuencia_Id);
            List<Dic_Secuencia> listaSecuenciaGetById = new List<Dic_Secuencia>();
            foreach (Diccionario.Dic_SecuenciaRow filasecuencia in tablaSecuencia)
                listaSecuenciaGetById.Add(new Dic_Secuencia(
                                              filasecuencia.Id,
                                              filasecuencia.Codigo,
                                              filasecuencia.Nombre,
                                              filasecuencia.Estado,
                                              filasecuencia.Valor_Actual,
                                              filasecuencia.Valor_Minimo,
                                              filasecuencia.Valor_Maximo,
                                              filasecuencia.Incremento,
                                              filasecuencia.Estado_nombre));

            #endregion

            #region Procedimiento  de la Generación  de secuencia

            for (int i = 0; i < listaGetByCampo.Count; i++)
            {
                //Verifica si el codigo para generar  es de tipo  Secuencia
                if (listaGetByCampo[i].Tipo == "SEC")
                {
                    if (listaSecuenciaGetById[0].Valor_Actual + listaSecuenciaGetById[0].Incremento <
                        listaSecuenciaGetById[0].Valor_Maximo &&
                        listaSecuenciaGetById[0].Valor_Actual >= listaSecuenciaGetById[0].Valor_Maximo)
                    {
                        //string error =
                        //    HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ17RecursoKCG.Text").ToString();
                    }
                    else
                    {
                        #region  Región de Dic Secuencia

                        //Se obtiene  la secuencia 
                        numerosecuencia = listaSecuenciaGetById[0].Valor_Actual +
                                          listaSecuenciaGetById[0].Incremento;
                        cadena = cadena + numerosecuencia;
                        //Update a los registros
                        Dic_Secuencia registroAnterior = new Dic_Secuencia();
                        registroAnterior.Id = listaSecuenciaGetById[0].Id;
                        registroAnterior.Codigo = listaSecuenciaGetById[0].Codigo;
                        registroAnterior.Nombre = listaSecuenciaGetById[0].Nombre;
                        registroAnterior.Valor_Actual = listaSecuenciaGetById[0].Valor_Actual;
                        registroAnterior.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                        registroAnterior.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                        registroAnterior.Incremento = listaSecuenciaGetById[0].Incremento;

                        //Registro  actual  de datos  para dic_secuencia
                        Dic_Secuencia registroActual = new Dic_Secuencia();
                        registroActual.Id = listaSecuenciaGetById[0].Id;
                        registroActual.Codigo = listaSecuenciaGetById[0].Codigo;
                        registroActual.Nombre = listaSecuenciaGetById[0].Nombre;
                        registroActual.Valor_Actual = numerosecuencia;
                        registroActual.Valor_Maximo = listaSecuenciaGetById[0].Valor_Maximo;
                        registroActual.Valor_Minimo = listaSecuenciaGetById[0].Valor_Minimo;
                        registroActual.Incremento = listaSecuenciaGetById[0].Incremento;
                        Update(registroActual, registroAnterior);

                        #endregion
                    }
                }
                    //Verifica si el codigo para generar  es de tipo  Constante
                else if (listaGetByCampo[i].Tipo == "CON")
                {
                    //Falta Implementar 
                }
                    //Verifica si el codigo para generar  es de tipo  Función
                else if (listaGetByCampo[i].Tipo == "FUN")
                {
                    //Falta Implementar 
                }
                    //Verifica si el codigo para generar  es de tipo  Referencia
                else if (listaGetByCampo[i].Tipo == "REF")
                {
                    //Falta Implementar 
                }
            }

            #endregion

            return numerosecuencia;
        }

        #endregion

        #region Funciones  Utiles para la generación de codigo

        #region Adapter de DIC  CODIGO

        private static Dic_CodigoTableAdapter _Adapter;

        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public static Dic_CodigoTableAdapter Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new Dic_CodigoTableAdapter();
                return _Adapter;
            }
        }

        #endregion

        #region Adapter de DIC SECUENCIA

        private static Dic_SecuenciaTableAdapter _AdapterSecuencia;

        public static Dic_SecuenciaTableAdapter AdapterSecuencia
        {
            get
            {
                if (_AdapterSecuencia == null)
                    _AdapterSecuencia = new Dic_SecuenciaTableAdapter();
                return _AdapterSecuencia;
            }
        }

        #endregion

        #region Función Update  de Dic Secuencia

        public int Update(Dic_Secuencia o, Dic_Secuencia original)
        {
            int resultado;
            resultado = AdapterSecuencia.Update(
                o.Id,
                o.Codigo,
                o.Nombre,
                o.Valor_Actual,
                o.Valor_Minimo,
                o.Valor_Maximo,
                o.Incremento,
                o.Estado,
                original.Id,
                original.Codigo,
                original.Nombre,
                original.Valor_Actual,
                original.Valor_Minimo,
                original.Valor_Maximo,
                original.Incremento,
                original.Estado
                );

            return resultado;
        }

        #endregion

        #endregion
    }
}