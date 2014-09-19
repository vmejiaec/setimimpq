<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    CodeFile="VER_DOMINIO.aspx.cs" 
    Inherits="VER_VER_DOMINIO" 
    meta:resourcekey="Tit_Ver_DominioRecursoKCG" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc1" %>
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="udpFVVerDominio" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel 
                runat="server" 
                ID="pnlFormView" 
                meta:resourcekey="Rec_Ver_DominioRecursoKCG">
                <asp:FormView 
                    ID="fvVerDominio" 
                    runat="server" 
                    DataSourceID="odsFVVerDominio" 
                    DefaultMode="Insert">
                        <EditItemTemplate>
                            <table>
                                <tr align="left">
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
                                            meta:resourcekey="CodigoRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Codigo"
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                  </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDicDominio" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                          <asp:TextBox 
                                            ID="Dic_Dominio_Dominio" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Dic_Dominio_Dominio") %>'>
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
                                            meta:resourcekey="NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Nombre" 
                                            runat="server"
                                            Width="400px" 
                                            CssClass="TEXTO_EDICION_KCG"
                                            Text='<%# Bind("Nombre") %>'>
                                        </asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" ID="UsuarioReq"
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
                                            ID="lblVersion" 
                                            runat="server" 
                                            meta:resourcekey="Ver_Version_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="ver_version_codigo" 
                                            runat="server" 
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("ver_version_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="ver_version_nombre" 
                                            runat="server"
                                            TabIndex="-1"
                                            ReadOnly="true"
                                            Width="400px"
                                            Text='<%# Bind("ver_version_nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                               <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblObjeto" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Dic_Objeto_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Width="400px"
                                            Text='<%# Bind("Dic_Objeto_nombre") %>'>
                                         </asp:TextBox>
                                        </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblCampo" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                         <asp:TextBox 
                                            ID="Dic_Campo_Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Campo_Nombre" 
                                            runat="server"
                                           ReadOnly="true"
                                            TabIndex="-1" 
                                            Width="400px"
                                            Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDominio" 
                                            runat="server"
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_dominio_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("dic_dominio_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_dominio_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("dic_dominio_nombre") %>'>
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
                                            ID="WucMensajeActualizar1" 
                                            runat="server" />
                                    </td>       
                                </tr>
                            </table>
                            
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Ver_Version_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Ver_Version_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_campo_id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_campo_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Dominio_id"
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_Dominio_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_objeto_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_objeto_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server"
                                Visible="false" 
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>
                         </EditItemTemplate>
                        <InsertItemTemplate>
                            <table>
                                <tr align="left">
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
                                            meta:resourcekey="CodigoRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                  </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDicDominio" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                          <asp:TextBox 
                                            ID="Dic_Dominio_Dominio" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Text='<%# Bind("Dic_Dominio_Dominio") %>'>
                                          </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblNombre" 
                                            runat="server"
                                            meta:resourcekey="NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Nombre" 
                                            runat="server"
                                            Width="400px"
                                            CssClass="TEXTO_EDICION_KCG" 
                                            Text='<%# Bind("Nombre") %>'>
                                        </asp:TextBox>
                                        
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblVersion" 
                                            runat="server" 
                                            meta:resourcekey="Ver_Version_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="ver_version_codigo" 
                                            runat="server" 
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("ver_version_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="ver_version_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("ver_version_nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                               <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblObjeto" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Dic_Objeto_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Width="400px"
                                            Text='<%# Bind("Dic_Objeto_nombre") %>'>
                                         </asp:TextBox>
                                        </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblCampo" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                         <asp:TextBox 
                                            ID="Dic_Campo_Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Campo_Nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1" 
                                            Width="400px"
                                            Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDominio" 
                                            runat="server"
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_dominio_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"  
                                            Text='<%# Bind("dic_dominio_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_dominio_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("dic_dominio_nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Ver_Version_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Ver_Version_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_campo_id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_campo_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Dominio_id"
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_Dominio_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_objeto_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_objeto_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
                            <asp:TextBox 
                                ID="Estado" 
                                runat="server"
                                Visible="false" 
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table>
                                <tr align="left">
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
                                            meta:resourcekey="CodigoRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Codigo") %>'>
                                        </asp:TextBox>
                                  </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDicDominio" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                          <asp:TextBox 
                                            ID="Dic_Dominio_Dominio" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Dic_Dominio_Dominio") %>'>
                                          </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblNombre" 
                                            runat="server"
                                            meta:resourcekey="NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Nombre" 
                                            runat="server" 
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("Nombre") %>'>
                                        </asp:TextBox>
                                        
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblVersion" 
                                            runat="server" 
                                            meta:resourcekey="Ver_Version_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="ver_version_codigo" 
                                            runat="server" 
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("ver_version_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="ver_version_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("ver_version_nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                               <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblObjeto" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Objeto_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Dic_Objeto_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Objeto_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("Dic_Objeto_nombre") %>'>
                                         </asp:TextBox>
                                        </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblCampo" 
                                            runat="server" 
                                            meta:resourcekey="Dic_Campo_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                         <asp:TextBox 
                                            ID="Dic_Campo_Codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="Dic_Campo_Nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        <asp:Label 
                                            ID="lblDominio" 
                                            runat="server"
                                            meta:resourcekey="Dic_Dominio_NombreRecursoKCG">
                                        </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox 
                                            ID="dic_dominio_codigo" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Text='<%# Bind("dic_dominio_codigo") %>'>
                                        </asp:TextBox>
                                        <asp:TextBox 
                                            ID="dic_dominio_nombre" 
                                            runat="server"
                                            ReadOnly="true"
                                            TabIndex="-1"
                                            Width="400px"
                                            Text='<%# Bind("dic_dominio_nombre") %>'>
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
                                    </td>
                                 </tr>
                            </table>
                            
                            <%--Ids--%>
                            <asp:TextBox 
                                ID="Ver_Version_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Ver_Version_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_campo_id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_campo_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Id" 
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_Dominio_id"
                                runat="server"
                                style="display:none"
                                Text='<%# Bind("Dic_Dominio_id") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Dic_objeto_id" 
                                runat="server" 
                                style="display:none"
                                Text='<%# Bind("Dic_objeto_id") %>'>
                            </asp:TextBox>
                            
                            <%--Ocultos--%>
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
                ControlID="gvVerDominio" 
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
                Text="Atras" 
                Visible="False" />
            <asp:Button
                ID="Seleccionar" 
                runat="server" 
                Text="Seleccionar" 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
         ID="odsFVVerDominio" 
         runat="server" 
         ConflictDetection="CompareAllValues" 
         OldValuesParameterFormatString="original{0}" 
         SelectMethod="GetById" 
         SortParameterName="sortExpression" 
         TypeName="FEL.VER.BO_Ver_Dominio" 
         UpdateMethod="Update" 
         DeleteMethod="Delete" 
         InsertMethod="Insert">
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
        ID="udpGVVerDominio" 
        runat="server">
        <ContentTemplate>
        <koala:KNavegacion 
            ID="nav"
            runat="server"
            GridViewID="gvVerDominio"
            FormViewID="FormView1" 
            OnNavegar="nav_Siguiente" />
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="VER_DOMINIO" 
            Objeto="VER_DOMINIO" 
            IndiceScope ="Scope"
            Orden="1" 
            ObjectDataSourceID="odsGVVerDominio"/>
        <asp:Panel 
            runat="server" 
            ID="pnlGridView" 
            meta:resourcekey="Rec_Listado_Ver_DominioRecursoKCG">
            <koala:KGrid 
                ID="gvVerDominio" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False" 
                DataSourceID="odsGVVerDominio" 
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
                                SortExpression="Codigo_int" />
                            <asp:BoundField 
                                DataField="Nombre" 
                                meta:resourcekey="BoundNombreRecursoKCG" 
                                SortExpression="Nombre" >
                                <itemstyle width="80mm" wrap="True" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Dic_Dominio_Dominio" 
                                meta:resourcekey="BoundDic_Dominio_DominioRecursoKCG"
                                SortExpression="Dic_Dominio_Dominio" />
                            <asp:BoundField 
                                DataField="dic_dominio_nombre" 
                                meta:resourcekey="BoundDic_Dominio_NombreRecursoKCG" 
                                SortExpression="dic_dominio_nombre" />
                            <asp:BoundField 
                                DataField="Dic_Objeto_nombre" 
                                meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG"  
                                SortExpression="Dic_Objeto_nombre" />
                            <asp:BoundField 
                                DataField="Dic_Campo_Nombre" 
                                meta:resourcekey="BoundDic_Campo_NombreRecursoKCG"  
                                SortExpression="Dic_Campo_Nombre" />
                            <asp:BoundField 
                                DataField="ver_version_nombre" 
                                 meta:resourcekey="BoundVer_Version_NombreRecursoKCG"
                                SortExpression="ver_version_nombre" />
                            <asp:BoundField 
                                DataField="dic_dominio_codigo" 
                                HeaderText="dic_dominio_codigo" 
                                SortExpression="dic_dominio_codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Dic_Campo_Codigo" 
                                HeaderText="Dic_Campo_Codigo" 
                                SortExpression="Dic_Campo_Codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Dic_Objeto_codigo" 
                                HeaderText="Dic_Objeto_codigo" 
                                SortExpression="Dic_Objeto_codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="ver_version_codigo" 
                                HeaderText="ver_version_codigo" 
                                SortExpression="ver_version_codigo" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Ver_Version_id" 
                                HeaderText="Ver_Version_id" 
                                SortExpression="Ver_Version_id" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Dic_campo_id" 
                                HeaderText="Dic_campo_id" 
                                SortExpression="Dic_campo_id" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Id" 
                                HeaderText="Id" 
                                SortExpression="Id" 
                                Visible="False" />
                            <asp:BoundField 
                                DataField="Dic_Dominio_id" 
                                HeaderText="Dic_Dominio_id" 
                                SortExpression="Dic_Dominio_id" 
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
                                DataField="Dic_objeto_id" 
                                HeaderText="Dic_objeto_id" 
                                SortExpression="Dic_objeto_id" 
                                Visible="False" />
                        </Columns>
            </koala:KGrid >
         </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsGVVerDominio" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.VER.BO_Ver_Dominio">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

