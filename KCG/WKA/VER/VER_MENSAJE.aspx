<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="VER_MENSAJE.aspx.cs" 
    Inherits="VER_VER_MENSAJE" 
    meta:resourcekey="Tit_Ver_MensajeRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>
 
 <%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc2" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar" 
    TagPrefix="uc1" %>

<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
        <asp:Panel 
            runat="server"
            id="pnlDatos"
            meta:resourcekey="Rec_Ver_MensajeRecursoKCG">
                        <asp:FormView ID="fvVerMensaje" runat="server" DataSourceID="odsFvVerMensaje" DefaultMode="Insert">
                            <EditItemTemplate>
                                <table>
                                    <tr align="left">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                CssClass="TEXTO_EDICION_KCG"
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Codigo") %>'>
                                             </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="par_mensaje_codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                CssClass="TEXTO_EDICION_KCG"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="par_mensaje_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                Text='<%# Bind("par_mensaje_nombre") %>'>
                                            </asp:TextBox>    
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigoMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                             <asp:TextBox 
                                                ID="par_mensaje_codigo_mensaje" 
                                                runat="server"
                                                 ReadOnly="true"
                                                 CssClass="TEXTO_EDICION_KCG"  
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo_mensaje") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblVersion" 
                                                runat="server"
                                                Text='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="ver_version_codigo" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"
                                                CssClass="TEXTO_EDICION_KCG"  
                                                Text='<%# Bind("ver_version_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="ver_version_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"
                                                CssClass="TEXTO_EDICION_KCG"  
                                                Text='<%# Bind("ver_version_nombre") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="Label4" 
                                                runat="server" 
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
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                                        ControlToValidate="Nombre"
                                                        ValidationGroup="I"
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="Server" ID="ValidatorCalloutExtender2"
                                                        TargetControlID="RequiredFieldValidator2" /> 
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
                                                    <uc1:wucMensajeActualizar 
                                                        ID="WucMensajeActualizar1" 
                                                        runat="server" />
                                                     
                                    </td>
                                </tr>
                                </table>
                                <asp:TextBox 
                                    ID="Ver_Version_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true"
                                    Text='<%# Bind("Ver_Version_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Par_Mensaje_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true" 
                                    Text='<%# Bind("Par_Mensaje_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Estado" 
                                    Visible="false"
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Campo_Nombre" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <table>
                                    <tr align="left">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Codigo") %>'>
                                             </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="par_mensaje_codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="par_mensaje_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true" 
                                                Text='<%# Bind("par_mensaje_nombre") %>'>
                                            </asp:TextBox>    
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigoMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                             <asp:TextBox 
                                                ID="par_mensaje_codigo_mensaje" 
                                                runat="server"
                                                 ReadOnly="true"  
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo_mensaje") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblVersion" 
                                                runat="server"
                                                Text='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="ver_version_codigo" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"  
                                                Text='<%# Bind("ver_version_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="ver_version_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"  
                                                Text='<%# Bind("ver_version_nombre") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="Label4" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Nombre" 
                                                runat="server" 
                                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"
                                                Text='<%# Bind("Nombre") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    
                                </table>
                                <asp:TextBox 
                                    ID="Ver_Version_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true"
                                    Text='<%# Bind("Ver_Version_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Par_Mensaje_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true" 
                                    Text='<%# Bind("Par_Mensaje_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Estado" 
                                    Visible="false"
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Campo_Nombre" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>
                                
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table>
                                    <tr align="left">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Codigo") %>'>
                                             </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="par_mensaje_codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="par_mensaje_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true" 
                                                Text='<%# Bind("par_mensaje_nombre") %>'>
                                            </asp:TextBox>    
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblCodigoMensaje" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                             <asp:TextBox 
                                                ID="par_mensaje_codigo_mensaje" 
                                                runat="server"
                                                 ReadOnly="true"  
                                                ToolTip='<%# GetLocalResourceObject("Par_Mensaje_Codigo_MensajeRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("par_mensaje_codigo_mensaje") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="lblVersion" 
                                                runat="server"
                                                Text='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="ver_version_codigo" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"  
                                                Text='<%# Bind("ver_version_codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="ver_version_nombre" 
                                                runat="server"
                                                ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"  
                                                Text='<%# Bind("ver_version_nombre") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                     <tr align="left">
                                        <td>
                                             <asp:Label 
                                                ID="Label4" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Nombre" 
                                                runat="server" 
                                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                                ReadOnly="true"
                                                Text='<%# Bind("Nombre") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
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
                                                        
                        
                                        </td>
                                   </tr>
                                </table>
                                <asp:TextBox 
                                    ID="Ver_Version_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true"
                                    Text='<%# Bind("Ver_Version_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Par_Mensaje_Id" 
                                    runat="server"
                                    Style="visibility:hidden" 
                                    Visible="true" 
                                    Text='<%# Bind("Par_Mensaje_Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Estado" 
                                    Visible="false"
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Id" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Campo_Nombre" 
                                    runat="server"
                                     Visible="false" 
                                    Text='<%# Bind("Campo_Nombre") %>'>
                                </asp:TextBox>
                                
                            </ItemTemplate>
                        </asp:FormView>
               <koala:KNavegacion ID="nav"
                            runat="server"
                            GridViewID="gvVerMensaje"
                            FormViewID="FormView1" OnNavegar="nav_Siguiente" />
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvVerMensaje" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsFvVerMensaje" 
            runat="server" 
            ConflictDetection="CompareAllValues"
            OldValuesParameterFormatString="original{0}" 
            SelectMethod="GetById" 
            SortParameterName="sortExpression"
            TypeName="FEL.VER.BO_Ver_Mensaje" 
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
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro ID="kftFiltro" 
                runat="server" 
                Contenedor="VER_MENSAJE" 
                Objeto="VER_MENSAJE" 
                IndiceScope ="Scope"
                Orden="1" ObjectDataSourceID="odsGvVerMensaje"/>
         <asp:Panel 
            runat="server"
            Id="pnlGv"
            meta:resourcekey="Rec_Listado_Ver_MensajeRecursoKCG">
            <koala:KGrid
                ID="gvVerMensaje" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                DataSourceID="odsGvVerMensaje" DataKeyNames="Id">
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
                            SortExpression="Codigo_int" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="par_mensaje_nombre" 
                            meta:resourcekey="BoundPar_Mensaje_NombreRecursoKCG"
                            SortExpression="par_mensaje_nombre" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="par_mensaje_codigo_mensaje" 
                            meta:resourcekey="BoundPar_Mensaje_Codigo_MensajeRecursoKCG"
                            SortExpression="par_mensaje_codigo_mensaje" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="ver_version_nombre" 
                            meta:resourcekey="BoundVer_Version_NombreRecursoKCG"
                            SortExpression="ver_version_nombre" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado_nombre" 
                            HeaderText="Estado_nombre" 
                            SortExpression="Estado_nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="ver_version_codigo" 
                            HeaderText="ver_version_codigo" 
                            SortExpression="ver_version_codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Par_Mensaje_Id" 
                            HeaderText="Par_Mensaje_Id" 
                            SortExpression="Par_Mensaje_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ver_Version_Id" 
                            HeaderText="Ver_Version_Id" 
                            SortExpression="Ver_Version_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Campo_Nombre" 
                            HeaderText="Campo_Nombre" 
                            SortExpression="Campo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="par_mensaje_codigo" 
                            HeaderText="par_mensaje_codigo" 
                            SortExpression="par_mensaje_codigo" 
                            Visible="False" />
                    </Columns>
    </koala:KGrid>
        </asp:Panel>       
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsGvVerMensaje" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" TypeName="FEL.VER.BO_Ver_Mensaje">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

