using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Reflection;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using FEL.VER;
using FEL.INT;
using FEL.SEG;
using System.Net;

public partial class PAS_PAR_ACCESO : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {   
        if (!IsPostBack)
            ObneterEmpresaSucursalPredeterminadas();

        Etiquetar();
        ((ScriptManager)Master.FindControl("ScriptManager1")).SetFocus(Txt_Usuario);
    }

    protected void Etiquetar()
    {
        Lab_Txt_Usuario.Text = GetLocalResourceObject("Txt_UsuarioRecursoKCG.Text").ToString();
        Txt_Usuario.ToolTip = GetLocalResourceObject("Txt_UsuarioRecursoKCG.ToolTip").ToString();

        Lab_Txt_Contrasenia.Text = GetLocalResourceObject("Txt_ContraseñaRecursoKCG.Text").ToString();
        Txt_Contrasenia.ToolTip = GetLocalResourceObject("Txt_ContraseñaRecursoKCG.ToolTip").ToString();

        Lab_Cmb_Rol.Text = GetLocalResourceObject("Cmb_RolRecursoKCG.Text").ToString();
        Cmb_Rol.ToolTip = GetLocalResourceObject("Cmb_RolRecursoKCG.ToolTip").ToString();

        //Rec_Usuario.GroupingText = "" + 
        //    GetLocalResourceObject("Rec_UsuarioRecursoKCG.GroupingText").ToString() +
        //    "";

        Rec_Sesion.GroupingText = "" + 
            GetLocalResourceObject("Rec_SesionRecursoKCG.GroupingText").ToString() +
            "";

        Rec_Usuario.GroupingText = "*";


        Btn_Conectarse.Text = GetLocalResourceObject("Btn_ConectarseRecursoKCG.Text").ToString();
        Btn_Conectarse.ToolTip = GetLocalResourceObject("Btn_ConectarseRecursoKCG.ToolTip").ToString();

        Btn_Aceptar.Text = GetLocalResourceObject("Btn_AceptarRecursoKCG.Text").ToString();
        Btn_Aceptar.ToolTip = GetLocalResourceObject("Btn_AceptarRecursoKCG.ToolTip").ToString();

        Btn_Cancelar.Text = GetLocalResourceObject("Btn_CancelarRecursoKCG.Text").ToString();
        Btn_Cancelar.ToolTip = GetLocalResourceObject("Btn_CancelarRecursoKCG.ToolTip").ToString();

        Chk_Recordar_Seleccion.Text = GetLocalResourceObject("CHK_Recordar_SeleccionRecursoKCG.Text").ToString();
        Chk_Recordar_Seleccion.ToolTip= GetLocalResourceObject("CHK_Recordar_SeleccionRecursoKCG.ToolTip").ToString();
    }

    protected override void InitializeCulture()
    {
        if (Session["lenguaje"] == null)
        {
            //List<Int_Usuario> listIntUsuario = new List<Int_Usuario>(1);
            //listIntUsuario.Add(new Int_Usuario());
            CrearScopeEnSesion(null);
            VerificarVersionPredeterminada();
        }
        UICulture = (string)Session["lenguaje"];
        base.InitializeCulture();        
    }    

    protected void Btn_Conectarse_Click(object sender, EventArgs e)
    {
        bool estaAutenticado = EstaAutenticado(Txt_Usuario.Text, Txt_Contrasenia.Text);

        if (estaAutenticado)
        {
            Rec_Usuario.Enabled = false;
            Rec_Usuario.Visible = false;
            Rec_Sesion.Enabled = true;
            Rec_Sesion.Visible = true;
            UsuarioReq.ControlToValidate = "";
            ContraseniaReq.ControlToValidate = "";
        }
        else
        {
            if (string.IsNullOrEmpty(Mensaje.Text)) Mensaje.Text = GetLocalResourceObject("MSJ20RecursoKCG.Text").ToString();
        }
    }

    private bool EstaAutenticado(string usuario, string contrasenia)
    {
        BO_Int_Usuario boIntUsuario = new BO_Int_Usuario();
        List<Int_Usuario> listIntUsuario = null;
        bool estaAutenticado = false;
        try
        {
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = new Scope();
            listIntUsuario = boIntUsuario.GetByNombrePassword("", s, usuario, contrasenia);
            if (listIntUsuario.Count == 1) estaAutenticado = true;
        }
        catch
        {
            Mensaje.Text = ObtenerMensajeError(null);
        }

        if (estaAutenticado)
        {
            CrearScopeEnSesion(listIntUsuario);
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope) Session["Scope"];
            string idRol = LlenarComboRol(listIntUsuario, s.Int_Sucursal_Id, listIntUsuario[0].Id);
            if (idRol == null) return false;
        }
        return estaAutenticado;
    }

    private void CrearScopeEnSesion(List<Int_Usuario> listIntUsuario)
    {
        Scope s;
        
        if (Session["Scope"] != null)
            s = (Scope)Session["Scope"];
        else
            s = new Scope();

        if (listIntUsuario != null)
        {
            s.Int_Usuario_Id = listIntUsuario[0].Id;
            s.Int_Usuario_Nombre = listIntUsuario[0].Nombre;
            s.Per_Personal_Id = listIntUsuario[0].Per_Personal_Id;
            s.Per_Personal_Nombre = listIntUsuario[0].Per_Personal_Nombre;
            s.Jefe_Fiscalizacion = listIntUsuario[0].Jefe_Fiscalizacion;
        }

        //Obtener La direccion IP
        string Host;
        Host = Dns.GetHostName();
        IPHostEntry IPs = Dns.GetHostEntry(Host);//GetHostByName(Host);
        IPAddress[] Direcciones = IPs.AddressList;

        //Se despliega la lista de IP's
        for (int i_cont = 0; i_cont < Direcciones.Length; i_cont++)
        {
            s.Ip_Origen = Direcciones[i_cont].ToString();
        }

        s.Par_Servidor_Id = ConfigurationManager.AppSettings["Par_Servidor_Id"];
        
        Session["Scope"] = s;
    }

    private void VerificarVersionPredeterminada()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];

        if(!string.IsNullOrEmpty(s.Ver_Version_Id)) return;

        BO_Ver_Version boVerVersion = new BO_Ver_Version();
        List<Ver_Version> listVerVersion = new List<Ver_Version>();

        try
        {
            listVerVersion = boVerVersion.GetByOnlyPredeterminada("", s);
        }
        catch 
        {
            throw;
        }

        if (listVerVersion.Count == 0)
            throw new Exception("No existe version predeterminada del sistema");

        if (listVerVersion[0].Id != null)
        {
            s.Ver_Version_Id = listVerVersion[0].Id;
            s.Ver_Version_Nombre = listVerVersion[0].Nombre;
            Session["lenguaje"] = listVerVersion[0].Abreviatura;
        }
    }

    //private bool cambioIdioma = false;

    private void ObneterEmpresaSucursalPredeterminadas()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        BO_Int_Sucursal boIntSucursal = new BO_Int_Sucursal();
        List<Int_Sucursal> intSucursal = new List<Int_Sucursal>();
        
        try
        {
            intSucursal = boIntSucursal.GetOnlyPredeterminada("",s);
        }
        catch
        {
            Mensaje.Text = ObtenerMensajeError(null);
        }

        if (intSucursal.Count == 1)
        {
            s.Int_Empresa_Id = intSucursal[0].Int_Empresa_Id;
            s.Int_Empresa_Nombre = intSucursal[0].Int_Empresa_nombre;
            s.Int_Empresa_Abreviatura = intSucursal[0].Int_Empresa_Abreviatura;
            s.Int_Sucursal_Id = intSucursal[0].Id;
            s.Int_Sucursal_Nombre = intSucursal[0].Nombre;
            s.Int_Sucursal_Abreviatura = intSucursal[0].Abreviatura;
            s.Int_Sucursal_Numero = intSucursal[0].Numero;
            s.Int_Moneda_Id = intSucursal[0].Int_Moneda_Id;
            imgLogoFolsal.ImageUrl = intSucursal[0].Int_Empresa_Imagen;
        }
        else
        {
            throw new Exception("No existen empresa o sucursal predeterminada");
        }
    }

    private string LlenarComboRol(List<Int_Usuario> listIntUsuario, string sucursalId, string usuarioId)
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        BO_Seg_Rol_Usuario_Det boSegRolUsuarioDet = new BO_Seg_Rol_Usuario_Det();
        List<Seg_Rol_Usuario_Det> segRolUsuarioDet = null;
        try
        {
           segRolUsuarioDet = boSegRolUsuarioDet.GetBySucursalUsuario("seg_rol_Nombre", s, sucursalId, usuarioId);         
        }
        catch
        {
            return null;
        }

        Cmb_Rol.DataSource = segRolUsuarioDet;
        Cmb_Rol.DataValueField = "seg_rol_id";
        Cmb_Rol.DataTextField = "seg_rol_Nombre";
        Cmb_Rol.DataBind();

        if (listIntUsuario != null)
        {
            if (listIntUsuario[0].Pred_Seg_Rol_Id != null)
            {
                Cmb_Rol.SelectedValue = listIntUsuario[0].Pred_Seg_Rol_Id.ToString();
            }
        }
        return Cmb_Rol.SelectedValue;
    }

    private HttpCookie CrearCookieAutenticacion(string usuario, string rol, double tiempoValidez)
    {
        FormsAuthenticationTicket authTicket = new
            FormsAuthenticationTicket(1, // version
                                      usuario, // user name
                                      DateTime.Now, // creation
                                      DateTime.Now.AddMinutes(tiempoValidez), // Expiration
                                      false, // Persistent
                                      rol); //rol

        // Now encrypt the ticket.
        string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
        // Create a cookie and add the encrypted ticket to the 
        // cookie as data.
        HttpCookie authCookie =
            new HttpCookie(FormsAuthentication.FormsCookieName,
                           encryptedTicket);

        return authCookie;
    }


    protected void Btn_Aceptar_Click(object sender, EventArgs e)
    {
        GrabarScope();
        
        if(Chk_Recordar_Seleccion.Checked)
        {
            GrabarSeleccionDeUsuario();
        }
        
        HttpCookie autenticacionCookie = CrearCookieAutenticacion(Txt_Usuario.Text, Cmb_Rol.SelectedItem.Text, 60);
        Response.Cookies.Add(autenticacionCookie);
        string redire = FormsAuthentication.GetRedirectUrl(Txt_Usuario.Text, false);
        //  redire = FormsAuthentication.DefaultUrl;  /WKA/Default.aspx
        Response.Redirect(redire);

        //ScriptManager.RegisterStartupScript(this, this.GetType(), "redirecionar",
        //                                    "window.open('" + redire + "','_blank','height='+ (screen.height-55)+' ,width='+ (screen.width-10) + ',resizable=no,scrollbars=no,status=no,toolbar=no,menubar=no,location=no,status=1,left=0,top=0')", true);
    }

    private void GrabarSeleccionDeUsuario()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        BO_Int_Usuario boIntUsuario = new BO_Int_Usuario();
        List<Int_Usuario> ListIntUsuarioOriginal = new List<Int_Usuario>();

        try
        {
            ListIntUsuarioOriginal = boIntUsuario.GetById("", s, s.Int_Usuario_Id);
        }
        catch
        {
            Mensaje.Text = ObtenerMensajeError(null);
        }

        Int_Usuario usuarioOroginal = ListIntUsuarioOriginal[0];
        Int_Usuario usuarioActializado = new Int_Usuario();

        CopiarIntUsuario(usuarioOroginal, ref usuarioActializado);

        usuarioActializado.Pred_Seg_Rol_Id = Cmb_Rol.SelectedValue;
        usuarioActializado.Pred_Ver_Version_Id = s.Ver_Version_Id;
        usuarioActializado.Pred_Int_Sucursal_Id = s.Int_Sucursal_Id;

        try
        {
            boIntUsuario.Update(s, usuarioActializado, usuarioOroginal);
        }
        catch
        {
            Mensaje.Text = ObtenerMensajeError(null);
        }
    }

    private void CopiarIntUsuario(Int_Usuario origen, ref Int_Usuario destino)
    {
        destino.Id = origen.Id;
        destino.Codigo = origen.Codigo;
        destino.Nombre = origen.Nombre;
        destino.Salt = origen.Salt;
        destino.Password = origen.Password;
        destino.Usuario_Id_Ref = origen.Usuario_Id_Ref;
        destino.Per_Personal_Id = origen.Per_Personal_Id;
        destino.Pred_Seg_Rol_Id = origen.Pred_Seg_Rol_Id;
        destino.Pred_Ver_Version_Id = origen.Pred_Ver_Version_Id;
        destino.Pred_Int_Sucursal_Id = origen.Pred_Int_Sucursal_Id;
        destino.Estado = origen.Estado;
    }

    private void GrabarScope()
    {
        if (Session["Scope"] == null)
            Response.Redirect("~/PAS/PAR_ACCESO.aspx");
        Scope s = (Scope)Session["Scope"];
        s.Seg_Rol_Id = Cmb_Rol.SelectedItem.Value;
        s.Seg_Rol_Nombre = Cmb_Rol.SelectedItem.Text;
    }

    protected void Btn_Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect(FormsAuthentication.LoginUrl);
    }

    string ObtenerMensajeError(XmlNode detalleMensajeError)
    {
        string CodigoError = "COD1";
        //string MensajeError = "MSJ14";

        switch (CodigoError)
        {
            case "COD1":
                return "Error";
                //return HttpContext.GetLocalResourceObject("~/ITCG.master", MensajeError + "RecursoKCG.Text").ToString();
        }
        return "";
    }
}
