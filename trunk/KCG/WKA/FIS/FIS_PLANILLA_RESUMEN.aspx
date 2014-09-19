<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PLANILLA_RESUMEN.aspx.cs" 
    Inherits="FIS_FIS_PLANILLA_RESUMEN" 
     meta:resourcekey="Tit_Fis_Planilla_ResumenRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>
    
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
        runat="server">
        <ContentTemplate>
            <asp:Panel 
                ID="pnl_Proyecto" 
                runat="server" 
                meta:resourcekey="Rec_Fis_ProyectoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Codigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Codigo_Institucional"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Fecha_Inicio"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Plazo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Fecha_Fin"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:Label 
                                ID="lbl_Estado"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox
                                ID="Apu_Origen_Codigo"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Apu_Origen_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Codigo_Institucion"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Codigo_InstitucionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Fecha_Ini_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Ini_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Plazo_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Plazo_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Fecha_Fin_Contrato"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Fin_ContratoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Estado_Nombre"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Estado_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Apu_Origen_Nombre"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:TextBox
                                ID="Apu_Origen_Nombre"
                                runat="server"
                                Width="700px"
                                Height="50px"
                                ReadOnly="true"
                                TabIndex="-1"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Tooltip='<%# GetLocalResourceObject("Apu_Origen_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel> 
            <asp:Panel
                ID="pnl_Contrato"
                runat="server"
                meta:resourcekey="Rec_Fis_ContratoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Monto_Contrato"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Costo_Total"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Monto_Acumulado"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Monto_AcumuladoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Monto_Acumulado"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Monto_AcumuladoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Porcentaje_Incremento"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Porcentaje_IncrementoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Porcentaje_Incremento"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Porcentaje_IncrementoRecursoKCG.ToolTip").ToString() %>'>
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
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Valor_AnticipoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Monto_Planillas"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Monto_Planillas_CmpRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Monto_Planillas_Cmp"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Monto_Planillas_CmpRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label
                                ID="lbl_Porcentaje_Monto_Planillas"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Porcentaje_Monto_Planillas_CmpRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Porcentaje_Monto_Planillas_Cmp"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Porcentaje_Monto_Planillas_CmpRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Sum_Importe_Total_Anticipo"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Sum_Importe_Total_AnticipoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Sum_Importe_Total_Anticipo"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Sum_Importe_Total_AnticipoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_Anticipo_por_Devengar"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Anticipo_por_DevengarRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="Anticipo_por_Devengar"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"                                                                
                                Tooltip='<%# GetLocalResourceObject("Anticipo_por_DevengarRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel
                ID="pnl_Planilla"
                runat="server"
                meta:resourcekey="Rec_Fis_PlanillaRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                ID="lbl_No_Planilla"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox
                                ID="Numero_Planilla"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("Numero_PlanillaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label
                                ID="lbl_Presentacion"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                            <asp:TextBox
                                ID="Fecha_Ultimo_Ingreso"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Fecha_Ultimo_IngresoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label
                                ID="lbl_Monto"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("TotalRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                            <asp:TextBox
                                ID="Total"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                style="text-align:right"
                                Tooltip='<%# GetLocalResourceObject("TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label
                                ID="lbl_Tipo"                                   
                                runat="server"
                                Text='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.Text").ToString() %>'>                                
                            </asp:Label>
                            <asp:TextBox
                                ID="Tipo_Nombre"
                                runat="server"
                                ReadOnly="true"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Tipo_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>              
            </asp:Panel>           
            <asp:FormView 
                ID="Fv_Fis_Planilla_Resumen" 
                runat="server" 
                DataSourceID="odsFv_Fis_Planilla_Resumen"
                DefaultMode="Insert">
                <EditItemTemplate>
                   <asp:Panel
                        ID="pnl_Fechas"
                        runat="server"
                        meta:resourcekey="Rec_Fis_FechasRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Inicio_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Fin_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_No_Dias_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Numero_Dias_Periodo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Periodo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_No_Dias_Acumulado"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero_Dias_Acumulado" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Acumulado") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Public_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Pub_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <table>
                        <tr>
                            <td>
                                <asp:Panel
                                    ID="pnl_Calculos"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_CalculosRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Monto_Planilla"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Fis_Planilla_Total" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Anticipo_Devengado"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Anticipo_Devengado" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Anticipo_Devengado","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajustar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Reajustar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Reajustar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retencion"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Provisional"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_ProvisionalRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Del_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenc"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Definitivo"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_DefinitivoRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Definitivo","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Val_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenci"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                        </tr>
                    </table>
                    
                        <%--ID's--%>
                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Inicio_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Ultimo_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Iva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Iva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Retencion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Numero_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Numero_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Provisional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Provisional") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Definitiva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Definitiva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Anticipo_Devengar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Anticipo_Devengar") %>'>
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
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        ID="pnl_Fechas"
                        runat="server"
                        meta:resourcekey="Rec_Fis_FechasRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Inicio_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Fin_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_No_Dias_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Numero_Dias_Periodo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Periodo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_No_Dias_Acumulado"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero_Dias_Acumulado" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Acumulado") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Public_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Pub_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <table>
                        <tr>
                            <td>
                                <asp:Panel
                                    ID="pnl_Calculos"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_CalculosRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Monto_Planilla"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Fis_Planilla_Total" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Anticipo_Devengado"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Anticipo_Devengado" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Anticipo_Devengado","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajustar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Reajustar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Reajustar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retencion"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Provisional"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_ProvisionalRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Del_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenc"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Definitivo"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_DefinitivoRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Definitivo","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Val_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenci"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                        </tr>
                    </table>
                    
                        <%--ID's--%>
                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Inicio_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Ultimo_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Iva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Iva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Retencion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Numero_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Numero_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Provisional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Provisional") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Definitiva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Definitiva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Anticipo_Devengar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Anticipo_Devengar") %>'>
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
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        ID="pnl_Fechas"
                        runat="server"
                        meta:resourcekey="Rec_Fis_FechasRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Inicio_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Inicial" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Inicial","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Fecha_Fin_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Fecha_Final" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Final","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_No_Dias_Periodo"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Numero_Dias_Periodo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_PeriodoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Periodo") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_No_Dias_Acumulado"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Numero_Dias_Acumulado" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Numero_Dias_AcumuladoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Numero_Dias_Acumulado") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Provisional","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Public_Reajuste_Pro"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Provisional" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Provisional") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        ID="lbl_Fecha_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Fecha_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Fecha_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Fecha_Reajuste_Definitivo","{0:dd/MM/yyyy}") %>'>
                                    </asp:TextBox>
                                    <asp:Label
                                        ID="lbl_Pub_Reajuste_Def"                                   
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Publicacion_Reajuste_Definitivo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        Tooltip='<%# GetLocalResourceObject("Publicacion_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Publicacion_Reajuste_Definitivo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <table>
                        <tr>
                            <td>
                                <asp:Panel
                                    ID="pnl_Calculos"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_CalculosRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Monto_Planilla"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Fis_Planilla_Total" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Fis_Planilla_TotalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Fis_Planilla_Total","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Anticipo_Devengado"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Anticipo_Devengar_" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Anticipo_DevengadoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Anticipo_Devengar") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajustar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Reajustar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_ReajustarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Reajustar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retencion"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_PagarRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Provisional"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_ProvisionalRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Del_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenc"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Provisional","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Prov"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Provisional" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_ProvisionalRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Provisional","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                
                            </td>
                            <td>
                                <asp:Panel
                                    ID="pnl_Definitivo"
                                    runat="server"
                                    meta:resourcekey="Rec_Fis_DefinitivoRecursoKCG">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Factor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Factor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Factor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Factor_Reajuste_Definitivo","{0:N4}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Reajuste_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Reajuste_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_Reajuste_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Reajuste_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Val_Iva"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Iva_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_IvaRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Iva_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Retenci"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_Retencion_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_RetencionRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_Retencion_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label
                                                    ID="lbl_Valor_Pagar_Def"                                   
                                                    runat="server"
                                                    Text='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.Text").ToString() %>'>                                
                                                </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox 
                                                    ID="Valor_A_Pagar_Definitivo" 
                                                    runat="server" 
                                                    ReadOnly="true"
                                                    TabIndex="-1"
                                                    style="text-align:right"
                                                    Tooltip='<%# GetLocalResourceObject("Valor_A_Pagar_DefinitivoRecursoKCG.ToolTip").ToString() %>'
                                                    Text='<%# Bind("Valor_A_Pagar_Definitivo","{0:N2}") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel> 
                            </td>
                        </tr>
                    </table>
                                                              
                    
                        <%--ID's--%>
                        
                    
                    <asp:TextBox 
                        ID="Apu_Presupuesto_Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Apu_Presupuesto_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                        <%--CAMPOS OCULTOS--%>
                    
                    <asp:TextBox 
                        ID="Descripcion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Tipo_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Tipo_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Inicio_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Inicio_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Fecha_Ultimo_Ingreso" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Ultimo_Ingreso") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Iva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Iva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Porcentaje_Retencion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Porcentaje_Retencion") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Numero_Planilla" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Numero_Planilla") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Provisional" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Provisional") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Descripcion_Definitiva" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Descripcion_Definitiva") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Anticipo_Devengar" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Anticipo_Devengar") %>'>
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
                </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource 
                ID="odsFv_Fis_Planilla_Resumen" 
                runat="server" 
                ConflictDetection="CompareAllValues" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetById" 
                SortParameterName="sortExpression" 
                TypeName="FEL.FIS.BO_Fis_Planilla_Resumen">
                <SelectParameters>
                    <asp:SessionParameter 
                        Name="s" 
                        SessionField="Scope" 
                        Type="Object" />
                    <asp:QueryStringParameter 
                        Name="Fis_Planilla_Id" 
                        QueryStringField="Fis_Planilla_Id"
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource> 
            <table>
                <tr>
                    <td>
                        <asp:Button
                            ID="Btn_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_FiscalizacionRecursoKCG"
                            OnClick="Btn_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planillas_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_PlanillaRecursoKCG"
                            OnClick="Btn_Planillas_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Detalle_Planilla"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_DetRecursoKCG"
                            OnClick="Btn_Detalle_Planilla_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button
                            ID="Btn_Reporte_Planilla"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Resumen_ReporteRecursoKCG"
                            OnClick="Btn_Reporte_Planilla_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Reporte_Reajuste_Prov"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Rea_ProvRecursoKCG"
                            OnClick="Btn_Reporte_Reajuste_Prov_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Reporte_Reajuste_Def"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Rea_DefRecursoKCG"
                            OnClick="Btn_Reporte_Reajuste_Def_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Reporte_Planilla_Fiscalizador"
                            runat="server"
                            meta:resourcekey="Btn_Reporte_FiscalizadorRecursoKCG"
                            OnClick="Btn_Reporte_Planilla_Fiscalizador_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Reporte_Planilla_Reajuste"
                            runat="server"                        
                            meta:resourcekey="Btn_Reajuste_DefRecursoKCG"    
                            OnClick="Btn_Reporte_Planilla_Reajuste_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planilla_Per"
                            runat="server" 
                            meta:resourcekey="Btn_Fis_Planilla_PeriodoRecursoKCG"
                            OnClick="Btn_Planilla_Per_Click" />
                    </td>
                </tr>
            </table>           
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

