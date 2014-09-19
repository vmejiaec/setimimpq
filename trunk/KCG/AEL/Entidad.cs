using System;
using System.Security.Cryptography;
using ADL;
using ADL.DiccionarioTableAdapters;

namespace AEL
{
    public class Entidad
    {
        #region Declaración Propiedades  y constructor
        // Atributos
        // Campos comunes a todas las objeto/tablas
        private string _Codigo;
        private string _Estado;
        private string _Id;
        private string _Nombre;
        private uint _Codigo_int = 0;

        // Metadatos comunes a todas las objeto/tablas
        private string _Objeto_Codigo;
        private string _Objeto_Id = "0";
        private string _Objeto_Nombre;
        private int _Objeto_Numero = 0;

        // Propiedades
        
        public string Id        
        {
            get { return _Id; }
            set { _Id = value; }
        }

        public string Codigo
        {
            get { return _Codigo; }
            set { _Codigo = value; }
        }

        public uint Codigo_int
        {
            get
            {
                if (_Codigo_int == 0)  // Si aun no tiene asignado un valor
                {
                    try
                    {
                        _Codigo_int = uint.Parse(Codigo); 
                    }
                    catch
                    {
                        _Codigo_int = 1;  //Para evitar un nuevo error en el parse
                    }
                }
                
                return _Codigo_int;
            }
            set { _Codigo_int = value; }
        }

        public string Nombre
        {
            get { return _Nombre; }
            set { _Nombre = value; }
        }

        public string Estado
        {
            get { return _Estado; }
            set { _Estado = value; }
        }

        public string Objeto_Id
        {
            get
            {
                if (_Objeto_Id == "0") FillMetaData();
                return _Objeto_Id;
            }
        }

        public string Objeto_Codigo
        {
            get
            {
                if (_Objeto_Id == "0") FillMetaData();
                return _Objeto_Codigo;
            }
        }

        public string Objeto_Nombre
        {
            get
            {
                if (_Objeto_Id == "0") FillMetaData();
                return _Objeto_Nombre;
            }
        }

        public int Objeto_Numero
        {
            get
            {
                if (_Objeto_Id == "0") FillMetaData();
                return _Objeto_Numero;
            }
        }
        #endregion

        #region  Función FillMetaData
        // Constructor
        // Consulta los metadatos
        private void FillMetaData()
        {
            // Obtiene el nombre del objeto
            // Guardar en la tabla Objeto el nombre completo con namespace
            // y utilizar el namespace para guardar en la tabla
            string objeto_nombre = GetType().Name;
            // Consulta el objeto en la base
            Dic_ObjetoTableAdapter Adapter = new Dic_ObjetoTableAdapter();
            Diccionario.Dic_ObjetoDataTable filas = Adapter.GetByNombre("1", objeto_nombre);
            //if (filas.Count == 0)
            //    throw();
            Diccionario.Dic_ObjetoRow fila = filas[0];
            // Obtiene los atributos
            _Objeto_Id = fila.Id;
            _Objeto_Codigo = fila.Codigo;
            _Objeto_Nombre = fila.Nombre;
            _Objeto_Numero = fila.Numero;


        }
        #endregion

        #region Genera Id y NormalizarTamanio
        // Servicios
        // Generar el Id
        public void GenNewId(int Int_Sucursal_Numero)
        {
            byte[] randomNumber = new byte[4];
            RNGCryptoServiceProvider Gen = new RNGCryptoServiceProvider();
            Gen.GetBytes(randomNumber);
            UInt32 rand = BitConverter.ToUInt32(randomNumber, 0);

            string strRand = NormalizarTamanio(rand.ToString(), 10);
            string strSucursalNumero = NormalizarTamanio(Int_Sucursal_Numero.ToString(), 2);
            string strObjetoNumero = NormalizarTamanio(Objeto_Numero.ToString(), 5);

            Id = strObjetoNumero + strSucursalNumero + strRand;
        }

        private string NormalizarTamanio(string str, int tamanio)
        {
            if (str.Length < tamanio)
            {
                int faltante = tamanio - str.Length;
                return Math.Pow(10.0, faltante).ToString().Substring(1) + str;
            }
            return str;
        }
        #endregion

        # region Generar Codigo y Número

        public void GenCodigo(string Ver_Version_Id)
        {
            GenerarCodigo gen = new GenerarCodigo();
            Codigo = gen.GenCodigo(Ver_Version_Id,Codigo,Objeto_Nombre);
        }

        public int GenNumero(string Ver_Version_Id)
        {
            GenerarCodigo gen = new GenerarCodigo();
            return gen.GenNumero(Ver_Version_Id, Objeto_Nombre);
        }
        #endregion

        #region  Generar el Estado
        // Generar el Estado
        public
            void GenEstado()
        {
            Estado = null;
        }
        #endregion
    }
}