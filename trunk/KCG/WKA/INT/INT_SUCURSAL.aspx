<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="INT_SUCURSAL.aspx.cs" 
    Inherits="INT_INT_SUCURSAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    meta:resourcekey="Tit_Int_SucursalRecursoKCG" %>

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
            <script type="text/javascript">            
                function ItemSelected_Empresa( source, eventArgs ) 
                {   
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
                    var Int_Empresa_Id = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_Int_Empresa_Id");
                    Int_Empresa_Id.value = temp[0];                                                                                                                   
                    var Int_empresa_Codigo = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_Int_empresa_Codigo");   
                    Int_empresa_Codigo.value = temp[1];                                          
                }
                
                function ItemSelected_Moneda( source, eventArgs ) 
                {
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');
                                                        
                    var Int_Moneda_Id = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_Int_Moneda_Id");
                    Int_Moneda_Id.value = temp[0];                                                                                                                   
                    var Int_Moneda_Codigo = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_Int_Moneda_Codigo");   
                    Int_Moneda_Codigo.value = temp[1];                                          
                }                
                
                function checkSelectedValue_Predeterminado()
                {
                    var ddl_Predeterminada = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_ddl_Predeterminada");
                    var Predeterminada   = $get("ctl00_ContentPlaceHolder1_fv_int_sucursal_Predeterminada");
                                    
                    Predeterminada.value = ddl_Predeterminada.options[ddl_Predeterminada.selectedIndex].value;
                }
            </script>
            <asp:FormView 
                ID="fv_int_sucursal" 
                runat="server"                 
                DataSourceID="odsfv_int_sucursal"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Empresa"
                        meta:resourcekey="Rec_Int_Sucursal_EmpresaRecursoKCG">
                        <table>
                            <tr>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Int_Empresa_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Empresa_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="pnl_Sucursal"
                        meta:resourcekey="Rec_Int_SucursalRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Codigo" 
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
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Abreviatura" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvAbreviatura"
                                        runat="server" 
                                        ControlToValidate="Abreviatura"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceAbreviatura"
                                        TargetControlID="rfvAbreviatura"/>
                                </td>
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                               </td>
                            </tr>                                                                                                                                                                                                                                           
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Nombre" 
                                        runat="server"
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
                                        ID="rfvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceNombre"
                                        TargetControlID="rfvNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvNumero"
                                        runat="server" 
                                        ControlToValidate="Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceNumero"
                                        TargetControlID="rfvNumero"/>                                    
                                    <asp:Label 
                                        ID="lbl_Predeterminado" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Predeterminada" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Predeterminada") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Predeterminada" 
                                        runat="server"
                                        Width="150"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'
                                        DataSourceID="odsddl_Predeterminada" 
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Predeterminada_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Predeterminada" 
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
                                                DefaultValue="INT_SUCURSAL" 
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
                                        ID="lbl_Int_Moneda_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Moneda_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Moneda_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Moneda_Nombre"
                                        TargetControlID="rfvInt_Moneda_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Moneda"
                                        ID="autoComplete__Moneda" 
                                        TargetControlID="Int_Moneda_Nombre"
                                        ServicePath="~/INT/INT_SUCURSAL.aspx" 
                                        ServiceMethod="Get_Moneda"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Moneda" >
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
                                                        var behavior = $find('AutoCompleteEx_Moneda');                                                       
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx_Moneda')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx_Moneda')._height" 
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
                                        ID="lbl_Descripcion" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Height="50px"
                                        Width="400px"
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
                                    <asp:Button 
                                        ID="btnEmpresa" 
                                        runat="server"
                                        meta:resourceKey="BTN_EMPRESARecursoKCG"
                                        OnClick="btnEmpresa_Click"/>
                                    <uc2:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />
                                </td>
                            </tr>

                        </table>
                    </asp:Panel>


                    <%--id´s--%>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Imagen" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Imagen") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>

                    
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Empresa"
                        meta:resourcekey="Rec_Int_Sucursal_EmpresaRecursoKCG">
                        <table>
                            <tr>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Int_Empresa_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Empresa_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                                    </asp:TextBox>
                                    
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="pnl_Sucursal"
                        meta:resourcekey="Rec_Int_SucursalRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Codigo" 
                                        runat="server"
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                               </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Abreviatura" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvAbreviatura"
                                        runat="server" 
                                        ControlToValidate="Abreviatura"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceAbreviatura"
                                        TargetControlID="rfvAbreviatura"/>
                                </td>
                            </tr>                                                                                                 
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Nombre" 
                                        runat="server"
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
                                        ID="rfvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceNombre"
                                        TargetControlID="rfvNombre"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvNumero"
                                        runat="server" 
                                        ControlToValidate="Numero"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceNumero"
                                        TargetControlID="rfvNumero"/>
                                    <asp:Label 
                                        ID="lbl_Predeterminado" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Predeterminada" 
                                        runat="server" 
                                        style="display:none"
                                        Text='<%# Bind("Predeterminada") %>'>
                                    </asp:TextBox>
                                    <asp:DropDownList 
                                        ID="ddl_Predeterminada" 
                                        runat="server"
                                        Width="150"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'
                                        DataSourceID="odsddl_Predeterminada" 
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        OnDataBound="Predeterminada_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsddl_Predeterminada" 
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
                                                DefaultValue="INT_SUCURSAL" 
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
                                        ID="lbl_Int_Moneda_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvInt_Moneda_Nombre"
                                        runat="server" 
                                        ControlToValidate="Int_Moneda_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceInt_Moneda_Nombre"
                                        TargetControlID="rfvInt_Moneda_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Moneda"
                                        ID="autoComplete__Moneda" 
                                        TargetControlID="Int_Moneda_Nombre"
                                        ServicePath="~/INT/INT_SUCURSAL.aspx" 
                                        ServiceMethod="Get_Moneda"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Moneda" >
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
                                                        var behavior = $find('AutoCompleteEx_Moneda');                                                       
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel 
                                                        Duration=".4">
                                                        <FadeIn />
                                                        <Length 
                                                            PropertyKey="height" 
                                                            StartValue="0" 
                                                            EndValueScript="$find('AutoCompleteEx_Moneda')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel 
                                                    Duration=".4">
                                                    <FadeOut />
                                                    <Length 
                                                        PropertyKey="height" 
                                                        StartValueScript="$find('AutoCompleteEx_Moneda')._height" 
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
                                        ID="lbl_Descripcion" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Height="50px"
                                        Width="400px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
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
                                        AccessKey="I"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="InsertCancelButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey="C"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/ITCG.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="btnEmpresa" 
                                        runat="server"
                                        meta:resourceKey="BTN_EMPRESARecursoKCG"
                                        OnClick="btnEmpresa_Click"/>
                                </td>
                            </tr>

                        </table>
                    </asp:Panel>


                    <%--id´s--%>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Imagen" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Imagen") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                </InsertItemTemplate>
                
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Empresa"
                        meta:resourcekey="Rec_Int_Sucursal_EmpresaRecursoKCG">
                        <table>
                            <tr>    
                                <td>
                                    <asp:Label 
                                        ID="lbl_Int_Empresa_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Empresa_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Int_empresa_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_empresa_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Empresa_nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_empresa_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Empresa_nombre") %>'>
                                    </asp:TextBox>                                                                        
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        runat="server"
                        ID="pnl_Sucursal"
                        meta:resourcekey="Rec_Int_SucursalRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Codigo" 
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
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Abreviatura" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Abreviatura" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("AbreviaturaRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Abreviatura") %>'>
                                    </asp:TextBox>
                                </td>
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lbl_Estado_Nombre" 
                                        runat="server" 
                                        CssClass="ESTADO"
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                               </td>
                            </tr>                                                                                                                         
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Nombre" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Numero" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("NumeroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NumeroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero") %>'>
                                    </asp:TextBox>                                                                       
                     
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Int_Moneda_Codigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Int_Moneda_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Int_Moneda_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                                    </asp:TextBox>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Descripcion" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        Height="50px"
                                        Width="400px"
                                        ReadOnly="true"
                                        TabIndex="-1"
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
                                    <asp:Button 
                                        ID="btnEmpresa" 
                                        runat="server"
                                        meta:resourceKey="BTN_EMPRESARecursoKCG"
                                        OnClick="btnEmpresa_Click"/>
                                    <uc1:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                                </td>
                            </tr>

                        </table>
                    </asp:Panel>


                    <%--id´s--%>
                                        
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                    <%--campos no visibles--%>                                         
                    
                    <asp:TextBox 
                        ID="Int_Empresa_Imagen" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Imagen") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                    
                    
                    <asp:TextBox 
                        ID="Codigo_int" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo_int") %>'>
                    </asp:TextBox>
                    
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
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gv_int_sucursal" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfv_int_sucursal"     
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.INT.BO_Int_Sucursal"
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
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gv_int_sucursal"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="INT_SUCURSAL" 
                            Objeto="Int_Sucursal" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgv_int_sucursal" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                runat="server"
                id="pnl_Listado"
                meta:resourcekey="Rec_Int_Sucursal_ListadoRecursoKCG">                 
                <koala:KGrid 
                ID="gv_int_sucursal" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                DataKeyNames="Id" 
                DataSourceID="odsgv_int_sucursal"
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
                        SortExpression="Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Abreviatura" 
                        meta:resourcekey="BoundAbreviaturaRecursoKCG" 
                        SortExpression="Abreviatura" >
                        <itemstyle width="40mm" wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField     
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" >
                        <itemstyle width="80mm" wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Int_Empresa_nombre" 
                        meta:resourcekey="BoundInt_Empresa_NombreRecursoKCG" 
                        SortExpression="Int_Empresa_nombre" >
                        <itemstyle width="80mm" wrap="true" />
                    </asp:BoundField>                    
                    <asp:BoundField DataField="Numero" HeaderText="Numero" SortExpression="Numero" Visible="False" />
                    <asp:BoundField DataField="Predeterminada" HeaderText="Predeterminada" SortExpression="Predeterminada" Visible="False" />
                    <asp:BoundField DataField="Int_Empresa_Id" HeaderText="Int_Empresa_Id" SortExpression="Int_Empresa_Id" Visible="False" />
                    <asp:BoundField DataField="Int_Moneda_Id" HeaderText="Int_Moneda_Id" SortExpression="Int_Moneda_Id" Visible="False" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" Visible="False" />
                    <asp:BoundField DataField="Int_empresa_Codigo" HeaderText="Int_empresa_Codigo" SortExpression="Int_empresa_Codigo" Visible="False" />
                    <asp:BoundField DataField="Int_Empresa_Imagen" HeaderText="Int_Empresa_Imagen" SortExpression="Int_Empresa_Imagen" Visible="False" />
                    <asp:BoundField DataField="Int_Moneda_Codigo" HeaderText="Int_Moneda_Codigo" SortExpression="Int_Moneda_Codigo" Visible="False" />
                    <asp:BoundField DataField="Int_Moneda_Nombre" HeaderText="Int_Moneda_Nombre" SortExpression="Int_Moneda_Nombre" Visible="False" />
                    <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" Visible="False" />
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
                    <asp:BoundField DataField="Codigo_int" HeaderText="Codigo_int" SortExpression="Codigo_int" Visible="False" />
                    <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
                </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgv_int_sucursal" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.INT.BO_Int_Sucursal">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Int_Empresa_Id" 
                QueryStringField="Int_Empresa_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
        
</asp:Content>

