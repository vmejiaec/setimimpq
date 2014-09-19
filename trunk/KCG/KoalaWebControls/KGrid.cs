/*
KOALA SOLUTION 
 
KGrid     - mejoras a la paginacion del GridView       
ver 1.1

Autor:      Adrián Armijos
Lenguaje:   C# 2.0 framework: 2.0                                  
Aplicación: Control grid Asp.Net              
							
NOTAS DE DISEÑO
 * Version 1.1
   - Propiedad MostrarPaginacionSiempre = true por defecto.
	
HISTORIA     					 
 * Version 1.0
   - Control de items presentados en el grid.
   - Ir a página definida por el usuario.
 * Version 1.1
   - Presentar simpre pagerTemplate (Propiedad MostrarPaginacionSiempre)
   - Controlar estado habilitado de los botonos siguiente, atras

ÚLTIMA FECHA DE MODIFICACIÓN
16-06-2008 10H27

*/


using System;
using System.Collections;
using System.ComponentModel;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koala.KoalaWebControls
{
    public class KGrid : GridView
    {
        [Bindable(false)]
        [Category("Paging")]
        [DefaultValue(true)]
        [Localizable(true)]
        [Description("Paginacion siempre visible")]
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
                lblPaginaActual.Text = "  Página: ";
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
                btnAtras.CommandName = "Page";
                btnAtras.CommandArgument = "Prev";
                btnAtras.ToolTip = "Página previa";
                btnAtras.CssClass = "previous";
                if (PageIndex == 0)
                    btnAtras.Enabled = false;
                cell.Controls.Add(btnAtras);

                LiteralControl ltrEspacio2 = new LiteralControl("  ");
                cell.Controls.Add(ltrEspacio2);

                Button btnSiguiente = new Button();
                btnSiguiente.CommandName = "Page";
                btnSiguiente.CommandArgument = "Next";
                btnSiguiente.ToolTip = "Siguinete página";
                btnSiguiente.CssClass = "next";
                if (PageIndex == PageCount - 1)
                    btnSiguiente.Enabled = false;

                cell.Controls.Add(btnSiguiente);

                e.Row.Cells.Clear();
                e.Row.Cells.Add(cell);
            }
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
                lblTotalNumberOfPages.Text = PageCount.ToString();

                TextBox txtGoToPage = (TextBox) e.Row.FindControl("tbxPaginaActual");
                txtGoToPage.Text = (PageIndex + 1).ToString();

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

            int pageNumber;
            if (int.TryParse(txtGoToPage.Text.Trim(), out pageNumber) && pageNumber > 0 && pageNumber <= PageCount)
            {
                PageIndex = pageNumber - 1;
            }
            /*else
            {
                PageIndex = 0;
            }*/
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