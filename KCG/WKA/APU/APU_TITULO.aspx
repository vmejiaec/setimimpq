<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_TITULO.aspx.cs" 
    Inherits="APU_APU_TITULO" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_TituloRecursoKCG" %>
   
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
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlFormView"
                meta:resourcekey="Rec_Apu_TituloRecursoKCG">
                
                <asp:FormView 
                    ID="fvApuTitulo" 
                    runat="server" 
                    DataSourceID="odsFVApuTitulo" 
                    DefaultMode="Insert">
                    
                    <EditItemTemplate>
                         <table>
                            <tr>
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        runat="server"
                                        id="lblCodigo"
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
                                        runat="server"
                                        ID="lblNombre"                                        
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                    
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px"
                                        Height="50px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        TextMode="MultiLine"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UsuarioReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" ID="UsuarioReqE"
                                        TargetControlID="UsuarioReq" />
                                </td>
                            </tr>                        
                            <tr>
                                <td 
                                    colspan="2">
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
                        
                         <%--Ids--%>
                        
                        <asp:TextBox                              
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>                
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                             ID="Int_empresa_Codigo" 
                             runat="server" 
                             Visible="false"
                             Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td 
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        runat="server"
                                        ID="lblCodigo"
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true" 
                                        Visible="false"                                        
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                            
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        runat="server"
                                        ID="lblNombre"                                        
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                    
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Style="text-transform:uppercase"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UsuarioReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="UsuarioReqE"
                                        TargetControlID="UsuarioReq" />
                                </td>
                            </tr>                        
                            <tr>
                                <td 
                                    colspan="2">
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
                       
                        <%--Ids--%>
                        
                        <asp:TextBox                                                         
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>                
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                             ID="Int_empresa_Codigo" 
                             runat="server" 
                             Visible="false"
                             Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                       <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        runat="server"
                                        id="lblCodigo"
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
                                        runat="server"
                                        ID="lblNombre"                                        
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                    
                                    </asp:Label>
                                </td>
                                <td
                                    colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        TabIndex="-1"
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                
                                     <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="UsuarioReq"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="UsuarioReqE"
                                        TargetControlID="UsuarioReq" />
                                </td>
                            </tr>                        
                            <tr>
                                <td 
                                    colspan="3">
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
                                    <uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                       
                        <%--Ids--%>
                        
                        <asp:TextBox                              
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>                
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                             ID="Int_empresa_Codigo" 
                             runat="server" 
                             Visible="false"
                             Text='<%# Bind("Int_empresa_Codigo") %>'>
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
                    GridViewID="gvApuTitulo"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="gvApuTitulo" 
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsFVApuTitulo" 
        runat="server" 
        DeleteMethod="Delete" 
        InsertMethod="Insert"
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Titulo" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues" 
        SortParameterName="sortExpression">
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
                Text="Atras" 
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text="Seleccionar" 
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
                Contenedor="APU_TITULO" 
                Objeto="APU_TITULO" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsGVApuTitulo"/>
            <asp:Panel
                runat="server"
                ID="Rec_Listado_Apu_Titulo"
                meta:resourcekey="Rec_Listado_Apu_TituloRecursoKCG">
                
                <koala:KGrid 
                    ID="gvApuTitulo" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsGVApuTitulo" 
                    AllowSorting="True" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>                            
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
                            SortExpression="Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre" >
                            <itemstyle wrap="True" width="80mm"  />  
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id" 
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Int_Empresa_nombre" 
                            HeaderText="Int_Empresa_nombre" 
                            SortExpression="Int_Empresa_nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_empresa_Codigo" 
                            HeaderText="Int_empresa_Codigo" 
                            SortExpression="Int_empresa_Codigo" 
                            Visible="False" />
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
        ID="odsGVApuTitulo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.APU.BO_Apu_Titulo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

