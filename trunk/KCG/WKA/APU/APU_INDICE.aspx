<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_INDICE.aspx.cs" 
    Inherits="APU_APU_INDICE" 
    meta:resourcekey="Tit_Apu_IndiceRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
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
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel
              runat="server"
              ID="pnlDatos"
              meta:resourcekey="Rec_Apu_IndiceRecursoKCG">                                                
                <asp:FormView 
                    ID="fvapu_indice" 
                    runat="server" 
                    DataSourceID="odsapu_indice" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                    <table>
                        <tr align="right" >
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"                                    
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                   
                                    Readonly="true"                                    
                                    Text='<%# Bind("Codigo") %>' >
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                     
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    TextMode ="MultiLine" 
                                    Height ="50px"
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
                        <tr align="left" >
                            <td>
                                <asp:Label 
                                    ID="lblvarios" 
                                    runat="server" 
                                    meta:resourcekey="Varios_NombreRecursoKCG">
                                </asp:Label>    
                            </td>                           
                            <td>
                                <asp:DropDownList 
                                    ID="Varios" 
                                    runat="server"                                     
                                    CssClass="TEXTOKCG" 
                                    DataSourceID="odsvarios" 
                                    DataTextField="Nombre"
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Varios") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsvarios" 
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
                                            DefaultValue="APU_INDICE" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Varios" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>                                
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
                    
                     <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        Style="visibility:hidden"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Varios_Nombre" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("Varios_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Style="visibility:hidden"
                        Visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                    </asp:TextBox>                       
                    </EditItemTemplate>
                    <InsertItemTemplate >
                    <table>
                        <tr align="right" >
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"
                                    Visible="false"
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    CssClass="TEXTOKCG" 
                                    Readonly="true" 
                                    Visible="false"
                                    Text='<%# Bind("Codigo") %>' >
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Nombre"
                                    TextMode ="MultiLine" 
                                    Height="50px"
                                    Width="400px" 
                                    runat="server" 
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
                            <td>
                                <asp:Label 
                                    ID="lblvarios" 
                                    runat="server" 
                                    meta:resourcekey="Varios_NombreRecursoKCG">
                                </asp:Label>    
                            </td>                           
                            <td>
                                <asp:DropDownList 
                                    ID="Varios" 
                                    runat="server"
                                    TabIndex="-1" 
                                    CssClass="TEXTOKCG"                                     
                                    DataSourceID="odsvarios" 
                                    DataTextField="Nombre"
                                    DataValueField="Dic_Dominio_Dominio"
                                    SelectedValue='<%# Bind("Varios") %>'>
                                </asp:DropDownList>
                                <asp:ObjectDataSource 
                                    ID="odsvarios" 
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
                                            DefaultValue="APU_INDICE" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="Varios" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>                                
                            </td>
                        </tr>
                    </table>
                    <table>   
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
                            </td>   
                            <td>
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
                                
                                <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        Style="visibility:hidden"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Varios_Nombre" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("Varios_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Style="visibility:hidden"
                        Visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                    </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                    <table>
                        <tr align="right" >
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label
                                    ID="lblcodigo"
                                    runat="server"                                    
                                    meta:resourcekey="CodigoRecursoKCG">
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Codigo" 
                                    TabIndex="-1" 
                                    runat="server" 
                                    Readonly="true"                                    
                                    Text='<%# Bind("Codigo") %>' >
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td >
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    meta:resourcekey="NombreRecursoKCG">
                                </asp:Label>
                            </td>
                            <td >
                                <asp:TextBox 
                                    ID="Nombre"
                                    TabIndex="-1" 
                                    TextMode="MultiLine" 
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    Height ="50px"
                                    Width="400px" 
                                    runat="server"
                                    ReadOnly="true" 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>                                  
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblvarios" 
                                    runat="server" 
                                    meta:resourcekey="Varios_NombreRecursoKCG">
                                </asp:Label>    
                            </td>                           
                            <td>
                                <asp:TextBox
                                    ID="Varios"
                                    TabIndex="-1" 
                                    runat="server" 
                                    ReadOnly="true"
                                    Text='<%# Bind("Varios") %>'>                                    
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
                                       
                            <%--CAMPOS NO VISIBLES--%>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        Style="visibility:hidden"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Varios_Nombre" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("Varios_Nombre") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_empresa_Codigo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Id" 
                        runat="server"
                        Style="visibility:hidden"
                        Visible="true" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox><asp:TextBox 
                        ID="Int_Empresa_nombre" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                    </asp:TextBox>                 
                    </ItemTemplate>
                </asp:FormView>                
            <koala:KNavegacion ID="nav"
                                runat="server"
                                GridViewID="gvapu_indice"
                                FormViewID="FormView1" OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_indice" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                    ID="odsapu_indice" 
                    runat="server" 
                    ConflictDetection="CompareAllValues" 
                    OldValuesParameterFormatString="original{0}"
                    SelectMethod="GetById" 
                    SortParameterName="sortExpression" 
                    TypeName="FEL.APU.BO_Apu_Indice" 
                    DeleteMethod="Delete" 
                    InsertMethod="Insert" 
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
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
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
            Contenedor="APU_INDICE" 
            Objeto="APU_INDICE" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsgvapu_indice"/>
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_IndiceRecursoKCG">
                
                <koala:KGrid  
                ID="gvapu_indice" 
                runat="server" 
                AutoGenerateColumns="False" 
                DataKeyNames="Id"
                DataSourceID="odsgvapu_indice"
                AllowPaging="True"
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
                        <headerstyle width="80mm" />
                    </asp:BoundField>                        
                    <asp:BoundField 
                        DataField="Varios" 
                        meta:resourcekey="BoundVarios_NombreRecursoKCG"
                        SortExpression="Varios"  >
                        <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre" 
                        Visible="False"/>
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Varios_Nombre" 
                        HeaderText="Varios_Nombre" 
                        SortExpression="Varios_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Codigo" 
                        HeaderText="Codigo" 
                        SortExpression="Codigo_int" 
                        Visible="False"/>
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id"
                        Visible="False"/>
                    <asp:BoundField 
                        DataField="Varios_Nombre" 
                        HeaderText="Varios_Nombre" 
                        SortExpression="Varios_Nombre"
                        Visible="False"/>
                    <asp:BoundField 
                        DataField="Int_empresa_Codigo" 
                        HeaderText="Int_empresa_Codigo" 
                        SortExpression="Int_empresa_Codigo"
                        Visible="False"  />
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
                        DataField="Int_Empresa_nombre" 
                        HeaderText="Int_Empresa_nombre" 
                        SortExpression="Int_Empresa_nombre"
                        Visible="False" />
                 </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                ID="odsgvapu_indice" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetByEmpresa" 
                TypeName="FEL.APU.BO_Apu_Indice">
                <SelectParameters>
                    <asp:SessionParameter 
                        Name="s" 
                        SessionField="Scope" 
                        Type="Object" />
                </SelectParameters>            
    </asp:ObjectDataSource>
</asp:Content>

