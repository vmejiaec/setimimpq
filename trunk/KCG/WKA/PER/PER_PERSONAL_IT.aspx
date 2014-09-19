<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PER_PERSONAL_IT.aspx.cs" 
    Inherits="PER_PER_PERSONAL_IT"    
    meta:resourcekey="Tit_Per_Personal_ItRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

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
        runat="server">
        <ContentTemplate>
            <asp:FormView 
                ID="fvper_personal_it" 
                runat="server" 
                DataSourceID="odsfvper_personal_it"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel 
                        runat="server" 
                        ID="pnlDatos"
                        meta:resourcekey="Rec_Per_Personal_ItRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblCodigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblNombre"
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
                                        Width="400px"
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
                    
                    <%--ID's--%>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
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
                        runat="server" 
                        ID="pnlDatos"
                        meta:resourcekey="Rec_Per_Personal_ItRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblCodigo"
                                        runat="server"
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblNombre"
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
                                        Width="400px"
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
                    
                    <%--ID's--%>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
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
                        runat="server" 
                        ID="pnlDatos"
                        meta:resourcekey="Rec_Per_Personal_ItRecursoKCG">
                        <table>
                            <tr align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
                                    </asp:Label> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblCodigo"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblNombre"
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
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
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
                    
                    <%--ID's--%>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server"
                        style="display:none" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Coordinador_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Coordinador_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Tecnico_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tecnico_Costos_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Jefe_Costos_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Jefe_Costos_Nombre") %>'>
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
            </ContentTemplate>
            <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvper_personal_it" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
            <asp:ObjectDataSource 
                ID="odsfvper_personal_it" 
                runat="server" 
                ConflictDetection="CompareAllValues"
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.PER.BO_Per_Personal"
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
                        <koala:KNavegacion ID="nav"
                            runat="server"
                            GridViewID="gvper_personal_it"
                            FormViewID="FormView1" OnNavegar="nav_Siguiente" />       
                    </td>
                    <td>
                        <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="PER_PERSONAL_IT" 
                        Objeto="PER_PERSONAL" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvper_personal_it" />
                    </td>                                     
                </tr>
            </table>
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Per_Personal_ItRecursoKCG">                 
                <koala:KGrid  
                ID="gvper_personal_it" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id" 
                DataSourceID="odsgvper_personal_it">
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
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"
                        SortExpression="Nombre">
                        <ItemStyle Width="80mm" Wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Tecnico_Costos" 
                        HeaderText="Tecnico_Costos" 
                        SortExpression="Tecnico_Costos"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Coordinador" 
                        HeaderText="Coordinador" 
                        SortExpression="Coordinador"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Jefe_Costos" 
                        HeaderText="Jefe_Costos" 
                        SortExpression="Jefe_Costos"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_empresa_Codigo" 
                        HeaderText="Int_empresa_Codigo" 
                        SortExpression="Int_empresa_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Nombre" 
                        HeaderText="Int_Empresa_Nombre" 
                        SortExpression="Int_Empresa_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Coordinador_Nombre" 
                        HeaderText="Coordinador_Nombre" 
                        SortExpression="Coordinador_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tecnico_Costos_Nombre" 
                        HeaderText="Tecnico_Costos_Nombre"
                        SortExpression="Tecnico_Costos_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Jefe_Costos_Nombre" 
                        HeaderText="Jefe_Costos_Nombre" 
                        SortExpression="Jefe_Costos_Nombre"
                        Visible="False" />
                    <asp:BoundField DataField="estado_nombre" 
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
                ID="odsgvper_personal_it" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="Get" 
                TypeName="FEL.PER.BO_Per_Personal">
                <SelectParameters>
                    <asp:SessionParameter 
                        Name="s" 
                        SessionField="Scope" 
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
</asp:Content>

