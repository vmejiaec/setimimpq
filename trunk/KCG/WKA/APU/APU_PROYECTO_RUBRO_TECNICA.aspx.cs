using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class APU_APU_PROYECTO_RUBRO_TECNICA : PaginaBaseFormView
{
    private FileUpload _fupProyectoRubroTecnica;
    private string _pathBorrar = string.Empty;
    private bool _guardarFichero = false;
    private string _idProyectoRubroTecnicaImagen = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        OdsDv.Updating += new ObjectDataSourceMethodEventHandler(OdsDv_ApuProyectoRubroTecnicaUpdating);
        Fv.ItemUpdated += new FormViewUpdatedEventHandler(Fv_UpdatedApuProyectoRubroTecnicaUpdated);
        Fv.DataBound += new EventHandler(Fv_DataBoundApuProyectoRubroTecnica);
        btn_Apu_Proyecto_Rubro.Click += new EventHandler(btn_Apu_Proyecto_Rubro_Click);
        EtiquetarBotones();
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Rubro_Tecnica_Documento.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Tecnica_DocumentoRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Tecnica_Documento.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Tecnica_DocumentoRecursoKCG.ToolTip").ToString();
    }

    void btn_Apu_Proyecto_Rubro_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO.aspx" + 
            "?Apu_Proyecto_Id=" +     Request.QueryString["Apu_Proyecto_Id"] +
            "&Apu_Proyecto_Rubro_Id=" + Request.QueryString["Apu_Proyecto_Rubro_Id"] +
            "&Apu_Proyecto_Codigo=" + Request.QueryString["Apu_Proyecto_Codigo"] +
            "&Apu_Proyecto_Nombre=" + Request.QueryString["Apu_Proyecto_Nombre"]+
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    void Fv_DataBoundApuProyectoRubroTecnica(object sender, EventArgs e)
    {
        if (_guardarFichero && Fv.CurrentMode == FormViewMode.ReadOnly)
        {
            string strServerPath = ((TextBox)Fv.FindControl("Path_Imagen")).Text;
            string nombreFicheroImegen = _idProyectoRubroTecnicaImagen + _fupProyectoRubroTecnica.FileName.ToUpper();
            strServerPath = strServerPath.Replace(nombreFicheroImegen, "");
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath(strServerPath));
            string path = serverPath.FullName + nombreFicheroImegen;
            _fupProyectoRubroTecnica.SaveAs(path);
        }
    }    

    void Fv_UpdatedApuProyectoRubroTecnicaUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null && _fupProyectoRubroTecnica.HasFile)
        {
            BorrarArchivo(_pathBorrar);

            if (_fupProyectoRubroTecnica.HasFile)
            {
                _guardarFichero = true;
                _idProyectoRubroTecnicaImagen = e.NewValues["Id"].ToString();
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

    void OdsDv_ApuProyectoRubroTecnicaUpdating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        _fupProyectoRubroTecnica = (FileUpload)Fv.FindControl("fupApuProyectoRubroTecnica");

        string origenImagen = null;
        string imagen = null;

        if (_fupProyectoRubroTecnica.HasFile)
        {
            origenImagen = _fupProyectoRubroTecnica.PostedFile.FileName;
            imagen = _fupProyectoRubroTecnica.FileName;            
        }

        parametros[BuscarParametro(parametros, "Origen_Imagen")] =
                new DictionaryEntry("Origen_Imagen", _fupProyectoRubroTecnica.PostedFile.FileName);
        parametros[BuscarParametro(parametros, "Imagen")] =
            new DictionaryEntry("Imagen", _fupProyectoRubroTecnica.FileName);

        _pathBorrar = ((TextBox)Fv.FindControl("Path_Imagen")).Text;
    }

    private int BuscarParametro (List<DictionaryEntry> parametros, string key)
    {
        for (int i = 0; i < parametros.Count; i++)
        {
            if(parametros[i].Key.ToString() == key)
                return i;
        }
        return -1;
    }
    protected override void AsignarParametrosDataSourceDeatailsView(string id)
    {
        OdsDv.SelectParameters["Apu_Proyecto_Rubro_Id"].DefaultValue = id;
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Proyecto_Rubro_Tecnica); }
    }

    protected override FormView Fv
    {
        get { return FvApuRubroTecnica; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsApuProyectoRubroTecnica; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_RUBRO_TECNICA"; }
    }

    protected void Btn_Apu_Proyecto_Rubro_Tecnica_Documento_Click(object sender, EventArgs e)
    {
        TextBox Proyecto_Id = (TextBox)Fv.FindControl("Apu_Proyecto_Id");
        TextBox ProyectoRubroId = (TextBox)Fv.FindControl("Apu_Proyecto_Rubro_Id");
        TextBox ProyectoCodigo = (TextBox)Fv.FindControl("Apu_Proyecto_Codigo");
        TextBox ProyectoNombre = (TextBox)Fv.FindControl("Apu_Proyecto_Nombre");
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_DOCUMENTO.aspx?Apu_Proyecto_Rubro_Id=" + ProyectoRubroId.Text + "&Apu_Proyecto_Id=" + Proyecto_Id.Text + "&Apu_Proyecto_Codigo=" + ProyectoCodigo.Text + "&Apu_Proyecto_Nombre=" + ProyectoNombre.Text + "&Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + RubroNombre.Text + "&Apu_Rubro_Unidad=" + RubroUnidad.Text + "&Estado=" + Request.QueryString["Estado"] + "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }

    protected void btn_Apu_Proyecto_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/APU/APU_PROYECTO.aspx?Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"] + "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
