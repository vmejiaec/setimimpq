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
using System.Globalization;

public partial class APU_Apu_Equipo : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Apu_Equipo_Id = Request.QueryString.Get("Apu_Equipo_Id");
        if (Apu_Equipo_Id != null)
        {
            AsignarParametrosDataSourceDeatailsView(Apu_Equipo_Id);
            Fv.DefaultMode = FormViewMode.ReadOnly;
        }
        EtiquetarBotones();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuEquipo);
    }
  
    private void EtiquetarBotones()
    {
        btn_Clonar.Text = GetLocalResourceObject("Btn_Clonar_EquipoRecursoKCG.Text").ToString();
        btn_Clonar.ToolTip = GetLocalResourceObject("Btn_Clonar_EquipoRecursoKCG.ToolTip").ToString();
        btn_Historico.Text = GetLocalResourceObject("Btn_Historico_EquipoRecursoKCG.Text").ToString();
        btn_Historico.ToolTip = GetLocalResourceObject("Btn_Historico_EquipoRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuEquipo(object sender, EventArgs e)
    {
        if(Fv.CurrentMode == FormViewMode.Insert)
        {
            TextBox Costo_Combustible = (TextBox)Fv.FindControl("Costo_Combustible");
            TextBox Costo_Repuesto = (TextBox)Fv.FindControl("Costo_Repuesto");
            TextBox Costo_Mantenimiento = (TextBox)Fv.FindControl("Costo_Mantenimiento");
            TextBox Costo_Alquiler = (TextBox)Fv.FindControl("Costo_Alquiler");
            TextBox Costo_Otros = (TextBox)Fv.FindControl("Costo_Otros");
            TextBox Costo_Hora = (TextBox)Fv.FindControl("Costo_Hora");
            TextBox Costo_Total = (TextBox)Fv.FindControl("Costo_Total");

            Costo_Combustible.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Repuesto.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Mantenimiento.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Alquiler.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Otros.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Hora.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
            Costo_Total.Text = 0.ToString("N4", NumberFormatInfo.CurrentInfo);
        }
    }
    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Equipo); }
    }

    protected override GridView Gv
    {
        get { return  GridViewEquipos; }
    }

    protected override FormView Fv
    {
        get { return FormViewEquipos; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return OdsgvEquipos; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return OdsApu_Equipo; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override Koala.KoalaWebControls.KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }
    protected override string Contenedor
    {
        get { return "APU_EQUIPO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected void Disponible_DataBound(object sender, EventArgs e)
    {
        if(Fv.CurrentMode == FormViewMode.Insert)
        {
            DropDownList ddlDisponible = (DropDownList) sender;
            ddlDisponible.SelectedValue = "S";
        }
    }

    protected void btn_Clonar_Click(object sender, EventArgs e)
    {
        TextBox EquipoId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/APU/APU_CLONAR.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + EquipoId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);
    }

    protected void btn_Historico_Click(object sender, EventArgs e)
    {
        TextBox EquipoId = (TextBox)Fv.FindControl("Id");
        Response.Redirect("~/HIS/HIS_GENERAR_HISTORICO.aspx" +
                            "?Dic_Objeto_Nombre=" + TipoObjeto.Name +
                            "&Dic_Objeto_Id=" + EquipoId.Text +
                            "&Dic_Contenedor_Nombre=" + Contenedor);
    }
}


