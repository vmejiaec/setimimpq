<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_PLANILLA_PERIODO.aspx.cs" 
    Inherits="FIS_FIS_PLANILLA_PERIODO" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Fis_Planilla_PeriodoRecursoKCG" %>

<%@ Register 
        Assembly="AjaxControlToolkit" 
        Namespace="AjaxControlToolkit" 
        TagPrefix="AjaxControlToolkit" %>

 <%@ Register 
        tagprefix="koala" 
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
            <asp:TextBox 
                ID="NumRegistros"
                runat="server" 
                style="display:none">
            </asp:TextBox>
            <asp:TextBox 
                ID="Pagina" 
                runat="server"
                style="display:none">
            </asp:TextBox>
            <asp:Panel 
                ID="pnl_Filtros" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Periodo_FiltrosRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Fecha_Inicial" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Fecha_Inicial" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Fecha_InicialRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:CalendarExtender
                                ID="ce_Fecha_Inicial" 
                                runat="server" 
                                TargetControlID="Fecha_Inicial" 
                                Format="dd/MM/yyyy">          
                            </AjaxControlToolkit:CalendarExtender>
                            <AjaxControlToolkit:MaskedEditExtender 
                                TargetControlID="Fecha_Inicial" 
                                Mask="99/99/9999" 
                                MaskType="Date"  
                                ID="mee_Fecha_Inicial"          
                                OnFocusCssClass="MaskedEditFocus"
                                runat="server">               
                            </AjaxControlToolkit:MaskedEditExtender>
                                <AjaxControlToolkit:MaskedEditValidator
                                ControlToValidate="Fecha_Inicial" 
                                ControlExtender="mee_Fecha_Inicial" 
                                id="mev_Fecha_Inicial"   
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
                                ID="vce_Fecha_Inicial"
                                TargetControlID="mev_Fecha_Inicial" />
                            <asp:Label 
                                ID="lbl_Fecha_Final" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                            <asp:TextBox 
                                ID="Fecha_Final" 
                                runat="server" 
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Fecha_FinalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <AjaxControlToolkit:CalendarExtender
                                ID="ce_Fecha_Final" 
                                runat="server" 
                                TargetControlID="Fecha_Final" 
                                Format="dd/MM/yyyy">          
                            </AjaxControlToolkit:CalendarExtender>
                            <AjaxControlToolkit:MaskedEditExtender 
                                TargetControlID="Fecha_Final" 
                                Mask="99/99/9999" 
                                MaskType="Date"  
                                ID="mee_Fecha_Final"          
                                OnFocusCssClass="MaskedEditFocus"
                                runat="server">               
                            </AjaxControlToolkit:MaskedEditExtender>
                                <AjaxControlToolkit:MaskedEditValidator
                                ControlToValidate="Fecha_Final" 
                                ControlExtender="mee_Fecha_Final" 
                                id="mev_Fecha_Final"   
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
                                ID="vce_Fecha_Final"
                                TargetControlID="mev_Fecha_Final" />
                        </td>
                        <td>
                            <asp:Button 
                                ID="Btn_Consular" 
                                runat="server" 
                                ValidationGroup="I"
                                meta:resourcekey="Btn_ConsultarRecursoKCG" /> 
                        </td>                        
                    </tr>
                </table>
            </asp:Panel>
            <table>
                <tr>
                    <%--<td>
                        <koala:KNavegacion 
                            ID="KNavegacion"
                            runat="server"
                            GridViewID="Gv_Fis_Planilla_Periodo"
                            OnNavegar="nav_Siguiente" />
                    </td>--%>
                    <td>
                        <koala:KFiltro 
                            ID="KFiltro" 
                            runat="server" 
                            Contenedor="FIS_PLANILLA_PERIODO" 
                            Objeto="Fis_Planilla" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGv_Fis_Planilla_Periodo" 
                            PaginacionFina="true"/>
                    </td>  
                    <td>
                        <asp:Button
                            ID="Btn_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Periodo_ProyectoRecursoKCG"
                            OnClick="Btn_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Planilla_Proyecto"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Periodo_PlanillasRecursoKCG"
                            OnClick="Btn_Planilla_Proyecto_Click" />
                    </td>
                    <td>
                        <asp:Button
                            ID="Btn_Resumen_Planilla"
                            runat="server"
                            meta:resourcekey="Btn_Fis_Planilla_Periodo_ResumenRecursoKCG"
                            OnClick="Btn_Resumen_Planilla_Click" />
                    </td>
                </tr>
            </table>
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Planilla_Periodo_ListadoRecursoKCG">
                <Koala:KGridBase
                    ID="Gv_Fis_Planilla_Periodo" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id, Apu_Presupuesto_Id" 
                    DataSourceID="odsGv_Fis_Planilla_Periodo"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="selectedrowstyle"/>
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="..." 
                            ShowSelectButton="True" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Codigo_Institucional" 
                            meta:resourcekey="BoundApu_Presupuesto_Codigo_InstitucionalRecursoKCG"
                            SortExpression="Apu_Presupuesto_Codigo_Institucional">
                            <ItemStyle HorizontalAlign="Right" Width="40mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Nombre" 
                            meta:resourcekey="BoundApu_Presupuesto_NombreRecursoKCG"
                            SortExpression="Apu_Presupuesto_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Contratista_Per_Personal_Nombre" 
                            meta:resourcekey="BoundContratista_Per_Personal_NombreRecursoKCG"
                            SortExpression="Contratista_Per_Personal_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Numero_Planilla" 
                            meta:resourcekey="BoundNumero_PlanillaRecursoKCG"
                            SortExpression="Numero_Planilla">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Inicial" 
                            meta:resourcekey="BoundFecha_InicialRecursoKCG"
                            SortExpression="Fecha_Inicial"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Final" 
                            meta:resourcekey="BoundFecha_FinalRecursoKCG"
                            SortExpression="Fecha_Final"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            meta:resourcekey="BoundTipo_NombreRecursoKCG"
                            SortExpression="Tipo_Nombre">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Total" 
                            meta:resourcekey="BoundTotalRecursoKCG"
                            SortExpression="Total"
                            DataFormatString="{0:N2}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Ultimo_Ingreso" 
                            meta:resourcekey="BoundFecha_Ultimo_IngresoRecursoKCG"
                            SortExpression="Fecha_Ultimo_Ingreso"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Pago" 
                            meta:resourcekey="BoundFecha_PagoRecursoKCG"
                            SortExpression="Fecha_Pago"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Planilla" 
                            HeaderText="Tipo_Planilla" 
                            SortExpression="Tipo_Planilla"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Id" 
                            HeaderText="Apu_Presupuesto_Id" 
                            SortExpression="Apu_Presupuesto_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Inicio_Ingreso" 
                            HeaderText="Fecha_Inicio_Ingreso"
                            SortExpression="Fecha_Inicio_Ingreso" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Iva" 
                            HeaderText="Porcentaje_Iva" 
                            SortExpression="Porcentaje_Iva"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Retencion" 
                            HeaderText="Porcentaje_Retencion"
                            SortExpression="Porcentaje_Retencion" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Reajuste_Provisional" 
                            HeaderText="Fecha_Reajuste_Provisional"
                            SortExpression="Fecha_Reajuste_Provisional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Reajuste_Definitivo" 
                            HeaderText="Fecha_Reajuste_Definitivo"
                            SortExpression="Fecha_Reajuste_Definitivo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion_Provisional" 
                            HeaderText="Descripcion_Provisional"
                            SortExpression="Descripcion_Provisional"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion_Definitiva" 
                            HeaderText="Descripcion_Definitiva"
                            SortExpression="Descripcion_Definitiva" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Anticipo_Devengar" 
                            HeaderText="Anticipo_Devengar" 
                            SortExpression="Anticipo_Devengar"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Reajuste_Provisional" 
                            HeaderText="Publicacion_Reajuste_Provisional"
                            SortExpression="Publicacion_Reajuste_Provisional" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Reajuste_Definitivo" 
                            HeaderText="Publicacion_Reajuste_Definitivo"
                            SortExpression="Publicacion_Reajuste_Definitivo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Apu_Origen_Id" 
                            HeaderText="Apu_Presupuesto_Apu_Origen_Id"
                            SortExpression="Apu_Presupuesto_Apu_Origen_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Codigo" 
                            HeaderText="Apu_Presupuesto_Codigo"
                            SortExpression="Apu_Presupuesto_Codigo" 
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
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo_int" 
                            HeaderText="Codigo_int" 
                            SortExpression="Codigo_int"
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
                </Koala:KGridBase>   
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Planilla_Periodo" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="Get" 
                    TypeName="FEL.FIS.BO_Fis_Planilla">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" 
                            SessionField="Scope" 
                            Type="Object" />
                        <asp:Parameter 
                            Name="Apu_Presupuesto_Codigo_Institucional" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Apu_Presupuesto_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Contratista_Per_Personal_Nombre" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Numero_Planilla_Desde" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Numero_Planilla_Hasta" 
                            Type="String" />
                        <asp:ControlParameter 
                            ControlID="Fecha_Inicial" 
                            Name="Fecha_Inicial_Desde" 
                            Type="DateTime" />
                        <asp:ControlParameter 
                            ControlID="Fecha_Final" 
                            Name="Fecha_Final_Hasta" 
                            Type="DateTime" />
                        <asp:Parameter 
                            Name="Tipo_Planilla" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Total_Desde" 
                            Type="Decimal" />
                        <asp:Parameter 
                            Name="Total_Hasta" 
                            Type="Decimal" />
                        <asp:Parameter 
                            Name="Fecha_Pago_Desde" 
                            Type="DateTime" />
                        <asp:Parameter 
                            Name="Fecha_Pago_Hasta" 
                            Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

