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

public partial class APU_APU_RUBRO_DOCUMENTO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        OdsDv.Inserting += new ObjectDataSourceMethodEventHandler(OdsDv_ApuRubroDocumentoInserting);
        OdsDv.Inserted += new ObjectDataSourceStatusEventHandler(OdsDv_ApuRubroDocumentoInserted);
        OdsDv.Updating += new ObjectDataSourceMethodEventHandler(OdsDv_ApuRubroDocumentoUpdating);
        Fv.ItemUpdated += new FormViewUpdatedEventHandler(Fv_UpdatedApuRubroDocumentoUpdated);
        Fv.DataBound += new EventHandler(Fv_DataBoundModo);        
    }

    void Fv_DataBoundModo(object sender, EventArgs e)
    {
        if (Fv.CurrentMode == FormViewMode.Insert)
            btn_Apu_Rubro_Documento_Ver.Enabled = false;
        else
            btn_Apu_Rubro_Documento_Ver.Enabled = true;
    }
        
    private void EtiquetarBotones() 
    {
        btn_Apu_Rubro_Documento_Ver.Text = GetLocalResourceObject("Btn_Apu_Rubro_Documento_VerRecursoKCG.Text").ToString();
        btn_Apu_Rubro_Documento_Ver.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Documento_VerRecursoKCG.ToolTip").ToString();
        btn_Apu_rubro_documento_tecnica.Text = GetLocalResourceObject("Btn_Apu_Rubro_Documento_TecnicaRecursoKCG.Text").ToString();
        btn_Apu_rubro_documento_tecnica.ToolTip = GetLocalResourceObject("Btn_Apu_Rubro_Documento_TecnicaRecursoKCG.ToolTip").ToString();
    }

    private FileUpload fupRubroDocumento;

    void OdsDv_ApuRubroDocumentoInserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        fupRubroDocumento = (FileUpload)Fv.FindControl("fupApuRubroDocumento");
        if (fupRubroDocumento.HasFile)
        {
            parametros[BuscarParametro(parametros, "Ruta")] =
                new DictionaryEntry("Ruta", fupRubroDocumento.PostedFile.FileName);
            parametros[BuscarParametro(parametros, "Nombre")] =
                new DictionaryEntry("Nombre", fupRubroDocumento.FileName);
        }
    }

    void OdsDv_ApuRubroDocumentoUpdating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        fupRubroDocumento = (FileUpload)Fv.FindControl("fupApuRubroDocumento");
        if (fupRubroDocumento.HasFile)
        {
            parametros[BuscarParametro(parametros, "Ruta")] =
                new DictionaryEntry("Ruta", fupRubroDocumento.PostedFile.FileName);
            parametros[BuscarParametro(parametros, "Nombre")] =
                new DictionaryEntry("Nombre", fupRubroDocumento.FileName);
        }
    }

    void OdsDv_ApuRubroDocumentoInserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null && fupRubroDocumento.HasFile)
        {
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath("~/APU_Docs/"));
            string path = serverPath.FullName + e.ReturnValue.ToString() + fupRubroDocumento.FileName;
            fupRubroDocumento.SaveAs(path);            
        }        
    }

    void Fv_UpdatedApuRubroDocumentoUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null && fupRubroDocumento.HasFile)
        {
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath("~/APU_Docs/"));
            string path = serverPath.FullName + e.NewValues["Id"] + fupRubroDocumento.FileName;
            fupRubroDocumento.SaveAs(path);            
        }        
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

    protected override CheckBox CbInsertarMemoria
    {
        get { return null; }
    }

    protected override Type TipoObjeto
    {
        get { return typeof(global::Apu_Rubro_Documento); }
    }

    protected override GridView Gv
    {
        get { return gvApuRubroDocumento; }
    }

    protected override FormView Fv
    {
        get { return fvApuRubroDocumento; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsGvApuRubroDocumento; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsFvApuRubroDocumento; }
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
        get { return "APU_RUBRO_DOCUMENTO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
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

    protected void btn_Apu_Rubro_Documento_Ver_Click(object sender, EventArgs e)
    {
        string archivo = gvApuRubroDocumento.SelectedRow.Cells[4].Text;
        string filepath = Server.MapPath(archivo);
        FileInfo file = new FileInfo(filepath);

        if (file.Exists)
        {
            Response.ClearContent();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.ContentType = ReturnExtension(file.Extension.ToLower());
            Response.TransmitFile(file.FullName);
            Response.End();            
        }
    }
    
    private string ReturnExtension(string fileExtension)
    {
        switch (fileExtension)
        {
            case ".htm":
            case ".html":
            case ".log":
                return "text/HTML";
            case ".txt":
                return "text/plain";
            case ".doc":
                return "application/ms-word";
            case ".tiff":
            case ".tif":
                return "image/tiff";
            case ".asf":
                return "video/x-ms-asf";
            case ".avi":
                return "video/avi";
            case ".zip":
                return "application/zip";
            case ".xls":
            case ".csv":
                return "application/vnd.ms-excel";
            case ".gif":
                return "image/gif";
            case ".jpg":
            case "jpeg":
                return "image/jpeg";
            case ".bmp":
                return "image/bmp";
            case ".wav":
                return "audio/wav";
            case ".mp3":
                return "audio/mpeg3";
            case ".mpg":
            case "mpeg":
                return "video/mpeg";
            case ".rtf":
                return "application/rtf";
            case ".asp":
                return "text/asp";
            case ".pdf":
                return "application/pdf";
            case ".fdf":
                return "application/vnd.fdf";
            case ".ppt":
                return "application/mspowerpoint";
            case ".dwg":
                return "image/vnd.dwg";
            case ".msg":
                return "application/msoutlook";
            case ".xml":
            case ".sdxl":
                return "application/xml";
            case ".xdp":
                return "application/vnd.adobe.xdp+xml";
            default:
                return "application/octet-stream";
        }
    }
    protected void btn_Apu_rubro_documento_tecnica_Click(object sender, EventArgs e)
    {
        TextBox RubroId = (TextBox)Fv.FindControl("Apu_Rubro_Id");
        TextBox RubroCodigo = (TextBox)Fv.FindControl("Apu_Rubro_Codigo");
        TextBox RubroNombre = (TextBox)Fv.FindControl("Apu_Rubro_Nombre");
        TextBox RubroUnidad = (TextBox)Fv.FindControl("Apu_Rubro_Unidad");
        //Response.Redirect("~/APU/APU_RUBRO_TECNICA.aspx?Apu_Rubro_Id=" + RubroId.Text + "&Apu_Rubro_Codigo=" + RubroCodigo.Text + "&Apu_Rubro_Nombre=" + RubroNombre.Text + "&Apu_Rubro_Unidad=" + RubroUnidad.Text);
        Response.Redirect("~/APU/APU_RUBRO_TECNICA.aspx?Apu_Rubro_Id=" + RubroId.Text + 
            "&Apu_Rubro_Codigo=" + RubroCodigo.Text + 
            "&Apu_Rubro_Nombre=" + RubroNombre.Text +
            "&Apu_Rubro_Unidad=" + RubroUnidad.Text +
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] +
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] +
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);
    }
}
