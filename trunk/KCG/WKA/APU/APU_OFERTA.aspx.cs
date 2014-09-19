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
using FEL.APU;
using System.Collections.Generic;
using System.Globalization;
using System.Web.Services;
using FEL.INT;
using System.Xml;
using System.Web.Services.Protocols;

public partial class APU_APU_OFERTA : PaginaBaseFormView 
{
    public bool zoom = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (fvApuOferta.CurrentMode == FormViewMode.ReadOnly)
            //{
            //    Estado.Enabled = true;
            //    Estado.EstadoActualNombre = fvApuOferta.DataKey["Estado"].ToString();
            //    Estado.EstadoActualID = fvApuOferta.DataKey["Id"].ToString();
            //}

            try
            {
                Auxiliar.Text = Session["sNombre"].ToString();
            }
            catch
            {
            }

            string Apu_Oferta_Id = Request.QueryString.Get("Apu_Oferta_Id");
            if (!string.IsNullOrEmpty(Apu_Oferta_Id))
            {
                Fv.DefaultMode = FormViewMode.ReadOnly;
                AsignarParametrosDataSourceDeatailsView(Apu_Oferta_Id);
                SeleccionarItemEnCarga(Apu_Oferta_Id);
            }

        }
        
        //string Apu_Oferta_Id = Request.QueryString.Get("Apu_Oferta_Id");
        //if (Apu_Oferta_Id != null)
        //    Fv.DefaultMode = FormViewMode.ReadOnly;
        cargarEtiquetas();
        Fv.DataBound += new EventHandler(Fv_DataBoundApuOferta);
        fvApuOferta.ItemCommand += new FormViewCommandEventHandler(fvApuOferta_ItemCommand);
        fvApuOferta.DataBound += new EventHandler(fvApuOferta_DataBound);
        osdfvApuOferta.Updated += new ObjectDataSourceStatusEventHandler(osdfvApuOferta_Updated);
        if (Zoom.ContieneRequerimientoOrigen(AppRelativeVirtualPath + Request.Url.Query))
        {
            zoom = true;
        }
    }

    void osdfvApuOferta_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        Auxiliar.Text = "";
        Session.Remove("sNombre");
    }

    void fvApuOferta_DataBound(object sender, EventArgs e)
    {        
        if (fvApuOferta.CurrentMode == FormViewMode.Insert)
        {
            Btn_Apu_Oferta_Formula_Poli.Enabled = false;
            Btn_Apu_Oferta_Cuadrilla.Enabled = false;
            Estado.Enabled = false;
            Btn_Apu_Oferta_Categoria.Enabled = false;
            Btn_Apu_Mano_Obra.Enabled = false;
            Btn_Apu_Oferta_Rubro.Enabled = false;
            TextBox Int_Moneda_Simbolo = (TextBox)fvApuOferta.FindControl("Int_Moneda_Simbolo");
            TextBox Tecnico_Per_Personal_Nombre = (TextBox)fvApuOferta.FindControl("Tecnico_Per_Personal_Nombre");
            if (Tecnico_Per_Personal_Nombre.Text == "")
            {
                Tecnico_Per_Personal_Nombre.Text = Int_Moneda_Simbolo.Text;
                Int_Moneda_Simbolo.Text = "";
                Int_Moneda_Simbolo.Visible = false;
            }
            TextBox Tipo_Contrato = (TextBox)fvApuOferta.FindControl("Tipo_Contrato");
            DropDownList ddl_Tipo_Contrato = (DropDownList)fvApuOferta.FindControl("ddl_Tipo_Contrato");
            if (Tipo_Contrato.Text == string.Empty)
                Tipo_Contrato.Text = ddl_Tipo_Contrato.SelectedValue;
            else
                ddl_Tipo_Contrato.SelectedValue = Tipo_Contrato.Text;
        }
        else
        {
            Estado.Enabled = true;
            Estado.EstadoActualNombre = fvApuOferta.DataKey["Estado"].ToString();
            Estado.EstadoActualID = fvApuOferta.DataKey["Id"].ToString();
            Btn_Apu_Oferta_Formula_Poli.Enabled = true;
            Btn_Apu_Oferta_Cuadrilla.Enabled = true;
            Btn_Apu_Oferta_Categoria.Enabled = true;
            Btn_Apu_Mano_Obra.Enabled = true;
            Btn_Apu_Oferta_Rubro.Enabled = true;

            if (fvApuOferta.CurrentMode == FormViewMode.Edit)
            {
                if (zoom && Auxiliar.Text == "1")
                {
                    TextBox Int_Moneda_Simbolo = (TextBox)fvApuOferta.FindControl("Int_Moneda_Simbolo");
                    TextBox Tecnico_Per_Personal_Nombre = (TextBox)fvApuOferta.FindControl("Tecnico_Per_Personal_Nombre");
                    Tecnico_Per_Personal_Nombre.Text = Int_Moneda_Simbolo.Text;
                    Int_Moneda_Simbolo.Text = "";
                    Int_Moneda_Simbolo.Visible = false;
                    TextBox Tecnico_Per_Personal_Id = (TextBox)fvApuOferta.FindControl("Tecnico_Per_Personal_Id");
                    TextBox Coeficiente_Sumatoria = (TextBox)fvApuOferta.FindControl("Coeficiente_Sumatoria");
                    Tecnico_Per_Personal_Id.Text = Coeficiente_Sumatoria.Text;
                }
            }
        }
    }

    bool validado = false;
    bool resultadoValidacion = false;

    protected void ctvCodigo_Institucion_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (!validado)
        {
            string msj = Auxiliar_Codigo.Text;
            TextBox CodigoInstitucion = (TextBox)fvApuOferta.FindControl("Codigo_Institucion");
            string mensaje = "";                
            if (Auxiliar_Codigo.Text == CodigoInstitucion.Text)
            {
                resultadoValidacion = true;
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
            }
            else
            {
                resultadoValidacion = false;
                string codigoError = string.Empty;  
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ38RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, mal);
                _asignarDatosPredeterminados = true;
            }
            validado = true;
        }
        args.IsValid = resultadoValidacion;
    }

    private bool _asignarDatosPredeterminados = false;

    void fvApuOferta_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            _asignarDatosPredeterminados = true;
    }

    private void cargarEtiquetas()
    {        
        Btn_Apu_Oferta_Rubro.Text = GetLocalResourceObject("Btn_Apu_Oferta_RubroRecursoKCG.Text").ToString();
        Btn_Apu_Oferta_Rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_RubroRecursoKCG.ToolTip").ToString();
        Btn_Apu_Listado_Oferta.Text = GetLocalResourceObject("Btn_Apu_Oferta_ListadoRecursoKCG.Text").ToString();
        Btn_Apu_Listado_Oferta.ToolTip = GetLocalResourceObject("Btn_Apu_Oferta_ListadoRecursoKCG.ToolTip").ToString();
    }

    void Fv_DataBoundApuOferta(object sender, EventArgs e)
    {
        if (!IsPostBack || _asignarDatosPredeterminados)
            AsignarDatosPredeterminados();        
        //deshabilitarEnEtapaConcluido();        
    }

    [WebMethod]
    static public string[] Get_Codigo_Institucion(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.INT.BO_Int_Subproyecto intSubproyecto = new BO_Int_Subproyecto();
        List<Int_Subproyecto> lstSubproyecto = intSubproyecto.GetByLikeCodigoInstitucional("", s, prefixText + "%");

        List<string> opciones = new List<string>();
        for (int i = 0; i < lstSubproyecto.Count && i < count; i++)
        {
            string value = lstSubproyecto[i].Codigo_Institucional;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(lstSubproyecto[i].Codigo_Institucional, value));
        }
        return opciones.ToArray();
    }

    protected void Tipo_Contrato_DataBound(object sender, EventArgs e)
    {
        DropDownList ddl_Tipo_Contrato = (DropDownList)sender;

        ddl_Tipo_Contrato.Attributes.Add("onchange", "checkSelectedValue_Tipo_Contrato()");

        TextBox Tipo_Contrato = (TextBox)fvApuOferta.FindControl("Tipo_Contrato");
        ddl_Tipo_Contrato.SelectedValue = Tipo_Contrato.Text;
        //string asd = ddl_Tipo_Contrato.SelectedItem.Text;

        if (fvApuOferta.CurrentMode == FormViewMode.Insert)
            ddl_Tipo_Contrato.SelectedValue = "PRI";
    }

    //private void deshabilitarEnEtapaConcluido()
    //{
    //    string strEstado = ((TextBox)Fv.FindControl("Estado")).Text;
    //    if (strEstado == "CON" || strEstado == "DEF")
    //    {
    //        DeshabilitarControl("EditButton");            
    //        DeshabilitarControl("DeleteButton");          
    //    }
    //}    

    protected void Btn_Per_Personal_Click(object sender, EventArgs e)
    {
        Auxiliar.Text = "1";
        Button _ValorZomm_Estado = (Button)sender;
        string Argumentos_ = _ValorZomm_Estado.CommandArgument;
        Argumentos_ = Argumentos_.Replace("~/PER/PER_PERSONAL.aspx", "~/PER/PER_PERSONAL.aspx?valorCheck=" + Auxiliar.Text);
        _ValorZomm_Estado.CommandArgument = Argumentos_;
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button)control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }
    }

    private void AsignarDatosPredeterminados()
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];

            TextBox txbProvinciaNombre = (TextBox)Fv.FindControl("Apu_Provincia_Nombre");
            TextBox txbProvinciaId = (TextBox)Fv.FindControl("Apu_provincia_id");
            if (txbProvinciaNombre.Text == "" && txbProvinciaId.Text == "")
            {
                BO_Apu_Provincia boApuProvincia = new BO_Apu_Provincia();
                List<Apu_Provincia> provinciaDeterminada = new List<Apu_Provincia>(1);
                try
                {
                    provinciaDeterminada = boApuProvincia.GetByPredeterminadaS("", s);
                }
                catch
                {
                }

                if (provinciaDeterminada.Count == 1)
                {
                    txbProvinciaNombre.Text = provinciaDeterminada[0].Nombre;
                    txbProvinciaId.Text = provinciaDeterminada[0].Id;
                }

            }

            TextBox txbLugarNombre = (TextBox)Fv.FindControl("Apu_Lugar_Nombre");
            TextBox txbLugarId = (TextBox)Fv.FindControl("Apu_Lugar_id");
            if (txbLugarNombre.Text == "" && txbLugarId.Text == "")
            {
                BO_Apu_Lugar boApuLugar = new BO_Apu_Lugar();
                List<Apu_Lugar> lugarPredeterminado = new List<Apu_Lugar>(1);

                try
                {
                    lugarPredeterminado = boApuLugar.GetByPredeterminadaS("", s);
                }
                catch
                {
                }

                if (lugarPredeterminado.Count == 1)
                {
                    txbLugarNombre.Text = lugarPredeterminado[0].Nombre;
                    txbLugarId.Text = lugarPredeterminado[0].Id;
                }
            }

            TextBox txbTecnicoNombre = (TextBox)Fv.FindControl("Tecnico_Per_Personal_Nombre");
            TextBox txbTecnicoId = (TextBox)Fv.FindControl("Tecnico_Per_Personal_Id");

            if (txbTecnicoId.Text == "" && txbTecnicoNombre.Text == "")
            {
                txbTecnicoNombre.Text = s.Per_Personal_Nombre;
                txbTecnicoId.Text = s.Per_Personal_Id;
            }

            TextBox txbArea = (TextBox)Fv.FindControl("Area");
            if (txbArea.Text == "")
            {
                txbArea.Text = 1.ToString("N2", NumberFormatInfo.CurrentInfo);
            }

            TextBox txbPorsentajeCostosOtros = (TextBox)Fv.FindControl("Porcentaje_Costo_Otros");
            if (txbPorsentajeCostosOtros.Text == "")
            {
                txbPorsentajeCostosOtros.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
            }

            TextBox txbPorcentajeCostoIndirecto = (TextBox)Fv.FindControl("Porcentaje_Costo_Indirecto");
            if (txbPorcentajeCostoIndirecto.Text == "")
            {
                txbPorcentajeCostoIndirecto.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
            }
        }
    }
    
    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Oferta); }
    }

    protected override FormView Fv
    {
        get { return fvApuOferta; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return osdfvApuOferta; }    
    }

    protected override string Contenedor
    {
        get { return "APU_OFERTA"; }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Oferta_Id", Request.QueryString["Apu_Oferta_Id"]));            
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
    protected void Btn_Apu_Oferta_Rubro_Click(object sender, EventArgs e)
    {
        TextBox OfertaId = (TextBox)Fv.FindControl("Id");
        TextBox OfertaCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox OfertaNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox OfertaEtapa = (TextBox)Fv.FindControl("Etapa");
        TextBox estado = (TextBox)fvApuOferta.FindControl("Estado");
        TextBox presupuestoEstado = (TextBox)fvApuOferta.FindControl("Apu_Presupuesto_Estado");
        Response.Redirect("~/APU/APU_OFERTA_RUBRO.aspx?Apu_Oferta_Id=" + OfertaId.Text +           
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }    

    protected override void AsignarParametrosDataSourceDeatailsView(string id)
    {        
        OdsDv.SelectParameters["Apu_Oferta_Id"].DefaultValue = id;
    }
    protected void Btn_Apu_Listado_Oferta_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv.FindControl("Id");
        string strId = Id.Text;
        Response.Redirect("~/APU/APU_LISTADO_OFERTA.aspx?Apu_Oferta_Id=" + strId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }    

    protected void Btn_Apu_Oferta_Categoria_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv.FindControl("Id");
        string strId = Id.Text;
        Response.Redirect("~/APU/APU_OFERTA_CATEGORIA.aspx?apu_oferta_Id=" + strId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Oferta_Formula_Poli_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv.FindControl("Id");
        string strId = Id.Text;
        TextBox estado = (TextBox)fvApuOferta.FindControl("Estado");
        TextBox presupuestoEstado = (TextBox)fvApuOferta.FindControl("Apu_Presupuesto_Estado");
        Response.Redirect("~/APU/APU_OFERTA_INDICE.aspx?Apu_Oferta_Id=" + strId + 
            "&Estado=" + estado.Text +
            "&Apu_Presupuesto_Estado=" + presupuestoEstado.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Oferta_Cuadrilla_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv.FindControl("Id");
        string strId = Id.Text;
        Response.Redirect("~/APU/APU_OFERTA_CUADRILLA.aspx?Apu_Oferta_Id=" + strId + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void Btn_Apu_Mano_Obra_Click(object sender, EventArgs e)
    {
        TextBox Id = (TextBox)Fv.FindControl("Id");       
        TextBox OfertaCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox OfertaNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox OfertaEpata = (TextBox)Fv.FindControl("Etapa");
        Response.Redirect("~/APU/APU_OFERTA_MANO_OBRA.aspx?Apu_Oferta_Id=" + Id.Text + 
            "&Apu_Oferta_Codigo=" + OfertaCodigo.Text + 
            "&Apu_Oferta_Nombre=" + OfertaNombre.Text +
            "&Apu_Oferta_Etapa=" + OfertaEpata.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }       
}
