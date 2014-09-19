<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_OBJETO.aspx.cs" 
    Inherits="DIC_DIC_OBJETO" 
    meta:resourcekey="Tit_ObjetoRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"%>

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
    
        <br />
        <asp:UpdatePanel 
            ID="updatepanelFV" 
            runat="server" 
            UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">
                function ItemSelected_Modulo_Nombre( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Modulo_Id = $get("ctl00_ContentPlaceHolder1_frmDicObjeto_Dic_Modulo_Id");
                    Dic_Modulo_Id.value = temp[0];   
                    var Dic_Modulo_Codigo = $get("ctl00_ContentPlaceHolder1_frmDicObjeto_Dic_Modulo_Codigo");
                    Dic_Modulo_Codigo.value = temp[1];
                }
            </script>
            <asp:Panel 
                ID="pnlDatos" 
                runat="server" 
                meta:resourcekey="Rec_ObjetoRecursoKCG">
                    <asp:FormView 
                            ID="frmDicObjeto" 
                            runat="server" 
                            DataSourceID="odsFVDicObjeto" 
                            DefaultMode="Insert" >
                                <EditItemTemplate>
                                    <table>
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
                                                    runat="server" 
                                                    meta:resourcekey="CodigoRecursoKCG"
                                                    ID="Label19">
                                                 </asp:Label>
                                            </td>
                                            <td>
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
                                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                        AssociatedControlID="Nombre"
                                                        runat="server" 
                                                        meta:resourcekey="NombreRecursoKCG"
                                                        ID="Label11" >
                                                    </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox 
                                                        ID="Nombre" 
                                                        runat="server" 
                                                        Width="400px"
                                                        Text='<%# Bind("Nombre") %>' 
                                                        CssClass="TEXTO_EDICION_KCG">
                                                   </asp:TextBox>
                                                    <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator1" 
                                                        runat="server"
                                                        ValidationGroup="U" 
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Nombre"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="avcNombre"
                                                        TargetControlID="RequiredFieldValidator1">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                </td>
                                  </tr>
                                    <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="Dic_Modulo_NombreRecursoKCG" 
                                                        ID="Label10" >
                                                     </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox 
                                                        ID="Dic_Modulo_Codigo" 
                                                        runat="server" 
                                                        Text='<%# Bind("Dic_Modulo_Codigo") %>' 
                                                        CssClass="TEXTO_EDICION_KCG">
                                                    </asp:TextBox>
                                                    <asp:TextBox 
                                                        ID="Dic_Modulo_Nombre" 
                                                        runat="server" 
                                                        Width="400px"
                                                        Text='<%# Bind("Dic_Modulo_Nombre") %>' 
                                                        CssClass="TEXTO_EDICION_KCG">
                                                    </asp:TextBox>
                                                    <asp:Button 
                                                        ID="Button3" 
                                                        runat="server" 
                                                        CommandArgument="rutaDestino: ~/DIC/Dic_Modulo.aspx; filtro: dic_modulo_codigo|dic_modulo_nombre"
                                                        CommandName="Zoom" Text="..." />
                                                   <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator2" 
                                                        runat="server"
                                                        ValidationGroup="U"  
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Dic_Modulo_Codigo"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender1"
                                                        TargetControlID="RequiredFieldValidator2">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>                                                     
                                                     <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator3" 
                                                        runat="server" 
                                                        ValidationGroup="U" 
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Dic_Modulo_Nombre"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender2"
                                                        TargetControlID="RequiredFieldValidator3">
                                                    </AjaxControlToolkit:ValidatorCalloutExtender>
                                                    <AjaxControlToolkit:AutoCompleteExtender
                                                        runat="server" 
                                                        BehaviorID="ace_Dic_Modulo_Nombre"
                                                        ID="ac_Dic_Modulo_Nombre" 
                                                        TargetControlID="Dic_Modulo_Nombre"
                                                        ServicePath="~/DIC/DIC_OBJETO.aspx" 
                                                        ServiceMethod="Get_Modulo_Nombre"
                                                        MinimumPrefixLength="0" 
                                                        CompletionInterval="500"
                                                        EnableCaching="true"
                                                        CompletionSetCount="200"
                                                        CompletionListCssClass="autocomplete_completionListElement" 
                                                        CompletionListItemCssClass="autocomplete_listItem" 
                                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                                        OnClientItemSelected="ItemSelected_Modulo_Nombre" >
                                                        <Animations>
                                                            <OnShow>
                                                                <Sequence>
                                                                    <%-- Make the completion list transparent and then show it --%>
                                                                    <OpacityAction Opacity="0" />
                                                                    <HideAction Visible="true" />                                                    
                                                                    <%--Cache the original size of the completion list the first time
                                                                        the animation is played and then set it to zero --%>
                                                                    <ScriptAction Script="
                                                                        // Cache the size and setup the initial size
                                                                        var behavior = $find('ace_Dic_Modulo_Nombre');
                                                                        if (!behavior._height) {
                                                                            var target = behavior.get_completionList();
                                                                            behavior._height = target.offsetHeight - 2;
                                                                            target.style.height = '0px';
                                                                        }" />                                                    
                                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                                    <Parallel Duration=".4">
                                                                        <FadeIn />
                                                                        <Length 
                                                                            PropertyKey="height" 
                                                                            StartValue="0" 
                                                                            EndValueScript="$find('ace_Dic_Modulo_Nombre')._height" />
                                                                    </Parallel>
                                                                </Sequence>
                                                            </OnShow>
                                                            <OnHide>
                                                                <%-- Collapse down to 0px and fade out --%>
                                                                <Parallel Duration=".4">
                                                                    <FadeOut />
                                                                    <Length 
                                                                        PropertyKey="height" 
                                                                        StartValueScript="$find('ace_Dic_Modulo_Nombre')._height" 
                                                                        EndValue="0" />
                                                                </Parallel>
                                                            </OnHide>
                                                        </Animations>
                                                    </AjaxControlToolkit:AutoCompleteExtender> 
                                               </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="NumeroRecursoKCG"  
                                                        ID="Label17" >
                                                     </asp:Label>
                                                </td>   
                                                <td>
                                                    <asp:TextBox 
                                                        ID="Numero" 
                                                        runat="server" 
                                                        Text='<%# Bind("Numero") %>' 
                                                        CssClass="TEXTO_EDICION_KCG">
                                                    </asp:TextBox>
                                                    <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator4" 
                                                        runat="server"
                                                        ValidationGroup="U"  
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Numero"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender4"
                                                        TargetControlID="RequiredFieldValidator4">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                    <asp:CompareValidator 
                                                        ID="CompareValidator1" 
                                                        runat="server"
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                                        Type="Integer"
                                                        ValidationGroup="U"  
                                                        ControlToValidate="Numero" 
                                                        Operator="GreaterThan" 
                                                        ValueToCompare="0"
                                                        ></asp:CompareValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender3"
                                                        TargetControlID="CompareValidator1">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                </td>
                                            </tr>
                                         
                                    <tr align="left">
                                            <td colspan="2">
                                                        <asp:Button 
                                                                ID="UpdateButton" 
                                                                runat="server"
                                                                ValidationGroup="U" 
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
                            
                                         <asp:Label 
                                            runat="server" 
                                            Text="Dic_Modulo_Id:" 
                                            ID="Label1"  
                                            Visible="false">
                                        </asp:Label>   
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Id:" 
                                            ID="Label13" >
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
                                            runat="server" 
                                            Text="Estado:" 
                                            ID="Label14" >
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="false" 
                                            ID="Estado" 
                                            runat="server" 
                                            Text='<%# Bind("Estado") %>'>
                                        </asp:TextBox>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Dic_Modulo_Codigo:" 
                                            ID="Label16" >
                                        </asp:Label>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Codigo:" 
                                            ID="lblCodigo">
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="True" 
                                            Style="visibility:hidden"
                                            ID="Dic_Modulo_Id"  
                                            runat="server" 
                                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                                        </asp:TextBox>
                               </EditItemTemplate>
                                <InsertItemTemplate>
                                <table>
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
                                                    runat="server"
                                                    Visible="false" 
                                                    meta:resourcekey="CodigoRecursoKCG"
                                                    ID="Label19" >
                                                 </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                   
                                                    ID="Codigo" 
                                                    Visible="false"
                                                    runat="server" 
                                                    Text='<%# Bind("Codigo") %>' 
                                                    CssClass="TEXTO_EDICION_KCG">
                                                 </asp:TextBox>
                                                
                                            </td>
                                    </tr>
                                    <tr align="left">
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                        AssociatedControlID="Nombre"
                                                        meta:resourcekey="NombreRecursoKCG"
                                                        ID="Label11" >
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
                                                        ID="RequiredFieldValidator1" 
                                                        runat="server"
                                                        ValidationGroup="I"  
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Nombre"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="avcNombre"
                                                        TargetControlID="RequiredFieldValidator1">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                </td>
                                  </tr>
                                    <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="Dic_Modulo_NombreRecursoKCG" 
                                                        ID="Label10" >
                                                     </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox 
                                                        ID="Dic_Modulo_Codigo" 
                                                        runat="server" 
                                                        Text='<%# Bind("Dic_Modulo_Codigo") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                    <asp:TextBox 
                                                        ID="Dic_Modulo_Nombre" 
                                                        runat="server" 
                                                        Text='<%# Bind("Dic_Modulo_Nombre") %>' CssClass="TEXTO_EDICION_KCG"></asp:TextBox>
                                                    <asp:Button 
                                                        ID="Button3" 
                                                        runat="server" 
                                                        CommandArgument="rutaDestino: ~/DIC/Dic_Modulo.aspx; filtro: dic_modulo_codigo|dic_modulo_nombre"
                                                        CommandName="Zoom" Text="..." />
                                                      <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator2" 
                                                        runat="server"
                                                        ValidationGroup="I" 
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Dic_Modulo_Codigo"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender1"
                                                        TargetControlID="RequiredFieldValidator2">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                     
                                                     <asp:RequiredFieldValidator 
                                                        ID="RequiredFieldValidator3" 
                                                        runat="server"
                                                        ValidationGroup="I" 
                                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                                        ControlToValidate="Dic_Modulo_Nombre"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                                        runat="server"
                                                        Id="ValidatorCalloutExtender2"
                                                        TargetControlID="RequiredFieldValidator3">
                                                     </AjaxControlToolkit:ValidatorCalloutExtender>
                                                    
                                                    
                                               </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="NumeroRecursoKCG"  
                                                        ID="Label17" >
                                                     </asp:Label>
                                                </td>   
                                                <td>
                                                    <asp:TextBox 
                                                        ID="Numero" 
                                                        runat="server" 
                                                        Text='<%# Bind("Numero") %>' 
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
                            
                                         <asp:Label 
                                            runat="server" 
                                            Text="Dic_Modulo_Id:" 
                                            ID="Label1"  
                                            Visible="false">
                                        </asp:Label>   
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Id:" 
                                            ID="Label13" >
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
                                            runat="server" 
                                            Text="Estado:" 
                                            ID="Label14" >
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="false" 
                                            ID="Estado" 
                                            runat="server" 
                                            Text='<%# Bind("Estado") %>'>
                                        </asp:TextBox>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Dic_Modulo_Codigo:" 
                                            ID="Label16" >
                                        </asp:Label>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Codigo:" 
                                            ID="lblCodigo">
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="True" 
                                            Style="visibility:hidden"
                                            ID="Dic_Modulo_Id"  
                                            runat="server" 
                                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                                        </asp:TextBox>
                                  
                        </InsertItemTemplate>
                                <ItemTemplate>
                            <table 
                                        border="0" 
                                        width="600" 
                                        cellspacing="0" 
                                        cellpadding="0" >
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
                                                    runat="server" 
                                                    meta:resourcekey="CodigoRecursoKCG"
                                                    ID="Label19" >
                                                 </asp:Label>
                                            </td>
                                            <td>
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
                                                        runat="server" 
                                                        meta:resourcekey="NombreRecursoKCG"
                                                        ID="Label11" AccessKey="F" AssociatedControlID="Nombre" ></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox 
                                                        ReadOnly="true"
                                                        ID="Nombre" 
                                                        runat="server" 
                                                        Text='<%# Bind("Nombre") %>'>
                                                    </asp:TextBox>
                                                </td>
                                  </tr>
                                    <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="Dic_Modulo_NombreRecursoKCG" 
                                                        ID="Label10" >
                                                     </asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox 
                                                        ReadOnly="true"
                                                        ID="Dic_Modulo_Codigo" 
                                                        runat="server" 
                                                        Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                                    </asp:TextBox>
                                                    <asp:TextBox 
                                                        ID="Dic_Modulo_Nombre" 
                                                        runat="server" 
                                                        Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                                    </asp:TextBox>
                                                    <asp:Button 
                                                        ID="Button3" 
                                                        runat="server" 
                                                        CommandArgument="rutaDestino: ~/DIC/Dic_Modulo.aspx; filtro: Dic_Modulo_Id;"
                                                        CommandName="Zoom" 
                                                        Text="..." />
                                               </td>
                                        </tr>
                                        <tr>
                                                <td>
                                                    <asp:Label 
                                                        runat="server" 
                                                        meta:resourcekey="NumeroRecursoKCG"  
                                                        ID="Label17" >
                                                     </asp:Label>
                                                </td>   
                                                <td>
                                                    <asp:TextBox 
                                                        ReadOnly="true"
                                                        ID="Numero" 
                                                        runat="server" 
                                                        Text='<%# Bind("Numero") %>'>
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                            
                                    <tr align="left">
                                            <td colspan="2">
                                                        <asp:Button 
                                                            ID="Button4"
                                                            runat="server" 
                                                            CausesValidation="False" 
                                                            CommandName="Edit"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>' >
                                                        </asp:Button>
                                                        <asp:Button 
                                                            ID="DeleteButton"
                                                            runat="server" 
                                                            CausesValidation="False" 
                                                            CommandName="Delete"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>' >
                                                        </asp:Button>
                           
                                                        <asp:Button 
                                                            ID="Button6" 
                                                            runat="server" 
                                                            CausesValidation="False" 
                                                            CommandName="New"
                                                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>' > 
                                                    </asp:Button>
                                                <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                             </td>
                                        </tr>
                                    </table>
                            
                                         <asp:Label 
                                            runat="server" 
                                            Text="Dic_Modulo_Id:" 
                                            ID="Label1"  
                                            Visible="false">
                                        </asp:Label>   
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Id:" 
                                            ID="Label13" >
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
                                            runat="server" 
                                            Text="Estado:" 
                                            ID="Label14" >
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="false" 
                                            ID="Estado" 
                                            runat="server" 
                                            Text='<%# Bind("Estado") %>'>
                                        </asp:TextBox>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Dic_Modulo_Codigo:" 
                                            ID="Label16" >
                                        </asp:Label>
                                        <asp:Label 
                                            Visible="false" 
                                            runat="server" 
                                            Text="Codigo:" 
                                            ID="lblCodigo">
                                        </asp:Label>
                                        <asp:TextBox 
                                            Visible="True" 
                                            Style="visibility:hidden"
                                            ID="Dic_Modulo_Id"  
                                            runat="server" 
                                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                                        </asp:TextBox>
                        </ItemTemplate>
        
        
    </asp:FormView>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="GridView1" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVDicObjeto" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Objeto"
        UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
                <asp:Parameter Name="Id" Type="String" />
            </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
            ID="UpdatePanel1" 
            runat="server">
                <ContentTemplate>
                    <asp:Button 
                                                            ID="Atras" 
                                                            runat="server"
                                                            Visible="false" 
                                                             > 
                                                    </asp:Button>
                     <asp:Button 
                                                            ID="Seleccionar" 
                                                            runat="server" 
                                                            Visible="false"
                                                             > 
                                                    </asp:Button>
                </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
            <ContentTemplate>
            <koala:KFiltro ID="kftFiltro" 
            runat="server" 
            Contenedor="DIC_OBJETO" 
            Objeto="DIC_OBJETO" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsGVDicObjeto"/>
                <asp:Panel 
                    runat="server" 
                    ID="pnlGridView" 
                    meta:resourcekey="Rec_Listado_ObjetosRecursoKCG" >
                        <koala:KGrid
                            ID="GridView1" 
                            runat="server" 
                            AllowPaging="True" 
                            AutoGenerateColumns="False"
                            DataKeyNames="Id" 
                            DataSourceID="odsGVDicObjeto" 
                            AllowSorting="True"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' >
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
                                        DataField="Nombre" 
                                        meta:resourcekey="BoundNombreRecursoKCG"
                                        SortExpression="Nombre" >
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Numero" 
                                        meta:resourcekey="BoundNumeroRecursoKCG" 
                                        SortExpression="Numero" >
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Dic_Modulo_Codigo" 
                                        meta:resourcekey="BoundDic_Modulo_CodigoRecursoKCG"  
                                        SortExpression="Dic_Modulo_Codigo" >
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Dic_Modulo_Nombre" 
                                        meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"  
                                        SortExpression="Dic_Modulo_Nombre" >
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Dic_Modulo_Id" 
                                        HeaderText="Dic_Modulo_Id" 
                                        SortExpression="Dic_Modulo_Id" 
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Estado_Nombre" 
                                        HeaderText="Estado_Nombre" 
                                        SortExpression="Estado_Nombre" 
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
    <br />
    <asp:ObjectDataSource 
        ID="odsGVDicObjeto" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" TypeName="FEL.DIC.BO_Dic_Objeto">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
            </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

