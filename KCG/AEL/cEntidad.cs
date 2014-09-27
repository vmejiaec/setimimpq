using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AEL
{
    public class cEntidad
    {
        private int _Id;
        private string _Codigo;
        public int Id
        {
            get { return this._Id;}
            set { this._Id = value;}
        }
        public string Codigo
        {
            get{ return this._Codigo; }
            set{ this._Codigo = value;}
        }
    }
}
