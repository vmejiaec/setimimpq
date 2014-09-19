<%@ Page 
    Language="C#" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_SERVIDOR.aspx.cs" 
    Inherits="PAR_PAR_SERVIDOR" 
    meta:resourcekey="Tit_Par_ServidorRecursoKCG"%>
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
            <asp:Panel 
                runat="server"
                Id="pnlDatos"
                meta:resourcekey="Rec_Par_ServidorRecursoKCG">
                <asp:FormView 
                    ID="fvParServidor" 
                    runat="server" 
                    DataSourceID="odsFVParServidor" 
                    DefaultMode="Insert">
                            <EditItemTemplate>
                               <table>
                                    <tr align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
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
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Codigo") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblNombre" 
                                                runat="server"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Nombre"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lbl_Ruta" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Ruta" 
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server"
                                                Width="400px"    
                                                ToolTip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'                                            
                                                Text='<%# Bind("Ruta") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="rfvRuta"
                                                ControlToValidate="Ruta"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="vceruta"
                                                TargetControlID="rfvRuta" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblDescripcion" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Descripcion" 
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server"
                                                TextMode="MultiLine"
                                                Width="400px"
                                                Height="50px" 
                                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Descripcion") %>'>
                                            </asp:TextBox>
                                            
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
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <asp:Button 
                                                ID="UpdateCancelButton" 
                                                runat="server"
                                                CausesValidation="False" 
                                                CommandName="Cancel"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <uc2:wucMensajeActualizar 
                                                ID="WucMensajeActualizar1" 
                                                runat="server" />
                                        </td>
                                    </tr>
                                    
                                </table>
                                
                                <%--id´s--%>
                                
                                <asp:TextBox 
                                    ID="Id" 
                                    Visible="true"
                                    style="display:none"
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--campos no visibles--%>  
                                                             
                                <asp:TextBox 
                                    ID="Estado"
                                    Visible="false" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <table>
                                    <tr align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server" 
                                                Visible="false"
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                           <asp:TextBox 
                                                ID="Codigo" 
                                                CssClass="TEXTO_EDICION_KCG"
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
                                                ID="lblNombre" 
                                                runat="server"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Nombre"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server" 
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lbl_Ruta" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Ruta" 
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server"
                                                Width="400px"    
                                                ToolTip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'                                            
                                                Text='<%# Bind("Ruta") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="rfvRuta"
                                                ControlToValidate="Ruta"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="vceruta"
                                                TargetControlID="rfvRuta" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblDescripcion" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Descripcion" 
                                                CssClass="TEXTO_EDICION_KCG" 
                                                runat="server"
                                                Width="400px" 
                                                Height="50px"
                                                TextMode="MultiLine"
                                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Descripcion") %>'>
                                            </asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                            <td align="left" colspan="2">
                                                <asp:Button 
                                                    ID="InsertButton" 
                                                    runat="server" 
                                                    CausesValidation="True" 
                                                    CommandName="Insert"
                                                    ValidationGroup="I"
                                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                                                    Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'
                                                    >
                                                </asp:Button>
                                                <asp:Button 
                                                    ID="InsertCancelButton" 
                                                    runat="server" 
                                                    CausesValidation="False" 
                                                    CommandName="Cancel"
                                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                                    Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                                </asp:Button>
                                            </td>
                                            
                                    </tr>
                                    
                                </table>
                                
                                <%--id´s--%>
                                
                                <asp:TextBox 
                                    ID="Id" 
                                    Visible="true"
                                    style="display:none"
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--campos no visibles--%>  
                                                             
                                <asp:TextBox 
                                    ID="Estado"
                                    Visible="false" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table>
                                    <tr align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
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
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Codigo") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblNombre" 
                                                runat="server"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Nombre"
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                runat="server" 
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Nombre") %>'>
                                            </asp:TextBox>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lbl_Ruta" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Ruta" 
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                runat="server"
                                                Width="400px"    
                                                ToolTip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'                                            
                                                Text='<%# Bind("Ruta") %>'>
                                            </asp:TextBox>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label 
                                                ID="lblDescripcion" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Descripcion" 
                                                CssClass="TEXTO_LECTURA_KCG" 
                                                runat="server"
                                                TextMode="MultiLine"
                                                Width="350px" 
                                                Height="50px"
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Descripcion") %>'>
                                            </asp:TextBox>
                                            
                                        </td>
                                    </tr>
                                    <tr >
                                        <td align="left" colspan="2">
                                            <asp:Button 
                                                ID="EditButton" 
                                                runat="server" 
                                                CausesValidation="False" 
                                                CommandName="Edit"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <asp:Button 
                                                ID="DeleteButton" 
                                                runat="server" 
                                                CausesValidation="False" 
                                                CommandName="Delete"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <asp:Button 
                                                ID="NewButton" 
                                                runat="server" 
                                                CausesValidation="False" 
                                                CommandName="New"
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                            
                                        </td>
                                        
                                </tr> 
                                    
                                </table>
                                
                                <%--id´s--%>
                                
                                <asp:TextBox 
                                    ID="Id" 
                                    Visible="true"
                                    style="display:none"
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                
                                <%--campos no visibles--%>  
                                                             
                                <asp:TextBox 
                                    ID="Estado"
                                    Visible="false" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>                                                                                                       
                                
                            </ItemTemplate>
            </asp:FormView>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvParServidor" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVParServidor" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.PAR.BO_Par_Servidor"
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
                    GridViewID="gvParServidor"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
                </td>
                <td>
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="PAR_SERVIDOR" 
                        Objeto="PAR_SERVIDOR" 
                        IndiceScope ="Scope"
                        Orden="1" ObjectDataSourceID="odsGVParServidor"/>
                </td>
            </tr>
        </table>
        
            <asp:Panel  
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Par_ServidorRecursoKCG">
                    <koala:KGrid
                            ID="gvParServidor" 
                            runat="server" 
                            AllowPaging="True" 
                            AllowSorting="True"
                            AutoGenerateColumns="False" 
                            DataKeyNames="Id" 
                            DataSourceID="odsGVParServidor"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                                    <itemstyle horizontalalign="Right" />
                            </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Nombre" 
                                    meta:resourcekey="BoundNombreRecursoKCG" 
                                    SortExpression="Nombre" >
                                    <ItemStyle Width="80mm" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Descripcion" 
                                     meta:resourcekey="BoundDescripcionRecursoKCG"
                                    SortExpression="Descripcion" >
                                    <ItemStyle Width="80mm" />
                                </asp:BoundField>
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
        ID="odsGVParServidor" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.PAR.BO_Par_Servidor">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

