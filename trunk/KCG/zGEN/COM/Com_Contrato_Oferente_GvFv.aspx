<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Com_Contrato_Oferente_GvFv.aspx.cs" 
Inherits="COM_Com_Contrato_Oferente_GvFv" %>

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

    <%--[O] GridView de Com_Contrato_Oferente --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Contrato_Oferente" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_Oferente" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_Oferente_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" />
			<asp:BoundField DataField="Fecha_Recepcion" HeaderText="Fecha_Recepcion"   DataFormatString="{0:d}" SortExpression="Fecha_Recepcion" />
				<asp:BoundField DataField="Com_Contrato_Id" HeaderText="Com_Contrato_Id"   SortExpression="Com_Contrato_Id" />
			<asp:BoundField DataField="Per_Personal_Id_Recibe" HeaderText="Per_Personal_Id_Recibe"   SortExpression="Per_Personal_Id_Recibe" />
			<asp:BoundField DataField="Comentario" HeaderText="Comentario"   SortExpression="Comentario" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Contrato_Oferente --%>

<%--Autocompletar del FormView de Com_Contrato_Oferente --%>
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



    <%--[O] FormView de Com_Contrato_Oferente --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_Oferente" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvCom_Contrato_Oferente" runat="server" DataSourceID="odsfvCom_Contrato_Oferente" 
            oniteminserting="fvCom_Contrato_Oferente_ItemInserting" 
            onitemdeleted="fvCom_Contrato_Oferente_ItemDeleted" 
            oniteminserted="fvCom_Contrato_Oferente_ItemInserted" 
            onitemupdated="fvCom_Contrato_Oferente_ItemUpdated"
			ondatabound="fvCom_Contrato_Oferente_DataBound" 
            onprerender="fvCom_Contrato_Oferente_PreRender"
			onitemupdating="fvCom_Contrato_Oferente_ItemUpdating"
			onitemdeleting="fvCom_Contrato_Oferente_ItemDeleting"
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
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Recepcion </td>                
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Recepcion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Recepcion" TargetControlID="Fecha_RecepcionTextBox" PopupButtonID="btcexFecha_Recepcion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Recepcion" runat="server" 
                    ControlToValidate="Fecha_RecepcionTextBox"
                    ErrorMessage="El campo Fecha_Recepcion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					<asp:RangeValidator ID="rvFecha_Recepcion" runat="server" 
                    ErrorMessage="El campo Fecha_Recepcion no contiene una fecha válida" 
                    ControlToValidate="Fecha_RecepcionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Oferente"/>
				</td>
            </tr>
			<tr >
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Recibe </td>                
				<td><asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Recibe" runat="server" 
                    ControlToValidate="Per_Personal_Id_RecibeTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Recibe es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Comentario </td>                
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComentario" runat="server" 
                    ControlToValidate="ComentarioTextBox"
                    ErrorMessage="El campo Comentario es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato_Oferente"/>
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
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Recepcion </td>                
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Recepcion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Recepcion" TargetControlID="Fecha_RecepcionTextBox" PopupButtonID="btcexFecha_Recepcion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Recepcion" runat="server" 
                    ControlToValidate="Fecha_RecepcionTextBox"
                    ErrorMessage="El campo Fecha_Recepcion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					<asp:RangeValidator ID="rvFecha_Recepcion" runat="server" 
                    ErrorMessage="El campo Fecha_Recepcion no contiene una fecha válida" 
                    ControlToValidate="Fecha_RecepcionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato_Oferente"/>
				</td>
            </tr>
			<tr >
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Recibe </td>                
				<td><asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Recibe" runat="server" 
                    ControlToValidate="Per_Personal_Id_RecibeTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Recibe es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Comentario </td>                
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqComentario" runat="server" 
                    ControlToValidate="ComentarioTextBox"
                    ErrorMessage="El campo Comentario es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Contrato_Oferente"/>
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
                <td> Nombre </td>
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" /></td>
							</tr>
			<tr >
                <td> Fecha_Recepcion </td>
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Com_Contrato_Id </td>
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Recibe </td>
				<td><asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Comentario </td>
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorCom_Contrato_Oferente" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato_Oferente" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Contrato_Oferente"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_Oferente --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Com_Contrato_Oferente --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Oferente" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Oferente">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Oferente_GetByCom_Contrato_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByCom_Contrato_Id" 
        TypeName="FEL.COM.BO_Com_Contrato_Oferente">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Com_Contrato_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Oferente_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato_Oferente">
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
    <asp:ObjectDataSource ID="odsfvCom_Contrato_Oferente" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Oferente"
        DataObjectTypeName="Com_Contrato_Oferente"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_Oferente_Inserted" 
        onupdated="odsfvCom_Contrato_Oferente_Updated" 
		ondeleted="odsfvCom_Contrato_Oferente_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato_Oferente" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato_Oferente --%>
</asp:Content>
