using System;
using System.Collections.Generic;
using System.Security.Cryptography;

namespace BEL
{
    public class Identificadores
    {
        public static decimal GetNewId(short sucursal, short tabla)
        {
            // Create a byte array to hold the random value.
            byte[] randomNumber = new byte[4];

            // Create a new instance of the RNGCryptoServiceProvider. 
            RNGCryptoServiceProvider Gen = new RNGCryptoServiceProvider();

            // Fill the array with a random value.
            Gen.GetBytes(randomNumber);

            UInt32 rand = BitConverter.ToUInt32(randomNumber, 0);

            decimal randId = Convert.ToDecimal((double)rand + Math.Pow(10, 10));
            decimal tablaId = Convert.ToDecimal((double)(tabla) * Math.Pow(10, 10));
            decimal sucurcalId = Convert.ToDecimal((double)(sucursal) * Math.Pow(10, 14));

            decimal Id = randId + tablaId + sucurcalId;
            Id -= Convert.ToDecimal(Math.Pow(10, 10));
            return Id;
        }
    }
}