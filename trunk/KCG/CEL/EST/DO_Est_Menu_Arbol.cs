/*
KOALA SOLUTION 
 
DO_Est_Menu_Arbol     - Forma la lógica padre hijo para el menu
ver 2.0.0

Diseño:       Elizabeth Loayza
Programación: Adrián Armijos
Lenguaje:     C# 2.0 framework: 2.0                                  
Aplicación:   KoalaFramework Asp.Net              
							
NOTAS DE DISEÑO
 * Versiones anteriores
   - 
 * Versión 2.0.0
   - Todas los item de menu q tengan null en contenedor
     
HISTORIA     					 
 * Versiones anteriores
   - 
 * Versión 2.0.0
   - Correción Errores
TRABAJO FUTURO
   - 

ÚLTIMA FECHA DE MODIFICACIÓN
5-08-2008 15H31

*/

using System;
using System.Collections.Generic;
using System.Text;
using AEL.EST;
using AEL.SEG;
using BEL;
using CEL.SEG;

namespace CEL.EST
{
    /// <summary>
    /// Se encarga de Armar el Menú Arbol
    /// </summary>
    public class DO_Est_Menu_Arbol
    {
        # region Adapter
        private DO_Seg_Menu _Adapter;
        /// <summary>
        /// Acceso al Table Adapter de la capa ADL
        /// </summary>
        public DO_Seg_Menu Adapter
        {
            get
            {
                if (_Adapter == null)
                    _Adapter = new DO_Seg_Menu();
                return _Adapter;
            }
        }
        #endregion
        # region Obtención de Datos
        /// <summary>
        /// Obtiene el menu con lógica padre/hijo
        /// </summary>
        /// <param name="s">Scope</param>
        /// <param name="Seg_Rol_Id">Id del rol del usuario</param>
        /// <param name="Int_Usuario_Id">Id del usuario</param>
        /// <param name="Par_Servidor_Id">Id de servidor de presentación</param>
        /// <returns>menu</returns>
        public List<Est_Menu_Arbol> Get(Scope s)
        {
            List<Seg_Menu> segMenu = Adapter.GetByRolUsuario(s, s.Seg_Rol_Id, s.Int_Usuario_Id, s.Par_Servidor_Id);
            List<Est_Menu_Arbol> menu = new List<Est_Menu_Arbol>();

            Seg_Menu anterior = new Seg_Menu();
            Seg_Menu actual = null;
            for (int i = 0; i < segMenu.Count; i++)
            {
                actual = segMenu[i];
                AgregarNodo(menu, ObtenerCasoNodoMenu(actual, anterior), actual);
                anterior = segMenu[i];
            }
            return menu;
        }
        #endregion
        # region Operación con Datos

        /// <summary>
        /// Obtiene los casos documentados en la orden PAR_MENU
        /// </summary>
        /// <param name="actual">item de menu actual</param>
        /// <param name="anterior">item de menu anterior</param>
        /// <returns>El caso correspondiente para el menu actual</returns>
        private int ObtenerCasoNodoMenu(Seg_Menu actual, Seg_Menu anterior)
        {
            if (actual.Dic_Pantalla_Id == null)
                return actual.Grupo == null ? 8 : actual.Grupo == anterior.Grupo ? 7 : 6;
            else
            {
                if (actual.Grupo == null)
                    return actual.Dic_Pantalla_Id == anterior.Dic_Pantalla_Id ? 5 : 4;
                else
                    return actual.Dic_Pantalla_Id == anterior.Dic_Pantalla_Id ? (actual.Grupo == anterior.Grupo ? 2 : 3) : 1;
            }
        }

        private void AgregarNodo(List<Est_Menu_Arbol> menu, int caso, Seg_Menu nodoMenu)
        {
            switch (caso)
            {
                case 8:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Id,//Id
                                           string.Empty,//Padre_Id
                                           nodoMenu.ver_etiqueta_nombre,//Etiqueta_Menu
                                           nodoMenu.ver_etiqueta_imagen_activa,//Ruta_Imagen
                                           nodoMenu.Par_servidor_det_referencia,//Contenedor
                                           nodoMenu.tool_ver_etiqueta_nombre,// tooltips
                                           true));//activado

                    break;

