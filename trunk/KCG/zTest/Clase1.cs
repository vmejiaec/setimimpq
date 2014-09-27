using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace zTest
{
    public class Clase1: cEnt
    {
        private int _Id;
        private string _Nombre;
        private string _Estado;

        public Clase1()
        { }

        public Clase1(int id, string nom, string est)
        {
            this._Id = id;
            this._Nombre = nom;
            this._Estado = est;
        }

        public int Id
        {
            get
            {
                return this._Id;
            }
            set
            {
                this._Id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return this._Nombre;
            }
            set
            {
                this._Nombre = value;
            }
        }

        public string Estado
        {
            get
            {
                return this._Estado;
            }
            set
            {
                this._Estado = value;
            }
        }
    }
}
