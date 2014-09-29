<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_ROTULO.aspx.cs" 
    Inherits="DIC_DIC_ROTULO" 
    meta:resourcekey="Tit_Dic_RotuloRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
 %>
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
            <asp:Panel 
               runat="server" 
               ID="pnlDatos"
               meta:resourcekey="Rec_Dic_RotuloRecursoKCG">
               <asp:FormView 
                    ID="fvDicRotulo" 
                    runat="server"                     
                    DataSourceID="odsFVDicRotulo" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <table>
                            <tr align="right">
                                <td colspan="2" align="right">
                                    <asp:Label 
                                        ID="Estado_nombre" 
                                        runat="server"
                                        Text='<%# Bind("Estado_nombre") %>'>
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
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"                                        
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
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Width="400px" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG" 
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
                                     <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />  
                                </td>
                            </tr>
                    </table>
                        <!--CAMPOS  NO VISIBLES  -->
                      
                          <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                          </asp:TextBox>                  
                          <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="False"
                            Text='<%# Bind("Estado") %>'>
                          </asp:TextBox>  
                          <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            Visible="false"  
                            Text='<%# Bind("Codigo_int") %>'>
                          </asp:TextBox>          
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr align="right">
                                <td colspan="2" align="right">
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
                                        CssClass="TEXTO_EDICION_KCG"
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
                            <tr align="left">
                                <td>   
                                    <asp:Label 
                                         ID="lblNombre" 
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
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG" 
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
                            <tr align="left">
                                <td colspan="2">
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
                        <!--CAMPOS  NO VISIBLES  -->
                      
                          <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                          </asp:TextBox>                  
                          <asp:TextBox 
                                ID="Estado" 
                                runat="server" 
                                Visible="False"
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            Visible="false"  
                            Text='<%# Bind("Codigo_int") %>'>
                          </asp:TextBox>          
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr align="right">
                                <td colspan="2" align="right">
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
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>   
                                </td>
                            </tr>                        
                            <tr align="left">
                                <td>   
                                    <asp:Label 
                                        ID="lblNombre" 
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
                                    <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                                </td>
                            </tr>
                        </table>
                        <!--CAMPOS  NO VISIBLES  -->
                      
                      <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                      </asp:TextBox>
                      <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Codigo_int" 
                            runat="server"
                            Visible="false"  
                            Text='<%# Bind("Codigo_int") %>'>
                          </asp:TextBox>          
            </ItemTemplate>
                </asp:FormView>                
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicRotulo" 
                EventName="SelectedIndexChanged" />
        </Triggers>   
    </asp:UpdatePanel>  
    <asp:ObjectDataSource 
        ID="odsFVDicRotulo" 
        runat="server" 
        DeleteMethod="Delete" 
        InsertMethod="Insert"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        TypeName="FEL.DIC.BO_Dic_Rotulo"
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
        ID="UpdatePanel3" 
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
        ID="UpdatePanel2" 
        runat="server">
      <ContentTemplate>
      <table>
        <tr>
            <td>
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvDicRotulo"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
            </td>
            <td>
                <koala:KFiltro 
                    ID="kftFiltro" 
                    runat="server" 
                    Contenedor="DIC_ROTULO" 
                    Objeto="DIC_ROTULO" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsGVDicRotulo"/>
            </td>
            <td>
                <asp:Button
                    id="BtnEtiqueta"
                    runat="server"                        
                    OnClick="BtnEtiqueta_Click" />
            </td>
        </tr>
      </table>
        <asp:Panel 
           runat="server" 
           ID="Panel1"
            meta:resourcekey="Rec_Listado_Dic_RotuloRecursoKCG">            
            <koala:KGrid
                ID="gvDicRotulo" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False" 
                DataSourceID="odsGVDicRotulo" 
                AllowSorting="True" 
                DataKeyNames="Id"
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
                        SortExpression="Codigo_int" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" >
                        <itemstyle width="80mm" wrap="True" />
                    </asp:BoundField>
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
                    <asp:BoundField 
                        DataField="Estado_nombre" 
                        HeaderText="Estado_nombre" 
                        SortExpression="Estado_nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Codigo_int" 
                        HeaderText="Codigo_int" 
                        SortExpression="Codigo_int"
                        Visible="False" />
                </Columns>
            </koala:KGrid>
        </asp:Panel>
        <%--Controles para insertar o consultar la etiqueta del rótulo--%>
        <asp:Panel runat="server" ID="pnlVictor" GroupingText="Mantenimiento de la etiqueta">
        <asp:Label runat="server" ID="lbNombre" Text="Etiqueta"></asp:Label>
        <asp:TextBox runat="server" ID="tbEtiquetaNombre" ></asp:TextBox>
        <asp:Button runat ="server" ID="btConsultaEtiqueta" Text="Consutar" 
                onclick="btConsultaEtiqueta_Click" />
        <asp:Button runat ="server" ID="btActualizarEtiqueta" Text="Actualizar" 
                onclick="btActualizarEtiqueta_Click" />
        <asp:Button runat ="server" ID="btCrearEtiqueta" Text="Crear" 
                onclick="btCrearEtiqueta_Click" />
        <asp:Label runat="server" ID="lbMensaje" ForeColor="Red" Text=">"></asp:Label>
        </asp:Panel>
        <%-- * --%>
        </ContentTemplate>        
    </asp:UpdatePanel> 
    <asp:ObjectDataSource 
            ID="odsGVDicRotulo" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="Get" 
            TypeName="FEL.DIC.BO_Dic_Rotulo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

