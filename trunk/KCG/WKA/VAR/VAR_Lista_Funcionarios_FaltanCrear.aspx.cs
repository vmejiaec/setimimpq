using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VAR_VAR_Lista_Funcionarios_FaltanCrear : PaginaBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override string Contenedor
    {
        get { return "VAR_Lista_Funcionarios_FaltanCrear.aspx"; }
    }

    // Controles para el Filtrar
    #region Controles para el Filtrar
    protected void Filtrar()
    {
        string campo = ddlFiltro.SelectedValue;
        string filtro = tbFiltro.Text;
        switch (campo)
        {
            case "Todos":
                gvFuncionarios.DataSourceID = odsFuncionarios.ID;
                break;
            case "Nombre":
                gvFuncionarios.DataSourceID = odsGetByLikePersona_Nombre.ID;
                break;
        }
        gvFuncionarios.DataBind();
        gvFuncionarios.SelectedIndex = 0;
        // Si existe algún error en el FormView lo borra
        lbMensame.Text = ">Filtrado";
    }
    protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filtrar();
    }
    protected void btFiltrar_Click(object sender, EventArgs e)
    {
        Filtrar();
    }
    #endregion

    protected void btCrearFuncionario_Click(object sender, EventArgs e)
    {
        string cedula = ((TextBox)fvFuncionarioACrear.FindControl("Persona_CodigoLabel")).Text;
        // Consulto si el funcionario ya esta creado en el sistema
        FEL.PAR.BO_Par_Razon_Social adpRazon = new FEL.PAR.BO_Par_Razon_Social();
        List<Par_Razon_Social> listaRazon = adpRazon.GetByLikeNumero("Nombre",Scope,"1",cedula); 
        // Creo el objeto v_funcionario
        if (listaRazon.Count == 0)
        {
            V_INT_Funcionario_Area oFuncionario = new V_INT_Funcionario_Area();
            oFuncionario.Area_Codigo = ((TextBox)fvFuncionarioACrear.FindControl("Area_CodigoLabel")).Text;
            oFuncionario.Area_Nombre = ((TextBox)fvFuncionarioACrear.FindControl("Area_NombreLabel")).Text;
            oFuncionario.Persona_Codigo = ((TextBox)fvFuncionarioACrear.FindControl("Persona_CodigoLabel")).Text;
            oFuncionario.Persona_Nombre = ((TextBox)fvFuncionarioACrear.FindControl("Persona_NombreLabel")).Text;
            oFuncionario.Persona_Cargo = ((TextBox)fvFuncionarioACrear.FindControl("Persona_CargoLabel")).Text;
            oFuncionario.Persona_Usuario = ((TextBox)fvFuncionarioACrear.FindControl("Persona_UsuarioLabel")).Text;
            oFuncionario.Persona_Password = ((TextBox)fvFuncionarioACrear.FindControl("Persona_PasswordLabel")).Text;
            // Inserto el funcionario
            FEL.VAR.BO_V_INT_Funcionario_Area adp = new FEL.VAR.BO_V_INT_Funcionario_Area();
            string res = adp.Insert(Scope, oFuncionario);
            // Publico los Ids resultados
            string[] lista = res.Split('-');
            string[] sublista = lista[0].Split(':');
            tbRazonId.Text = lista[0];
            tbPersonaId.Text = lista[1];
            tbUsuarioId.Text = lista[2];
            lbMensame.Text = "El funcionario: " + oFuncionario.Persona_Nombre +
                " ha sido creado en el sistema con el usuario: " + oFuncionario.Persona_Usuario;
        }
        else
        {
            lbMensame.Text = "Ya existe un usuario con esa cédula en el sistema: " + cedula;
        }
    }
    protected void btIrAPantallaRazonSocial_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PAR/PAR_RAZON_SOCIAL.aspx");
    }
    protected void btIrAPantallaPersona_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PER/PER_PERSONAL.aspx");
    }
    protected void btIrAPantallaUsuario_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/INT/INT_USUARIO_PERSONAL.aspx");
    }
}