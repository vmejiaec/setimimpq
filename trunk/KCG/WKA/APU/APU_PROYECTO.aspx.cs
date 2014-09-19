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
using Koala.KoalaWebControls;
using System.Collections.Generic;
using System.IO;
using System.Drawing;
using System.Web.Services.Protocols;
using System.Globalization;
using System.Text;
using System.Threading;
using FEL.APU;
using System.Xml;
using System.Web.Services;
using FEL.INT;

public partial class APU_APU_PROYECTO : PaginaBaseFormView
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {            
            string Apu_Rubro_Id = Request.QueryString.Get("Apu_Proyecto_Id");
            if (!string.IsNullOrEmpty(Apu_Rubro_Id))
            {
                //txtApu_Proyecto_Id.Text = Apu_Rubro_Id;
                Fv.DefaultMode = FormViewMode.ReadOnly;
                AsignarParametrosDataSourceDeatailsView(Apu_Rubro_Id);
                SeleccionarItemEnCarga(Apu_Rubro_Id);
            }
            btn_Transpasar.Enabled = false;
        }        
               
        fvApuProyecto.ItemCommand += new FormViewCommandEventHandler(fvApuProyecto_ItemCommand);
        fvApuProyecto.DataBound += new EventHandler(fvApuProyecto_DataBound);              
    }

    void fvApuProyecto_DataBound(object sender, EventArgs e)
    {
        if (!IsPostBack || _asignarDatosPredeterminados)
            AsignarDatosPredeterminados();
        DeshabilitraBotonesEnInsert();
        //AsignarUrlDestinoBotones();
        DeshabilitarEnEtapaConcluido();
        DeshabilitarEnEtapaDefinitivo();

        TextBox estado = (TextBox)fvApuProyecto.FindControl("Estado");
        TextBox presupuestoEstado = (TextBox)fvApuProyecto.FindControl("Apu_Presupuesto_Estado");
        if (estado.Text == "BOR" || presupuestoEstado.Text == "PEN")
            btn_Actualizar_Costos.Enabled = true;
        else
            btn_Actualizar_Costos.Enabled = false;

        if (fvApuProyecto.CurrentMode == FormViewMode.Insert)
        {
            TextBox Tipo_Contrato = (TextBox)fvApuProyecto.FindControl("Tipo_Contrato");
            DropDownList ddl_Tipo_Contrato = (DropDownList)fvApuProyecto.FindControl("ddl_Tipo_Contrato");
            if (Tipo_Contrato.Text == string.Empty)
                Tipo_Contrato.Text = ddl_Tipo_Contrato.SelectedValue;
            else
                ddl_Tipo_Contrato.SelectedValue = Tipo_Contrato.Text;

            TextBox Codigo = (TextBox)fvApuProyecto.FindControl("Codigo");
            Codigo.Text = string.Empty;
            Auxiliar_Codigo.Text = "";
            Estado.Enabled = false;
            btn_Formula_Polinomica.Enabled = false;
            btn_Cuadrilla.Enabled = false;
        }
        else
        {            
            Estado.EstadoActualNombre = fvApuProyecto.DataKey["Estado"].ToString();
            Estado.EstadoActualID = fvApuProyecto.DataKey["Id"].ToString();
            btn_Formula_Polinomica.Enabled = true;
            btn_Cuadrilla.Enabled = true;
        }
        if (fvApuProyecto.CurrentMode == FormViewMode.Edit)
        {
            TextBox CodigoInstitucion = (TextBox)fvApuProyecto.FindControl("Codigo_Institucion");
            Auxiliar_Codigo.Text = CodigoInstitucion.Text;
        }
    }

    bool validado = false;
    bool resultadoValidacion = false;
    protected void ctvCodigo_Institucion_ServerValidate(object source, ServerValidateEventArgs args)
    {        
        if (!validado)
        {
            TextBox CodigoInstitucion = (TextBox)fvApuProyecto.FindControl("Codigo_Institucion");
            
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

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto); }
    }

    protected override FormView Fv
    {
        get { return fvApuProyecto; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsApuProyecto; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO"; }
    }

    private bool _asignarDatosPredeterminados = false;

    void fvApuProyecto_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            _asignarDatosPredeterminados = true;
    }

    //void Fv_DataBoundApuProyecto(object sender, EventArgs e)
    //{
    //    if (!IsPostBack || _asignarDatosPredeterminados)
    //        AsignarDatosPredeterminados();
    //    DeshabilitraBotonesEnInsert();
    //    //AsignarUrlDestinoBotones();
    //    //DeshabilitarEnEtapaConcluido();
    //    //DeshabilitarEnEtapaDefinitivo();
    //}

    private void AsignarUrlDestinoBotones()
    {
        if (Fv.CurrentMode == FormViewMode.Insert) return;
        {
            string[] ids = { "Id", "Codigo", "Nombre", "Estado" };
            string[] parametros = { "Apu_Proyecto_Id", "Apu_Proyecto_Codigo", "Apu_Proyecto_Nombre", "Estado"};
            string[] parametrosValor = ObtenerParametros(ids);    
            
            ////APU_PROYECTO_RUBRO
            //AsignarDireccionDestino("RubrosButton", "~/APU/APU_PROYECTO_RUBRO.aspx",
            //                        parametros, parametrosValor);
            //APU_PROYECTO_EQUIPO
            //AsignarDireccionDestino("EquiposButton", "~/APU/APU_PROYECTO_EQUIPO.aspx",
            //                        parametros, parametrosValor);

            //APU_PROYECTO_MANO_OBRA
            //AsignarDireccionDestino("ManoObraButton", "~/APU/APU_PROYECTO_MANO_OBRA.aspx",
            //                        parametros, parametrosValor);

            //APU_PROYECTO_MATERIAL
            //AsignarDireccionDestino("MaterialTransporteButton", "~/APU/APU_PROYECTO_MATERIAL.aspx",
            //                        parametros, parametrosValor);

            ////APU_PROYECTO_ETAPA
            //AsignarDireccionDestino("EstadoButton", "~/APU/APU_PROYECTO_ETAPA.aspx",
            //                        parametros, parametrosValor);
        }
    }

    private void AsignarDireccionDestino(string IdBoton, string direccionDestino,
        string[] parametro, string [] valorParametro)
    {
        Button boton = (Button)Fv.FindControl(IdBoton);
        StringBuilder stbDireccionCompleta = new StringBuilder();
        stbDireccionCompleta.Append(direccionDestino);
        if(parametro != null && valorParametro != null)
        {
            if(parametro.Length != 0 &&  parametro.Length == valorParametro.Length)
            {
                stbDireccionCompleta.Append('?');
                for(int i = 0; i < parametro.Length; i++)
                {
                    stbDireccionCompleta.Append(parametro[i]);
                    stbDireccionCompleta.Append('=');
                    stbDireccionCompleta.Append(valorParametro[i]);
                    if (i + 1 < parametro.Length)
                        stbDireccionCompleta.Append('&');
                }
            }
        }
        boton.PostBackUrl = stbDireccionCompleta.ToString();
    }

    private string[] ObtenerParametros(string[] ids)
    {
        string[] parametros = new string[ids.Length];
        for (int i = 0; i < ids.Length; i++ )
        {
            parametros[i] = ((TextBox) Fv.FindControl(ids[i])).Text;
        }
        return parametros;
    }

    private void DeshabilitarEnEtapaConcluido()
    {
        string strEtapa = ((TextBox)Fv.FindControl("Etapa")).Text;
        if (strEtapa == "CON" && Fv.CurrentMode == FormViewMode.ReadOnly)
        {
            DeshabilitarControl("EditButton");
            DeshabilitarControl("DeleteButton");
            //DeshabilitarControl("RubrosButton");
            //DeshabilitarControl("EstadoButton");
            //DeshabilitarControl("EquiposButton");
            //DeshabilitarControl("ManoObraButton");
            //DeshabilitarControl("MaterialTransporteButton");
        }
    }

    private void DeshabilitarEnEtapaDefinitivo()
    {
        string strEtapa = ((TextBox)Fv.FindControl("Etapa")).Text;
        if (strEtapa == "DEF" && Fv.CurrentMode == FormViewMode.ReadOnly)
        {
            DeshabilitarControl("DeleteButton");
        }
    }

    private void DeshabilitraBotonesEnInsert()
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
        {
            DeshabilitarControl("RubrosButton");
            //DeshabilitarControl("EstadoButton");
            DeshabilitarControl("EquiposButton");
            DeshabilitarControl("ManoObraButton");
            DeshabilitarControl("MaterialTransporteButton");
            DeshabilitarControl("btn_Categorias");
        }
    }

    private void DeshabilitarControl(string idControl)
    {
        Control control = Fv.FindControl(idControl);
        if (control is Button)
        {
            ((Button) control).Enabled = false;
        }
        else if (control is Panel)
        {
            ((Panel)control).Enabled = false;
        }        
    }

    protected void CopyButton_Click(object sender, EventArgs e)
    {
        CopiarValoresDeControles_Insert(fvApuProyecto, TipoObjeto);
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

                    if(provinciaDeterminada.Count == 1)
                    {
                        txbProvinciaNombre.Text = provinciaDeterminada[0].Nombre;
                        txbProvinciaId.Text = provinciaDeterminada[0].Id;
                    }

                }

                TextBox txbLugarNombre = (TextBox)Fv.FindControl("Apu_Lugar_Nombre");
                TextBox txbLugarId = (TextBox)Fv.FindControl("Apu_Lugar_id");
                if(txbLugarNombre.Text == "" && txbLugarId.Text == "")
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

                    if(lugarPredeterminado.Count == 1)
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
                    txbArea.Text = 1.ToString("N4", NumberFormatInfo.CurrentInfo);
                }

                TextBox txbPorsentajeCostosOtros = (TextBox)Fv.FindControl("Porcentaje_Costo_Otros");
                if(txbPorsentajeCostosOtros.Text == "" )
                {
                    txbPorsentajeCostosOtros.Text = 0.ToString("N2", NumberFormatInfo.CurrentInfo);
                }

                TextBox txbPorcentajeCostoIndirecto = (TextBox)Fv.FindControl("Porcentaje_Costo_Indirecto");
                if(txbPorcentajeCostoIndirecto.Text == "" )
                {
                    BO_Apu_Parametros boApuParametros = new BO_Apu_Parametros();
                    List <Apu_Parametros> parametros = new List<Apu_Parametros>(1);

                    try
                    {
                        parametros = boApuParametros.GetBySucursal("", s);
                    }
                    catch
                    {
                        txbPorcentajeCostoIndirecto.Text= 0.ToString("N2", NumberFormatInfo.CurrentInfo);
                    }
                
                    if (parametros.Count == 1)
                    {
                        txbPorcentajeCostoIndirecto.Text = parametros[0].Porcentaje_Costo_Indirecto.ToString("N2", NumberFormatInfo.CurrentInfo);
                    }                    
                }
            }
        
    }
    protected void btn_Apu_proyecto_listado_proyecto_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Id");
       // Response.Redirect("~/APU/APU_LISTADO_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text);
        Response.Redirect("~/APU/APU_LISTADO_PROYECTO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void RubrosButton_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)Fv.FindControl("Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Nombre");
        TextBox Estado = (TextBox)fvApuProyecto.FindControl("Estado");
        TextBox PresupuestoEstado = (TextBox)fvApuProyecto.FindControl("Apu_Presupuesto_Estado");
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Estado=" + Estado.Text + "&Apu_Presupuesto_Estado=" + PresupuestoEstado.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_Categorias_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        TextBox ProyectoCodigo = (TextBox)fvApuProyecto.FindControl("Codigo");
        TextBox ProyectoNombre = (TextBox)fvApuProyecto.FindControl("Nombre");
        Response.Redirect("~/APU/APU_PROYECTO_CATEGORIA.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    
    protected void btn_EquiposButton_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        TextBox ProyectoCodigo = (TextBox)fvApuProyecto.FindControl("Codigo");
        TextBox ProyectoNombre = (TextBox)fvApuProyecto.FindControl("Nombre");
        TextBox ProyectoEstado = (TextBox)fvApuProyecto.FindControl("Estado");
        Response.Redirect("~/APU/APU_PROYECTO_EQUIPO.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Estado=" + ProyectoEstado.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_ManoObraButton_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        TextBox ProyectoCodigo = (TextBox)fvApuProyecto.FindControl("Codigo");
        TextBox ProyectoNombre = (TextBox)fvApuProyecto.FindControl("Nombre");
        TextBox ProyectoEstado = (TextBox)fvApuProyecto.FindControl("Estado");
        Response.Redirect("~/APU/APU_PROYECTO_MANO_OBRA.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Estado=" + ProyectoEstado.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_MaterialTransporteButton_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        TextBox ProyectoCodigo = (TextBox)fvApuProyecto.FindControl("Codigo");
        TextBox ProyectoNombre = (TextBox)fvApuProyecto.FindControl("Nombre");
        TextBox ProyectoEstado = (TextBox)fvApuProyecto.FindControl("Estado");
        Response.Redirect("~/APU/APU_PROYECTO_MATERIAL.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Estado=" + ProyectoEstado.Text + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_Formula_Polinomica_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        TextBox Estado_ = (TextBox)fvApuProyecto.FindControl("Estado");
        TextBox PresupuestoEstado = (TextBox)fvApuProyecto.FindControl("Apu_Presupuesto_Estado");
        Response.Redirect("~/APU/APU_PROYECTO_INDICE.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + 
            "&Estado=" + Estado_.Text + 
            "&Apu_Presupuesto_Estado=" + PresupuestoEstado.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_Cuadrilla_Click(object sender, EventArgs e)
    {
        TextBox ProyectoId = (TextBox)fvApuProyecto.FindControl("Id");
        Response.Redirect("~/APU/APU_PROYECTO_CUADRILLA.aspx?Apu_Proyecto_Id=" + ProyectoId.Text + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_Actualizar_Costos_Click(object sender, EventArgs e)
    {
        try
        {
            bool respu = false;
            string mensaje = "";
            TextBox Id = (TextBox)fvApuProyecto.FindControl("Id");
            FEL.APU.BO_Apu_Proyecto datos = new BO_Apu_Proyecto();
            List<Apu_Proyecto> identificador = datos.GetById("", (Scope)Session["Scope"], Id.Text);
            if (identificador.Count > 0)
                respu = datos.Update_Costo((Scope)Session["Scope"], identificador[0]);
            if (respu)
            {
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
            }
        }
        catch (Exception ex)
        {
            SoapException ed = (SoapException)ex;
            string mensaje = ObtenerMensajeError(ed.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
        }
    }

    protected string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        string MensajeError = "MSJ14";
        if (detalleMensajeError != null)
        {
            CodigoError = detalleMensajeError.Attributes["CodigoError"].Value;
            MensajeError = detalleMensajeError["CodigoMensaje"].InnerText;
        }
        string pre_mensaje =
            HttpContext.
                GetLocalResourceObject("~/KOALA.master",
                                       CodigoError + "RecursoKCG.Text").ToString();
        pre_mensaje = string.Format(pre_mensaje, MensajeError.Split('|'));
        return pre_mensaje;
    }

    [WebMethod]
    static public string[] Get_txtTras(string prefixText, int count)
    {
        if (count == 0) count = 10;

        Scope s = (Scope)HttpContext.Current.Session["Scope"];

        FEL.APU.BO_Apu_Oferta boApuOferta = new BO_Apu_Oferta();
        List<Apu_Oferta> litApuOferta = boApuOferta.GetByEstado("Codigo", s, prefixText + "%","BOR");

        List<string> opciones = new List<string>();
        for (int i = 0; i < litApuOferta.Count && i < count; i++)
        {
            string value = litApuOferta[i].Id + "||" +
                           litApuOferta[i].Codigo;

            opciones.Add(AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(litApuOferta[i].Codigo, value));
        }        
        return opciones.ToArray();
    }

    protected void btn_Transpasar_Click(object sender, EventArgs e)
    {
        try
        {
            bool respu = false;
            string mensaje = "";
            TextBox Id = (TextBox)fvApuProyecto.FindControl("Id");
            FEL.APU.BO_Apu_Proyecto datos = new BO_Apu_Proyecto();
            List<Apu_Proyecto> identificador = datos.GetById("", (Scope)Session["Scope"], Id.Text);
            if (identificador.Count > 0)
                respu = datos.Transferir_Oferta((Scope)Session["Scope"], identificador[0], txt_Tras_Id.Text);
            if (respu)
            {
                mensaje = HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ10RecursoKCG.Text").ToString();
                AsignarMensaje(mensaje, bien);
                txt_Traspasar.Text = "";
            }
        }
        catch (Exception ex)
        {
            SoapException ed = (SoapException)ex;
            string mensaje = ObtenerMensajeError(ed.Detail["DetalleError"]);
            AsignarMensaje(mensaje, mal);
        }
    }

    protected void TipoContrato_DataBound(object sender, EventArgs e)
    {
        DropDownList ddlTipo_Contrato = (DropDownList)sender;

        ddlTipo_Contrato.Attributes.Add("onchange", "checkSelectedValueTipoC()");

        TextBox Tipo_Contrato = (TextBox)fvApuProyecto.FindControl("Tipo_Contrato");
        ddlTipo_Contrato.SelectedValue = Tipo_Contrato.Text;

        if (Fv.CurrentMode == FormViewMode.Insert)
            ddlTipo_Contrato.SelectedValue = "PRI";
    }

}
