<%@ Page Title="" Language="C#" MasterPageFile="~/KOALA.master" AutoEventWireup="true" CodeFile="Pla_Doc_Planificacion.aspx.cs" Inherits="PLA_Pla_Doc_Planificacion" %>

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
        $('#ctl00_ContentPlaceHolder1_fvPla_Mov_ValorTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
    }
</script>
<asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>
<%--Ejecuta la función antes de presentar los objetos en pantalla mediante PageRequestManager--%>
<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PonerFormatoNumericoACamposFV);
</script>

    <%--[O] Cabecera--%>
    <asp:Panel runat="server" ID="pcabecera" GroupingText="Cabecera" DefaultButton="btCabeceraFiltrar">
        <asp:Button runat="server" ID="btCabeceraFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:Label runat="server" ID="lbCabeceraTipo" Text="GCP" style="display:none" ></asp:Label>
        Seleccionar el rango de fechas: 
        <asp:TextBox ID="tbFechaIni" runat="server" Width="80px"></asp:TextBox> <ajax:CalendarExtender runat="server" ID="cextbFechaIni" TargetControlID="tbFechaIni"/>
        - hasta -
        <asp:TextBox ID="tbFechaFin" runat="server" Width="80px"></asp:TextBox> <ajax:CalendarExtender runat="server" ID="cextbFechaFin" TargetControlID="tbFechaFin"/>
        Seleccione un área: 
        <asp:DropDownList ID="ddlCabeceraArea" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
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
			<asp:ListItem Text = "Descripcion" Value="Descripcion" ></asp:ListItem>
            <asp:ListItem Text = "Codigo" Value="Codigo" ></asp:ListItem>
		</asp:DropDownList>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Pla_Doc --%>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Solicitudes">
    <asp:Label runat="server" ID="lbHelp_gvPla_Doc" ForeColor="DarkBlue">Seleccione una solicitud para asignarlo al POA</asp:Label>
    <asp:GridView ID="gvPla_Doc" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Doc_GetByTipo_RangoFecha_Solicita" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Doc_SelectedIndexChanged" 
            ondatabound="gvPla_Doc_DataBound">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />			    
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   />			    
            <asp:BoundField DataField="Area_Nombre_Solicita" HeaderText="Area_Solicita" ItemStyle-Width="160px"  />
            <asp:BoundField DataField="Per_Personal_Nombre_Solicita" HeaderText="Persona_Solicita"   ItemStyle-Width="160px"/>	
			<asp:BoundField DataField="Fecha_Solicita" HeaderText="F_Solicita"   DataFormatString="{0:d}" />				
			<asp:BoundField DataField="Descripcion" HeaderText="Descripcion"   ItemStyle-Width="310px"/>
			<asp:BoundField DataField="Valor_Solicita" HeaderText="Valor_Solicita"    DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>				
			<asp:BoundField DataField="Esta_Planificada" HeaderText="Es_Planif."   />

                <asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
                <asp:BoundField DataField="Tipo" HeaderText="Tipo"  Visible = "false"  />
                <asp:BoundField DataField="Per_Personal_Id_Solicita" HeaderText="Per_Personal_Id_Solicita"  Visible = "false"  />
			    <asp:BoundField DataField="Area_Codigo_Solicita" HeaderText="Area_Codigo_Solicita"  Visible = "false"  />
                <asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
                <asp:BoundField DataField="Per_Personal_Id_Crea" HeaderText="Per_Personal_Id_Crea"   Visible = "false" />
                <asp:BoundField DataField="Per_Personal_Id_Modifica" HeaderText="Per_Personal_Id_Modifica"  Visible = "false"  />
			    <asp:BoundField DataField="Per_Personal_Id_Planifica" HeaderText="Per_Personal_Id_Planifica" Visible = "false"   />
			    <asp:BoundField DataField="Esta_Contratada" HeaderText="Es_Contrat."   Visible = "false"/>
			    <asp:BoundField DataField="PAC_Linea" HeaderText="PAC_Linea"   Visible = "false" />
			    <asp:BoundField DataField="CPC_Codigo" HeaderText="CPC_Codigo"   Visible = "false" />
			    <asp:BoundField DataField="Fecha_Contrata" HeaderText="Fecha_Contrata"   DataFormatString="{0:d}" Visible = "false"/>
				<asp:BoundField DataField="Fecha_Planifica" HeaderText="Fecha_Planifica"   DataFormatString="{0:d}" />					
			    <asp:BoundField DataField="Per_Personal_Nombre_Crea" HeaderText="Per_Personal_Nombre_Crea"   Visible = "false" />
			    <asp:BoundField DataField="Per_Personal_Nombre_Modifica" HeaderText="Per_Personal_Nombre_Modifica"   Visible = "false" />
			    <asp:BoundField DataField="Per_Personal_Nombre_Planifica" HeaderText="Per_Personal_Nombre_Planifica"  Visible = "false"  />
                <asp:BoundField DataField="Per_Personal_Id_Contrata" HeaderText="Per_Personal_Id_Contrata"  Visible = "false"  />
			    <asp:BoundField DataField="Per_Personal_Nombre_Contrata" HeaderText="Per_Personal_Nombre_Contrata"   Visible = "false" />
			</Columns>
            <EmptyDataTemplate>No hay datos.</EmptyDataTemplate>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Doc --%>

    <%--[0]INICIO Javascript para manegar los campos de autocompletar --%>
    <div>
    <script type="text/javascript" >
        // Autocompletar en Movimiento
        function acxPla_Cta_CodigoTextBox_Click(source, eventArgs) {
            //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
            var params = new Array();
            params = eventArgs.get_value().split('||');
            // 0 Id 
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_IdTextBox');
            xId.value = params[0];
            // 2 Nombre
            var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NombreTextBox');
            xNombre.value = params[2];
            // 3 Nivel
            var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NivelTextBox');
            xNivel.value = params[3];
            // coloca el id del maestro en el detalle mediante el contextKey
            $find('acxBIDPla_Tarea_NombreTextBox').set_contextKey(xId.value);
            // Encera los campos en cascada
            // Tarea Id
            var xTareaId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Tarea_IdTextBox');
            xTareaId.value = '';
            // Tarea Nombre
            var xTareaNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Tarea_NombreTextBox');
            xTareaNombre.value = '';
            // Partida Id
            var xPartidaId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_IdTextBox');
            xPartidaId.value = '';
            // Partida Codigo
            var xPartidaCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_CodigoTextBox');
            xPartidaCodigo.value = '';
            // Partida Nombre
            var xPartidaNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_NombreTextBox');
            xPartidaNombre.value = '';
        }
        function acxPla_Cta_NombreTextBox_Click(source, eventArgs) {
            //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
            var params = new Array();
            params = eventArgs.get_value().split('||');
            // 0 Id
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_IdTextBox');
            xId.value = params[0];
            // 1 Codigo
            var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_CodigoTextBox');
            xCodigo.value = params[1];
            // 3 Nivel
            var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NivelTextBox');
            xNivel.value = params[3];
            // coloca el id del maestro en el detalle mediante el contextKey
            $find('acxBIDPla_Tarea_NombreTextBox').set_contextKey(xId.value);
        }
        // Evento que encera los campos cuando se vuelve a seleccionar los autocomplex
        function acxPla_Cta_CodigoTextBox_Populating(source, eventArgs) {
            // 0 Id 
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_IdTextBox');
            xId.value = '';
            // 2 Nombre
            var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NombreTextBox');
            xNombre.value = '';
            // 3 Nivel
            var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NivelTextBox');
            xNivel.value = '';
        }
        function acxPla_Cta_NombreTextBox_Populating(source, eventArgs) {
            // 0 Id
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_IdTextBox');
            xId.value = '';
            // 1 Codigo
            var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_CodigoTextBox');
            xCodigo.value = '';
            // 3 Nivel
            var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NivelTextBox');
            xNivel.value = '';
        }
        // Evento para poner el Anio del ddl en el contextKey
        function ddlAnio_OnChange() {
            var xddlAnio = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_ddlAnio');
            //Codigo
            $find('acxBID_Pla_Cta_CodigoTextBox').set_contextKey(xddlAnio.value);
            //Nombre
            $find('acxBID_Pla_Cta_NombreTextBox').set_contextKey(xddlAnio.value);
            // Encera los campos
            // 0 Id
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_IdTextBox');
            xId.value = '';
            // 1 Codigo
            var xCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_CodigoTextBox');
            xCodigo.value = '';
            // 2 Nombre
            var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NombreTextBox');
            xNombre.value = '';
            // 3 Nivel
            var xNivel = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Cta_NivelTextBox');
            xNivel.value = '';
        }
        // Autocompletar del Nombre de la tarea
        function acxPla_Tarea_NombreTextBox_Click(source, eventArgs) {
            //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
            var params = new Array();
            params = eventArgs.get_value().split('||');
            // 0 Id                            
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Tarea_IdTextBox');
            xId.value = params[0];
            // Coloca el valor del campo Nombre para correguir al autocompletar
            var acxBIDAutoCompletar = $find("acxBIDPla_Tarea_NombreTextBox");
            var selInd = acxBIDAutoCompletar._selectIndex;
            if (selInd != -1)
                acxBIDAutoCompletar.get_element().value = params[2];
            // Pone el contextKey en el autocompletar de la partida POA
            $find('acxBIDPla_Partida_CodigoTextBox').set_contextKey(xId.value);
            // Partida Id
            var xPartidaId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_IdTextBox');
            xPartidaId.value = '';
            // Partida Codigo
            var xPartidaCodigo = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_CodigoTextBox');
            xPartidaCodigo.value = '';
            // Partida Nombre
            var xPartidaNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_NombreTextBox');
            xPartidaNombre.value = '';
        }
        // Un tuco para las listas desplegables con imagen incluida
        function OnClientPopulatedTarea(sender, eventArgs) {
            //Find the autocompleteextender list
            var autoList = $find("acxBIDPla_Tarea_NombreTextBox").get_completionList();
            for (i = 0; i < autoList.childNodes.length; i++) {
                var text = autoList.childNodes[i].firstChild.nodeValue;
                autoList.childNodes[i].innerHTML = '<img src="../images/Punto.png" /> ' + text;
            }
        }
        // Autocompletar en POA
        function acxPla_Partida_CodigoTextBox_Click(source, eventArgs) {
            //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
            var params = new Array();
            params = eventArgs.get_value().split('||');
            // 0 Id                            ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_IdTextBox
            var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Poa_IdTextBox');
            xId.value = params[0];
            // 2 Nombre
            var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Pla_Partida_NombreTextBox');
            xNombre.value = params[2];
            // 3 Valor Inicial
            var xValor_Inicial = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Valor_InicialTextBox');
            xValor_Inicial.value = params[3];
            // 4 Valor Suma
            var xValor_Suma = document.getElementById('ctl00_ContentPlaceHolder1_fvPla_Mov_Valor_SumaTextBox');
            xValor_Suma.value = params[4];
        }
    </script>
    </div>
    <%--[X]FIN Javascript para manegar los campos de autocompletar --%>

    <%--[O] FormView de Pla_Doc --%>
    <asp:Panel runat="server" ID="pfvPla_Doc" GroupingText="*">
    <koala:FormViewSetim ID="fvPla_Doc" runat="server" DataSourceID="odsfvPla_Doc" 
            oniteminserting="fvPla_Doc_ItemInserting" 
            onitemdeleted="fvPla_Doc_ItemDeleted" 
            oniteminserted="fvPla_Doc_ItemInserted" 
            onitemupdated="fvPla_Doc_ItemUpdated"
			ondatabound="fvPla_Doc_DataBound" 
            onprerender="fvPla_Doc_PreRender"
			onitemupdating="fvPla_Doc_ItemUpdating"
			onitemdeleting="fvPla_Doc_ItemDeleting" 
            DataKeyNames="Id"
			>
        <EmptyDataTemplate>No se ha seleccionado un registro de la lista.</EmptyDataTemplate>
        <EditItemTemplate>
            <asp:Panel runat="server" ID="panelEditTemplate" DefaultButton="UpdateButton"  CssClass="panCol2" GroupingText="Solicitud">
                <table>
			    <tr style="display:none">
                    <td> Id </td>
				    <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr >
                    <td> Codigo </td>
				    <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr style="display:none">
                    <td> Tipo </td>
				    <td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
                <tr style="display:none">
                    <td> Per_Personal_Id_Solicita </td>
				    <td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
			    <tr >
                    <td> Persona_Solicita </td>
				    <td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  
                        ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
			    </tr>
			    <tr >
                    <td> Fecha_Solicita </td>
				    <td><asp:TextBox ID="Fecha_SolicitaTextBox" runat="server" Text='<%# Bind("Fecha_Solicita","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr >
                    <td> Descripcion </td>
				    <td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine"  Height="84px"/></td>
							    </tr>
			    <tr style="display:none">
                    <td> Estado </td>
				    <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr style="display:none">
                    <td> Per_Personal_Id_Crea </td>
				    <td><asp:TextBox ID="Per_Personal_Id_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr style="display:none">
                    <td> Per_Personal_Nombre_Crea </td>
				    <td><asp:TextBox ID="Per_Personal_Nombre_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr style="display:none" >
                    <td> Per_Personal_Id_Modifica </td>
				    <td><asp:TextBox ID="Per_Personal_Id_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr style="display:none">
                    <td> Per_Personal_Nombre_Modifica </td>
				    <td><asp:TextBox ID="Per_Personal_Nombre_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							    </tr>
			    <tr >
                    <td> Valor_Solicita </td>
				    <td><asp:TextBox ID="Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Valor_Solicita","{0:N2}") %>'  
                    ReadOnly="true"  CssClass="txtItemValor"  /></td>
							    </tr>			
			    </table>
                <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" 
                Text="Actualizar" ValidationGroup="vgPla_Doc"/>
                &nbsp;
                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
            <asp:Panel runat="server" ID="panel2"  CssClass="panCol2">
                <asp:Panel runat="server" ID="panel3"  GroupingText="Planificación">
                    <table  >
			        <tr style="display:none">
                        <td> Area_Nombre_Solicita </td>
				        <td><asp:TextBox ID="Area_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Nombre_Solicita") %>'  ReadOnly="true"  CssClass="txtItem"  />
                        <asp:TextBox ID="Area_Codigo_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Codigo_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" Width ="60px"/>
                        </td>
			        </tr>
                    <tr style="display:none">
                        <td> Per_Personal_Id_Planifica </td>
				        <td><asp:TextBox ID="Per_Personal_Id_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Planifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
					</tr>
			        <tr >
                        <td> Persona_Planifica </td>
				        <td><asp:TextBox ID="Per_Personal_Nombre_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Planifica") %>'  
                        ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
					</tr>
			        <tr >
                        <td> Esta_Planificada </td>
				        <td><asp:DropDownList ID="Esta_PlanificadaDropDownList" runat="server"  CssClass="txtEdit"
                            SelectedValue='<%# Bind("Esta_Planificada") %>' >
                                <asp:ListItem Text="Pendiente" Value="PEN"></asp:ListItem>
                                <asp:ListItem Text="SI" Value="SIP"></asp:ListItem>
                                <asp:ListItem Text="NO" Value="NOP"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
					</tr>
                    <tr >
                        <td> Fecha_Planifica </td>                
				        <td><asp:TextBox ID="Fecha_PlanificaTextBox" runat="server" Text='<%# Bind("Fecha_Planifica","{0:d}") %>'  CssClass="txtEdit" Width="80px" />
				        <asp:Button runat="server" ID="btcexFecha_Planifica" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Planifica" TargetControlID="Fecha_PlanificaTextBox" PopupButtonID="btcexFecha_Planifica" />
				        <%--Validador--%>
                            <asp:RequiredFieldValidator ID="rqFecha_Planifica" runat="server" 
                            ControlToValidate="Fecha_PlanificaTextBox"
                            ErrorMessage="Fecha_Planifica es obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgPla_Doc"/>
					        <asp:RangeValidator ID="rvFecha_Planifica" runat="server" 
                            ErrorMessage="Fecha_Planifica no es una válida" 
                            ControlToValidate="Fecha_PlanificaTextBox" 
                            Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgPla_Doc"/>
				        </td>
                    </tr>
			        </table>
                </asp:Panel>
                <asp:Panel runat="server" ID="panel4"  GroupingText="Contratación">
                    <table>
            <tr style="display:none">
                <td> Per_Personal_Id_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Id_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Contrata") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Personal_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Contrata") %>'  
                ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
							</tr>
			<tr >
                <td> Esta_Contratada </td>
				<td><asp:TextBox ID="Esta_ContratadaTextBox" runat="server" Text='<%# Bind("Esta_Contratada") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr >
                <td> Fecha_Contrata </td>
				<td><asp:TextBox ID="Fecha_ContrataTextBox" runat="server" Text='<%# Bind("Fecha_Contrata","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
			<tr >
                <td> PAC_Linea </td>
				<td><asp:TextBox ID="PAC_LineaTextBox" runat="server" Text='<%# Bind("PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="130px" />
                     CPC_Codigo
                     <asp:TextBox ID="CPC_CodigoTextBox" runat="server" Text='<%# Bind("CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="130px" />
                </td>
			</tr>
            </table>
                </asp:Panel>
            </asp:Panel>
        </EditItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="EditButton"  CssClass="panCol2" GroupingText="Solicitud">
            <table>
			<tr style="display:none">
                <td> Id </td>
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Codigo </td>
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Tipo </td>
				<td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr style="display:none">
                <td> Per_Personal_Id_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
			<tr >
                <td> Persona_Solicita </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  
                    ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
			</tr>
			<tr >
                <td> Fecha_Solicita </td>
				<td><asp:TextBox ID="Fecha_SolicitaTextBox" runat="server" Text='<%# Bind("Fecha_Solicita","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Descripcion </td>
				<td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine"  Height="84px"/></td>
							</tr>
			<tr style="display:none">
                <td> Estado </td>
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Per_Personal_Id_Crea </td>
				<td><asp:TextBox ID="Per_Personal_Id_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Per_Personal_Nombre_Crea </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_CreaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Crea") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none" >
                <td> Per_Personal_Id_Modifica </td>
				<td><asp:TextBox ID="Per_Personal_Id_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Per_Personal_Nombre_Modifica </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_ModificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Modifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Valor_Solicita </td>
				<td><asp:TextBox ID="Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Valor_Solicita","{0:N2}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>			
			</table>
            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            </asp:Panel>
            <asp:Panel runat="server" ID="panel2"  CssClass="panCol2">
                <asp:Panel runat="server" ID="panel3"  GroupingText="Planificación">
            <table  >
			<tr style="display:none">
                <td> Area_Nombre_Solicita </td>
				<td><asp:TextBox ID="Area_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Nombre_Solicita") %>'  ReadOnly="true"  CssClass="txtItem"  />
                <asp:TextBox ID="Area_Codigo_SolicitaTextBox" runat="server" Text='<%# Bind("Area_Codigo_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" Width ="60px"/>
                </td>
			</tr>

            <tr style="display:none">
                <td> Per_Personal_Id_Planifica </td>
				<td><asp:TextBox ID="Per_Personal_Id_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Planifica") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Persona_Planifica </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_PlanificaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Planifica") %>'  
                ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
							</tr>
			<tr >
                <td> Esta_Planificada </td>
				<td><asp:TextBox ID="Esta_PlanificadaTextBox" runat="server" Text='<%# Bind("Esta_Planificada") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
            <tr >
                <td> Fecha_Planifica </td>
				<td><asp:TextBox ID="Fecha_PlanificaTextBox" runat="server" Text='<%# Bind("Fecha_Planifica","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr >
                <td> Valor_Planificado </td>
				<td><asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs","{0:N2}") %>'  
                ReadOnly="true"  CssClass="txtItemValor" />
                </td>
			</tr>
            <tr >
                <td> Planif - Solicit </td>
				<td><asp:TextBox ID="Valor_Dif_Planif_Solicit" runat="server" ReadOnly="true"  CssClass="txtItemValor" />
                </td>
			</tr>
			</table>
            </asp:Panel>
                <asp:Panel runat="server" ID="panel4"  GroupingText="Contratación">
                    <table>
            <tr style="display:none">
                <td> Per_Personal_Id_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Id_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Contrata") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Personal_Contrata </td>
				<td><asp:TextBox ID="Per_Personal_Nombre_ContrataTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Contrata") %>'  
                ReadOnly="true"  CssClass="txtItem" Width="380px" /></td>
							</tr>
			<tr >
                <td> Esta_Contratada </td>
				<td><asp:TextBox ID="Esta_ContratadaTextBox" runat="server" Text='<%# Bind("Esta_Contratada") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr >
                <td> Fecha_Contrata </td>
				<td><asp:TextBox ID="Fecha_ContrataTextBox" runat="server" Text='<%# Bind("Fecha_Contrata","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
			<tr >
                <td> PAC_Linea </td>
				<td><asp:TextBox ID="PAC_LineaTextBox" runat="server" Text='<%# Bind("PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="130px" />
                     CPC_Codigo
                     <asp:TextBox ID="CPC_CodigoTextBox" runat="server" Text='<%# Bind("CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="130px" />
                </td>
			</tr>
            </table>
                </asp:Panel>
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorPla_Doc" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Doc" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgPla_Doc"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Doc --%>

    <%--[O] GridView de Pla_Mov --%>
    <asp:Panel ID="Panel5" runat="server" GroupingText="Movimientos">
    <asp:GridView ID="gvPla_Mov" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Mov_GetByPla_Doc_Id" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Mov_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />			
			<asp:BoundField DataField="Orden" HeaderText="Orden"   />
            <asp:BoundField DataField="Pla_Doc_Fecha" HeaderText="Fecha"  DataFormatString="{0:d}" />
			<asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Tarea_Nombre"   />
			<asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Partida_Cod"   />
			<asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Partida_Nombre"   />
            <asp:BoundField DataField="Valor" HeaderText="Valor"    DataFormatString="{0:N2}" ItemStyle-HorizontalAlign="Right"/>
			    
                <asp:BoundField DataField="Pla_Doc_Tipo" HeaderText="Tipo" Visible = "false" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo"  Visible = "false"  />
                <asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id"  Visible = "false" />
			    <asp:BoundField DataField="Estado" HeaderText="Estado" Visible = "false"  />
                <asp:BoundField DataField="Pla_Poa_Id" HeaderText="Pla_Poa_Id"  Visible = "false" />
			    <asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"  Visible = "false" />
                <asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id"   Visible = "false"/>
			</Columns>
    </asp:GridView>
    </asp:Panel>
	<%--[X] GridView de Pla_Mov --%>

    <%--[O] FormView de Pla_Mov --%>
    <asp:Panel runat="server" ID="pfvPla_Mov" GroupingText="Movimiento">
    <koala:FormViewSetim ID="fvPla_Mov" runat="server" DataSourceID="odsfvPla_Mov" 
            oniteminserting="fvPla_Mov_ItemInserting" 
            onitemdeleted="fvPla_Mov_ItemDeleted" 
            oniteminserted="fvPla_Mov_ItemInserted" 
            onitemupdated="fvPla_Mov_ItemUpdated"
			ondatabound="fvPla_Mov_DataBound" 
            onprerender="fvPla_Mov_PreRender"
			onitemupdating="fvPla_Mov_ItemUpdating"
			onitemdeleting="fvPla_Mov_ItemDeleting"
            DataKeyNames="Id"
			>
        <EmptyDataTemplate>Crear un primer movimiento: 
        </EmptyDataTemplate>
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
            <tr style="display:none">
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
            <tr>
            <td>Año:</td>
            <td><asp:DropDownList ID="ddlAnio" runat="server" 
                    DataSourceID="odsDominioAnio" DataTextField="Nombre" DataValueField="Nombre" 
                    onchange="ddlAnio_OnChange();"
                    /></td>
            </tr>
            <tr style="display:none">
                <td> Pla_Cta_Id </td>
                <td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server"   /></td>
            </tr>
			<tr >
                <td> Cuenta </td>
                <td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_CodigoTextBox"
                        BehaviorID="acxBID_Pla_Cta_CodigoTextBox"
                        TargetControlID="Pla_Cta_CodigoTextBox" 
                        ServiceMethod="acxPla_Cta_GetByAnioLikeCodigo_List" 
                        UseContextKey="True"
                        ContextKey=""
                        CompletionInterval="100"
                        MinimumPrefixLength="1"
                        OnClientItemSelected="acxPla_Cta_CodigoTextBox_Click"
                        EnableCaching ="false"
                        OnClientPopulating="acxPla_Cta_CodigoTextBox_Populating" 
                        FirstRowSelected="true"
                        />
				</td>
            </tr>
			<tr >
                <td> Cta_Nombre </td>
                <td>
                <asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server"  Width="35px" />
                <asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" CssClass="txtEdit"   Width="610px"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID="acxPla_Cta_NombreTextBox"
                    BehaviorID="acxBID_Pla_Cta_NombreTextBox"
                    TargetControlID="Pla_Cta_NombreTextBox"
                    ServiceMethod="acxPla_Cta_GetByAnioLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="1"
                    OnClientItemSelected="acxPla_Cta_NombreTextBox_Click" 
                    EnableCaching ="false"
                    OnClientPopulating="acxPla_Cta_NombreTextBox_Populating" 
                    FirstRowSelected="true"/>
				</td>
            </tr>
            <tr style="display:none">
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit" />
				</td>
            </tr>
			<tr >
                <td> Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  Width="650px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Tarea_NombreTextBox"
                    BehaviorID= "acxBIDPla_Tarea_NombreTextBox"
                    TargetControlID= "Pla_Tarea_NombreTextBox"
                    ServiceMethod= "acxPla_Tarea_GetByPla_Cta_IdLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="0"
                    OnClientItemSelected= "acxPla_Tarea_NombreTextBox_Click"
                    EnableCaching="false"
                    OnClientPopulated="OnClientPopulatedTarea" 
                    FirstRowSelected="true"/>
				</td>
            </tr>
			<tr style="display:none">
                <td> Pla_Poa_Id </td>                
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  CssClass="txtEdit"  />
			    </td>
            </tr>
            <tr >
                <td> Partida_Codigo </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_CodigoTextBox"
                    BehaviorID= "acxBIDPla_Partida_CodigoTextBox"
                    TargetControlID= "Pla_Partida_CodigoTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeCodigo_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="0"
                    EnableCaching="false"
                    OnClientItemSelected= "acxPla_Partida_CodigoTextBox_Click"
                    />
                Partida_Nombre: 
                <asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
				</td>
            </tr>
            <tr >
                <td> Valor Inicial</td>                
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
            <tr >
                <td> Saldo </td>                
				<td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
				</td>
            </tr>
            <%--Campos ocultos--%>
            <tr style="display:none">
                <td> Orden </td>                
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Doc_Tipo </td>                
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Doc_Fecha </td>                
				<td><asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
			<tr style="display:none">
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
            <tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" 
            ValidationGroup="vgPla_Mov"/>
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Panel runat="server" ID = "panelInsertTemplate" DefaultButton="InsertButton" >
			<table>
            <tr style="display:none">
                <td> Pla_Doc_Id </td>                
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
            <tr>
            <td>Año:</td>
            <td><asp:DropDownList ID="ddlAnio" runat="server" 
                    DataSourceID="odsDominioAnio" DataTextField="Nombre" DataValueField="Nombre" 
                    onchange="ddlAnio_OnChange();"
                    /></td>
            </tr>
            <tr style="display:none">
                <td> Pla_Cta_Id </td>
                <td><asp:TextBox ID="Pla_Cta_IdTextBox" runat="server"   /></td>
            </tr>
			<tr >
                <td> Cuenta </td>
                <td><asp:TextBox ID="Pla_Cta_CodigoTextBox" runat="server" CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Codigo" runat="server" 
                    ControlToValidate="Pla_Cta_CodigoTextBox"
                    ErrorMessage="El campo Pla_Cta_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                    ...<ajax:AutoCompleteExtender 
                        runat="server" ID="acxPla_Cta_CodigoTextBox"
                        BehaviorID="acxBID_Pla_Cta_CodigoTextBox"
                        TargetControlID="Pla_Cta_CodigoTextBox" 
                        ServiceMethod="acxPla_Cta_GetByAnioLikeCodigo_List" 
                        UseContextKey="True"
                        ContextKey=""
                        CompletionInterval="100"
                        MinimumPrefixLength="1"
                        OnClientItemSelected="acxPla_Cta_CodigoTextBox_Click"
                        EnableCaching ="false"
                        OnClientPopulating="acxPla_Cta_CodigoTextBox_Populating" 
                        FirstRowSelected="true"
                        />
				</td>
            </tr>
			<tr >
                <td> Cta_Nombre </td>
                <td>
                <asp:TextBox ID="Pla_Cta_NivelTextBox" runat="server"  Width="35px" />
                <asp:TextBox ID="Pla_Cta_NombreTextBox" runat="server" CssClass="txtEdit"   Width="610px"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Cta_Nombre" runat="server" 
                    ControlToValidate="Pla_Cta_NombreTextBox"
                    ErrorMessage="El campo Pla_Cta_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID="acxPla_Cta_NombreTextBox"
                    BehaviorID="acxBID_Pla_Cta_NombreTextBox"
                    TargetControlID="Pla_Cta_NombreTextBox"
                    ServiceMethod="acxPla_Cta_GetByAnioLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="1"
                    OnClientItemSelected="acxPla_Cta_NombreTextBox_Click" 
                    EnableCaching ="false"
                    OnClientPopulating="acxPla_Cta_NombreTextBox_Populating" 
                    FirstRowSelected="true"/>
				</td>
            </tr>
            <tr style="display:none">
                <td> Pla_Tarea_Id </td>                
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  CssClass="txtEdit" />
				</td>
            </tr>
			<tr >
                <td> Tarea_Nombre </td>                
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  CssClass="txtEditNombreLargo" TextMode="MultiLine"  Width="650px" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Tarea_Nombre" runat="server" 
                    ControlToValidate="Pla_Tarea_NombreTextBox"
                    ErrorMessage="El campo Pla_Tarea_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Tarea_NombreTextBox"
                    BehaviorID= "acxBIDPla_Tarea_NombreTextBox"
                    TargetControlID= "Pla_Tarea_NombreTextBox"
                    ServiceMethod= "acxPla_Tarea_GetByPla_Cta_IdLikeNombre_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="0"
                    OnClientItemSelected= "acxPla_Tarea_NombreTextBox_Click"
                    EnableCaching="false"
                    OnClientPopulated="OnClientPopulatedTarea" 
                    FirstRowSelected="true"/>
				</td>
            </tr>
			<tr style="display:none">
                <td> Pla_Poa_Id </td>                
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  CssClass="txtEdit"  />
			    </td>
            </tr>
            <tr >
                <td> Partida </td>                
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Codigo" runat="server" 
                    ControlToValidate="Pla_Partida_CodigoTextBox"
                    ErrorMessage="El campo Pla_Partida_Codigo es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                ...<ajax:AutoCompleteExtender 
                    runat="server" ID= "acxPla_Partida_CodigoTextBox"
                    BehaviorID= "acxBIDPla_Partida_CodigoTextBox"
                    TargetControlID= "Pla_Partida_CodigoTextBox"
                    ServiceMethod= "acxPla_Partida_GetByLikeCodigo_List"
                    UseContextKey="True" 
                    ContextKey=""
                    CompletionInterval="100"
                    MinimumPrefixLength="0"
                    EnableCaching="false"
                    OnClientItemSelected= "acxPla_Partida_CodigoTextBox_Click"
                    />
				Partida_Nombre: 
                <asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqPla_Partida_Nombre" runat="server" 
                    ControlToValidate="Pla_Partida_NombreTextBox"
                    ErrorMessage="El campo Pla_Partida_Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>
                </td>
            </tr>
            <tr >
                <td> Valor Inicial</td>                
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
            <tr >
                <td> Saldo</td>                
				<td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
			<tr >
                <td> Valor </td>                
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  CssClass="txtEditValor"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqValor" runat="server" 
                    ControlToValidate="ValorTextBox"
                    ErrorMessage="El campo Valor es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgPla_Mov"/>

				</td>
            </tr>
            <%--Campos ocultos--%>
            <tr style="display:none">
                <td> Orden </td>                
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
            <tr style="display:none">
                <td> Tipo </td>                
				<td><asp:TextBox ID="TipoTextBox" runat="server" Text='<%# Bind("Tipo") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Doc_Tipo </td>                
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
			<tr  style="display:none">
                <td> Pla_Doc_Fecha </td>                
				<td><asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
			<tr style="display:none">
                <td> Pla_Partida_Id </td>                
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  CssClass="txtEdit"  />
					</td>
            </tr>
            <tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Codigo </td>                
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
			<tr style="display:none">
                <td> Estado </td>                
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			</table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" 
            Text="Insertar" ValidationGroup="vgPla_Mov"/>
            &nbsp;
            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="NewButton">
            <table>
            <tr style="display:none">
                <td> Codigo </td>
				<td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
            <tr >
                <td> Orden </td>
				<td><asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>'  ReadOnly="true"  CssClass="txtItem" />
                    Fecha: 
                    <asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Fecha","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" />
                </td>
			</tr>
            <tr>
                <td> Planificación </td>
                <td>
                    <asp:GridView ID="gvPla_Cta_Arbol" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="odsPla_Cta_Arbol" Width="805px"
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
                        SelectMethod="GetByAnioArbolPla_Tarea_Id" TypeName="FEL.PLA.BO_Pla_Cta" 
                        onselecting="odsPla_Cta_Arbol_Selecting">
                        <SelectParameters>
                            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                            <asp:ControlParameter ControlID="Pla_Tarea_IdTextBox" Name="p_Pla_Tarea_Id" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>

                </td>
            </tr>
            <tr >
                <td> Tarea_Nombre </td>
				<td><asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  
                    ReadOnly="true"  CssClass="txtItem" TextMode="MultiLine" Height="50px"  Width="800px"/></td>
			</tr>
			<tr style="display:none">
                <td> Id </td>
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>

			<tr style="display:none">
                <td> Pla_Poa_Id </td>
				<td><asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" Text='<%# Bind("Pla_Poa_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Pla_Doc_Id </td>
				<td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			</tr>
			
			<tr style="display:none">
                <td> Estado </td>
				<td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Pla_Tarea_Id </td>
				<td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>

			<tr style="display:none">
                <td> Pla_Partida_Id </td>
				<td><asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" Text='<%# Bind("Pla_Partida_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Partida_Codigo </td>
				<td><asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Partida_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" />
				    Partida_Nombre: 
				    <asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" Text='<%# Bind("Pla_Partida_Nombre") %>'  ReadOnly="true"  CssClass="txtItem" />
                </td>
            </tr>
            <tr >
                <td> Valor Inicial</td>                
				<td><asp:TextBox ID="Valor_InicialTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
            <tr >
                <td> Saldo</td>                
				<td><asp:TextBox ID="Valor_SumaTextBox" runat="server" Text="0"  CssClass="txtItemValor"  />
				</td>
            </tr>
            <tr >
                <td> Valor </td>
				<td><asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>'  
                ReadOnly="true"  CssClass="txtItemValor"  /></td>
			</tr>
			<tr style="display:none">
                <td> Pla_Doc_Tipo </td>
				<td><asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Tipo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>

			</table>
            <%--<asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />--%>
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            &nbsp;
            <asp:Button ID="NewButton" RunAt="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorPla_Mov" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoPla_Mov" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="vgPla_Mov"/>
    </asp:Panel>
	<%--[X] FormView de Pla_Mov --%>