                case 6:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Grupo,//Id
                                            string.Empty,//Padre_Id
                                            nodoMenu.grupo_nombre,//Etiqueta_Menu
                                            string.Empty,//Ruta_Imagen
                                            string.Empty,//Contenedor
                                            string.Empty,// tooltips
                                            false));//activado
                    goto case 7;

                case 7:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Id,//Id
                                            nodoMenu.Grupo,//Padre_Id
                                            nodoMenu.ver_etiqueta_nombre,//Etiqueta_Menu
                                            nodoMenu.ver_etiqueta_imagen_activa,//Ruta_Imagen
                                            nodoMenu.Par_servidor_det_referencia,//Contenedor
                                            nodoMenu.tool_ver_etiqueta_nombre,// tooltips
                                            true)); //activado
                    break;

                case 4:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Dic_Pantalla_Id, //Id
                                            string.Empty, //Padre_Id
                                            nodoMenu.pantalla_ver_etiqueta_nombre, //Etiqueta_Menu
                                            nodoMenu.pantalla_ver_etiqueta_imagen_activa, //Ruta_Imagen
                                            string.Empty, //Contenedor
                                            nodoMenu.tool_pantalla_ver_etiqueta_nombre, // tooltips
                                            false)); //activado
                    goto case 5;

                case 5:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Id, //Id
                                           nodoMenu.Dic_Pantalla_Id, //Padre_Id
                                           nodoMenu.ver_etiqueta_nombre, //Etiqueta_Menu
                                           nodoMenu.ver_etiqueta_imagen_activa, //Ruta_Imagen
                                           nodoMenu.Par_servidor_det_referencia, //Contenedor
                                           nodoMenu.tool_ver_etiqueta_nombre, // tooltips
                                           true)); //activado

                    break;

                case 1:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Dic_Pantalla_Id, //Id
                                            string.Empty, //Padre_Id
                                            nodoMenu.pantalla_ver_etiqueta_nombre, //Etiqueta_Menu
                                            nodoMenu.pantalla_ver_etiqueta_imagen_activa, //Ruta_Imagen
                                            string.Empty, //Contenedor
                                            nodoMenu.tool_pantalla_ver_etiqueta_nombre, // tooltips
                                            false)); //activado
                    goto case 3;

                case 2:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Id, //Id
                                       nodoMenu.Dic_Pantalla_Id + nodoMenu.Grupo, //Padre_Id
                                       nodoMenu.ver_etiqueta_nombre, //Etiqueta_Menu
                                       nodoMenu.ver_etiqueta_imagen_activa, //Ruta_Imagen
                                       nodoMenu.Par_servidor_det_referencia, //Contenedor
                                       nodoMenu.tool_ver_etiqueta_nombre, // tooltips
                                       true)); //activado
                    break;

                case 3:
                    menu.Add(new Est_Menu_Arbol(nodoMenu.Dic_Pantalla_Id + nodoMenu.Grupo, //Id
                                       nodoMenu.Dic_Pantalla_Id, //Padre_Id
                                       nodoMenu.grupo_nombre, //Etiqueta_Menu
                                       string.Empty, //Ruta_Imagen
                                       string.Empty, //Contenedor
                                       string.Empty, // tooltips
                                       false)); //activado
                    goto case 2;
            }
        }

        //Version 1.0
        //private enum TipoSegMenuNodo
        //{
        //    GxDx,
        //    GoDx,
        //    GxDo,
        //    GoDo,
        //    Indeterminado
        //};

        //private bool CompararConAnterior(List<Seg_Menu> segMenu, TipoSegMenuNodo tipoActual, int indiceActual )
        //{
        //    if (indiceActual == 0)
        //        return false;
            
        //    int indiceAnterior = indiceActual - 1;
        //    TipoSegMenuNodo tipoAnterior = ObtenerTipoSegMenuNodo(segMenu, indiceAnterior);

        //    bool resultadoComparacion = false;

        //    if (tipoActual == tipoAnterior)
        //    {
        //        switch(tipoActual)
        //        {
        //            case TipoSegMenuNodo.GoDx:
        //                resultadoComparacion = (segMenu[indiceActual].Grupo == segMenu[indiceAnterior].Grupo);
        //                break;
        //            case TipoSegMenuNodo.GxDo:
        //                resultadoComparacion = (segMenu[indiceActual].Dic_Pantalla_Id == segMenu[indiceAnterior].Dic_Pantalla_Id);
        //                break;
        //            case TipoSegMenuNodo.GoDo:
        //                resultadoComparacion = (segMenu[indiceActual].Dic_Pantalla_Id ==
        //                                        segMenu[indiceAnterior].Dic_Pantalla_Id);
        //                break;
        //        }
        //    }
        //    return resultadoComparacion;
        //}

        //private TipoSegMenuNodo ObtenerTipoSegMenuNodo(List<Seg_Menu> segMenu, int indice)
        //{
        //    TipoSegMenuNodo tipoSegMenuNodo = TipoSegMenuNodo.Indeterminado;

        //    if (segMenu[indice].Grupo == null && segMenu[indice].Dic_Pantalla_Id == null)
        //    {
        //        tipoSegMenuNodo = TipoSegMenuNodo.GxDx;
        //    }
        //    else if (segMenu[indice].Grupo != null && segMenu[indice].Dic_Pantalla_Id == null)
        //    {
        //        tipoSegMenuNodo = TipoSegMenuNodo.GoDx;
        //    }
        //    else if (segMenu[indice].Grupo == null && segMenu[indice].Dic_Pantalla_Id != null)
        //    {
        //        tipoSegMenuNodo = TipoSegMenuNodo.GxDo;
        //    }
        //    else if (segMenu[indice].Grupo != null && segMenu[indice].Dic_Pantalla_Id != null)
        //    {
        //        tipoSegMenuNodo = TipoSegMenuNodo.GoDo;
        //    }
        //    return tipoSegMenuNodo;
        //}

        //private void AgregarNodoMenu(List<Est_Menu_Arbol> menu, List<Seg_Menu> segMenu, TipoSegMenuNodo tipoNodo, int indice)
        //{
        //    switch(tipoNodo)
        //    {
        //        case TipoSegMenuNodo.GxDx:
        //            menu.Add(new Est_Menu_Arbol(segMenu[indice].Id,//Id
        //                                   "",//Padre_Id
        //                                   segMenu[indice].ver_etiqueta_nombre,//Etiqueta_Menu
        //                                   segMenu[indice].ver_etiqueta_imagen_activa,//Ruta_Imagen
        //                                   segMenu[indice].Par_servidor_det_referencia,//Contenedor
        //                                   segMenu[indice].tool_ver_etiqueta_nombre,// tooltips
        //                                   true));//activado
        //            break;

        //        case TipoSegMenuNodo.GoDx:
        //            if (!CompararConAnterior(segMenu, tipoNodo, indice))
        //            {
        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Grupo,//Id
        //                                        "",//Padre_Id
        //                                        segMenu[indice].grupo_nombre,//Etiqueta_Menu
        //                                        "",//Ruta_Imagen
        //                                        "",//Contenedor
        //                                        "",// tooltips
        //                                        true));//activado

        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Id,//Id
        //                                        segMenu[indice].Grupo,//Padre_Id
        //                                        segMenu[indice].ver_etiqueta_nombre,//Etiqueta_Menu
        //                                        segMenu[indice].ver_etiqueta_imagen_activa,//Ruta_Imagen
        //                                        segMenu[indice].Par_servidor_det_referencia,//Contenedor
        //                                        segMenu[indice].tool_ver_etiqueta_nombre,// tooltips
        //                                        true));//activado
        //            }
        //            else
        //            {
        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Id,//Id
        //                                        segMenu[indice].Grupo,//Padre_Id
        //                                        segMenu[indice].ver_etiqueta_nombre,//Etiqueta_Menu
        //                                        segMenu[indice].ver_etiqueta_imagen_activa,//Ruta_Imagen
        //                                        segMenu[indice].Par_servidor_det_referencia,//Contenedor
        //                                        segMenu[indice].tool_ver_etiqueta_nombre,// tooltips
        //                                        true)); //activado
        //            }
        //            break;

        //        case TipoSegMenuNodo.GxDo:
        //            if (!CompararConAnterior(segMenu, tipoNodo, indice))
        //            {
        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Dic_Pantalla_Id, //Id
        //                                        "", //Padre_Id
        //                                        segMenu[indice].pantalla_ver_etiqueta_nombre, //Etiqueta_Menu
        //                                        segMenu[indice].pantalla_ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                        "", //Contenedor
        //                                        segMenu[indice].tool_pantalla_ver_etiqueta_nombre, // tooltips
        //                                        true)); //activado

        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Id, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id, //Padre_Id
        //                                       segMenu[indice].ver_etiqueta_nombre, //Etiqueta_Menu
        //                                       segMenu[indice].ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                       segMenu[indice].Par_servidor_det_referencia, //Contenedor
        //                                       segMenu[indice].tool_ver_etiqueta_nombre, // tooltips
        //                                       true)); //activado
        //            }
        //            else
        //            {
        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Id, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id, //Padre_Id
        //                                       segMenu[indice].ver_etiqueta_nombre, //Etiqueta_Menu
        //                                       segMenu[indice].ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                       segMenu[indice].Par_servidor_det_referencia, //Contenedor
        //                                       segMenu[indice].tool_ver_etiqueta_nombre, // tooltips
        //                                       true)); //activado
        //            }
        //            break;

        //        case TipoSegMenuNodo.GoDo:
        //            if (!CompararConAnterior(segMenu, tipoNodo, indice))
        //            {
        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Dic_Pantalla_Id, //Id
        //                                        "", //Padre_Id
        //                                        segMenu[indice].pantalla_ver_etiqueta_nombre, //Etiqueta_Menu
        //                                        segMenu[indice].pantalla_ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                        "", //Contenedor
        //                                        segMenu[indice].tool_pantalla_ver_etiqueta_nombre, // tooltips
        //                                        true)); //activado

        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Dic_Pantalla_Id + segMenu[indice].Grupo, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id, //Padre_Id
        //                                       segMenu[indice].grupo_nombre, //Etiqueta_Menu
        //                                       "", //Ruta_Imagen
        //                                       "", //Contenedor
        //                                       "", // tooltips
        //                                       true)); //activado

        //                menu.Add(new Est_Menu_Arbol(segMenu[indice].Id, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id + segMenu[indice].Grupo, //Padre_Id
        //                                       segMenu[indice].ver_etiqueta_nombre, //Etiqueta_Menu
        //                                       segMenu[indice].ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                       segMenu[indice].Par_servidor_det_referencia, //Contenedor
        //                                       segMenu[indice].tool_ver_etiqueta_nombre, // tooltips
        //                                       true)); //activado
        //            }
        //            else
        //            {
        //                if (segMenu[indice].Dic_Pantalla_Id == segMenu[indice - 1].Dic_Pantalla_Id
        //                    && segMenu[indice].Grupo == segMenu[indice -1].Grupo)
        //                {
        //                    menu.Add(new Est_Menu_Arbol(segMenu[indice].Id, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id + segMenu[indice].Grupo, //Padre_Id
        //                                       segMenu[indice].ver_etiqueta_nombre, //Etiqueta_Menu
        //                                       segMenu[indice].ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                       segMenu[indice].Par_servidor_det_referencia, //Contenedor
        //                                       segMenu[indice].tool_ver_etiqueta_nombre, // tooltips
        //                                       true)); //activado
        //                }
        //                else if (segMenu[indice].Dic_Pantalla_Id == segMenu[indice - 1].Dic_Pantalla_Id
        //                    && segMenu[indice].Grupo != segMenu[indice -1].Grupo)
        //                {
        //                    menu.Add(new Est_Menu_Arbol(segMenu[indice].Dic_Pantalla_Id + segMenu[indice].Grupo, //Id
        //                                       segMenu[indice].Dic_Pantalla_Id, //Padre_Id
        //                                       segMenu[indice].grupo_nombre, //Etiqueta_Menu
        //                                       "", //Ruta_Imagen
        //                                       "", //Contenedor
        //                                       "", // tooltips
        //                                       true)); //activado

        //                    menu.Add(new Est_Menu_Arbol(segMenu[indice].Id, //Id
        //                                           segMenu[indice].Dic_Pantalla_Id + segMenu[indice].Grupo, //Padre_Id
        //                                           segMenu[indice].ver_etiqueta_nombre,   //Etiqueta_Menu
        //                                           segMenu[indice].ver_etiqueta_imagen_activa, //Ruta_Imagen
        //                                           segMenu[indice].Par_servidor_det_referencia, //Contenedor
        //                                           segMenu[indice].tool_ver_etiqueta_nombre, // tooltips
        //                                           true)); //activado
        //                }
        //            }
        //            break;
        //    }
        //}
        #endregion
    }
}
