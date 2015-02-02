<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Lote_GvFv.aspx.cs" 
Inherits="PLA_Pla_Lote_GvFv" %>

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

    <%--[O] GridView de Pla_Lote --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Lote" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Lote" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvPla_Lote_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   SortExpression="Codigo" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" />
			<asp:BoundField DataField="URL_Archivo_IN" HeaderText="URL_Archivo_IN"   SortExpression="URL_Archivo_IN" />
			<asp:BoundField DataField="Pla_Lote_Tipo_Id" HeaderText="Pla_Lote_Tipo_Id"   SortExpression="Pla_Lote_Tipo_Id" />
			<asp:BoundField DataField="Resultado" HeaderText="Resultado"   SortExpression="Resultado" />
			<asp:BoundField DataField="URL_Archivo_OUT" HeaderText="URL_Archivo_OUT"   SortExpression="URL_Archivo_OUT" />
			<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  SortExpression="Estado" />
			<asp:BoundField DataField="Lote_Fecha" HeaderText="Lote_Fecha"   SortExpression="Lote_Fecha" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Lote --%>

<%--Autocompletar del FormView de Pla_Lote --%>
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



    <%--[O] FormView de Pla_Lote --%>
    <asp:Panel runat="server" ID="pfvPla_Lote" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Lote" runat="server" DataSourceID="odsfvPla_Lote" 
            oniteminserting="fvPla_Lote_ItemInserting" 
            onitemdeleted="fvPla_Lote_ItemDeleted" 
            oniteminserted="fvPla_Lote_ItemInserted" 
            onitemupdated="fvPla_Lote_ItemUpdated"
			ondatabound="fvPla_Lote_DataBound" 
            onprerender="fvPla_Lote_PreRender"
			onitemupdating="fvPla_Lote_ItemUpdating"
			onitemdeleting="fvPla_Lote_ItemDeleting"
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> URL_Archivo_IN </td>                
				<td><asp:TextBox ID="URL_Archivo_INTextBox" runat="server" Text='<%# Bind("URL_Archivo_IN") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Archivo_IN" runat="server" 
                    ControlToValidate="URL_Archivo_INTextBox"
                    ErrorMessage="El campo URL_Archivo_IN es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Lote_Tipo_Id </td>                
				<td><asp:TextBox ID="Pla_Lote_Tipo_IdTextBox" runat="server" Text='<%# Bind("Pla_Lote_Tipo_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Resultado </td>                
				<td><asp:TextBox ID="ResultadoTextBox" runat="server" Text='<%# Bind("Resultado") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqResultado" runat="server" 
                    ControlToValidate="ResultadoTextBox"
                    ErrorMessage="El campo Resultado es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> URL_Archivo_OUT </td>                
				<td><asp:TextBox ID="URL_Archivo_OUTTextBox" runat="server" Text='<%# Bind("URL_Archivo_OUT") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Archivo_OUT" runat="server" 
                    ControlToValidate="URL_Archivo_OUTTextBox"
                    ErrorMessage="El campo URL_Archivo_OUT es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Lote_Estado"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Lote_Fecha </td>                
				<td><asp:TextBox ID="Lote_FechaTextBox" runat="server" Text='<%# Bind("Lote_Fecha") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqLote_Fecha" runat="server" 
                    ControlToValidate="Lote_FechaTextBox"
                    ErrorMessage="El campo Lote_Fecha es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_Lote"/>
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> URL_Archivo_IN </td>                
				<td><asp:TextBox ID="URL_Archivo_INTextBox" runat="server" Text='<%# Bind("URL_Archivo_IN") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Archivo_IN" runat="server" 
                    ControlToValidate="URL_Archivo_INTextBox"
                    ErrorMessage="El campo URL_Archivo_IN es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Lote_Tipo_Id </td>                
				<td><asp:TextBox ID="Pla_Lote_Tipo_IdTextBox" runat="server" Text='<%# Bind("Pla_Lote_Tipo_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Resultado </td>                
				<td><asp:TextBox ID="ResultadoTextBox" runat="server" Text='<%# Bind("Resultado") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqResultado" runat="server" 
                    ControlToValidate="ResultadoTextBox"
                    ErrorMessage="El campo Resultado es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr >
                <td> URL_Archivo_OUT </td>                
				<td><asp:TextBox ID="URL_Archivo_OUTTextBox" runat="server" Text='<%# Bind("URL_Archivo_OUT") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqURL_Archivo_OUT" runat="server" 
                    ControlToValidate="URL_Archivo_OUTTextBox"
                    ErrorMessage="El campo URL_Archivo_OUT es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Lote_Estado"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Lote_Fecha </td>                
				<td><asp:TextBox ID="Lote_FechaTextBox" runat="server" Text='<%# Bind("Lote_Fecha") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqLote_Fecha" runat="server" 
                    ControlToValidate="Lote_FechaTextBox"
                    ErrorMessage="El campo Lote_Fecha es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Lote"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgPla_Lote"/>
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
                <td> Nombre </td>
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" /></td>
							</tr>
			<tr >
                <td> URL_Archivo_IN </td>
				<td><asp:TextBox ID="URL_Archivo_INTextBox" runat="server" Text='<%# Bind("URL_Archivo_IN") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Lote_Tipo_Id </td>
				<td><asp:TextBox ID="Pla_Lote_Tipo_IdTextBox" runat="server" Text='<%# Bind("Pla_Lote_Tipo_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Resultado </td>
				<td><asp:TextBox ID="ResultadoTextBox" runat="server" Text='<%# Bind("Resultado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> URL_Archivo_OUT </td>
				<td><asp:TextBox ID="URL_Archivo_OUTTextBox" runat="server" Text='<%# Bind("URL_Archivo_OUT") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Lote_Estado"  Enabled="false" CssClass="txtItemDDL" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
							</tr>
			<tr >
                <td> Lote_Fecha </td>
				<td><asp:TextBox ID="Lote_FechaTextBox" runat="server" Text='<%# Bind("Lote_Fecha") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorPla_Lote" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Lote" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Lote"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Lote --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_Lote --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Lote" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.PLA.BO_Pla_Lote">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Lote_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Lote">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Lote_GetByPla_Lote_Tipo_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByPla_Lote_Tipo_Id" 
        TypeName="FEL.PLA.BO_Pla_Lote">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Lote_Tipo_Id" PropertyName="Text" Type="Int32" />
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
	<%--Objetos de Datos para obtener los dominios del campo Estado de la tabla Pla_Lote --%>
    <asp:ObjectDataSource ID="odsDominio_Pla_Lote_Estado" runat="server" 
        SortParameterName = "sortExpression" 
        SelectMethod="GetByObjetoCampo" 
        TypeName="FEL.DIC.BO_Dic_Dominio"
        EnableCaching="true"
        CacheDuration="60"
        CacheExpirationPolicy="Sliding"
        >
        <SelectParameters>
            <asp:Parameter DefaultValue="Nombre" Name="sortExpression" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Type="String" Name="Objeto_Nombre" DefaultValue="Pla_Lote"  />
            <asp:Parameter Type="String" Name="Campo_Nombre"  DefaultValue="Estado"               />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Lote" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.PLA.BO_Pla_Lote"
        DataObjectTypeName="Pla_Lote"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Lote_Inserted" 
        onupdated="odsfvPla_Lote_Updated" 
		ondeleted="odsfvPla_Lote_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Lote" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_Lote --%>
</asp:Content>
