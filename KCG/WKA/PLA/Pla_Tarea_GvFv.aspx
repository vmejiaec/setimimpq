<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Tarea_GvFv.aspx.cs" 
Inherits="PLA_Pla_Tarea_GvFv"%>

<%@ Register tagprefix="koala" 
assembly="KoalaWebControls" 
namespace="Koala.KoalaWebControls" %>

<%@ Register Assembly="AjaxControlToolkit" 
Namespace="AjaxControlToolkit" 
TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<%--[O]INICIO Funcion para poner el formato numérico a los campos del FV--%>
<script type="text/javascript">
    function PonerFormatoNumericoACampo_fvPla_Poa_Valor_Inicial() {
        $('#ctl00_ContentPlaceHolder1_fvPla_Poa_Valor_InicialTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
    }
</script>

<asp:UpdatePanel runat="server" ID="udpGridView">
<ContentTemplate>

<%--Ejecuta la función antes de presentar los objetos en pantalla mediante PageRequestManager--%>
<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PonerFormatoNumericoACampo_fvPla_Poa_Valor_Inicial);
</script>

<%--[0]INICIO Javascript para manegar los campos de autocompletar --%>
<script type="text/javascript" >
// Autocompletar en Tareas
    function acxPla_Cta_CodigoTextBox_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_IdTextBox');
        xId.value = params[0];
        // 2 Nombre
        var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_NombreTextBox');
        xNombre.value = params[2];
        // 3 Nivel
        var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_NivelTextBox');
        xNivel.value = params[3];
        // coloca el id del maestro en el detalle mediante el contextKey
        //$find('acxBID_Pla_Cta_NombreTextBox').set_contextKey(xId.value);
    }
    function acxPla_Cta_NombreTextBox_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_IdTextBox');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_CodigoTextBox');
        xCodigo.value = params[1];
        // 3 Nivel
        var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Tarea_Pla_Cta_NivelTextBox');
        xNivel.value = params[3];
    }
// Autocompletar en POA
    function acxPla_Partida_CodigoTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id                            
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_IdTextBox');
        xId.value = params[0];
        // 2 Nombre
        var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_NombreTextBox');
        xNombre.value = params[2];
    }
    function acxPla_Partida_NombreTextBox_Click (source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_IdTextBox');
        xId.value = params[0];
        // 1 Codigo
        var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Poa_Pla_Partida_CodigoTextBox');
        xCodigo.value = params[1];
    }
