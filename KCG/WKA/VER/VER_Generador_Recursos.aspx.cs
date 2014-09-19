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
using System.Drawing;
using FEL.VER;
using FEL.DIC;
using FEL.PAR;
using System.Xml;
using System.Xml.Xsl;
using System.IO;



namespace WKC.REC
{
    public partial class VER_Generador_Recursos : System.Web.UI.Page
    {
        Scope s = new Scope();
        string strNombreArchivo = "";

        #region  MANEJO DE EVENTOS
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                s.Ver_Version_Id = "1";
                //Cargo el combo de version 
                DataTable dtblversion = new DataTable();
                dtblversion = LeerVersion();
                ddlVersion.DataSource = dtblversion;
                ddlVersion.DataBind();
               

                //Cargo el menu de los idiomas
                
                for (int i = 0; i < dtblversion.Rows.Count; i++)
                {
                    MenuItem menu = new MenuItem();
                    menu.Value = dtblversion.Rows[i]["Abreviatura"].ToString();
                    menu.Text = dtblversion.Rows[i]["Nombre"].ToString();
                    mnuPrincipal.Items.Add(menu);
                    Session["lenguaje"] = dtblversion.Rows[i]["Abreviatura"].ToString();
                    menu.NavigateUrl="VER_Generador_Recursos.aspx" + "?lenguaje=" + Session["lenguaje"].ToString();
                }

