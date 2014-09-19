using System;

public partial class PLA_Pla_Cta_Lista : PaginaBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override System.Web.UI.WebControls.ObjectDataSource odsFV
    {
        get { return odsfvPla_Partida; }
    }
}