<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_PANTALLA.aspx.cs" 
    Inherits="DIC_DIC_PANTALLA"    
    meta:resourcekey="Tit_Dic_PantallaRecursoKCG"
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
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlDatos"
                meta:resourcekey="Rec_Dic_PantallaRecursoKCG">                
                <asp:FormView 
                    ID="fvdicpantalla" 
                    runat="server" 
                    DataSourceID="odsdicpantalla" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("estado_nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
                                    runat="server"                                            
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                                                                                                                                                                   
                              </asp:Label>  
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
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
                                    ID="lbldicrotulocod" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>                               
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                               <asp:RequiredFieldValidator 
                                    ID="rvdiccodigo"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="rvdiccodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvdicnombre"
                                    runat="server" 
                                    ControlToValidate="Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="rvdicnombre"/> 
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolcodigo"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvtoolcodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolnombre"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="rvtoolnombre"/>
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
                     <%--Id's--%>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                                                        
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                     
                     <%--CAMPOS NO VISIBLES--%>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>              
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>  
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("estado_nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server" 
                                    Visible="false"
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                       
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"
                                    Readonly="true" 
                                    Visible="false"                                          
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
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
                                    ID="lbldicrotulocod" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                           
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Codigo|Dic_Rotulo_nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />  
                                <td>
                                    <asp:RequiredFieldValidator 
                                        ID="rvdiccodigo"
                                        runat="server" 
                                        ControlToValidate="Dic_Rotulo_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>                                    
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender1"
                                        TargetControlID="rvdiccodigo"/> 
                                    <asp:RequiredFieldValidator 
                                        ID="rvdicnombre"
                                        runat="server" 
                                        ControlToValidate="Dic_Rotulo_nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>                                            
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender2"
                                        TargetControlID="rvdicnombre"/>     
                               </td>           
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>                                
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'                                                                          
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>                                                                    
                                <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Codigo|Tool_Dic_Rotulo_nombre;Alias:Tool;"
                                    CommandName="Zoom" 
                                    Text="..." />               
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolcodigo"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvtoolcodigo"/>     
                                <asp:RequiredFieldValidator 
                                    ID="rvtoolnombre"
                                    runat="server" 
                                    ControlToValidate="Tool_Dic_Rotulo_nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender4"
                                    TargetControlID="rvtoolnombre"/>
                                </td>                            
                        </tr>                                
                    </table>   
                    <table>   
                    <tr>
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
                        
                       <%--Id's--%>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                                                        
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                     
                     <%--CAMPOS NO VISIBLES--%>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>              
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblnombre" 
                                    runat="server" 
                                    Text='<%# Bind("estado_nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
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
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>                                        
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                              <asp:Label                                       
                                    ID="lblnomb" 
                                    runat="server"                                            
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>                                             
                              </asp:Label>  
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server"
                                    ReadOnly="true" 
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>                                      
                            </td>    
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbldicrotulocod" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Dic_Rotulo_nombre" 
                                    runat="server" 
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Dic_Rotulo_Id;"
                                    CommandName="Zoom" 
                                    Enabled="false"
                                    Text="..." />
                            </td>
                        </tr> 
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lbltooldiccodigo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.Text").ToString() %>'>                                            
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_Codigo" 
                                    runat="server" 
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tool_Dic_Rotulo_nombre" 
                                    runat="server" 
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Tool_Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'                                                                          
                                    Text='<%# Bind("Tool_Dic_Rotulo_nombre") %>'>
                                </asp:TextBox>                                    
                            </td>
                            <td>
                                <asp:Button 
                                    ID="Button2" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/DIC/DIC_ROTULO.aspx; Filtro: Tool_Dic_Rotulo_Id; Alias:Tool;"
                                    CommandName="Zoom" 
                                    Enabled="false"
                                    Text="..." />
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
                    <%--Id's--%>
                        <asp:TextBox 
                            ID="Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Dic_Rotulo_Id") %>'>
                        </asp:TextBox>                                                        
                        <asp:TextBox 
                            ID="Tool_Dic_Rotulo_Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Tool_Dic_Rotulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Style="display:none"
                            Visible="true" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                     
                     <%--CAMPOS NO VISIBLES--%>
                        <asp:TextBox 
                            ID="estado_nombre" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("estado_nombre") %>'>
                        </asp:TextBox>              
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>   
                    </ItemTemplate>
                </asp:FormView>
                <koala:KNavegacion ID="nav"
                            runat="server"
                            GridViewID="gvdicpantalla"
                            FormViewID="FormView1" OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvdicpantalla" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel> 
    <asp:ObjectDataSource 
        ID="odsdicpantalla" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Pantalla" 
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
            Contenedor="DIC_PANTALLA" 
            Objeto="DIC_PANTALLA" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsgvdicpantalla" />
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Dic_PantallaRecursoKCG">                
                <koala:KGrid  
                    ID="gvdicpantalla" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsgvdicpantalla">
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
                            SortExpression="Codigo_int" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre" />
                        <asp:BoundField 
                            DataField="Dic_Rotulo_nombre" 
                            meta:resourcekey="BoundDic_Rotulo_NombreRecursoKCG"
                            SortExpression="Dic_Rotulo_nombre" />
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_nombre" 
                            meta:resourcekey="BoundTool_Dic_Rotulo_NombreRecursoKCG"
                            SortExpression="Tool_Dic_Rotulo_nombre" />
                        <asp:BoundField 
                            DataField="estado_nombre" 
                            HeaderText="estado_nombre" 
                            SortExpression="estado_nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Rotulo_Id" 
                            HeaderText="Dic_Rotulo_Id" 
                            SortExpression="Dic_Rotulo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_Codigo" 
                            HeaderText="Tool_Dic_Rotulo_Codigo"
                            SortExpression="Tool_Dic_Rotulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tool_Dic_Rotulo_Id" 
                            HeaderText="Tool_Dic_Rotulo_Id" 
                            SortExpression="Tool_Dic_Rotulo_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Rotulo_Codigo" 
                            HeaderText="Dic_Rotulo_Codigo" 
                            SortExpression="Dic_Rotulo_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                     </Columns>
            </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvdicpantalla" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Pantalla">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>            
</asp:Content>

