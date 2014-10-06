﻿<%@ Page Title="" Language="C#" 
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
<asp:UpdatePanel runat="server" ID="udpGridView">
<ContentTemplate>

    <%--Cabecera--%>
    <asp:Panel runat="server" ID="pcabecera" GroupingText="Cabecera">
        <asp:Label ID="lbCabecera" runat="server" Text="Seleccionar el año:"></asp:Label>
        <asp:DropDownList ID="ddlCabecera" runat="server" AutoPostBack="True" >
        </asp:DropDownList>        
    </asp:Panel>

    <%--Filtro--%>
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

    <%--GridView--%>
    <asp:Panel runat="server" GroupingText="Listado de Tareas">
    <asp:GridView ID="gvPla_Tarea" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Tarea_GetByAnio" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Tarea_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />			
			<asp:BoundField DataField="Pla_Cta_Id" HeaderText="Pla_Cta_Id" Visible = "false"    />
			<asp:BoundField DataField="Pla_Cta_Codigo" HeaderText="Cuenta"   />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Pla_Cta_Nombre" HeaderText="Pla_Cta_Nombre" Visible = "false"    />
			<asp:BoundField DataField="Pla_Cta_Nivel" HeaderText="Pla_Cta_Nivel"  Visible = "false" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   />
			<asp:BoundField DataField="Fecha_Ini" HeaderText="Fecha_Ini"  DataFormatString="{0:d}" />
			<asp:BoundField DataField="Fecha_Fin" HeaderText="Fecha_Fin"  DataFormatString="{0:d}" />
			<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
			</Columns>
    </asp:GridView>
    </asp:Panel>

    <%--FormView Tarea --%>
    <asp:Panel runat="server" ID="pfvPla_Tarea" GroupingText="Crear, Editar o Borar Tareas" CssClass="panCol2">
    <koala:FormViewSetim ID="fvPla_Tarea" runat="server" DataSourceID="odsfvPla_Tarea" 
            oniteminserting="fvPla_Tarea_ItemInserting" 
            onitemdeleted="fvPla_Tarea_ItemDeleted" 
            oniteminserted="fvPla_Tarea_ItemInserted" 
            onitemupdated="fvPla_Tarea_ItemUpdated"
			ondatabound="fvPla_Tarea_DataBound" 
            onprerender="fvPla_Tarea_PreRender" 
            onitemupdating="fvPla_Tarea_ItemUpdating" 
            onitemdeleting="fvPla_Tarea_ItemDeleting" DataKeyNames="Id">
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
                <td> Pla_Cta_Nivel </td>
                <td><asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nivel") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nivel" runat="server" 
                    ControlToValidate="Pla_Cta_NivelTextBox"
                    ErrorMessage="El campo Pla_Cta_Nivel es obligatorio" 
                    Text="X" Display="Dynamic"/>
				</td>
            </tr>
			<tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
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
                    ErrorMessage="El campo Fecha_Ini es obligatorio" 
                    Text="X" Display="Dynamic"/>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="El campo Fecha_Ini no contiene una fecha válida" 
                        ControlToValidate="Fecha_IniTextBox" 
                        Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" />
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
                    Text="X" Display="Dynamic"/>
                    <asp:RangeValidator ID="rvFecha_Fin" runat="server" 
                    ErrorMessage="El campo Fecha_Fin no contiene una fecha válida" 
                    ControlToValidate="Fecha_FinTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
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
                <td> Pla_Cta_Nivel </td>
                <td><asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nivel") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nivel" runat="server" 
                    ControlToValidate="Pla_Cta_NivelTextBox"
                    ErrorMessage="El campo Pla_Cta_Nivel es obligatorio" 
                    Text="X" Display="Dynamic"/>
				</td>
            </tr>
			<tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>
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
                    Text="X" Display="Dynamic"/>
					<asp:RangeValidator ID="rvFecha_Ini" runat="server" 
                    ErrorMessage="El campo Fecha_Ini no contiene una fecha válida" 
                    ControlToValidate="Fecha_IniTextBox"                    
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" />
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
                    Text="X" Display="Dynamic"/>
					<asp:RangeValidator ID="rvFecha_Fin" runat="server" 
                    ErrorMessage="El campo Fecha_Fin no contiene una fecha válida" 
                    ControlToValidate="Fecha_FinTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
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
                <td> Pla_Cta_Nivel </td>
                <td><asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nivel") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgError" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfo" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server"/>
    </asp:Panel>

    <%--[O] INICIO GridView y FormView del Detalle POA --%>    
    <asp:Panel ID="Panel1" runat="server" GroupingText="POA"  CssClass="panCol2">
    
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
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />			
			<asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"  Visible = "false" />
			<asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id"   Visible = "false"/>
			<asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Partida_Codigo"   />
			<asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Partida_Nombre"   />
			<asp:BoundField DataField="Valor_Inicial" HeaderText="Valor_Inicial" DataFormatString="{0:N2}" />
			<asp:BoundField DataField="Valor_Suma" HeaderText="Valor_Suma" DataFormatString="{0:N2}" />
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
            onitemdeleting="fvPla_Poa_ItemDeleting">
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
			<tr >
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  /></td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" />
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
			<tr  style="display:none">
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit" />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id  </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
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
			<tr style="display:none" >
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr  style="display:none" >
                <td> Pla_Tarea_Id </td>
                <td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
    <asp:Label ID="Label1" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
	<%----[X] FormView POA --%>

    </asp:Panel>
    <%--[X] FIN GridView y FormView del Detalle --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--INICIO Fuentes de datos--%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Tarea" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByAnio" runat="server" 
        SelectMethod="GetByAnio" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByPla_Cta_Id" runat="server" 
        SelectMethod="GetByPla_Cta_Id" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Cta_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByPla_Cta_IdLikeNombre" runat="server" 
        SelectMethod="GetByPla_Cta_IdLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Cta_Id" PropertyName="Text" Type="Int32" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Tarea_GetByAnioLikeNombre" runat="server" 
        SelectMethod="GetByAnioLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Tarea">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />			
		    <asp:ControlParameter ControlID="ddlCabecera" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para obtener los dominios de un campo en un objeto --%>
    <asp:ObjectDataSource ID="odsDominioAnio" runat="server" 
        SelectMethod="GetByObjetoCampo" 
        TypeName="FEL.DIC.BO_Dic_Dominio">
        <SelectParameters>
            <asp:Parameter DefaultValue="Nombre" Name="sortExpression" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter DefaultValue="Pla_Cta" Name="Objeto_Nombre" Type="String" />
            <asp:Parameter DefaultValue="Anio" Name="Campo_Nombre" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDominio" runat="server" 
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
		ondeleted="odsfvPla_Tarea_Deleted">
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
        TypeName="FEL.PLA.BO_Pla_Poa" >
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="fvPla_Tarea" Name="p_Pla_Tarea_Id" 
                PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para el FormView POA --%>
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
</asp:Content>
