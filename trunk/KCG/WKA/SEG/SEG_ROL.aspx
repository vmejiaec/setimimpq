<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_ROL.aspx.cs" 
    Inherits="SEG_ROL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Seg_RolRecursoKCG" %>
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<%@ 
    Register 
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
                                ID="pnlPrincipal"
                                meta:resourcekey="Rec_Seg_RolRecursoKCG">
                            <asp:FormView 
                                ID="fvSegRol" 
                                runat="server" 
                                DataSourceID="odsFvSegRol" 
                                DefaultMode="Insert">
                                        <EditItemTemplate>
                                             <table>
                                                <tr align="right">
                                                    <td colspan="3">
                                                        <asp:Label 
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
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
                                                    <td  colspan="2">
                                                        <asp:TextBox 
                                                            ID="Codigo"
                                                            ReadOnly="true"
                                                            TabIndex="-1"
                                                            runat="server" 
                                                            Text='<%# Bind("Codigo") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblNombre" 
                                                            runat="server"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
                                                            AssociatedControlID="Nombre"
                                                            meta:resourcekey="NombreRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td  colspan="2">
                                                       <asp:TextBox 
                                                            ID="Nombre" 
                                                            runat="server"
                                                            Width="400px"
                                                            CssClass="TEXTO_EDICION_KCG"  
                                                            Text='<%# Bind("Nombre") %>'>
                                                        </asp:TextBox>
                                                         <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="UsuarioReq"
                                                                ControlToValidate="Nombre"
                                                                ValidationGroup="A"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" 
                                                                ID="UsuarioReqE"
                                                                TargetControlID="UsuarioReq" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblDescripcion" 
                                                            runat="server" 
                                                            meta:resourcekey="DescripcionRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td  colspan="2">
                                                        <asp:TextBox 
                                                            ID="Descripcion" 
                                                            runat="server"
                                                            CssClass="TEXTO_EDICION_KCG" 
                                                            MaxLength="2000"
                                                            Width="400px" 
                                                            TextMode="MultiLine"
                                                            Text='<%# Bind("Descripcion") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr >
                                                    <td align="left" colspan="2">
                                                        <asp:Button 
                                                                ID="UpdateButton" 
                                                                runat="server"
                                                                ValidationGroup="A" 
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
                                                        <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                                   </td>
                                                   
                                                </tr>
                                            </table>
                                            <asp:Label 
                                                   ID="lblEstado" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Estado:">
                                            </asp:Label>
                                            <asp:TextBox 
                                                ID="Estado" 
                                                runat="server"
                                                Visible="false" 
                                                Text='<%# Bind("Estado") %>'>
                                            </asp:TextBox>
                                              <asp:Label 
                                                   ID="Label1" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Id:">
                                            </asp:Label>
                                            
                                            <asp:TextBox 
                                                    ID="Id" 
                                                    style="display:none" 
                                                    runat="server" 
                                                    Text='<%# Bind("Id") %>'>
                                            </asp:TextBox>
                                            
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <table>
                                                <tr align="right">
                                                    <td colspan="2">
                                                        <asp:Label 
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
                                                        </asp:Label> 
                                                    </td>
                                                    
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblCodigo" 
                                                            runat="server" 
                                                            meta:resourcekey="CodigoRecursoKCG"
                                                            Visible="false">
                                                         </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox 
                                                            ID="Codigo"
                                                            Visible="false"
                                                            CssClass="TEXTO_EDICION_KCG" 
                                                            runat="server" 
                                                            Text='<%# Bind("Codigo") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblNombre" 
                                                            runat="server"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                            AssociatedControlID="Nombre" 
                                                            meta:resourcekey="NombreRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td>
                                                       <asp:TextBox 
                                                            ID="Nombre" 
                                                            runat="server"
                                                            Width="400px"
                                                            CssClass="TEXTO_EDICION_KCG"  
                                                            Text='<%# Bind("Nombre") %>'>
                                                        </asp:TextBox>
                                                         <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="UsuarioReq"
                                                                ControlToValidate="Nombre"
                                                                ValidationGroup="A"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" 
                                                                ID="UsuarioReqE"
                                                                TargetControlID="UsuarioReq" />
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblDescripcion" 
                                                            runat="server" 
                                                            meta:resourcekey="DescripcionRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox 
                                                            ID="Descripcion" 
                                                            runat="server"
                                                            CssClass="TEXTO_EDICION_KCG" 
                                                            MaxLength="2000"
                                                            Width="400px" 
                                                            TextMode="MultiLine"
                                                            Text='<%# Bind("Descripcion") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr >
                                                    <td align="left" colspan="2">
                                                        <asp:Button 
                                                            ID="InsertButton" 
                                                            runat="server" 
                                                            CausesValidation="True" 
                                                            CommandName="Insert"
                                                            ValidationGroup="A"
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
                                            <asp:Label 
                                                   ID="lblEstado" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Estado:">
                                            </asp:Label>
                                            <asp:TextBox 
                                                ID="Estado" 
                                                runat="server"
                                                Visible="false" 
                                                Text='<%# Bind("Estado") %>'>
                                            </asp:TextBox>
                                              <asp:Label 
                                                   ID="Label1" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Id:">
                                            </asp:Label>
                                            <asp:TextBox 
                                                    ID="Id" 
                                                    style="display:none" 
                                                    runat="server" 
                                                    Text='<%# Bind("Id") %>'>
                                            </asp:TextBox>
                                           
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                             <table>
                                                <tr align="right">
                                                    <td colspan="3">
                                                        <asp:Label 
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
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
                                                    <td  colspan="2">
                                                        <asp:TextBox 
                                                            ID="Codigo"
                                                            ReadOnly="true"
                                                            TabIndex="-1"
                                                            runat="server" 
                                                            Text='<%# Bind("Codigo") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblNombre" 
                                                            runat="server" 
                                                            meta:resourcekey="NombreRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td  colspan="2" >
                                                       <asp:TextBox 
                                                            ID="Nombre" 
                                                            runat="server"
                                                            ReadOnly="true"
                                                            TabIndex="-1"
                                                            Width="400px"
                                                            Text='<%# Bind("Nombre") %>'>
                                                        </asp:TextBox>
                                                        
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td>
                                                        <asp:Label 
                                                            ID="lblDescripcion" 
                                                            runat="server" 
                                                            meta:resourcekey="DescripcionRecursoKCG">
                                                         </asp:Label>
                                                    </td>
                                                    <td  colspan="2" >
                                                        <asp:TextBox 
                                                            ID="Descripcion" 
                                                            runat="server"
                                                            ReadOnly="true"
                                                            TabIndex="-1"
                                                            MaxLength="2000"
                                                            Width="400px" 
                                                            TextMode="MultiLine"
                                                            CssClass="TEXTO_LECTURA_KCG" 
                                                            Text='<%# Bind("Descripcion") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr >
                                                    <td align="left" colspan="2" >
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
                                                        <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                                   </td>
                                                   
                                                </tr>
                                            </table>
                                            <asp:Label 
                                                   ID="lblEstado" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Estado:">
                                            </asp:Label>
                                            <asp:TextBox 
                                                ID="Estado" 
                                                runat="server"
                                                Visible="false" 
                                                Text='<%# Bind("Estado") %>'>
                                            </asp:TextBox>
                                              <asp:Label 
                                                   ID="Label1" 
                                                   runat="server" 
                                                   Visible="false"
                                                   Text="Id:">
                                            </asp:Label>
                                            <asp:TextBox 
                                                    ID="Id" 
                                                    style="display:none" 
                                                    runat="server" 
                                                    Text='<%# Bind("Id") %>'>
                                            </asp:TextBox>
                                        </ItemTemplate>
                            </asp:FormView>
                            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvSegRol" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsFvSegRol" 
            runat="server" 
            DeleteMethod="Delete" 
            InsertMethod="Insert"
            OldValuesParameterFormatString="original{0}" 
            SelectMethod="GetById" 
            SortParameterName="sortExpression"
            TypeName="FEL.SEG.BO_Seg_Rol" 
            UpdateMethod="Update" ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Id" 
                Type="String" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="s" Type="Object" />
            <asp:Parameter Name="o" Type="Object" />
        </DeleteParameters>
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
                    <koala:KNavegacion ID="nav"
                        runat="server"
                        GridViewID="gvSegRol"
                        FormViewID="FormView1" OnNavegar="nav_Siguiente" />  
                </td>
                <td>
                    <koala:KFiltro ID="kftFiltro" 
                        runat="server" 
                        Contenedor="SEG_ROL" 
                        Objeto="SEG_ROL" 
                        IndiceScope ="Scope"
                        Orden="1" ObjectDataSourceID="odsGvSegRol"/>
                </td>
            </tr>
        </table>
        
        
           <asp:Panel 
                runat="server" 
                ID="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Seg_RolRecursoKCG">
            <koala:KGrid
                ID="gvSegRol" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"                
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                DataKeyNames="Id" 
                DataSourceID="odsGvSegRol" >
                                               
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
                DataField="Nombre" 
                meta:resourcekey="BoundNombreRecursoKCG" 
                SortExpression="Nombre" >
                <ItemStyle wrap="true" width="60mm" />
            </asp:BoundField>
            <asp:BoundField 
                DataField="Descripcion" 
                meta:resourcekey="BoundDescripcionRecursoKCG"  
                SortExpression="Descripcion" >
                <ItemStyle wrap="true" width="80mm" />
            </asp:BoundField>
            <asp:BoundField 
                DataField="Estado" 
                HeaderText="Estado" 
                SortExpression="Estado" 
                Visible="False" />
            <asp:BoundField 
                DataField="Id" 
                HeaderText="Id" 
                SortExpression="Id" 
                Visible="False" />
            <asp:BoundField 
                DataField="Estado_Nombre" 
                HeaderText="Estado_Nombre" 
                SortExpression="Estado_Nombre" 
                Visible="False" />
        </Columns>
            </koala:KGrid>
           </asp:Panel> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGvSegRol" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.SEG.BO_Seg_Rol">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
</asp:Content>

