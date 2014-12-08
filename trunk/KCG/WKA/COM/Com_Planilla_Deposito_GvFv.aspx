<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Com_Planilla_Deposito_GvFv.aspx.cs" 
Inherits="COM_Com_Planilla_Deposito_GvFv" %>

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
	$('#ctl00_ContentPlaceHolder1_fvCom_Planilla_Deposito_ValorTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	$('#ctl00_ContentPlaceHolder1_fvCom_Planilla_Deposito_Valor_InteresTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
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

    <%--[O] GridView de Com_Planilla_Deposito --%>
    <asp:Panel runat="server" GroupingText="Registros">
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

<%--Autocompletar del FormView de Com_Planilla_Deposito --%>
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
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo_Deposito" runat="server" 
                    ControlToValidate="Codigo_DepositoTextBox"
                    ErrorMessage="El campo Codigo_Deposito es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Deposito </td>                
				<td><asp:TextBox ID="Fecha_DepositoTextBox" runat="server" Text='<%# Bind("Fecha_Deposito","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Deposito" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Deposito" TargetControlID="Fecha_DepositoTextBox" PopupButtonID="btcexFecha_Deposito" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Deposito" runat="server" 
                    ControlToValidate="Fecha_DepositoTextBox"
                    ErrorMessage="El campo Fecha_Deposito es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					<asp:RangeValidator ID="rvFecha_Deposito" runat="server" 
                    ErrorMessage="El campo Fecha_Deposito no contiene una fecha válida" 
                    ControlToValidate="Fecha_DepositoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Deposito"/>
				</td>
            </tr>
			<tr >
                <td> Comprobante_Ctbl </td>                
				<td><asp:TextBox ID="Comprobante_CtblTextBox" runat="server" Text='<%# Bind("Comprobante_Ctbl") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComprobante_Ctbl" runat="server" 
                    ControlToValidate="Comprobante_CtblTextBox"
                    ErrorMessage="El campo Comprobante_Ctbl es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Interes </td>                
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Interes" runat="server" 
                    ControlToValidate="Valor_InteresTextBox"
                    ErrorMessage="El campo Valor_Interes es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Planilla_Deposito"/>
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
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo_Deposito" runat="server" 
                    ControlToValidate="Codigo_DepositoTextBox"
                    ErrorMessage="El campo Codigo_Deposito es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Deposito </td>                
				<td><asp:TextBox ID="Fecha_DepositoTextBox" runat="server" Text='<%# Bind("Fecha_Deposito","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Deposito" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Deposito" TargetControlID="Fecha_DepositoTextBox" PopupButtonID="btcexFecha_Deposito" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Deposito" runat="server" 
                    ControlToValidate="Fecha_DepositoTextBox"
                    ErrorMessage="El campo Fecha_Deposito es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					<asp:RangeValidator ID="rvFecha_Deposito" runat="server" 
                    ErrorMessage="El campo Fecha_Deposito no contiene una fecha válida" 
                    ControlToValidate="Fecha_DepositoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Planilla_Deposito"/>
				</td>
            </tr>
			<tr >
                <td> Comprobante_Ctbl </td>                
				<td><asp:TextBox ID="Comprobante_CtblTextBox" runat="server" Text='<%# Bind("Comprobante_Ctbl") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComprobante_Ctbl" runat="server" 
                    ControlToValidate="Comprobante_CtblTextBox"
                    ErrorMessage="El campo Comprobante_Ctbl es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Interes </td>                
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Interes" runat="server" 
                    ControlToValidate="Valor_InteresTextBox"
                    ErrorMessage="El campo Valor_Interes es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Planilla_Deposito"/>
					</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Planilla_Deposito"/>
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
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Valor_Interes </td>
				<td><asp:TextBox ID="Valor_InteresTextBox" runat="server" Text='<%# Bind("Valor_Interes") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
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
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Planilla_Deposito"/>
    </asp:Panel>
	<%--[X] FormView de Com_Planilla_Deposito --%>

</ContentTemplate>
</asp:UpdatePanel>

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
