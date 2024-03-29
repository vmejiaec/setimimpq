/*
KOALA SOLUTION 
 
KGrid     - mejoras a la paginacion del GridView       
ver 1.1

Autor:      Adri�n Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicaci�n: Control grid Asp.Net              
							
NOTAS DE DISE�O
 * Version 1.1
   - Propiedad MostrarPaginacionSiempre = true por defecto.
	
HISTORIA     					 
 * Version 1.0
   - Control de items presentados en el grid.
   - Ir a p�gina definida por el usuario.
 * Version 1.1
   - Presentar simpre pagerTemplate (Propiedad MostrarPaginacionSiempre)
   - Controlar estado habilitado de los botonos siguiente, atras

�LTIMA FECHA DE MODIFICACI�N
16-06-2008 10H27

*/


using System;
using System.Collections;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koala.KoalaWebControls
{
    public class KGridBase : GridView
    {
        [Bindable(false)]
        [Category("Paging")]
        [DefaultValue(true)]
        [Localizable(true)]
        [Description("Paginacion siempre visible")]

        public int Total_PaginasGruesa;
        public int Pagina_Actual;
        public int Indice_Navegacion;
        public int Campo_Edicion;

        public bool MostrarPaginacionSiempre
        {
            get { return (bool?) ViewState["MostrarPaginacionSiempre"] ?? true; }
            set { ViewState["MostrarPaginacionSiempre"] = value; }
        }

        protected override void OnRowCreated(GridViewRowEventArgs e)
        {
            base.OnRowCreated(e);
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                TableCell cell = new TableCell();

                Label lblmensaje = new Label();
                lblmensaje.Text = "Filas: ";
                cell.Controls.Add(lblmensaje);

                DropDownList ddlNumeroColumnas = new DropDownList();
                ddlNumeroColumnas.ID = "ddlNumeroColumnas";
                ddlNumeroColumnas.AutoPostBack = true;
                ddlNumeroColumnas.Items.Add("5");
                ddlNumeroColumnas.Items.Add("10");
                ddlNumeroColumnas.Items.Add("15");
                ddlNumeroColumnas.Items.Add("20");
                ddlNumeroColumnas.SelectedIndexChanged += new EventHandler(ddlNumeroColumnas_SelectedIndexChanged);
                cell.Controls.Add(ddlNumeroColumnas);

                Label lblPaginaActual = new Label();
                lblPaginaActual.Text = "  P�gina: ";
                cell.Controls.Add(lblPaginaActual);

                TextBox tbxPaginaActual = new TextBox();
                tbxPaginaActual.ID = "tbxPaginaActual";
                tbxPaginaActual.AutoPostBack = true;
                tbxPaginaActual.TextChanged += new EventHandler(tbxPaginaActual_TextChanged);
                tbxPaginaActual.CssClass = "gotopage";
                cell.Controls.Add(tbxPaginaActual);


                Label lblDe = new Label();
                lblDe.Text = "  de: ";
                cell.Controls.Add(lblDe);

                Label lblPaginaTotales = new Label();
                lblPaginaTotales.ID = "lblPaginaTotales";
                cell.Controls.Add(lblPaginaTotales);

                LiteralControl ltrEspacio = new LiteralControl("  ");
                cell.Controls.Add(ltrEspacio);

                Button btnAtras = new Button();
                btnAtras.CommandName = "Anterior";
                btnAtras.CommandArgument = "-1";
                btnAtras.Click += new EventHandler(btnNavegacion_Click);
                //btnAtras.CommandArgument = "Prev";
                btnAtras.ToolTip = "P�gina previa";
                btnAtras.CssClass = "previous";
                if (Pagina_Actual <=1)
                    btnAtras.Enabled = false;
                cell.Controls.Add(btnAtras);

                LiteralControl ltrEspacio2 = new LiteralControl("  ");
                cell.Controls.Add(ltrEspacio2);

                Button btnSiguiente = new Button();
                btnSiguiente.CommandName = "Siguiente";
                btnSiguiente.CommandArgument ="1";
                //btnSiguiente.CommandArgument = "Next";
                btnSiguiente.Click += new EventHandler(btnNavegacion_Click);
                btnSiguiente.ToolTip = "Siguiente p�gina";
                btnSiguiente.CssClass = "next";
                if (Pagina_Actual == Total_PaginasGruesa)
                    btnSiguiente.Enabled = false;

                //if (Pagina_Actual > Total_PaginasGruesa)
                //    Pagina_Actual = 200;

                cell.Controls.Add(btnSiguiente);

                e.Row.Cells.Clear();
                e.Row.Cells.Add(cell);
            }
        }

       private void btnNavegacion_Click(object sender, EventArgs e)
        {
              Button BotonNavega = (Button)sender;
              if (BotonNavega.CommandName == "Siguiente")
              {
                  Indice_Navegacion = Convert.ToInt32(BotonNavega.CommandArgument);

              }
              else
              {
                  Indice_Navegacion =  Convert.ToInt32(BotonNavega.CommandArgument);
              }
              //Pagina_Actual = Pagina_Actual + Indice_Navegacion;
        }

     

        protected override void OnRowDataBound(GridViewRowEventArgs e)
        {
            base.OnRowDataBound(e);

            if (SortExpression.Length > 0)
            {
                int cellIndex = -1;
                foreach (DataControlField field in Columns)
                {
                    if (field.SortExpression == SortExpression)
                    {
                        cellIndex = Columns.IndexOf(field);
                        break;
                    }
                }

                if (cellIndex > -1)
                {
                    if (e.Row.RowType == DataControlRowType.Header)
                    {
                        //  this is a header row,
                        //  set the sort style
                        e.Row.Cells[cellIndex].CssClass = SortDirection == SortDirection.Ascending
                                                              ? "sortascheaderstyle"
                                                              : "sortdescheaderstyle";
                    }
                    else if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        //  this is an alternating row
                        e.Row.Cells[cellIndex].CssClass = e.Row.RowIndex%2 == 1
                                                              ? "sortalternatingrowstyle"
                                                              : "sortrowstyle";
                    }
                }
            }

            if (e.Row.RowType == DataControlRowType.Pager)
            {
                Label lblTotalNumberOfPages = (Label) e.Row.FindControl("lblPaginaTotales");
                lblTotalNumberOfPages.Text = Total_PaginasGruesa.ToString();
                TextBox txtGoToPage = (TextBox) e.Row.FindControl("tbxPaginaActual");
                //txtGoToPage.Text = Convert.ToString ( Pagina_Actual);
                txtGoToPage.Text = Convert.ToString(Pagina_Actual );
                DropDownList ddlPageSize = (DropDownList) e.Row.FindControl("ddlNumeroColumnas");
                ddlPageSize.SelectedValue = PageSize.ToString();
            }
        }

        private void ddlNumeroColumnas_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDown = (DropDownList) sender;
            PageSize = int.Parse(dropDown.SelectedValue);
        }

        private void tbxPaginaActual_TextChanged(object sender, EventArgs e)
        {
      
            TextBox txtGoToPage = (TextBox) sender;

            //int pageNumber;
            //if (int.TryParse(txtGoToPage.Text.Trim(), out pageNumber) && pageNumber > 0 && pageNumber <= Total_PaginasGruesa)
            //{
            //    Pagina_Actual = pageNumber - 1;
            //}
    
            //int pageNumber;
            //return ;
            Campo_Edicion = 1;
            Pagina_Actual = Convert.ToInt32(txtGoToPage.Text);
           
        }


        protected override int CreateChildControls(IEnumerable dataSource, bool dataBinding)
        {
            int returnValue = base.CreateChildControls(dataSource, dataBinding);
            if (TopPagerRow != null && MostrarPaginacionSiempre)
                TopPagerRow.Visible = true;

            if (BottomPagerRow != null && MostrarPaginacionSiempre)
                BottomPagerRow.Visible = true;

            return returnValue;
        }
    }
}