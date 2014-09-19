<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_FISCALIZACION.aspx.cs" 
    Inherits="FIS_FIS_FISCALIZACION" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_FiscalizacionRecursoKCG" %>
    
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
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>  
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <script type="text/javascript">
        function ItemSelected_Fiscalizador( source, eventArgs ) 
        {   
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
                                                
            var Fiscalizador_Per_Personal_Id = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Fiscalizacion_Fiscalizador_Per_Personal_Id");
            Fiscalizador_Per_Personal_Id.value = temp[0];   
            var Fiscalizador_Per_Personal_Codigo = $get("ctl00_ContentPlaceHolder1_Fv_Fis_Fiscalizacion_Fiscalizador_Per_Personal_Codigo");
            Fiscalizador_Per_Personal_Codigo.value = temp[1];                                                                                 
        }  
    </script>
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
        <asp:FormView 
            ID="Fv_Fis_Fiscalizacion" 
            runat="server" 
            DataSourceID="odsFv_Fis_Fiscalizacion"
            DataKeyNames= "Estado,Id"
            DefaultMode="Insert" >
            <EditItemTemplate>
                <asp:Panel
                    ID="pnl_Proyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    ID="lbl_Codigo_Costos"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Codigo") %>'>
                                </asp:TextBox>                            
                            </td>
                            <td  
                                colspan="2" 
                                align="right">
                                <asp:label
                                    id="lbl_Estado"
                                    runat="server" 
                                    ForeColor="Red"                                       
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Proyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Nombre" 
                                    runat="server" 
                                    Width="700px"
                                    Height="50px"                                        
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Codigo_Institucional"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Cod_InstitucionalRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Codigo_Institucional" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="txt_CodIns1" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,255,192">
                                </asp:TextBox>                                     
                                <asp:TextBox 
                                    ID="txt_CodIns2" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,224,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns3" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="192,255,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns4" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="152,205,254">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns5" 
                                    runat="server"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    Width="52px">
                                </asp:TextBox>                                                                     
                            </td>                            
                        </tr>
                        <tr>
                            <td>                                 
                                <asp:Label 
                                    ID="lbl_Programa" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td> 
                                <asp:TextBox 
                                    ID="Programa_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Programa_Costos") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Tipo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo_Contrato_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,224,200"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Ubicacion" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Ubicacion_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="192,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Ubicacion_Costos") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_ProyectoCI" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Proyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="152,205,254"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Proyecto_Costos") %>'>
                                </asp:TextBox>                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Subproyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="SubProyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="710px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("SubProyecto_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Datos_Contrato"
                    runat="server"
                    meta:resourcekey="Rec_Int_ContratoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Tipo_Contrat" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo_Contrato"
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Contratista" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Contratista_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("ContratistaRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Cierre_Oferta" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Cierre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Cierre") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Aprob" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_APURecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_APU" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_APURecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_APU") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Ini_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Ini_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Plazo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Plazo_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Plazo_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Monto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("MontoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("MontoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Fin" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Fin_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Fin_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Valor_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>                            
                            <td>
                                <asp:TextBox 
                                    ID="Valor_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Valor_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Porcentaje_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Porcentaje_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Fiscalizacion"
                    runat="server"
                    meta:resourcekey="Rec_Fis_FiscalizacionRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fiscalizador" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td colspan="3" style="white-space:nowrap"> 
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_COMBOPER_KCG"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Nombre") %>'>
                                </asp:TextBox>                            
                                 <AjaxControlToolkit:AutoCompleteExtender
                                    runat="server" 
                                    BehaviorID="AutoCompleteEx_Fiscalizador"
                                    ID="AutoCo_Fiscalizador_Per_Personal_Nombre" 
                                    TargetControlID="Fiscalizador_Per_Personal_Nombre"
                                    ServicePath="~/FIS/FIS_FISCALIZACION.aspx" 
                                    ServiceMethod="Get_Fiscalizador"
                                    MinimumPrefixLength="0" 
                                    CompletionInterval="500"
                                    EnableCaching="true"
                                    CompletionSetCount="500"
                                    CompletionListCssClass="autocomplete_completionListElement" 
                                    CompletionListItemCssClass="autocomplete_listItem" 
                                    CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                    OnClientItemSelected="ItemSelected_Fiscalizador" >    
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
                                                    var behavior = $find('AutoCompleteEx_Fiscalizador');
                                                    if (!behavior._height) {
                                                        var target = behavior.get_completionList();
                                                        behavior._height = target.offsetHeight - 2;
                                                        target.style.height = '0px';
                                                    }" />                                                    
                                                <%-- Expand from 0px to the appropriate size while fading in --%>
                                                <Parallel Duration=".4">
                                                    <FadeIn />
                                                    <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Fiscalizador')._height" />
                                                </Parallel>
                                            </Sequence>
                                        </OnShow>
                                        <OnHide>
                                            <%-- Collapse down to 0px and fade out --%>
                                            <Parallel Duration=".4">
                                                <FadeOut />
                                                <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Fiscalizador')._height" EndValue="0" />
                                            </Parallel>
                                        </OnHide>
                                    </Animations>
                                </AjaxControlToolkit:AutoCompleteExtender>  
                                <asp:Label 
                                    ID="lbl_Interno" 
                                    runat="server" 
                                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador1" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_1" 
                                    runat="server" 
                                    TabIndex="-1" 
                                    Width="400px"                                       
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_1") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador2" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_2" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_2") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Lugar" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("LugarRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Lugar" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("LugarRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Lugar") %>'>
                                </asp:TextBox>                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Fecha_Indice_Base" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Fecha_Indice_Base") %>'>
                                </asp:TextBox>  
                             </td>
                             <td>                             
                                <asp:Label 
                                    ID="lbl_Publicaciion_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Def" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Indices_Def" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Indices_Def") %>'>
                                </asp:TextBox>
                                <AjaxControlToolkit:CalendarExtender
                                    ID="ce_Fecha_Indices_Def" 
                                    runat="server" 
                                    TargetControlID="Fecha_Indices_Def" 
                                    Format="dd/MM/yyyy">          
                                </AjaxControlToolkit:CalendarExtender>
                                <AjaxControlToolkit:MaskedEditExtender 
                                    TargetControlID="Fecha_Indices_Def" 
                                    Mask="99/99/9999" 
                                    MaskType="Date"  
                                    ID="mee_Fecha_Indices_Def"          
                                    OnFocusCssClass="MaskedEditFocus"
                                    runat="server">               
                                </AjaxControlToolkit:MaskedEditExtender>
                                    <AjaxControlToolkit:MaskedEditValidator
                                    ControlToValidate="Fecha_Indices_Def" 
                                    ControlExtender="mee_Fecha_Indices_Def" 
                                    id="mev_Fecha_Indices_Def"   
                                    TooltipMessage="Formato (dd/MM/yyyy)"  
                                    runat="server" 
                                    IsValidEmpty="false" 
                                    MaximumValue="01/01/2079"
                                    MaximumValueMessage="Fecha < 01/01/2079"
                                    MinimumValueMessage="Fecha > 01/01/1900"
                                    MinimumValue="01/01/1900"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.ErrorMessage").ToString() %>'                                        
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ7RecursoKCG.Text").ToString() %>' 
                                    ValidationGroup="I"
                                    Display="Dynamic" />  
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="vce_Fecha_Indices_Def"
                                    TargetControlID="mev_Fecha_Indices_Def" />
                            </td>
                            <td>
                                <asp:Label 
                                    ID="lbl_Public_bDef" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base_Def" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base_Def") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Auditoria"
                    runat="server"
                    meta:resourcekey="Rec_Aud_AuditoriaRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Inicial" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Creacion" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Actualiza" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Update" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Update") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left" >
                            <td colspan="4">
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
                </asp:Panel>
                
                    <%--ID's--%>
                
                <asp:TextBox 
                    ID="Apu_Origen_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Origen_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Equipo_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="ManoObra_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Apu_Mano_Obra_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                </asp:TextBox>
                
                    <%--CAMPOS OCULTOS--%>
                    
                <asp:TextBox 
                    ID="Codigo_Institucion" 
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Codigo_Institucion") %>'>
                </asp:TextBox>
                            
                <asp:TextBox 
                    ID="Origen" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Directo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Directo") %>'>
                </asp:TextBox>            
                <asp:TextBox 
                    ID="Costo_Indirecto" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Indirecto") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Otros" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Otros") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Fiscalizador_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Fiscalizador_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Contratista_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Contratista_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Creacion_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Update_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                <%--<asp:TextBox 
                    ID="Descripcion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Descripcion") %>'>
                </asp:TextBox>--%>
                <%--<asp:TextBox 
                    ID="Consultor" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Consultor") %>'>
                </asp:TextBox>--%>
                <asp:TextBox 
                    ID="Tipo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo") %>'>
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
                    ID="Contratista_Per_Personal_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Contratista_Per_Personal_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Origen_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo_int"
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo_int") %>'>
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
                <asp:TextBox
                    ID="Porcentaje_Costo_Indirecto"
                    runat="server"
                    Visible="false"
                    Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                </asp:TextBox>
                  
            </EditItemTemplate>
            <InsertItemTemplate>
                <asp:Panel
                    ID="pnl_Proyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    ID="lbl_Codigo_Costos"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Codigo") %>'>
                                </asp:TextBox>                            
                            </td>
                            <td  
                                colspan="2" 
                                align="right">
                                <asp:label
                                    id="lbl_Estado"
                                    runat="server" 
                                    ForeColor="Red"                                       
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Proyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Nombre" 
                                    runat="server" 
                                    Width="700px"
                                    Height="50px"                                        
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Codigo_Institucional"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Cod_InstitucionalRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Codigo_Institucional" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">                                
                                <asp:TextBox 
                                    ID="txt_CodIns1" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,255,192">
                                </asp:TextBox>                                     
                                <asp:TextBox 
                                    ID="txt_CodIns2" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,224,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns3" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="192,255,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns4" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="152,205,254">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns5" 
                                    runat="server"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    Width="52px">
                                </asp:TextBox>                                                                 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Programa" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">                                                                
                                <asp:TextBox 
                                    ID="Programa_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Programa_Costos") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Tipo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Tipo_Contrato_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,224,200"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Ubicacion" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Ubicacion_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="192,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Ubicacion_Costos") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_ProyectoCI" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Proyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="152,205,254"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Proyecto_Costos") %>'>
                                </asp:TextBox> 
                            </td>
                        </tr>
                        <tr>
                            <td> 
                                <asp:Label 
                                    ID="lbl_Subproyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label>                                 
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="SubProyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="710px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("SubProyecto_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Datos_Contrato"
                    runat="server"
                    meta:resourcekey="Rec_Int_ContratoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Tipo_Contrat" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Tipo_Contrato"
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Contratista" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Contratista_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("ContratistaRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Cierre_Oferta" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Fecha_Cierre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Cierre") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Aprob" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_APURecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Fecha_APU" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_APURecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_APU") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Fecha_Ini_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Ini_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Plazo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Plazo_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Plazo_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Monto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("MontoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("MontoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Fin" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Fecha_Fin_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Fin_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Valor_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>                            
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Valor_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Valor_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                                <asp:TextBox 
                                    ID="Porcentaje_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Porcentaje_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Fiscalizacion"
                    runat="server"
                    meta:resourcekey="Rec_Fis_FiscalizacionRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fiscalizador" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td colspan="3" style="white-space:nowrap"> 
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Nombre" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Nombre") %>'>
                                </asp:TextBox>                            
                                <asp:Label 
                                    ID="lbl_Interno" 
                                    runat="server" 
                                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador1" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_1" 
                                    runat="server" 
                                    TabIndex="-1" 
                                    Width="400px"                                       
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_1") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador2" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_2" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_2") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Lugar" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("LugarRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Lugar" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("LugarRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Lugar") %>'>
                                </asp:TextBox>                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Fecha_Indice_Base" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Fecha_Indice_Base") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:Label 
                                    ID="lbl_Publicaciion_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Def" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Indices_Def" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Indices_Def") %>'>
                                </asp:TextBox>
                            </td>
                            <td>                            
                                <asp:Label 
                                    ID="lbl_Public_bDef" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base_Def" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base_Def") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Auditoria"
                    runat="server"
                    meta:resourcekey="Rec_Aud_AuditoriaRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Inicial" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Creacion" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Actualiza" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Update" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Update") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                
                    <%--ID's--%>
                
                <asp:TextBox 
                    ID="Apu_Origen_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Origen_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Equipo_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="ManoObra_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Apu_Mano_Obra_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                </asp:TextBox>
                
                    <%--CAMPOS OCULTOS--%>
                    
                <asp:TextBox 
                    ID="Codigo_Institucion" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Codigo_Institucion") %>'>
                </asp:TextBox>
                            
                <asp:TextBox 
                    ID="Origen" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Directo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Directo") %>'>
                </asp:TextBox>           
                <asp:TextBox 
                    ID="Costo_Indirecto" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Indirecto") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Otros" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Otros") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Fiscalizador_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Fiscalizador_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Contratista_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Contratista_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Creacion_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Update_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                <%--<asp:TextBox 
                    ID="Descripcion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Descripcion") %>'>
                </asp:TextBox>--%>
                <%--<asp:TextBox 
                    ID="Consultor" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Consultor") %>'>
                </asp:TextBox>--%>
                <asp:TextBox 
                    ID="Tipo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo") %>'>
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
                    ID="Contratista_Per_Personal_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Contratista_Per_Personal_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Origen_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo_int"
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo_int") %>'>
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
                <asp:TextBox
                    ID="Porcentaje_Costo_Indirecto"
                    runat="server"
                    Visible="false"
                    Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                </asp:TextBox>
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:Panel
                    ID="pnl_Proyecto"
                    runat="server"
                    meta:resourcekey="Rec_Apu_ProyectoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    ID="lbl_Codigo_Costos"
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Codigo") %>'>
                                </asp:TextBox>                            
                            </td>
                            <td  
                                colspan="2" 
                                align="right">
                                <asp:label
                                    id="lbl_Estado"
                                    runat="server" 
                                    ForeColor="Red"                                       
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:label>                                  
                            </td>  
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Proyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Apu_Origen_Nombre" 
                                    runat="server" 
                                    Width="700px"
                                    Height="50px"                                        
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Apu_Origen_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Codigo_Institucional"
                    runat="server"
                    meta:resourcekey="Rec_Apu_Cod_InstitucionalRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Codigo_Institucional" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="txt_CodIns1" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,255,192">
                                </asp:TextBox>                                     
                                <asp:TextBox 
                                    ID="txt_CodIns2" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="255,224,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns3" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="192,255,192">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns4" 
                                    runat="server"
                                    Width="52px"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    BackColor="152,205,254">
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="txt_CodIns5" 
                                    runat="server"
                                    onfocus="this.blur()" 
                                    TabIndex="-1"
                                    style="text-align:right"
                                    Width="52px">
                                </asp:TextBox> 
                            </td>
                        </tr>
                        <tr>
                            <td>                                
                                <asp:Label 
                                    ID="lbl_Programa" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>                                
                                <asp:TextBox 
                                    ID="Programa_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Programa_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Programa_Costos") %>'>
                                </asp:TextBox> 
                                <asp:Label 
                                    ID="lbl_Tipo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo_Contrato_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="255,224,200"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Ubicacion" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Ubicacion_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="192,255,192"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("Ubicacion_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Ubicacion_Costos") %>'>
                                </asp:TextBox>                               
                                <asp:Label 
                                    ID="lbl_ProyectoCI" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ProyectoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>                                 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Proyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    BackColor="152,205,254"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("ProyectoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Proyecto_Costos") %>'>
                                </asp:TextBox>  
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Subproyecto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="SubProyecto_Costos" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="710px"
                                    Height="50px"
                                    TextMode="MultiLine"
                                    CssClass="TEXTO_LECTURA_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Subproyecto_CostosRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("SubProyecto_Costos") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Datos_Contrato"
                    runat="server"
                    meta:resourcekey="Rec_Int_ContratoRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Tipo_Contrat" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Tipo_Contrato"
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Tipo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Tipo_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Contratista" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("ContratistaRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Contratista_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("ContratistaRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Contratista_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Cierre_Oferta" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Cierre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_CierreRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Cierre") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Aprob" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_APURecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_APU" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_APURecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_APU") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fecha_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Ini_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Ini_Contrato") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Plazo_Contrato" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Plazo_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Plazo_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Monto" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("MontoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Costo_Total" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("MontoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Total","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Fecha_Fin" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Fin_Contrato" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Fin_Contrato") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Valor_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>                            
                            <td>
                                <asp:TextBox 
                                    ID="Valor_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Valor_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Anticipo" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Porcentaje_Anticipo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Porcentaje_AnticipoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Porcentaje_Anticipo","{0:N2}") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Fiscalizacion"
                    runat="server"
                    meta:resourcekey="Rec_Fis_FiscalizacionRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Fiscalizador" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.Text").ToString() %>'>
                                </asp:Label> 
                            </td>
                            <td colspan="3" style="white-space:nowrap"> 
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Codigo" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fiscalizador_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="300px"
                                    ToolTip='<%# GetLocalResourceObject("FiscalizadorRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fiscalizador_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="lbl_Interno" 
                                    runat="server" 
                                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador1" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_1" 
                                    runat="server" 
                                    TabIndex="-1" 
                                    Width="400px"                                       
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_1RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_1") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Coordinador2" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Coordinador_2" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Coordinador_2RecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Coordinador_2") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Lugar" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("LugarRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox 
                                    ID="Lugar" 
                                    runat="server" 
                                    Width="400px"
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("LugarRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Lugar") %>'>
                                </asp:TextBox>                            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                             <td>
                                <asp:TextBox 
                                    ID="Fecha_Indice_Base" 
                                    runat="server" 
                                    ReadOnly="false"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_BaseRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Fecha_Indice_Base") %>'>
                                </asp:TextBox>
                             </td>
                             <td>
                                <asp:Label 
                                    ID="lbl_Publicaciion_Base" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                             </td>
                             <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_BaseRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_fIndice_Def" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Fecha_Indices_Def" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Fecha_Indice_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Indices_Def") %>'>
                                </asp:TextBox>
                            </td>
                            <td>
                                <asp:Label 
                                    ID="lbl_Public_bDef" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Publicacion_Base_Def" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Publicacion_Base_DefRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Publicacion_Base_Def") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel
                    ID="pnl_Auditoria"
                    runat="server"
                    meta:resourcekey="Rec_Aud_AuditoriaRecursoKCG">
                    <table>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Inicial" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Creacion_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Creacion" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Creacion_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Creacion") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    ID="lbl_Usuario_Actualiza" 
                                    runat="server" 
                                    Text='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Update_Per_Personal_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    Width="400px"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Fecha_Update" 
                                    runat="server" 
                                    TabIndex="-1"                                        
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("Update_Per_Personal_IdRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Fecha_Update") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left" >
                            <td>
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
                </asp:Panel>
                
                    <%--ID's--%>
                
                <asp:TextBox 
                    ID="Apu_Origen_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Origen_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Equipo_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Equipo_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="ManoObra_Apu_Indice_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("ManoObra_Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox
                    ID="Apu_Mano_Obra_Id"
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Apu_Mano_Obra_Id") %>'>
                </asp:TextBox>
                
                    <%--CAMPOS OCULTOS--%>
                    
                <asp:TextBox 
                    ID="Codigo_Institucion" 
                    runat="server"                                     
                    style="display:none"
                    Text='<%# Bind("Codigo_Institucion") %>'>
                </asp:TextBox>       
                            
                <asp:TextBox 
                    ID="Origen" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Directo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Directo") %>'>
                </asp:TextBox>            
                <asp:TextBox 
                    ID="Costo_Indirecto" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Indirecto") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Costo_Otros" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Costo_Otros") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Sucursal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Int_Sucursal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Fiscalizador_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Fiscalizador_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Contratista_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Contratista_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Creacion_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Update_Per_Personal_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Update_Per_Personal_Id") %>'>
                </asp:TextBox>
                <%--<asp:TextBox 
                    ID="Descripcion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Descripcion") %>'>
                </asp:TextBox>--%>
                <%--<asp:TextBox 
                    ID="Consultor" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Consultor") %>'>
                </asp:TextBox>--%>
                <asp:TextBox 
                    ID="Tìpo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo") %>'>
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
                    ID="Contratista_Per_Personal_Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Contratista_Per_Personal_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Tipo_Fiscalizacion" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Tipo_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Jefe_Fiscalizacion") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Jefe_Fiscalizacion_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Jefe_Fiscalizacion_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Origen_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Origen_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Codigo_int"
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Codigo_int") %>'>
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
                <asp:TextBox
                    ID="Porcentaje_Costo_Indirecto"
                    runat="server"
                    Visible="false"
                    Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                </asp:TextBox>  
            </ItemTemplate>
        </asp:FormView>        
            <table>
                <tr>
                    <td>
                        <asp:Button
                            ID="Btn_Listado"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Listado_FiscalizacionRecursoKCG"
                            OnClick="Btn_Listado_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Presupuesto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_PresupuestoRecursoKCG"
                            OnClick="Btn_Presupuesto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planillas"
                            runat="server"
                            meta:resourcekey="Btn_Fis_PlanillasRecursoKCG"
                            OnClick="Btn_Planillas_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Ampliaciones"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Ampliaciones_PlazoRecursoKCG"
                            OnClick="Btn_Ampliaciones_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planilla_Per"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_PeriodoRecursoKCG"
                            OnClick="Btn_Planilla_Per_Click" />
                    </td>
                    <td>
                        <asp:UpdatePanel 
                            ID="opopop"
                            runat="server">
                            <ContentTemplate>                            
                            <koala:KEstado 
                                ID="Estado" 
                                Runat="Server" 
                                ObjetoNombre="APU_PRESUPUESTO"
                                CampoNombre="Estado" />
                            </ContentTemplate>
                        </asp:UpdatePanel> 
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsFv_Fis_Fiscalizacion" 
            runat="server" 
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original{0}"
            SelectMethod="GetById" 
            SortParameterName="sortExpression" 
            TypeName="FEL.FIS.BO_Fis_Fiscalizacion" 
            UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
                <asp:QueryStringParameter 
                    Name="Id" 
                    QueryStringField="Fis_Fiscalizacion_Id" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>

