<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PARAMETROS.aspx.cs" 
    Inherits="APU_APU_PARAMETROS" 
    meta:resourcekey="Tit_Apu_ParametrosRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>
   
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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:TextBox
                ID="Auxiliar_Id"
                runat="server"
                style="display:none">
            </asp:TextBox>
           <asp:Panel 
            runat="server"
            id="pnldatos"
            meta:resourcekey="Rec_Apu_ParametrosRecursoKCG">
                <asp:FormView 
                    DataSourceID="odsFvApuParametros" 
                    DefaultMode="Insert" 
                    ID="fvApuParametros" runat="server" >
                    <EditItemTemplate>
                        <table>
                            <tr align="right">
                                <td>
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
                                        ID="lblApuManoObra" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                        >
                                     </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("ManoObra_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Nombre" 
                                        Width="400px"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("ManoObra_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: ManoObra_Apu_Indice_Codigo|ManoObra_Apu_Indice_Nombre; Alias:ManoObra"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>                                            
                            </tr>                                            
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblEquipo_Apu_Indice_Codigo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                            >
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Equipo_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Nombre"
                                        Width="400px" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Equipo_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                     <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: Equipo_Apu_Indice_Codigo|Equipo_Apu_Indice_Nombre; Alias:Equipo"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre"
                                        Width="400px" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: Apu_Mano_Obra_Codigo|Apu_Mano_Obra_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Apu_Subtitulo_Cod" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Apu_Subtitulo_Codigo"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        Width="400px"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>'                                                         
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button4" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Nombre; Obtener:Nombre|Id;"                                                        
                                        CommandName="Zoom" 
                                        OnClick="Button4_Click"
                                        Text="..." />
                                </td>
                            </tr>                                            
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblPorcentaje_Costo_Indirecto" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        Style="text-align:right"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                                    </asp:TextBox> %
                                    
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meePorcentaje_Costo_Indirecto" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Indirecto"
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

                                    <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Indirecto" 
                                        runat="server"
                                        ControlExtender="meePorcentaje_Costo_Indirecto"
                                        ControlToValidate="Porcentaje_Costo_Indirecto"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vcePorcentaje_Costo_Indirecto"
                                        TargetControlID="mevPorcentaje_Costo_Indirecto"/>
                                    
                                   
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
                                         <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Visible="true"
                            style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo"
                            Visible="false" 
                            runat="server" Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox
                            ID="Apu_Subtitulo_Id_Oferta_Rubro_Pred"
                            runat="server"
                            Style="display:none"
                            Text='<%# Bind("Apu_Subtitulo_Id_Oferta_Rubro_Pred") %>'>
                        </asp:TextBox>                        
                        
                        <%--CAMPOS OCULTOS--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Equipo_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="ManoObra_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <%--<asp:TextBox 
                            ID="Campo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        <table>
                            <tr align="right">
                                <td>
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
                                        ID="lblApuManoObra" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>
                                     </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("ManoObra_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("ManoObra_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: ManoObra_Apu_Indice_Codigo|ManoObra_Apu_Indice_Nombre;Alias:ManoObra"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>                                            
                            </tr>                                            
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblEquipo_Apu_Indice_Codigo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                            >
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG"  
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Equipo_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Equipo_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                     <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: Equipo_Apu_Indice_Codigo|Equipo_Apu_Indice_Nombre;Alias:Equipo"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre" 
                                        runat="server"
                                        Width="400px"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: Apu_Mano_Obra_Codigo|Apu_Mano_Obra_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>                                            
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Apu_Subtitulo_Cod" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Apu_Subtitulo_Codigo"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        Width="400px"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>                                                        
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button4" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Nombre; Obtener:Nombre|Id;"                                                        
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblPorcentaje_Costo_Indirecto" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'
                                            >
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        Style="text-align:right"
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                                    </asp:TextBox>%
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="meePorcentaje_Costo_Indirecto" 
                                        runat="server"
                                        TargetControlID="Porcentaje_Costo_Indirecto"
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

                                    <AjaxControlToolkit:MaskedEditValidator ID="mevPorcentaje_Costo_Indirecto" 
                                        runat="server"
                                        ControlExtender="meePorcentaje_Costo_Indirecto"
                                        ControlToValidate="Porcentaje_Costo_Indirecto"
                                        IsValidEmpty="False"
                                        EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                        MinimumValue="0.00"
                                        MaximumValue="100.00" 
                                        Display="Dynamic"
                                        EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>' 
                                        MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                        ValidationGroup="I" />  
                                      
                                      <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vcePorcentaje_Costo_Indirecto"
                                        TargetControlID="mevPorcentaje_Costo_Indirecto"/>
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
                        
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo"
                            Visible="false" 
                            runat="server" Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox
                            ID="Apu_Subtitulo_Id_Oferta_Rubro_Pred"
                            runat="server"
                            Style="display:none"
                            Text='<%# Bind("Apu_Subtitulo_Id_Oferta_Rubro_Pred") %>'>
                        </asp:TextBox>
                        
                        <%--CAMPOS OCULTOS--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Equipo_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="ManoObra_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                       <%-- <asp:TextBox 
                            ID="Campo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                       <table>
                            <tr align="right">
                                <td>
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
                                        ID="lblApuManoObra" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                        >
                                     </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("ManoObra_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="ManoObra_Apu_Indice_Nombre" 
                                        Width="400px"
                                        runat="server"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("ManoObra_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("ManoObra_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                    <%--<asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: ManoObra_Apu_Indice_Id;Alias:ManoObra"
                                        CommandName="Zoom" 
                                        Text="..." />--%>
                                </td>                                            
                            </tr>                                            
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblEquipo_Apu_Indice_Codigo" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.Text").ToString() %>'
                                            >
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Codigo" 
                                        runat="server"
                                        ReadOnly="true" 
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Equipo_Apu_Indice_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Equipo_Apu_Indice_Nombre"
                                        Width="400px" 
                                        runat="server"
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("Equipo_Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>'  
                                        Text='<%# Bind("Equipo_Apu_Indice_Nombre") %>'>
                                    </asp:TextBox>
                                     <%--<asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_EQUIPO.aspx; Filtro: Equipo_Apu_Indice_Id; Alias:Equipo"
                                        CommandName="Zoom" 
                                        Text="..." />--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblApu_Mano_Obra_Nombre" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Codigo" 
                                        runat="server"
                                        ReadOnly = "true" 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_CodigoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Mano_Obra_Nombre"
                                        Width="400px" 
                                        runat="server"
                                        ReadOnly = "true"  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Mano_Obra_NombreRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Apu_Mano_Obra_Nombre") %>'>
                                    </asp:TextBox>
                                    <%--<asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_MANO_OBRA.aspx; Filtro: Apu_Mano_Obra_Id;"
                                        CommandName="Zoom" 
                                        Text="..." />--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lbl_Apu_Subtitulo_Cod" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox
                                        ID="Apu_Subtitulo_Codigo"
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        Width="400px"
                                        runat="server"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <%--<asp:Button 
                                        ID="Button4" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Nombre; Obtener:Nombre|Id;"                                                        
                                        CommandName="Zoom" 
                                        Text="..." />--%>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                        <asp:Label 
                                            ID="lblPorcentaje_Costo_Indirecto" 
                                            runat="server" 
                                            Text='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.Text").ToString() %>'
                                            >
                                        </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Porcentaje_Costo_Indirecto" 
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        runat="server"
                                        ToolTip='<%# GetLocalResourceObject("Porcentaje_Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'   
                                        Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                                    </asp:TextBox>%
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
                        <asp:TextBox 
                            ID="Apu_Mano_Obra_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo"
                            Visible="false" 
                            runat="server" Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox
                            ID="Apu_Subtitulo_Id_Oferta_Rubro_Pred"
                            runat="server"
                            Style="display:none"
                            Text='<%# Bind("Apu_Subtitulo_Id_Oferta_Rubro_Pred") %>'>
                        </asp:TextBox>
                        
                        <%--CAMPOS OCULTOS--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Equipo_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"
                            Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="ManoObra_Apu_Indice_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                        </asp:TextBox>
                        <%--<asp:TextBox 
                            ID="Campo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Campo_Nombre") %>'>
                        </asp:TextBox>--%>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
            </asp:FormView>
           </asp:Panel>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsFvApuParametros" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetBySucursal"
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Parametros" 
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
        
</asp:Content>