</ContentTemplate>
</asp:UpdatePanel>

<%--[O]INICIO Fuentes de datos de Pla_Doc --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Doc" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByArea_Codigo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByArea_Codigo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Area_Codigo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByCodigo" runat="server" 
        SelectMethod="GetByCodigo" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByRangoFecha_Solicita" runat="server" 
        SelectMethod="GetByRangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_Codigo" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_Codigo" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="lbCabeceraTipo" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="ddlCabeceraArea" Name="p_Area_Codigo" PropertyName="SelectedValue" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_LikeDescripcion" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_LikeDescripcion" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="lbCabeceraTipo" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="ddlCabeceraArea" Name="p_Area_Codigo" PropertyName="SelectedValue" Type="string" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Descripcion" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_Area_Codigo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByTipo_Area_Codigo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="lbCabeceraTipo" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="ddlCabeceraArea" Name="p_Area_Codigo" PropertyName="SelectedValue" Type="string" />
		<asp:ControlParameter ControlID="tbFechaIni" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFechaFin" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_RangoFecha_Solicita" runat="server" 
        SelectMethod="GetByTipo_RangoFecha_Solicita" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="lbCabeceraTipo" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFechaIni" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFechaFin" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Doc_GetByTipo_RangoFecha_Solicita_LikeDescripcion" runat="server" 
        SelectMethod="GetByTipo_RangoFecha_Solicita_LikeDescripcion" 
        TypeName="FEL.PLA.BO_Pla_Doc">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="lbCabeceraTipo" Name="p_Tipo" PropertyName="Text" Type="string" />
		<asp:ControlParameter ControlID="tbFechaIni" Name="p_Fecha_Solicita_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFechaFin" Name="p_Fecha_Solicita_Fin" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFiltro" Name="p_Descripcion" PropertyName="Text" Type="string" />
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
    <%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Doc" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Doc"
        DataObjectTypeName="Pla_Doc"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Doc_Inserted" 
        onupdated="odsfvPla_Doc_Updated" 
		ondeleted="odsfvPla_Doc_Deleted" onselected="odsfvPla_Doc_Selected">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Doc" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Pla_Doc --%>

<%--[O]INICIO Fuentes de datos de Pla_Mov --%>
<div>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Mov_GetByPla_Doc_Id" runat="server" 
        SelectMethod="GetByPla_Doc_Id" 
        TypeName="FEL.PLA.BO_Pla_Mov" >
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="fvPla_Doc" Name="p_Pla_Doc_Id" PropertyName="SelectedValue" Type="Int32" />
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
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
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