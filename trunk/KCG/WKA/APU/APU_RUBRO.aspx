<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_RUBRO.aspx.cs" 
    Inherits="APU_APU_RUBRO" 
    meta:resourcekey="Tit_Apu_RubroRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    ValidateRequest="false" %>

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
                ID="fvapu_rubro" 
                runat="server" 
                DataSourceID="odsapu_rubro" 
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="pnlerubros"
                        meta:resourcekey="Rec_Apu_RubroRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcodigo"
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        readonly="true"
                                        TabIndex="-1"                                                                                                                 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblespecial"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("EspecialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="Especial" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsespecial" 
                                        DataTextField="Nombre"
                                        DataValueField="Dic_Dominio_Dominio"
                                        TabIndex="-1"
                                        SelectedValue='<%# Bind("Especial") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsespecial" 
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
                                                DefaultValue="APU_RUBRO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="ESPECIAL" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                                                     
                                    <asp:Label
                                        ID="lbldisponible"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                          
                                    <asp:DropDownList 
                                        ID="Disponible" 
                                        runat="server"  
                                        CssClass="TEXTO_EDICION_KCG"                                      
                                        DataSourceID="odsdisponible"
                                        DataTextField="Nombre"
                                        DataValueField="Dic_Dominio_Dominio"
                                        TabIndex="-1"
                                        SelectedValue='<%# Bind("Disponible") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsdisponible" 
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
                                                DefaultValue="APU_RUBRO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                    
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblnombre"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>' 
                                        TextMode="MultiLine"                                                                                                                                                               
                                        Width="400px"
                                        Height="50px">
                                    </asp:TextBox>  
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvnombre"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rfvnombre" />    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblunidad"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>  
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvunidad"
                                        ControlToValidate="Unidad"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender1"
                                        TargetControlID="rfvunidad" />  
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbltitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Codigo" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Nombre" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        width="200px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_TITULO.aspx; Filtro: Apu_Titulo_Codigo|Apu_Titulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rvaputitulocodigo"
                                        runat="server" 
                                        ControlToValidate="Apu_Titulo_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="rvaputitulocodigo"/>
                                    <asp:RequiredFieldValidator 
                                        ID="rvaputitulonombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Titulo_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender3"
                                        TargetControlID="rvaputitulonombre"/>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblsubtitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Codigo" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>  
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        width="200px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Codigo|Apu_Subtitulo_Nombre|Apu_Titulo_Codigo|Apu_Titulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                    <asp:RequiredFieldValidator 
                                        ID="rvapusubtitulocodigo"
                                        runat="server" 
                                        ControlToValidate="Apu_Subtitulo_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender6"
                                        TargetControlID="rvapusubtitulocodigo"/> 
                                    <asp:RequiredFieldValidator 
                                        ID="rvapusubtitulonombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Subtitulo_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="rvapusubtitulonombre"/>                                   
                                </td>  
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcostodirecto"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Directo" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        style="text-align:right"
                                        tabindex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Directo","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostodint_moneda_simbolo" 
                                        runat="server"                                        
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                      
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcostoindirecto"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td colspan="2">
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Indirecto" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        tabindex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostoimoneda" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                                                    
                                    <asp:Label
                                        ID="lblcostototal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        style="text-align:right"
                                        tabindex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostotmoneda" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                      
                                </td> 
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        TextMode="MultiLine"
                                        Width="400px"
                                        Height="50px" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblCreacionPerPersonal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Creacion_Per_Personal_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblFchCreacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblultima_actualizacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label
                                        ID="lblfechaupdate"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server"                                         
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Update") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr> 
                            <tr align="left">
                                <td colspan="2">                                    
                                    <asp:Button 
                                        ID="UpdateButton" 
                                        runat="server" 
                                        CausesValidation="True" 
                                        CommandName="Update"
                                        ValidationGroup="I"
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
                                    <uc2:wucMensajeActualizar 
                                        ID="WucMensajeActualizar1" 
                                        runat="server" />
                                </td>
                            </tr>                                                                                     
                        </table>      
                    </asp:Panel>  
                    <asp:Panel
                        runat="server"
                        id="pnleinsumos"
                        meta:resourcekey="Rec_Apu_rubro_InsumoRecursoKCG">
                        <table>                            
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                 </td>   
                                 <td>
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"   
                                        width="200px"                                                 
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_equipo"
                                        ControlToValidate="Rendimiento_Equipo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender7"
                                        TargetControlID="rfvrendimiento_equipo" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="MaskedEditExtender1" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Equipo"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True"/>                   
                                </td>
                                <tr align="left">    
                                    <td>  
                                        <asp:Label
                                            ID="lblrendimientomano"
                                            runat="server"                                                     
                                            Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                        </asp:Label>  
                                    </td>
                                    <td>                                
                                        <asp:TextBox 
                                            ID="Rendimiento_Mano_Obra" 
                                            runat="server"
                                            Style="text-align:right"
                                            CssClass="TEXTO_EDICION_KCG"   
                                            width="200px"                                                  
                                            ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                            Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator 
                                            runat="server" 
                                            ID="rfvrendimiento_mano_obra"
                                            ControlToValidate="Rendimiento_Mano_Obra"
                                            ValidationGroup="I"
                                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                        <AjaxControlToolkit:ValidatorCalloutExtender 
                                            runat="Server"  ID="ValidatorCalloutExtender2"
                                            TargetControlID="rfvrendimiento_mano_obra" />  
                                        <AjaxControlToolkit:MaskedEditExtender 
                                            ID="arendimientomano_obra" 
                                            runat="server"
                                            TargetControlID="Rendimiento_Mano_Obra"
                                            Mask="9,999,999,999,999.999999"
                                            MessageValidatorTip="false"
                                            OnFocusCssClass="MaskedEditFocus"
                                            OnInvalidCssClass="MaskedEditError"
                                            MaskType="Number"
                                            InputDirection="RightToLeft"
                                            AcceptNegative="None"
                                            DisplayMoney="None"
                                            ErrorTooltipEnabled="false"
                                            ClearMaskOnLostFocus="True"/>                                          
                                    </td>      
                                </tr>                                                                        
                        </table>
                    </asp:Panel>
                    <table>
                        <tr>
                            <td>
                                <asp:Button 
                                    ID="BtnRubroListado" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.Text").ToString() %>'                                                          
                                    ToolTip='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.ToolTip").ToString() %>'
                                    OnClick="BtnRubroListado_Click"/>
                            </td>
                        </tr>
                    </table>
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Apu_rubro_material_transporte_costo_total" 
                        runat="server"
                        visible="false"
                        Text='<%# Bind("Apu_rubro_material_transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_equipo_costo_total" 
                        runat="server"     
                        Visible="false"                                                                                                                        
                        Text='<%# Bind("Apu_rubro_equipo_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_mano_obra_costo_total" 
                        runat="server"                             
                        Visible="false"
                        Text='<%# Bind("Apu_rubro_mano_obra_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_material_costo_total" 
                        runat="server"     
                        Visible="false"                                                                                          
                        Text='<%# Bind("Apu_rubro_material_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_transporte_costo_total" 
                        runat="server"  
                        visible="false"                                                                                              
                        Text='<%# Bind("Apu_rubro_transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_equipo_ultima_fecha_update" 
                        runat="server"     
                        Visible="false"                                                                                           
                        Text='<%# Bind("Apu_rubro_equipo_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_mano_obra_ultima_fecha_update" 
                        runat="server"   
                        Visible="false"                                                                                               
                        Text='<%# Bind("Apu_rubro_mano_obra_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_material_ultima_fecha_update" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Apu_rubro_material_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_transporte_ultima_fecha_update" 
                        runat="server"   
                        Visible="false"                                                                                           
                        Text='<%# Bind("Apu_rubro_transporte_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Porcentaje_costo_indirecto" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Porcentaje_costo_indirecto") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                                       
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="false"                         
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>     
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Especial_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Especial_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Disponible_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Disponible_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>        
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="pnlirubros"
                        meta:resourcekey="Rec_Apu_RubroRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcodigo"
                                        runat="server" 
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        readonly="true"
                                        Visible="False"  
                                        CssClass="TEXTO_EDICION_KCG"                                       
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblespecial"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("EspecialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="ddlEspecial" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataSourceID="odsespecial" 
                                        DataTextField="Nombre"
                                        DataValueField="Dic_Dominio_Dominio"
                                        TabIndex="-1"
                                        SelectedValue='<%# Bind("Especial") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsespecial" 
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
                                                DefaultValue="APU_RUBRO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="ESPECIAL" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                                                      
                                    <asp:Label
                                        ID="lbldisponible"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                        
                                    <asp:DropDownList 
                                        ID="ddlDisponible" 
                                        runat="server"  
                                        CssClass="TEXTO_EDICION_KCG"                                      
                                        DataSourceID="odsdisponible"
                                        DataTextField="Nombre"
                                        DataValueField="Dic_Dominio_Dominio"
                                        TabIndex="-1"
                                        SelectedValue='<%# Bind("Disponible") %>' 
                                        OnDataBound="Disponible_DataBound">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsdisponible" 
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
                                                DefaultValue="APU_RUBRO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="DISPONIBLE" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                    
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblnombre"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        TextMode="MultiLine"                                        
                                        Width="400px"
                                        Height="50px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>                                         
                                    </asp:TextBox>  
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvnombre"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rfvnombre" />    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblunidad"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>  
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvunidad"
                                        ControlToValidate="Unidad"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender1"
                                        TargetControlID="rfvunidad" />  
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbltitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Codigo" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Nombre" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        width="200px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_TITULO.aspx; Filtro: Apu_Titulo_Codigo|Apu_Titulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                    <asp:RequiredFieldValidator 
                                        ID="rvaputitulocodigo"
                                        runat="server" 
                                        ControlToValidate="Apu_Titulo_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="rvaputitulocodigo"/>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvaputitulonombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Titulo_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender8"
                                        TargetControlID="rfvaputitulonombre"/>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblsubtitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Codigo" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>  
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        runat="server" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        width="200px"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Codigo|Apu_Subtitulo_Nombre|Apu_Titulo_Codigo|Apu_Titulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />  
                                    <asp:RequiredFieldValidator 
                                        ID="rvapusubtitulocodigo"
                                        runat="server" 
                                        ControlToValidate="Apu_Subtitulo_Codigo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender6"
                                        TargetControlID="rvapusubtitulocodigo"/>  
                                    <asp:RequiredFieldValidator 
                                        ID="rvapusubtitulonombre"
                                        runat="server" 
                                        ControlToValidate="Apu_Subtitulo_Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="ValidatorCalloutExtender9"
                                        TargetControlID="rvapusubtitulonombre"/>                             
                                </td>  
                            </tr>                                                        
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        TextMode="MultiLine"
                                        Width="400px"
                                        Height="50px" 
                                        Style="text-transform:uppercase"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblCreacionPerPersonal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Creacion_Per_Personal_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblFchCreacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblultima_actualizacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                    
                                    <asp:Label
                                        ID="lblfechaupdate"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server"                                         
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Update") %>'>
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
                    </asp:Panel>  
                    <asp:Panel
                        runat="server"
                        id="pnliinsumos"
                        meta:resourcekey="Rec_Apu_rubro_InsumoRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                 </td>
                                 <td>    
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"   
                                        width="200px"                                                 
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo") %>'>
                                    </asp:TextBox>                                    
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_equipo"
                                        ControlToValidate="Rendimiento_Equipo"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender7"
                                        TargetControlID="rfvrendimiento_equipo" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="MaskedEditExtender1" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Equipo"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />                   
                                </td>
                            </tr>
                            <tr align="left">    
                               <td>  
                                    <asp:Label
                                        ID="lblrendimientomano"
                                        runat="server"                                                     
                                        Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>  
                               </td>
                               <td>                                    
                                    <asp:TextBox 
                                        ID="Rendimiento_Mano_Obra" 
                                        runat="server"
                                        Style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"     
                                        width="200px"                                                
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Rendimiento_Mano_Obra") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rfvrendimiento_mano_obra"
                                        ControlToValidate="Rendimiento_Mano_Obra"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>   
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="ValidatorCalloutExtender2"
                                        TargetControlID="rfvrendimiento_mano_obra" />  
                                    <AjaxControlToolkit:MaskedEditExtender 
                                        ID="arendimientomano_obra" 
                                        runat="server"
                                        TargetControlID="Rendimiento_Mano_Obra"
                                        Mask="9,999,999,999,999.999999"
                                        MessageValidatorTip="false"
                                        OnFocusCssClass="MaskedEditFocus"
                                        OnInvalidCssClass="MaskedEditError"
                                        MaskType="Number"
                                        InputDirection="RightToLeft"
                                        AcceptNegative="None"
                                        DisplayMoney="None"
                                        ErrorTooltipEnabled="false"
                                        ClearMaskOnLostFocus="True" />                                          
                                </td>      
                            </tr> 
                        </table>
                    </asp:Panel>  
                    <table>
                        <tr>
                            <td>
                                <asp:Button 
                                    ID="BtnRubroListado" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.Text").ToString() %>'                                                          
                                    ToolTip='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.ToolTip").ToString() %>'
                                    OnClick="BtnRubroListado_Click"/>
                            </td>
                        </tr>
                    </table>
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"                        
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Apu_rubro_material_transporte_costo_total" 
                        runat="server"
                        visible="false"
                        Text='<%# Bind("Apu_rubro_material_transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_equipo_costo_total" 
                        runat="server"     
                        Visible="false"                                                                                                                        
                        Text='<%# Bind("Apu_rubro_equipo_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_mano_obra_costo_total" 
                        runat="server"                             
                        Visible="false"
                        Text='<%# Bind("Apu_rubro_mano_obra_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_material_costo_total" 
                        runat="server"     
                        Visible="false"                                                                                          
                        Text='<%# Bind("Apu_rubro_material_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_transporte_costo_total" 
                        runat="server"  
                        visible="false"                                                                                              
                        Text='<%# Bind("Apu_rubro_transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_equipo_ultima_fecha_update" 
                        runat="server"     
                        Visible="false"                                                                                           
                        Text='<%# Bind("Apu_rubro_equipo_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_rubro_mano_obra_ultima_fecha_update" 
                        runat="server"   
                        Visible="false"                                                                                               
                        Text='<%# Bind("Apu_rubro_mano_obra_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_material_ultima_fecha_update" 
                        runat="server"
                        Visible="false" 
                        Text='<%# Bind("Apu_rubro_material_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox
                        ID="Apu_rubro_transporte_ultima_fecha_update" 
                        runat="server"   
                        Visible="false"                                                                                           
                        Text='<%# Bind("Apu_rubro_transporte_ultima_fecha_update") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Costo_Directo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Costo_Directo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Costo_Indirecto" 
                        runat="server" 
                        Visible="false"                        
                        Text='<%# Bind("Costo_Indirecto") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Costo_Total" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Costo_Total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_costo_indirecto" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Porcentaje_costo_indirecto") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                                       
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="false"                         
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>     
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Especial_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Especial_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Disponible_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Disponible_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox>                          
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="pnlitrubros"
                        meta:resourcekey="Rec_Apu_RubroRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcodigo"
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>     
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        readonly="true" 
                                        TabIndex="-1"                                                                         
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblespecial"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("EspecialRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                  </td>
                                  <td>                                 
                                    <asp:TextBox
                                        ID="Especial"
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Especial") %>'>                                    
                                    </asp:TextBox>                                                 
                                    <asp:Label
                                        ID="lbldisponible"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DisponibleRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox
                                        ID="Disponible"
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Disponible") %>'>                                    
                                    </asp:TextBox>                                                                     
                                </td>
                            </tr>  
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblnombre"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server"   
                                        ReadOnly="true" 
                                        CssClass ="TEXTO_LECTURA_KCG"                                                                           
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>' 
                                        TextMode="MultiLine" 
                                        Height="50px"
                                        Width="400px">                                        
                                    </asp:TextBox>                                         
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblunidad"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Unidad" 
                                        runat="server" 
                                        ReadOnly="true"                                                                               
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("UnidadRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Unidad") %>'>
                                    </asp:TextBox>                                      
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbltitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>   
                                </td>
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Codigo" 
                                        runat="server" 
                                        ReadOnly="true" 
                                        TabIndex="-1"                                     
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Titulo_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"  
                                        width="200px"
                                        TabIndex="-1"                                      
                                        ToolTip='<%# GetLocalResourceObject("Apu_Titulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Titulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button3" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_TITULO.aspx; Filtro: Apu_Titulo_Codigo|Apu_Titulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..."  Enabled="false" />                                   
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblsubtitulo"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td colspan="2">
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Codigo") %>'>
                                    </asp:TextBox>  
                                    <asp:TextBox 
                                        ID="Apu_Subtitulo_Nombre" 
                                        runat="server"    
                                        ReadOnly="true"  
                                        width="200px"
                                        TabIndex="-1"                                   
                                        ToolTip='<%# GetLocalResourceObject("Apu_Subtitulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Subtitulo_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button1" 
                                        runat="server" 
                                        CommandArgument="RutaDestino: ~/APU/APU_SUBTITULO.aspx; Filtro: Apu_Subtitulo_Codigo|Apu_Subtitulo_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..."  Enabled="false"/>                                      
                                </td>  
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcostodirecto"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Directo" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        style="text-align:right"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Directo","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostodint_moneda_simbolo" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                      
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lblcostoindirecto"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td style="white-space:nowrap">
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Indirecto" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostoimoneda" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                                                    
                                    <asp:Label
                                        ID="lblcostototal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                    
                                    <%--campo calculado--%>
                                    <asp:TextBox 
                                        ID="Costo_Total" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Costo_Total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblcostotmoneda" 
                                        runat="server"                                         
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>                                        
                                </td> 
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="lbldescripcion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Descripcion" 
                                        runat="server" 
                                        TextMode="MultiLine"
                                        CssClass ="TEXTO_LECTURA_KCG"    
                                        Width="400px"
                                        Height="50px" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Descripcion") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblCreacionPerPersonal"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Creacion_Per_Personal_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lblFchCreacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                    <asp:TextBox 
                                        ID="Fecha_Creacion" 
                                        runat="server" 
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_CreacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Creacion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lblultima_actualizacion"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Update_Per_Personal_Nombre" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        width="200px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                    </asp:TextBox>                                   
                                    <asp:Label
                                        ID="lblfechaupdate"
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                   
                                    <asp:TextBox 
                                        ID="Fecha_Update" 
                                        runat="server"                                         
                                        ReadOnly="True"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Fecha_UpdateRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Update") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="3">    
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
                                    <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                                </td> 
                            </tr>                                                                               
                        </table>      
                    </asp:Panel>                      
                    <asp:Panel
                        runat="server"
                        id="pnlitinsumos"
                        meta:resourcekey="Rec_Apu_rubro_InsumoRecursoKCG">                       
                        <table style="white-space:nowrap">
                            <tr align="left">  
                                <td>
                                </td>  
                                <td>                                    
                                </td>
                                <td>
                                </td>
                                <td align="center">
                                    <asp:Label
                                    ID="lblinsumocosto"
                                    runat="server" 
                                    visible="true"                                                                                              
                                    Text='<%# GetLocalResourceObject("Lab_Rubro_Insumo_CostoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="white-space:nowrap">
                                    <asp:Label
                                        ID="lblrendimiento"
                                        runat="server"                                                                                                        
                                        Text='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                 </td>   
                                 <td>
                                    <asp:TextBox 
                                        ID="Rendimiento_Equipo" 
                                        runat="server"  
                                        ReadOnly="true"  
                                        Style="text-align:right"
                                        TabIndex="-1"                                                                                                    
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_EquipoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Rendimiento_Equipo","{0:N6}") %>'>
                                    </asp:TextBox> 
                                </td>                               
                                <td>
                                    <asp:Button 
                                    ID="BtnEquipo" 
                                    runat="server"                                                                                              
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_EquipoRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_EquipoRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="BtnEquipo_Click"/>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox
                                        ID="Apu_rubro_equipo_costo_total" 
                                        runat="server"   
                                        style="text-align:right"    
                                        ReadOnly="true" 
                                        TabIndex="-1"                                                                                             
                                        Text='<%# Bind("Apu_rubro_equipo_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                           
                                    <asp:Label 
                                        ID="Label1" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>
                                </td>                                        
                            </tr>
                            <tr align="left">
                                 <td style="white-space:nowrap">
                                     <asp:Label
                                        ID="lblrendimientomano"
                                        runat="server"                                                     
                                        Text='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.Text").ToString() %>'>
                                    </asp:Label> 
                                  </td>
                                  <td>                                  
                                    <asp:TextBox 
                                        ID="Rendimiento_Mano_Obra" 
                                        runat="server"
                                        ReadOnly="true"
                                        Style="text-align:right"
                                        TabIndex="-1"                                                                                                      
                                        ToolTip='<%# GetLocalResourceObject("Rendimiento_Mano_ObraRecursoKCG.ToolTip").ToString() %>'                                       
                                        Text='<%# Bind("Rendimiento_Mano_Obra","{0:N6}") %>'>
                                    </asp:TextBox>       
                                </td>
                                <td>
                                    <asp:Button 
                                    ID="BtnManoObra" 
                                    runat="server"                                                
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_Mano_ObraRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_Mano_ObraRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="BtnManoObra_Click"/>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_rubro_mano_obra_costo_total" 
                                        runat="server"     
                                        style="text-align:right" 
                                        ReadOnly="true" 
                                        TabIndex="-1"                                                                                          
                                        Text='<%# Bind("Apu_rubro_mano_obra_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                            
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server"  
                                        visible="true"                                               
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                    ID="BtnMateriales" 
                                    runat="server"                                                
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_MaterialRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_MaterialRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="BtnMateriales_Click"/>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox
                                        ID="Apu_rubro_material_costo_total" 
                                        runat="server"     
                                        style="text-align:right"    
                                        ReadOnly="true"
                                        TabIndex="-1"                                                                                      
                                        Text='<%# Bind("Apu_rubro_material_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                              
                                    <asp:Label 
                                        ID="Label5" 
                                        runat="server" 
                                        visible="true"                                                
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:Button 
                                    ID="BtnTransporte" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_TransporteRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_TransporteRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="BtnTransporte_Click"/>    
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_rubro_transporte_costo_total" 
                                        runat="server"  
                                        style="text-align:right"
                                        ReadOnly="true"
                                        TabIndex="-1"                                                                                              
                                        Text='<%# Bind("Apu_rubro_transporte_costo_total","{0:N4}") %>'>
                                    </asp:TextBox>                                             
                                    <asp:Label 
                                        ID="Label6" 
                                        runat="server"    
                                        visible="true"                                             
                                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                        </table>                                      
                    </asp:Panel>                                    
                    <table>   
                        <tr align="left">
                            <td colspan="5">
                                <asp:Button 
                                    ID="Especificacion" 
                                    runat="server"
                                    CausesValidation="True"                                                                                                        
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_TecnicaRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_TecnicaRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="Especificacion_Click"/>
                                <asp:Button 
                                    ID="BtnClonar" 
                                    runat="server"
                                    CausesValidation="True"                                                                     
                                    Text='<%# GetLocalResourceObject("Btn_Rubro_ClonarRecursoKCG.Text").ToString() %>'                                    
                                    ToolTip='<%# GetLocalResourceObject("Btn_Rubro_ClonarRecursoKCG.ToolTip").ToString() %>' 
                                    OnClick="BtnClonar_Click"/>                                    
                                <asp:Button 
                                    ID="BtnRubroListado" 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.Text").ToString() %>'                                                          
                                    ToolTip='<%# GetLocalResourceObject("Btn_Apu_Rubro_Listado_RubroRecursoKCG.ToolTip").ToString() %>'
                                    OnClick="BtnRubroListado_Click"/>   
                                <asp:Button 
                                    ID="BtnReporte" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Btn_Apu_Rubro_AnalisisRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# GetLocalResourceObject("Btn_Apu_Rubro_AnalisisRecursoKCG.ToolTip").ToString() %>'
                                    OnClick="BtnAnalisisConPrecios_Click" />
                                <asp:Button 
                                    ID="BtnReporteBasico" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Btn_Apu_Rubro_Reporte_BasicoRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# GetLocalResourceObject("Btn_Apu_Rubro_Reporte_BasicoRecursoKCG.ToolTip").ToString() %>'
                                    OnClick="BtnReporteBasico_Click" />
                                <asp:Button 
                                    ID="BtnReporteAPU" 
                                    runat="server" 
                                    Text="APU" OnClick="BtnReporteAPU_Click" />
                             </td>       
                        </tr>                                                
                    </table>
                    
                    <%--Id's--%>
                    
                    <asp:TextBox 
                        ID="Int_Sucursal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Sucursal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Titulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Titulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Subtitulo_id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Apu_Subtitulo_id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Int_Moneda_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server"
                        style="display:none"
                        Visible="true" 
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <%--CAMPOS NO VISIBLES--%>
                    
                    <asp:TextBox 
                        ID="Apu_rubro_material_transporte_costo_total" 
                        runat="server"
                        visible="false"
                        Text='<%# Bind("Apu_rubro_material_transporte_costo_total") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Porcentaje_costo_indirecto" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Porcentaje_costo_indirecto") %>'>
                    </asp:TextBox>                   
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>                                       
                    <asp:TextBox 
                        ID="Rendimiento_Mano_Obra_Hora" 
                        runat="server" 
                        visible="false"                         
                        Text='<%# Bind("Rendimiento_Mano_Obra_Hora") %>'>
                    </asp:TextBox>     
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Especial_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Especial_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Rendimiento_Equipo_Hora" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Rendimiento_Equipo_Hora") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Disponible_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Disponible_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Sucursal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                    </asp:TextBox>                    
                    <asp:TextBox 
                        ID="Int_Moneda_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Nombre") %>'>
                    </asp:TextBox> 
                </ItemTemplate>
            </asp:FormView>            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                ID="odsapu_rubro" 
                runat="server" 
                ConflictDetection="CompareAllValues" 
                OldValuesParameterFormatString="original{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.APU.BO_Apu_Rubro" 
                DeleteMethod="Delete" 
                InsertMethod="Insert" 
                UpdateMethod="Update">
                <SelectParameters>
                    <asp:SessionParameter 
                        Name="s" 
                        SessionField="Scope" 
                        Type="Object" />
                    <asp:QueryStringParameter 
                        Name="Id" 
                        QueryStringField="Apu_Rubro_Id" 
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
</asp:Content>

