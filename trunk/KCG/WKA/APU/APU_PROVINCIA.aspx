<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROVINCIA.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_PROVINCIA" 
    meta:resourcekey="Tit_Apu_ProvinciaRecursoKCG" %>

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
    
 <%@ Register 
        tagprefix="koala" 
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
                ID="pnlfvApuProvincia"  
                meta:resourcekey="Rec_Apu_ProvinciaRecursoKCG">
                <asp:FormView 
                    ID="fvApuProvincia" 
                    runat="server" 
                    DataSourceID="odsFvApuProvincia"
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
                                        Visible="false"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' 
                                        ID="lblCodigo"                         
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        runat="server" 
                                        ReadOnly="true"  
                                        TabIndex="-1"                                  
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>            
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                        ID="lblNombre"                                     
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        runat="server"
                                        Width ="400px"
                                        Height="50px"
                                        TextMode ="MultiLine" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Style="text-transform:uppercase"  
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
                            style="display:none"  
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id"                          
                            runat="server" 
                            style="display:none" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>      
                        
                        <%--Ocultos--%>
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            visible="false"
                            runat="server" 
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            visible="false"
                            runat="server" 
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
                                        Visible="false"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' 
                                        ID="lblCodigo" 
                                        Visible="false"
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Visible="false"
                                        runat="server" 
                                        ReadOnly="true"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>            
                            </tr>
                            <tr>                        
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                        ID="lblNombre"                                     
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        runat="server"
                                        Width ="400px"
                                        Height="50px"
                                        TextMode ="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Style="text-transform:uppercase"  
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
                            style="display:none"  
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id"                          
                            runat="server" 
                            style="display:none" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>  
                        
                        <%--Ocultos--%>
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            visible="false"
                            runat="server" 
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            visible="false"
                            runat="server" 
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
                                        Visible="false"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label  
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>' 
                                        ID="lblCodigo" 
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                
                                        runat="server" 
                                        ReadOnly="true"   
                                        TabIndex="-1"                                
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>            
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                        ID="lblNombre"                                     
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        runat="server" 
                                        Width ="400px"
                                        Height="50px"
                                        TextMode ="MultiLine"
                                        CssClass ="TEXTO_LECTURA_KCG" 
                                        Style="text-transform:uppercase"
                                        ReadOnly="true"  
                                        TabIndex="-1"                    
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                    
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
                            style="display:none" 
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id"                          
                            runat="server" 
                            style="display:none" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>  
                        
                        <%--Ocultos--%>
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            Visible="false" 
                            runat="server" 
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            visible="false"
                            runat="server" 
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                    
                </asp:FormView>  
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvApuProvincia"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuProvincia" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFvApuProvincia" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Provincia"
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
                Contenedor="APU_PROVINCIA" 
                Objeto="APU_PROVINCIA" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsGvApuProvincia"/>
        <asp:Panel 
            runat="server" 
            ID="pnlgvApuProvincia" 
            meta:resourcekey="Rec_Listado_Apu_ProvinciaRecursoKCG">
    
            <koala:KGrid
                ID="gvApuProvincia" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False"
                DataKeyNames="Id" 
                DataSourceID="odsGvApuProvincia" 
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
                        <headerstyle wrap="False" />
                        <itemstyle wrap="False" horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" >
                        <headerstyle wrap="False" />
                        <itemstyle wrap="False" />
                    </asp:BoundField>
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
            ID="odsGvApuProvincia" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByEmpresa" 
            TypeName="FEL.APU.BO_Apu_Provincia">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>  
    
</asp:Content>

