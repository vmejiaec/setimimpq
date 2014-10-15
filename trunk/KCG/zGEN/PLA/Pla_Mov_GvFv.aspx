<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Mov_GvFv.aspx.cs" 
Inherits="PLA_Pla_Mov_GvFv" %>

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
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Pla_Mov --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Mov" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Mov" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Mov_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Pla_Poa_Id" HeaderText="Pla_Poa_Id"   />
			<asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"   />
			<asp:BoundField DataField="Orden" HeaderText="Orden"   />
			<asp:BoundField DataField="Valor" HeaderText="Valor"    DataFormatString="{0:N2}"/>
				<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
			<asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"   />
			<asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Pla_Tarea_Nombre"   />
			<asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id"   />
			<asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Pla_Partida_Codigo"   />
			<asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Pla_Partida_Nombre"   />
			<asp:BoundField DataField="Pla_Doc_Tipo" HeaderText="Pla_Doc_Tipo"   />
			<asp:BoundField DataField="Pla_Doc_Fecha" HeaderText="Pla_Doc_Fecha"   />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Mov --%>

<%--Autocompletar del FormView de Pla_Mov --%>
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



    <%--[O] FormView de Pla_Mov --%>
    <asp:Panel runat="server" ID="pfvPla_Mov" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Mov" runat="server" DataSourceID="odsfvPla_Mov" 
            oniteminserting="fvPla_Mov_ItemInserting" 
            onitemdeleted="fvPla_Mov_ItemDeleted" 
            oniteminserted="fvPla_Mov_ItemInserted" 
            onitemupdated="fvPla_Mov_ItemUpdated"
			ondatabound="fvPla_Mov_DataBound" 
            onprerender="fvPla_Mov_PreRender"
			onitemupdating="fvPla_Mov_ItemUpdating"
			onitemdeleting="fvPla_Mov_ItemDeleting"
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Poa_Id </td>                
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Poa_Id" runat="server" 
                    ControlToValidate="Pla_Poa_IdTextBox"
                    ErrorMessage="El campo Pla_Poa_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Id" runat="server" 
                    ControlToValidate="Pla_Doc_IdTextBox"
                    ErrorMessage="El campo Pla_Doc_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Orden </td>                
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqOrden" runat="server" 
                    ControlToValidate="OrdenTextBox"
                    ErrorMessage="El campo Orden es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Id" runat="server" 
                    ControlToValidate="Pla_Tarea_IdTextBox"
                    ErrorMessage="El campo Pla_Tarea_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Id" runat="server" 
                    ControlToValidate="Pla_Partida_IdTextBox"
                    ErrorMessage="El campo Pla_Partida_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Tipo </td>                
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Tipo" runat="server" 
                    ControlToValidate="Pla_Doc_TipoTextBox"
                    ErrorMessage="El campo Pla_Doc_Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Fecha </td>                
				<td><asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Fecha" runat="server" 
                    ControlToValidate="Pla_Doc_FechaTextBox"
                    ErrorMessage="El campo Pla_Doc_Fecha es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_Mov"/>
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Poa_Id </td>                
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Poa_Id" runat="server" 
                    ControlToValidate="Pla_Poa_IdTextBox"
                    ErrorMessage="El campo Pla_Poa_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Id" runat="server" 
                    ControlToValidate="Pla_Doc_IdTextBox"
                    ErrorMessage="El campo Pla_Doc_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Orden </td>                
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqOrden" runat="server" 
                    ControlToValidate="OrdenTextBox"
                    ErrorMessage="El campo Orden es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Id" runat="server" 
                    ControlToValidate="Pla_Tarea_IdTextBox"
                    ErrorMessage="El campo Pla_Tarea_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Id" runat="server" 
                    ControlToValidate="Pla_Partida_IdTextBox"
                    ErrorMessage="El campo Pla_Partida_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Tipo </td>                
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Tipo" runat="server" 
                    ControlToValidate="Pla_Doc_TipoTextBox"
                    ErrorMessage="El campo Pla_Doc_Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Fecha </td>                
				<td><asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Fecha" runat="server" 
                    ControlToValidate="Pla_Doc_FechaTextBox"
                    ErrorMessage="El campo Pla_Doc_Fecha es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgPla_Mov"/>
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
                <td> Pla_Poa_Id </td>
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Id </td>
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Orden </td>
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor </td>
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Id </td>
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Partida_Id </td>
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Partida_Codigo </td>
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Partida_Nombre </td>
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Tipo </td>
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Fecha </td>
				<td><asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorPla_Mov" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Mov" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Mov"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Mov --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_Mov --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Mov" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Mov">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Mov_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Mov">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Mov_GetByPla_Doc_Id" runat="server" 
        SelectMethod="GetByPla_Doc_Id" 
        TypeName="FEL.PLA.BO_Pla_Mov">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Doc_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Mov_GetByPla_Poa_Id" runat="server" 
        SelectMethod="GetByPla_Poa_Id" 
        TypeName="FEL.PLA.BO_Pla_Mov">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Poa_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para obtener los dominios de un campo en un objeto --%>
    <asp:ObjectDataSource ID="odsDominioAnio" runat="server" 
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
    <asp:ObjectDataSource ID="odsfvPla_Mov" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Mov"
        DataObjectTypeName="Pla_Mov"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Mov_Inserted" 
        onupdated="odsfvPla_Mov_Updated" 
		ondeleted="odsfvPla_Mov_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Mov" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_Mov --%>
</asp:Content>