</script>
<%--[X]FIN Javascript para manegar los campos de autocompletar --%>

    <%--Cabecera--%>
    <asp:Panel runat="server" ID="pcabecera" GroupingText="Listado de Tareas y Partidas Presupuestarias del POA">
    <p class="pTextoPagina">
    Para filtrar los datos de la lista de tareas, seleccione un año específico de la lista desplegable. 
    Si desea buscar por una cuenta específica, ingrese el criterio de búsqueda y elija sobre
    cuál de los dos campos se va a aplicar. Para listar todas las tareas solo elija la opción Todos.
    </p>
        <asp:Label ID="lbCabecera" runat="server" Text="Seleccionar el año:"></asp:Label>
        <asp:DropDownList ID="ddlCabecera" runat="server" AutoPostBack="True" >
        </asp:DropDownList>        
    </asp:Panel>

    <%--Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <asp:Label ID="lbFiltro" runat="server" Text="Criterio"></asp:Label>
        <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId_Poa" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
            <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			<asp:ListItem Text = "Nombre" Value="Nombre" ></asp:ListItem>
            <asp:ListItem Text = "Cuenta" Value="Cuenta" ></asp:ListItem>
		</asp:DropDownList>
    </asp:Panel>

    <%--GridView de Tareas--%>
    <asp:Panel runat="server" GroupingText="Listado de Tareas">
    <p class="pTextoPagina">
    Listado de tareas ordenado según la columna Cuenta y la columna Código. Para modificar o crear
    una nueva tarea, elija el registro deseado pulsando en el botón [...] y el sistema le presentará
    la información de la tarea en el formulario inferior.
    </p>
    <asp:GridView ID="gvPla_Tarea" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Tarea_GetByAnio" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Tarea_SelectedIndexChanged" 
            ondatabound="gvPla_Tarea_DataBound">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />			
			<asp:BoundField DataField="Pla_Cta_Codigo" HeaderText="Cuenta"   />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Pla_Cta_Nombre" HeaderText="Pla_Cta_Nombre" Visible = "false"    />
			<asp:BoundField DataField="Pla_Cta_Nivel" HeaderText="Pla_Cta_Nivel"  Visible = "false" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   />            
			<asp:BoundField DataField="Fecha_Ini" HeaderText="Fecha_Ini"  DataFormatString="{0:d}" />
			<asp:BoundField DataField="Fecha_Fin" HeaderText="Fecha_Fin"  DataFormatString="{0:d}" />
            <asp:BoundField DataField="Valor_Inicial" HeaderText="Valor_Inicial"  DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
            <asp:BoundField DataField="Valor_Suma_Movs_Certificados" HeaderText="Certific."  DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
            <asp:BoundField DataField="Valor_Suma_Movs_Reasignacion" HeaderText="Reasign."  DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
            <asp:BoundField DataField="Valor_Suma" HeaderText="Saldo"  DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
                
                <asp:BoundField DataField="Pla_Cta_Id" HeaderText="Pla_Cta_Id" Visible = "false"    />
			    <asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />			
                <asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
			</Columns>
    </asp:GridView>
    </asp:Panel>

    <%--[O] Barras del Reporte --%>
    <asp:Panel runat="server" ID="pReportes" GroupingText="Reportes">
        <table>
        <tr>
            <td><asp:Button ID="btReporteTareasNiveles" runat="server" 
                    Text="Cuentas y Tareas por Niveles" 
                    onclick="btReporteTareasNiveles_Click" /></td>
            <td>
                <p class="pTextoPagina">
                Listado de cuentas del POA con cada uno de sus niveles hasta el detalle de las tareas, incluye los
                valores iniciales y el saldo hasta la fecha actual. Los valores se totalizan por niveles.
                </p>
            </td>
        </tr>
        </table>
    </asp:Panel>
    <%--[X] Barras del Reporte --%>

    <%--FormView Tarea --%>
    <asp:Panel runat="server" ID="pfvPla_Tarea" GroupingText="Editar la Tarea seleccionada" CssClass="panCol2">
    <p class="pTextoPagina">
    Elija una tarea del listado superior y el sistema presentará en el siguiente formulario los datos
    relacionados con dicha tarea, así como también el árbol de cuentas por niveles a la que pertenece la tarea 
    seleccionada.
    </p>
    <koala:FormViewSetim ID="fvPla_Tarea" runat="server" DataSourceID="odsfvPla_Tarea" 
            oniteminserting="fvPla_Tarea_ItemInserting" 
            onitemdeleted="fvPla_Tarea_ItemDeleted" 
            oniteminserted="fvPla_Tarea_ItemInserted" 
            onitemupdated="fvPla_Tarea_ItemUpdated"
			ondatabound="fvPla_Tarea_DataBound" 
            onprerender="fvPla_Tarea_PreRender" 
            onitemupdating="fvPla_Tarea_ItemUpdating" 
            onitemdeleting="fvPla_Tarea_ItemDeleting" DataKeyNames="Id" 
            >
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  /></td>
            </tr>
			<tr style="display:none">
                <td> Pla_Cta_Id </td>
                <td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>' /></td>
            </tr>
			<tr >
                <td> Cuenta </td>
                <td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_CodigoTextBox"
                        BehaviorID="acxBID_Pla_Cta_CodigoTextBox"
                        TargetControlID="Pla_Cta_CodigoTextBox" 
                        ServiceMethod="acxPla_Cta_GetByAnioLikeCodigo_List" 
                        UseContextKey="True" 
                        ContextKey=""
                        CompletionInterval="0"
                        MinimumPrefixLength="2"
                        OnClientItemSelected="acxPla_Cta_CodigoTextBox_Click"
                        />
				</td>
            </tr>
			<tr >
                <td> Cta_Nombre </td>
                <td>
                <asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nivel") %>' Width="35px"  />
                <asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit" Width ="340px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_NombreTextBox"
                        BehaviorID="acxBID_Pla_Cta_NombreTextBox"
                        TargetControlID="Pla_Cta_NombreTextBox"
                        ServiceMethod="acxPla_Cta_GetByAnioLikeNombre_List"
                        UseContextKey="True" 
                        ContextKey=""
                        CompletionInterval="0"
                        MinimumPrefixLength="2"
                        OnClientItemSelected="acxPla_Cta_NombreTextBox_Click" 
                        />
				</td>
            </tr>
			<tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Ini </td>
                <td><asp:TextBox ID="Fecha_IniTextBox" runat="server" Text='<%# Bind("Fecha_Ini","{0:d}") %>'  CssClass="txtEdit" />
                <asp:Button runat="server" ID="btcexFecha_Ini" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Ini" TargetControlID="Fecha_IniTextBox" PopupButtonID="btcexFecha_Ini" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Ini" runat="server" 
                    ControlToValidate="Fecha_IniTextBox"
                    ErrorMessage="Fecha_Ini es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="Fecha_Ini no es una fecha válida" 
                        ControlToValidate="Fecha_IniTextBox" 
                        Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020"  ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Fin </td>
                <td><asp:TextBox ID="Fecha_FinTextBox" runat="server" Text='<%# Bind("Fecha_Fin","{0:d}") %>'  CssClass="txtEdit"  />
                <asp:Button runat="server" ID="btcexFecha_Fin" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Fin" TargetControlID="Fecha_FinTextBox" PopupButtonID="btcexFecha_Fin" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Fin" runat="server" 
                    ControlToValidate="Fecha_FinTextBox"
                    ErrorMessage="Fecha_Fin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    <asp:RangeValidator ID="rvFecha_Fin" runat="server" 
                    ErrorMessage="Fecha_Fin no es una fecha válida" 
                    ControlToValidate="Fecha_FinTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020"  ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"  ValidationGroup="vgPla_Tarea"/>
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <div style="height:200px">
            </div>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <asp:Panel runat="server" ID = "panelInsertTemplate" DefaultButton="InsertButton">
			<table>
			<tr style="display:none">
                <td> Id </td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Pla_Cta_Id </td>
                <td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  /></td>
            </tr>
			<tr >
                <td> Cuenta </td>
                <td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_CodigoTextBox"
                        BehaviorID="acxBID_Pla_Cta_CodigoTextBox"
                        TargetControlID="Pla_Cta_CodigoTextBox" 
                        ServiceMethod="acxPla_Cta_GetByAnioLikeCodigo_List" 
                        UseContextKey="True" 
                        ContextKey=""
                        CompletionInterval="0"
                        MinimumPrefixLength="2"
                        OnClientItemSelected="acxPla_Cta_CodigoTextBox_Click"
                    />
				</td>
            </tr>
			<tr >
                <td> Cta_Nombre </td>
                <td>
                <asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nivel") %>'  Width="35px" />
                <asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit"   Width="340px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_NombreTextBox"
                        BehaviorID="acxBID_Pla_Cta_NombreTextBox"
                        TargetControlID="Pla_Cta_NombreTextBox"
                        ServiceMethod="acxPla_Cta_GetByAnioLikeNombre_List"
                        UseContextKey="True" 
                        ContextKey=""
                        CompletionInterval="0"
                        MinimumPrefixLength="2"
                        OnClientItemSelected="acxPla_Cta_NombreTextBox_Click" 
                    />
				</td>
            </tr>
			<tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Ini </td>                
				<td><asp:TextBox ID="Fecha_IniTextBox" runat="server" Text='<%# Bind("Fecha_Ini","{0:d}") %>'  CssClass="txtEdit"  />
                <asp:Button runat="server" ID="btcexFecha_Ini" Text="."/>
                <ajax:CalendarExtender runat="server" ID="cexFecha_Ini" TargetControlID="Fecha_IniTextBox" PopupButtonID="btcexFecha_Ini"/>
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Ini" runat="server" 
                    ControlToValidate="Fecha_IniTextBox"
                    ErrorMessage="El campo Fecha_Ini es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
					<asp:RangeValidator ID="rvFecha_Ini" runat="server" 
                    ErrorMessage="El campo Fecha_Ini no contiene una fecha válida" 
                    ControlToValidate="Fecha_IniTextBox"                    
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020"  ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Fin </td>                
				<td><asp:TextBox ID="Fecha_FinTextBox" runat="server" Text='<%# Bind("Fecha_Fin","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Fin" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Fin" TargetControlID="Fecha_FinTextBox" PopupButtonID="btcexFecha_Fin" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Fin" runat="server" 
                    ControlToValidate="Fecha_FinTextBox"
                    ErrorMessage="El campo Fecha_Fin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Tarea"/>
					<asp:RangeValidator ID="rvFecha_Fin" runat="server" 
                    ErrorMessage="El campo Fecha_Fin no contiene una fecha válida" 
                    ControlToValidate="Fecha_FinTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020"  ValidationGroup="vgPla_Tarea"/>
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar"  ValidationGroup="vgPla_Tarea"/>
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
                <td> Pla_Cta_Id </td>
                <td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Cuenta </td>
                <td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
            <tr>
                <td> ... </td>
                <td>
                    <asp:GridView ID="gvPla_Cta_Arbol" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="odsPla_Cta_Arbol"
                        AlternatingRowStyle-CssClass="alternatingrowstyle" HeaderStyle-CssClass="headerstyle" >
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id"  Visible="False" />
                            <asp:BoundField DataField="Anio" HeaderText="Anio"  Visible="False" />
                            <asp:BoundField DataField="Codigo" HeaderText="Codigo" />
                            <asp:BoundField DataField="Nivel" HeaderText="Nivel" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" Visible="False" />
                            <asp:BoundField DataField="Estado" HeaderText="Estado"  Visible="False" />
                        </Columns>
                    </asp:GridView>

                    <asp:ObjectDataSource ID="odsPla_Cta_Arbol" runat="server" 
                        SelectMethod="GetByAnioArbolPla_Cta_Codigo" TypeName="FEL.PLA.BO_Pla_Cta" 
                        onselecting="odsPla_Cta_Arbol_Selecting"
                        SortParameterName = "sortExpression">
                        <SelectParameters>
                            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                            <asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="CodigoTextBox" Name="p_Pla_Cta_Codigo" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </td>
            </tr>
			<tr >
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
            <tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" /></td>
            </tr>
			<tr >
                <td> Fecha_Ini </td>
                <td><asp:TextBox ID="Fecha_IniTextBox" runat="server" Text='<%# Bind("Fecha_Ini","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Fecha_Fin </td>
                <td><asp:TextBox ID="Fecha_FinTextBox" runat="server" Text='<%# Bind("Fecha_Fin","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorTarea" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoTarea" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Tarea"/>
    </asp:Panel>

    <%--[O] INICIO GridView y FormView del Detalle POA --%>    
    <asp:Panel ID="Panel1" runat="server" GroupingText="Asignación de Partidas a la Tarea" CssClass="panCol2" >
    <p class="pTextoPagina">
    Para relacionar una tarea con una partida presupuestaria, elija el código de la partida deseada
    de la lista desplegada en el campo Partida_Codigo, luego ingrese el valor inicial.
    </p>
    <%----[O] GridView POA --%>
    <asp:GridView ID="gvPla_Poa" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Poa_GetByPla_Tarea_Id" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Poa_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Partida"   />
			<asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Partida_Nombre"   />
			<asp:BoundField DataField="Valor_Inicial" HeaderText="Valor_Inicial" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
			<asp:BoundField DataField="Valor_Suma" HeaderText="Saldo" DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>

                <asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
                <asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"  Visible = "false" />
			    <asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id"   Visible = "false"/>
			</Columns>
    </asp:GridView>
    <%----[X] GridView POA--%>
    
    <%----[O] FormView POA --%>
    <koala:FormViewSetim ID="fvPla_Poa" runat="server" DataSourceID="odsfvPla_Poa" 
            oniteminserting="fvPla_Poa_ItemInserting" 
            onitemdeleted="fvPla_Poa_ItemDeleted" 
            oniteminserted="fvPla_Poa_ItemInserted" 
            onitemupdated="fvPla_Poa_ItemUpdated"
			ondatabound="fvPla_Poa_DataBound" 
            onprerender="fvPla_Poa_PreRender"
			onitemupdating="fvPla_Poa_ItemUpdating" 
            onitemdeleting="fvPla_Poa_ItemDeleting"
            DataKeyNames="Id">
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit"  /></td>
            </tr>
			<tr style="display:none">
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  /></td>
            </tr>			
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
            <tr  style="display:none" >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  /></td>
            </tr>
			<tr >
                <td> Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_CodigoTextBox"
                    BehaviorID= "acxBIDPla_Partida_CodigoTextBox"
                    TargetControlID= "Pla_Partida_CodigoTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeCodigo_List"
                    UseContextKey="True" 
                    ContextKey=""
                    MinimumPrefixLength="0"
                    CompletionInterval="0"
                    OnClientItemSelected= "acxPla_Partida_CodigoTextBox_Click"
                    />
				</td>
            </tr>
			<tr >
                <td> Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_NombreTextBox"
                    BehaviorID= "acxBIDPla_Partida_NombreTextBox"
                    TargetControlID= "Pla_Partida_NombreTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey=""
                    MinimumPrefixLength="0"
                    CompletionInterval="0"
                    OnClientItemSelected= "acxPla_Partida_NombreTextBox_Click"
                    />
				</td>
            </tr>
            <tr >
                <td> Valor_Inicial </td>
                <td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial") %>'   CssClass="txtEdit"   />
                    <%--Validador--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Valor_InicialTextBox"
                    ErrorMessage="El campo Valor_Inicial es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                </td>
            </tr>
			<tr >
                <td> Saldo </td>
                <td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text='<%# Bind("Valor_Suma","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_Poa"/>
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
			<tr  style="display:none">
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit" />
				</td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Tarea_Id  </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_CodigoTextBox"
                    BehaviorID= "acxBIDPla_Partida_CodigoTextBox"
                    TargetControlID= "Pla_Partida_CodigoTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeCodigo_List"
                    UseContextKey="True" 
                    ContextKey=""
                    MinimumPrefixLength="0"
                    CompletionInterval="100"
                    OnClientItemSelected= "acxPla_Partida_CodigoTextBox_Click"
                    />
				</td>
            </tr>
			<tr >
                <td> Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_NombreTextBox"
                    BehaviorID= "acxBIDPla_Partida_NombreTextBox"
                    TargetControlID= "Pla_Partida_NombreTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey="" 
                    MinimumPrefixLength="0"
                    CompletionInterval="100"
                    OnClientItemSelected= "acxPla_Partida_NombreTextBox_Click"
                    />
                </td>
            </tr>
            <tr >
                <td> Valor_Inicial </td>
                <td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial") %>'   CssClass="txtEdit"  />
                <%--Validador--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Valor_InicialTextBox"
                    ErrorMessage="El campo Valor_Inicial es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Poa"/>
                </td>
            </tr>
			<tr >
                <td> Saldo </td>
                <td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text='<%# Bind("Valor_Suma","{0:N2}") %>' CssClass="txtItem" /></td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar"  ValidationGroup="vgPla_Poa"/>
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
			<tr style="display:none" >
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr  style="display:none" >
                <td> Pla_Tarea_Id </td>
                <td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
            <tr  style="display:none">
                <td> Tarea_Codigo </td>
                <td><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr  style="display:none" >
                <td> Pla_Partida_Id </td>
                <td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Partida_Codigo </td>
                <td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Partida_Nombre </td>
                <td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Valor_Inicial </td>
                <td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Saldo </td>
                <td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text='<%# Bind("Valor_Suma","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
    <asp:Label ID="lbFvMsgErrorPOA" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
    <asp:Label ID="lbFvMsgInfoPOA" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ValidationGroup="vgPla_Poa"/>
	<%----[X] FormView POA --%>

    </asp:Panel>
    <%--[X] FIN GridView y FormView del Detalle --%>

    <%--[O] GridView de Pla_Mov --%>
    <asp:Panel ID="Panel2" runat="server" GroupingText="Movimientos">
    <p class="pTextoPagina">
    <div>
    <b>Doc Tipos.</b>
    <table>
    <tr>
    <td>ASI</td><td>Asiento inicial del POA.</td>
    </tr>
    <tr>
    <td>CER</td><td>Certificados POA.</td>
    </tr>
    <tr>
    <td>REP</td><td>Reprogramación POA.</td>
    </tr>
    </table>
    </div>
    </p>
    <asp:GridView ID="gvPla_Mov" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Mov_GetByPla_Poa_Id" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" >
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   Visible = "false" />
			<asp:BoundField DataField="Pla_Poa_Id" HeaderText="Pla_Poa_Id"  Visible = "false"  />
			<asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"  Visible = "false"  />
			<asp:BoundField DataField="Pla_Doc_Codigo" HeaderText="Doc_Codigo"   />
            <asp:BoundField DataField="Pla_Doc_Fecha" HeaderText="Doc_Fecha"   DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Pla_Doc_Tipo" HeaderText="Doc_Tipo"   />
            <asp:BoundField DataField="Orden" HeaderText="Orden"   />
			<asp:BoundField DataField="Valor" HeaderText="Valor"    DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
			<asp:BoundField DataField="Tipo" HeaderText="Tipo"   />
		</Columns>
        
    </asp:GridView>
    <br />

    </asp:Panel>
	<%--[X] GridView de Pla_Mov --%>
