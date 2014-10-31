<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_PersonalDatos_GvFv.aspx.cs" 
Inherits="PLA_Pla_PersonalDatos_GvFv" %>

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
			<asp:ListItem Text = "Per_Personal_Nombre" Value="Per_Personal_Nombre" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Pla_PersonalDatos --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_PersonalDatos" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_PersonalDatos" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_PersonalDatos_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Per_Personal_Id" HeaderText="Per_Personal_Id"   />
			<asp:BoundField DataField="Pie_Firma_Nombre" HeaderText="Pie_Firma_Nombre"   />
			<asp:BoundField DataField="Pie_Firma_Cargo" HeaderText="Pie_Firma_Cargo"   />
			<asp:BoundField DataField="Email_Inst" HeaderText="Email_Inst"   />
			<asp:BoundField DataField="Per_Personal_Nombre" HeaderText="Per_Personal_Nombre"   />
			<asp:BoundField DataField="Per_Personal_NumeroDoc" HeaderText="Per_Personal_NumeroDoc"   />
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_PersonalDatos --%>

<%--Autocompletar del FormView de Pla_PersonalDatos --%>
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



    <%--[O] FormView de Pla_PersonalDatos --%>
    <asp:Panel runat="server" ID="pfvPla_PersonalDatos" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_PersonalDatos" runat="server" DataSourceID="odsfvPla_PersonalDatos" 
            oniteminserting="fvPla_PersonalDatos_ItemInserting" 
            onitemdeleted="fvPla_PersonalDatos_ItemDeleted" 
            oniteminserted="fvPla_PersonalDatos_ItemInserted" 
            onitemupdated="fvPla_PersonalDatos_ItemUpdated"
			ondatabound="fvPla_PersonalDatos_DataBound" 
            onprerender="fvPla_PersonalDatos_PreRender"
			onitemupdating="fvPla_PersonalDatos_ItemUpdating"
			onitemdeleting="fvPla_PersonalDatos_ItemDeleting"
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
                <td> Per_Personal_Id </td>                
				<td><asp:TextBox ID="Per_Personal_IdTextBox" runat="server" Text='<%# Bind("Per_Personal_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id" runat="server" 
                    ControlToValidate="Per_Personal_IdTextBox"
                    ErrorMessage="El campo Per_Personal_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Pie_Firma_Nombre </td>                
				<td><asp:TextBox ID="Pie_Firma_NombreTextBox" runat="server" Text='<%# Bind("Pie_Firma_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPie_Firma_Nombre" runat="server" 
                    ControlToValidate="Pie_Firma_NombreTextBox"
                    ErrorMessage="El campo Pie_Firma_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Pie_Firma_Cargo </td>                
				<td><asp:TextBox ID="Pie_Firma_CargoTextBox" runat="server" Text='<%# Bind("Pie_Firma_Cargo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPie_Firma_Cargo" runat="server" 
                    ControlToValidate="Pie_Firma_CargoTextBox"
                    ErrorMessage="El campo Pie_Firma_Cargo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Email_Inst </td>                
				<td><asp:TextBox ID="Email_InstTextBox" runat="server" Text='<%# Bind("Email_Inst") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEmail_Inst" runat="server" 
                    ControlToValidate="Email_InstTextBox"
                    ErrorMessage="El campo Email_Inst es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre </td>                
				<td><asp:TextBox ID="Per_Personal_NombreTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre" runat="server" 
                    ControlToValidate="Per_Personal_NombreTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_NumeroDoc </td>                
				<td><asp:TextBox ID="Per_Personal_NumeroDocTextBox" runat="server" Text='<%# Bind("Per_Personal_NumeroDoc") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_NumeroDoc" runat="server" 
                    ControlToValidate="Per_Personal_NumeroDocTextBox"
                    ErrorMessage="El campo Per_Personal_NumeroDoc es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgPla_PersonalDatos"/>
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
                <td> Per_Personal_Id </td>                
				<td><asp:TextBox ID="Per_Personal_IdTextBox" runat="server" Text='<%# Bind("Per_Personal_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id" runat="server" 
                    ControlToValidate="Per_Personal_IdTextBox"
                    ErrorMessage="El campo Per_Personal_Id es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Pie_Firma_Nombre </td>                
				<td><asp:TextBox ID="Pie_Firma_NombreTextBox" runat="server" Text='<%# Bind("Pie_Firma_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPie_Firma_Nombre" runat="server" 
                    ControlToValidate="Pie_Firma_NombreTextBox"
                    ErrorMessage="El campo Pie_Firma_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Pie_Firma_Cargo </td>                
				<td><asp:TextBox ID="Pie_Firma_CargoTextBox" runat="server" Text='<%# Bind("Pie_Firma_Cargo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPie_Firma_Cargo" runat="server" 
                    ControlToValidate="Pie_Firma_CargoTextBox"
                    ErrorMessage="El campo Pie_Firma_Cargo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Email_Inst </td>                
				<td><asp:TextBox ID="Email_InstTextBox" runat="server" Text='<%# Bind("Email_Inst") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEmail_Inst" runat="server" 
                    ControlToValidate="Email_InstTextBox"
                    ErrorMessage="El campo Email_Inst es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre </td>                
				<td><asp:TextBox ID="Per_Personal_NombreTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre" runat="server" 
                    ControlToValidate="Per_Personal_NombreTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_NumeroDoc </td>                
				<td><asp:TextBox ID="Per_Personal_NumeroDocTextBox" runat="server" Text='<%# Bind("Per_Personal_NumeroDoc") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_NumeroDoc" runat="server" 
                    ControlToValidate="Per_Personal_NumeroDocTextBox"
                    ErrorMessage="El campo Per_Personal_NumeroDoc es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_PersonalDatos"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgPla_PersonalDatos"/>
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
                <td> Per_Personal_Id </td>
				<td><asp:TextBox ID="Per_Personal_IdTextBox" runat="server" Text='<%# Bind("Per_Personal_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pie_Firma_Nombre </td>
				<td><asp:TextBox ID="Pie_Firma_NombreTextBox" runat="server" Text='<%# Bind("Pie_Firma_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pie_Firma_Cargo </td>
				<td><asp:TextBox ID="Pie_Firma_CargoTextBox" runat="server" Text='<%# Bind("Pie_Firma_Cargo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Email_Inst </td>
				<td><asp:TextBox ID="Email_InstTextBox" runat="server" Text='<%# Bind("Email_Inst") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre </td>
				<td><asp:TextBox ID="Per_Personal_NombreTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_NumeroDoc </td>
				<td><asp:TextBox ID="Per_Personal_NumeroDocTextBox" runat="server" Text='<%# Bind("Per_Personal_NumeroDoc") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorPla_PersonalDatos" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_PersonalDatos" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_PersonalDatos"/>
    </asp:Panel>
	<%--[X] FormView de Pla_PersonalDatos --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_PersonalDatos --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_PersonalDatos" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_PersonalDatos"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_PersonalDatos_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_PersonalDatos"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_PersonalDatos_GetByLikePer_Personal_Nombre" runat="server" 
        SelectMethod="GetByLikePer_Personal_Nombre" 
        TypeName="FEL.PLA.BO_Pla_PersonalDatos"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Per_Personal_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_PersonalDatos_GetByPer_Personal_Id" runat="server" 
        SelectMethod="GetByPer_Personal_Id" 
        TypeName="FEL.PLA.BO_Pla_PersonalDatos"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Per_Personal_Id" PropertyName="Text" Type="string" />
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
    <asp:ObjectDataSource ID="odsfvPla_PersonalDatos" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_PersonalDatos"
        DataObjectTypeName="Pla_PersonalDatos"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_PersonalDatos_Inserted" 
        onupdated="odsfvPla_PersonalDatos_Updated" 
		ondeleted="odsfvPla_PersonalDatos_Deleted"
                        SortParameterName = "sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_PersonalDatos" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_PersonalDatos --%>
</asp:Content>
