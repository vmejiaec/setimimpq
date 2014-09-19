using System;
using System.Collections.Generic;
using System.Text;

namespace AEL.EST
{
    public class Est_Menu_Arbol
    {
        private string _Id;
        private string _Padre_Id;
        private string _Etiqueta_Menu;
        private string _Ruta_Imagen;
        private string _Contenedor;
        private string _Tool_Tips;
        private bool _Activado;

        public Est_Menu_Arbol()
        {
            
        }

        public Est_Menu_Arbol(string Id, string Padre_Id, string Etiqueta_Menu,
            string Ruta_Imagen, string Contenedor, string Tool_Tips, bool Activado)
        {
            _Id = Id;
            _Padre_Id = Padre_Id;
            _Etiqueta_Menu = Etiqueta_Menu;
            _Ruta_Imagen = Ruta_Imagen;
            _Contenedor = Contenedor;
            _Tool_Tips = Tool_Tips;
            _Activado = Activado;
        }

        public string Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        public string Padre_Id
        {
            get { return _Padre_Id; }
            set { _Padre_Id = value; }
        }

        public string Etiqueta_Menu
        {
            get { return _Etiqueta_Menu; }
            set { _Etiqueta_Menu = value; }
        }

        public string Ruta_Imagen
        {
            get { return _Ruta_Imagen; }
            set { _Ruta_Imagen = value; }
        }

        public string Contenedor
        {
            get { return _Contenedor; }
            set { _Contenedor = value; }
        }

        public string Tool_Tips
        {
            get { return _Tool_Tips; }
            set { _Tool_Tips = value; }
        }

        public bool Activado
        {
            get { return _Activado; }
            set { _Activado = value; }
        }
    }
}
