<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Com_Contrato_GvFv.aspx.cs" 
Inherits="COM_Com_Contrato_GvFv" %>

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
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Valor_ContratoTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Valor_Suma_MovsTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
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
			<asp:ListItem Text = "Pla_Tarea_Nombre" Value="Pla_Tarea_Nombre" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Com_Contrato --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Contrato" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"   SortExpression="Pla_Doc_Id" />
			<asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  SortExpression="Estado" />
			<asp:BoundField DataField="Com_Procedimiento_Id" HeaderText="Com_Procedimiento_Id"   SortExpression="Com_Procedimiento_Id" />
			<asp:BoundField DataField="Porcentaje_Anticipo_Ref" HeaderText="Porcentaje_Anticipo_Ref"   SortExpression="Porcentaje_Anticipo_Ref" />
			<asp:BoundField DataField="Plazo_Ref" HeaderText="Plazo_Ref"   SortExpression="Plazo_Ref" />
			<asp:BoundField DataField="Codigo_Sercop" HeaderText="Codigo_Sercop"   SortExpression="Codigo_Sercop" />
			<asp:BoundField DataField="Per_Personal_Resp_Exp" HeaderText="Per_Personal_Resp_Exp"   SortExpression="Per_Personal_Resp_Exp" />
			<asp:BoundField DataField="Fecha_Cierre_Rec_Ofertas" HeaderText="Fecha_Cierre_Rec_Ofertas"   DataFormatString="{0:d}" SortExpression="Fecha_Cierre_Rec_Ofertas" />
				<asp:BoundField DataField="Par_Razon_Social_Id_Contratista" HeaderText="Par_Razon_Social_Id_Contratista"   SortExpression="Par_Razon_Social_Id_Contratista" />
			<asp:BoundField DataField="Valor_Contrato" HeaderText="Valor_Contrato"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Plazo_Contrato" HeaderText="Plazo_Contrato"   SortExpression="Plazo_Contrato" />
			<asp:BoundField DataField="Fecha_Inicio_Contrato" HeaderText="Fecha_Inicio_Contrato"   DataFormatString="{0:d}" SortExpression="Fecha_Inicio_Contrato" />
				<asp:BoundField DataField="Porcentaje_Anticipo_Contrato" HeaderText="Porcentaje_Anticipo_Contrato"   SortExpression="Porcentaje_Anticipo_Contrato" />
			<asp:BoundField DataField="Per_Personal_Id_Admin" HeaderText="Per_Personal_Id_Admin"   SortExpression="Per_Personal_Id_Admin" />
			<asp:BoundField DataField="Desc_Contrata" HeaderText="Desc_Contrata"   SortExpression="Desc_Contrata" />
			<asp:BoundField DataField="Fecha_Crea" HeaderText="Fecha_Crea"   DataFormatString="{0:d}" SortExpression="Fecha_Crea" />
				<asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"   SortExpression="Pla_Tarea_Id" />
			<asp:BoundField DataField="Pla_Tarea_Codigo" HeaderText="Pla_Tarea_Codigo"   SortExpression="Pla_Tarea_Codigo" />
			<asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Pla_Tarea_Nombre"   SortExpression="Pla_Tarea_Nombre" />
			<asp:BoundField DataField="Per_Personal_Nombre_Admin" HeaderText="Per_Personal_Nombre_Admin"   SortExpression="Per_Personal_Nombre_Admin" />
			<asp:BoundField DataField="Valor_Suma_Movs" HeaderText="Valor_Suma_Movs"    DataFormatString="{0:N2}"  ItemStyle-HorizontalAlign="Right"/>
				<asp:BoundField DataField="Com_Procedimiento_Tipo" HeaderText="Com_Procedimiento_Tipo"   SortExpression="Com_Procedimiento_Tipo" />
			<asp:BoundField DataField="Com_Procedimiento_Nombre" HeaderText="Com_Procedimiento_Nombre"   SortExpression="Com_Procedimiento_Nombre" />
			<asp:BoundField DataField="Per_Personal_Nombre_Resp_Exp" HeaderText="Per_Personal_Nombre_Resp_Exp"   SortExpression="Per_Personal_Nombre_Resp_Exp" />
			<asp:BoundField DataField="Per_Personal_Id_Solicita" HeaderText="Per_Personal_Id_Solicita"   SortExpression="Per_Personal_Id_Solicita" />
			<asp:BoundField DataField="Per_Personal_Nombre_Solicita" HeaderText="Per_Personal_Nombre_Solicita"   SortExpression="Per_Personal_Nombre_Solicita" />
			<asp:BoundField DataField="Par_Razon_Social_Nombre_Contratista" HeaderText="Par_Razon_Social_Nombre_Contratista"   SortExpression="Par_Razon_Social_Nombre_Contratista" />
			<asp:BoundField DataField="Par_Razon_Social_Numero_Contratista" HeaderText="Par_Razon_Social_Numero_Contratista"   SortExpression="Par_Razon_Social_Numero_Contratista" />
			<asp:BoundField DataField="Pla_Doc_Cedula_Presup_Codigo" HeaderText="Pla_Doc_Cedula_Presup_Codigo"   SortExpression="Pla_Doc_Cedula_Presup_Codigo" />
			<asp:BoundField DataField="Pla_Doc_CPC_Codigo" HeaderText="Pla_Doc_CPC_Codigo"   SortExpression="Pla_Doc_CPC_Codigo" />
			<asp:BoundField DataField="Pla_Doc_PAC_Linea" HeaderText="Pla_Doc_PAC_Linea"   SortExpression="Pla_Doc_PAC_Linea" />
			<asp:BoundField DataField="Pla_Doc_Codigo" HeaderText="Pla_Doc_Codigo"   SortExpression="Pla_Doc_Codigo" />
			<asp:BoundField DataField="Pla_Cta_Id" HeaderText="Pla_Cta_Id"   SortExpression="Pla_Cta_Id" />
			<asp:BoundField DataField="Pla_Cta_Codigo" HeaderText="Pla_Cta_Codigo"   SortExpression="Pla_Cta_Codigo" />
			<asp:BoundField DataField="Pla_Cta_Nombre" HeaderText="Pla_Cta_Nombre"   SortExpression="Pla_Cta_Nombre" />
			<asp:BoundField DataField="Pla_Doc_Valor_Solicita" HeaderText="Pla_Doc_Valor_Solicita"   SortExpression="Pla_Doc_Valor_Solicita" />
			<asp:BoundField DataField="Com_Procedimiento_Desc" HeaderText="Com_Procedimiento_Desc"   SortExpression="Com_Procedimiento_Desc" />
			<asp:BoundField DataField="Estado_Portal" HeaderText="Estado_Portal"   SortExpression="Estado_Portal" />
			<asp:BoundField DataField="Estado_Contratacion" HeaderText="Estado_Contratacion"   SortExpression="Estado_Contratacion" />
			<asp:BoundField DataField="Fecha_Inicio_Elabora_Pliegos" HeaderText="Fecha_Inicio_Elabora_Pliegos"   DataFormatString="{0:d}" SortExpression="Fecha_Inicio_Elabora_Pliegos" />
				<asp:BoundField DataField="Fecha_Publicacion_Portal" HeaderText="Fecha_Publicacion_Portal"   DataFormatString="{0:d}" SortExpression="Fecha_Publicacion_Portal" />
				<asp:BoundField DataField="Fecha_Calificaciones" HeaderText="Fecha_Calificaciones"   DataFormatString="{0:d}" SortExpression="Fecha_Calificaciones" />
				<asp:BoundField DataField="Fecha_Estimada_Adjudicacion" HeaderText="Fecha_Estimada_Adjudicacion"   DataFormatString="{0:d}" SortExpression="Fecha_Estimada_Adjudicacion" />
				<asp:BoundField DataField="Fecha_Adjudicacion" HeaderText="Fecha_Adjudicacion"   DataFormatString="{0:d}" SortExpression="Fecha_Adjudicacion" />
				<asp:BoundField DataField="Fecha_Juridico" HeaderText="Fecha_Juridico"   DataFormatString="{0:d}" SortExpression="Fecha_Juridico" />
				</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Com_Contrato --%>

