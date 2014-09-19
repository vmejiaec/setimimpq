<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_MODULO.aspx.cs" 
    Inherits="DIC_DIC_MODULO" 
    meta:resourcekey="Tit_ModuloRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

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
        runat="server"  >       
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlDatos" 
                meta:resourcekey="Rec_ModuloRecursoKCG">
                <asp:FormView 
                    ID="FormView1" 
                    runat="server" 
                    DataSourceID="odsFVDicModulo" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <table 
                            border="0" 
                            width="600" 
                            align="left">
                            <tr align="right">
                                <td colspan="2" >
                                    <asp:label  
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td >
                                    <asp:Label
                                        
                                        ID="Label2" 
                                        runat="server" 
                                        meta:resourcekey="CodigoRecursoKCG">
                                     </asp:Label>
                                </td>
                                <td >
                                     <asp:TextBox
                                        
                                        ID="Codigo" 
                                        ReadOnly="true"
                                        runat="server" 
                                        Text='<%# Bind("Codigo") %>' 
                                        CssClass="TEXTO_EDICION_KCG">
                                     </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Nombre" 
                                        ID="Label3" 
                                        runat="server" 
                                        meta:resourcekey="NombreRecursoKCG">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Nombre") %>' 
                                        CssClass="TEXTO_EDICION_KCG">
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
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        meta:resourcekey="DescripcionRecursoKCG">
                                     </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Width="500" 
                                        MaxLength="2000" 
                                        TextMode="MultiLine"  
                                        Text='<%# Bind("Descripcion") %>' 
                                        CssClass="TEXTO_EDICION_KCG">
                                    </asp:TextBox>
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
                                    <uc1:wucMensajeActualizar 
                                        ID="WucMensajeActualizar2" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
         
                        <!--CAMPOS PARA OCULTAR -->
                        <asp:Label 
                            ID="Label5" 
                            runat="server" 
                            Text="Codigo:" 
                            Visible="false">
                         </asp:Label>
                        <asp:TextBox 
                            Visible="True"
                            style="visibility:hidden"
                            ID="Id" 
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:Label 
                            ID="Label6" 
                            runat="server" 
                            Text="Estado:" 
                            Visible="false">
                         </asp:Label>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>' 
                            Visible="false">
                        </asp:TextBox>           
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table 
                            border="0" 
                            width="600" 
                            align="left">
                            <tr align="right">
                                <td colspan="2">
                                    <asp:label  
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"
                                        Visible="false"  
                                        meta:resourcekey="CodigoRecursoKCG">
                                     </asp:Label>
                                </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Codigo"
                                            runat="server" 
                                            Text='<%# Bind("Codigo") %>' 
                                            CssClass="TEXTO_EDICION_KCG">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                            AssociatedControlID="Nombre"
                                            ID="Label3" 
                                            runat="server" 
                                            meta:resourcekey="NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Nombre" 
                                            runat="server" 
                                            Text='<%# Bind("Nombre") %>' 
                                            CssClass="TEXTO_EDICION_KCG">
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
                                    <td>
                                        <asp:Label 
                                            ID="Label4" 
                                            runat="server" 
                                            meta:resourcekey="DescripcionRecursoKCG">
                                        </asp:Label>    
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Descripcion" 
                                            runat="server" 
                                            Width="500" 
                                            MaxLength="2000" 
                                            TextMode="MultiLine"  
                                            Text='<%# Bind("Descripcion") %>' 
                                            CssClass="TEXTO_EDICION_KCG">
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
                    
                            <!--CAMPOS PARA OCULTAR -->
                            <asp:Label 
                                ID="Label5" 
                                runat="server" 
                                Text="Codigo:" 
                                Visible="false">
                             </asp:Label>
                            <asp:TextBox 
                                Visible="True"
                                style="visibility:hidden"
                                ID="Id" 
                                runat="server" 
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label6" 
                                runat="server" 
                                Text="Estado:" 
                                Visible="false">
                             </asp:Label>
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server" 
                                Text='<%# Bind("Estado") %>' 
                                Visible="false">
                            </asp:TextBox>
                        </InsertItemTemplate>
                    <ItemTemplate>
                        <table 
                            border="0" 
                            width="600" 
                            align="left">
                            <tr align="right">
                                <td colspan="2">
                                    <asp:label  
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server" 
                                        meta:resourcekey="CodigoRecursoKCG">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        ReadOnly="true"
                                        runat="server" 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label3" 
                                        runat="server" 
                                        meta:resourcekey="NombreRecursoKCG" 
                                        AccessKey="F" 
                                        AssociatedControlID="Nombre">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        ReadOnly="true"
                                        runat="server" 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server"
                                        meta:resourcekey="DescripcionRecursoKCG">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        ReadOnly="true"
                                        runat="server" 
                                        Width="500" 
                                        MaxLength="2000" 
                                        TextMode="MultiLine"  
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
                                    <uc2:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table>
                        
                        <!--CAMPOS PARA OCULTAR -->
                        <asp:Label 
                            ID="Label5" 
                            runat="server" 
                            Text="Codigo:" 
                            Visible="false">
                         </asp:Label>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Text='<%# Bind("Id") %>' 
                            Visible="True"
                            style="visibility:hidden">
                        </asp:TextBox>
                        <asp:Label 
                            ID="Label6" 
                            runat="server" 
                            Text="Estado:" 
                            Visible="false">
                         </asp:Label>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>' 
                            Visible="false">
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:FormView>                                
            </asp:Panel>       
    <asp:ObjectDataSource 
        ID="odsFVDicModulo" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Modulo"
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
    <asp:Button 
        ID="Atras" 
        runat="server"
        Visible="false" />
    <asp:Button 
        ID="Seleccionar" 
        runat="server" 
        Visible="false"/>
     <table>
        <tr>
            <td>
                <koala:KNavegacion 
                    ID="KNavegacion"
                    runat="server"
                    GridViewID="GridView1"
                    OnNavegar="nav_Siguiente" />
            </td>
            <td>
                <koala:KFiltro
                    ID="KFiltro" 
                    runat="server" 
                    Contenedor="DIC_MODULO" 
                    Objeto="Dic_Modulo" 
                    IndiceScope="Scope"
                    Orden="1"
                    ObjectDataSourceID="odsGVDicModulo" />
            </td>
        </tr>
    </table>                               
            <asp:Panel 
                runat="server" 
                ID="pnlGridView" 
                meta:resourcekey="Rec_Listado_ModuloRecursoKCG">
                <koala:KGrid 
                    ID="GridView1" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    DataSourceID="odsGVDicModulo" 
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
                            SortExpression="Codigo_int" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            meta:resourcekey="BoundEstado_NombreRecursoKCG"
                            SortExpression="Estado_Nombre" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            meta:resourcekey="BoundDescripcionRecursoKCG"
                            SortExpression="Descripcion" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" >
                        <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        
    <asp:ObjectDataSource 
        ID="odsGVDicModulo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Modulo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>