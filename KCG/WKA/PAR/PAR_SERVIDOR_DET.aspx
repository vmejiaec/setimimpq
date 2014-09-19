<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_SERVIDOR_DET.aspx.cs" 
    Inherits="PAR_PAR_SERVIDOR_DET" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Par_Servidor_DetRecursoKCG"%>
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
            id="pnldatos"
            meta:resourcekey="Rec_Par_Servidor_DetRecursoKCG">
                <asp:FormView ID="fvParServidorDet" runat="server" DataSourceID="odsParServidorDet" DefaultMode="Insert">
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
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            runat="server" 
                                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Codigo") %>'>
                                         </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                         <asp:Label 
                                            ID="lblServidor" 
                                            runat="server"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                            AssociatedControlID="par_servidor_codigo"
                                            Text='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.Text").ToString() %>'>                                             
                                         </asp:Label>
                                    </td>
                                    <td>
                                       <asp:TextBox 
                                            ID="par_servidor_codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("par_servidor_codigo") %>'
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_CodigoRecursoKCG.ToolTip").ToString() %>'>                                           
                                       </asp:TextBox>
                                       <asp:TextBox 
                                            ID="par_servidor_nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.ToolTip").ToString() %>'                                                                                       
                                            Text='<%# Bind("par_servidor_nombre") %>'>
                                       </asp:TextBox>
                                       <asp:Button 
                                                    ID="Button3" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/PAR/PAR_SERVIDOR.aspx; Filtro: par_servidor_codigo|par_servidor_nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                       <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator1"
                                                ControlToValidate="par_servidor_codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender1"
                                                TargetControlID="RequiredFieldValidator1" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator2"
                                                ControlToValidate="par_servidor_nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender2"
                                                TargetControlID="RequiredFieldValidator2" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblModulo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                          <asp:TextBox 
                                            ID="Dic_Modulo_Codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                          </asp:TextBox>
                                          <asp:TextBox 
                                            ID="Dic_Modulo_Nombre" 
                                            runat="server"
                                            Width="400px"
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                            CssClass="TEXTO_EDICION_KCG"  
                                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                          </asp:TextBox>
                                          <asp:Button 
                                                    ID="Button1" 
                                                    runat="server"
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar: dic_contenedor_Id|dic_contenedor_codigo|dic_contenedor_Nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                          <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator3"
                                                ControlToValidate="Dic_Modulo_Codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender3"
                                                TargetControlID="RequiredFieldValidator3" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator4"
                                                ControlToValidate="Dic_Modulo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender4"
                                                TargetControlID="RequiredFieldValidator4" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblContenedor" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_contenedor_codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'  
                                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_contenedor_nombre" 
                                            runat="server"
                                            Width="400px"
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'  
                                            CssClass="TEXTO_EDICION_KCG"   
                                            Text='<%# Bind("dic_contenedor_nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                                    ID="Button2" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: dic_contenedor_codigo|dic_contenedor_nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                         <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="dic_contenedor_codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator6"
                                                ControlToValidate="dic_contenedor_nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender6"
                                                TargetControlID="RequiredFieldValidator6" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblReferencia" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("ReferenciaRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Referencia" 
                                            runat="server"
                                            Width="561px"
                                            ToolTip='<%# GetLocalResourceObject("ReferenciaRecursoKCG.ToolTip").ToString() %>'  
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("Referencia") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator7"
                                                ControlToValidate="Referencia"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender7"
                                                TargetControlID="RequiredFieldValidator7" />
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
                                        <uc1:wucMensajeActualizar 
                                            ID="WucMensajeActualizar1" 
                                            runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Par_Servidor_Id" 
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Par_Servidor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id"
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Contenedor_Id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Contenedor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Modulo_id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Modulo_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
                            <asp:TextBox 
                                ID="Nombre" 
                                Visible="false"
                                runat="server" 
                                Text='<%# Bind("Nombre") %>'>
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
                                            Visible="false"
                                            runat="server" 
                                            Text="Label">
                                         </asp:Label>
                                    </td>
                                    <td>
                                         <asp:TextBox 
                                            ID="Codigo"
                                            Visible="false"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            runat="server" 
                                            Text='<%# Bind("Codigo") %>'>
                                         </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                         <asp:Label 
                                            ID="lblServidor" 
                                            runat="server"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                            AssociatedControlID="par_servidor_codigo" 
                                            Text='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.Text").ToString() %>'>                                              
                                         </asp:Label>
                                    </td>
                                    <td>
                                       <asp:TextBox 
                                            ID="par_servidor_codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("par_servidor_codigo") %>'>
                                       </asp:TextBox>
                                       <asp:TextBox 
                                            ID="par_servidor_nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("par_servidor_nombre") %>'>
                                       </asp:TextBox>
                                       <asp:Button 
                                                    ID="Button3" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/PAR/PAR_SERVIDOR.aspx; Filtro: par_servidor_codigo|par_servidor_nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                       <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator1"
                                                ControlToValidate="par_servidor_codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender1"
                                                TargetControlID="RequiredFieldValidator1" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator2"
                                                ControlToValidate="par_servidor_nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender2"
                                                TargetControlID="RequiredFieldValidator2" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblModulo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                         </asp:Label>
                                    </td>
                                    <td>
                                          <asp:TextBox 
                                            ID="Dic_Modulo_Codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG"  
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                          </asp:TextBox>
                                          <asp:TextBox 
                                            ID="Dic_Modulo_Nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG"  
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                          </asp:TextBox>
                                          <asp:Button 
                                                    ID="Button1" 
                                                    runat="server"
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar: dic_contenedor_Id|dic_contenedor_codigo|dic_contenedor_Nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                          <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator3"
                                                ControlToValidate="Dic_Modulo_Codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender3"
                                                TargetControlID="RequiredFieldValidator3" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator4"
                                                ControlToValidate="Dic_Modulo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender4"
                                                TargetControlID="RequiredFieldValidator4" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblContenedor" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_contenedor_codigo" 
                                            runat="server"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'  
                                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_contenedor_nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG"   
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'  
                                            Text='<%# Bind("dic_contenedor_nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                                    ID="Button2" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: dic_contenedor_codigo|dic_contenedor_nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />
                                         <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="dic_contenedor_codigo"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator6"
                                                ControlToValidate="dic_contenedor_nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender6"
                                                TargetControlID="RequiredFieldValidator6" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblReferencia" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("ReferenciaRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Referencia" 
                                            runat="server"
                                            Width="561px"
                                            ToolTip='<%# GetLocalResourceObject("ReferenciaRecursoKCG.ToolTip").ToString() %>'
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("Referencia") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator7"
                                                ControlToValidate="Referencia"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender7"
                                                TargetControlID="RequiredFieldValidator7" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td colspan="2">
                                        <asp:Button 
                                            ID="InsertButton" 
                                            runat="server" 
                                            CausesValidation="True" 
                                            ValidationGroup="I"
                                            CommandName="Insert"
                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                                            Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
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
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Par_Servidor_Id" 
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Par_Servidor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id"
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Contenedor_Id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Contenedor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Modulo_id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Modulo_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
                            <asp:TextBox 
                                ID="Nombre" 
                                Visible="false"
                                runat="server" 
                                Text='<%# Bind("Nombre") %>'>
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
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            runat="server" 
                                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Codigo") %>'>
                                         </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                         <asp:Label 
                                            ID="lblServidor" 
                                            runat="server"
                                            Text='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                       <asp:TextBox 
                                            ID="par_servidor_codigo" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("par_servidor_codigo") %>'>
                                       </asp:TextBox>
                                       <asp:TextBox 
                                            ID="par_servidor_nombre" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Width="400px"
                                            ToolTip='<%# GetLocalResourceObject("Par_servidor_NombreRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("par_servidor_nombre") %>'>
                                       </asp:TextBox>
                                       <asp:Button 
                                            ID="Button3" 
                                            runat="server" 
                                            CommandArgument="RutaDestino: ~/PAR/PAR_SERVIDOR.aspx; Filtro: Par_Servidor_Id;"
                                            CommandName="Zoom"
                                            Enabled="false"
                                            Text="..." />
                                       
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblModulo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Dic_Modulo_Codigo" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"  
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Modulo_Nombre" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Width="400px"
                                            ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                        </asp:TextBox>
                                        <asp:Button 
                                            ID="Button1" 
                                            runat="server"
                                            CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Dic_Modulo_id;"
                                            CommandName="Zoom" 
                                            Enabled="false"
                                            Text="..." />
                                         
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblContenedor" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.Text").ToString() %>'>
                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_contenedor_codigo" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true" 
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_CodigoRecursoKCG.ToolTip").ToString() %>'  
                                            Text='<%# Bind("dic_contenedor_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_contenedor_nombre" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            ToolTip='<%# GetLocalResourceObject("Dic_Contenedor_NombreRecursoKCG.ToolTip").ToString() %>'  
                                            Width="400px"
                                            Text='<%# Bind("dic_contenedor_nombre") %>'>
                                        </asp:TextBox>
                                         <asp:Button 
                                            ID="Button2" 
                                            runat="server" 
                                            CommandArgument="RutaDestino: ~/DIC/DIC_CONTENEDOR.aspx; Filtro: Dic_Contenedor_Id;"
                                            CommandName="Zoom"
                                            Enabled="false"
                                            Text="..." />
                                         
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblReferencia" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("ReferenciaRecursoKCG.Text").ToString() %>'>                                            
                                         </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Referencia" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Width="561px"
                                            ToolTip='<%# GetLocalResourceObject("ReferenciaRecursoKCG.ToolTip").ToString() %>'  
                                            Text='<%# Bind("Referencia") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator7"
                                                ControlToValidate="Referencia"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender7"
                                                TargetControlID="RequiredFieldValidator7" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    
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
                                           <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Par_Servidor_Id" 
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Par_Servidor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id"
                                Visible="true"
                                style="display:none"
                                runat="server" 
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Contenedor_Id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Contenedor_Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Modulo_id" 
                                runat="server"
                                Visible="true"
                                style="display:none"
                                Text='<%# Bind("Dic_Modulo_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
                            <asp:TextBox 
                                ID="Nombre" 
                                Visible="false"
                                runat="server" 
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server"
                                Visible="false" 
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>
                        </ItemTemplate>
                </asp:FormView>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvParServidorDet" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsParServidorDet" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.PAR.BO_Par_Servidor_Det"
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
                    GridViewID="gvParServidorDet"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
                </td>
                <td>
                    <koala:KFiltro 
                    ID="kftFiltro" 
                    runat="server" 
                    Contenedor="PAR_SERVIDOR_DET" 
                    Objeto="PAR_SERVIDOR_DET" 
                    IndiceScope ="Scope"
                    Orden="1" 
                    ObjectDataSourceID="odsGVParServidorDet"/>
                </td>
            </tr>
        </table>           
            <asp:Panel 
                runat="server"
                id="pnldatosGrid"
                meta:resourcekey="Rec_Listado_Par_Servidor_DetRecursoKCG">
                     <koala:KGrid
                        ID="gvParServidorDet" 
                        runat="server" 
                        AllowPaging="True" 
                        AutoGenerateColumns="False"
                        DataKeyNames="Id" 
                        DataSourceID="odsGVParServidorDet" 
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
                                DataField="par_servidor_nombre" 
                                meta:resourcekey="BoundPar_servidor_NombreRecursoKCG"
                                SortExpression="par_servidor_nombre" >
                                <itemstyle Width="80mm" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="dic_contenedor_nombre" 
                                meta:resourcekey="BoundDic_Contenedor_NombreRecursoKCG"
                                SortExpression="dic_contenedor_nombre" >
                                <itemstyle Width="80mm" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Referencia" 
                                meta:resourcekey="BoundReferenciaRecursoKCG"
                                SortExpression="Referencia" >
                                <itemstyle Width="80mm" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Dic_Modulo_Nombre" 
                                meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG" 
                                SortExpression="Dic_Modulo_Nombre" >
                                <itemstyle Width="60mm" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Dic_Modulo_Codigo" 
                                HeaderText="Dic_Modulo_Codigo" 
                                SortExpression="Dic_Modulo_Codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Par_Servidor_Id" 
                                HeaderText="Par_Servidor_Id" 
                                SortExpression="Par_Servidor_Id" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="par_servidor_codigo" 
                                HeaderText="par_servidor_codigo"
                                SortExpression="par_servidor_codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Nombre" 
                                HeaderText="Nombre" 
                                SortExpression="Nombre" 
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
                            <asp:BoundField 
                                DataField="Dic_Contenedor_Id" 
                                HeaderText="Dic_Contenedor_Id" 
                                SortExpression="Dic_Contenedor_Id" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Estado" 
                                HeaderText="Estado" 
                                SortExpression="Estado" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="dic_contenedor_codigo" 
                                HeaderText="dic_contenedor_codigo"
                                SortExpression="dic_contenedor_codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Dic_Modulo_id" 
                                HeaderText="Dic_Modulo_id" 
                                SortExpression="Dic_Modulo_id" 
                                Visible="False" />
                        </Columns>
    </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVParServidorDet" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.PAR.BO_Par_Servidor_Det">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

