<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Doc_GvFv.aspx.cs" 
Inherits="PLA_Pla_Doc_GvFv" %>

<%@ Register tagprefix="koala" 
assembly="KoalaWebControls" 
namespace="Koala.KoalaWebControls" %>

<%@ Register Assembly="AjaxControlToolkit" 
Namespace="AjaxControlToolkit" 
TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%--Funcion para poner el formato numérico a los campos del FV--%>
<%--<script type="text/javascript">
    function PonerFormatoNumericoACamposFV() {
        $('#ctl00_ContentPlaceHolder1_fvPla_Poa_Valor_InicialTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
        $('#ctl00_ContentPlaceHolder1_fvPla_Poa_Valor_SumaTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
    }
</script>--%>
<asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>
<%--Ejecuta la función antes de presentar los objetos en pantalla mediante PageRequestManager--%>
<%--<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PonerFormatoNumericoACamposFV);
</script>
--%>
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
			<asp:ListItem Text = "Descripcion" Value="Descripcion" ></asp:ListItem>
			<asp:ListItem Text = "Descripcion" Value="Descripcion" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Pla_Doc --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Doc" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Doc" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Doc_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Tipo" HeaderText="Tipo"   />
			<asp:BoundField DataField="Fecha_Solicita" HeaderText="Fecha_Solicita"   DataFormatString="{0:d}" />
				<asp:BoundField DataField="Per_Personal_Id_Solicita" HeaderText="Per_Personal_Id_Solicita"   />
			<asp:BoundField DataField="Area_Codigo_Solicita" HeaderText="Area_Codigo_Solicita"   />
			<asp:BoundField DataField="Descripcion" HeaderText="Descripcion"   />
			<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
			<asp:BoundField DataField="Per_Personal_Id_Crea" HeaderText="Per_Personal_Id_Crea"   />
			<asp:BoundField DataField="Per_Personal_Id_Modifica" HeaderText="Per_Personal_Id_Modifica"   />
			<asp:BoundField DataField="Valor_Solicita" HeaderText="Valor_Solicita"    DataFormatString="{0:N2}"/>
				<asp:BoundField DataField="Per_Personal_Id_Planifica" HeaderText="Per_Personal_Id_Planifica"   />
			<asp:BoundField DataField="Esta_Planificada" HeaderText="Esta_Planificada"   />
			<asp:BoundField DataField="Per_Personal_Id_Contrata" HeaderText="Per_Personal_Id_Contrata"   />
			<asp:BoundField DataField="Esta_Contratada" HeaderText="Esta_Contratada"   />
			<asp:BoundField DataField="PAC_Linea" HeaderText="PAC_Linea"   />
			<asp:BoundField DataField="CPC_Codigo" HeaderText="CPC_Codigo"   />
			<asp:BoundField DataField="Fecha_Contrata" HeaderText="Fecha_Contrata"   DataFormatString="{0:d}" />
				<asp:BoundField DataField="Fecha_Planifica" HeaderText="Fecha_Planifica"   DataFormatString="{0:d}" />
				<asp:BoundField DataField="Per_Personal_Nombre_Solicita" HeaderText="Per_Personal_Nombre_Solicita"   />
			<asp:BoundField DataField="Area_Nombre_Solicita" HeaderText="Area_Nombre_Solicita"   />
			<asp:BoundField DataField="Per_Personal_Nombre_Crea" HeaderText="Per_Personal_Nombre_Crea"   />
			<asp:BoundField DataField="Per_Personal_Nombre_Modifica" HeaderText="Per_Personal_Nombre_Modifica"   />
			<asp:BoundField DataField="Per_Personal_Nombre_Planifica" HeaderText="Per_Personal_Nombre_Planifica"   />
			<asp:BoundField DataField="Per_Personal_Nombre_Contrata" HeaderText="Per_Personal_Nombre_Contrata"   />
			<asp:BoundField DataField="Valor_Suma_Movs" HeaderText="Valor_Suma_Movs"    DataFormatString="{0:N2}"/>
				</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Doc --%>

<%--Autocompletar del FormView de Pla_Doc --%>
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



    <%--[O] FormView de Pla_Doc --%>
    <asp:Panel runat="server" ID="pfvPla_Doc" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Doc" runat="server" DataSourceID="odsfvPla_Doc" 
            oniteminserting="fvPla_Doc_ItemInserting" 
            onitemdeleted="fvPla_Doc_ItemDeleted" 
            oniteminserted="fvPla_Doc_ItemInserted" 
            onitemupdated="fvPla_Doc_ItemUpdated"
			ondatabound="fvPla_Doc_DataBound" 
            onprerender="fvPla_Doc_PreRender"
			onitemupdating="fvPla_Doc_ItemUpdating"
			onitemdeleting="fvPla_Doc_ItemDeleting"
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
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo" runat="server" 
                    ControlToValidate="CodigoTextBox"
                    ErrorMessage="El campo Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Tipo </td>                
				<td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqTipo" runat="server" 
                    ControlToValidate="TipoTextBox"
                    ErrorMessage="El campo Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Solicita </td>                
				<td><asp:TextBox ID="Fecha_SolicitaTextBox" runat="server" Text='<%# Bind("Fecha_Solicita","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Solicita" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Solicita" TargetControlID="Fecha_SolicitaTextBox" PopupButtonID="btcexFecha_Solicita" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Solicita" runat="server" 
                    ControlToValidate="Fecha_SolicitaTextBox"
                    ErrorMessage="El campo Fecha_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Solicita" runat="server" 
                    ErrorMessage="El campo Fecha_Solicita no contiene una fecha válida" 
                    ControlToValidate="Fecha_SolicitaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Id_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Area_Codigo_Solicita </td>                
				<td><asp:TextBox ID="Area_Codigo_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Codigo_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqArea_Codigo_Solicita" runat="server" 
                    ControlToValidate="Area_Codigo_SolicitaTextBox"
                    ErrorMessage="El campo Area_Codigo_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Crea </td>                
				<td><asp:TextBox ID="Per_Personal_Id_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Crea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Crea" runat="server" 
                    ControlToValidate="Per_Personal_Id_CreaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Modifica </td>                
				<td><asp:TextBox ID="Per_Personal_Id_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Modifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Modifica" runat="server" 
                    ControlToValidate="Per_Personal_Id_ModificaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Modifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Solicita </td>                
				<td><asp:TextBox ID="Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Valor_Solicita","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Solicita" runat="server" 
                    ControlToValidate="Valor_SolicitaTextBox"
                    ErrorMessage="El campo Valor_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Planifica </td>                
				<td><asp:TextBox ID="Per_Personal_Id_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Planifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Planifica" runat="server" 
                    ControlToValidate="Per_Personal_Id_PlanificaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Esta_Planificada </td>                
				<td><asp:TextBox ID="Esta_PlanificadaTextBox" runat="server" Text='<%# Bind("Esta_Planificada") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEsta_Planificada" runat="server" 
                    ControlToValidate="Esta_PlanificadaTextBox"
                    ErrorMessage="El campo Esta_Planificada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Contrata </td>                
				<td><asp:TextBox ID="Per_Personal_Id_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Contrata" runat="server" 
                    ControlToValidate="Per_Personal_Id_ContrataTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Esta_Contratada </td>                
				<td><asp:TextBox ID="Esta_ContratadaTextBox" runat="server" Text='<%# Bind("Esta_Contratada") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEsta_Contratada" runat="server" 
                    ControlToValidate="Esta_ContratadaTextBox"
                    ErrorMessage="El campo Esta_Contratada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> PAC_Linea </td>                
				<td><asp:TextBox ID="PAC_LineaTextBox" runat="server" Text='<%# Bind("PAC_Linea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPAC_Linea" runat="server" 
                    ControlToValidate="PAC_LineaTextBox"
                    ErrorMessage="El campo PAC_Linea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> CPC_Codigo </td>                
				<td><asp:TextBox ID="CPC_CodigoTextBox" runat="server" Text='<%# Bind("CPC_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCPC_Codigo" runat="server" 
                    ControlToValidate="CPC_CodigoTextBox"
                    ErrorMessage="El campo CPC_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Contrata </td>                
				<td><asp:TextBox ID="Fecha_ContrataTextBox" runat="server" Text='<%# Bind("Fecha_Contrata","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Contrata" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Contrata" TargetControlID="Fecha_ContrataTextBox" PopupButtonID="btcexFecha_Contrata" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Contrata" runat="server" 
                    ControlToValidate="Fecha_ContrataTextBox"
                    ErrorMessage="El campo Fecha_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Contrata" runat="server" 
                    ErrorMessage="El campo Fecha_Contrata no contiene una fecha válida" 
                    ControlToValidate="Fecha_ContrataTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Planifica </td>                
				<td><asp:TextBox ID="Fecha_PlanificaTextBox" runat="server" Text='<%# Bind("Fecha_Planifica","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Planifica" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Planifica" TargetControlID="Fecha_PlanificaTextBox" PopupButtonID="btcexFecha_Planifica" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Planifica" runat="server" 
                    ControlToValidate="Fecha_PlanificaTextBox"
                    ErrorMessage="El campo Fecha_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Planifica" runat="server" 
                    ErrorMessage="El campo Fecha_Planifica no contiene una fecha válida" 
                    ControlToValidate="Fecha_PlanificaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Area_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Area_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqArea_Nombre_Solicita" runat="server" 
                    ControlToValidate="Area_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Area_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Crea </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Crea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Crea" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_CreaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Modifica </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Modifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Modifica" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_ModificaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Modifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Planifica </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Planifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Planifica" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_PlanificaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Contrata </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Contrata" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_ContrataTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma_Movs </td>                
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma_Movs" runat="server" 
                    ControlToValidate="Valor_Suma_MovsTextBox"
                    ErrorMessage="El campo Valor_Suma_Movs es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_Doc"/>
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
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo" runat="server" 
                    ControlToValidate="CodigoTextBox"
                    ErrorMessage="El campo Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Tipo </td>                
				<td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqTipo" runat="server" 
                    ControlToValidate="TipoTextBox"
                    ErrorMessage="El campo Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Solicita </td>                
				<td><asp:TextBox ID="Fecha_SolicitaTextBox" runat="server" Text='<%# Bind("Fecha_Solicita","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Solicita" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Solicita" TargetControlID="Fecha_SolicitaTextBox" PopupButtonID="btcexFecha_Solicita" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Solicita" runat="server" 
                    ControlToValidate="Fecha_SolicitaTextBox"
                    ErrorMessage="El campo Fecha_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Solicita" runat="server" 
                    ErrorMessage="El campo Fecha_Solicita no contiene una fecha válida" 
                    ControlToValidate="Fecha_SolicitaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Id_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Area_Codigo_Solicita </td>                
				<td><asp:TextBox ID="Area_Codigo_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Codigo_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqArea_Codigo_Solicita" runat="server" 
                    ControlToValidate="Area_Codigo_SolicitaTextBox"
                    ErrorMessage="El campo Area_Codigo_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Crea </td>                
				<td><asp:TextBox ID="Per_Personal_Id_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Crea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Crea" runat="server" 
                    ControlToValidate="Per_Personal_Id_CreaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Modifica </td>                
				<td><asp:TextBox ID="Per_Personal_Id_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Modifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Modifica" runat="server" 
                    ControlToValidate="Per_Personal_Id_ModificaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Modifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Solicita </td>                
				<td><asp:TextBox ID="Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Valor_Solicita","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Solicita" runat="server" 
                    ControlToValidate="Valor_SolicitaTextBox"
                    ErrorMessage="El campo Valor_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Planifica </td>                
				<td><asp:TextBox ID="Per_Personal_Id_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Planifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Planifica" runat="server" 
                    ControlToValidate="Per_Personal_Id_PlanificaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Esta_Planificada </td>                
				<td><asp:TextBox ID="Esta_PlanificadaTextBox" runat="server" Text='<%# Bind("Esta_Planificada") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEsta_Planificada" runat="server" 
                    ControlToValidate="Esta_PlanificadaTextBox"
                    ErrorMessage="El campo Esta_Planificada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Contrata </td>                
				<td><asp:TextBox ID="Per_Personal_Id_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Contrata" runat="server" 
                    ControlToValidate="Per_Personal_Id_ContrataTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Esta_Contratada </td>                
				<td><asp:TextBox ID="Esta_ContratadaTextBox" runat="server" Text='<%# Bind("Esta_Contratada") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEsta_Contratada" runat="server" 
                    ControlToValidate="Esta_ContratadaTextBox"
                    ErrorMessage="El campo Esta_Contratada es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> PAC_Linea </td>                
				<td><asp:TextBox ID="PAC_LineaTextBox" runat="server" Text='<%# Bind("PAC_Linea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPAC_Linea" runat="server" 
                    ControlToValidate="PAC_LineaTextBox"
                    ErrorMessage="El campo PAC_Linea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> CPC_Codigo </td>                
				<td><asp:TextBox ID="CPC_CodigoTextBox" runat="server" Text='<%# Bind("CPC_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCPC_Codigo" runat="server" 
                    ControlToValidate="CPC_CodigoTextBox"
                    ErrorMessage="El campo CPC_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Contrata </td>                
				<td><asp:TextBox ID="Fecha_ContrataTextBox" runat="server" Text='<%# Bind("Fecha_Contrata","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Contrata" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Contrata" TargetControlID="Fecha_ContrataTextBox" PopupButtonID="btcexFecha_Contrata" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Contrata" runat="server" 
                    ControlToValidate="Fecha_ContrataTextBox"
                    ErrorMessage="El campo Fecha_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Contrata" runat="server" 
                    ErrorMessage="El campo Fecha_Contrata no contiene una fecha válida" 
                    ControlToValidate="Fecha_ContrataTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Planifica </td>                
				<td><asp:TextBox ID="Fecha_PlanificaTextBox" runat="server" Text='<%# Bind("Fecha_Planifica","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Planifica" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Planifica" TargetControlID="Fecha_PlanificaTextBox" PopupButtonID="btcexFecha_Planifica" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Planifica" runat="server" 
                    ControlToValidate="Fecha_PlanificaTextBox"
                    ErrorMessage="El campo Fecha_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					<asp:RangeValidator ID="rvFecha_Planifica" runat="server" 
                    ErrorMessage="El campo Fecha_Planifica no contiene una fecha válida" 
                    ControlToValidate="Fecha_PlanificaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Area_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Area_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqArea_Nombre_Solicita" runat="server" 
                    ControlToValidate="Area_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Area_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Crea </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Crea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Crea" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_CreaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Modifica </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Modifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Modifica" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_ModificaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Modifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Planifica </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Planifica") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Planifica" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_PlanificaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Planifica es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Contrata </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Contrata" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_ContrataTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma_Movs </td>                
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma_Movs" runat="server" 
                    ControlToValidate="Valor_Suma_MovsTextBox"
                    ErrorMessage="El campo Valor_Suma_Movs es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgPla_Doc"/>
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
                <td> Codigo </td>
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Tipo </td>
				<td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Solicita </td>
				<td><asp:TextBox ID="Fecha_SolicitaTextBox" runat="server" Text='<%# Bind("Fecha_Solicita","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Area_Codigo_Solicita </td>
				<td><asp:TextBox ID="Area_Codigo_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Codigo_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Descripcion </td>
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine" /></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Crea </td>
				<td><asp:TextBox ID="Per_Personal_Id_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Modifica </td>
				<td><asp:TextBox ID="Per_Personal_Id_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Solicita </td>
				<td><asp:TextBox ID="Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Valor_Solicita","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Planifica </td>
				<td><asp:TextBox ID="Per_Personal_Id_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Planifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Esta_Planificada </td>
				<td><asp:TextBox ID="Esta_PlanificadaTextBox" runat="server" Text='<%# Bind("Esta_Planificada") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Id_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Contrata") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Esta_Contratada </td>
				<td><asp:TextBox ID="Esta_ContratadaTextBox" runat="server" Text='<%# Bind("Esta_Contratada") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> PAC_Linea </td>
				<td><asp:TextBox ID="PAC_LineaTextBox" runat="server" Text='<%# Bind("PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> CPC_Codigo </td>
				<td><asp:TextBox ID="CPC_CodigoTextBox" runat="server" Text='<%# Bind("CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Contrata </td>
				<td><asp:TextBox ID="Fecha_ContrataTextBox" runat="server" Text='<%# Bind("Fecha_Contrata","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Planifica </td>
				<td><asp:TextBox ID="Fecha_PlanificaTextBox" runat="server" Text='<%# Bind("Fecha_Planifica","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Area_Nombre_Solicita </td>
				<td><asp:TextBox ID="Area_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Nombre_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Crea </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Modifica </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Planifica </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Planifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Contrata") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Suma_Movs </td>
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorPla_Doc" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Doc" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Doc"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Doc --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_Doc --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Doc" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByArea_Codigo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByArea_Codigo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Area_Codigo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByCodigo" runat="server" 
        SelectMethod="GetByCodigo" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByRangoFecha_Solicita" runat="server" 
        SelectMethod="GetByRangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_Codigo" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_Codigo" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Area_Codigo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_LikeDescripcion" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_LikeDescripcion" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Area_Codigo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Descripcion" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Area_Codigo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByTipo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_RangoFecha_Solicita_LikeDescripcion" runat="server" 
        SelectMethod="GetByTipo_RangoFecha_Solicita_LikeDescripcion" 
        TypeName="FEL.PLA.BO_Pla_Doc"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Descripcion" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para obtener los dominios de un campo en un objeto --%>
    <asp:ObjectDataSource ID="odsDominioAnio" runat="server" 
        SelectMethod="GetByObjetoCampo" 
        TypeName="FEL.DIC.BO_Dic_Dominio"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:Parameter DefaultValue="Nombre" Name="sortExpression" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter DefaultValue="TABLA" Name="Objeto_Nombre" Type="String" />
            <asp:Parameter DefaultValue="CAMPO" Name="Campo_Nombre" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Doc" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Doc"
        DataObjectTypeName="Pla_Doc"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Doc_Inserted" 
        onupdated="odsfvPla_Doc_Updated" 
		ondeleted="odsfvPla_Doc_Deleted"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Doc" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_Doc --%>
</asp:Content>
