using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using FEL.DIC;
using HER;
using System.Web;

public partial class DIC_DIC_METADATOS : KPagina
{
    private const string _indiceDataDocumetoXml = "iDatDocXsd";
    private DataSet DataDocumentXsd
    {
        get
        {
            object o = ViewState[_indiceDataDocumetoXml];
            return (o == null) ? null : (DataSet) o;
        }
        set
        {
            ViewState[_indiceDataDocumetoXml] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        btnFicheroXsd.Click += new EventHandler(btnFicheroXsd_Click);
        btnInsertGrid.Click += new EventHandler(btnInsertGrid_Click);
        ddlDicObjeto.SelectedIndexChanged += new EventHandler(ddlDicObjeto_SelectedIndexChanged);
    }

    private const string _indiceDicObjeto = "iDO";
    private Dic_Objeto DicObjeto
    {
        get
        {
            object o = ViewState[_indiceDicObjeto];
            return (o == null) ? null : (Dic_Objeto)o;
        }
        set
        {
            ViewState[_indiceDicObjeto] = value;
        }
    }

    void VerificarObjeto()
    {
        Dic_Objeto dicObjeto = ConsultarObjetoPorNombre(ddlDicObjeto.SelectedItem.Text);
        if(dicObjeto != null)
        {
            ddlDicObjeto.SelectedItem.Value = dicObjeto.Id;
           
            DicObjeto = dicObjeto;
            txbNumero.ReadOnly = true;
            ddlModulo.Enabled = false;
            txbNumero.Text = dicObjeto.Numero.ToString();
            for (int i = 0; i < ddlModulo.Items.Count; i++ )
            {
                if (dicObjeto.Dic_Modulo_Nombre == ddlModulo.Items[i].Text)
                {
                    ddlModulo.SelectedIndex = i;
                    break;
                }
            }
        }
        else
        {
            txbNumero.ReadOnly = false;
            ddlModulo.Enabled = true;
            txbNumero.Text = "";
        }
    }

    void ddlDicObjeto_SelectedIndexChanged(object sender, EventArgs e)
    {
        RefrescarInterza();
    }

    private List<Dic_Campo> GetCamposDesdeXsd(string nombreObjeto, out bool[] revisionExitosa)
    {
        DataColumnCollection dccObjeto = GetObjetoDesdeXsd(nombreObjeto);
        int capacidad = DataDocumentXsd.Tables[nombreObjeto].Columns.Count;
        List<Dic_Campo> lstNuevosCampos = new List<Dic_Campo>(capacidad);
        revisionExitosa = new bool[capacidad];
        for (int indice = 0; indice < dccObjeto.Count; indice++)
        {
            DataColumn columna = dccObjeto[indice];
            Dic_Campo nuevoCampo = new Dic_Campo();
            nuevoCampo.Nombre = columna.ColumnName;
            bool revision = true;

            if (nuevoCampo.Nombre.EndsWith("_CODIGO",StringComparison.OrdinalIgnoreCase) ||
                nuevoCampo.Nombre.Equals("CODIGO", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "COD";
                nuevoCampo.Filtro = "S";
            }

            else if (nuevoCampo.Nombre.EndsWith("_ID", StringComparison.OrdinalIgnoreCase) ||
                nuevoCampo.Nombre.Equals("ID", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "COD";
                nuevoCampo.Filtro = "N";
            }
            
            else if (nuevoCampo.Nombre.Equals("INT_EMPRESA_NOMBRE", StringComparison.OrdinalIgnoreCase)
                || nuevoCampo.Nombre.Equals("ESTADO_NOMBRE", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "N";
            }

            else if (nuevoCampo.Nombre.EndsWith("_NOMBRE", StringComparison.OrdinalIgnoreCase) ||
                nuevoCampo.Nombre.Equals("NOMBRE", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "S";
            }

            else if (nuevoCampo.Nombre.Equals("ESTADO", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "CHA";
                nuevoCampo.Tipo_Constraint = "EST";
                nuevoCampo.Filtro = "S";
            }

            else if (nuevoCampo.Nombre.EndsWith("_DESCRIPCION", StringComparison.OrdinalIgnoreCase) ||
                nuevoCampo.Nombre.Equals("DESCRIPCION", StringComparison.OrdinalIgnoreCase))
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "N";
            }

            else if (columna.DataType == typeof(string) && columna.MaxLength == 3)
            {
                nuevoCampo.Tipo_Dato = "CHA";
                nuevoCampo.Tipo_Constraint = "";
                nuevoCampo.Filtro = "S";
                revision = false;
            }

            else if (columna.DataType == typeof(DateTime))
            {
                nuevoCampo.Tipo_Dato = "DAT";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "S";
            }

            else if (columna.DataType == typeof(int))
            {
                nuevoCampo.Tipo_Dato = "INT";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "S";
            }

            else if (columna.DataType == typeof(decimal))
            {
                nuevoCampo.Tipo_Dato = "FLO";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "S";
            }

            else
            {
                nuevoCampo.Tipo_Dato = "VAR";
                nuevoCampo.Tipo_Constraint = "NIN";
                nuevoCampo.Filtro = "S";
                revision = false;
            }

            lstNuevosCampos.Add(nuevoCampo);
            revisionExitosa[indice] = revision;
        }
        return lstNuevosCampos;
    }

    private DataColumnCollection GetObjetoDesdeXsd(string nombreObjeto)
    {
        return DataDocumentXsd.Tables[nombreObjeto].Columns;
    }

    protected void btnInsertGrid_Click(object sender, EventArgs e)
    {
        string Id = string.Empty;
        BO_Dic_Campo boDicCampo = new BO_Dic_Campo();
        foreach (GridViewRow gvRow in grvCamposNuevos.Rows)
        {
            string nombre = ((Label)gvRow.FindControl("Nombre")).Text;
            string tipo_Dato = ((DropDownList)gvRow.FindControl("Tipo_Dato")).SelectedValue;
            string tipo_Constraint = ((DropDownList)gvRow.FindControl("Tipo_Constraint")).SelectedValue;
            string filtro = ((DropDownList)gvRow.FindControl("Filtro")).SelectedValue;
            Dic_Campo dicCampo = new Dic_Campo();
            dicCampo.Nombre = nombre;
            dicCampo.Tipo_Dato = tipo_Dato;
            dicCampo.Tipo_Constraint = tipo_Constraint;
            dicCampo.Filtro = filtro;
            dicCampo.Dic_Objeto_Id = ddlDicObjeto.SelectedValue;
            if (Session["Scope"] == null)
                Response.Redirect("~/PAS/PAR_ACCESO.aspx");
            Scope s = (Scope)Session["Scope"];
            Id = boDicCampo.Insert(s, dicCampo);
        }
        if (!string.IsNullOrEmpty(Id))
        {
            string mensaje = "El Proceso de Inserción se realizo con EXITO!!";
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "err_msg", "alert('" + mensaje + "');", true);
            }
        }
        RefrescarInterza();
    }

    
    private void LlenarDropDownListObjetos()
    {
        ddlDicObjeto.Items.Clear();
        ddlDicObjeto.DataSource = DataDocumentXsd.Tables;
        ddlDicObjeto.DataBind();
    }

    private Dic_Objeto ConsultarObjetoPorNombre(string nombreDicObjeto)
    {
        FEL.DIC.BO_Dic_Objeto boDicObjeto = new BO_Dic_Objeto();
        try
        {
            List<Dic_Objeto> lstDicObjeto = boDicObjeto.GetByNombre("", (Scope)Session["Scope"], nombreDicObjeto);
            return (lstDicObjeto.Count == 1) ? lstDicObjeto[0] : null;
        }
        catch
        {
            return null;
        }
    }

    private void btnFicheroXsd_Click(object sender, EventArgs e)
    {
        if (fulFicheroXsd.HasFile)
        {
            DataDocumentXsd = new DataSet();
            DataDocumentXsd.ReadXmlSchema(fulFicheroXsd.PostedFile.InputStream);
            LlenarDropDownListObjetos();
            RefrescarInterza();
        }
    }

    private void RefrescarInterza()
    {
        VerificarObjeto();
        CargarGridView(ddlDicObjeto.SelectedItem.Text);
    }

    private void CargarGridView(string nombreDicObjeto)
    {
        bool[] revisar;
        grvCamposNuevos.DataSource = GetCamposDesdeXsd(nombreDicObjeto, out revisar);
        grvCamposNuevos.DataBind();
        for (int i = 0; i < grvCamposNuevos.Rows.Count; i++)
        {
            if (!revisar[i])
            {
                grvCamposNuevos.Rows[i].BackColor = Color.IndianRed;
                ((DropDownList)grvCamposNuevos.Rows[i].FindControl("Tipo_Constraint")).BackColor = Color.IndianRed;
                ((DropDownList)grvCamposNuevos.Rows[i].FindControl("Tipo_Dato")).BackColor = Color.IndianRed;
                ((DropDownList)grvCamposNuevos.Rows[i].FindControl("Filtro")).BackColor = Color.IndianRed;
            }
        }
    }
}