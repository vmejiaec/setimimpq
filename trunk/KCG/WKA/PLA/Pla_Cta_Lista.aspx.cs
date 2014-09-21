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

    protected void btBuscarCodigo_Click(object sender, EventArgs e)
    {
        buscarCodigo();
    }

    protected void buscarCodigo()
    {
        string criterio = tbCodigo.Text;
        if (string.IsNullOrWhiteSpace(criterio))
        {
            Gv.DataSourceID = odsGv.ID;
        }
        else
        {
            Gv.DataSourceID = "odsgvPla_Partida_ByCodigo";
        }
        Gv.DataBind();
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
        int id = int.Parse((string)e.NewValues["Id"]);
        Gv.DataSourceID = odsGvById.ID;
        odsGvById.SelectParameters["p_Id"].DefaultValue = id.ToString();
        Gv.DataBind();
        Gv.SelectedIndex = 0;
    }
    protected void fvPla_Pardida_ItemDeleted(object sender, System.Web.UI.WebControls.FormViewDeletedEventArgs e)
    {
        buscarCodigo();
    }

    protected void fvPla_Pardida_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        buscarCodigo();
    }

    protected override ObjectDataSource odsGvById
    {
        get { return odsgvPla_Partida_ById; }
    }
}