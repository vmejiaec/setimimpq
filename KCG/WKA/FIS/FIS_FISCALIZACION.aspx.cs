using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Collections.Generic;

public partial class FIS_FIS_FISCALIZACION : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string Fis_Fiscalizacion_Id = Request.QueryString["Fis_Fiscalizacion_Id"];
            if (Fis_Fiscalizacion_Id != null)
            {
                Fv_Fis_Fiscalizacion.ChangeMode(FormViewMode.ReadOnly);
                Fv_Fis_Fiscalizacion.DefaultMode = FormViewMode.ReadOnly;
                //Fv_Fis_Fiscalizacion.DataBind();
            }
        }
        SeleccionarItemEnCarga("Id");
        Fv_Fis_Fiscalizacion.DataBound += new EventHandler(Fv_Fis_Fiscalizacion_DataBound);
    }

    void Fv_Fis_Fiscalizacion_DataBound(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)HttpContext.Current.Session["Scope"];
        TextBox Codigo_Institucion = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Codigo_Institucion");
        TextBox txt_CodIns1 = (TextBox)Fv_Fis_Fiscalizacion.FindControl("txt_CodIns1");
        TextBox txt_CodIns2 = (TextBox)Fv_Fis_Fiscalizacion.FindControl("txt_CodIns2");
        TextBox txt_CodIns3 = (TextBox)Fv_Fis_Fiscalizacion.FindControl("txt_CodIns3");
        TextBox txt_CodIns4 = (TextBox)Fv_Fis_Fiscalizacion.FindControl("txt_CodIns4");
        TextBox txt_CodIns5 = (TextBox)Fv_Fis_Fiscalizacion.FindControl("txt_CodIns5");
        string CodInst = Codigo_Institucion.Text;
        string[] Parametros = CodInst.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
        //if (Codigo_Institucion.Text != " ")
        //{
        //    txt_CodIns1.Text = Parametros[0];
        //    txt_CodIns2.Text = Parametros[1];
        //    txt_CodIns3.Text = Parametros[2];
        //    txt_CodIns4.Text = Parametros[3];
        //    txt_CodIns5.Text = Parametros[4];
        //}

        if (Fv_Fis_Fiscalizacion.CurrentMode == FormViewMode.Insert)
        {
            Estado.Enabled = false;
            Btn_Presupuesto.Enabled = false;
        }
        else
        {
            Estado.Enabled = true;
            Estado.EstadoActualNombre = Fv_Fis_Fiscalizacion.DataKey["Estado"].ToString();
            Estado.EstadoActualID = Fv_Fis_Fiscalizacion.DataKey["Id"].ToString();
            Btn_Presupuesto.Enabled = true;
        }
        if (Fv_Fis_Fiscalizacion.CurrentMode == FormViewMode.Edit)
        {            
            TextBox Jefe_Fiscalizacion = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Jefe_Fiscalizacion");
            TextBox Fiscalizador_Per_Personal_Nombre = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Fiscalizador_Per_Personal_Nombre");            
            if (Jefe_Fiscalizacion.Text == "S")
                Fiscalizador_Per_Personal_Nombre.Enabled = true;
            else
                Fiscalizador_Per_Personal_Nombre.Enabled = false;
                     
        }
        if (Fv_Fis_Fiscalizacion.CurrentMode == FormViewMode.ReadOnly)
        {
            Button btnEditar = (Button)Fv_Fis_Fiscalizacion.FindControl("EditButton");
            TextBox FiscalizadorPerId = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Fiscalizador_Per_Personal_Id");
            TextBox estado = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Estado");
            if (s.Jefe_Fiscalizacion == "S" && estado.Text != "LIQ" || s.Per_Personal_Id == FiscalizadorPerId.Text && estado.Text == "EJE" || s.Per_Personal_Id == FiscalizadorPerId.Text && estado.Text == "PEN")
                btnEditar.Enabled = true;
            else
                btnEditar.Enabled = false;   
        }
    }

    [WebMethod]
    static public string[] Get_Fiscalizador(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.PER.BO_Per_Personal perPersonal = new FEL.PER.BO_Per_Personal();
        List<Per_Personal> lstPersonal = perPersonal.GetByLikeFiscalizacion("", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < lstPersonal.Count && i < count; i++)
        {
            string value = lstPersonal[i].Id + "||" +
                            lstPersonal[i].Par_Razon_Social_Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstPersonal[i].Par_Razon_Social_Nombre, value));
        }
        return opciones.ToArray();
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Fis_Fiscalizacion); }
    }

    protected override FormView Fv
    {
        get { return Fv_Fis_Fiscalizacion; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFv_Fis_Fiscalizacion; }
    }

    protected override string Contenedor
    {
        get { return "FIS_FISCALIZACION"; }
    }

    protected void Btn_Listado_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FIS/FIS_LISTADO_FISCALIZACION.aspx?Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"] + 
            "&Fis_Fiscalizacion_Id=" + Request.QueryString["Fis_Fiscalizacion_Id"]);
    }

    protected void Btn_Presupuesto_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Id");
        Response.Redirect("~/FIS/FIS_PRESUPUESTO_PROYECTO.aspx?Apu_Presupuesto_Id=" + Id_.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Planillas_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Id");
        TextBox FisPerId = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Fiscalizador_Per_Personal_Id");
        Response.Redirect("~/FIS/FIS_PLANILLA.aspx?Apu_Presupuesto_Id=" + Id_.Text + "&Fiscalizador_Per_Personal_Id=" + FisPerId.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Ampliaciones_Click(object sender, EventArgs e)
    {
        TextBox Id_ = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Id");
        TextBox Id_Fiscalizacion = (TextBox)Fv_Fis_Fiscalizacion.FindControl("Id");
        Response.Redirect("~/FIS/FIS_AMPLIACION.aspx?Apu_Presupuesto_Id=" + Id_.Text + "&Fis_Fiscalizacion_Id=" + Id_Fiscalizacion.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Planilla_Per_Click(object sender, EventArgs e)
    {        
        Response.Redirect("~/FIS/FIS_PLANILLA_PERIODO.aspx?Fecha_Inicial=" + Request.QueryString["Fecha_I"] +
            "&Fecha_Final=" + Request.QueryString["Fecha_F"]);
    }
}
