using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace zTest
{
    public class EscribirEnteroALetras
    {
        public EscribirEnteroALetras()
        {
        }
        string[] NumeroBase ={
                                 "",
                                 "uno",
                                 "dos",
                                 "tres",
                                 "cuatro",
                                 "cinco",
                                 "seis",
                                 "siete",
                                 "ocho",
                                 "nueve",
                                 "diez",
                                 "once",
                                 "doce",
                                 "trece",
                                 "catorce",
                                 "quince",
                                 "dieciseis",
                                 "diecisiete",
                                 "dieciocho",
                                 "diecinueve",
                            };
        string[] NumeroBase2 = {
                                   "",
                                   "",
                                   "veinte",
                                   "treinta",
                                   "cuarenta",
                                   "ciencuenta",
                                   "sesenta",
                                   "setenta",
                                   "ochenta",
                                   "noventa"
                               };
        public string[,] Convertir_Decimal(decimal numero)
        {
            decimal numero_redondeado = Decimal.Round(numero, 2);
            decimal numero_por_100 = numero_redondeado * 100;
            string sNumero = ((Int64)numero_por_100).ToString();
            string sParteEntera;
            string sParteDecimal;
            if (sNumero.Length > 2)
            { // El numero tiene formato xxx
                sParteEntera = sNumero.Remove(sNumero.Length - 2);
                sParteDecimal = sNumero.Remove(0, sNumero.Length - 2);
            }
            else
            { // El numero tiene formato xx o x
                sParteEntera = "0";
                sParteDecimal = sNumero;
            }
            EscribirEnteroALetras esc = new EscribirEnteroALetras();
            string[,] s = new string[2,2];
            s[0,0] = sParteEntera;
            s[0,1] = esc.Convertir_Numero(sParteEntera);
            s[1,0] = sParteDecimal;
            s[1,1] = esc.Convertir_Numero(sParteDecimal);
            return s;
        }

        public string FormatoParaContrato(decimal numero)
        {
            //SESENTA Y CUATRO MIL CUARENTA Y CINCO DÓLARES DE LOS ESTADOS UNIDOS DE NORTEAMÉRICA CON  46/100 CTVS)
            string[,] s = Convertir_Decimal(numero);
            string ss = string.Format("{0} DÓLARES DE LOS ESTADOS UNIDOS DE NORTEAMÉRICA CON {1}/100 CTVS.", s[0,1].ToUpper(), s[1,0]);
            return ss;
        }

        public string Convertir_Numero(string num)
        {
            string Resultado = "";
            int Tama_Cadena = num.Length;
            if (Tama_Cadena < 4)//3
                Resultado = Trio(Tama_Cadena, num);
            else if (Tama_Cadena < 7)//6
            {
                int millares = Tama_Cadena - 3;
                if (num.Substring(0, 1) == "1" && Tama_Cadena == 4)
                    Resultado = "mil " + Trio(3, num.Substring(millares, 3));
                else
                    Resultado = Trio(millares, num.Substring(0, millares)) + " mil " + Trio(3, num.Substring(millares, 3));
            }
            else if (Tama_Cadena < 10)//9
            {
                int millares = Tama_Cadena - 3;
                int millon = Tama_Cadena - 6;
                if (num.Substring(0, 1) == "1" && Tama_Cadena == 7)
                {
                    if (Trio(3, num.Substring(millon, 3)) == "")
                        Resultado = "un millon " + Trio(3, num.Substring(millares, 3));
                    else
                        Resultado = "millon " + Trio(3, num.Substring(millon, 3)) + " mil " + Trio(3, num.Substring(millares, 3));
                }
                else
                    Resultado = Trio(millon, num.Substring(0, millon)) + " milllones " + Trio(3, num.Substring(millon, 3)) + " mil " + Trio(3, num.Substring(millares, 3));
            }
            else if (Tama_Cadena < 13)
                Resultado = Trio(3, num.Substring(0, 3)) + " mil " + Trio(3, num.Substring(4, 3)) + " milllones " + Trio(3, num.Substring(7, 3)) + " mil " + Trio(3, num.Substring(10, 3));
            else if (Tama_Cadena < 16)
                Resultado = Trio(3, num.Substring(0, 3)) + " billones " + Trio(3, num.Substring(4, 3)) + " mil " + Trio(3, num.Substring(7, 3)) + " milllones " + Trio(3, num.Substring(10, 3)) + " mil " + Trio(3, num.Substring(13, 3));
            else if (Tama_Cadena < 19)
                Resultado = Trio(3, num.Substring(0, 3)) + " mil " + Trio(3, num.Substring(4, 3)) + " billones " + Trio(3, num.Substring(7, 3)) + " mil " + Trio(3, num.Substring(10, 3)) + " milllones " + Trio(3, num.Substring(13, 3)) + " mil " + Trio(3, num.Substring(13, 3));
            else if (Tama_Cadena < 21)
                Resultado = "";
            else if (Tama_Cadena < 24)
                Resultado = "";
            return Resultado;
        }
        string Unidades(string numx)
        {
            return NumeroBase[Convert.ToInt32(numx)];
        }
        string Decenas(string numx)
        {
            string Pre = "";
            int Num = Convert.ToInt32(numx);
            if (Num < 20)
            {
                Pre = NumeroBase[Num];
            }
            else
            {
                if (numx.Substring(0, 1) == "2")
                    Pre = NumeroBase2[2] + Unidades(numx.Substring(1, 1));
                else
                {
                    if (numx.Substring(1, 1) == "0")
                        Pre = NumeroBase2[Convert.ToInt32(numx.Substring(0, 1))];
                    else
                        Pre = NumeroBase2[Convert.ToInt32(numx.Substring(0, 1))] + " y " + Unidades(numx.Substring(1, 1));
                }
            }
            return Pre;
        }
        string Centenas(string numx)
        {
            string Pre = "";
            if (numx.Substring(0, 1) == "1")
            {
                if (numx.Substring(1, 1) == "0" && numx.Substring(2, 1) == "0")
                    Pre = "cien ";
                else
                    Pre = "ciento " + Decenas(numx.Substring(1, 2));
            }
            else if (numx.Substring(0, 1) == "0")
            {
                Pre = "" + Decenas(numx.Substring(1, 2));
            }
            else if (numx.Substring(0, 1) == "5")
            {
                Pre = "quinientos " + Decenas(numx.Substring(1, 2));
            }
            else if (numx.Substring(0, 1) == "7")
            {
                Pre = "setecientos " + Decenas(numx.Substring(1, 2));
            }
            else if (numx.Substring(0, 1) == "9")
            {
                Pre = "novecientos " + Decenas(numx.Substring(1, 2));
            }
            else
            {
                Pre = NumeroBase[Convert.ToInt32(numx.Substring(0, 1))] + "cientos " + Decenas(numx.Substring(1, 2));
            }
            return Pre;
        }
        string Trio(int cant, string Val)
        {
            string CadenaFinal = "";
            switch (cant)
            {
                case 1: CadenaFinal = Unidades(Val);
                    break;
                case 2: CadenaFinal = Decenas(Val);
                    break;
                case 3: CadenaFinal = Centenas(Val);
                    break;
            }
            return CadenaFinal;
        }
    }
}
