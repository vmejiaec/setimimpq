<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_MATERIAL.aspx.cs" 
    Inherits="APU_APU_OFERTA_MATERIAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    Title="Tit_Apu_Oferta_MaterialRecursoKCG" %>
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

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
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
<script type="text/javascript">
    //Sys.Application.add_load(page_load);
    //Sys.Application.add_unload(page_unload);
    var frm = document.getElementById("aspnetForm");
    if (frm) {
        frm.onsubmit = function() { return false; };
    }
                                                                                                                                   
    function ItemSelected( source, eventArgs ) 
    {
        
       var valor = eventArgs.get_value();
        var temp = new Array();
        temp = valor.split('||');
                                            
        var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvapu_oferta_material_Apu_Indice_Id");
        Apu_Indice_Id.value = temp[0];
    }    
</script>
    
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>            
            <asp:FormView 
                ID="fvapu_oferta_material" 
                runat="server" 
                DataSourceID="odsfvapu_oferta_material" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        Id="PanelE1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_OfertaRecursoKCG">
                        <table>     
                        <tr>
                            <td>
                                <asp:Label
                                    id="lbloferta"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    Width="100"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    Width="800"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr> 
                        <tr align="right">
                            <td colspan="2">
                                <asp:label
                                    id="lblestadonombre"
                                    runat="server"                                        
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>
                        </tr>                      
                        </table>
                    </asp:Panel>
                    <asp:Panel
                        id="panelE2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_MaterialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Visible= "false"
			                            ToolTip='<%# GetLocalResourceObject("Apu_Material_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Width="400px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblcosto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="100px"
                                        Style="text-align:right"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N4}") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblindice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td >
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvApu_Indice_Nombre" 
                                        runat="server"                                                
                                        ValidationGroup="I"
                                        ControlToValidate="Apu_Indice_Nombre" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    /> 
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=";,:"
                                        OnClientItemSelected="ItemSelected" >
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
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
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
                    </asp:Panel>
                    
                    <%--id's--%>                  
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>   
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>  
                    
                    <%--campos no visibles--%>                
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"                        
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server"       
                        Visible="false"                
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                 <%--   <asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>         --%>           
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
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
                    <asp:panel
                        Id="panelI1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_OfertaRecursoKCG">
                        <table>     
                        <tr>
                            <td>
                                <asp:Label
                                    id="lbloferta"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    Width="800"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="right">
                            <td colspan="2">
                                <asp:label
                                    id="lblestado"
                                    runat="server"                                        
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>
                        </tr>                       
                        </table>
                    </asp:panel>
                    <asp:panel
                        Id="panelI2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_MaterialRecursoKCG">
                        <table>
                            <tr> 
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Codigo" 
                                        runat="server" 
                                        Visible = "false"
                                        CssClass="TEXTO_EDICION_KCG"
			                            ToolTip='<%# GetLocalResourceObject("Apu_Material_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblcosto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        Width="100px"
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblindice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td >
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_COMBOPER_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1" 
                                        TargetControlID="Apu_Indice_Nombre"
                                        ServicePath="~/APU/APU_OFERTA_MATERIAL.aspx" 
                                        ServiceMethod="GetMaterial"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=";,:"
                                        OnClientItemSelected="ItemSelected" >
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
                                                        var behavior = $find('AutoCompleteEx');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>
                                </td>
                            </tr>


                                    <input type="submit" style="display:none;" />
       
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
                    </asp:panel>      
                    
                    <%--id's--%>                  
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox> 
                    
                    <%--campos no visibles--%>                
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>                    
                     <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"                    
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server"       
                        Visible="false"                
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
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
                    <asp:panel
                        Id="panel_1"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_OfertaRecursoKCG">
                        <table>     
                        <tr>
                            <td>
                                <asp:Label
                                    id="lbloferta"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Width="100"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Codigo") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Oferta_Nombre" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="800"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Oferta_NombreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Oferta_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>  
                        <tr align="right">
                            <td>
                                <asp:label
                                    id="lblestado"
                                    runat="server"                                        
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>
                        </tr>                     
                        </table>
                    </asp:panel>
                    <asp:panel
                        Id="panel_2"
                        runat="server"
                        meta:resourcekey="Rec_Apu_Oferta_Material_MaterialRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Visible = "false"
			                            ToolTip='<%# GetLocalResourceObject("Apu_Material_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                                    </asp:TextBox> 
                                    <asp:Label
                                        id="lblnombre"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label
                                        id="lblcosto"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CostoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Costo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="100px"
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CostoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        id="lbla"
                                        runat="server"
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        id="lblindice"
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Indice_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="400px"
                                        CssClass ="TEXTO_LECTURA_KCG"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Indice_Nombre") %>'>
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
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="DeleteButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Delete"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <asp:Button 
                                        ID="NewButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="New"
                                        Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Oferta_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                   </asp:Button>
                                   <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td>
                            </tr>   
                        </table>
                    </asp:panel>      
                    
                    <%--id's--%>                  
                    
                    <asp:TextBox 
                        ID="Apu_Oferta_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Oferta_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Indice_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>    
                     <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox> 
                    
                    <%--campos no visibles--%>                
                    <asp:TextBox 
                        ID="Apu_Oferta_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Oferta_Etapa") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server"    
                        Visible="false"                     
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>    
                    <asp:TextBox 
                        ID="Apu_Material_Unidad" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Indice_Codigo" 
                        runat="server"       
                        Visible="false"                
                        Text='<%# Bind("Apu_Indice_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                  <%--  <asp:TextBox 
                        ID="Campo_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Campo_Nombre") %>'>
                    </asp:TextBox>       --%>            
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
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
            <koala:KNavegacion ID="nav"
                                runat="server"
                                GridViewID="Gvapu_oferta_material"
                                FormViewID="FormView1" OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="Gvapu_oferta_material" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                ID="odsfvapu_oferta_material" 
                runat="server" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                TypeName="FEL.APU.BO_Apu_Oferta_Material" 
                ConflictDetection="CompareAllValues" 
                DeleteMethod="Delete" 
                SortParameterName="sortExpression" 
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
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_OFERTA_MATERIAL" 
                            Objeto="APU_OFERTA_MATERIAL" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGvapu_oferta_material" />
                    </td>
                    <td>
                        <asp:Button 
                            ID="FormulaButton" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Material_FormulaRecursoKCG.Text").ToString() %>'                       
                            OnClick="FormulaButton_Click"/>
                    </td>
                    <td>
                        <asp:Button 
                            ID="ListadoButton" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Btn_Apu_Oferta_Material_Oferta_ListadoRecursoKCG.Text").ToString() %>'                       
                            OnClick="ListadoButton_Click"/>
                    </td>
                </tr>
            </table>            
            <asp:Panel 
                id="pnlDatosGrid"
                runat="server"            
                meta:resourcekey="Rec_Apu_Oferta_Material_ListadoRecursoKCG">                
                <koala:KGrid  
                ID="Gvapu_oferta_material" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataKeyNames="Id" 
                DataSourceID="odsGvapu_oferta_material">
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
                        meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                        SortExpression="Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Material_Nombre" 
                        meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                        SortExpression="Apu_Material_Nombre" >
                        <headerstyle width="150px" />
                        <itemstyle width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo" 
                        meta:resourcekey="BoundCostoRecursoKCG"
                        SortExpression="Costo" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Indice_Nombre" 
                        meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                        SortExpression="Apu_Indice_Nombre" >
                        <headerstyle width="30px" />
                        <itemstyle width="80mm" />
                    </asp:BoundField>               
                    <asp:BoundField 
                        DataField="Apu_Oferta_Id" 
                        HeaderText="Apu_Oferta_Id" 
                        SortExpression="Apu_Oferta_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Id" 
                        HeaderText="Apu_Indice_Id" 
                        SortExpression="Apu_Indice_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Material_Id" 
                        HeaderText="Apu_Material_Id" 
                        SortExpression="Apu_Material_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Codigo" 
                        HeaderText="Apu_Oferta_Codigo" 
                        SortExpression="Apu_Oferta_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Nombre" 
                        HeaderText="Apu_Oferta_Nombre" 
                        SortExpression="Apu_Oferta_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Oferta_Etapa" 
                        HeaderText="Apu_Oferta_Etapa" 
                        SortExpression="Apu_Oferta_Etapa" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Material_Codigo" 
                        HeaderText="Apu_Material_Codigo"
                        SortExpression="Apu_Material_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Material_Unidad" 
                        HeaderText="Apu_Material_Unidad"
                        SortExpression="Apu_Material_Unidad" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Codigo" 
                        HeaderText="Apu_Indice_Codigo" 
                        SortExpression="Apu_Indice_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Simbolo" 
                        HeaderText="Int_Moneda_Simbolo" 
                        SortExpression="Int_Moneda_Simbolo" Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Campo_Nombre" 
                        HeaderText="Campo_Nombre" 
                        SortExpression="Campo_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        HeaderText="Nombre" 
                        SortExpression="Nombre" 
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
    <table>
        <tr>
            
            
        </tr>
    </table>
    <asp:ObjectDataSource 
        ID="odsGvapu_oferta_material" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOferta" 
        TypeName="FEL.APU.BO_Apu_Oferta_Material">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="Apu_Oferta_Id" QueryStringField="Apu_Oferta_Id" Type="String" />
        </SelectParameters>
   </asp:ObjectDataSource> 
</asp:Content>

