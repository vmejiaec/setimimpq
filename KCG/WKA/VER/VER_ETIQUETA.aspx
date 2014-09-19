<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="VER_ETIQUETA.aspx.cs"
    Inherits="VER_VER_ETIQUETA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Ver_EtiquetaRecursoKCG" %>
    
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <asp:Panel 
            runat="server" 
            ID="pnlFv"
            meta:resourcekey="Rec_Listado_Ver_EtiquetaRecursoKCG">
            <asp:FormView 
                ID="fvVerEtiqueta" 
                runat="server" 
                DataSourceID="odsFvVerEtiqueta" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <table>
                        <tr align="right">
                            <td>
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
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
                                    ID="lblRotulo" 
                                    runat="server"
                                    
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server"                                                 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="250px"                                                
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
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
                                        ID="Ver_Version_Codigo" 
                                        runat="server"                                                     
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Ver_Version_Nombre" 
                                        runat="server"                                                    
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="250px"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Nombre") %>'>
                                    </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblEtiqueta" 
                                    runat="server"
                                    AssociatedControlID="Nombre" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width="300px"
                                        ToolTip='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2"
                                            ControlToValidate="Nombre"
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server" ID="ValidatorCalloutExtender2"
                                            TargetControlID="RequiredFieldValidator2" /> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenActiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Imagen_Activa" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Imagen_Activa") %>'>
                                 </asp:TextBox>                                              
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenDesactiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Imagen_Desactiva" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ToolTip='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.ToolTip").ToString() %>'  
                                    Text='<%# Bind("Imagen_Desactiva") %>'>
                                </asp:TextBox>                                            
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
            <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                         
        </td></tr>
                    </table>
                    <asp:TextBox 
                        ID="Ver_Version_Id" 
                        runat="server" 
                        style="display:none" 
                        Visible="true"
                        Text='<%# Bind("Ver_Version_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none" 
                        Visible="true" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Rotulo_Id" 
                        runat="server"
                        style="display:none" 
                        Visible="true" 
                        Text='<%# Bind("Dic_Rotulo_Id") %>'>
                    </asp:TextBox>
                   
                </EditItemTemplate>
                <InsertItemTemplate>
                    
                    <table>
                        <tr align="right">
                            <td>
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
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
                                    ID="lblRotulo" 
                                    runat="server"
                                    AssociatedControlID="Dic_Rotulo_Codigo" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server"
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    Width="250px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
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
                                        ID="Ver_Version_Codigo" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Ver_Version_Nombre" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        Width="250px"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Nombre") %>'>
                                    </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblEtiqueta" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                       ReadOnly="true" 
                                       TabIndex="-1"
                                       Width="300px" 
                                        ToolTip='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenActiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Imagen_Activa" 
                                    runat="server" 
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Imagen_Activa") %>'>
                                 </asp:TextBox> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenDesactiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Imagen_Desactiva" 
                                    runat="server"
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.ToolTip").ToString() %>'  
                                    Text='<%# Bind("Imagen_Desactiva") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        
                    </table>
                    <asp:TextBox 
                        ID="Ver_Version_Id" 
                        runat="server" 
                        style="display:none" 
                        Visible="true"
                        Text='<%# Bind("Ver_Version_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none" 
                        Visible="true" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Rotulo_Id" 
                        runat="server"
                        style="display:none" 
                        Visible="true" 
                        Text='<%# Bind("Dic_Rotulo_Id") %>'>
                    </asp:TextBox>
                   
                </InsertItemTemplate>
                <ItemTemplate>
                    <table>
                        <tr align="right">
                            <td>
                                    <asp:Label 
                                        ID="estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("estado_nombre") %>'>
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
                                    ID="lblRotulo" 
                                    runat="server"
                                    AssociatedControlID="Dic_Rotulo_Codigo" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="250px"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
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
                                        ID="Ver_Version_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Ver_Version_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="250px"
                                        ToolTip='<%# GetLocalResourceObject("Ver_Version_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Ver_Version_Nombre") %>'>
                                    </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblEtiqueta" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="300px"
                                        ToolTip='<%# GetLocalResourceObject("Men_Ver_EtiquetaRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenActiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                 <asp:TextBox 
                                    ID="Imagen_Activa" 
                                    runat="server" 
                                    ReadOnly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Imagen_ActivaRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Imagen_Activa") %>'>
                                 </asp:TextBox> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblImagenDesactiva" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Imagen_Desactiva" 
                                    runat="server"
                                   ReadOnly="true"
                                   TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Imagen_DesactivaRecursoKCG.ToolTip").ToString() %>'  
                                    Text='<%# Bind("Imagen_Desactiva") %>'>
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
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                            </asp:Button>
                                            
            
        </td>
    </tr>
                    </table>
                    <asp:TextBox 
                        ID="Ver_Version_Id" 
                        runat="server" 
                        style="display:none" 
                        Visible="true"
                        Text='<%# Bind("Ver_Version_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id"
                        style="display:none" 
                        Visible="true" 
                        runat="server" 
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        Visible="false"
                        runat="server" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Dic_Rotulo_Id" 
                        runat="server"
                        style="display:none" 
                        Visible="true" 
                        Text='<%# Bind("Dic_Rotulo_Id") %>'>
                    </asp:TextBox>
                   
                </ItemTemplate>
            </asp:FormView>  
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvVerEtiqueta" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsFvVerEtiqueta" 
            runat="server" 
            OldValuesParameterFormatString="original{0}"
            SelectMethod="GetById" 
            SortParameterName="sortExpression" 
            TypeName="FEL.VER.BO_Ver_Etiqueta"
            UpdateMethod="Update" 
            ConflictDetection="CompareAllValues">
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
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
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
        <koala:KNavegacion 
            ID="nav"
            runat="server"
            GridViewID="gvVerEtiqueta"
            FormViewID="FormView1" 
            OnNavegar="nav_Siguiente" />
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="VER_ETIQUETA" 
            Objeto="VER_ETIQUETA" 
            IndiceScope ="Scope"
            Orden="1" 
            ObjectDataSourceID="odsGvVerEtiqueta"/>
        <asp:Panel 
            runat="server" 
            ID="pnlGV"
            meta:resourcekey="Rec_Listado_Ver_EtiquetaRecursoKCG">
        <koala:KGrid 
            iD="gvVerEtiqueta" 
            runat="server" 
            AllowPaging="True" 
            AutoGenerateColumns="False"
            DataKeyNames="Id" 
            DataSourceID="odsGvVerEtiqueta" 
            AllowSorting="True"
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
                SortExpression="Nombre">
                <itemstyle width="80mm" wrap="True" />
            </asp:BoundField> 
            <asp:BoundField 
                DataField="Dic_Rotulo_nombre" 
                meta:resourcekey="BoundDic_Rotulo_NombreRecursoKCG" 
                SortExpression="Dic_Rotulo_nombre" >
                <itemstyle width="80mm" wrap="True" />
            </asp:BoundField> 
            <asp:BoundField 
                DataField="Ver_Version_Nombre" 
                 meta:resourcekey="BoundVer_Version_NombreRecursoKCG"
                SortExpression="Ver_Version_Nombre" >            
                <itemstyle width="80mm" wrap="True" />
            </asp:BoundField> 
            <asp:BoundField 
                DataField="Imagen_Activa" 
                meta:resourcekey="BoundImagen_ActivaRecursoKCG"
                SortExpression="Imagen_Activa" >
                <itemstyle width="60mm" wrap="True" />
            </asp:BoundField> 
            <asp:BoundField 
                DataField="Imagen_Desactiva" 
                meta:resourcekey="BoundImagen_DesactivaRecursoKCG" 
                SortExpression="Imagen_Desactiva" >
                <itemstyle width="60mm" wrap="True" />
            </asp:BoundField> 
            <asp:BoundField 
                DataField="Ver_Version_Id" 
                HeaderText="Ver_Version_Id" 
                SortExpression="Ver_Version_Id" 
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
            <asp:BoundField 
                DataField="estado_nombre" 
                HeaderText="estado_nombre" 
                SortExpression="estado_nombre" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Rotulo_Codigo" 
                HeaderText="Dic_Rotulo_Codigo" 
                SortExpression="Dic_Rotulo_Codigo"
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Rotulo_Id" 
                HeaderText="Dic_Rotulo_Id" 
                SortExpression="Dic_Rotulo_Id" 
                Visible="False" />
            <asp:BoundField 
                DataField="Ver_Version_Codigo" 
                HeaderText="Ver_Version_Codigo" 
                SortExpression="Ver_Version_Codigo" 
                Visible="False" />
        </Columns>
    </koala:KGrid>
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
    &nbsp;<asp:ObjectDataSource ID="odsGvVerEtiqueta" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" TypeName="FEL.VER.BO_Ver_Etiqueta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
</asp:Content>

