using System;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FEL.META;
using Koala.KoalaWebControls;

public partial class DIC_DIC_MANTENIMIENTO_PAR_PAGINACION : Page
{
    private readonly Color bien = Color.WhiteSmoke;
    private readonly Color mal = Color.Red;

    protected string Contenedor
    {
        get { return "AUD_PAR_AUDITORIA"; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            AsignarContenedorAScope();
        }
    }

    protected void AsignarContenedorAScope()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope) Session["Scope"];
        s.Dic_Contenedor_Nombre = Contenedor;
    }


    protected void Btn_Dic_Mantenimiento_Par_Paginacion_Click(object sender, EventArgs e)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope) Session["Scope"];

        try
        {
            BO_META.DIC_MANTENIMIENTO_PAR_PAGINACION(s);

            string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ10RecursoKCG.Text").ToString();
            ((Label) Master.FindControl("LabelError")).Text = mensaje;
            ((Label) Master.FindControl("LabelError")).Visible = true;
            ((Label) Master.FindControl("LabelError")).ForeColor = bien;
        }
        catch
        {
            string mensaje = HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ14RecursoKCG.Text").ToString();
            ((Label) Master.FindControl("LabelError")).Text = mensaje;
            ((Label) Master.FindControl("LabelError")).Visible = true;
            ((Label) Master.FindControl("LabelError")).ForeColor = mal;
        }
    }

    protected override void InitializeCulture()
    {
        if (Session["lenguaje"] != null)
        {
            UICulture = (string) Session["lenguaje"];
        }
        base.InitializeCulture();
    }

    protected void OdsGv_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (OdsGv.FilterParameters.Count == 0 || OdsGv.FilterExpression.Length > 0) return;
        StringBuilder filtro = new StringBuilder();
        int count = OdsGv.FilterParameters.Count;
        for (int i = 0; i < count; i++)
        {
            if (i > 0)
                filtro.Append("AND ");
            filtro.Append(OdsGv.FilterParameters[i].DefaultValue);
        }
        OdsGv.FilterExpression = filtro.ToString();
    }

    private ObjectDataSource OdsGv
    {
        get { return odsGvMantenimiento; }
    }

    protected void KftFiltro_Buscar(object sender, EventArgs e)
    {
        StringBuilder filtradoGrid = new StringBuilder();
        foreach (Control control in kftFiltro.Controls[0].Controls)
        {
            if (control is KFiltroTexto)
            {
                string campo = ((KFiltroTexto)control).ID;
                string filtrado = ((KFiltroTexto)control).TextoDeFiltrado;

                if (!string.IsNullOrEmpty(campo) && filtrado != "%" && !string.IsNullOrEmpty(filtrado))
                {
                    StringBuilder filtradoCampo = new StringBuilder();

                    if (filtradoGrid.Length > 0)
                        filtradoGrid.Append("AND ");

                    filtradoCampo.Append(campo);
                    filtradoCampo.Append(" LIKE ");
                    filtradoCampo.Append("'");
                    filtradoCampo.Append(filtrado);
                    filtradoCampo.Append("' ");
                    filtradoGrid.Append(filtradoCampo);

                    if (VerificarExistenciaParametroFiltrado(campo + "|" + "TXT"))
                        OdsGv.FilterParameters[campo + "|" + "TXT"] =
                            new Parameter(campo + "|" + "TXT", TypeCode.Object, filtradoCampo.ToString());
                    else
                        OdsGv.FilterParameters.Add(campo + "|" + "TXT", TypeCode.Object, filtradoCampo.ToString());
                }
            }
            else if (control is KFiltroComboSeleccion)
            {
                string campo = ((KFiltroComboSeleccion)control).ID;
                string filtrado = ((KFiltroComboSeleccion)control).ItemFiltroSeleccionado.Value;

                if (!string.IsNullOrEmpty(campo) && !string.IsNullOrEmpty(filtrado))
                {
                    StringBuilder filtradoCampo = new StringBuilder();

                    if (filtradoGrid.Length > 0)
                        filtradoGrid.Append("AND ");

                    filtradoCampo.Append(campo);
                    filtradoCampo.Append(" = ");
                    filtradoCampo.Append("'");
                    filtradoCampo.Append(filtrado);
                    filtradoCampo.Append("' ");
                    filtradoGrid.Append(filtradoCampo);

                    if (VerificarExistenciaParametroFiltrado(campo + "|" + "SEC"))
                        OdsGv.FilterParameters[campo + "|" + "SEC"] =
                            new Parameter(campo + "|" + "SEC", TypeCode.Object, filtradoCampo.ToString());
                    else
                        OdsGv.FilterParameters.Add(campo + "|" + "SEC", TypeCode.Object, filtradoCampo.ToString());
                }
            }
            else if (control is KFiltroRadioSeleccion)
            {
                string campo = ((KFiltroRadioSeleccion)control).ID;
                string filtrado = ((KFiltroRadioSeleccion)control).ItemFiltroSeleccionado.Value;

                if (!string.IsNullOrEmpty(campo) && !string.IsNullOrEmpty(filtrado))
                {
                    StringBuilder filtradoCampo = new StringBuilder();

                    if (filtradoGrid.Length > 0)
                        filtradoGrid.Append("AND ");

                    filtradoCampo.Append(campo);
                    filtradoCampo.Append(" = ");
                    filtradoCampo.Append("'");
                    filtradoCampo.Append(filtrado);
                    filtradoCampo.Append("' ");
                    filtradoGrid.Append(filtradoCampo);

                    if (VerificarExistenciaParametroFiltrado(campo + "|" + "SEB"))
                        OdsGv.FilterParameters[campo + "|" + "SEB"] =
                            new Parameter(campo + "|" + "SEB", TypeCode.Object, filtradoCampo.ToString());
                    else
                        OdsGv.FilterParameters.Add(campo + "|" + "SEB", TypeCode.Object, filtradoCampo.ToString());
                }
            }
            else if (control is KFiltroRango)
            {
                string campo = ((KFiltroRango)control).ID;
                string filtradoInicio = ((KFiltroRango)control).NumeroInicio;
                string filtradoFin = ((KFiltroRango)control).NumeroFin;
                string tipoDato = ((KFiltroRango)control).TipoDato;

                if (!string.IsNullOrEmpty(campo))
                {
                    if (!string.IsNullOrEmpty(filtradoInicio))
                    {
                        StringBuilder srbfiltradoInicio = new StringBuilder();

                        if (filtradoGrid.Length > 0)
                            filtradoGrid.Append("AND ");

                        srbfiltradoInicio.Append(campo);
                        srbfiltradoInicio.Append(" >= ");

                        if (tipoDato == "CHA" || tipoDato == "VAR")
                            srbfiltradoInicio.Append("'");
                        srbfiltradoInicio.Append(filtradoInicio);
                        if (tipoDato == "CHA" || tipoDato == "VAR")
                            srbfiltradoInicio.Append("' ");
                        filtradoGrid.Append(srbfiltradoInicio);

                        if (VerificarExistenciaParametroFiltrado(campo + "|" + "RMY"))
                            OdsGv.FilterParameters[campo + "|" + "RMY"] =
                                new Parameter(campo + "|" + "RMY", TypeCode.Object, srbfiltradoInicio.ToString());
                        else
                            OdsGv.FilterParameters.Add(campo + "|" + "RMY", TypeCode.Object,
                                                       srbfiltradoInicio.ToString());
                    }

                    if (!string.IsNullOrEmpty(filtradoFin))
                    {
                        StringBuilder srbfiltradoFin = new StringBuilder();

                        if (filtradoGrid.Length > 0)
                            filtradoGrid.Append("AND ");

                        srbfiltradoFin.Append(campo);
                        srbfiltradoFin.Append(" <= ");
                        if (tipoDato == "CHA" || tipoDato == "VAR")
                            srbfiltradoFin.Append("'");
                        srbfiltradoFin.Append(filtradoFin);
                        if (tipoDato == "CHA" || tipoDato == "VAR")
                            srbfiltradoFin.Append("' ");
                        filtradoGrid.Append(srbfiltradoFin);

                        if (VerificarExistenciaParametroFiltrado(campo + "|" + "RMN"))
                            OdsGv.FilterParameters[campo + "|" + "RMN"] =
                                new Parameter(campo + "|" + "RMN", TypeCode.Object, srbfiltradoFin.ToString());
                        else
                            OdsGv.FilterParameters.Add(campo + "|" + "RMN", TypeCode.Object, srbfiltradoFin.ToString());
                    }
                }
            }
            else if (control is KFiltroRangoFecha)
            {
                string campo = ((KFiltroRangoFecha)control).ID;
                string filtradoInicio = ((KFiltroRangoFecha)control).FechaInicio;
                string filtradoFin = ((KFiltroRangoFecha)control).FechaFin;

                if (!string.IsNullOrEmpty(campo))
                {
                    if (!string.IsNullOrEmpty(filtradoInicio))
                    {
                        StringBuilder srbfiltradoInicio = new StringBuilder();

                        if (filtradoGrid.Length > 0)
                            filtradoGrid.Append("AND ");

                        srbfiltradoInicio.Append(campo);
                        srbfiltradoInicio.Append(" >= ");
                        srbfiltradoInicio.Append("'");
                        srbfiltradoInicio.Append(filtradoInicio);
                        srbfiltradoInicio.Append(" 00:00:00");
                        srbfiltradoInicio.Append("' ");
                        filtradoGrid.Append(srbfiltradoInicio);

                        if (VerificarExistenciaParametroFiltrado(campo + "|" + "FMY"))
                            OdsGv.FilterParameters[campo + "|" + "FMY"] =
                                new Parameter(campo + "|" + "FMY", TypeCode.Object, srbfiltradoInicio.ToString());
                        else
                            OdsGv.FilterParameters.Add(campo + "|" + "FMY", TypeCode.Object,
                                                       srbfiltradoInicio.ToString());
                    }

                    if (!string.IsNullOrEmpty(filtradoFin))
                    {
                        StringBuilder srbfiltradoFin = new StringBuilder();

                        if (filtradoGrid.Length > 0)
                            filtradoGrid.Append("AND ");

                        srbfiltradoFin.Append(campo);
                        srbfiltradoFin.Append(" <= ");
                        srbfiltradoFin.Append("'");
                        srbfiltradoFin.Append(filtradoFin);
                        srbfiltradoFin.Append(" 23:59:59");
                        srbfiltradoFin.Append("' ");
                        filtradoGrid.Append(srbfiltradoFin);

                        if (VerificarExistenciaParametroFiltrado(campo + "|" + "FMN"))
                            OdsGv.FilterParameters[campo + "|" + "FMN"] =
                                new Parameter(campo + "|" + "FMN", TypeCode.Object, srbfiltradoFin.ToString());
                        else
                            OdsGv.FilterParameters.Add(campo + "|" + "FMN", TypeCode.Object, srbfiltradoFin.ToString());
                    }
                }
            }
        }

        OdsGv.FilterExpression = filtradoGrid.ToString();
        if (string.IsNullOrEmpty(OdsGv.FilterExpression))
            OdsGv.FilterParameters.Clear();
    }

    protected bool VerificarExistenciaParametroFiltrado(string nombreParametro)
    {
        if (OdsGv.FilterParameters.Count == 0)
            return false;
        for (int i = 0; i < OdsGv.FilterParameters.Count; i++)
        {
            if (OdsGv.FilterParameters[i].Name == nombreParametro)
                return true;
        }
        return false;
    }
}