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

public partial class APU_APU_PROYECTO_RUBRO_DOCUMENTO : PaginaBaseKCG
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EtiquetarBotones();
        odsfvApuProyectoRubroDocumento.Inserting +=new ObjectDataSourceMethodEventHandler(odsfvApuProyectoRubroDocumento_Inserting); // += new ObjectDataSourceMethodEventHandler(OdsDv_ApuProyectoRubroDocumentoInserting);
        odsfvApuProyectoRubroDocumento.Inserted += new ObjectDataSourceStatusEventHandler(odsfvApuProyectoRubroDocumento_Inserted);  //OdsDv.Inserted += new ObjectDataSourceStatusEventHandler(OdsDv_ApuProyectoRubroDocumentoInserted);
        OdsDv.Updating += new ObjectDataSourceMethodEventHandler(OdsDv_ApuPRoyectoRubroDocumentoUpdating);
        Fv.ItemUpdated += new FormViewUpdatedEventHandler(Fv_ApuProyectoRubroDocumentoItemUpdated);
        Fv.DataBound += new EventHandler(Fv_DataBoundModo);
    }

    void odsfvApuProyectoRubroDocumento_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception == null && fuProyectoRubroDocumento.HasFile)
        {
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath("~/APU_Docs/"));
            string path = serverPath.FullName + e.ReturnValue.ToString() + fuProyectoRubroDocumento.FileName;
            fuProyectoRubroDocumento.SaveAs(path);
        }
    }

    void odsfvApuProyectoRubroDocumento_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        fuProyectoRubroDocumento = (FileUpload)Fv.FindControl("fuCargarArchivo");
        if (fuProyectoRubroDocumento.HasFile)
        {
            parametros[BuscarParametro(parametros, "Ruta")] =
                new DictionaryEntry("Ruta", fuProyectoRubroDocumento.PostedFile.FileName);
            parametros[BuscarParametro(parametros, "Nombre")] =
                new DictionaryEntry("Nombre", fuProyectoRubroDocumento.FileName);
        }
    }

    void Fv_DataBoundModo(object sender, EventArgs e)
    {
        if (Fv.DefaultMode == FormViewMode.Insert)
            Btn_Apu_Proyecto_Rubro_Documento_Ver.Enabled = false;
        else
            Btn_Apu_Proyecto_Rubro_Documento_Ver.Enabled = true;
    }

    private void EtiquetarBotones()
    {
        Btn_Apu_Proyecto_Rubro_Documento_Ver.Text = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Documento_VerRecursoKCG.Text").ToString();
        Btn_Apu_Proyecto_Rubro_Documento_Ver.ToolTip = GetLocalResourceObject("Btn_Apu_Proyecto_Rubro_Documento_VerRecursoKCG.ToolTip").ToString();
    }

    private FileUpload fuProyectoRubroDocumento;

    //void OdsDv_ApuProyectoRubroDocumentoInserting(object sender, ObjectDataSourceMethodEventArgs e)
    //{
    //    List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
    //    fuProyectoRubroDocumento = (FileUpload)Fv.FindControl("fuCargarArchivo");
    //    if (fuProyectoRubroDocumento.HasFile)
    //    {
    //        parametros[BuscarParametro(parametros, "Ruta")] =
    //            new DictionaryEntry("Ruta", fuProyectoRubroDocumento.PostedFile.FileName);
    //        parametros[BuscarParametro(parametros, "Nombre")] =
    //            new DictionaryEntry("Nombre", fuProyectoRubroDocumento.FileName);
    //    }
    //}

    void OdsDv_ApuPRoyectoRubroDocumentoUpdating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        List<DictionaryEntry> parametros = (List<DictionaryEntry>)e.InputParameters["parametros"];
        fuProyectoRubroDocumento = (FileUpload)Fv.FindControl("fuCargarArchivo");
        if (fuProyectoRubroDocumento.HasFile)
        {
            parametros[BuscarParametro(parametros, "Ruta")] =
                new DictionaryEntry("Ruta", fuProyectoRubroDocumento.PostedFile.FileName);
            parametros[BuscarParametro(parametros, "Nombre")] =
                new DictionaryEntry("Nombre", fuProyectoRubroDocumento.FileName);
        }
    }    

    //void OdsDv_ApuProyectoRubroDocumentoInserted(object sender, ObjectDataSourceStatusEventArgs e)
    //{
    //    if (e.Exception == null && fuProyectoRubroDocumento.HasFile)
    //    {
    //        DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath("~/APU_Docs/"));
    //        string path = serverPath.FullName + e.ReturnValue.ToString() + fuProyectoRubroDocumento.FileName;
    //        fuProyectoRubroDocumento.SaveAs(path);
    //    }
    //}

    void Fv_ApuProyectoRubroDocumentoItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null && fuProyectoRubroDocumento.HasFile)
        {
            DirectoryInfo serverPath = new DirectoryInfo(Server.MapPath("~/APU_Docs/"));
            string path = serverPath.FullName + e.NewValues["Id"] + fuProyectoRubroDocumento.FileName;
            fuProyectoRubroDocumento.SaveAs(path);
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
        get { return typeof(global::Apu_Proyecto_Rubro_Documento); }
    }

    protected override GridView Gv
    {
        get { return gvApuProyectoRubroDocumento; }
    }

    protected override FormView Fv
    {
        get { return fvApuProyectoRubroDocumento; }
    }

    protected override ObjectDataSource OdsGv
    {
        get { return odsgvApuProyectoRubroDocumento; }
    }

    protected override ObjectDataSource OdsDv
    {
        get { return odsfvApuProyectoRubroDocumento; }
    }

    protected override Button BResponderZoom
    {
        get { return Seleccionar; }
    }

    protected override Button BRegreso
    {
        get { return Atras; }
    }

    protected override KFiltro KftFiltro
    {
        get { return kftFiltro; }
    }

    protected override string Contenedor
    {
        get { return "APU_PROYECTO_RUBRO_DOCUMENTO"; }
    }

    protected void nav_Siguiente(object sender, EventArgs e)
    {
        Gv_SelectedIndexChanged(sender, e);
    }

    protected override void DefinirParametrosFijosDeInsercion(System.Collections.Generic.List<DictionaryEntry> param)
    {
        if (Request.QueryString.Count > 0)
        {
            param.Add(new DictionaryEntry("Apu_Proyecto_Rubro_Id", Request.QueryString["Apu_Proyecto_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Codigo", Request.QueryString["Apu_Proyecto_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Proyecto_Nombre", Request.QueryString["Apu_Proyecto_Nombre"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Id", Request.QueryString["Apu_Rubro_Id"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Codigo", Request.QueryString["Apu_Rubro_Codigo"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Nombre", Request.QueryString["Apu_Rubro_Nombre"]));
            param.Add(new DictionaryEntry("Apu_Rubro_Unidad", Request.QueryString["Apu_Rubro_Unidad"]));
        }
        base.DefinirParametrosFijosDeInsercion(param);
    }
    protected void Btn_Apu_Proyecto_Rubro_Documento_Ver_Click(object sender, EventArgs e)
    {
        string archivo = gvApuProyectoRubroDocumento.SelectedRow.Cells[4].Text;
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

    protected void Btn_Apu_Proyecto_Rubro_Tecnica_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/APU/APU_PROYECTO_RUBRO_TECNICA.aspx" +
            "?Apu_Proyecto_Rubro_Id=" + Request.QueryString["Apu_Proyecto_Rubro_Id"] + 
            "&Apu_Proyecto_Id=" + Request.QueryString["Apu_Proyecto_Id"]+
            "&Apu_Proyecto_Codigo=" + Request.QueryString["Apu_Proyecto_Codigo"]  + 
            "&Apu_Proyecto_Nombre=" + Request.QueryString["Apu_Proyecto_Nombre"] +
            "&Apu_Proyecto_Etapa=" + Request.QueryString["Apu_Proyecto_Etapa"]+
            "&Apu_Rubro_Id=" + Request.QueryString["Apu_Rubro_Id"] +
            "&Apu_Rubro_Codigo=" + Request.QueryString["Apu_Rubro_Codigo"] +
            "&Apu_Rubro_Nombre=" + Request.QueryString["Apu_Rubro_Nombre"] +
            "&Apu_Rubro_Unidad=" + Request.QueryString["Apu_Rubro_Unidad"] + 
            "&Estado=" + Request.QueryString["Estado"] +
            "&Apu_Presupuesto_Estado=" + Request.QueryString["Apu_Presupuesto_Estado"] + 
            "&Elem_PagActual=" + Request.QueryString["Elem_PagActual"] + 
            "&Elem_NumRegis=" + Request.QueryString["Elem_NumRegis"] + 
            "&Elem_Id=" + Request.QueryString["Elem_Id"]);

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
}
