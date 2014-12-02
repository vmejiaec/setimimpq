<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Com_Contrato_Legal_GvFv.aspx.cs" 
Inherits="COM_Com_Contrato_Legal_GvFv" %>

<%@ Register tagprefix="koala" 
assembly="KoalaWebControls" 
namespace="Koala.KoalaWebControls" %>

<%@ Register Assembly="AjaxControlToolkit" 
Namespace="AjaxControlToolkit" 
TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--Funcion para poner el formato numérico a los campos del FV--%>
<script type="text/javascript">
    function PonerFormatoNumericoACamposFV() {
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Legal_Valor_ContratoTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	    }
</script>
<asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>
<%--Ejecuta la función antes de presentar los objetos en pantalla mediante PageRequestManager--%>
<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PonerFormatoNumericoACamposFV);
</script>

    <%--[O] Cabecera--%>
    <asp:Panel runat="server" ID="pcabecera" GroupingText="Cabecera">
        <asp:Label ID="lbCabecera" runat="server" Text="Seleccionar el ... :"></asp:Label>
        <asp:DropDownList ID="ddlCabecera" runat="server" AutoPostBack="true" >
        </asp:DropDownList>        
    </asp:Panel>
	<%--[X] Cabecera--%>

    <%--[O] Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <asp:Label ID="lbFiltro" runat="server" Text="Filtro"></asp:Label>
        <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
            <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Com_Contrato_Legal --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Contrato_Legal" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_Legal" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_Legal_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Com_Contrato_Id" HeaderText="Com_Contrato_Id"   SortExpression="Com_Contrato_Id" />
			<asp:BoundField DataField="Com_Contrato_Tipo_Id" HeaderText="Com_Contrato_Tipo_Id"   SortExpression="Com_Contrato_Tipo_Id" />
			<asp:BoundField DataField="URL_Contrato_Word" HeaderText="URL_Contrato_Word"   SortExpression="URL_Contrato_Word" />
			<asp:BoundField DataField="URL_Contrato_Scan" HeaderText="URL_Contrato_Scan"   SortExpression="URL_Contrato_Scan" />
			<asp:BoundField DataField="Desc_Alerta_1" HeaderText="Desc_Alerta_1"   SortExpression="Desc_Alerta_1" />
			<asp:BoundField DataField="Desc_Alerta_2" HeaderText="Desc_Alerta_2"   SortExpression="Desc_Alerta_2" />
			<asp:BoundField DataField="Desc_Alerta_3" HeaderText="Desc_Alerta_3"   SortExpression="Desc_Alerta_3" />
			<asp:BoundField DataField="Fecha_Firma_Contrato" HeaderText="Fecha_Firma_Contrato"   DataFormatString="{0:d}" SortExpression="Fecha_Firma_Contrato" />
				<asp:BoundField DataField="Fecha_Contrato" HeaderText="Fecha_Contrato"   DataFormatString="{0:d}" SortExpression="Fecha_Contrato" />
				<asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"   SortExpression="Pla_Doc_Id" />
			<asp:BoundField DataField="Valor_Contrato" HeaderText="Valor_Contrato"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Plazo_Contrato" HeaderText="Plazo_Contrato"   SortExpression="Plazo_Contrato" />
			<asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"   SortExpression="Pla_Tarea_Id" />
			<asp:BoundField DataField="Pla_Tarea_Codigo" HeaderText="Pla_Tarea_Codigo"   SortExpression="Pla_Tarea_Codigo" />
			<asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Pla_Tarea_Nombre"   SortExpression="Pla_Tarea_Nombre" />
			<asp:BoundField DataField="Par_Razon_Social_Id_Contratista" HeaderText="Par_Razon_Social_Id_Contratista"   SortExpression="Par_Razon_Social_Id_Contratista" />
			<asp:BoundField DataField="Par_Razon_Social_Nombre_Contratista" HeaderText="Par_Razon_Social_Nombre_Contratista"   SortExpression="Par_Razon_Social_Nombre_Contratista" />
			<asp:BoundField DataField="Par_Razon_Social_Numero_Contratista" HeaderText="Par_Razon_Social_Numero_Contratista"   SortExpression="Par_Razon_Social_Numero_Contratista" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Contrato_Legal --%>

<%--Autocompletar del FormView de Com_Contrato_Legal --%>
<%--[0]INICIO Javascript para manegar los campos de autocompletar --%>
<div>
<%--<script type="text/javascript" >
    function acxCabecera_Nombre_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('<%= ((TextBox)fv.FindControl("Cabecera_Id")).ClientID %>');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('<%= ((TextBox)fv.FindControl("Cabecera_Codigo")).ClientID %>');
        xCodigo.value = params[1];
        // coloca el id del maestro en el detalle mediante el contextKey
        $find('acxBID_Detalle_Nombre').set_contextKey(xId.value);
    }
    function acxDetalle_Nombre_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('<%= ((TextBox)fv.FindControl("Detalle_Id")).ClientID %>');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('<%= ((TextBox)fv.FindControl("Detalle_Codigo")).ClientID %>');
        xCodigo.value = params[1];
    }
