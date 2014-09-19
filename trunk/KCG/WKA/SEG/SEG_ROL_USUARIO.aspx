<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_ROL_USUARIO.aspx.cs" 
    Inherits="SEG_SEG_ROL_USUARIO" 
    Title="Untitled Page"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Seg_Rol_UsuarioRecursoKCG" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc1" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
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
            <asp:panel 
                runat="server" 
                ID="pnldatos"
                meta:resourcekey="Rec_Seg_Rol_UsuarioRecursoKCG">
                <asp:FormView 
                    ID="fvSegRolUsuario" 
                    runat="server" 
                    DataSourceID="odsFVSegRolUsuario"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                         
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <table>
                            <tr align="right">
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
                                            Visible="false"
                                            meta:resourcekey="CodigoRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td >
                                        <asp:TextBox 
                                            ID="Codigo" 
                                            runat="server"                                                        
                                            Visible="false" 
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                    </td>
                            </tr>
                            <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblRol" 
                                            runat="server"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                            AssociatedControlID="Seg_Rol_Codigo" 
                                            meta:resourcekey="Seg_rol_NombreRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td >
                                        <asp:TextBox 
                                            ID="Seg_Rol_Codigo" 
                                            runat="server" 
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Seg_Rol_Nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                                        </asp:TextBox>
                                          <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/SEG/SEG_ROL.aspx; 
                                                        Filtro: Seg_Rol_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />                                                    
                                          <asp:RequiredFieldValidator 
                                                    runat="server" 
                                                    ID="RequiredFieldValidator1"
                                                    ControlToValidate="Seg_Rol_Nombre"
                                                    ValidationGroup="I"
                                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                    runat="Server" 
                                                    ID="ValidatorCalloutExtender1"
                                                    TargetControlID="RequiredFieldValidator1" />
                                    </td>
                            </tr>
                            <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblUsuario" 
                                            runat="server" 
                                            meta:resourcekey="Int_Usuario_nombreRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td >
                                        <asp:TextBox 
                                            ID="Int_usuario_codigo" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Text='<%# Bind("Int_usuario_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Int_usuario_nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("Int_usuario_nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                            ID="Button1" 
                                            runat="server" 
                                            CommandArgument="RutaDestino: ~/INT/INT_USUARIO.aspx; 
                                                            Filtro: Int_usuario_nombre;"
                                            CommandName="Zoom" 
                                            Text="..." />
                                         <asp:RequiredFieldValidator 
                                            runat="server" 
                                            ID="rfv_Int_usuario_nombre"
                                            ControlToValidate="Int_usuario_nombre"
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" 
                                            ID="vce_Int_usuario_nombre"
                                            TargetControlID="rfv_Int_usuario_nombre" />
                                          
                                    </td>
                            </tr>
                            <tr >
                                    <td align="left" colspan="2" >
                                       <asp:Button 
                                                ID="InsertButton" 
                                                runat="server" 
                                                CausesValidation="True" 
                                                CommandName="Insert"
                                                ValidationGroup="I"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                       <asp:Button 
                                                ID="InsertCancelButton" 
                                                runat="server" 
                                                CausesValidation="False" 
                                                CommandName="Cancel"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                       </asp:Button>
                                    </td>
                                    
                            </tr>
                        </table>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Id"                                         
                            style="display:none"
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Id") %>'>
                        </asp:TextBox>
                     
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"                                        
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                         
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Usuario_Id" 
                            style="display:none"
                            runat="server" 
                            Text='<%# Bind("Int_Usuario_Id") %>'>
                        </asp:TextBox>
                        
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                         <table>
                            <tr align="right">
                                    <td colspan="3">
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
                                            meta:resourcekey="CodigoRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox 
                                            ID="Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                    </td>
                            </tr>
                            <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblRol" 
                                            runat="server" 
                                            meta:resourcekey="Seg_rol_NombreRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox 
                                            ID="Seg_Rol_Codigo" 
                                            runat="server" 
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Seg_Rol_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Seg_Rol_Nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("Seg_Rol_Nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                            ID="Button3" 
                                            runat="server" 
                                            CommandArgument="RutaDestino: ~/SEG/SEG_ROL.aspx; Filtro: Seg_Rol_Id;"
                                            CommandName="Zoom" 
                                            Enabled="false"
                                            Text="..." />
                                        
                                    </td>
                            </tr>
                            <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblUsuario" 
                                            runat="server" 
                                            meta:resourcekey="Int_Usuario_nombreRecursoKCG">
                                        </asp:Label> 
                                    </td>
                                    <td colspan="2">
                                        <asp:TextBox 
                                            ID="Int_usuario_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Int_usuario_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Int_usuario_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("Int_usuario_nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                            ID="Button1" 
                                            runat="server" 
                                            CommandArgument="RutaDestino: ~/INT/INT_USUARIO.aspx; Filtro: Int_Usuario_Id;"
                                            CommandName="Zoom" 
                                            Enabled="false"
                                            Text="..." />
                                         
                                    </td>
                            </tr>
                            <tr >
                                    <td align="left" colspan="2" >                        
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
                                        <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                    </td>
                                    
                            </tr>
                        </table>
                        
                        <asp:TextBox 
                            ID="Seg_Rol_Id" 
                            style="display:none"
                            runat="server" 
                            Text='<%# Bind("Seg_Rol_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                                                          
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server"
                            style="display:none" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Usuario_Id" 
                            style="display:none"
                            runat="server" 
                            Text='<%# Bind("Int_Usuario_Id") %>'>
                        </asp:TextBox>                                    
                       
                    </ItemTemplate>
                </asp:FormView>
            </asp:panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvSegRolUsuario" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVSegRolUsuario" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.SEG.BO_Seg_Rol_Usuario"
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
            <table>
                <tr>                
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvSegRolUsuario"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />  
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="SEG_ROL_USUARIO" 
                            Objeto="SEG_ROL_USUARIO" 
                            IndiceScope ="Scope"
                            Orden="1" 
                            ObjectDataSourceID="odsGVSegrolUsuario"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="Btn_Seg_Rol_Usuario_Sucursal" 
                            runat="server" 
                            meta:resourcekey="Btn_Seg_Rol_Usuario_SucursalRecursoKCG" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
            runat="server"
            Id="pnldatosGrid"
            meta:resourcekey="Rec_Listado_Seg_Rol_UsuarioRecursoKCG">
                        <koala:KGrid 
                            ID="gvSegRolUsuario" 
                            runat="server" 
                            AllowPaging="True" 
                            AllowSorting="True"
                            AutoGenerateColumns="False" 
                            DataKeyNames="Id"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                            DataSourceID="odsGVSegrolUsuario">
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
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                            DataField="Seg_Rol_Nombre" 
                                            meta:resourcekey="BoundSeg_rol_NombreRecursoKCG"
                                            SortExpression="Seg_Rol_Nombre" >
                                        <ItemStyle width="80mm" wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                            DataField="Int_usuario_nombre" 
                                            meta:resourcekey="BoundInt_Usuario_nombreRecursoKCG" 
                                            SortExpression="Int_usuario_nombre" >
                                        <ItemStyle width="80mm" wrap="true" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                            DataField="Seg_Rol_Id" 
                                            HeaderText="Seg_Rol_Id" 
                                            SortExpression="Seg_Rol_Id" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Id" 
                                            HeaderText="Id" 
                                            SortExpression="Id" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Nombre" 
                                            HeaderText="Nombre" 
                                            SortExpression="Nombre" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Seg_Rol_Codigo" 
                                            HeaderText="Seg_Rol_Codigo" 
                                            SortExpression="Seg_Rol_Codigo" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Int_usuario_codigo" 
                                            HeaderText="Int_usuario_codigo" 
                                            SortExpression="Int_usuario_codigo" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Estado" 
                                            HeaderText="Estado" 
                                            SortExpression="Estado" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Estado_nombre" 
                                            HeaderText="Estado_nombre" 
                                            SortExpression="Estado_nombre" 
                                            Visible="False" />
                                    <asp:BoundField 
                                            DataField="Int_Usuario_Id" 
                                            HeaderText="Int_Usuario_Id" 
                                            SortExpression="Int_Usuario_Id" 
                                            Visible="False" />
                                </Columns>
                    </koala:KGrid >
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsGVSegrolUsuario" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="Get" 
            TypeName="FEL.SEG.BO_Seg_Rol_Usuario">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

