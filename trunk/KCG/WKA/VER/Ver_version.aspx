<%@ Page 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Ver_version.aspx.cs" 
Inherits="VER_Ver_version"
StylesheetTheme="EstiloKCG"
Theme="EstiloKCG" 
meta:resourcekey="Tit_Ver_VersionRecursoKCG" %>

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
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlDatos"
                meta:resourcekey="Rec_Ver_VersionRecursoKCG">
                <asp:FormView 
                    ID="fvverversion" 
                    runat="server" 
                    DataSourceID="odsverversion" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
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
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblnombre" 
                                        runat="server"
                                        AssociatedControlID="Nombre"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
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
                                        TargetControlID="rqvNombre" />
                                </td>                    
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:label
                                        ID="lblabreviatura" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Tooltip").ToString() %>'                                                                               
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblruta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Ruta_Imagen" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Ruta_Imagen") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblpredeterminada" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                  
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="Predeterminada" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsPrdeterminada"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Predeterminada") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsPrdeterminada" 
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
                                                DefaultValue="" 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="Ver_Version" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="Predeterminada" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server"
                                        MaxLength="2000"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine" 
                                        CssClass="TEXTO_EDICION_KCG"
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
                                    <uc2:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />
                                </td>
                            </tr>
                        </table> 
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox> 
                        
                        <%--CAMPOS NO VISIBLES--%>                                                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                                                     
                        <asp:TextBox 
                            ID="Predeterminada_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Predeterminada_Nombre") %>'>
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
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Visible="false"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblnombre" 
                                        runat="server"
                                        AssociatedControlID="Nombre"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
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
                                        ID="rqvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="caValidator"
                                        TargetControlID="rqvNombre" />
                                </td>                    
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:label
                                        ID="lblabreviatura" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>                                     
                                    </asp:label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblruta" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Ruta_Imagen" 
                                        runat="server"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Text='<%# Bind("Ruta_Imagen") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblpredeterminada" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                  
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="Predeterminada" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsPrdeterminada"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Predeterminada") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsPrdeterminada" 
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
                                                DefaultValue="" 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="Ver_Version" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="Predeterminada" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        MaxLength="2000"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>                                      
                                </td>
                            </tr>
                        </table> 
                        <table>
                            <tr align="left">
                                <td>
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
                                </td>
                                <td>
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
                            
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox> 
                        
                        <%--CAMPOS NO VISIBLES--%>                                                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                                                     
                        <asp:TextBox 
                            ID="Predeterminada_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Predeterminada_Nombre") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
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
                                        ID="lblnombre" 
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
                                <td>
                                    <asp:label
                                        ID="lblabreviatura" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>                                       
                                    </asp:label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.ToolTip").ToString() %>'                                     
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblruta" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Ruta_Imagen" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.ToolTip").ToString() %>'                                        
                                        Text='<%# Bind("Ruta_Imagen") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblpredeterminada" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                  
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Predeterminada_Nombre" 
                                        runat="server"
                                        ReadOnly="true" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Predeterminada_Nombre") %>'>
                                    </asp:TextBox>                      
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
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
                                   <uc1:wucMensajeEliminar 
                                    ID="WucMensajeEliminar1" 
                                    runat="server" />
                                </td>
                            </tr>
                        </table> 
                        <%--Id's--%>
                            
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Visible="true"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox> 
                        
                        <%--CAMPOS NO VISIBLES--%>                                                       
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Predeterminada" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Predeterminada") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:FormView>                            
            </asp:Panel>             
        </ContentTemplate>
           <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="gvverversion" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsverversion" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.VER.BO_Ver_Version" 
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
                GridViewID="gvverversion"
                
                OnNavegar="nav_Siguiente" />
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="Ver_version" 
                Objeto="Ver_Version" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvverversion" />
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Ver_VersionRecursoKCG">
                <koala:KGrid 
                    ID="gvverversion" 
                    runat="server"
                    AllowPaging="True" 
                    AllowSorting="True" 
                    AutoGenerateColumns="False"                    
                    DataSourceID="odsgvverversion" 
                    DataKeyNames="Id"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle" />
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" 
                            ButtonType="Button" 
                            SelectText="..." />
                        <asp:BoundField 
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG"
                            SortExpression="Codigo_int" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre" >
                            <itemstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Predeterminada_Nombre"
                            meta:resourcekey="BoundPredeterminadaRecursoKCG"                        
                            SortExpression="Predeterminada_Nombre" >
                            <itemstyle width="40mm" wrap="False" />
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Ruta_Imagen" 
                            meta:resourcekey="BoundRuta_ImagenRecursoKCG"  
                            SortExpression="Ruta_Imagen" >
                            <itemstyle width="80mm" wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Abreviatura" 
                            HeaderText="Abreviatura"  
                            SortExpression="Abreviatura" 
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
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Predeterminada" 
                            HeaderText="Predeterminada"
                            SortExpression="Predeterminada"
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
        ID="odsgvverversion" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.VER.BO_Ver_Version" 
        ConflictDetection="CompareAllValues">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
            </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

