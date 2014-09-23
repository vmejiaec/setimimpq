using System;
using FEL.PLA;
using System.Web.UI.WebControls;

public partial class PLA_Pla_Cta_Lista : PaginaBase
{
    // Atributos
    protected BO_Pla_Partida boAdp = new BO_Pla_Partida();

    // Carga inicial
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override string Contenedor
    {
        get { return "Pla_Cta_Partida"; }
    }
    protected void fvPla_Pardida_ItemInserting(object sender, System.Web.UI.WebControls.FormViewInsertEventArgs e)
    {
        // Valor por defecto del Id y Estado
        e.Values["Id"] = -1;
        e.Values["Estado"] = "PEN";
    }

    protected override System.Web.UI.WebControls.GridView Gv
    {
        get { return gvPla_Partida; }
    }

    protected override System.Web.UI.WebControls.FormView Fv
    {
        get { return fvPla_Pardida; }
    }

    protected override System.Web.UI.WebControls.ObjectDataSource odsGv
    {
        get { return odsgvPla_Partida; }
    }

    protected override System.Web.UI.WebControls.ObjectDataSource odsFv
    {
        get { return odsfvPla_Partida; }
    }

    protected void fvPla_Pardida_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
    {
        tbFiltroId.Text = (string) e.NewValues["Id"];
        
        Gv.DataSourceID = odsGvById.ID;
        Gv.DataBind();
        Gv.SelectedIndex = 0;
        tbFiltro.Text = "";
    }
    protected void fvPla_Pardida_ItemDeleted(object sender, System.Web.UI.WebControls.FormViewDeletedEventArgs e)
    {
        Filtrar();
    }

    protected void fvPla_Pardida_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Gv.DataSourceID = odsGvById.ID;
        Gv.DataBind();
        Gv.SelectedIndex = 0;
        tbFiltro.Text = "";
    }

    protected override ObjectDataSource odsGvById
    {
        get { return odsgvPla_Partida_ById; }
    }

    protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filtrar();
    }

    protected void Filtrar()
    {
        string campo = ddlFiltro.SelectedValue;
        string filtro = tbFiltro.Text;
        switch (campo)
        { 
            case "Todos":
                Gv.DataSourceID = odsGv.ID;
                tbFiltro.Text = "";
                break;
            case "Codigo":
                Gv.DataSourceID = "odsgvPla_Partida_ByCodigo";
                break;
            case "Nombre":
                Gv.DataSourceID = "odsgvPla_Partida_ByNombre";
                break;
        }
        Gv.DataBind();
    }
    protected void odsfvPla_Partida_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        tbFiltroId.Text =  e.ReturnValue.ToString();
    }
    protected void btFiltrar_Click(object sender, EventArgs e)
    {
        Filtrar();
    }
}