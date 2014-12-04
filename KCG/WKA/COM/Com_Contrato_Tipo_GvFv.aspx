<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Com_Contrato_Tipo_GvFv.aspx.cs" 
Inherits="COM_Com_Contrato_Tipo_GvFv" %>

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

<%--Autocompletar del FormView de Com_Contrato_Tipo --%>
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

    <%--[O] Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <p class="pTextoPagina">
            Para filtrar los tipos de contratos por el nombre, ingrese las primeras letras en el campo [Criterio] y seleccione
            a continuación [Nombre] de la lista desplegable. Si cambia el criterio de búsqueda, solo debe pulsar el botón [Enter].
            Para volver a ver la lista completa, seleccione [Todos].
        </p>
        <asp:Label ID="lbFiltro" runat="server" Text="Criterio"></asp:Label>
        <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
            <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			<asp:ListItem Text = "Nombre" Value="Nombre" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Com_Contrato_Tipo --%>
    <asp:Panel runat="server" GroupingText="Lista de Tipos de Contratos y sus Plantillas Word">
        <p class="pTextoPagina">
            Seleccione un tipo de contrato de la siguiente lista pulsando el botón [...] de la izquierda.
        </p>
    <asp:GridView ID="gvCom_Contrato_Tipo" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_Tipo" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_Tipo_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" />
			<asp:BoundField DataField="URL_Plantilla_Word" HeaderText="URL_Plantilla_Word"   SortExpression="URL_Plantilla_Word" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Contrato_Tipo --%>

    <%--[O] FormView de Com_Contrato_Tipo --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_Tipo" GroupingText="Tipo de Contrato seleccionado">
        <p class="pTextoPagina">
            Para obtener una copia de uaa plantilla Word, primero seleccione un tipo de contrato de la lista 
            pulsando el botón [...] de la izquierda, y luego pulse en el botón [Descargar].
        </p>
    <koala:FormViewSetim ID="fvCom_Contrato_Tipo" runat="server" DataSourceID="odsfvCom_Contrato_Tipo" 
            oniteminserting="fvCom_Contrato_Tipo_ItemInserting" 
            onitemdeleted="fvCom_Contrato_Tipo_ItemDeleted" 
            oniteminserted="fvCom_Contrato_Tipo_ItemInserted" 
            onitemupdated="fvCom_Contrato_Tipo_ItemUpdated"
			ondatabound="fvCom_Contrato_Tipo_DataBound" 
            onprerender="fvCom_Contrato_Tipo_PreRender"
			onitemupdating="fvCom_Contrato_Tipo_ItemUpdating"
			onitemdeleting="fvCom_Contrato_Tipo_ItemDeleting"
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  Width="450px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Tipo"/>
					</td>
            </tr>
			<tr >
                <td> URL_Plantilla_Word </td>                
				<td>
                    <asp:TextBox ID="URL_Plantilla_WordTextBox" runat="server" Text='<%# Bind("URL_Plantilla_Word") %>'  ReadOnly="true"  CssClass="txtItem" Width="452px" />
                    <asp:FileUpload ID="fulSubirWord" runat="server"  />
				</td>

            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato_Tipo"/>
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  Width="450px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Tipo"/>
					</td>
            </tr>
			<tr >
                <td> URL_Plantilla_Word </td>                
				<td>
                    <asp:TextBox ID="URL_Plantilla_WordTextBox" runat="server" Text='<%# Bind("URL_Plantilla_Word") %>'  ReadOnly="true"  CssClass="txtItem" Width="452px" />
                    <asp:FileUpload ID="fulSubirWord" runat="server"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Contrato_Tipo"/>
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" Width="450px"  /></td>
							</tr>
			<tr >
                <td> URL_Plantilla_Word </td>
				<td>
                    <asp:TextBox ID="URL_Plantilla_WordTextBox" runat="server" Text='<%# Bind("URL_Plantilla_Word") %>'  ReadOnly="true"  CssClass="txtItem" Width="452px" />
                    <asp:Button ID="btDescargar" runat="server" Text="Descargar" onclick="btDescargar_Click" />
                </td>
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
        <asp:Label ID="lbFvMsgErrorCom_Contrato_Tipo" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato_Tipo" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Contrato_Tipo"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_Tipo --%>

    <asp:Panel runat="server" ID="pnProcesos" GroupingText="Procesos">
        <table>
        <tr>
        <td>
            <asp:Button runat="server" ID="btBuscarMarcas" Text ="Buscar Marcas" onclick="btBuscarMarcas_Click" />
        </td>
        <td>
            <p class="pTextoPagina">
                Analiza las marcas de la plantilla Word del contrato tipo seleccionado en la lista superior,
                y acontinuación las presenta en la lista inferior. Las marcas anteriores serán borradas.
                Las marcas deben tener el siguiente formato "m_xxxx_nn" como en: "m_ProyectoNombre_03".
                El sistema eliminará los tres últimos caracteres del nombre de la marca.
            </p>
        </td>
        </tr>
        </table>
    </asp:Panel>

    <%--[O] GridView de Com_Contrato_Tipo_Marca --%>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Marcas de la Plantilla Word">
        <p class="pTextoPagina">
            La siguiente lista de marcas pertenecen a la plantilla del contrato tipo seleccionado, y 
            se presentan con su correspondiente origen de datos. Una marca sin su correspondiente origen
            no será reemplazada en el proceso de generación del borrador del contrato.
        </p>
    <asp:GridView ID="gvCom_Contrato_Tipo_Marca" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_Tipo_Marca_GetByCom_Contrato_Tipo_Id" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_Tipo_Marca_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" />
			<asp:BoundField DataField="Com_Contrato_Tipo_Id" HeaderText="Com_Contrato_Tipo_Id"   SortExpression="Com_Contrato_Tipo_Id" Visible = "false" />
			<asp:BoundField DataField="Origen" HeaderText="Origen"   SortExpression="Origen" />
			<asp:BoundField DataField="Descripcion" HeaderText="Descripcion"   SortExpression="Descripcion" />
			<asp:BoundField DataField="Com_Contrato_Tipo_Nombre" HeaderText="Com_Contrato_Tipo_Nombre"   SortExpression="Com_Contrato_Tipo_Nombre" Visible = "false" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Contrato_Tipo_Marca --%>

    <%--[O] FormView de Com_Contrato_Tipo_Marca --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_Tipo_Marca" GroupingText="Marca seleccionada">
        <p class="pTextoPagina">
            Para asociar un origen a una marca, debe seleccionar primero la marca de la lista superior
            y luego elegir cuál es el tipo de información que se desea asignar. El sistema reemplazará 
            las marcas que posean un origen definido en este formulario.
        </p>
    <koala:FormViewSetim ID="fvCom_Contrato_Tipo_Marca" runat="server" DataSourceID="odsfvCom_Contrato_Tipo_Marca" 
            oniteminserting="fvCom_Contrato_Tipo_Marca_ItemInserting" 
            onitemdeleted="fvCom_Contrato_Tipo_Marca_ItemDeleted" 
            oniteminserted="fvCom_Contrato_Tipo_Marca_ItemInserted" 
            onitemupdated="fvCom_Contrato_Tipo_Marca_ItemUpdated"
			ondatabound="fvCom_Contrato_Tipo_Marca_DataBound" 
            onprerender="fvCom_Contrato_Tipo_Marca_PreRender"
			onitemupdating="fvCom_Contrato_Tipo_Marca_ItemUpdating"
			onitemdeleting="fvCom_Contrato_Tipo_Marca_ItemDeleting"
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombre"   />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Tipo_Marca"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Com_Contrato_Tipo_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_Tipo_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Id") %>' />
				</td>
            </tr>
			<tr >
                <td> Origen </td>                
				<td>
                    <asp:DropDownList ID="ddlCom_Contrato_Info_Campos" runat="server" 
                        DataSourceID="odsCom_Contrato_Info_Campos" DataTextField="Valor"  CssClass="txtEditNombre"
                        DataValueField="Valor" SelectedValue='<%# Bind("Origen") %>'>
                    </asp:DropDownList>
				    <asp:ObjectDataSource ID="odsCom_Contrato_Info_Campos" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetCampos" 
                        TypeName="FEL.VAR.BO_Com_Contrato_Info"></asp:ObjectDataSource>
				</td>
            </tr>
			<tr >
                <td> Descripcion </td>                
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Com_Contrato_Tipo_Nombre </td>                
				<td><asp:TextBox ID="Com_Contrato_Tipo_NombreTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Contrato_Tipo_Nombre" runat="server" 
                    ControlToValidate="Com_Contrato_Tipo_NombreTextBox"
                    ErrorMessage="El campo Com_Contrato_Tipo_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Tipo_Marca"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato_Tipo_Marca"/>
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="EditButton">
            <table>
			<tr style="display:none">
                <td> Id </td>
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Nombre </td>
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombre" /></td>
			</tr>
			<tr >
                <td> Origen </td>
				<td><asp:TextBox ID="OrigenTextBox" runat="server" Text='<%# Bind("Origen") %>'  ReadOnly="true"  CssClass="txtItemNombre" /></td>
			</tr>
			<tr >
                <td> Descripcion </td>
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine" /></td>
			</tr>			
            <tr style="display:none">
                <td> Com_Contrato_Tipo_Id </td>
				<td><asp:TextBox ID="Com_Contrato_Tipo_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr style="display:none">
                <td> Com_Contrato_Tipo_Nombre </td>
				<td><asp:TextBox ID="Com_Contrato_Tipo_NombreTextBox" runat="server" Text='<%# Bind("Com_Contrato_Tipo_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
			</table>
            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorCom_Contrato_Tipo_Marca" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato_Tipo_Marca" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgCom_Contrato_Tipo_Marca"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_Tipo_Marca --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Com_Contrato_Tipo --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Tipo">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato_Tipo">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo_GetByLikeNombre" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByLikeNombre" 
        TypeName="FEL.COM.BO_Com_Contrato_Tipo">
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
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvCom_Contrato_Tipo" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Tipo"
        DataObjectTypeName="Com_Contrato_Tipo"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_Tipo_Inserted" 
        onupdated="odsfvCom_Contrato_Tipo_Updated" 
		ondeleted="odsfvCom_Contrato_Tipo_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato_Tipo" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato_Tipo --%>

<%--[O]INICIO Fuentes de datos de Com_Contrato_Tipo_Marca --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo_Marca" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Tipo_Marca">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo_Marca_GetByCom_Contrato_Tipo_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByCom_Contrato_Tipo_Id" 
        TypeName="FEL.COM.BO_Com_Contrato_Tipo_Marca">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="gvCom_Contrato_Tipo" Name="p_Com_Contrato_Tipo_Id" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_Tipo_Marca_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato_Tipo_Marca">
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
    <asp:ObjectDataSource ID="odsfvCom_Contrato_Tipo_Marca" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_Tipo_Marca"
        DataObjectTypeName="Com_Contrato_Tipo_Marca"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_Tipo_Marca_Inserted" 
        onupdated="odsfvCom_Contrato_Tipo_Marca_Updated" 
		ondeleted="odsfvCom_Contrato_Tipo_Marca_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato_Tipo_Marca" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato_Tipo_Marca --%>

</asp:Content>