</ContentTemplate>
</asp:UpdatePanel>

<%--INICIO Fuentes de datos de Pla_Tarea--%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Tarea" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByAnio" runat="server" 
        SelectMethod="GetByAnio" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByPla_Cta_Id" runat="server" 
        SelectMethod="GetByPla_Cta_Id" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Cta_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByPla_Cta_IdLikeNombre" runat="server" 
        SelectMethod="GetByPla_Cta_IdLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Cta_Id" PropertyName="Text" Type="Int32" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByAnioLikeNombre" runat="server" 
        SelectMethod="GetByAnioLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />			
		    <asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByAnioLikePla_Cta_Codigo" runat="server" 
        SelectMethod="GetByAnioLikePla_Cta_Codigo" 
        TypeName="FEL.PLA.BO_Pla_Tarea"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />			
		    <asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Cta_Codigo" PropertyName="Text" Type="string" />
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
            <asp:Parameter DefaultValue="Pla_Cta" Name="Objeto_Nombre" Type="String" />
            <asp:Parameter DefaultValue="Anio" Name="Campo_Nombre" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDominio" runat="server" 
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
    <asp:ObjectDataSource ID="odsfvPla_Tarea" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Tarea"
        DataObjectTypeName="Pla_Tarea"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Tarea_Inserted" 
        onupdated="odsfvPla_Tarea_Updated" 
		ondeleted="odsfvPla_Tarea_Deleted"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Tarea" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--FIN Fuentes de datos--%>

