<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Poa_GvFv.aspx.cs" 
Inherits="PLA_Pla_Poa_GvFv" %>

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

    <%--[O] GridView--%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Poa" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Poa" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Poa_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"   />
			<asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id"   />
			<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
			<asp:BoundField DataField="Pla_Tarea_Codigo" HeaderText="Pla_Tarea_Codigo"   />
			<asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Pla_Tarea_Nombre"   />
			<asp:BoundField DataField="Pla_Cta_Id" HeaderText="Pla_Cta_Id"   />
			<asp:BoundField DataField="Pla_Cta_Codigo" HeaderText="Pla_Cta_Codigo"   />
			<asp:BoundField DataField="Pla_Cta_Nombre" HeaderText="Pla_Cta_Nombre"   />
			<asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Pla_Partida_Codigo"   />
			<asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Pla_Partida_Nombre"   />
			<asp:BoundField DataField="Valor_Inicial" HeaderText="Valor_Inicial"    DataFormatString="{0:N2}"/>
				<asp:BoundField DataField="Valor_Suma" HeaderText="Valor_Suma"    DataFormatString="{0:N2}"/>
				</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView--%>

    <%--[O] FormView--%>
    <asp:Panel runat="server" ID="pfvPla_Poa" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Poa" runat="server" DataSourceID="odsfvPla_Poa" 
            oniteminserting="fvPla_Poa_ItemInserting" 
            onitemdeleted="fvPla_Poa_ItemDeleted" 
            oniteminserted="fvPla_Poa_ItemInserted" 
            onitemupdated="fvPla_Poa_ItemUpdated"
			ondatabound="fvPla_Poa_DataBound" 
            onprerender="fvPla_Poa_PreRender"
			onitemupdating="fvPla_Poa_ItemUpdating">
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
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Id" runat="server" 
                    ControlToValidate="Pla_Tarea_IdTextBox"
                    ErrorMessage="El campo Pla_Tarea_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Id" runat="server" 
                    ControlToValidate="Pla_Partida_IdTextBox"
                    ErrorMessage="El campo Pla_Partida_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Id </td>                
				<td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Id" runat="server" 
                    ControlToValidate="Pla_Cta_IdTextBox"
                    ErrorMessage="El campo Pla_Cta_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Codigo </td>                
				<td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Nombre </td>                
				<td><asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Inicial </td>                
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Inicial" runat="server" 
                    ControlToValidate="Valor_InicialTextBox"
                    ErrorMessage="El campo Valor_Inicial es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma </td>                
				<td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text='<%# Bind("Valor_Suma","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma" runat="server" 
                    ControlToValidate="Valor_SumaTextBox"
                    ErrorMessage="El campo Valor_Suma es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
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
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Id" runat="server" 
                    ControlToValidate="Pla_Tarea_IdTextBox"
                    ErrorMessage="El campo Pla_Tarea_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Id" runat="server" 
                    ControlToValidate="Pla_Partida_IdTextBox"
                    ErrorMessage="El campo Pla_Partida_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Id </td>                
				<td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Id" runat="server" 
                    ControlToValidate="Pla_Cta_IdTextBox"
                    ErrorMessage="El campo Pla_Cta_Id es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Codigo </td>                
				<td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Nombre </td>                
				<td><asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Partida_Nombre </td>                
				<td><asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Inicial </td>                
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Inicial" runat="server" 
                    ControlToValidate="Valor_InicialTextBox"
                    ErrorMessage="El campo Valor_Inicial es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma </td>                
				<td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text='<%# Bind("Valor_Suma","0:N2") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma" runat="server" 
                    ControlToValidate="Valor_SumaTextBox"
                    ErrorMessage="El campo Valor_Suma es obligatorio" 
                    Text="X" Display="Dynamic"/>
					</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
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
                <td> Pla_Tarea_Id </td>
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Partida_Id </td>
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
                <td> Pla_Cta_Id </td>
				<td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Cta_Codigo </td>
				<td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Cta_Nombre </td>
				<td><asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
                <td> Valor_Inicial </td>
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text='<%# Bind("Valor_Inicial","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Suma </td>
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
        <asp:Label ID="lbFvMsgError" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfo" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server"/>
    </asp:Panel>
	<%--[X] FormView--%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos--%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Poa" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Poa">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Poa_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Poa">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Poa_GetByPla_Partida_Id" runat="server" 
        SelectMethod="GetByPla_Partida_Id" 
        TypeName="FEL.PLA.BO_Pla_Poa">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Partida_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Poa_GetByPla_Tarea_Id" runat="server" 
        SelectMethod="GetByPla_Tarea_Id" 
        TypeName="FEL.PLA.BO_Pla_Poa">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Tarea_Id" PropertyName="Text" Type="Int32" />
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
    <asp:ObjectDataSource ID="odsfvPla_Poa" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Poa"
        DataObjectTypeName="Pla_Poa"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Poa_Inserted" 
        onupdated="odsfvPla_Poa_Updated" 
		ondeleted="odsfvPla_Poa_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Poa" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos--%>
</asp:Content>