                //Cargo el combo de modulo
                DataTable dtblModulo = new DataTable();
                dtblModulo = LeerModulo();
                ddlModulo.DataSource = dtblModulo;
                ddlModulo.DataBind();
            }

            


        }

        protected void ddlContenedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Cargo el combo del recursos 
            s.Ver_Version_Id =ddlVersion.SelectedValue.ToString();
            string IdContenedor = ddlContenedor.SelectedValue.ToString();
            DataTable dtblRecursos = new DataTable();
            dtblRecursos = LeerRecursos(s,IdContenedor);
            dtblRecursos.WriteXml("C:/Prueba/PruebaRecursos.xml");
            dgDatos.DataSource = dtblRecursos;
            dgDatos.DataBind();

            //Cargar la caja de texto  para ver el nombre del archivo

            DataTable dtblContenedor = LeerContenedor(s, ddlModulo.SelectedValue);
            for (int i = 0; i < dtblContenedor.Rows.Count; i++)
            {
                if (dtblContenedor.Rows[i]["Id"].ToString() == Convert.ToString(IdContenedor))
                {
                    txtArchivo.Text = dtblContenedor.Rows[i]["archivo_recursos"].ToString();
                    strNombreArchivo = txtArchivo.Text;
                }
            }


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue.ToString() == "Master")
            {
                s.Ver_Version_Id = ddlVersion.SelectedValue.ToString();
                BO_Par_Recursos_Base master = new BO_Par_Recursos_Base();
                DataTable general = new DataTable("Recursos");
                general=master.GetBase(s);
                general.WriteXml("C:/Prueba/PruebaRecursos.xml");
                pnlEspecifico.Visible = false;
                pnlGeneral.Visible = true;
                gvGeneral.DataSource =general;
                gvGeneral.DataBind();
            }
            else
            {
                pnlEspecifico.Visible = true;
                pnlGeneral.Visible = false;

            }

        }

        protected void ddlModulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Cargo el combo de contenedor
            s.Ver_Version_Id = "1";
            string IdModulo=ddlModulo.SelectedValue.ToString();
            DataTable dtblcontenedor = new DataTable("Recursos");
            dtblcontenedor = LeerContenedor(s, IdModulo);
            ddlContenedor.DataSource = dtblcontenedor;
            ddlContenedor.DataBind();
            
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            //Cargar la caja de texto  para ver el nombre del archivo
            s.Ver_Version_Id = ddlVersion.SelectedValue.ToString();
            string  IdContenedor = ddlContenedor.SelectedValue.ToString();
            DataTable dtblContenedor = LeerContenedor(s,ddlModulo.SelectedValue);
            for (int i = 0; i < dtblContenedor.Rows.Count; i++)
            {
                if (dtblContenedor.Rows[i]["Id"].ToString() == Convert.ToString(IdContenedor))
                {
                     strNombreArchivo = txtArchivo.Text;
                }
            }
            if (strNombreArchivo != "" || strNombreArchivo=="")// && Session["PathDirectorio"].ToString() != "")
            {


                if (DropDownList1.SelectedValue == "Master")
                {
                    string strPathResx = "C:/Recursos/" + "ITCG.master.resx";//Session["PathDirectorio"].ToString() + "//" + "ITCG.master.resx";
                    string strPathXslt = "C:/Prueba/BaseRecursosMaster.xslt";
                    string strPathXml = "C:/Prueba/PruebaRecursos.xml";
                    string strBase = "C:/Prueba/Recursos.txt";


                    //Creamos el archivo de recursos
                    FileStream ArchivoResx = new FileStream(strPathResx, FileMode.OpenOrCreate);
                    ArchivoResx.Close();

                    //Transformamos el archivo  xml  a lo que necesitamos
                    XslCompiledTransform xslTransformacion;
                    xslTransformacion = new XslCompiledTransform();
                    xslTransformacion.Load(strPathXslt);
                    xslTransformacion.Transform(strPathXml, strBase);
                    Tratamientoarchivo(strPathResx);
                    txtDirectorio.Text = strPathResx;

                    Response.Write("<script language=javascript>window.alert('Generación Satisfactoria ')</script>");
                }
                else
                {
                    string strPathResx = "C:/Recursos/" + strNombreArchivo;//Session["PathDirectorio"].ToString() + "//" + strNombreArchivo;
                    string strPathXslt = "C:/Prueba/BaseRecursos.xslt";
                    string strPathXml = "C:/Prueba/PruebaRecursos.xml";
                    string strBase = "C:/Prueba/Recursos.txt";


                    //Creamos el archivo de recursos
                    FileStream ArchivoResx = new FileStream(strPathResx, FileMode.OpenOrCreate);
                    ArchivoResx.Close();


                    //Transformamos el archivo  xml  a lo que necesitamos
                    XslCompiledTransform xslTransformacion;
                    xslTransformacion = new XslCompiledTransform();
                    xslTransformacion.Load(strPathXslt);
                    xslTransformacion.Transform(strPathXml, strBase);
                    Tratamientoarchivo(strPathResx);
                    txtDirectorio.Text = strPathResx;

                    Response.Write("<script language=javascript>window.alert('Generación Satisfactoria')</script>");

                }
            }
            else
            {
                Response.Write("<script language=javascript>window.alert('Error en la generación de recursos')</script>");
            }



        }
        #endregion

        #region FUNCIONES UTILES

        private void Tratamientoarchivo(string args)
        {
           

            FileStream stream = new FileStream("C:/Prueba/Recursos.txt", FileMode.OpenOrCreate, FileAccess.Read);
            FileStream escribir = new FileStream(args, FileMode.OpenOrCreate, FileAccess.Write);
            StreamReader reader = new StreamReader(stream);
            StreamWriter writer = new StreamWriter(escribir);
            while (reader.Peek() > -1)
            {
                string cadena = reader.ReadLine();
                int inicio = cadena.IndexOf("&lt;");
                int fin = cadena.IndexOf("&gt;");
                
                if (inicio != -1 || fin != -1)
                {
                    cadena = cadena.Replace("&lt;", "<");
                    cadena = cadena.Replace("&gt;", ">");
                    writer.WriteLine(cadena);
                }

                else
                {
                    writer.WriteLine(cadena);
                }



            }

            writer.Close();
            reader.Close();
            //File.Delete("C:/Prueba/ClaseDo.cs");


        }

        private DataTable LeerRecursos(Scope s,string version)
        {


            BO_Par_Recursos recursos = new BO_Par_Recursos();
            DataTable dtblRecursos = new DataTable();
            dtblRecursos = recursos.GetByContenedor(s, version);
            return dtblRecursos;

        }
        private DataTable LeerVersion()
        {
            //Cargo el combo de version 
            
            BO_Ver_Version version = new BO_Ver_Version();
            DataTable dtblversion = new DataTable();
            dtblversion = version.Get(s);
            return dtblversion;
            
        
        }

        private DataTable LeerModulo()
        {

            BO_Dic_Modulo modulo = new BO_Dic_Modulo();
            DataTable dtblModulo = new DataTable();
            dtblModulo = modulo.Get(s);
            return dtblModulo;


        }

        private DataTable LeerContenedor(Scope s,string IdModulo)
        {
            
            BO_Dic_Contenedor contenedor = new BO_Dic_Contenedor();
            DataTable dtblcontenedor = new DataTable("Recursos");
            dtblcontenedor = contenedor.GetByModulo(s, IdModulo);
            return dtblcontenedor;
        }


        #endregion


        protected override void InitializeCulture()
        {

            if (Request.QueryString["lenguaje"] != null)
            {
                UICulture = Request.QueryString["lenguaje"];
            }

            base.InitializeCulture();
        }





}
}
