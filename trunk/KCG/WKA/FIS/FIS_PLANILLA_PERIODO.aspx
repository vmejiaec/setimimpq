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
                    DataKeyNames="Id" 
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
                            DataField ="Apu_Presupuesto_Codigo_Institucional" 
                            HeaderText = "Cod. Tarea"
                            SortExpression="Apu_Presupuesto_Codigo_Institucional">
                            <ItemStyle HorizontalAlign="Right" Width="40px" />
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

    <%--[O] GridView de Com_Planilla_Pago --%>
    <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Planilla_Pago" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Planilla_Pago" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Planilla_Pago_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Fis_Planilla_Id" HeaderText="Fis_Planilla_Id"   SortExpression="Fis_Planilla_Id" />
			<asp:BoundField DataField="Fecha_Pago" HeaderText="Fecha_Pago"   DataFormatString="{0:d}" SortExpression="Fecha_Pago" />
				<asp:BoundField DataField="Comprobante_Pago" HeaderText="Comprobante_Pago"   SortExpression="Comprobante_Pago" />
			<asp:BoundField DataField="Factura_Memo_Pago" HeaderText="Factura_Memo_Pago"   SortExpression="Factura_Memo_Pago" />
			<asp:BoundField DataField="Valor_Cta_X_Cobrar" HeaderText="Valor_Cta_X_Cobrar"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Fecha_Pago_Confirmada" HeaderText="Fecha_Pago_Confirmada"   DataFormatString="{0:d}" SortExpression="Fecha_Pago_Confirmada" />
				</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Planilla_Pago --%>

    <%--[O] FormView de Com_Planilla_Pago --%>
    <asp:Panel runat="server" ID="pfvCom_Planilla_Pago" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvCom_Planilla_Pago" runat="server" DataSourceID="odsfvCom_Planilla_Pago" 
            oniteminserting="fvCom_Planilla_Pago_ItemInserting" 
            onitemdeleted="fvCom_Planilla_Pago_ItemDeleted" 
            oniteminserted="fvCom_Planilla_Pago_ItemInserted" 
            onitemupdated="fvCom_Planilla_Pago_ItemUpdated"
			ondatabound="fvCom_Planilla_Pago_DataBound" 
            onprerender="fvCom_Planilla_Pago_PreRender"
			onitemupdating="fvCom_Planilla_Pago_ItemUpdating"
			onitemdeleting="fvCom_Planilla_Pago_ItemDeleting"
			>
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Fis_Planilla_Id </td>                
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Fecha_Pago </td>                
				<td><asp:TextBox ID="Fecha_PagoTextBox" runat="server" Text='<%# Bind("Fecha_Pago","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Pago" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Pago" TargetControlID="Fecha_PagoTextBox" PopupButtonID="btcexFecha_Pago" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Pago" runat="server" 
                    ControlToValidate="Fecha_PagoTextBox"
                    ErrorMessage="El campo Fecha_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					<asp:RangeValidator ID="rvFecha_Pago" runat="server" 
                    ErrorMessage="El campo Fecha_Pago no contiene una fecha válida" 
                    ControlToValidate="Fecha_PagoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Pago"/>
				</td>
            </tr>
			<tr >
                <td> Comprobante_Pago </td>                
				<td><asp:TextBox ID="Comprobante_PagoTextBox" runat="server" Text='<%# Bind("Comprobante_Pago") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComprobante_Pago" runat="server" 
                    ControlToValidate="Comprobante_PagoTextBox"
                    ErrorMessage="El campo Comprobante_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Factura_Memo_Pago </td>                
				<td><asp:TextBox ID="Factura_Memo_PagoTextBox" runat="server" Text='<%# Bind("Factura_Memo_Pago") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFactura_Memo_Pago" runat="server" 
                    ControlToValidate="Factura_Memo_PagoTextBox"
                    ErrorMessage="El campo Factura_Memo_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Cta_X_Cobrar </td>                
				<td><asp:TextBox ID="Valor_Cta_X_CobrarTextBox" runat="server" Text='<%# Bind("Valor_Cta_X_Cobrar","{0:N2}") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Cta_X_Cobrar" runat="server" 
                    ControlToValidate="Valor_Cta_X_CobrarTextBox"
                    ErrorMessage="El campo Valor_Cta_X_Cobrar es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Pago_Confirmada </td>                
				<td><asp:TextBox ID="Fecha_Pago_ConfirmadaTextBox" runat="server" Text='<%# Bind("Fecha_Pago_Confirmada","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Pago_Confirmada" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Pago_Confirmada" TargetControlID="Fecha_Pago_ConfirmadaTextBox" PopupButtonID="btcexFecha_Pago_Confirmada" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Pago_Confirmada" runat="server" 
                    ControlToValidate="Fecha_Pago_ConfirmadaTextBox"
                    ErrorMessage="El campo Fecha_Pago_Confirmada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					<asp:RangeValidator ID="rvFecha_Pago_Confirmada" runat="server" 
                    ErrorMessage="El campo Fecha_Pago_Confirmada no contiene una fecha válida" 
                    ControlToValidate="Fecha_Pago_ConfirmadaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Pago"/>
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Planilla_Pago"/>
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Panel runat="server" ID = "panelInsertTemplate" DefaultButton="InsertButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Fis_Planilla_Id </td>                
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Fecha_Pago </td>                
				<td><asp:TextBox ID="Fecha_PagoTextBox" runat="server" Text='<%# Bind("Fecha_Pago","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Pago" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Pago" TargetControlID="Fecha_PagoTextBox" PopupButtonID="btcexFecha_Pago" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Pago" runat="server" 
                    ControlToValidate="Fecha_PagoTextBox"
                    ErrorMessage="El campo Fecha_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					<asp:RangeValidator ID="rvFecha_Pago" runat="server" 
                    ErrorMessage="El campo Fecha_Pago no contiene una fecha válida" 
                    ControlToValidate="Fecha_PagoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Pago"/>
				</td>
            </tr>
			<tr >
                <td> Comprobante_Pago </td>                
				<td><asp:TextBox ID="Comprobante_PagoTextBox" runat="server" Text='<%# Bind("Comprobante_Pago") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComprobante_Pago" runat="server" 
                    ControlToValidate="Comprobante_PagoTextBox"
                    ErrorMessage="El campo Comprobante_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Factura_Memo_Pago </td>                
				<td><asp:TextBox ID="Factura_Memo_PagoTextBox" runat="server" Text='<%# Bind("Factura_Memo_Pago") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFactura_Memo_Pago" runat="server" 
                    ControlToValidate="Factura_Memo_PagoTextBox"
                    ErrorMessage="El campo Factura_Memo_Pago es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Cta_X_Cobrar </td>                
				<td><asp:TextBox ID="Valor_Cta_X_CobrarTextBox" runat="server" Text='<%# Bind("Valor_Cta_X_Cobrar","{0:N2}") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Cta_X_Cobrar" runat="server" 
                    ControlToValidate="Valor_Cta_X_CobrarTextBox"
                    ErrorMessage="El campo Valor_Cta_X_Cobrar es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Pago_Confirmada </td>                
				<td><asp:TextBox ID="Fecha_Pago_ConfirmadaTextBox" runat="server" Text='<%# Bind("Fecha_Pago_Confirmada","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Pago_Confirmada" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Pago_Confirmada" TargetControlID="Fecha_Pago_ConfirmadaTextBox" PopupButtonID="btcexFecha_Pago_Confirmada" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Pago_Confirmada" runat="server" 
                    ControlToValidate="Fecha_Pago_ConfirmadaTextBox"
                    ErrorMessage="El campo Fecha_Pago_Confirmada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Pago"/>
					<asp:RangeValidator ID="rvFecha_Pago_Confirmada" runat="server" 
                    ErrorMessage="El campo Fecha_Pago_Confirmada no contiene una fecha válida" 
                    ControlToValidate="Fecha_Pago_ConfirmadaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Pago"/>
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Planilla_Pago"/>
            &nbsp;
            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="EditButton">
            <table>
			<tr style="display:none">
                <td> Id </td>
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Fis_Planilla_Id </td>
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Pago </td>
				<td><asp:TextBox ID="Fecha_PagoTextBox" runat="server" Text='<%# Bind("Fecha_Pago","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Comprobante_Pago </td>
				<td><asp:TextBox ID="Comprobante_PagoTextBox" runat="server" Text='<%# Bind("Comprobante_Pago") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Factura_Memo_Pago </td>
				<td><asp:TextBox ID="Factura_Memo_PagoTextBox" runat="server" Text='<%# Bind("Factura_Memo_Pago") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Cta_X_Cobrar </td>
				<td><asp:TextBox ID="Valor_Cta_X_CobrarTextBox" runat="server" Text='<%# Bind("Valor_Cta_X_Cobrar","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Fecha_Pago_Confirmada </td>
				<td><asp:TextBox ID="Fecha_Pago_ConfirmadaTextBox" runat="server" Text='<%# Bind("Fecha_Pago_Confirmada","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			</table>
            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            &nbsp;
            <asp:Button ID="NewButton" RunAt="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorCom_Planilla_Pago" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Planilla_Pago" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Planilla_Pago"/>
    </asp:Panel>
	<%--[X] FormView de Com_Planilla_Pago --%>

    <%--[O] GridView de Com_Planilla_Deposito --%>
    <asp:Panel ID="Panel2" runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Planilla_Deposito" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Planilla_Deposito" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Planilla_Deposito_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Fis_Planilla_Id" HeaderText="Fis_Planilla_Id"   SortExpression="Fis_Planilla_Id" />
			<asp:BoundField DataField="Codigo_Deposito" HeaderText="Codigo_Deposito"   SortExpression="Codigo_Deposito" />
			<asp:BoundField DataField="Fecha_Deposito" HeaderText="Fecha_Deposito"   DataFormatString="{0:d}" SortExpression="Fecha_Deposito" />
				<asp:BoundField DataField="Comprobante_Ctbl" HeaderText="Comprobante_Ctbl"   SortExpression="Comprobante_Ctbl" />
			<asp:BoundField DataField="Valor" HeaderText="Valor"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Valor_Interes" HeaderText="Valor_Interes"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Descripcion" HeaderText="Descripcion"   SortExpression="Descripcion" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Planilla_Deposito --%>

    <%--[O] FormView de Com_Planilla_Deposito --%>
    <asp:Panel runat="server" ID="pfvCom_Planilla_Deposito" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvCom_Planilla_Deposito" runat="server" DataSourceID="odsfvCom_Planilla_Deposito" 
            oniteminserting="fvCom_Planilla_Deposito_ItemInserting" 
            onitemdeleted="fvCom_Planilla_Deposito_ItemDeleted" 
            oniteminserted="fvCom_Planilla_Deposito_ItemInserted" 
            onitemupdated="fvCom_Planilla_Deposito_ItemUpdated"
			ondatabound="fvCom_Planilla_Deposito_DataBound" 
            onprerender="fvCom_Planilla_Deposito_PreRender"
			onitemupdating="fvCom_Planilla_Deposito_ItemUpdating"
			onitemdeleting="fvCom_Planilla_Deposito_ItemDeleting"
			>
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Fis_Planilla_Id </td>                
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Codigo_Deposito </td>                
				<td><asp:TextBox ID="Codigo_DepositoTextBox" runat="server" Text='<%# Bind("Codigo_Deposito") %>'  CssClass="txtEdit"  />
				
					</td>
            </tr>
			<tr >
                <td> Fecha_Deposito </td>                
				<td><asp:TextBox ID="Fecha_DepositoTextBox" runat="server" Text='<%# Bind("Fecha_Deposito","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Deposito" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Deposito" TargetControlID="Fecha_DepositoTextBox" PopupButtonID="btcexFecha_Deposito" />
				
					
				</td>
            </tr>
			<tr >
                <td> Comprobante_Ctbl </td>                
				<td><asp:TextBox ID="Comprobante_CtblTextBox" runat="server" Text='<%# Bind("Comprobante_Ctbl") %>'  CssClass="txtEdit"  />
				
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","{0:N2}") %>'  CssClass="txtEditValor"  />
				
					</td>
            </tr>
			<tr >
                <td> Valor_Interes </td>                
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes","{0:N2}") %>'  CssClass="txtEditValor"  />
				
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Panel runat="server" ID = "panelInsertTemplate" DefaultButton="InsertButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Fis_Planilla_Id </td>                
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Codigo_Deposito </td>                
				<td><asp:TextBox ID="Codigo_DepositoTextBox" runat="server" Text='<%# Bind("Codigo_Deposito") %>'  CssClass="txtEdit"  />
				
					</td>
            </tr>
			<tr >
                <td> Fecha_Deposito </td>                
				<td><asp:TextBox ID="Fecha_DepositoTextBox" runat="server" Text='<%# Bind("Fecha_Deposito","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Deposito" Text="."/>
				<AjaxControlToolkit:CalendarExtender runat="server" ID="cexFecha_Deposito" TargetControlID="Fecha_DepositoTextBox" PopupButtonID="btcexFecha_Deposito" />
				
				</td>
            </tr>
			<tr >
                <td> Comprobante_Ctbl </td>                
				<td><asp:TextBox ID="Comprobante_CtblTextBox" runat="server" Text='<%# Bind("Comprobante_Ctbl") %>'  CssClass="txtEdit"  />
				
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","{0:N2}") %>'  CssClass="txtEditValor"  />
		
					</td>
            </tr>
			<tr >
                <td> Valor_Interes </td>                
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes","{0:N2}") %>'  CssClass="txtEditValor"  />
				
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;
            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="EditButton">
            <table>
			<tr style="display:none">
                <td> Id </td>
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fis_Planilla_Id </td>
				<td><asp:TextBox ID="Fis_Planilla_IdTextBox" runat="server" Text='<%# Bind("Fis_Planilla_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Codigo_Deposito </td>
				<td><asp:TextBox ID="Codigo_DepositoTextBox" runat="server" Text='<%# Bind("Codigo_Deposito") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Deposito </td>
				<td><asp:TextBox ID="Fecha_DepositoTextBox" runat="server" Text='<%# Bind("Fecha_Deposito","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Comprobante_Ctbl </td>
				<td><asp:TextBox ID="Comprobante_CtblTextBox" runat="server" Text='<%# Bind("Comprobante_Ctbl") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor </td>
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Valor_Interes </td>
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Descripcion </td>
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine" /></td>
							</tr>
			</table>
            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            &nbsp;
            <asp:Button ID="NewButton" RunAt="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorCom_Planilla_Deposito" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Planilla_Deposito" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        
    </asp:Panel>
	<%--[X] FormView de Com_Planilla_Deposito --%>

    </ContentTemplate>
    </asp:UpdatePanel>

    <%--[O]INICIO Fuentes de datos de Com_Planilla_Pago --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Pago" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Planilla_Pago">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Pago_GetByFis_Planilla_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByFis_Planilla_Id" 
        TypeName="FEL.COM.BO_Com_Planilla_Pago">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="Gv_Fis_Planilla_Periodo" Name="p_Fis_Planilla_Id" PropertyName="SelectedValue" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Pago_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Planilla_Pago">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para obtener los dominios de un campo en un objeto --%>
    <asp:ObjectDataSource ID="odsDominioAnio" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByObjetoCampo" 
        TypeName="FEL.DIC.BO_Dic_Dominio">
        <SelectParameters>
            <asp:Parameter DefaultValue="Nombre" Name="sortExpression" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter DefaultValue="TABLA" Name="Objeto_Nombre" Type="String" />
            <asp:Parameter DefaultValue="CAMPO" Name="Campo_Nombre" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvCom_Planilla_Pago" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Planilla_Pago"
        DataObjectTypeName="Com_Planilla_Pago"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Planilla_Pago_Inserted" 
        onupdated="odsfvCom_Planilla_Pago_Updated" 
		ondeleted="odsfvCom_Planilla_Pago_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Planilla_Pago" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Planilla_Pago --%>

<%--[O]INICIO Fuentes de datos de Com_Planilla_Deposito --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Deposito" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Planilla_Deposito">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Deposito_GetByFis_Planilla_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByFis_Planilla_Id" 
        TypeName="FEL.COM.BO_Com_Planilla_Deposito">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="Gv_Fis_Planilla_Periodo" Name="p_Fis_Planilla_Id" PropertyName="SelectedValue" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Planilla_Deposito_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Planilla_Deposito">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para obtener los dominios de un campo en un objeto --%>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByObjetoCampo" 
        TypeName="FEL.DIC.BO_Dic_Dominio">
        <SelectParameters>
            <asp:Parameter DefaultValue="Nombre" Name="sortExpression" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter DefaultValue="TABLA" Name="Objeto_Nombre" Type="String" />
            <asp:Parameter DefaultValue="CAMPO" Name="Campo_Nombre" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvCom_Planilla_Deposito" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Planilla_Deposito"
        DataObjectTypeName="Com_Planilla_Deposito"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Planilla_Deposito_Inserted" 
        onupdated="odsfvCom_Planilla_Deposito_Updated" 
		ondeleted="odsfvCom_Planilla_Deposito_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Planilla_Deposito" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Planilla_Deposito --%>
</asp:Content>

