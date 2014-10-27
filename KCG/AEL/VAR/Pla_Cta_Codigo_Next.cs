using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AEL.VAR
{
    public class Pla_Cta_Codigo_Next
    {
        string _Codigo;
        string _Cta_Bro_Next;
        string _Nivel_Bro;
        string _Cta_Son_Next;
        string _Nivel_Son;

        //Constructores
        public Pla_Cta_Codigo_Next()
        { }

        public Pla_Cta_Codigo_Next(
            string p_Codigo,
            string p_Cta_Bro_Next,
            string p_Nivel_Bro,
            string p_Cta_Son_Next,
            string p_Nivel_Son
            )
        {
            this.Codigo = p_Codigo;
            this.Cta_Bro_Next = p_Cta_Bro_Next;
            this.Nivel_Bro = p_Nivel_Bro;
            this.Cta_Son_Next = p_Cta_Son_Next;
            this.Nivel_Son = p_Nivel_Son;
        }

        // Propiedades
        public string Nivel_Son
        {
            get { return _Nivel_Son; }
            set { _Nivel_Son = value; }
        }

        public string Cta_Son_Next
        {
            get { return _Cta_Son_Next; }
            set { _Cta_Son_Next = value; }
        }

        public string Nivel_Bro
        {
            get { return _Nivel_Bro; }
            set { _Nivel_Bro = value; }
        }

        public string Cta_Bro_Next
        {
            get { return _Cta_Bro_Next; }
            set { _Cta_Bro_Next = value; }
        }

        public string Codigo
        {
            get { return _Codigo; }
            set { _Codigo = value; }
        }
    }
}
