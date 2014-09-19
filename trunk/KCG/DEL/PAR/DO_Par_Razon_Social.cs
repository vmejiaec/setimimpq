using System;
using System.Collections.Generic;
using System.Text;
using BEL;
using AEL.PAR;

namespace DEL.PAR
{
    public class DO_Par_Razon_Social
    {
        # region Adapters

        private static CEL.PAR.DO_Par_Razon_Social _adpPar_Razon_Social;
        private static CEL.PAR.DO_Par_Razon_Social adpPar_Razon_Social
        {
            get
            {
                if (_adpPar_Razon_Social == null)
                    _adpPar_Razon_Social = new CEL.PAR.DO_Par_Razon_Social();
                return _adpPar_Razon_Social;
            }
        }
        #endregion
        # region Operaciones

        public static string Insert(Scope s, Par_Razon_Social oPar_Razon_Social)
        {
            string resultado = string.Empty;
            Exception eCaso;
            Exception otroEx;
            try
            {
                adpPar_Razon_Social.Adapter.BeginTransaction();
                if (oPar_Razon_Social.Par_Tipo_Identificacion_Cedula == "S")
                {
                    if (DigitoVerificador(oPar_Razon_Social.Numero))
                        resultado = adpPar_Razon_Social.Insert(s, oPar_Razon_Social);
                    else
                    {
                        string Mensaje = "";
                        eCaso = new Exception(Mensaje);
                        otroEx = new Exception(TXT_Mensajes._MSJ101, eCaso);
                        throw (otroEx);
                    }
                }
                else
                {
                    resultado = adpPar_Razon_Social.Insert(s, oPar_Razon_Social);
                }
                adpPar_Razon_Social.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpPar_Razon_Social.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }

        public static int Update(Scope s, Par_Razon_Social nPar_Razon_Social, Par_Razon_Social oPar_Razon_Social)
        {
            int resultado = 0;
            Exception eCaso;
            Exception otroEx;
            try
            {
                adpPar_Razon_Social.Adapter.BeginTransaction();
                if (nPar_Razon_Social.Par_Tipo_Identificacion_Cedula == "S")
                {
                    if (DigitoVerificador(nPar_Razon_Social.Numero))
                        resultado = adpPar_Razon_Social.Update(s, nPar_Razon_Social, oPar_Razon_Social);
                    else
                    {
                        string Mensaje = "";
                        eCaso = new Exception(Mensaje);
                        otroEx = new Exception(TXT_Mensajes._MSJ101, eCaso);
                        throw (otroEx);
                    }
                }
                else
                {
                    resultado = adpPar_Razon_Social.Update(s, nPar_Razon_Social, oPar_Razon_Social);
                }
                adpPar_Razon_Social.Adapter.CommitTransaction();
            }
            catch (Exception e)
            {
                adpPar_Razon_Social.Adapter.RollbackTransaction();
                throw (e);
            }
            return resultado;
        }

        public static bool DigitoVerificador(string strIdentificacion)
        {
            bool resultado = true;
            if (strIdentificacion.Length != 10)
            {
                return false;
            }
            int Provincia, Resultado = 0, i, DigitoVerificador = 0;
            string[] Digito = new string[10];
            int[] ValorDigito = new int[10];

            ValorDigito[0] = 0;
            //bool bandera = false;

            //Obtener por separado cada dígito de la cédula	
            for (i = 0; i < strIdentificacion.Length; i++)
            {
                ValorDigito[i] = Convert.ToInt32(strIdentificacion.Substring(i, 1));
            }

            //for (i = 0; i < strIdentificacion.Length; i++)
            //{
            //    if (strIdentificacion.Substring(i, 1) != "-")
            //    {
            //        if (bandera)
            //            ValorDigito[i - 1] = Convert.ToInt32(strIdentificacion.Substring(i, 1));
            //        else
            //            ValorDigito[i] = Convert.ToInt32(strIdentificacion.Substring(i, 1));
            //    }
            //    else
            //        bandera = true;
            //}

            //Se verifica que los dos primeros dígitos correspondan a una provincia
            Provincia = (ValorDigito[0] * 10 + ValorDigito[1]);
            if (Provincia < 1 || Provincia > 24)
                return false;
            //Digitos impares se multiplican por dos
            for (i = 0; i < ValorDigito.Length; i = i + 2)
            {
                ValorDigito[i] = (ValorDigito[i] * 2);//DigitoImpar = 2
                if (ValorDigito[i] > 9)
                    ValorDigito[i] = (ValorDigito[i] - 9);//Qué es el ValorComplemento = 9
            }
            //Digitos pares se multiplican por uno (menos el digito verificador mismo)
            for (i = 1; i < ValorDigito.Length; i = i + 2)
            {
                ValorDigito[i] = 1 * ValorDigito[i];//DigitoPar
            }

            for (i = 0; i < ValorDigito.Length - 1; i++)
            {
                Resultado = Resultado + ValorDigito[i];
            }
            //Se saca el modulo 10 y se le resta de 10 si el modulo es distinto de cero
            if ((Resultado % 10) != 0)
            {
                DigitoVerificador = 10 - ((Resultado % 10));
            }
            else
            {
                DigitoVerificador = Resultado % 10;
            }
            if (ValorDigito[9] != DigitoVerificador)
            {
                return false; //Cédula Con Error.
            }
            return resultado;
        }
        #endregion
    }
}
