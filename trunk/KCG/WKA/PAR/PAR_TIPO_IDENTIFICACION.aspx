<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_TIPO_IDENTIFICACION.aspx.cs" 
    Inherits="PAR_PAR_TIPO_IDENTIFICACION" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Par_Tipo_IdentificacionRecursoKCG" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

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

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server"
        UpdateMode="Conditional">        
        <ContentTemplate>
            <script type="text/javascript">
                function checkSelectedValueCedula()
                { 
                    var ddlCedula = $get("ctl00_ContentPlaceHolder1_fvpar_tipo_identificacion_ddlCedula");
                    var Cedula = $get("ctl00_ContentPlaceHolder1_fvpar_tipo_identificacion_Cedula");
                                    
                    Cedula.value = ddlCedula.options[ddlCedula.selectedIndex].value;
                }
            </script>
            <asp:FormView 
                ID="fvpar_tipo_identificacion" 
                runat="server" 
                DataSourceID="odsfvpar_tipo_identificacion"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Tipo_IdentificacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="TextBox1" 
                                        Width="145px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lblcedula" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CedulaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cedula" 
                                        runat="server"
                                        style="display:none"
                                        Text='<%# Bind("Cedula") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlCedula" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("CedulaRecursoKCG.ToolTip").ToString() %>' 
                                        DataSourceID="odsddlCedula" 
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Cedula_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddlCedula" 
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
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="Par_Tipo_Identificacion" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="Cedula" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblestadonombre" 
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>    
                                </td>                                  
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width ="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="RequiredFieldValidator2"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                   <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="RequiredFieldValidator2" />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblDescripcion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass = "TEXTO_EDICION_KCG" 
                                        Width ="400"
                                        Height="50px"
                                        TextMode="multiline"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
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
                    </asp:Panel> 
                    
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cedula_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Cedula_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                   
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Tipo_IdentificacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="TextBox1" 
                                        Width="144px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lblcedula" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CedulaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cedula" 
                                        runat="server"
                                        style="display:none"
                                        Text='<%# Bind("Cedula") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddlCedula" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("CedulaRecursoKCG.ToolTip").ToString() %>' 
                                        DataSourceID="odsddlCedula" 
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Cedula_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddlCedula" 
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
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="Par_Tipo_Identificacion" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="Cedula" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblestadonombre" 
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>    
                                </td>                                  
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width ="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="RequiredFieldValidator2"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                   <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="RequiredFieldValidator2" />  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblDescripcion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass = "TEXTO_EDICION_KCG" 
                                        Width ="400"
                                        Height="50px"
                                        TextMode="multiline"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
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
                    </asp:Panel> 
                    
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cedula_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Cedula_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                    
                </InsertItemTemplate>
                <ItemTemplate>  
                    <asp:Panel
                        id="Panel1"
                        runat="server"
                        meta:resourcekey="Rec_Par_Tipo_IdentificacionRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblcodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"  
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="TextBox1" 
                                        Width="162px"
                                        TabIndex="-1"
                                        BorderColor="white"
                                        BorderStyle="Solid"
                                        ReadOnly="true"
                                        runat="server"
                                        Text="">
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lblcedula" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CedulaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Cedula_Nombre" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="25px"
                                        ToolTip='<%# GetLocalResourceObject("CedulaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Cedula_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblestadonombre" 
                                        runat="server"
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label>
                                </td>                                  
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width ="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblDescripcion"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        CssClass = "TEXTO_LECTURA_KCG" 
                                        Width ="400"
                                        Height="50px"
                                        TextMode="multiline"
                                        ReadOnly="true"
                                        TabIndex="-1" 
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>
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
                    </asp:Panel> 
                    
                    <%--ID'S--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Cedula" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Cedula") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="estado_nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("estado_nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                    
                </ItemTemplate>
            </asp:FormView>            
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvpar_tipo_identificacion"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />                
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="PAR_TIPO_IDENTIFICACION" 
                Objeto="PAR_TIPO_IDENTIFICACION" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvpar_tipo_identificacion" />                         
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvpar_tipo_identificacion" 
                EventName="SelectedIndexChanged" />
        </Triggers>                       
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvpar_tipo_identificacion" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.PAR.BO_Par_Tipo_Identificacion"
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
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server"                 
                Visible="False" />
        </ContentTemplate> 
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel3" runat="server">
        <ContentTemplate>
                         
                <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Par_Tipo_Identificacion_ListadoRecursoKCG">                 
                <koala:KGrid
                ID="gvpar_tipo_identificacion" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id" 
                DataSourceID="odsgvpar_tipo_identificacion">
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
                        SortExpression="Codigo">
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre">
                        <ItemStyle Width="80mm" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Descripcion" 
                        meta:resourcekey="BoundDescripcionRecursoKCG" 
                        SortExpression="Descripcion">
                        <ItemStyle Width="80mm" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Codigo" 
                        HeaderText="Int_Empresa_Codigo" 
                        SortExpression="Int_Empresa_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Nombre" 
                        HeaderText="Int_Empresa_Nombre" 
                        SortExpression="Int_Empresa_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="estado_nombre" 
                        HeaderText="estado_nombre" 
                        SortExpression="estado_nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Codigo_int" 
                        HeaderText="Codigo_int" 
                        SortExpression="Codigo_int"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                 </Columns>
            </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel> 
    <asp:ObjectDataSource 
        ID="odsgvpar_tipo_identificacion" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.PAR.BO_Par_Tipo_Identificacion">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

