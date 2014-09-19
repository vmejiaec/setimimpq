<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_FORMULA_TRANSPORTE.aspx.cs" 
    Inherits="APU_APU_PROYECTO_FORMULA_TRANSPORTE" 
    StylesheetTheme="EstiloKCG"
     Theme="EstiloKCG"
     meta:resourcekey="Tit_Apu_Proyecto_Formula_TransporteRecursoKCG"%>
     
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
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <%--Maestro--%>
    <asp:UpdatePanel ID="uppFvMaestro" 
        runat="server" 
        UpdateMode="conditional">
        <ContentTemplate>
    
    <asp:FormView ID="fvMaestroApuProyecto"
        Width="100%" 
        runat="server" 
        DataSourceID="odsMaestroApuProyecto" 
        DataKeyNames="Id,Costo_Transporte,Suma_Porcentaje_Indice_Transporte">
        
        <EditItemTemplate>
        </EditItemTemplate>
        <InsertItemTemplate>
            
        </InsertItemTemplate>
        <ItemTemplate>
            
            <asp:Panel ID="pnlTransporte" 
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Formula_TransporteRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="2">
                            <asp:Label ID="Estado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>

                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                oolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre"
                                ReadOnly="true"
                                Width="400px" 
                                Height="50px"
                                TabIndex="-1"
                                runat="server" 
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCosto_Transporte" 
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_Costo_TransporteRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Transporte"
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Costo_Transporte","{0:N4}") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_Costo_TransporteRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            

            <%--<asp:TextBox ID="Codigo_Institucion" runat="server" Text='<%# Bind("Codigo_Institucion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Area" runat="server" Text='<%# Bind("Area") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto" runat="server" Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Otros" runat="server" Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Creacion" runat="server" Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Id" runat="server" Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Id" runat="server" Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Etapa" runat="server" Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Id" runat="server" Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Id" runat="server" Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" runat="server" Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" runat="server" Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" runat="server" Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_id" runat="server" Text='<%# Bind("Apu_Lugar_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Codigo" runat="server" Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Nombre" runat="server" Text='<%# Bind("Apu_Lugar_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_provincia_id" runat="server" Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Codigo" runat="server" Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Nombre" runat="server" Text='<%# Bind("Apu_Provincia_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Codigo" runat="server" Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Nombre" runat="server" Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Id" runat="server" Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Codigo" runat="server" Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Nombre" runat="server" Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" runat="server" Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" runat="server" Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo" runat="server" Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" runat="server" Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Codigo" runat="server" Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Nombre" runat="server" Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Codigo" runat="server" Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Nombre" runat="server" Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Codigo" runat="server" Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Nombre" runat="server" Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" runat="server" Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Equipo" runat="server" Text='<%# Bind("Costo_Equipo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Mano_Obra" runat="server" Text='<%# Bind("Costo_Mano_Obra") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Material" runat="server" Text='<%# Bind("Costo_Material") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Directo" runat="server" Text='<%# Bind("Costo_Directo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Indirecto" runat="server" Text='<%# Bind("Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Otros" runat="server" Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Total" runat="server" Text='<%# Bind("Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Metro_Cuadrado" runat="server" Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Indirecto_Otros" runat="server" Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto_Otros" runat="server" Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Indice_Sumatoria" runat="server" Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coeficiente_Sumatoria" runat="server" Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Sumatoria" runat="server" Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Coeficiente_Sumatoria" runat="server" Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Suma_Porcentaje_Indice_Transporte" runat="server" Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Etapa_Nombre" runat="server" Text='<%# Bind("Etapa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>--%>
        </ItemTemplate>
    </asp:FormView>
    <div >
    <asp:Button ID="btnFormula" 
        runat="server" 
        meta:resourcekey="Btn_Apu_Proyecto_Formula_Transporte_FormulaRecursoKCG"/>
    <asp:Button ID="btnApuListadoProyecto"
        runat="server"
        Text="Listado" />
    </div>
    
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsMaestroApuProyecto" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter 
                Name="Id" 
                QueryStringField="Apu_Proyecto_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <%--Detalle--%>
    <asp:Panel ID="pnlIndices" 
        runat="server"
        meta:resourcekey="Rec_Apu_Proyecto_Formula_Transporte_IndiceRecursoKCG">

    <asp:UpdatePanel ID="uupFvDetalle" 
        runat="server" 
        UpdateMode="Conditional">
        
        <ContentTemplate>
    
    <asp:FormView ID="fvDetalleApuProyectoTransporteIndice" 
        runat="server" 
        DataSourceID="odsDetalleFvApuProyectoTransporteIndice"
        DefaultMode="Insert" >
        <EditItemTemplate>
            <table>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre"
                            Style="text-transform:uppercase"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Width="400px"
                            Height="50px"
                            TextMode ="MultiLine" 
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator 
                            ID="rfvApu_Indice_Nombre" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Apu_Indice_Nombre" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceApu_Indice_Nombre"
                            TargetControlID="rfvApu_Indice_Nombre"/>
                        
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Indice_Nombre"
                            ServicePath="~/APU/APU_PROYECTO_FORMULA_TRANSPORTE.aspx" 
                            ServiceMethod="GetIndiceEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
                            OnClientItemSelected ="ItemSelected">
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
                        
                        
                        <%-- Prevent enter in textbox from causing the collapsible panel from operating --%>
                        <input type="submit" style="display:none;" />
                            
                        
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Total" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Total"
                            Style="text-align:right"
                            TabIndex="-1" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label2" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            Style="text-align:right" 
                            TabIndex="-1"
                            CssClass="TEXTO_EDICION_KCG" 
                            runat="server" 
                            Text='<%# Bind("Porcentaje") %>'
                            ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox> %
                        <AjaxControlToolkit:MaskedEditExtender 
                            ID="meePorcentaje" 
                            runat="server"
                            TargetControlID="Porcentaje"
                            Mask="999.99"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="False"
                            ClearMaskOnLostFocus="True"
                            />

                        <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                            ControlExtender="meePorcentaje"
                            ControlToValidate="Porcentaje"
                            IsValidEmpty="False"
                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValue="0.01"
                            MaximumValue="100.00" 
                            Display="Dynamic"
                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                            MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            ValidationGroup="I" />  
                          
                          <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="ValidatorCalloutExtender1"
                            TargetControlID="MaskedEditValidator2"/>
                        
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Indice" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Indice"
                            Style="text-align:right"  
                            TabIndex="-1"
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMoneda" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
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
                     
                     <uc2:wucMensajeActualizar ID= "wucMensajeActualizar1" runat="server" />
                    </td>
                </tr>      
            </table>
            
            
            <%--Ids--%>
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
            
            <%--Campos ocultos--%>
           <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Nombre" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Etapa" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
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
                ID="Estado_Nombre" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
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
        
            <table>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre"
                            Style="text-transform:uppercase"
                            CssClass="TEXTO_COMBOPER_KCG"
                            Width="400px"
                            Height="50px"
                            TextMode="MultiLine"
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator 
                            ID="rfvApu_Indice_Nombre" 
                            runat="server"                                                
                            ValidationGroup="I"
                            ControlToValidate="Apu_Indice_Nombre" 
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceApu_Indice_Nombre"
                            TargetControlID="rfvApu_Indice_Nombre"/>
                        
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Apu_Indice_Nombre"
                            ServicePath="~/APU/APU_PROYECTO_FORMULA_TRANSPORTE.aspx" 
                            ServiceMethod="GetIndiceEquipo"
                            MinimumPrefixLength="0" 
                            CompletionInterval="500"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            DelimiterCharacters=""
                            OnClientItemSelected ="ItemSelected">
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
                            
                            
                            var Porcentaje = null;

                            function page_load(sender, e){
                                Porcentaje = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoTransporteIndice_Porcentaje");
                                $addHandler(Porcentaje, "change", Porcentaje_onchange);
                            }
                            
                           
                            function page_unload(sender, e){
                                $removeHandler(Porcentaje, "change", Porcentaje_onchange);
                            }
                            
                            function Porcentaje_onchange(sender, e){
                                Calcular();
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

                                var Apu_Indice_Id = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoTransporteIndice_Apu_Indice_Id");
                                Apu_Indice_Id.value = temp[0];
                                Porcentaje.value = temp[2];
                            
                                Calcular();
                            }
                            
                            function Calcular()
                            {
                                var numCosto_Total = 0.00;
                                var Costo_Total = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoTransporteIndice_Costo_Total");
                                                
                                var numCosto_Total = Number.parseLocale(Costo_Total.value);
                                if(isNaN(numCosto_Total))
                                    numCosto_Total = 0.0; 
                                
                                var numPorcentaje = Number.parseLocale(Porcentaje.value);
                                if(isNaN(numPorcentaje))
                                    numPorcentaje = 0.0;
                                
                                numCosto_Indice = numPorcentaje * numCosto_Total / 100;
                                numCosto_Indice = Redondear(numCosto_Indice, 4);
                                Costo_Indice = $get("ctl00_ContentPlaceHolder1_fvDetalleApuProyectoTransporteIndice_Costo_Indice");
                                Costo_Indice.value = numCosto_Indice.localeFormat("N4");

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
                        <asp:Label ID="lblCosto_Total" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Total"
                            Style="text-align:right" 
                            ReadOnly="true"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            Style="text-align:right" 
                            CssClass="TEXTO_EDICION_KCG" 
                            runat="server" 
                            Text='<%# Bind("Porcentaje") %>'
                            ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>%
                        <AjaxControlToolkit:MaskedEditExtender 
                            ID="meePorcentaje" 
                            runat="server"
                            TargetControlID="Porcentaje"
                            Mask="999.99"
                            MessageValidatorTip="false"
                            OnFocusCssClass="MaskedEditFocus"
                            OnInvalidCssClass="MaskedEditError"
                            MaskType="Number"
                            InputDirection="RightToLeft"
                            AcceptNegative="None"
                            DisplayMoney="None"
                            ErrorTooltipEnabled="False"
                            ClearMaskOnLostFocus="True"
                            />

                        <AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                            ControlExtender="meePorcentaje"
                            ControlToValidate="Porcentaje"
                            IsValidEmpty="False"
                            EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                            MinimumValue="0.01"
                            MaximumValue="100.00" 
                            Display="Dynamic"
                            EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                            MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                            ValidationGroup="I" />  
                          
                          <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="ValidatorCalloutExtender1"
                            TargetControlID="MaskedEditValidator2"/>
                        
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Indice" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Costo_Indice"
                            Style="text-align:right"  
                            ReadOnly="true"
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
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
            
            
            <%--Ids--%>
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
            
            <%--Campos ocultos--%>
           <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Nombre" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Etapa" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
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
                ID="Estado_Nombre" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
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
        
        </InsertItemTemplate>
        
        <ItemTemplate>
            <table>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblApu_Indice_Nombre" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Apu_Indice_Nombre" 
                            ReadOnly="true"
                            Width="400px"
                            TabIndex="-1"
                            Height="50px"
                            TextMode="MultiLine" 
                            CssClass ="TEXTO_LECTURA_KCG"
                            runat="server" 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Total" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Costo_Total"
                            Style="text-align:right" 
                            TabIndex="-1"
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("Costo_Total","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="Label1" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPorcentaje" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Porcentaje"
                            Style="text-align:right" 
                            ReadOnly="true" 
                            TabIndex="-1"
                            runat="server" 
                            Text='<%# Bind("Porcentaje") %>'
                            ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>%
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label ID="lblCosto_Indice" 
                            runat="server"  
                            Text='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.Text").ToString() %>'>
                        </asp:Label>
                    </td>
                    <td style="white-space:nowrap">
                        <asp:TextBox ID="Costo_Indice"
                            Style="text-align:right" 
                            TabIndex="-1"
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("Costo_Indice","{0:N4}") %>'
                            ToolTip='<%# GetLocalResourceObject("Costo_IndiceRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        <asp:Label ID="lblMonedaCosto_Indice" 
                            runat="server" 
                            Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                        </asp:Label>
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="2" >
                       <asp:Button 
                            ID="EditButton" 
                            runat="server"
                            CausesValidation="False" 
                            CommandName="Edit"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Editar ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <asp:Button 
                            ID="DeleteButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Delete"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Eliminar ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <asp:Button 
                            ID="NewButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="New"
                            Enabled='<%# HER.PermisosMovimientos.Movimiento_Apu_Proyecto_Transporte_Indice(Request.QueryString["Estado"], Request.QueryString["Apu_Presupuesto_Estado"], HER.PermisosMovimientos.ModoOperacion.Nuevo ) %>'
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                       </asp:Button>
                       <uc1:wucMensajeEliminar ID="mensajeEliminar" runat="server" />
                       
                    </td>                        
                </tr>
            </table>
 
            <%--Ids--%>
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
            
            <%--Campos ocultos--%>
           <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Codigo" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Nombre" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox Visible="false"
                ID="Apu_Proyecto_Etapa" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
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
                ID="Estado_Nombre" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
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
        GridViewID="gvDetalleApuProyectoTransporteIndice"
        FormViewID="FormViewEquipos" 
        OnNavegar="nav_Siguiente" />
    
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvDetalleApuProyectoTransporteIndice" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsDetalleFvApuProyectoTransporteIndice" 
        runat="server"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById"
        TypeName="FEL.APU.BO_Apu_Proyecto_Transporte_Indice" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues" 
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" 
                Type="Object" />
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

        <asp:UpdatePanel ID="uupGvDetalle" runat="server">
            <ContentTemplate>
            
       <table>
            <tr>
                <td>        
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_PROYECTO_FORMULA_TRANSPORTE" 
                        Objeto="APU_PROYECTO_TRANSPORTE_INDICE" 
                        IndiceScope ="Scope"
                        Orden="1" 
                        ObjectDataSourceID="odsDetalleGvApuProyectoTransporteIndice"/>          
                </td>
            </tr>
        </table>
    <table>
    <tr>
    <td>
    <koala:KGrid ID="gvDetalleApuProyectoTransporteIndice" runat="server"  
        AutoGenerateColumns="False" 
        DataKeyNames="Id" 
        DataSourceID="odsDetalleGvApuProyectoTransporteIndice" 
        AllowPaging="True"
        AllowSorting="True">
        
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" /> 
        
        <Columns>
            <asp:CommandField ButtonType="Button" 
                SelectText="..." 
                ShowSelectButton="True" />
            <asp:BoundField DataField="Apu_Indice_Codigo" 
                meta:resourcekey="BoundCodigoRecursoKCG" 
                SortExpression="Apu_Indice_Codigo" >
                <ItemStyle horizontalalign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Apu_Indice_Nombre" 
                meta:resourcekey="BoundApu_Indice_NombreRecursoKCG" 
                SortExpression="Apu_Indice_Nombre" >
                <ItemStyle Wrap="true" Width="80mm" />
            </asp:BoundField>
            <asp:BoundField DataField="Costo_Total" 
                meta:resourcekey="BoundCosto_TotalRecursoKCG" 
                SortExpression="Costo_Total" 
                dataformatstring="{0:N4}">
                <ItemStyle horizontalalign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Porcentaje" 
                meta:resourcekey="BoundPorcentajeRecursoKCG" 
                SortExpression="Porcentaje">
                <ItemStyle horizontalalign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Costo_Indice" 
                meta:resourcekey="BoundCosto_IndiceRecursoKCG" 
                SortExpression="Costo_Indice" 
                dataformatstring="{0:N4}">
                <ItemStyle horizontalalign="Right" />
            </asp:BoundField>

                <asp:BoundField DataField="Nombre"  HeaderText="Estado"  
            SortExpression="Nombre" Visible="False" />
            
        </Columns>
    </koala:KGrid>
    </td>    
    
    </tr>
    <tr>
        <td>
        <div Style="text-align:right"  >
        <asp:TextBox ID="SumaPorcentajeIndiceTransporte"
            Style="text-align:right" 
            runat="server" 
            ReadOnly="true">
        </asp:TextBox>
        </div>
        </td>
    </tr>
    </table>
    
            </ContentTemplate>
        </asp:UpdatePanel>
        &nbsp;
    <asp:ObjectDataSource ID="odsDetalleGvApuProyectoTransporteIndice" runat="server"
        OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Transporte_Indice">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:QueryStringParameter 
                Name="apu_proyecto_id" 
                QueryStringField="Apu_Proyecto_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    </asp:Panel>
    
</asp:Content>