</script>--%>
</div>
<%--[X]FIN Javascript para manegar los campos de autocompletar --%>



    <%--[O] FormView de Com_Contrato_Legal --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_Legal" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvCom_Contrato_Legal" runat="server" DataSourceID="odsfvCom_Contrato_Legal" 
            oniteminserting="fvCom_Contrato_Legal_ItemInserting" 
            onitemdeleted="fvCom_Contrato_Legal_ItemDeleted" 
            oniteminserted="fvCom_Contrato_Legal_ItemInserted" 
            onitemupdated="fvCom_Contrato_Legal_ItemUpdated"
			ondatabound="fvCom_Contrato_Legal_DataBound" 
            onprerender="fvCom_Contrato_Legal_PreRender"
			onitemupdating="fvCom_Contrato_Legal_ItemUpdating"
			onitemdeleting="fvCom_Contrato_Legal_ItemDeleting"
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
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Com_Contrato_Tipo_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_Tipo_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> URL_Contrato_Word </td>                
				<td><asp:TextBox ID="URL_Contrato_WordTextBox" runat="server" Text='<%# Bind("URL_Contrato_Word") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Contrato_Word" runat="server" 
                    ControlToValidate="URL_Contrato_WordTextBox"
                    ErrorMessage="El campo URL_Contrato_Word es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> URL_Contrato_Scan </td>                
				<td><asp:TextBox ID="URL_Contrato_ScanTextBox" runat="server" Text='<%# Bind("URL_Contrato_Scan") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Contrato_Scan" runat="server" 
                    ControlToValidate="URL_Contrato_ScanTextBox"
                    ErrorMessage="El campo URL_Contrato_Scan es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_1 </td>                
				<td><asp:TextBox ID="Desc_Alerta_1TextBox" runat="server" Text='<%# Bind("Desc_Alerta_1") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_1" runat="server" 
                    ControlToValidate="Desc_Alerta_1TextBox"
                    ErrorMessage="El campo Desc_Alerta_1 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_2 </td>                
				<td><asp:TextBox ID="Desc_Alerta_2TextBox" runat="server" Text='<%# Bind("Desc_Alerta_2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_2" runat="server" 
                    ControlToValidate="Desc_Alerta_2TextBox"
                    ErrorMessage="El campo Desc_Alerta_2 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_3 </td>                
				<td><asp:TextBox ID="Desc_Alerta_3TextBox" runat="server" Text='<%# Bind("Desc_Alerta_3") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_3" runat="server" 
                    ControlToValidate="Desc_Alerta_3TextBox"
                    ErrorMessage="El campo Desc_Alerta_3 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Firma_Contrato </td>                
				<td><asp:TextBox ID="Fecha_Firma_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Firma_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Firma_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Firma_Contrato" TargetControlID="Fecha_Firma_ContratoTextBox" PopupButtonID="btcexFecha_Firma_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Firma_Contrato" runat="server" 
                    ControlToValidate="Fecha_Firma_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Firma_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					<asp:RangeValidator ID="rvFecha_Firma_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Firma_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_Firma_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Legal"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Contrato </td>                
				<td><asp:TextBox ID="Fecha_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Contrato" TargetControlID="Fecha_ContratoTextBox" PopupButtonID="btcexFecha_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Contrato" runat="server" 
                    ControlToValidate="Fecha_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					<asp:RangeValidator ID="rvFecha_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Legal"/>
				</td>
            </tr>
			<tr >
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Valor_Contrato </td>                
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Contrato" runat="server" 
                    ControlToValidate="Valor_ContratoTextBox"
                    ErrorMessage="El campo Valor_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Contrato </td>                
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Contrato" runat="server" 
                    ControlToValidate="Plazo_ContratoTextBox"
                    ErrorMessage="El campo Plazo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Id_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Id_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Id_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Nombre_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Nombre_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Nombre_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Numero_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Numero_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Numero_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato_Legal"/>
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
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Com_Contrato_Tipo_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_Tipo_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> URL_Contrato_Word </td>                
				<td><asp:TextBox ID="URL_Contrato_WordTextBox" runat="server" Text='<%# Bind("URL_Contrato_Word") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Contrato_Word" runat="server" 
                    ControlToValidate="URL_Contrato_WordTextBox"
                    ErrorMessage="El campo URL_Contrato_Word es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> URL_Contrato_Scan </td>                
				<td><asp:TextBox ID="URL_Contrato_ScanTextBox" runat="server" Text='<%# Bind("URL_Contrato_Scan") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Contrato_Scan" runat="server" 
                    ControlToValidate="URL_Contrato_ScanTextBox"
                    ErrorMessage="El campo URL_Contrato_Scan es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_1 </td>                
				<td><asp:TextBox ID="Desc_Alerta_1TextBox" runat="server" Text='<%# Bind("Desc_Alerta_1") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_1" runat="server" 
                    ControlToValidate="Desc_Alerta_1TextBox"
                    ErrorMessage="El campo Desc_Alerta_1 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_2 </td>                
				<td><asp:TextBox ID="Desc_Alerta_2TextBox" runat="server" Text='<%# Bind("Desc_Alerta_2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_2" runat="server" 
                    ControlToValidate="Desc_Alerta_2TextBox"
                    ErrorMessage="El campo Desc_Alerta_2 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Alerta_3 </td>                
				<td><asp:TextBox ID="Desc_Alerta_3TextBox" runat="server" Text='<%# Bind("Desc_Alerta_3") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Alerta_3" runat="server" 
                    ControlToValidate="Desc_Alerta_3TextBox"
                    ErrorMessage="El campo Desc_Alerta_3 es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Firma_Contrato </td>                
				<td><asp:TextBox ID="Fecha_Firma_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Firma_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Firma_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Firma_Contrato" TargetControlID="Fecha_Firma_ContratoTextBox" PopupButtonID="btcexFecha_Firma_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Firma_Contrato" runat="server" 
                    ControlToValidate="Fecha_Firma_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Firma_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					<asp:RangeValidator ID="rvFecha_Firma_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Firma_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_Firma_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Legal"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Contrato </td>                
				<td><asp:TextBox ID="Fecha_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Contrato" TargetControlID="Fecha_ContratoTextBox" PopupButtonID="btcexFecha_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Contrato" runat="server" 
                    ControlToValidate="Fecha_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					<asp:RangeValidator ID="rvFecha_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Legal"/>
				</td>
            </tr>
			<tr >
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Valor_Contrato </td>                
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Contrato" runat="server" 
                    ControlToValidate="Valor_ContratoTextBox"
                    ErrorMessage="El campo Valor_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Contrato </td>                
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Contrato" runat="server" 
                    ControlToValidate="Plazo_ContratoTextBox"
                    ErrorMessage="El campo Plazo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Id_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Id_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Id_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Nombre_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Nombre_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Nombre_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Numero_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Numero_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Numero_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Legal"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Contrato_Legal"/>
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
                <td> Com_Contrato_Id </td>
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Com_Contrato_Tipo_Id </td>
				<td><asp:TextBox ID="Com_Contrato_Tipo_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> URL_Contrato_Word </td>
				<td><asp:TextBox ID="URL_Contrato_WordTextBox" runat="server" Text='<%# Bind("URL_Contrato_Word") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> URL_Contrato_Scan </td>
				<td><asp:TextBox ID="URL_Contrato_ScanTextBox" runat="server" Text='<%# Bind("URL_Contrato_Scan") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Desc_Alerta_1 </td>
				<td><asp:TextBox ID="Desc_Alerta_1TextBox" runat="server" Text='<%# Bind("Desc_Alerta_1") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Desc_Alerta_2 </td>
				<td><asp:TextBox ID="Desc_Alerta_2TextBox" runat="server" Text='<%# Bind("Desc_Alerta_2") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Desc_Alerta_3 </td>
				<td><asp:TextBox ID="Desc_Alerta_3TextBox" runat="server" Text='<%# Bind("Desc_Alerta_3") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Firma_Contrato </td>
				<td><asp:TextBox ID="Fecha_Firma_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Firma_Contrato","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Contrato </td>
				<td><asp:TextBox ID="Fecha_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Contrato","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Id </td>
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Contrato </td>
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Plazo_Contrato </td>
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Id </td>
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorCom_Contrato_Legal" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato_Legal" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Contrato_Legal"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_Legal --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Com_Contrato_Legal --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Legal" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Legal">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Legal_GetByCom_Contrato_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByCom_Contrato_Id" 
        TypeName="FEL.COM.BO_Com_Contrato_Legal">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Com_Contrato_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Legal_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato_Legal">
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
    <asp:ObjectDataSource ID="odsfvCom_Contrato_Legal" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Legal"
        DataObjectTypeName="Com_Contrato_Legal"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_Legal_Inserted" 
        onupdated="odsfvCom_Contrato_Legal_Updated" 
		ondeleted="odsfvCom_Contrato_Legal_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato_Legal" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato_Legal --%>
</asp:Content>