<%--Fuente de datos para los detalles--%>
    <asp:ObjectDataSource ID="odsgvPla_Poa_GetByPla_Tarea_Id" runat="server" 
        SelectMethod="GetByPla_Tarea_Id" 
        TypeName="FEL.PLA.BO_Pla_Poa" 
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="fvPla_Tarea" Name="p_Pla_Tarea_Id" 
                PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para el FormView POA --%>
    <asp:ObjectDataSource ID="odsfvPla_Poa" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete_Con_Pla_Mov_y_Pla_DocINT" 
        InsertMethod="Insert_Con_Pla_Mov_SaldoInicialINT" 
        UpdateMethod="Update_Con_Pla_Mov_SaldoInicialINT"
        TypeName="FEL.PLA.BO_Pla_Poa"
        DataObjectTypeName="Pla_Poa"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Poa_Inserted" 
        onupdated="odsfvPla_Poa_Updated" 
		ondeleted="odsfvPla_Poa_Deleted"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Poa" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <%--Fuente de datos para los Movimientos--%>
    <asp:ObjectDataSource ID="odsgvPla_Mov_GetByPla_Poa_Id" runat="server" 
        SelectMethod="GetByPla_Poa_Id" 
        TypeName="FEL.PLA.BO_Pla_Mov"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="fvPla_Poa" Name="p_Pla_Poa_Id" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
