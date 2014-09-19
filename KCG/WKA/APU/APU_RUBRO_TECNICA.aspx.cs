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
using System.Collections.Generic;
using System.IO;

public partial class APU_APU_RUBRO_TECNICA : PaginaBaseFormView
{
    private FileUpload _fulOrigenImagen;
    private string _pathBorrar = string.Empty;
    private bool _guardarFichero = false;
    private string _idRubroTecnicaImagen = string.Empty;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        OdsDv.Updating += new ObjectDataSourceMethodEventHandler(OdsDv_ApuRubroTecnicaUpdating);
        Fv.ItemUpdated += new FormViewUpdatedEventHandler(Fv_UpdatedApuRubroTecnicaUpdated);
        Fv.DataBound += new EventHandler(Fv_DataBoundApuRubroTecnica);    
    }

    private void EtiquetarBotones()
    {
        Rec_Apu_Rubro_Tecnica_Documento.Text = GetLocalResourceObject("Btn_Apu_Rubro_Tecnica_DocumentoRecursoKCG.Text").ToString();
        Rec_Apu_Rubro_Tecnica_Documento.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Tecnica_DocumentoRecursoKCG.ToolTip").ToString();
        btn_Apu_rubro_tecnica_rubro.Text = GetLocalResourceObject("Btn_Apu_Rubro_Tecnica_RubroRecursoKCG.Text").ToString();
        btn_Apu_rubro_tecnica_rubro.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Tecnica_RubroRecursoKCG.ToolTip").ToString();
    }        

    void Fv_DataBoundApuRubroTecnica(object sender, EventArgs e)
    {
        if (_guardarFichero && Fv.CurrentMode == FormViewMode.ReadOnly)
        {
            string strServerPath = ((TextBox)Fv.FindControl("Path_Imagen")).Text;
            string nombreFichero = _idRubroTecnicaImagen + _fulOrigenImagen.FileName.ToUpper();
            strServerPath = strServerPath.Replace(nombreFichero, "");
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath(strServerPath));
            string path = serverPath.FullName + nombreFichero;
            _fulOrigenImagen.SaveAs(path);
        }
    }

    void Fv_UpdatedApuRubroTecnicaUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null && _fulOrigenImagen.HasFile)
        {
            BorrarArchivo(_pathBorrar);

            if (_fulOrigenImagen.HasFile)
            {
                _guardarFichero = true;
                _idRubroTecnicaImagen = e.NewValues["Id"].ToString();
            }
        }
    }

    void BorrarArchivo(string path)
    {        
        if (string.IsNullOrEmpty(path)) return;

        try
        {
            File.Delete(Server.MapPath(path));
        }
        catch
        { } 
    }

    void OdsDv_ApuRubroTecnicaUpdating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        _fulOrigenImagen = (FileUpload)Fv.FindControl("fupApuRubroTecnica");

        string origenImagen = null;
        string imagen = null;

        if (_fulOrigenImagen.HasFile)
        {
            origenImagen = _fulOrigenImagen.PostedFile.FileName;
            imagen = _fulOrigenImagen.FileName;
        }

        parametros[BuscarParametro(parametros, "Origen_Imagen")] =
            new DictionaryEntry("Origen_Imagen", origenImagen);
        parametros[BuscarParametro(parametros, "Imagen")] =
            new DictionaryEntry("Imagen", imagen);

        _pathBorrar = ((TextBox)Fv.FindControl("Path_Imagen")).Text;
    }

    private int BuscarParametro(List<DictionaryEntry> parametros, string key)
    {
        for (int i = 0; i < parametros.Count; i++)
        {
            if (parametros[i].Key.ToString() == key)
                return i;
        }
        return -1;
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Rubro_Tecnica); }
    }

    protected override FormView Fv
    {
        get { return fvApuRubroTecnica; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuRubroTecnica; }
    }

    protected override string Contenedor
    {
        get { return "APU_RUBRO_TECNICA"; }
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", Server.UrlDecode(Request.QueryString["Apu_Rubro_Nombre"])));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", Request.QueryString["Apu_Rubro_Unidad"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }

    protected void Rec_Apu_Rubro_Tecnica_Documento_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");

        string nombre = Server.UrlEncode(RubroNombre.Text);
        Response.Redirect("~/APU/APU_RUBRO_DOCUMENTO.aspx?Apu_Rubro_Id=" + RubroId.Text + 
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + nombre +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
    protected void btn_Apu_rubro_tecnica_rubro_Click(object sender, EventArgs e)
    {
        TextBox RuboId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        Response.Redirect("~/APU/APU_RUBRO.aspx?Apu_Rubro_Id=" + RuboId.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected override void AsignarParametrosDataSourceDeatailsView(string id)
    {
        OdsDv.SelectParameters["Apu_Rubro_Id"].DefaultValue = id;
    }
}