<%--Autocompletar del FormView de Com_Contrato --%>
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



    <%--[O] FormView de Com_Contrato --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvCom_Contrato" runat="server" DataSourceID="odsfvCom_Contrato" 
            oniteminserting="fvCom_Contrato_ItemInserting" 
            onitemdeleted="fvCom_Contrato_ItemDeleted" 
            oniteminserted="fvCom_Contrato_ItemInserted" 
            onitemupdated="fvCom_Contrato_ItemUpdated"
			ondatabound="fvCom_Contrato_DataBound" 
            onprerender="fvCom_Contrato_PreRender"
			onitemupdating="fvCom_Contrato_ItemUpdating"
			onitemdeleting="fvCom_Contrato_ItemDeleting"
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
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Id </td>                
				<td><asp:TextBox ID="Com_Procedimiento_IdTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Porcentaje_Anticipo_Ref </td>                
				<td><asp:TextBox ID="Porcentaje_Anticipo_RefTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Ref") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPorcentaje_Anticipo_Ref" runat="server" 
                    ControlToValidate="Porcentaje_Anticipo_RefTextBox"
                    ErrorMessage="El campo Porcentaje_Anticipo_Ref es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Ref </td>                
				<td><asp:TextBox ID="Plazo_RefTextBox" runat="server" Text='<%# Bind("Plazo_Ref") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Ref" runat="server" 
                    ControlToValidate="Plazo_RefTextBox"
                    ErrorMessage="El campo Plazo_Ref es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Codigo_Sercop </td>                
				<td><asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo_Sercop" runat="server" 
                    ControlToValidate="Codigo_SercopTextBox"
                    ErrorMessage="El campo Codigo_Sercop es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Resp_Exp </td>                
				<td><asp:TextBox ID="Per_Personal_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Resp_Exp") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Resp_Exp" runat="server" 
                    ControlToValidate="Per_Personal_Resp_ExpTextBox"
                    ErrorMessage="El campo Per_Personal_Resp_Exp es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Cierre_Rec_Ofertas </td>                
				<td><asp:TextBox ID="Fecha_Cierre_Rec_OfertasTextBox" runat="server" Text='<%# Bind("Fecha_Cierre_Rec_Ofertas","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Cierre_Rec_Ofertas" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Cierre_Rec_Ofertas" TargetControlID="Fecha_Cierre_Rec_OfertasTextBox" PopupButtonID="btcexFecha_Cierre_Rec_Ofertas" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Cierre_Rec_Ofertas" runat="server" 
                    ControlToValidate="Fecha_Cierre_Rec_OfertasTextBox"
                    ErrorMessage="El campo Fecha_Cierre_Rec_Ofertas es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Cierre_Rec_Ofertas" runat="server" 
                    ErrorMessage="El campo Fecha_Cierre_Rec_Ofertas no contiene una fecha válida" 
                    ControlToValidate="Fecha_Cierre_Rec_OfertasTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Id_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Id_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Id_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Contrato </td>                
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Contrato" runat="server" 
                    ControlToValidate="Valor_ContratoTextBox"
                    ErrorMessage="El campo Valor_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Contrato </td>                
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Contrato" runat="server" 
                    ControlToValidate="Plazo_ContratoTextBox"
                    ErrorMessage="El campo Plazo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Inicio_Contrato </td>                
				<td><asp:TextBox ID="Fecha_Inicio_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Inicio_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Inicio_Contrato" TargetControlID="Fecha_Inicio_ContratoTextBox" PopupButtonID="btcexFecha_Inicio_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Inicio_Contrato" runat="server" 
                    ControlToValidate="Fecha_Inicio_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Inicio_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Inicio_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Inicio_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_Inicio_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Porcentaje_Anticipo_Contrato </td>                
				<td><asp:TextBox ID="Porcentaje_Anticipo_ContratoTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPorcentaje_Anticipo_Contrato" runat="server" 
                    ControlToValidate="Porcentaje_Anticipo_ContratoTextBox"
                    ErrorMessage="El campo Porcentaje_Anticipo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Admin </td>                
				<td><asp:TextBox ID="Per_Personal_Id_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Admin") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Admin" runat="server" 
                    ControlToValidate="Per_Personal_Id_AdminTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Admin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Contrata </td>                
				<td><asp:TextBox ID="Desc_ContrataTextBox" runat="server" Text='<%# Bind("Desc_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Contrata" runat="server" 
                    ControlToValidate="Desc_ContrataTextBox"
                    ErrorMessage="El campo Desc_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Crea </td>                
				<td><asp:TextBox ID="Fecha_CreaTextBox" runat="server" Text='<%# Bind("Fecha_Crea","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Crea" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Crea" TargetControlID="Fecha_CreaTextBox" PopupButtonID="btcexFecha_Crea" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Crea" runat="server" 
                    ControlToValidate="Fecha_CreaTextBox"
                    ErrorMessage="El campo Fecha_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Crea" runat="server" 
                    ErrorMessage="El campo Fecha_Crea no contiene una fecha válida" 
                    ControlToValidate="Fecha_CreaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Admin </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Admin") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Admin" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_AdminTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Admin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma_Movs </td>                
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma_Movs" runat="server" 
                    ControlToValidate="Valor_Suma_MovsTextBox"
                    ErrorMessage="El campo Valor_Suma_Movs es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Tipo </td>                
				<td><asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Tipo" runat="server" 
                    ControlToValidate="Com_Procedimiento_TipoTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Nombre </td>                
				<td><asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Nombre" runat="server" 
                    ControlToValidate="Com_Procedimiento_NombreTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Resp_Exp </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Resp_Exp") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Resp_Exp" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_Resp_ExpTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Resp_Exp es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Id_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Nombre_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Nombre_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Nombre_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Numero_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Numero_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Numero_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Cedula_Presup_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_Cedula_Presup_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Cedula_Presup_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Cedula_Presup_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_Cedula_Presup_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_Cedula_Presup_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_CPC_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_CPC_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_CPC_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_CPC_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_PAC_Linea </td>                
				<td><asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_PAC_Linea" runat="server" 
                    ControlToValidate="Pla_Doc_PAC_LineaTextBox"
                    ErrorMessage="El campo Pla_Doc_PAC_Linea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Id </td>                
				<td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Cta_Codigo </td>                
				<td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Nombre </td>                
				<td><asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Valor_Solicita </td>                
				<td><asp:TextBox ID="Pla_Doc_Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Valor_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Valor_Solicita" runat="server" 
                    ControlToValidate="Pla_Doc_Valor_SolicitaTextBox"
                    ErrorMessage="El campo Pla_Doc_Valor_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Desc </td>                
				<td><asp:TextBox ID="Com_Procedimiento_DescTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Desc") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Desc" runat="server" 
                    ControlToValidate="Com_Procedimiento_DescTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Desc es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Estado_Portal </td>                
				<td>
				<asp:DropDownList ID="Estado_PortalDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Portal"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Portal") %>'>
                </asp:DropDownList>
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEstado_Portal" runat="server" 
                    ControlToValidate="Estado_PortalTextBox"
                    ErrorMessage="El campo Estado_Portal es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Estado_Contratacion </td>                
				<td>
				<asp:DropDownList ID="Estado_ContratacionDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Contratacion"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Contratacion") %>'>
                </asp:DropDownList>
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEstado_Contratacion" runat="server" 
                    ControlToValidate="Estado_ContratacionTextBox"
                    ErrorMessage="El campo Estado_Contratacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Inicio_Elabora_Pliegos </td>                
				<td><asp:TextBox ID="Fecha_Inicio_Elabora_PliegosTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Elabora_Pliegos","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Inicio_Elabora_Pliegos" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Inicio_Elabora_Pliegos" TargetControlID="Fecha_Inicio_Elabora_PliegosTextBox" PopupButtonID="btcexFecha_Inicio_Elabora_Pliegos" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Inicio_Elabora_Pliegos" runat="server" 
                    ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox"
                    ErrorMessage="El campo Fecha_Inicio_Elabora_Pliegos es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Inicio_Elabora_Pliegos" runat="server" 
                    ErrorMessage="El campo Fecha_Inicio_Elabora_Pliegos no contiene una fecha válida" 
                    ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Publicacion_Portal </td>                
				<td><asp:TextBox ID="Fecha_Publicacion_PortalTextBox" runat="server" Text='<%# Bind("Fecha_Publicacion_Portal","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Publicacion_Portal" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Publicacion_Portal" TargetControlID="Fecha_Publicacion_PortalTextBox" PopupButtonID="btcexFecha_Publicacion_Portal" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Publicacion_Portal" runat="server" 
                    ControlToValidate="Fecha_Publicacion_PortalTextBox"
                    ErrorMessage="El campo Fecha_Publicacion_Portal es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Publicacion_Portal" runat="server" 
                    ErrorMessage="El campo Fecha_Publicacion_Portal no contiene una fecha válida" 
                    ControlToValidate="Fecha_Publicacion_PortalTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Calificaciones </td>                
				<td><asp:TextBox ID="Fecha_CalificacionesTextBox" runat="server" Text='<%# Bind("Fecha_Calificaciones","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Calificaciones" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Calificaciones" TargetControlID="Fecha_CalificacionesTextBox" PopupButtonID="btcexFecha_Calificaciones" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Calificaciones" runat="server" 
                    ControlToValidate="Fecha_CalificacionesTextBox"
                    ErrorMessage="El campo Fecha_Calificaciones es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Calificaciones" runat="server" 
                    ErrorMessage="El campo Fecha_Calificaciones no contiene una fecha válida" 
                    ControlToValidate="Fecha_CalificacionesTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Estimada_Adjudicacion </td>                
				<td><asp:TextBox ID="Fecha_Estimada_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Estimada_Adjudicacion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Estimada_Adjudicacion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Estimada_Adjudicacion" TargetControlID="Fecha_Estimada_AdjudicacionTextBox" PopupButtonID="btcexFecha_Estimada_Adjudicacion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Estimada_Adjudicacion" runat="server" 
                    ControlToValidate="Fecha_Estimada_AdjudicacionTextBox"
                    ErrorMessage="El campo Fecha_Estimada_Adjudicacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Estimada_Adjudicacion" runat="server" 
                    ErrorMessage="El campo Fecha_Estimada_Adjudicacion no contiene una fecha válida" 
                    ControlToValidate="Fecha_Estimada_AdjudicacionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Adjudicacion </td>                
				<td><asp:TextBox ID="Fecha_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Adjudicacion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Adjudicacion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Adjudicacion" TargetControlID="Fecha_AdjudicacionTextBox" PopupButtonID="btcexFecha_Adjudicacion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Adjudicacion" runat="server" 
                    ControlToValidate="Fecha_AdjudicacionTextBox"
                    ErrorMessage="El campo Fecha_Adjudicacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Adjudicacion" runat="server" 
                    ErrorMessage="El campo Fecha_Adjudicacion no contiene una fecha válida" 
                    ControlToValidate="Fecha_AdjudicacionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Juridico </td>                
				<td><asp:TextBox ID="Fecha_JuridicoTextBox" runat="server" Text='<%# Bind("Fecha_Juridico","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Juridico" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Juridico" TargetControlID="Fecha_JuridicoTextBox" PopupButtonID="btcexFecha_Juridico" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Juridico" runat="server" 
                    ControlToValidate="Fecha_JuridicoTextBox"
                    ErrorMessage="El campo Fecha_Juridico es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Juridico" runat="server" 
                    ErrorMessage="El campo Fecha_Juridico no contiene una fecha válida" 
                    ControlToValidate="Fecha_JuridicoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato"/>
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
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
				</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Id </td>                
				<td><asp:TextBox ID="Com_Procedimiento_IdTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Porcentaje_Anticipo_Ref </td>                
				<td><asp:TextBox ID="Porcentaje_Anticipo_RefTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Ref") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPorcentaje_Anticipo_Ref" runat="server" 
                    ControlToValidate="Porcentaje_Anticipo_RefTextBox"
                    ErrorMessage="El campo Porcentaje_Anticipo_Ref es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Ref </td>                
				<td><asp:TextBox ID="Plazo_RefTextBox" runat="server" Text='<%# Bind("Plazo_Ref") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Ref" runat="server" 
                    ControlToValidate="Plazo_RefTextBox"
                    ErrorMessage="El campo Plazo_Ref es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Codigo_Sercop </td>                
				<td><asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCodigo_Sercop" runat="server" 
                    ControlToValidate="Codigo_SercopTextBox"
                    ErrorMessage="El campo Codigo_Sercop es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Resp_Exp </td>                
				<td><asp:TextBox ID="Per_Personal_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Resp_Exp") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Resp_Exp" runat="server" 
                    ControlToValidate="Per_Personal_Resp_ExpTextBox"
                    ErrorMessage="El campo Per_Personal_Resp_Exp es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Cierre_Rec_Ofertas </td>                
				<td><asp:TextBox ID="Fecha_Cierre_Rec_OfertasTextBox" runat="server" Text='<%# Bind("Fecha_Cierre_Rec_Ofertas","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Cierre_Rec_Ofertas" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Cierre_Rec_Ofertas" TargetControlID="Fecha_Cierre_Rec_OfertasTextBox" PopupButtonID="btcexFecha_Cierre_Rec_Ofertas" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Cierre_Rec_Ofertas" runat="server" 
                    ControlToValidate="Fecha_Cierre_Rec_OfertasTextBox"
                    ErrorMessage="El campo Fecha_Cierre_Rec_Ofertas es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Cierre_Rec_Ofertas" runat="server" 
                    ErrorMessage="El campo Fecha_Cierre_Rec_Ofertas no contiene una fecha válida" 
                    ControlToValidate="Fecha_Cierre_Rec_OfertasTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Id_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Id_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Id_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Contrato </td>                
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Contrato" runat="server" 
                    ControlToValidate="Valor_ContratoTextBox"
                    ErrorMessage="El campo Valor_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Plazo_Contrato </td>                
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPlazo_Contrato" runat="server" 
                    ControlToValidate="Plazo_ContratoTextBox"
                    ErrorMessage="El campo Plazo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Inicio_Contrato </td>                
				<td><asp:TextBox ID="Fecha_Inicio_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Contrato","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Inicio_Contrato" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Inicio_Contrato" TargetControlID="Fecha_Inicio_ContratoTextBox" PopupButtonID="btcexFecha_Inicio_Contrato" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Inicio_Contrato" runat="server" 
                    ControlToValidate="Fecha_Inicio_ContratoTextBox"
                    ErrorMessage="El campo Fecha_Inicio_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Inicio_Contrato" runat="server" 
                    ErrorMessage="El campo Fecha_Inicio_Contrato no contiene una fecha válida" 
                    ControlToValidate="Fecha_Inicio_ContratoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Porcentaje_Anticipo_Contrato </td>                
				<td><asp:TextBox ID="Porcentaje_Anticipo_ContratoTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Contrato") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPorcentaje_Anticipo_Contrato" runat="server" 
                    ControlToValidate="Porcentaje_Anticipo_ContratoTextBox"
                    ErrorMessage="El campo Porcentaje_Anticipo_Contrato es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Admin </td>                
				<td><asp:TextBox ID="Per_Personal_Id_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Admin") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Admin" runat="server" 
                    ControlToValidate="Per_Personal_Id_AdminTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Admin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Desc_Contrata </td>                
				<td><asp:TextBox ID="Desc_ContrataTextBox" runat="server" Text='<%# Bind("Desc_Contrata") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqDesc_Contrata" runat="server" 
                    ControlToValidate="Desc_ContrataTextBox"
                    ErrorMessage="El campo Desc_Contrata es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Crea </td>                
				<td><asp:TextBox ID="Fecha_CreaTextBox" runat="server" Text='<%# Bind("Fecha_Crea","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Crea" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Crea" TargetControlID="Fecha_CreaTextBox" PopupButtonID="btcexFecha_Crea" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Crea" runat="server" 
                    ControlToValidate="Fecha_CreaTextBox"
                    ErrorMessage="El campo Fecha_Crea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Crea" runat="server" 
                    ErrorMessage="El campo Fecha_Crea no contiene una fecha válida" 
                    ControlToValidate="Fecha_CreaTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Codigo </td>                
				<td><asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Codigo" runat="server" 
                    ControlToValidate="Pla_Tarea_CodigoTextBox"
                    ErrorMessage="El campo Pla_Tarea_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Admin </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Admin") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Admin" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_AdminTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Admin es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Valor_Suma_Movs </td>                
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor_Suma_Movs" runat="server" 
                    ControlToValidate="Valor_Suma_MovsTextBox"
                    ErrorMessage="El campo Valor_Suma_Movs es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Tipo </td>                
				<td><asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Tipo" runat="server" 
                    ControlToValidate="Com_Procedimiento_TipoTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Tipo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Nombre </td>                
				<td><asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Nombre" runat="server" 
                    ControlToValidate="Com_Procedimiento_NombreTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Resp_Exp </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Resp_Exp") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Resp_Exp" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_Resp_ExpTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Resp_Exp es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Id_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Id_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Id_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>                
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPer_Personal_Nombre_Solicita" runat="server" 
                    ControlToValidate="Per_Personal_Nombre_SolicitaTextBox"
                    ErrorMessage="El campo Per_Personal_Nombre_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Nombre_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Nombre_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Nombre_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>                
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPar_Razon_Social_Numero_Contratista" runat="server" 
                    ControlToValidate="Par_Razon_Social_Numero_ContratistaTextBox"
                    ErrorMessage="El campo Par_Razon_Social_Numero_Contratista es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Cedula_Presup_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_Cedula_Presup_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Cedula_Presup_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Cedula_Presup_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_Cedula_Presup_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_Cedula_Presup_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_CPC_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_CPC_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_CPC_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_CPC_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_PAC_Linea </td>                
				<td><asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_PAC_Linea" runat="server" 
                    ControlToValidate="Pla_Doc_PAC_LineaTextBox"
                    ErrorMessage="El campo Pla_Doc_PAC_Linea es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Codigo </td>                
				<td><asp:TextBox ID="Pla_Doc_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Codigo" runat="server" 
                    ControlToValidate="Pla_Doc_CodigoTextBox"
                    ErrorMessage="El campo Pla_Doc_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Id </td>                
				<td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server" Text='<%# Bind("Pla_Cta_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Pla_Cta_Codigo </td>                
				<td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Cta_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Cta_Nombre </td>                
				<td><asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" Text='<%# Bind("Pla_Cta_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Pla_Doc_Valor_Solicita </td>                
				<td><asp:TextBox ID="Pla_Doc_Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Valor_Solicita") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Doc_Valor_Solicita" runat="server" 
                    ControlToValidate="Pla_Doc_Valor_SolicitaTextBox"
                    ErrorMessage="El campo Pla_Doc_Valor_Solicita es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Com_Procedimiento_Desc </td>                
				<td><asp:TextBox ID="Com_Procedimiento_DescTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Desc") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqCom_Procedimiento_Desc" runat="server" 
                    ControlToValidate="Com_Procedimiento_DescTextBox"
                    ErrorMessage="El campo Com_Procedimiento_Desc es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Estado_Portal </td>                
				<td>
				<asp:DropDownList ID="Estado_PortalDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Portal"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Portal") %>'>
                </asp:DropDownList>
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEstado_Portal" runat="server" 
                    ControlToValidate="Estado_PortalTextBox"
                    ErrorMessage="El campo Estado_Portal es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Estado_Contratacion </td>                
				<td>
				<asp:DropDownList ID="Estado_ContratacionDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Contratacion"  CssClass="txtEdit" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Contratacion") %>'>
                </asp:DropDownList>
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqEstado_Contratacion" runat="server" 
                    ControlToValidate="Estado_ContratacionTextBox"
                    ErrorMessage="El campo Estado_Contratacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Inicio_Elabora_Pliegos </td>                
				<td><asp:TextBox ID="Fecha_Inicio_Elabora_PliegosTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Elabora_Pliegos","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Inicio_Elabora_Pliegos" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Inicio_Elabora_Pliegos" TargetControlID="Fecha_Inicio_Elabora_PliegosTextBox" PopupButtonID="btcexFecha_Inicio_Elabora_Pliegos" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Inicio_Elabora_Pliegos" runat="server" 
                    ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox"
                    ErrorMessage="El campo Fecha_Inicio_Elabora_Pliegos es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Inicio_Elabora_Pliegos" runat="server" 
                    ErrorMessage="El campo Fecha_Inicio_Elabora_Pliegos no contiene una fecha válida" 
                    ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Publicacion_Portal </td>                
				<td><asp:TextBox ID="Fecha_Publicacion_PortalTextBox" runat="server" Text='<%# Bind("Fecha_Publicacion_Portal","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Publicacion_Portal" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Publicacion_Portal" TargetControlID="Fecha_Publicacion_PortalTextBox" PopupButtonID="btcexFecha_Publicacion_Portal" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Publicacion_Portal" runat="server" 
                    ControlToValidate="Fecha_Publicacion_PortalTextBox"
                    ErrorMessage="El campo Fecha_Publicacion_Portal es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Publicacion_Portal" runat="server" 
                    ErrorMessage="El campo Fecha_Publicacion_Portal no contiene una fecha válida" 
                    ControlToValidate="Fecha_Publicacion_PortalTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Calificaciones </td>                
				<td><asp:TextBox ID="Fecha_CalificacionesTextBox" runat="server" Text='<%# Bind("Fecha_Calificaciones","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Calificaciones" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Calificaciones" TargetControlID="Fecha_CalificacionesTextBox" PopupButtonID="btcexFecha_Calificaciones" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Calificaciones" runat="server" 
                    ControlToValidate="Fecha_CalificacionesTextBox"
                    ErrorMessage="El campo Fecha_Calificaciones es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Calificaciones" runat="server" 
                    ErrorMessage="El campo Fecha_Calificaciones no contiene una fecha válida" 
                    ControlToValidate="Fecha_CalificacionesTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Estimada_Adjudicacion </td>                
				<td><asp:TextBox ID="Fecha_Estimada_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Estimada_Adjudicacion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Estimada_Adjudicacion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Estimada_Adjudicacion" TargetControlID="Fecha_Estimada_AdjudicacionTextBox" PopupButtonID="btcexFecha_Estimada_Adjudicacion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Estimada_Adjudicacion" runat="server" 
                    ControlToValidate="Fecha_Estimada_AdjudicacionTextBox"
                    ErrorMessage="El campo Fecha_Estimada_Adjudicacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Estimada_Adjudicacion" runat="server" 
                    ErrorMessage="El campo Fecha_Estimada_Adjudicacion no contiene una fecha válida" 
                    ControlToValidate="Fecha_Estimada_AdjudicacionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Adjudicacion </td>                
				<td><asp:TextBox ID="Fecha_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Adjudicacion","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Adjudicacion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Adjudicacion" TargetControlID="Fecha_AdjudicacionTextBox" PopupButtonID="btcexFecha_Adjudicacion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Adjudicacion" runat="server" 
                    ControlToValidate="Fecha_AdjudicacionTextBox"
                    ErrorMessage="El campo Fecha_Adjudicacion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Adjudicacion" runat="server" 
                    ErrorMessage="El campo Fecha_Adjudicacion no contiene una fecha válida" 
                    ControlToValidate="Fecha_AdjudicacionTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			<tr >
                <td> Fecha_Juridico </td>                
				<td><asp:TextBox ID="Fecha_JuridicoTextBox" runat="server" Text='<%# Bind("Fecha_Juridico","{0:d}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Juridico" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Juridico" TargetControlID="Fecha_JuridicoTextBox" PopupButtonID="btcexFecha_Juridico" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Juridico" runat="server" 
                    ControlToValidate="Fecha_JuridicoTextBox"
                    ErrorMessage="El campo Fecha_Juridico es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					<asp:RangeValidator ID="rvFecha_Juridico" runat="server" 
                    ErrorMessage="El campo Fecha_Juridico no contiene una fecha válida" 
                    ControlToValidate="Fecha_JuridicoTextBox" 
                    Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" ValidationGroup="vgCom_Contrato"/>
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
                <td> Pla_Doc_Id </td>
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td>
				<asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado"  Enabled="false" CssClass="txtItemDDL" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado") %>'>
                </asp:DropDownList>
							</tr>
			<tr >
                <td> Com_Procedimiento_Id </td>
				<td><asp:TextBox ID="Com_Procedimiento_IdTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Porcentaje_Anticipo_Ref </td>
				<td><asp:TextBox ID="Porcentaje_Anticipo_RefTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Ref") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Plazo_Ref </td>
				<td><asp:TextBox ID="Plazo_RefTextBox" runat="server" Text='<%# Bind("Plazo_Ref") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Codigo_Sercop </td>
				<td><asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Resp_Exp </td>
				<td><asp:TextBox ID="Per_Personal_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Resp_Exp") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Cierre_Rec_Ofertas </td>
				<td><asp:TextBox ID="Fecha_Cierre_Rec_OfertasTextBox" runat="server" Text='<%# Bind("Fecha_Cierre_Rec_Ofertas","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Id_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Contrato </td>
				<td><asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Plazo_Contrato </td>
				<td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Inicio_Contrato </td>
				<td><asp:TextBox ID="Fecha_Inicio_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Contrato","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Porcentaje_Anticipo_Contrato </td>
				<td><asp:TextBox ID="Porcentaje_Anticipo_ContratoTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Contrato") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Admin </td>
				<td><asp:TextBox ID="Per_Personal_Id_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Admin") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Desc_Contrata </td>
				<td><asp:TextBox ID="Desc_ContrataTextBox" runat="server" Text='<%# Bind("Desc_Contrata") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Crea </td>
				<td><asp:TextBox ID="Fecha_CreaTextBox" runat="server" Text='<%# Bind("Fecha_Crea","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Tarea_Id </td>
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
                <td> Per_Personal_Nombre_Admin </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Admin") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Suma_Movs </td>
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  ReadOnly="true"  CssClass="txtItemValor" /></td>
							</tr>
			<tr >
                <td> Com_Procedimiento_Tipo </td>
				<td><asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Com_Procedimiento_Nombre </td>
				<td><asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Resp_Exp </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Resp_Exp") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Id_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Per_Personal_Nombre_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Nombre_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Par_Razon_Social_Numero_Contratista </td>
				<td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Cedula_Presup_Codigo </td>
				<td><asp:TextBox ID="Pla_Doc_Cedula_Presup_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Cedula_Presup_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_CPC_Codigo </td>
				<td><asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_PAC_Linea </td>
				<td><asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Pla_Doc_Codigo </td>
				<td><asp:TextBox ID="Pla_Doc_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
                <td> Pla_Doc_Valor_Solicita </td>
				<td><asp:TextBox ID="Pla_Doc_Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Valor_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Com_Procedimiento_Desc </td>
				<td><asp:TextBox ID="Com_Procedimiento_DescTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Desc") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Estado_Portal </td>
				<td>
				<asp:DropDownList ID="Estado_PortalDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Portal"  Enabled="false" CssClass="txtItemDDL" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Portal") %>'>
                </asp:DropDownList>
							</tr>
			<tr >
                <td> Estado_Contratacion </td>
				<td>
				<asp:DropDownList ID="Estado_ContratacionDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Contratacion"  Enabled="false" CssClass="txtItemDDL" 
                        DataTextField="Nombre" 
                        DataValueField="Dominio" 
                        SelectedValue='<%# Bind("Estado_Contratacion") %>'>
                </asp:DropDownList>
							</tr>
			<tr >
                <td> Fecha_Inicio_Elabora_Pliegos </td>
				<td><asp:TextBox ID="Fecha_Inicio_Elabora_PliegosTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Elabora_Pliegos","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Publicacion_Portal </td>
				<td><asp:TextBox ID="Fecha_Publicacion_PortalTextBox" runat="server" Text='<%# Bind("Fecha_Publicacion_Portal","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Calificaciones </td>
				<td><asp:TextBox ID="Fecha_CalificacionesTextBox" runat="server" Text='<%# Bind("Fecha_Calificaciones","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Estimada_Adjudicacion </td>
				<td><asp:TextBox ID="Fecha_Estimada_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Estimada_Adjudicacion","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Adjudicacion </td>
				<td><asp:TextBox ID="Fecha_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Adjudicacion","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Fecha_Juridico </td>
				<td><asp:TextBox ID="Fecha_JuridicoTextBox" runat="server" Text='<%# Bind("Fecha_Juridico","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorCom_Contrato" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Contrato"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Com_Contrato --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByCodigo_Sercop" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByCodigo_Sercop" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo_Sercop" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByLikePla_Tarea_Nombre" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByLikePla_Tarea_Nombre" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Tarea_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByPla_Doc_Codigo" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByPla_Doc_Codigo" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Doc_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByPla_Tarea_Codigo" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByPla_Tarea_Codigo" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Tarea_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByRangoFecha_Crea" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByRangoFecha_Crea" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Crea_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Crea_Fin" PropertyName="Text" Type="DateTime" />
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
	<%--Objetos de Datos para obtener los dominios del campo Estado de la tabla Com_Contrato --%>
    <asp:ObjectDataSource ID="odsDominio_Com_Contrato_Estado" runat="server" 
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
            <asp:Parameter Type="String" Name="Objeto_Nombre" DefaultValue="Com_Contrato"  />
            <asp:Parameter Type="String" Name="Campo_Nombre"  DefaultValue="Estado"               />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para obtener los dominios del campo Estado_Portal de la tabla Com_Contrato --%>
    <asp:ObjectDataSource ID="odsDominio_Com_Contrato_Estado_Portal" runat="server" 
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
            <asp:Parameter Type="String" Name="Objeto_Nombre" DefaultValue="Com_Contrato"  />
            <asp:Parameter Type="String" Name="Campo_Nombre"  DefaultValue="Estado_Portal"               />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para obtener los dominios del campo Estado_Contratacion de la tabla Com_Contrato --%>
    <asp:ObjectDataSource ID="odsDominio_Com_Contrato_Estado_Contratacion" runat="server" 
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
            <asp:Parameter Type="String" Name="Objeto_Nombre" DefaultValue="Com_Contrato"  />
            <asp:Parameter Type="String" Name="Campo_Nombre"  DefaultValue="Estado_Contratacion"               />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvCom_Contrato" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato"
        DataObjectTypeName="Com_Contrato"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_Inserted" 
        onupdated="odsfvCom_Contrato_Updated" 
		ondeleted="odsfvCom_Contrato_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato --%>
</asp:Content>
