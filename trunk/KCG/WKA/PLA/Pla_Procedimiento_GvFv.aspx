<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Procedimiento_GvFv.aspx.cs" 
Inherits="PLA_Pla_Procedimiento_GvFv" %>

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
	$('#ctl00_ContentPlaceHolder1_fvPla_Procedimiento_Valor_MinTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	$('#ctl00_ContentPlaceHolder1_fvPla_Procedimiento_Valor_MaxTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
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
			<asp:ListItem Text = "Nombre" Value="Nombre" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Pla_Procedimiento --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Procedimiento" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Procedimiento" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvPla_Procedimiento_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" />
			<asp:BoundField DataField="Tipo" HeaderText="Tipo"   SortExpression="Tipo" />
			<asp:BoundField DataField="Valor_Min" HeaderText="Valor_Min"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Valor_Max" HeaderText="Valor_Max"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Procedimiento --%>

<%--Autocompletar del FormView de Pla_Procedimiento --%>
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



    <%--[O] FormView de Pla_Procedimiento --%>
    <asp:Panel runat="server" ID="pfvPla_Procedimiento" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Procedimiento" runat="server" DataSourceID="odsfvPla_Procedimiento" 
            oniteminserting="fvPla_Procedimiento_ItemInserting" 
            onitemdeleted="fvPla_Procedimiento_ItemDeleted" 
            oniteminserted="fvPla_Procedimiento_ItemInserted" 
            onitemupdated="fvPla_Procedimiento_ItemUpdated"
			ondatabound="fvPla_Procedimiento_DataBound" 
            onprerender="fvPla_Procedimiento_PreRender"
			onitemupdating="fvPla_Procedimiento_ItemUpdating"
			onitemdeleting="fvPla_Procedimiento_ItemDeleting"
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			<tr >
                <td> Tipo </td>                
				<td>
				<asp:DropDownList ID="TipoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Procedimiento_Tipo"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Tipo") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Valor_Min </td>                
				<td><asp:TextBox ID="Valor_MinTextBox" runat="server" Text='<%# Bind("Valor_Min") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Min" runat="server" 
                    ControlToValidate="Valor_MinTextBox"
                    ErrorMessage="El campo Valor_Min es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Max </td>                
				<td><asp:TextBox ID="Valor_MaxTextBox" runat="server" Text='<%# Bind("Valor_Max") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Max" runat="server" 
                    ControlToValidate="Valor_MaxTextBox"
                    ErrorMessage="El campo Valor_Max es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_Procedimiento"/>
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
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			<tr >
                <td> Tipo </td>                
				<td>
				<asp:DropDownList ID="TipoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Procedimiento_Tipo"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Tipo") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Valor_Min </td>                
				<td><asp:TextBox ID="Valor_MinTextBox" runat="server" Text='<%# Bind("Valor_Min") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Min" runat="server" 
                    ControlToValidate="Valor_MinTextBox"
                    ErrorMessage="El campo Valor_Min es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Max </td>                
				<td><asp:TextBox ID="Valor_MaxTextBox" runat="server" Text='<%# Bind("Valor_Max") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Max" runat="server" 
                    ControlToValidate="Valor_MaxTextBox"
                    ErrorMessage="El campo Valor_Max es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Procedimiento"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgPla_Procedimiento"/>
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
                <td> Tipo </td>
				<td>
				<asp:DropDownList ID="TipoDropDownList" runat="server" DataSourceID="odsDominio_Pla_Procedimiento_Tipo"  Enabled="false" CssClass="txtItemDDL" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Tipo") %>'>
                </asp:DropDownList>
							</tr>
			<tr >
                <td> Valor_Min </td>
				<td><asp:TextBox ID="Valor_MinTextBox" runat="server" Text='<%# Bind("Valor_Min") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Valor_Max </td>
				<td><asp:TextBox ID="Valor_MaxTextBox" runat="server" Text='<%# Bind("Valor_Max") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
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
        <asp:Label ID="lbFvMsgErrorPla_Procedimiento" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Procedimiento" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Procedimiento"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Procedimiento --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_Procedimiento --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Procedimiento" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.PLA.BO_Pla_Procedimiento">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Procedimiento_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Procedimiento">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Procedimiento_GetByLikeNombre" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Procedimiento">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
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
	<%--Objetos de Datos para obtener los dominios del campo Tipo de la tabla Pla_Procedimiento --%>
    <asp:ObjectDataSource ID="odsDominio_Pla_Procedimiento_Tipo" runat="server" 
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
            <asp:Parameter Type="String" Name="Objeto_Nombre" DefaultValue="Pla_Procedimiento"  />
            <asp:Parameter Type="String" Name="Campo_Nombre"  DefaultValue="Tipo"               />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Procedimiento" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.PLA.BO_Pla_Procedimiento"
        DataObjectTypeName="Pla_Procedimiento"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Procedimiento_Inserted" 
        onupdated="odsfvPla_Procedimiento_Updated" 
		ondeleted="odsfvPla_Procedimiento_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Procedimiento" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_Procedimiento --%>
</asp:Content>
