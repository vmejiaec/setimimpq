using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FEL.EST;

public partial class MenuKCG : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Est_Menu_Arbol> lstMenuKCG;
            lstMenuKCG = (List<Est_Menu_Arbol>)Cache["MenuKoala"];
            if (SegMenuKCG.Items.Count == 0)
            {
                Scope s = (Scope)Session["Scope"];
                BO_Est_Menu_Arbol boEstMenuArbol = new BO_Est_Menu_Arbol();
                List<Est_Menu_Arbol> menu = new List<Est_Menu_Arbol>();
                //if (lstMenuKCG == null)
                //{
                    menu = boEstMenuArbol.Get("Contenedor", s);
                    Cache["MenuKoala"] = menu;
                //}
                //else
                //    menu = lstMenuKCG;

                foreach (Est_Menu_Arbol drMenuItem in menu)
                {
                    if (drMenuItem.Etiqueta_Menu == null)
                        drMenuItem.Etiqueta_Menu = "";

                    if (drMenuItem.Padre_Id.Equals(""))
                        drMenuItem.Padre_Id = drMenuItem.Id;

                    if (drMenuItem.Id.Equals(drMenuItem.Padre_Id))
                    {
                        MenuItem mnuMenuItem = new MenuItem();
                        mnuMenuItem.Value = drMenuItem.Id.ToString();

                        if (drMenuItem.Etiqueta_Menu == null)
                            drMenuItem.Etiqueta_Menu = string.Empty;
                        mnuMenuItem.Text = drMenuItem.Etiqueta_Menu.ToString();

                        if (drMenuItem.Ruta_Imagen == null)
                            drMenuItem.Ruta_Imagen = string.Empty;
                        mnuMenuItem.ImageUrl = drMenuItem.Ruta_Imagen.ToString();

                        if (drMenuItem.Contenedor == null)
                            drMenuItem.Contenedor = string.Empty;
                        mnuMenuItem.NavigateUrl = drMenuItem.Contenedor.ToString();
                        mnuMenuItem.ToolTip = drMenuItem.Tool_Tips;
                        SegMenuKCG.Items.Add(mnuMenuItem);
                        AddMenuItem(mnuMenuItem, menu);
                    }
                }
            }
        }
        //ImgBtn_Refrescar.Click += new ImageClickEventHandler(ImgBtn_Refrescar_Click);
    }

    void ImgBtn_Refrescar_Click(object sender, EventArgs e)
    {
        //Inavilitar el Cache
        if (Cache["MenuKoala"] != null)
        {
            Cache["MenuKoala"] = new List<Est_Menu_Arbol>();
        }
        //Crear nueva instancia del Control
        SegMenuKCG = new Menu();

        //Proceso para Construir el Menú
        List<Est_Menu_Arbol> lstMenuKCG;
        lstMenuKCG = (List<Est_Menu_Arbol>)Cache["MenuKoala"];
        if (SegMenuKCG.Items.Count == 0)
        {
            Scope s = (Scope)Session["Scope"];
            BO_Est_Menu_Arbol boEstMenuArbol = new BO_Est_Menu_Arbol();
            List<Est_Menu_Arbol> menu = new List<Est_Menu_Arbol>();
            if (lstMenuKCG.Count == 0)
            {
                menu = boEstMenuArbol.Get("Contenedor", s);
                Cache["MenuKoala"] = menu;
            }
            else
                menu = lstMenuKCG;

            foreach (Est_Menu_Arbol drMenuItem in menu)
            {
                if (drMenuItem.Etiqueta_Menu == null)
                    drMenuItem.Etiqueta_Menu = "";

                if (drMenuItem.Padre_Id.Equals(""))
                    drMenuItem.Padre_Id = drMenuItem.Id;

                if (drMenuItem.Id.Equals(drMenuItem.Padre_Id))
                {
                    MenuItem mnuMenuItem = new MenuItem();
                    mnuMenuItem.Value = drMenuItem.Id.ToString();

                    if (drMenuItem.Etiqueta_Menu == null)
                        drMenuItem.Etiqueta_Menu = string.Empty;
                    mnuMenuItem.Text = drMenuItem.Etiqueta_Menu.ToString();

                    if (drMenuItem.Ruta_Imagen == null)
                        drMenuItem.Ruta_Imagen = string.Empty;
                    mnuMenuItem.ImageUrl = drMenuItem.Ruta_Imagen.ToString();

                    if (drMenuItem.Contenedor == null)
                        drMenuItem.Contenedor = string.Empty;
                    mnuMenuItem.NavigateUrl = drMenuItem.Contenedor.ToString();
                    mnuMenuItem.ToolTip = drMenuItem.Tool_Tips;
                    SegMenuKCG.Items.Add(mnuMenuItem);
                    AddMenuItem(mnuMenuItem, menu);
                }
            }
        }   
    }

    private void AddMenuItem(MenuItem mnuMenuItem, List<Est_Menu_Arbol> dtMenuItems)
    {
        foreach (Est_Menu_Arbol drMenuItem in dtMenuItems)
        {
            if (drMenuItem.Etiqueta_Menu == null)
                drMenuItem.Etiqueta_Menu = "";

            if (drMenuItem.Padre_Id.Equals(""))
                drMenuItem.Padre_Id = drMenuItem.Id;

            if (drMenuItem.Padre_Id.ToString().Equals(mnuMenuItem.Value) &&
                (!drMenuItem.Id.Equals(drMenuItem.Padre_Id)))
            {
                MenuItem mnuNewMenuItem = new MenuItem();
                mnuNewMenuItem.Value = drMenuItem.Id.ToString();

                if (drMenuItem.Etiqueta_Menu == null)
                    drMenuItem.Etiqueta_Menu = string.Empty;
                mnuNewMenuItem.Text = drMenuItem.Etiqueta_Menu.ToString();

                if (drMenuItem.Ruta_Imagen == null)
                    drMenuItem.Ruta_Imagen = string.Empty;
                mnuNewMenuItem.ImageUrl = drMenuItem.Ruta_Imagen.ToString();

                if (drMenuItem.Contenedor == null)
                    drMenuItem.Contenedor = string.Empty;
                mnuNewMenuItem.NavigateUrl = drMenuItem.Contenedor.ToString();
                mnuNewMenuItem.ToolTip = drMenuItem.Tool_Tips;
                mnuMenuItem.ChildItems.Add(mnuNewMenuItem);
                AddMenuItem(mnuNewMenuItem, dtMenuItems);
            }
        }
    }

    private MenuItem ConstruirMenuItem(Est_Menu_Arbol estMenuItem)
    {
        MenuItem menuItem = new MenuItem();
        menuItem.Value = estMenuItem.Id;
        menuItem.Text = estMenuItem.Etiqueta_Menu;
        menuItem.ImageUrl = estMenuItem.Ruta_Imagen;
        menuItem.NavigateUrl = estMenuItem.Contenedor;
        menuItem.ToolTip = estMenuItem.Tool_Tips;
        menuItem.Selectable = estMenuItem.Activado;
        return menuItem;
    }
}
