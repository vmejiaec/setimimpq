<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_FORMULA_MATERIAL.aspx.cs" 
    Inherits="APU_APU_PROYECTO_FORMULA_MATERIAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    meta:resourcekey="Tit_Apu_Proyecto_Formula_MaterialRecursoKCG" %>

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

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">

    <asp:UpdatePanel ID="uppFv" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvApuProyectoMaterial" 
        runat="server" 
        DataSourceID="odsFvApuProyectoMaterial"
        DefaultMode="Insert">
        
        <EditItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_MaterialRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblApu_Proyecto_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                ReadOnly="true"
                                Width="400px" 
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                Height="50px"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlMateriales"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_Material_ListadoRecursoKCG">
                <table>
                <tr align="right">
                    <td colspan="4">
                        <asp:Label ID="Estado_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td >
                     <asp:Label ID="lblApu_Material_Nombre"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>                    
                    <td colspan="3">   
                        <asp:TextBox 
                            ID="txt_p3" 
                            Width="350px"
                            TabIndex="-1"
                            BorderColor="white"
                            BorderStyle="Solid"
                            ReadOnly="true"
                            runat="server"
                            Text="">
                        </asp:TextBox> 
                        <asp:Label ID="lblApu_Indice_Nombre"
                            runat="server"
                            Width="100px"
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text") %>'>
                        </asp:Label>
                        <asp:Label 
                            ID="lbl_Mensaje_PRSNu" 
                            runat="server" 
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ37RecursoKCG.Text").ToString() %>' 
                            Font-Bold="True" 
                            Font-Size="X-Small"
                            ForeColor="OrangeRed">
                        </asp:Label>

                    </td>
                </tr> <!-- I Fila Títulos -->
                <tr>                    
                    <td colspan="3">
                        <asp:TextBox ID="Apu_Material_Nombre"
                            Width="400px"
                            Height="50px"
                            TextMode ="MultiLine" 
                            CssClass="TEXTO_LECTURA_KCG"
                            ReadOnly="true"  
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("lblApu_Material_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td >
                         <asp:TextBox ID="Apu_Indice_Nombre"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Style="text-transform:uppercase" 
                            TextMode ="MultiLine" 
                            Height="50px"
                            Width="400px"
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                         <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Indice_Nombre"
                            ServicePath="~/APU/APU_PROYECTO_FORMULA_MATERIAL.aspx" 
                            ServiceMethod="GetIndice"
                            MinimumPrefixLength="3" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
                            OnClientItemSelected="ItemSelected">
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
                        <input type="submit" style="display:none;" value="Submit Query" />
                        
                    </td>
                 </tr> <!-- I Fila -->
                 <tr>
                    <td>
                        <asp:Label ID="lblApu_Material_Unidad"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>                    
                    <td >
                        <asp:Label ID="lblCosto_Total"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material_X_Costo"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="Apu_Material_Unidad" 
                            ReadOnly="true" 
                            Width="30px"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Unidad") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Cantidad_Material" 
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right" 
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td >
                        <asp:TextBox ID="Costo_Total" 
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Cantidad_Material_X_Costo" 
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material_X_Costo","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>

                <tr align="left">
                    <td colspan="4" >
                     <asp:Button 
                        ID="UpdateButton"
                        ValidationGroup="I" 
                        runat="server"
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
                     
                    <%-- <uc2:wucMensajeActualizar ID= "wucMensajeActualizar1" runat="server" />--%>
                    </td>
                </tr>
                </table>   
            </asp:Panel>
                
            
            <%--IDs--%>
            <asp:TextBox Style="display:none" 
                ID="Apu_Material_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Apu_Proyecto_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Apu_Indice_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            
            <%--Ocultos--%>
            <asp:TextBox Visible="false" 
                ID="Costo_Parcial" 
                runat="server" 
                Text='<%# Bind("Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Otros" 
                runat="server" 
                Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Transporte" 
                runat="server" 
                Text='<%# Bind("Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Proyecto_Etapa" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Total" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Parcial" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Otros" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Total_Costo_Transporte" 
                runat="server" 
                Text='<%# Bind("Costo_Total_Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Indice_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Int_Moneda_Simbolo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            
            <asp:TextBox Visible="false" 
                ID="Codigo" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_MaterialRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblApu_Proyecto_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text") %>'>
                            </asp:Label>
                        </td>
                        <td >
                            <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                ReadOnly="True"
                                style="text-align:right"
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                ReadOnly="True"
                                Width="400px" 
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                Height="50px"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlMateriales"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_Material_ListadoRecursoKCG">
                <table>
                    <tr>
                        <td >
                         <asp:Label ID="lblApu_Material_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text") %>'>
                            </asp:Label>
                        </td>                        
                        <td colspan="3">   
                            <asp:TextBox 
                                ID="txt_p3" 
                                Width="350px"
                                TabIndex="-1"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox> 
                            <asp:Label ID="lblApu_Indice_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text") %>'>
                            </asp:Label>                            
                        </td>
                    </tr> <!-- I Fila Títulos -->
                    <tr>                    
                    <td colspan="3">
                        <asp:TextBox 
                            ID="Apu_Material_Nombre"
                            Width="400px"
                            Height="50px"
                            TextMode ="MultiLine" 
                            ReadOnly="true"  
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("lblApu_Material_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td valign="top" >
                         <asp:TextBox ID="Apu_Indice_Nombre"
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-transform:uppercase" 
                            TextMode ="MultiLine" 
                            Height="50px"
                            Width="400px" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Indice_Nombre"
                            ServicePath="~/APU/APU_PROYECTO_FORMULA_MATERIAL.aspx" 
                            ServiceMethod="GetIndice"
                            MinimumPrefixLength="3" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
                            >
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
                        <script type="text/javascript">
                            // Work around browser behavior of "auto-submitting" simple forms
                            

                            var frm = document.getElementById("aspnetForm");
                            if (frm) {
                                frm.onsubmit = function() { return false; };
                            }
                            

                            function ItemSelected( source, eventArgs ) 
                            {
                                var valor = eventArgs.get_value();
                                var temp = new Array();
                                temp = valor.split('||');

                                var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvApuProyectoMaterial_Apu_Indice_Id");
                                Apu_Indice_Id.value = temp[0];

                            }
                            

                        </script>
                        <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                        <input type="submit" style="display:none;" />
                        

                    </td>
                 </tr> <!-- I Fila -->
                 <tr>
                    <td>
                        <asp:Label ID="lblApu_Material_Unidad"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>                    
                    <td >
                        <asp:Label ID="lblCosto_Total"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material_X_Costo"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="Apu_Material_Unidad" 
                            ReadOnly="true" 
                            Width="30px"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Unidad") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Cantidad_Material" 
                            ReadOnly="true"
                            Style="text-align:right" 
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td >
                        <asp:TextBox ID="Costo_Total" 
                            ReadOnly="true"
                            Style="text-align:right"  
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Cantidad_Material_X_Costo" 
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right"  
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material_X_Costo","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                </table>
                </asp:Panel>
            
            
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_MaterialRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblApu_Proyecto_Nombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text") %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Codigo" 
                                ReadOnly="True"
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                ReadOnly="True"
                                Width="400px"  
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                Height="50px"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlMateriales"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_Material_ListadoRecursoKCG">
                <table>
                    <tr>
                    <td >
                     <asp:Label ID="lblApu_Material_Nombre"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>                    
                    <td colspan="3">   
                        <asp:TextBox 
                            ID="txt_p3" 
                            Width="350px"
                            TabIndex="-1"
                            BorderColor="white"
                            BorderStyle="Solid"
                            ReadOnly="true"
                            runat="server"
                            Text="">
                        </asp:TextBox>                        
                        <asp:Label ID="lblApu_Indice_Nombre"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text") %>'>
                        </asp:Label>                        
                    </td>
                </tr> <!-- I Fila Títulos -->
                <tr>                    
                    <td colspan="3">
                        <asp:TextBox ID="Apu_Material_Nombre"
                            Width="400px"
                            Height="50px"
                            TextMode ="MultiLine" 
                            CssClass="TEXTO_LECTURA_KCG"
                            ReadOnly="true"  
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("lblApu_Material_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td >
                         <asp:TextBox ID="Apu_Indice_Nombre"
                            ReadOnly="true"
                            Style="text-transform:uppercase" 
                            TextMode ="MultiLine" 
                            CssClass ="TEXTO_LECTURA_KCG"
                            Height="50px"
                            Width="400px"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>

                    </td>
                 </tr> <!-- I Fila -->
                 <tr>
                    <td>
                        <asp:Label ID="lblApu_Material_Unidad"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>                    
                    <td >
                        <asp:Label ID="lblCosto_Total"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantidad_Material_X_Costo"
                            Style="white-space:nowrap"
                            runat="server"
                            Text='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.Text") %>'>
                        </asp:Label>
                    </td>
                 </tr>
                 <tr>
                    <td>
                        <asp:TextBox ID="Apu_Material_Unidad" 
                            ReadOnly="true" 
                            Width="30px"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Apu_Material_Unidad") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="Cantidad_Material" 
                            ReadOnly="true"
                            TabIndex="-1"
                            Style="text-align:right" 
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_MaterialRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                    </td>                    
                    <td >
                        <asp:TextBox ID="Costo_Total" 
                            ReadOnly="true"
                            Style="text-align:right"  
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Cantidad_Material_X_Costo" 
                            ReadOnly="true"
                            Style="text-align:right"  
                             TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Cantidad_Material_X_Costo","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Cantidad_Material_X_CostoRecursoKCG.ToolTip") %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" >
                       <asp:Button 
                            ID="EditButton" 
                            runat="server"
                            CausesValidation="False" 
                            CommandName="Edit"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Formula_Material(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <%--<asp:Button 
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
                       </asp:Button>--%>
                    </td>
                </tr>  
                </table>    
            </asp:Panel>
            
                
            
            <%--IDs--%>
            <asp:TextBox Style="display:none" 
                ID="Apu_Material_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Apu_Proyecto_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Apu_Indice_Id" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Id") %>'>
            </asp:TextBox>
            <asp:TextBox Style="display:none" 
                ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            
            <%--Ocultos--%>
            <asp:TextBox Visible="false" 
                ID="Costo_Parcial" 
                runat="server" 
                Text='<%# Bind("Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Otros" 
                runat="server" 
                Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Transporte" 
                runat="server" 
                Text='<%# Bind("Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Proyecto_Etapa" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Total" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Parcial" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Material_Costo_Otros" 
                runat="server" 
                Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Costo_Total_Costo_Transporte" 
                runat="server" 
                Text='<%# Bind("Costo_Total_Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Apu_Indice_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Indice_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Int_Moneda_Simbolo" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            
            <asp:TextBox Visible="false" 
                ID="Codigo" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false" 
                ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            
        </ItemTemplate>
    </asp:FormView>
    
    <koala:KNavegacion 
        ID="nav"
        runat="server"                         
        GridViewID="gvApuProyectoMaterial"
        FormViewID="FormViewEquipos" 
        OnNavegar="nav_Siguiente" />
    
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvApuProyectoMaterial" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsFvApuProyectoMaterial" runat="server" ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" SelectMethod="GetById" SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Proyecto_Material" UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
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
        
    
    <asp:UpdatePanel ID="uppGv" runat="server">
        <ContentTemplate>
        <table>
            <tr>
                <td>
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_PROYECTO_FORMULA_MATERIAL" 
                        Objeto="APU_PROYECTO_MATERIAL" 
                        IndiceScope ="Scope"
                        Orden="1" 
                        ObjectDataSourceID="odsGvApuProyectoMaterial"/>
                  </td>
                  <td>
                        <asp:Button ID="btnListaProyecto" 
                            runat="server" 
                            meta:resourcekey="Btn_Apu_Proyecto_Formula_Material_ListadoRecursoKCG" />
                  </td>
                  <td>
                        <asp:Button ID="btnApuIndice"
                            runat="server"
                            meta:resourcekey="Btn_Apu_Proyecto_Formula_Material_FormulaRecursoKCG"/>
                   </td>
          </tr>
                </table>
    <asp:Panel ID="pnlListado" runat="server"
        meta:resourcekey="Rec_Apu_Proyecto_Formula_Material_ListadoRecursoKCG">
        
    <koala:KGrid ID="gvApuProyectoMaterial" 
        runat="server" 
        AllowPaging="True"
        AllowSorting="true" 
        AutoGenerateColumns="False" 
        DataKeyNames="Id" 
        DataSourceID="odsGvApuProyectoMaterial">
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" /> 
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Apu_Material_Codigo" 
                meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                SortExpression="Apu_Material_Codigo" >
                <itemstyle Wrap="False" horizontalalign="Right" />
            </asp:BoundField>     
            <asp:BoundField DataField="Apu_Material_Nombre" 
                meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                SortExpression="Apu_Material_Nombre">
                <ItemStyle Wrap="False" Width="80mm" />
            </asp:BoundField>
            <asp:BoundField DataField="Apu_Material_Unidad" 
                meta:resourcekey="BoundApu_Material_UnidadRecursoKCG"
                SortExpression="Apu_Material_Unidad" >
                <itemstyle horizontalalign="Center" />
            </asp:BoundField> 
            <asp:BoundField DataField="Cantidad_Material_X_Costo" 
                meta:resourcekey="BoundCantidad_Material_X_CostoRecursoKCG"
                SortExpression="Cantidad_Material_X_Costo" 
                dataformatstring="{0:N4}">
                <ItemStyle horizontalalign="right" />
                </asp:BoundField>
            <asp:BoundField DataField="Apu_Indice_Nombre" 
                meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                SortExpression="Apu_Indice_Nombre">
                <ItemStyle Wrap="False" Width="80mm" />
            </asp:BoundField>
          
          <asp:BoundField DataField="Nombre"  HeaderText="Estado"  
            SortExpression="Nombre" Visible="False" />
            
        </Columns>
    </koala:KGrid>
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsGvApuProyectoMaterial" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" TypeName="FEL.APU.BO_Apu_Proyecto_Material">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter Name="apu_proyecto_Id" QueryStringField="Apu_Proyecto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

