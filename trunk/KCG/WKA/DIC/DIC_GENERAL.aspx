<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_GENERAL.aspx.cs" 
    Inherits="DIC_DIC_GENERAL"
    meta:resourcekey="Tit_Dic_GeneralRecursoKCG"
    Theme="EstiloKCG"    
    StylesheetTheme="EstiloKCG"%>

<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>
    
 <%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlDatos">                
                <asp:FormView 
                    ID="fvdicgeneral" 
                    runat="server" 
                    DataSourceID="odsdicgeneral" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server"                                         
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    Readonly="true"                                                                                 
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                                                                          
                              </asp:Label>  
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                      
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox> 
                                <asp:RequiredFieldValidator 
                                    runat="server"
                                    ValidationGroup="U" 
                                    ID="rvNombre"
                                    ControlToValidate="Nombre"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server"  
                                    ID="arvGeneral"
                                    TargetControlID="rvNombre" />                                       
                            </td>    
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>                                                                                                                                  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList 
                                    ID="Tipo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'
                                    DataSourceID="odstipo" 
                                    DataTextField="Nombre"
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Tipo") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odstipo" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="DIC_GENERAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="TIPO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                                                  
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldominio" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DominioRecursoKCG.Text").ToString() %>'>                                      
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList 
                                    ID="Dominio" 
                                    runat="server"                                         
                                    DataSourceID="odsdominio" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("DominioRecursoKCG.ToolTip").ToString() %>'                                        
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Dominio") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsdominio" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="DIC_GENERAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="DOMINIO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                                                                                     
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblorden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox> 
                                <asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator2" 
                                            runat="server" 
                                            ControlToValidate="Orden"
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="ValidatorCalloutExtender7"
                                            TargetControlID="RequiredFieldValidator2" />
                                <asp:CompareValidator 
                                            ID="CompareValidator2" 
                                            runat="server" 
                                            Operator="GreaterThan"
                                            Type="Integer" 
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                            ValueToCompare="0"
                                            ControlToValidate="Orden">
                                </asp:CompareValidator>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server"  
                                            ID="ValidatorCalloutExtender8"
                                            TargetControlID="CompareValidator2" />                                                                     
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                      
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox> 
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox> 
                                <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvdiccodigo"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender5"
                                    TargetControlID="rvdiccodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvdicnombre"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender6"
                                    TargetControlID="rvdicnombre"/>
                            </td>                              
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooltips" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox> 
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolcodigo"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvtoolcodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolnombre"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="rvtoolnombre"/> 
                            </td>            
                        </tr>
                        <tr align="left">
                            <td colspan="2" >
                                 <asp:Button 
                                    ID="UpdateButton" 
                                    runat="server"
                                    ValidationGroup="I" 
                                    CausesValidation="True" 
                                    CommandName="Update"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>
                                 <asp:Button 
                                    ID="UpdateCancelButton" 
                                    runat="server"
                                    CausesValidation="False" 
                                    CommandName="Cancel"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>
                              <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                            </td>
                        </tr>                            
                    </table>                          
                    <%--Id's--%>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Ver_Version_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Ver_Version_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                        
                        <asp:TextBox 
                            ID="Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Tool_Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tool_Ver_Version_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Nombre1" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre1") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Codigo") %>'>
                        </asp:TextBox>    
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server"  
                                    visible="false"                                                                              
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    Readonly="true" 
                                    Visible="false"                                          
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                                                                                                                       
                              </asp:Label>  
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                      
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox> 
                                <asp:RequiredFieldValidator 
                                    ID="rqvNombre"
                                    runat="server" 
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="caValidator"
                                    TargetControlID="rqvNombre"/>                                                                         
                               
                            </td>    
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList 
                                    ID="Tipo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'
                                    DataSourceID="odstipo" 
                                    DataTextField="Nombre"
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Tipo") %>'>
                                </asp:DropDownList>                                       
                                <asp:ObjectDataSource 
                                    ID="odstipo" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="DIC_GENERAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="TIPO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                                                  
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldominio" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DominioRecursoKCG.Text").ToString() %>'>   
                                </asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList 
                                    ID="Dominio" 
                                    runat="server"                                         
                                    DataSourceID="odsdominio" 
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("DominioRecursoKCG.ToolTip").ToString() %>' 
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Dominio") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsdominio" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="DIC_GENERAL" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="DOMINIO" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                                                                                     
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblorden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox> 
                                <asp:RequiredFieldValidator 
                                            ID="RequiredFieldValidator2" 
                                            runat="server" 
                                            ControlToValidate="Orden"
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="ValidatorCalloutExtender7"
                                            TargetControlID="RequiredFieldValidator2" />
                                <asp:CompareValidator 
                                            ID="CompareValidator2" 
                                            runat="server" 
                                            Operator="GreaterThan"
                                            Type="Integer" 
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                            ValueToCompare="0"
                                            ControlToValidate="Orden">
                                </asp:CompareValidator>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server"  
                                            ID="ValidatorCalloutExtender8"
                                            TargetControlID="CompareValidator2" /> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                      
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>                                    
                                <asp:Button 
                                  ID="Button2" 
                                  runat="server" 
                                  CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                  CommandName="Zoom" 
                                  Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvdiccodigo"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="rvdiccodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvdicnombre"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="rvdicnombre"/> 
                            </td>                              
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooltips" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'                                                                          
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>                                                                                                      
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolcodigo"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvtoolcodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolnombre"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="rvtoolnombre"/>  
                            </td>            
                        </tr>                            
                    </table>
                    <table>   
                        <tr align="left">
                            <td colspan="2">
                                <asp:Button 
                                    ID="InsertButton" 
                                    runat="server" 
                                    CausesValidation="True" 
                                    CommandName="Insert"
                                    ValidationGroup="I"
                                    AccessKey="I"
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <asp:Button 
                                        ID="InsertCancelButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey="C"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                            </td>
                        </tr>
                    </table> 
                        
                        <%--Id's--%>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Ver_Version_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Ver_Version_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                        
                        <asp:TextBox 
                            ID="Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Tool_Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tool_Ver_Version_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Nombre1" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre1") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Codigo") %>'>
                        </asp:TextBox> 
                    </InsertItemTemplate>
                    <ItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server"                                         
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"                                        
                                    Readonly="true"                                                                                  
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                             
                              </asp:Label>  
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"  
                                    Readonly="true"
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                     
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>                                     
                            </td>    
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblTipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo" 
                                    runat="server" 
                                    Readonly="true" 
                                    ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'                                      
                                    Text='<%# Bind("Tipo") %>'>
                                </asp:TextBox>                    
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldominio" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("DominioRecursoKCG.Text").ToString() %>'>   
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dominio" 
                                    runat="server" 
                                    Readonly="true" 
                                    ToolTip='<%# GetLocalResourceObject("DominioRecursoKCG.ToolTip").ToString() %>'                                       
                                    Text='<%# Bind("Dominio") %>'>
                                </asp:TextBox>                                                       
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblorden" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Orden" 
                                    runat="server"
                                    Readonly="true"
                                    ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Orden") %>'>
                                </asp:TextBox>                                                                      
                            </td>                                
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>  
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server"
                                    Readonly="true" 
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    Readonly="true"   
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'                                    
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Id;"
                                    CommandName="Zoom" 
                                    Text="..." />
                            </td>                              
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooltips" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                        
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server"  
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'                                       
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>  
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'                                                                                                                  
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button1" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Id; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                            </td>            
                        </tr>
                        <tr align="left">
                            <td colspan="2">
                               <asp:Button 
                                    ID="EditButton" 
                                    runat="server"
                                    CausesValidation="False" 
                                    CommandName="Edit"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                               </asp:Button>
                               <asp:Button 
                                    ID="DeleteButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="Delete"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                               </asp:Button>
                               <asp:Button 
                                    ID="NewButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="New"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                               </asp:Button>
                               <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                            </td>
                        </tr>                                
                    </table> 
                     <%--Id's--%>
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Ver_Version_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Ver_Version_Id") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server" 
                            style="display:none"
                            Visible="true"
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                        
                        <asp:TextBox 
                            ID="Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre") %>'>
                        </asp:TextBox>                            
                        <asp:TextBox 
                            ID="Tool_Ver_Version_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tool_Ver_Version_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Nombre1" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Nombre1") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Tipo_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ver_Version_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Ver_Version_Codigo") %>'>
                        </asp:TextBox>    
                    </ItemTemplate>
                </asp:FormView>
                <koala:KNavegacion ID="nav"
                            runat="server"
                            GridViewID="gvdicgeneral"
                            FormViewID="FormView1" OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate>
           <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="gvdicgeneral" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
    </asp:UpdatePanel>     
    <asp:ObjectDataSource 
        ID="odsdicgeneral" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_General"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
                Visible="False" />
        </ContentTemplate> 
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="DIC_GENERAL" 
            Objeto="DIC_GENERAL" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsgvdicgeneral" />
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Dic_PantallaRecursoKCG">                
                <koala:KGrid  
                ID="gvdicgeneral" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id"
                DataSourceID="odsgvdicgeneral">
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <SelectedRowStyle CssClass="selectedrowstyle" />
                <Columns>
                    <asp:CommandField 
                        ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG" 
                        SortExpression="Codigo_int" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" />
                    <asp:BoundField 
                        DataField="Tipo" 
                        meta:resourcekey="BoundTipoRecursoKCG" 
                        SortExpression="Tipo" />
                    <asp:BoundField 
                        DataField="Dominio" 
                        meta:resourcekey="BoundDominioRecursoKCG" 
                        SortExpression="Dominio" />
                    <asp:BoundField 
                        DataField="Orden" 
                        meta:resourcekey="BoundOrdenRecursoKCG" 
                        SortExpression="Orden" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_nombre" 
                        meta:resourcekey="BoundDic_Rotulo_NombreRecursoKCG" 
                        SortExpression="Dic_Rotulo_nombre" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_nombre" 
                        meta:resourcekey="BoundTool_Dic_Rotulo_NombreRecursoKCG" 
                        SortExpression="Tool_Dic_Rotulo_nombre" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_Id" 
                        HeaderText="Tool_Dic_Rotulo_Id" 
                        SortExpression="Tool_Dic_Rotulo_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Ver_Version_Id" 
                        HeaderText="Ver_Version_Id" 
                        SortExpression="Ver_Version_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Ver_Version_Nombre" 
                        HeaderText="Ver_Version_Nombre" 
                        SortExpression="Ver_Version_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tool_Ver_Version_Nombre" 
                        HeaderText="Tool_Ver_Version_Nombre"
                        SortExpression="Tool_Ver_Version_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Ver_Version_Nombre1" 
                        HeaderText="Ver_Version_Nombre1"
                        SortExpression="Ver_Version_Nombre1" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tool_Dic_Rotulo_Codigo" 
                        HeaderText="Tool_Dic_Rotulo_Codigo"
                        SortExpression="Tool_Dic_Rotulo_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_Codigo" 
                        HeaderText="Dic_Rotulo_Codigo" 
                        SortExpression="Dic_Rotulo_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Rotulo_Id" 
                        HeaderText="Dic_Rotulo_Id" 
                        SortExpression="Dic_Rotulo_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tipo_Nombre" 
                        HeaderText="Tipo_Nombre" 
                        SortExpression="Tipo_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Ver_Version_Codigo" 
                        HeaderText="Ver_Version_Codigo" 
                        SortExpression="Ver_Version_Codigo"
                        Visible="False" />
                </Columns>
            </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvdicgeneral" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_General">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>

