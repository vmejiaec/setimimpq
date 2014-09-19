 <%@ Page Language="C#" 
     MasterPageFile="~/KOALA.master" 
     AutoEventWireup="true" 
     CodeFile="APU_RUBRO_EQUIPO.aspx.cs" 
     Inherits="APU_APU_RUBRO_EQUIPO"   
     StylesheetTheme="EstiloKCG"
     Theme="EstiloKCG"
     meta:resourcekey="Tit_Apu_Rubro_EquipoRecursoKCG" %>
        
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
            <asp:FormView 
                ID="FvApuRubroEquipo" 
                runat="server" 
                DataSourceID="odsFvApuRubroEquipo" 
                AllowPaging="True" 
                DefaultMode="Insert">
            <EditItemTemplate>           
                <asp:Panel 
                  runat="server" 
                  ID="pnlRubro" 
                  meta:resourcekey="Rec_Apu_Rubro_Equipo_RubroRecursoKCG">
                  <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                Width="300px"
                                ID="Apu_Rubro_Nombre"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                
                <asp:Panel 
                    runat="server" 
                    ID="pnlEquipo"  
                    meta:resourcekey="Rec_Apu_Rubro_EquipoRecursoKCG">
                <table>
                    <tr  align="right">
                        <td colspan="4">
                            <asp:Label 
                                ID="lblEstado_nombre" 
                                runat="server" 
                                Text='<%# Eval("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Equipo_Nombre" 
                                runat="server"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID = "Apu_Equipo_Nombre"                                               
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox 
                                ID="Apu_Equipo_Nombre"
                                Style="text-transform:uppercase" 
                                CssClass="TEXTO_COMBOPER_KCG"
                                Height="50px"
                                TextMode="MultiLine" 
                                Width="400px"
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <asp:Button 
                                ID="btnZoomEquipo" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/APU/APU_EQUIPO.aspx; Filtro: Apu_Equipo_Nombre; Obtener: costo_hora|Costo_Hora"
                                CommandName="Zoom" 
                                Text="..." />
                            
                            <asp:RequiredFieldValidator 
                                ID="rfvApu_Equipo_Nombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Apu_Equipo_Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceApu_Equipo_Nombre"
                                TargetControlID="rfvApu_Equipo_Nombre"/>
                            
                            <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Equipo_Nombre"
                            ServicePath="~/APU/APU_RUBRO_EQUIPO.aspx" 
                            ServiceMethod="GetEquipo"
                            MinimumPrefixLength="1" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
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
                        <script type="text/javascript">
                            // Work around browser behavior of "auto-submitting" simple forms
                            Sys.Application.add_load(page_load);
                            Sys.Application.add_unload(page_unload);
                            
                            
                            var Costo_Hora = null;
                            var Cantidad = null;
                            

                            function page_load(sender, e){
                            Cantidad = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_Cantidad");
                            Costo_Hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora");
                            //Costo_Hora.onfocus = function preventFocus(e) { this.blur(); };
                            $addHandler(Cantidad, "change", Cantidad_onchange);
                            
//                            CalcularCosto_hora_x_cantidad ();
                            }
                            
                           
                            function page_unload(sender, e){
                            $removeHandler(Cantidad, "change", Cantidad_onchange);
                            }
                            
                            function Cantidad_onchange(sender, e){
                            CalcularCosto_hora_x_cantidad ();
                            }
                            
                            var frm = document.getElementById("aspnetForm");
                            if (frm) {
                                frm.onsubmit = function() { return false; };
                            }
                            

                            function ItemSelected( source, eventArgs ) 
                            {
                                var valor = eventArgs.get_value();
                                var temp = new Array();
                                temp = valor.split('||');
                                
                                var Apu_Equipo_Codigo = null;
                                var Apu_Equipo_Id = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_Apu_Equipo_Id");
                                var Costo_Hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora");

                                Apu_Equipo_Id.value = temp[0];
                                Costo_Hora.value = temp[2];
                                
                                CalcularCosto_hora_x_cantidad ();
                                 
                            }
                            
                            function CalcularCosto_hora_x_cantidad ()
                            {
                                //CALCULO Costo_hora_x_cantidad
                                var numCosto_hora_x_cantidad = 0.00;
                                
                                var Costo_Hora_x_Cantidad = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora_x_cantidad");
                                                
                                var numCosto_Hora = Number.parseLocale(Costo_Hora.value);
                                if(isNaN(numCosto_Hora))
                                    numCosto_Hora = 0.0; 
                                
                                var numCantidad = Number.parseLocale(Cantidad.value);
                                if(isNaN(numCantidad))
                                    numCantidad = 0.0;
                                
                                numCosto_hora_x_cantidad = numCosto_Hora *  numCantidad;
                                numCosto_hora_x_cantidad = Redondear(numCosto_hora_x_cantidad, 4);
                                Costo_Hora_x_Cantidad.value = numCosto_hora_x_cantidad.localeFormat("N4");
                                
                                //CALCULO TOTAL
                                
                                var apu_rubro_rendimiento_Equipo_hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_apu_rubro_rendimiento_Equipo_hora");
                                var costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_x_rendimiento_hora");
                                
                                var numapu_rubro_rendimiento_Equipo_hora = Number.parseLocale(apu_rubro_rendimiento_Equipo_hora.value);
                                if(!isNaN(numapu_rubro_rendimiento_Equipo_hora))
                                {
                                var numCostoTotal = numapu_rubro_rendimiento_Equipo_hora * numCosto_hora_x_cantidad;
                                numCostoTotal = Redondear(numCostoTotal,4);
                                costo_x_rendimiento_hora.value = numCostoTotal.localeFormat("N4");
                                }
                            }
                            
                            function Redondear(x,numeroDecimales) {
                                return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                            }
                        </script>
                        <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                        <input type="submit" style="display:none;" />
                     </td>
                    </tr>
                    <tr align="left">     
                        <td>
                             <asp:Label 
                                ID="lblCantidad"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                             </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Cantidad"
                                Style="text-align:right"
                                CssClass="TEXTO_EDICION_KCG"  
                                runat="server"
                                Text='<%# Bind("Cantidad") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           
                           <AjaxControlToolkit:MaskedEditExtender ID="meeCantidade" runat="server"
                            TargetControlID="Cantidad"
                            Mask="9,999,999,999,999.9999"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="false"
                            ClearMaskOnLostFocus="True"
                            />
                            
                          <asp:RequiredFieldValidator 
                            ID="rfvCantidad" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Cantidad" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceCantidad"
                            TargetControlID="rfvCantidad"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_hora" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="costo_hora"
                                Style="text-align:right"
                                TabIndex="-1"
                                
                                runat="server" 
                                Text='<%# Bind("costo_hora","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           <asp:Label 
                                ID="lbl" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_hora_x_cantidad" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>:
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                             ID="costo_hora_x_cantidad"
                             Style="text-align:right"
                             TabIndex="-1"
                             
                             runat="server" 
                             Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                             ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>

                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblapu_rubro_rendimiento_Equipo_hora"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        
                        <td>
                            <asp:TextBox 
                                ID="apu_rubro_rendimiento_Equipo_hora"
                                Style="text-align:right" 
                                TabIndex="-1"
                                
                                runat="server" 
                                Text='<%# Bind("apu_rubro_rendimiento_Equipo_hora", "{0:N6}") %>'
                                ToolTip = '<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    
                        <td>
                            <asp:Label 
                                 ID="lblcosto_x_rendimiento_hora" 
                                 runat="server" 
                                 Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                 ID="costo_x_rendimiento_hora"
                                 Style="text-align:right"
                                 TabIndex="-1"
                                 
                                 runat="server" 
                                 Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                 ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label2" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
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
                
                <%--IDs--%>
               
                 <asp:TextBox 
                 ID="Apu_Rubro_Id" 
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Apu_Rubro_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                ID="Apu_Equipo_Id" 
                
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
                </asp:TextBox>
                <%--
                <asp:TextBox 
                ID="TextBox1" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
                </asp:TextBox>
                --%>
                
                <%--Campos ocultos--%>
                
                 <asp:TextBox 
                 ID="Fecha_Creacion" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Fecha_Creacion") %>'>
                 </asp:TextBox>  
                 <asp:TextBox 
                 ID="Fecha_Update" 
                 Visible ="false"
                 runat="server" 
                 Text='<%# Bind("Fecha_Update") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Apu_Equipo_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                  <asp:TextBox 
                ID="costo_diario" 
                Visible = "false"
                runat="server" 
                Text='<%# Bind("costo_diario") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="int_moneda_simbolo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Codigo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Nombre" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
            
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:Panel 
                  runat="server" 
                  ID="pnlRubro" 
                  meta:resourcekey="Rec_Apu_Rubro_Equipo_RubroRecursoKCG">
                  <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Nombre"                                                 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                Width="300px"
                                ID="Apu_Rubro_Nombre"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                
                <asp:Panel 
                    runat="server" 
                    ID="pnlEquipo"  
                    meta:resourcekey="Rec_Apu_Rubro_EquipoRecursoKCG">
                <table>
                    <tr  align="right">
                        <td colspan="4">
                            <asp:Label 
                                ID="lblEstado_nombre" 
                                runat="server" 
                                Text='<%# Eval("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Equipo_Nombre" 
                                runat="server"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID = "Apu_Equipo_Nombre"                                                
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox 
                                ID="Apu_Equipo_Nombre"
                                Style="text-transform:uppercase"  
                                CssClass="TEXTO_COMBOPER_KCG"
                                Height="50px"
                                TextMode="MultiLine" 
                                Width="400px"
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            
                            <asp:Button 
                                ID="btnZoomEquipo" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/APU/APU_EQUIPO.aspx; Filtro: Apu_Equipo_Nombre; Obtener: costo_hora|Costo_Hora"
                                CommandName="Zoom" 
                                Text="..." />
                                
                            <asp:RequiredFieldValidator 
                                ID="rfvApu_Equipo_Nombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Apu_Equipo_Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceApu_Equipo_Nombre"
                                TargetControlID="rfvApu_Equipo_Nombre"/>
                            
                            <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Equipo_Nombre"
                            ServicePath="~/APU/APU_RUBRO_EQUIPO.aspx" 
                            ServiceMethod="GetEquipo"
                            MinimumPrefixLength="1" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
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
                        
                        <script type="text/javascript">
                            // Work around browser behavior of "auto-submitting" simple forms
                            Sys.Application.add_load(page_load);
                            Sys.Application.add_unload(page_unload);
                            
                            
                            var Costo_Hora = null;
                            var Cantidad = null;
                            

                            function page_load(sender, e){
                            Cantidad = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_Cantidad");
                            Costo_Hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora");
                            //Costo_Hora.onfocus = function preventFocus(e) { this.blur(); };
                            $addHandler(Cantidad, "change", Cantidad_onchange);
                            
//                            CalcularCosto_hora_x_cantidad ();
                            }
                            
                           
                            function page_unload(sender, e){
                            $removeHandler(Cantidad, "change", Cantidad_onchange);
                            }
                            
                            function Cantidad_onchange(sender, e){
                            CalcularCosto_hora_x_cantidad ();
                            }
                            
                            var frm = document.getElementById("aspnetForm");
                            if (frm) {
                                frm.onsubmit = function() { return false; };
                            }
                            

                            function ItemSelected( source, eventArgs ) 
                            {
                                var valor = eventArgs.get_value();
                                var temp = new Array();
                                temp = valor.split('||');
                                
                                var Apu_Equipo_Codigo = null;
                                var Apu_Equipo_Id = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_Apu_Equipo_Id");
                                var Costo_Hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora");
                                
                                Apu_Equipo_Id.value = temp[0];
                                Costo_Hora.value = temp[2];
                                
                                CalcularCosto_hora_x_cantidad ();
                                 
                            }
                            
                            function CalcularCosto_hora_x_cantidad ()
                            {
                                //CALCULO Costo_hora_x_cantidad
                                var numCosto_hora_x_cantidad = 0.00;
                                //                                ctl00$ContentPlaceHolder1$FvApuRubroEquipo$costo_hora_x_cantidad
                                //                                ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora_x_cantidad
                                var Costo_Hora_x_Cantidad = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_hora_x_cantidad");
                                                
                                var numCosto_Hora = Number.parseLocale(Costo_Hora.value);
                                if(isNaN(numCosto_Hora))
                                    numCosto_Hora = 0.0; 
                                
                                var numCantidad = Number.parseLocale(Cantidad.value);
                                if(isNaN(numCantidad))
                                    numCantidad = 0.0;
                                
                                numCosto_hora_x_cantidad = numCosto_Hora *  numCantidad;
                                numCosto_hora_x_cantidad = Redondear(numCosto_hora_x_cantidad, 4);
                                Costo_Hora_x_Cantidad.value = numCosto_hora_x_cantidad.localeFormat("N4");
                                
                                //CALCULO TOTAL
                                
                                var apu_rubro_rendimiento_Equipo_hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_apu_rubro_rendimiento_Equipo_hora");
                                var costo_x_rendimiento_hora = $get("ctl00_ContentPlaceHolder1_FvApuRubroEquipo_costo_x_rendimiento_hora");
                                
                                var numapu_rubro_rendimiento_Equipo_hora = Number.parseLocale(apu_rubro_rendimiento_Equipo_hora.value);
                                if(!isNaN(numapu_rubro_rendimiento_Equipo_hora))
                                {
                                var numCostoTotal = numapu_rubro_rendimiento_Equipo_hora * numCosto_hora_x_cantidad;
                                numCostoTotal = Redondear(numCostoTotal,4);
                                costo_x_rendimiento_hora.value = numCostoTotal.localeFormat("N4");
                                }
                            }
                            
                            function Redondear(x,numeroDecimales) {
                                return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);
                            }
                        </script>
                        <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                        <input type="submit" style="display:none;" />
                            
                            
                     </td>
                    </tr>
                    <tr align="left">     
                        <td>
                             <asp:Label 
                                ID="lblCantidad"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                             </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Cantidad"
                                Style="text-align:right"
                                CssClass="TEXTO_EDICION_KCG"  
                                runat="server"
                                Text='<%# Bind("Cantidad") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           
                           <AjaxControlToolkit:MaskedEditExtender ID="meeCantidade" runat="server"
                            TargetControlID="Cantidad"
                            Mask="9,999,999,999,999.9999"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="false"
                            ClearMaskOnLostFocus="True"
                            />
                            
                          <asp:RequiredFieldValidator 
                            ID="rfvCantidad" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Cantidad" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceCantidad"
                            TargetControlID="rfvCantidad"/>
                        </td>
                    </tr>
                    <tr align="left">
                        <td style="white-space:nowrap">
                            <asp:Label 
                                ID="lblcosto_hora" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="costo_hora"
                                TabIndex="-1"
                                Style="text-align:right"
                                
                                runat="server" 
                                Text='<%# Bind("costo_hora","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_hora_x_cantidad" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>:
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                             ID="costo_hora_x_cantidad"
                             TabIndex="-1"
                             Style="text-align:right"
                             
                             runat="server" 
                             Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                             ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                          
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label3" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>

                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblapu_rubro_rendimiento_Equipo_hora"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        
                        <td>
                            <asp:TextBox 
                                ID="apu_rubro_rendimiento_Equipo_hora"
                                Style="text-align:right" 
                                TabIndex="-1"
                                
                                runat="server" 
                                Text='<%# Bind("apu_rubro_rendimiento_Equipo_hora","{0:N6}") %>'
                                ToolTip = '<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    
                        <td>
                            <asp:Label 
                                 ID="lblcosto_x_rendimiento_hora" 
                                 runat="server" 
                                 Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                 ID="costo_x_rendimiento_hora"
                                 Style="text-align:right"
                                 TabIndex="-1"
                                 
                                 runat="server" 
                                 Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                 ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label4" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    
                    <tr align="left">
                        <td colspan="4">
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
            </asp:Panel>
                
                <%--IDs--%>
               
                 <asp:TextBox 
                 ID="Apu_Rubro_Id" 
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Apu_Rubro_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                ID="Apu_Equipo_Id" 
                
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
                </asp:TextBox>
                
                <%--
                <asp:TextBox 
                ID="Apu_Equipo_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
                </asp:TextBox>
                --%>
                  
                <%--Campos ocultos--%>
                
                 <asp:TextBox 
                 ID="Fecha_Creacion" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Fecha_Creacion") %>'>
                 </asp:TextBox>  
                 <asp:TextBox 
                 ID="Fecha_Update" 
                 Visible ="false"
                 runat="server" 
                 Text='<%# Bind("Fecha_Update") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Apu_Equipo_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                  <asp:TextBox 
                ID="costo_diario" 
                Visible = "false"
                runat="server" 
                Text='<%# Bind("costo_diario") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="int_moneda_simbolo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Codigo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Nombre" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
                
            </InsertItemTemplate>
            <ItemTemplate>
            <asp:Panel 
                  runat="server" 
                  ID="pnlRubro" 
                  meta:resourcekey="Rec_Apu_Rubro_Equipo_RubroRecursoKCG">
                  <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server"  
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Nombre"                                                 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Codigo"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                Width="300px"
                                ID="Apu_Rubro_Nombre"
                                TabIndex="-1"
                                ReadOnly = "True"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>   
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Unidad"
                                ReadOnly = "True"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                
                <asp:Panel 
                    runat="server" 
                    ID="pnlEquipo"  
                    meta:resourcekey="Rec_Apu_Rubro_EquipoRecursoKCG">
                <table>
                    <tr  align="right">
                        <td colspan="4">
                            <asp:Label 
                                ID="lblEstado_nombre" 
                                runat="server" 
                                Text='<%# Eval("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Equipo_Nombre" 
                                runat="server"                                                
                                Text='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox 
                                ID="Apu_Equipo_Nombre" 
                                ReadOnly = "True"
                                TabIndex="-1"
                                Height="50px"
                                TextMode ="MultiLine" 
                                CssClass ="TEXTO_LECTURA_KCG"
                                Width="400px"
                                runat="server" 
                                Text='<%# Bind("Apu_Equipo_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Equipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                     </td>
                    </tr>
                    <tr align="left">     
                        <td>
                             <asp:Label 
                                ID="lblCantidad"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                             </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Cantidad"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly = "True"  
                                runat="server"
                                Text='<%# Bind("Cantidad","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_hora" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="costo_hora"
                                Style="text-align:right"
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("costo_hora","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("costo_horaRecursoKCG.ToolTip").ToString() %>'>
                           </asp:TextBox>
                           <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcosto_hora_x_cantidad" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>:
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                             ID="costo_hora_x_cantidad"
                             Style="text-align:right"
                             TabIndex="-1"
                             
                             runat="server" 
                             Text='<%# Bind("costo_hora_x_cantidad","{0:N4}") %>'
                             ToolTip='<%# GetLocalResourceObject("costo_hora_x_cantidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label5" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>

                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblapu_rubro_rendimiento_Equipo_hora"
                                runat="server" 
                                Text='<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        
                        </td>
                        
                        <td>
                            <asp:TextBox 
                                ID="apu_rubro_rendimiento_Equipo_hora"
                                Style="text-align:right" 
                                TabIndex="-1"
                                ReadOnly ="true"
                                runat="server" 
                                Text='<%# Bind("apu_rubro_rendimiento_Equipo_hora","{0:N6}") %>'
                                ToolTip = '<%# GetLocalResourceObject("apu_rubro_rendimiento_Equipo_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    
                        <td>
                            <asp:Label 
                                 ID="lblcosto_x_rendimiento_hora" 
                                 runat="server" 
                                 Text='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                 ID="costo_x_rendimiento_hora"
                                 Style="text-align:right"
                                 TabIndex="-1"
                                 ReadOnly="true"
                                 runat="server" 
                                 Text='<%# Bind("costo_x_rendimiento_hora","{0:N4}") %>'
                                 ToolTip='<%# GetLocalResourceObject("costo_x_rendimiento_horaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label 
                                ID="Label6" 
                                runat="server" 
                                Text='<%# Bind("int_moneda_simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    
                   <tr align="left">
                    <td colspan="4" >
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
                       <uc1:wucMensajeEliminar ID="wucMensajeEliminar1" runat="server" />
                       
                    </td>                        
                </tr> 
                
            </table>
            </asp:Panel>
                
                <%--IDs--%>
               
                 <asp:TextBox 
                 ID="Apu_Rubro_Id" 
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Apu_Rubro_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Id"
                 Style="display:none" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                ID="Apu_Equipo_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Equipo_Id") %>'>
                </asp:TextBox>
                  
                <%--Campos ocultos--%>
                
                 <asp:TextBox 
                 ID="Fecha_Creacion" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Fecha_Creacion") %>'>
                 </asp:TextBox>  
                 <asp:TextBox 
                 ID="Fecha_Update" 
                 Visible ="false"
                 runat="server" 
                 Text='<%# Bind("Fecha_Update") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Apu_Equipo_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Apu_Equipo_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Creacion_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Codigo" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                 </asp:TextBox>
                 <asp:TextBox 
                 ID="Update_Per_Personal_Nombre" 
                 Visible ="false" 
                 runat="server" 
                 Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                 </asp:TextBox>
                  <asp:TextBox 
                ID="costo_diario" 
                Visible = "false"
                runat="server" 
                Text='<%# Bind("costo_diario") %>'>
                </asp:TextBox>
                 <asp:TextBox 
                ID="int_moneda_simbolo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("int_moneda_simbolo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Codigo" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                 <asp:TextBox ID="Nombre" 
                Visible ="false" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
            
            </ItemTemplate>
        </asp:FormView>
        <koala:KNavegacion 
            ID="nav"
            runat="server"
            GridViewID="GvApuRubroEquipo"
            FormViewID="FvApuRubroEquipo" 
            OnNavegar="nav_Siguiente" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="GvApuRubroEquipo" 
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFvApuRubroEquipo" 
        runat="server" 
        DeleteMethod="Delete"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Rubro_Equipo" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues" 
        SortParameterName="sortExpression">
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
            <div style="white-space:nowrap">
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_RUBRO_EQUIPO" 
                Objeto="APU_RUBRO_EQUIPO" 
                IndiceScope ="Scope"
                Orden="1" 
                ObjectDataSourceID="odsGvApuRubroEquipo"/>
                            
            <asp:Button 
                ID="btn_Apu_rubro_equipo_rubro"
                runat="server"
                meta:resourcekey="Btn_Apu_Rubro_Equipo_RubroRecursoKCG" />
            </div>
                    
            <asp:Panel runat="server" 
                ID="pnlEquipo"  
                meta:resourcekey="Rec_Listado_Apu_Rubro_EquipoRecursoKCG">
                <koala:KGrid 
                    ID="GvApuRubroEquipo" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="true" 
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    PageSize="10"  
                    DataSourceID="odsGvApuRubroEquipo"
                    DataKeyNames="Id">
                        <AlternatingRowStyle 
                            CssClass="alternatingrowstyle" />
                        <HeaderStyle 
                            CssClass="headerstyle" />
                        <PagerStyle 
                            CssClass="pagerstyle" />
                        <SelectedRowStyle 
                            CssClass="selectedrowstyle" />
                <Columns>
                    <asp:CommandField 
                        ButtonType="Button" 
                        SelectText="..." 
                        ShowSelectButton="True" />
                    <asp:BoundField 
                        DataField="Apu_Equipo_Codigo" 
                        meta:ResourceKey ="BoundApu_Equipo_CodigoRecursoKCG"
                        SortExpression="Apu_Equipo_Codigo">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Apu_Equipo_Nombre" 
                         meta:ResourceKey ="BoundApu_Equipo_NombreRecursoKCG" 
                        SortExpression="Apu_Equipo_Nombre" >
                        <itemstyle width="80mm" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Cantidad" 
                        meta:ResourceKey ="BoundCantidadRecursoKCG"
                        SortExpression="Cantidad" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="costo_hora" 
                         meta:ResourceKey ="Boundcosto_horaRecursoKCG"
                        SortExpression="costo_hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="costo_hora_x_cantidad" 
                        meta:ResourceKey ="Boundcosto_hora_x_cantidadRecursoKCG" 
                        SortExpression="costo_hora_x_cantidad"
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="apu_rubro_rendimiento_Equipo_hora" 
                        meta:ResourceKey ="Boundapu_rubro_rendimiento_Equipo_horaRecursoKCG" 
                        SortExpression="apu_rubro_rendimiento_Equipo_hora"
                        dataformatstring="{0:N4}"> 
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>                  
                    <asp:BoundField 
                        DataField="costo_x_rendimiento_hora" 
                        meta:ResourceKey ="Boundcosto_x_rendimiento_horaRecursoKCG"
                        SortExpression="costo_x_rendimiento_hora" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Fecha_Update" 
                        meta:resourcekey="BoundFecha_UpdateRecursoKCG"
                        SortExpression="Fecha_Update" />
                    <asp:BoundField 
                        DataField="Apu_Rubro_Id" 
                        HeaderText="Apu_Rubro_Id" 
                        SortExpression="Apu_Rubro_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Equipo_Id" 
                        HeaderText="Apu_Equipo_Id" 
                        SortExpression="Apu_Equipo_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Id" 
                        HeaderText="Creacion_Per_Personal_Id"
                        SortExpression="Creacion_Per_Personal_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Fecha_Creacion" 
                        HeaderText="Fecha_Creacion" 
                        SortExpression="Fecha_Creacion"
                        Visible="False" />
                     <asp:BoundField 
                        DataField="Codigo" 
                        HeaderText="Codigo" 
                        SortExpression="Codigo"
                        Visible = "False" />
                    <asp:BoundField 
                        DataField="Update_Per_Personal_Id" 
                        HeaderText="Update_Per_Personal_Id"
                        SortExpression="Update_Per_Personal_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Rubro_Codigo" 
                        HeaderText="Apu_Rubro_Codigo" 
                        SortExpression="Apu_Rubro_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Rubro_Nombre" 
                        HeaderText="Apu_Rubro_Nombre" 
                        SortExpression="Apu_Rubro_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Rubro_Unidad" 
                        HeaderText="Apu_Rubro_Unidad" 
                        SortExpression="Apu_Rubro_Unidad"
                        Visible="False" />                    
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Codigo" 
                        HeaderText="Creacion_Per_Personal_Codigo"
                        SortExpression="Creacion_Per_Personal_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Nombre" 
                        HeaderText="Creacion_Per_Personal_Nombre"
                        SortExpression="Creacion_Per_Personal_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Update_Per_Personal_Codigo" 
                        HeaderText="Update_Per_Personal_Codigo"
                        SortExpression="Update_Per_Personal_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Update_Per_Personal_Nombre" 
                        HeaderText="Update_Per_Personal_Nombre"
                        SortExpression="Update_Per_Personal_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="costo_diario" 
                        HeaderText="costo_diario" 
                        SortExpression="costo_diario"
                        Visible="False" />                    
                    <asp:BoundField 
                        DataField="int_moneda_simbolo" 
                        HeaderText="int_moneda_simbolo" 
                        SortExpression="int_moneda_simbolo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Campo_Nombre" 
                        HeaderText="Campo_Nombre" 
                        SortExpression="Campo_Nombre"
                        Visible="False" />
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
    <asp:ObjectDataSource 
        ID="odsGvApuRubroEquipo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Equipo">
        <SelectParameters>
        <asp:SessionParameter 
            Name="s" 
            SessionField="Scope" 
            Type="Object" />
        <asp:QueryStringParameter 
            Name="Apu_Rubro_Id" 
            QueryStringField="Apu_Rubro_Id"
            Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>    

