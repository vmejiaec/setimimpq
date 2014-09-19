<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_DOMINIO.aspx.cs" 
    Inherits="DIC_DIC_DOMINIO" 
    meta:resourcekey="Tit_DominioRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" TagName="wucMensajeActualizar"
    TagPrefix="uc1" %>
<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" TagName="wucMensajeEliminar"
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
        ID="udpFVDicDominio" 
        runat="server" 
        UpdateMode="Conditional">
            <ContentTemplate>
                       
            <br />
                <asp:Panel 
                    runat="server" 
                    ID="pnlDatos" 
                    meta:resourcekey="Rec_DominioRecursoKCG">
                        <asp:FormView 
                            ID="fvDicDominio" 
                            runat="server" 
                            DataSourceID="odsFVDicDominio" 
                            DefaultMode="Insert">
                                <EditItemTemplate>
                                        <table>
                                                <tr align="right">
                                                    <td colspan="4" >
                                                        <asp:label  
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
                                                        </asp:label>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label1" 
                                                            runat="server" 
                                                           meta:resourcekey="CodigoRecursoKCG">
                                                         </asp:Label>
                                                     </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ReadOnly="true"
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
                                                            ID="Label11" 
                                                            runat="server" 
                                                            meta:resourcekey="DominioRecursoKCG" 
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                            AssociatedControlID="Dominio">
                                                         </asp:Label>
                                                    </td>
                                                    <td>
                                                         <asp:TextBox  
                                                            ID="Dominio" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dominio") %>' 
                                                            CssClass="TEXTO_EDICION_KCG"
                                                            MaxLength="3">
                                                          </asp:TextBox>
                                                          <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ID="rvModuloCodigo"
                                                            ValidationGroup="U"
                                                            ControlToValidate="Dominio"
                                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                            runat="Server" ID="arvModuloCodigo"
                                                            TargetControlID="rvModuloCodigo" />
                                                    </td>
                                                    <td>
                                                          <asp:Label 
                                                            ID="Label2" 
                                                            runat="server" 
                                                            meta:resourcekey="NombreRecursoKCG">
                                                          </asp:Label>
                                                    </td>
                                                    
                                                    <td>
                                                        <asp:TextBox 
                                                            ID="Nombre" 
                                                            runat="server"
                                                            CssClass="TEXTO_EDICION_KCG" 
                                                            Text='<%# Bind("Nombre") %>'>
                                                        </asp:TextBox>
                                                        <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ID="RequiredFieldValidator1"
                                                            ValidationGroup="U"
                                                            ControlToValidate="Nombre"
                                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                            runat="Server" ID="ValidatorCalloutExtender1"
                                                            TargetControlID="RequiredFieldValidator1" />
                                                    </td>
                                                    
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label3" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Codigo" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Objeto_Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Objeto_Nombre") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:Button 
                                                            ID="Button4" 
                                                            runat="server" 
                                                            CommandArgument="RutaDestino: ~/DIC/Dic_Objeto.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre; NoGuardar: Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre"
                                                            CommandName="Zoom" Text="..." />
                                                         <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="RequiredFieldValidator2"
                                                                ValidationGroup="U"
                                                                ControlToValidate="Dic_Objeto_Codigo"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" ID="ValidatorCalloutExtender2"
                                                                TargetControlID="RequiredFieldValidator2" />
                                                             <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ID="RequiredFieldValidator3"
                                                                    ValidationGroup="U"
                                                                    ControlToValidate="Dic_Objeto_Nombre"
                                                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                    runat="Server" ID="ValidatorCalloutExtender3"
                                                                    TargetControlID="RequiredFieldValidator3" />
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label4" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Codigo" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Campo_Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Campo_Nombre") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                         <asp:Button 
                                                            ID="Button5" 
                                                            runat="server" 
                                                            CommandArgument="RutaDestino: ~/DIC/Dic_Campo.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                                            CommandName="Zoom" Text="..." />
                                                       <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="RequiredFieldValidator4"
                                                                ValidationGroup="U"
                                                                ControlToValidate="Dic_Campo_Codigo"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" ID="ValidatorCalloutExtender4"
                                                                TargetControlID="RequiredFieldValidator4" />
                                                             <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ID="RequiredFieldValidator5"
                                                                    ValidationGroup="U"
                                                                    ControlToValidate="Dic_Campo_Nombre"
                                                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                    runat="Server" ID="ValidatorCalloutExtender5"
                                                                    TargetControlID="RequiredFieldValidator5" />
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="4" style="height: 24px">
                                                        <asp:Button 
                                                            ID="UpdateButton" 
                                                            runat="server" 
                                                            CausesValidation="True" 
                                                            CommandName="Update"
                                                            ValidationGroup="U"
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
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label7" 
                                    runat="server" 
                                    Text="Dic_Campo_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                    Visible="True"
                                    Style="visibility:hidden"
                                    ID="Dic_Campo_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Campo_Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label9" 
                                    runat="server" 
                                    Text="Estado:"></asp:Label>
                                <asp:TextBox 
                                    Visible="false" 
                                    ID="Estado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label8" 
                                    runat="server" 
                                    Text="Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden" 
                                    ID="Id" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label10" 
                                    runat="server" 
                                    Text="Dic_Objeto_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden"
                                    ID="Dic_Objeto_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Objeto_Id") %>'>
                                </asp:TextBox>
                                
            
            
        </EditItemTemplate>
                                <InsertItemTemplate>
                     <table >
                                                <tr align="right">
                                                    <td colspan="4" >
                                                        <asp:label  
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
                                                        </asp:label>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label1" 
                                                            runat="server"
                                                            Visible="false" 
                                                           meta:resourcekey="CodigoRecursoKCG">
                                                         </asp:Label>
                                                     </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ReadOnly="true"
                                                            ID="Codigo"
                                                            Visible="false" 
                                                            runat="server" 
                                                            Text='<%# Bind("Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                    </td>
                                              </tr>
                                              <tr align="left">
                                                    
                                                    <td>
                                                        <asp:Label  
                                                            ID="Label11" 
                                                            runat="server" 
                                                            meta:resourcekey="DominioRecursoKCG" 
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
                                                            AssociatedControlID="Dominio">
                                                          </asp:Label>
                                                    </td>
                                                    <td>
                                                         <asp:TextBox  
                                                            ID="Dominio" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dominio") %>' 
                                                            CssClass="TEXTO_EDICION_KCG"
                                                            MaxLength="3">
                                                            </asp:TextBox>
                                                            <asp:RequiredFieldValidator 
                                                            runat="server" 
                                                            ID="rvModuloCodigo"
                                                            ValidationGroup="U"
                                                            ControlToValidate="Dominio"
                                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                            runat="Server" ID="arvModuloCodigo"
                                                            TargetControlID="rvModuloCodigo" />
                                                    </td>
                                                    <td>
                                                          <asp:Label 
                                                            ID="Label2" 
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
                                                            ID="RequiredFieldValidator1"
                                                            ValidationGroup="U"
                                                            ControlToValidate="Nombre"
                                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                            runat="Server" ID="ValidatorCalloutExtender1"
                                                            TargetControlID="RequiredFieldValidator1" />
                                                    </td>
                                                    
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label3" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Codigo" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Objeto_Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Objeto_Nombre") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                         <asp:Button 
                                                            ID="Button4" 
                                                            runat="server" 
                                                            CommandArgument="RutaDestino: ~/DIC/Dic_Objeto.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre; NoGuardar: Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre"
                                                            CommandName="Zoom" Text="..." />
                                                         <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="RequiredFieldValidator2"
                                                                ValidationGroup="U"
                                                                ControlToValidate="Dic_Objeto_Codigo"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" ID="ValidatorCalloutExtender2"
                                                                TargetControlID="RequiredFieldValidator2" />
                                                             <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ID="RequiredFieldValidator3"
                                                                    ValidationGroup="U"
                                                                    ControlToValidate="Dic_Objeto_Nombre"
                                                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                    runat="Server" ID="ValidatorCalloutExtender3"
                                                                    TargetControlID="RequiredFieldValidator3" />
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label4" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Codigo" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Campo_Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Campo_Nombre") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                        <asp:Button 
                                                            ID="Button5" 
                                                            runat="server" 
                                                            CommandArgument="RutaDestino: ~/DIC/Dic_Campo.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                                            CommandName="Zoom" Text="..." />
                                                       <asp:RequiredFieldValidator 
                                                                runat="server" 
                                                                ID="RequiredFieldValidator4"
                                                                ValidationGroup="U"
                                                                ControlToValidate="Dic_Campo_Codigo"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                runat="Server" ID="ValidatorCalloutExtender4"
                                                                TargetControlID="RequiredFieldValidator4" />
                                                             <asp:RequiredFieldValidator 
                                                                    runat="server" 
                                                                    ID="RequiredFieldValidator5"
                                                                    ValidationGroup="U"
                                                                    ControlToValidate="Dic_Campo_Nombre"
                                                                   ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                                          <AjaxControlToolkit:ValidatorCalloutExtender 
                                                                    runat="Server" ID="ValidatorCalloutExtender5"
                                                                    TargetControlID="RequiredFieldValidator5" />
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="4">
                                                         <asp:Button 
                                                            ID="InsertButton" 
                                                            runat="server" 
                                                            CausesValidation="True" 
                                                            CommandName="Insert"
                                                            ValidationGroup="U"
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
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label7" 
                                    runat="server" 
                                    Text="Dic_Campo_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden"
                                    ID="Dic_Campo_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Campo_Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label9" 
                                    runat="server" 
                                    Text="Estado:"></asp:Label>
                                <asp:TextBox 
                                    Visible="false" 
                                    ID="Estado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label8" 
                                    runat="server" 
                                    Text="Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden"
                                    ID="Id" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label10" 
                                    runat="server" 
                                    Text="Dic_Objeto_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden"
                                    ID="Dic_Objeto_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Objeto_Id") %>'>
                                </asp:TextBox>
            
            
            
           
            
        </InsertItemTemplate>
                                <ItemTemplate>
            <table >
                                                <tr align="right">
                                                    <td colspan="4" >
                                                        <asp:label  
                                                            ID="Estado_Nombre" 
                                                            runat="server" 
                                                            Text='<%# Bind("Estado_Nombre") %>'>
                                                        </asp:label>
                                                    </td>
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label1" 
                                                            runat="server" 
                                                           meta:resourcekey="CodigoRecursoKCG">
                                                         </asp:Label>
                                                     </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ReadOnly="true"
                                                            ID="Codigo" 
                                                            runat="server" 
                                                            Text='<%# Bind("Codigo") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                              </tr>
                                              <tr align="left">
                                                    
                                                    <td>
                                                        <asp:Label  
                                                            ID="Label11" 
                                                            runat="server" 
                                                            meta:resourcekey="DominioRecursoKCG"
                                                            >
                                                        </asp:Label>
                                                    </td>
                                                    <td>
                                                         <asp:TextBox  
                                                            ID="Dominio" 
                                                            runat="server"
                                                            ReadOnly="true"
                                                            MaxLength="3" 
                                                            Text='<%# Bind("Dominio") %>'>
                                                          </asp:TextBox>
                                                    </td>
                                                    <td>
                                                          <asp:Label 
                                                            ID="Label2" 
                                                            runat="server" 
                                                            meta:resourcekey="NombreRecursoKCG">
                                                          </asp:Label>
                                                    </td>
                                                    
                                                    <td>
                                                        <asp:TextBox 
                                                            ID="Nombre" 
                                                            runat="server" 
                                                            ReadOnly="true"
                                                            Text='<%# Bind("Nombre") %>'>
                                                        </asp:TextBox>
                                                    </td>
                                                    
                                                </tr>
                                                <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label3" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Codigo" 
                                                            runat="server" 
                                                            ReadOnly="true"
                                                            Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                                        </asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Objeto_Nombre" 
                                                            ReadOnly="true"
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                                        </asp:TextBox>
                                                       <asp:Button 
                                                            ID="Button2" 
                                                            runat="server" 
                                                            CommandArgument="rutaDestino: ~/DIC/Dic_OBJETO.aspx; filtro: Dic_Objeto_Id;"
                                                            CommandName="Zoom" 
                                                            Text="..." />
                                                             
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="1">
                                                        <asp:Label 
                                                            ID="Label4" 
                                                            runat="server" 
                                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                                        </asp:Label>
                                                    </td>
                                                    <td colspan="3">
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Codigo" 
                                                            ReadOnly="true"
                                                            runat="server" 
                                                            Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                                        </asp:TextBox>
                                                        <asp:TextBox 
                                                            ID="Dic_Campo_Nombre" 
                                                            runat="server" 
                                                            ReadOnly="true"
                                                            Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                                        </asp:TextBox>
                                                        <asp:Button 
                                                            ID="Button3" 
                                                            runat="server" 
                                                            CommandArgument="rutaDestino: ~/DIC/Dic_CAMPO.aspx; filtro: Dic_Campo_Id;"
                                                            CommandName="Zoom" 
                                                            Text="..." />
                                                    </td>
                                                    
                                                </tr>
                                                 <tr align="left">
                                                    <td colspan="4">
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
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label7" 
                                    runat="server" 
                                    Text="Dic_Campo_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden" 
                                    ID="Dic_Campo_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Campo_Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label9" 
                                    runat="server" 
                                    Text="Estado:"></asp:Label>
                                <asp:TextBox 
                                    Visible="false" 
                                    ID="Estado" 
                                    runat="server" 
                                    Text='<%# Bind("Estado") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label8" 
                                    runat="server" 
                                    Text="Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                     Style="visibility:hidden"
                                    ID="Id" 
                                    runat="server" 
                                    Text='<%# Bind("Id") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    Visible="false" 
                                    ID="Label10" 
                                    runat="server" 
                                    Text="Dic_Objeto_Id:">
                                </asp:Label>
                                <asp:TextBox 
                                     Visible="True"
                                    Style="visibility:hidden"
                                    ID="Dic_Objeto_Id" 
                                    runat="server" 
                                    Text='<%# Bind("Dic_Objeto_Id") %>'>
                                </asp:TextBox>
            
            
           
            
        </ItemTemplate>
    </asp:FormView>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicDominio" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="udpBotones" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                meta:resourcekey="Btn_AtrasRecursoKCG"
                Visible="False" AccessKey="B" />
             <asp:Button
                ID="Seleccionar" 
                runat="server" 
                meta:resourcekey="Btn_SeleccionRecursoKCG"
                Visible="False" AccessKey="S" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="udpGVDicDominio" 
        runat="server">
        <ContentTemplate>
            
            <koala:KFiltro ID="kftFiltro" 
            runat="server" 
            Contenedor="DIC_DOMINIO" 
            Objeto="DIC_DOMINIO" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsGVDicDominio"/>
            
            <asp:Panel 
                runat="server" 
                ID="dgGridView" 
                meta:resourcekey="Rec_Listado_DominioRecursoKCG">
            <koala:KGrid 
                ID="gvDicDominio" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False"
                DataKeyNames="Id" 
                DataSourceID="odsGVDicDominio" 
                AllowSorting="True"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                
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
                        DataField="Dominio" 
                        meta:resourcekey="BoundDominioRecursoKCG"
                        SortExpression="Dominio" >
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"
                        SortExpression="Nombre" >
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Dic_Campo_Nombre" 
                       meta:resourcekey="BoundDic_Campo_NombreRecursoKCG" 
                        SortExpression="Dic_Campo_Nombre" >
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Dic_Objeto_Nombre" 
                        meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" 
                        SortExpression="Dic_Objeto_Nombre" >
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Dic_Campo_Id" 
                        HeaderText="Dic_Campo_Id" 
                        SortExpression="Dic_Campo_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Codigo" 
                        HeaderText="Dic_Objeto_Codigo" 
                        SortExpression="Dic_Objeto_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Objeto_Id" 
                        HeaderText="Dic_Objeto_Id" 
                        SortExpression="Dic_Objeto_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Dic_Campo_Codigo" 
                        HeaderText="Dic_Campo_Codigo" 
                        SortExpression="Dic_Campo_Codigo" 
                        Visible="False" />
                </Columns>
            </koala:KGrid>
          </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVDicDominio" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Dominio"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    &nbsp;
    
    <asp:ObjectDataSource 
        ID="odsGVDicDominio" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Dominio">
        <SelectParameters>
            <asp:SessionParameter   
                  Name="s" 
                  SessionField="Scope" 
                  Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

