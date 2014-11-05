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
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Porcentaje_Anticipo_RefTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Porcentaje_Anticipo_ContratoTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
	
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
        <%--        
        <asp:Label ID="lbCabecera" runat="server" Text="Seleccionar el ... :"></asp:Label>
        <asp:DropDownList ID="ddlCabecera" runat="server" AutoPostBack="true" >
        </asp:DropDownList>
        --%>
    </asp:Panel>
	<%--[X] Cabecera--%>

    <%--[O] Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <table>
            <tr>
                <td>
                    Seleccionar el rango de fechas: 
                    <asp:TextBox ID="tbFechaIni" runat="server" Width="80px"></asp:TextBox> <ajax:CalendarExtender runat="server" ID="cextbFechaIni" TargetControlID="tbFechaIni"/>
                    - hasta -
                    <asp:TextBox ID="tbFechaFin" runat="server" Width="80px"></asp:TextBox> <ajax:CalendarExtender runat="server" ID="cextbFechaFin" TargetControlID="tbFechaFin"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbFiltro" runat="server" Text="Criterio: "></asp:Label>
                    <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
                        <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			            <asp:ListItem Text = "Nombre" Value="Pla_Tarea_Nombre" ></asp:ListItem>
                        <asp:ListItem Text = "Codigo Sercop" Value="Codigo_Sercop" ></asp:ListItem>
		            </asp:DropDownList>
                </td>
            </tr>
        </table>
    </asp:Panel>
	<%--[X] Filtro--%>

    <%--[O] GridView de Com_Contrato --%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvCom_Contrato" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_GetByRangoFecha_Crea" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Fecha_Crea"              HeaderText="Fecha Crea"     DataFormatString="{0:d}" SortExpression="Fecha_Crea" />
            <asp:BoundField DataField="Pla_Doc_Codigo"          HeaderText="Form Inic."     SortExpression="Pla_Doc_Codigo" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Pla_Cta_Codigo"          HeaderText="Cta"            SortExpression="Pla_Cta_Codigo" />
			<asp:BoundField DataField="Pla_Tarea_Codigo"        HeaderText="Tarea"          SortExpression="Pla_Tarea_Codigo" ItemStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="Pla_Tarea_Nombre"        HeaderText="Tarea_Nombre"   SortExpression="Pla_Tarea_Nombre" ItemStyle-Width="350px"/>
            <asp:BoundField DataField="Com_Procedimiento_Tipo"  HeaderText="Tipo"           SortExpression="Com_Procedimiento_Tipo" ItemStyle-HorizontalAlign="Center" />
			<asp:BoundField DataField="Codigo_Sercop"           HeaderText="Codigo Sercop"   SortExpression="Codigo_Sercop" />            
            <asp:BoundField DataField="Pla_Doc_CPC_Codigo"      HeaderText="Codigo CPC"     SortExpression="Pla_Doc_CPC_Codigo" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Pla_Doc_PAC_Linea"       HeaderText="Linea PAC"      SortExpression="Pla_Doc_PAC_Linea" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Estado"                  HeaderText="Estado"         SortExpression="Estado" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Fecha_Cierre_Rec_Ofertas" HeaderText="Fecha Cierre"   DataFormatString="{0:d}" SortExpression="Fecha_Cierre_Rec_Ofertas" />
            
            <asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id"  Visible = "false" />
            <asp:BoundField DataField="Com_Procedimiento_Id" HeaderText="Com_Procedimiento_Id"  Visible = "false" />
            <asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id" Visible = "false" />
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
    <koala:FormViewSetim ID="fvCom_Contrato" runat="server" 
            DataSourceID="odsfvCom_Contrato" 
            DataKeyNames="Id"
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

            <asp:Panel runat="server" ID="pn01" GroupingText="1. Proceso">
                <table>
                    <tr style="display:none">
                        <td> Id </td>
				        <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
                        <td> Pla_Doc_Id </td>
				        <td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
			        </tr>
                    <tr >
                        <td> Form Inicio: </td>
				        <td>
                            <asp:TextBox ID="Pla_Doc_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
                    </tr>
                    <tr >
                        <td> Fecha_Crea </td>
				        <td>
                            <asp:TextBox ID="Fecha_CreaTextBox" runat="server" Text='<%# Bind("Fecha_Crea","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
                        <td> Estado </td>
				        <td>
				        <asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado"   CssClass="txtEdit" 
                                DataTextField="Nombre" 
                                DataValueField="Dominio" 
                                SelectedValue='<%# Bind("Estado") %>'>
                        </asp:DropDownList>
                        </td>
			        </tr>
                    <tr>
                        <td>Código Sercop: </td>
                        <td>
                            <asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  ReadOnly="true"  CssClass="txtEdit" />
                        </td>
                        <td>Categoria - PAC:</td>
                        <td>
                            <asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                            <asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="70px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel runat ="server" ID="pn02" GroupingText="2. Planificación">
            <table>
                <tr style="display:none">
                    <td> Pla_Tarea_Id </td>
				    <td>
                        <asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  
                            ReadOnly="true"  CssClass="txtItem" />
                    </td>
			    </tr>
                <tr>
                    <td> Ctas </td>
                    <td>
                        <asp:GridView ID="gvPla_Cta_Arbol" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="odsPla_Cta_Arbol"
                            AlternatingRowStyle-CssClass="alternatingrowstyle" HeaderStyle-CssClass="headerstyle" Width="680px">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id"  Visible="False" />
                                <asp:BoundField DataField="Anio" HeaderText="Anio"  Visible="False" />
                                <asp:BoundField DataField="Codigo" HeaderText="Cta Codigo" />
                                <asp:BoundField DataField="Nivel" HeaderText="Cta Nivel" />
                                <asp:BoundField DataField="Nombre" HeaderText="Cta Nombre" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" Visible="False" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado"  Visible="False" />
                            </Columns>
                            <EmptyDataTemplate>
                                <p class="pTextoPagina">
                                No se ha asignado una Tarea a la Solicitud.
                                </p>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <asp:ObjectDataSource ID="odsPla_Cta_Arbol" runat="server" 
                            SelectMethod="GetByAnioArbolPla_Tarea_Id" TypeName="FEL.PLA.BO_Pla_Cta" 
                            SortParameterName = "sortExpression">
                            <SelectParameters>
                                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                                <asp:ControlParameter ControlID="Pla_Tarea_IdTextBox" Name="p_Pla_Tarea_Id" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
			    <tr >
                    <td> Tarea_Codigo </td>
				    <td>
                    <asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                    </td>
				</tr>
			    <tr >
                    <td> Tarea_Nombre <br /> Objeto del Contrato </td>
				    <td>
                        <asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" Width="680px" Height="50px"/>
                    </td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn03" GroupingText="3. Información Pre Contractual">
            <table>
                <tr style="display:none">
                    <td> Per_Personal_Id_Admin </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Id_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Admin") %>'  
                            CssClass="txtItem" />
                    </td>
			    </tr>
                <tr >
                    <td> Administrador </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Admin") %>'  
                            CssClass="txtEditNombre" />
                    </td>
			    </tr>
                <tr >
                    <td> Presupuesto_Ref </td>
				    <td>
                        <asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  
                           ReadOnly="true" CssClass="txtItemValor" />
                    </td>
			    </tr>
                <tr >
                    <td> Anticipo_Ref </td>
				    <td>
                        <asp:TextBox ID="Porcentaje_Anticipo_RefTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Ref") %>'
                            CssClass="txtEditValor"  Width="80px" />
                        %
                    </td>
			    </tr>
			    <tr >
                    <td> Plazo_Ref </td>
				    <td>
                        <asp:TextBox ID="Plazo_RefTextBox" runat="server" Text='<%# Bind("Plazo_Ref") %>'  
                            CssClass="txtEditValor" Width="80px" />
                        Días
                    </td>
			    </tr>
                <tr style="display:none">
                    <td> Com_Procedimiento_Id </td>
				    <td>
                        <asp:TextBox ID="Com_Procedimiento_IdTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Id") %>' 
                            CssClass="txtItem" />
                    </td>
			    </tr>
			    <tr >
                    <td> Procedimiento_Nombre </td>
				    <td>
                        <asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  
                            CssClass="txtItem" Width ="40px" />
                        <asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  
                            CssClass="txtEditNombre" Width="390px"/>
                    </td>
			    </tr>
                <tr >
                    <td> Fecha_Cierre_Rec_Ofertas </td>
				    <td>
                        <asp:TextBox ID="Fecha_Cierre_Rec_OfertasTextBox" runat="server" Text='<%# Bind("Fecha_Cierre_Rec_Ofertas","{0:d}") %>'  
                            CssClass="txtEdit" />
                        <asp:Button runat="server" ID="btcexFecha_Cierre_Rec_Ofertas" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Cierre_Rec_Ofertas" TargetControlID="Fecha_Cierre_Rec_OfertasTextBox" PopupButtonID="btcexFecha_Cierre_Rec_Ofertas" />
                    </td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn04" GroupingText="4. Responsables">
            <table>
                <tr style="display:none">
                    <td> Per_Personal_Resp_Exp </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Resp_Exp") %>'  
                            CssClass="txtItem" />
                    </td>
			    </tr>
                <tr >
                    <td> Responsable Expediente </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Resp_Exp") %>'  
                            CssClass="txtEditNombre" />
                    </td>
				</tr>
			    <tr style="display:none">
                    <td> Per_Personal_Id_Solicita </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  
                            ReadOnly="true" CssClass="txtItem" />
                    </td>
				</tr>
			    <tr >
                    <td> Personal_Solicita </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  
                            ReadOnly="true" CssClass="txtItemNombre" />
                    </td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn05" GroupingText="5. Datos del Contrato">
                <table>			    
			        <tr style="display:none">
                        <td> Par_Razon_Social_Id_Contratista </td>
				        <td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  
                            CssClass="txtItem" /></td>
			        </tr>
                    <tr >
                        <td> Número de RUC Contratista </td>
				        <td>
                            <asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  
                                 CssClass="txtEdit" />
                        </td>
			        </tr>
                    <tr >
                        <td> Nombre Contratista </td>
				        <td>
                            <asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  
                                CssClass="txtEditNombre" />
                        </td>
			        </tr>
			        
			        <tr >
                        <td> Valor_Contrato </td>
				        <td>
                            <asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  
                                CssClass="txtEditValor" />
                        </td>
			        </tr>
                    <tr >
                        <td> Anticipo_Contrato </td>
				        <td>
                            <asp:TextBox ID="Porcentaje_Anticipo_ContratoTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Contrato") %>'  
                                CssClass="txtEditValor" Width="80px" />
                            %
                        </td>
			        </tr>
			        <tr >
                        <td> Plazo_Contrato </td>
				        <td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  
                            CssClass="txtEditValor" Width="80px" />
                            Días.
                        </td>
					</tr>
			        <tr >
                        <td> Observaciones </td>
				        <td>
                            <asp:TextBox ID="Desc_ContrataTextBox" runat="server" Text='<%# Bind("Desc_Contrata") %>'  
                                CssClass="txtEditDescripcion" TextMode="MultiLine" />
                        </td>
			        </tr>
                    <tr >
                        <td> Fecha Incio Contrato </td>
				        <td>
                            <asp:TextBox ID="Fecha_Inicio_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Contrato","{0:d}") %>'
                                ReadOnly="true"  CssClass="txtItem"  />
                        </td>
			        </tr>
			    </table>
            </asp:Panel>

            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" ValidationGroup="vgCom_Contrato"/>
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
            </asp:Panel>
        </EditItemTemplate>
        <ItemTemplate>
            <asp:Panel runat="server" ID="panelItemTemplate" DefaultButton="EditButton">

            <asp:Panel runat="server" ID="pn01" GroupingText="1. Proceso">
                <table>
                    <tr style="display:none">
                        <td> Id </td>
				        <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
                        <td> Pla_Doc_Id </td>
				        <td><asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" Text='<%# Bind("Pla_Doc_Id") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
			        </tr>
                    <tr >
                        <td> Form Inicio: </td>
				        <td>
                            <asp:TextBox ID="Pla_Doc_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
                    </tr>
                    <tr >
                        <td> Fecha_Crea </td>
				        <td>
                            <asp:TextBox ID="Fecha_CreaTextBox" runat="server" Text='<%# Bind("Fecha_Crea","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
                        <td> Estado </td>
				        <td>
				        <asp:DropDownList ID="EstadoDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado"  Enabled="false" CssClass="txtItemDDL" 
                                DataTextField="Nombre" 
                                DataValueField="Dominio" 
                                SelectedValue='<%# Bind("Estado") %>'>
                        </asp:DropDownList>
                        </td>
			        </tr>
                    <tr>
                        <td>Código Sercop: </td>
                        <td>
                            <asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  ReadOnly="true"  CssClass="txtItem" />
                        </td>
                        <td>Categoria - PAC:</td>
                        <td>
                            <asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                            <asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="70px" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel runat ="server" ID="pn02" GroupingText="2. Planificación">
            <table>
                <tr style="display:none">
                    <td> Pla_Tarea_Id </td>
				    <td><asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
                <tr>
                    <td> Ctas </td>
                    <td>
                        <asp:GridView ID="gvPla_Cta_Arbol" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="odsPla_Cta_Arbol"
                            AlternatingRowStyle-CssClass="alternatingrowstyle" HeaderStyle-CssClass="headerstyle" Width="680px">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id"  Visible="False" />
                                <asp:BoundField DataField="Anio" HeaderText="Anio"  Visible="False" />
                                <asp:BoundField DataField="Codigo" HeaderText="Cta Codigo" />
                                <asp:BoundField DataField="Nivel" HeaderText="Cta Nivel" />
                                <asp:BoundField DataField="Nombre" HeaderText="Cta Nombre" />
                                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" Visible="False" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado"  Visible="False" />
                            </Columns>
                            <EmptyDataTemplate>
                                <p class="pTextoPagina">
                                No se ha asignado una Tarea a la Solicitud.
                                </p>
                            </EmptyDataTemplate>
                        </asp:GridView>

                        <asp:ObjectDataSource ID="odsPla_Cta_Arbol" runat="server" 
                            SelectMethod="GetByAnioArbolPla_Tarea_Id" TypeName="FEL.PLA.BO_Pla_Cta" 
                            SortParameterName = "sortExpression">
                            <SelectParameters>
                                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                                <asp:ControlParameter ControlID="Pla_Tarea_IdTextBox" Name="p_Pla_Tarea_Id" 
                                    PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
			    <tr >
                    <td> Tarea_Codigo </td>
				    <td>
                    <asp:TextBox ID="Pla_Tarea_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                    </td>
				</tr>
			    <tr >
                    <td> Tarea_Nombre <br /> Objeto del Contrato </td>
				    <td>
                        <asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" Text='<%# Bind("Pla_Tarea_Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" Width="680px" Height="50px"/>
                    </td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn03" GroupingText="3. Información Pre Contractual">
            <table>
                <tr style="display:none">
                    <td> Per_Personal_Id_Admin </td>
				    <td><asp:TextBox ID="Per_Personal_Id_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Admin") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
                <tr >
                    <td> Administrador </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_AdminTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Admin") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" />
                    </td>
			    </tr>
                <tr >
                    <td> Presupuesto_Ref </td>
				    <td>
                        <asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  
                            ReadOnly="true"  CssClass="txtItemValor" />
                    </td>
			    </tr>
                <tr >
                    <td> Anticipo_Ref </td>
				    <td>
                        <asp:TextBox ID="Porcentaje_Anticipo_RefTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Ref") %>'
                            ReadOnly="true"  CssClass="txtItemValor"  Width="80px" />
                        %
                    </td>
			    </tr>
			    <tr >
                    <td> Plazo_Ref </td>
				    <td>
                        <asp:TextBox ID="Plazo_RefTextBox" runat="server" Text='<%# Bind("Plazo_Ref") %>'  
                            ReadOnly="true"  CssClass="txtItemValor" Width="80px" />
                        Días
                    </td>
			    </tr>
                <tr style="display:none">
                    <td> Com_Procedimiento_Id </td>
				    <td>
                        <asp:TextBox ID="Com_Procedimiento_IdTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Id") %>' ReadOnly="true"  CssClass="txtItem" />
                    </td>
			    </tr>
			    <tr >
                    <td> Procedimiento_Nombre </td>
				    <td>
                        <asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  ReadOnly="true"  CssClass="txtItem" Width ="40px" />
                        <asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" Width="390px"/>
                    </td>
			    </tr>
                <tr >
                    <td> Fecha_Cierre_Rec_Ofertas </td>
				    <td><asp:TextBox ID="Fecha_Cierre_Rec_OfertasTextBox" runat="server" Text='<%# Bind("Fecha_Cierre_Rec_Ofertas","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn04" GroupingText="4. Responsables">
            <table>
                <tr style="display:none">
                    <td> Per_Personal_Resp_Exp </td>
				    <td><asp:TextBox ID="Per_Personal_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Resp_Exp") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			    </tr>
                <tr >
                    <td> Responsable Expediente </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_Resp_ExpTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Resp_Exp") %>'  
                        ReadOnly="true"  CssClass="txtItemNombre" />
                    </td>
				</tr>
			    <tr style="display:none">
                    <td> Per_Personal_Id_Solicita </td>
				    <td><asp:TextBox ID="Per_Personal_Id_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Solicita") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
				</tr>
			    <tr >
                    <td> Personal_Solicita </td>
				    <td>
                        <asp:TextBox ID="Per_Personal_Nombre_SolicitaTextBox" runat="server" Text='<%# Bind("Per_Personal_Nombre_Solicita") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" />
                    </td>
			    </tr>
            </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn05" GroupingText="5. Datos del Contrato">
                <table>			    
			        <tr style="display:none">
                        <td> Par_Razon_Social_Id_Contratista </td>
				        <td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			        </tr>
                    <tr >
                        <td> Número de RUC Contratista </td>
				        <td><asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			        </tr>
                    <tr >
                        <td> Nombre Contratista </td>
				        <td>
                            <asp:TextBox ID="Par_Razon_Social_Nombre_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Nombre_Contratista") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" />
                        </td>
			        </tr>
			        
			        <tr >
                        <td> Valor_Contrato </td>
				        <td>
                            <asp:TextBox ID="Valor_ContratoTextBox" runat="server" Text='<%# Bind("Valor_Contrato") %>'  ReadOnly="true"  CssClass="txtItemValor" />
                        </td>
			        </tr>
                    <tr >
                        <td> Anticipo_Contrato </td>
				        <td>
                            <asp:TextBox ID="Porcentaje_Anticipo_ContratoTextBox" runat="server" Text='<%# Bind("Porcentaje_Anticipo_Contrato") %>'  
                                ReadOnly="true"  CssClass="txtItemValor" Width="80px" />
                            %
                        </td>
			        </tr>
			        <tr >
                        <td> Plazo_Contrato </td>
				        <td><asp:TextBox ID="Plazo_ContratoTextBox" runat="server" Text='<%# Bind("Plazo_Contrato") %>'  
                            ReadOnly="true"  CssClass="txtItemValor" Width="80px" />
                            Días.
                        </td>
					</tr>
			        <tr >
                        <td> Observaciones </td>
				        <td>
                            <asp:TextBox ID="Desc_ContrataTextBox" runat="server" Text='<%# Bind("Desc_Contrata") %>'  
                                ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine" />
                        </td>
			        </tr>
                    <tr >
                        <td> Fecha Incio Contrato </td>
				        <td>
                            <asp:TextBox ID="Fecha_Inicio_ContratoTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Contrato","{0:d}") %>'
                                ReadOnly="true"  CssClass="txtItem"  />
                        </td>
			        </tr>                    
			    </table>
            </asp:Panel>

            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            </asp:Panel>
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgErrorCom_Contrato" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
        <asp:ValidationSummary ID="vsErrorResumen" runat="server" ValidationGroup="vgCom_Contrato"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato --%>

    <%--[O] GridView de Com_Contrato_DocTec --%>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Documentación Técnica:" CssClass="panCol2">
    <asp:GridView ID="gvCom_Contrato_DocTec" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_DocTec_GetByCom_Contrato_Id" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_DocTec_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Com_Contrato_Id" HeaderText="Com_Contrato_Id"   SortExpression="Com_Contrato_Id" Visible = "false"  />
			<asp:BoundField DataField="Nombre" HeaderText="Documento"   SortExpression="Nombre" />
			<asp:BoundField DataField="Tiene" HeaderText="Tiene"   SortExpression="Tiene (SI/NO)" />
			</Columns>
    </asp:GridView>	

    <%--[O] FormView de Com_Contrato_DocTec --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_DocTec" GroupingText="*" CssClass="panCol2">
    <koala:FormViewSetim ID="fvCom_Contrato_DocTec" runat="server" DataSourceID="odsfvCom_Contrato_DocTec" 
            oniteminserting="fvCom_Contrato_DocTec_ItemInserting" 
            onitemdeleted="fvCom_Contrato_DocTec_ItemDeleted" 
            oniteminserted="fvCom_Contrato_DocTec_ItemInserted" 
            onitemupdated="fvCom_Contrato_DocTec_ItemUpdated"
			ondatabound="fvCom_Contrato_DocTec_DataBound" 
            onprerender="fvCom_Contrato_DocTec_PreRender"
			onitemupdating="fvCom_Contrato_DocTec_ItemUpdating"
			onitemdeleting="fvCom_Contrato_DocTec_ItemDeleting"
			>
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>                
				<td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombre"  />
				
				</td>
            </tr>
			<tr >
                <td> Tiene </td>                
				<td><asp:TextBox ID="TieneTextBox" runat="server" Text='<%# Bind("Tiene") %>'  CssClass="txtEdit"  />
				
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
			<tr style="display:none">
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Nombre </td>                
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombre"  />
				
					</td>
            </tr>
			<tr >
                <td> Tiene </td>                
				<td><asp:TextBox ID="TieneTextBox" runat="server" Text='<%# Bind("Tiene") %>'  CssClass="txtEdit"  />
				
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
			<tr style="display:none">
                <td> Com_Contrato_Id </td>
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Nombre </td>
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombre" /></td>
							</tr>
			<tr >
                <td> Tiene </td>
				<td><asp:TextBox ID="TieneTextBox" runat="server" Text='<%# Bind("Tiene") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
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
        <asp:Label ID="lbFvMsgErrorCom_Contrato_DocTec" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
        <asp:Label ID="lbFvMsgInfoCom_Contrato_DocTec" runat="server" Text=">" CssClass="FvMensajeInfo"></asp:Label>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_DocTec --%>

    </asp:Panel>
    <%--[X] GridView de Com_Contrato_DocTec --%>

    <%--[O] GridView de Com_Contrato_Oferente --%>
    <asp:Panel ID="Panel2" runat="server" GroupingText="Listado de Oferentes" CssClass="panCol2">
    <asp:GridView ID="gvCom_Contrato_Oferente" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvCom_Contrato_Oferente_GetByCom_Contrato_Id" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
		AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
		PagerStyle-CssClass="pagerstyle"
		AllowSorting="true"
            onselectedindexchanged="gvCom_Contrato_Oferente_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  SortExpression="Id" />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   SortExpression="Nombre" ItemStyle-Width="250px" />
			<asp:BoundField DataField="Fecha_Recepcion" HeaderText="Fecha-Hora_Recepcion"   DataFormatString="{0:dd/MM/yyyy hh:mm}" SortExpression="Fecha_Recepcion" />
				<asp:BoundField DataField="Com_Contrato_Id" HeaderText="Com_Contrato_Id"   SortExpression="Com_Contrato_Id" Visible="false" />
			<asp:BoundField DataField="Per_Personal_Id_Recibe" HeaderText="Per_Personal_Id_Recibe"   SortExpression="Per_Personal_Id_Recibe" Visible="false"/>
			<asp:BoundField DataField="Comentario" HeaderText="Comentario"   SortExpression="Comentario" />
			</Columns>
    </asp:GridView>
    

    <%--[O] FormView de Com_Contrato_Oferente --%>
    <asp:Panel runat="server" ID="pfvCom_Contrato_Oferente" GroupingText="Oferente" CssClass="panCol2">
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombre" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Fecha-Hora_Recepcion </td>                
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:dd/MM/yyyy hh:mm}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Recepcion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Recepcion" TargetControlID="Fecha_RecepcionTextBox" PopupButtonID="btcexFecha_Recepcion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Recepcion" runat="server" 
                    ControlToValidate="Fecha_RecepcionTextBox"
                    ErrorMessage="El campo Fecha_Recepcion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					
				</td>
            </tr>
			<tr style="display:none">
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Per_Personal_Id_Recibe </td>                
				<td>
                    <asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  CssClass="txtEdit"  />
                </td>
            </tr>
			<tr >
                <td> Comentario </td>                
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  CssClass="txtEditNombre"  />
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  CssClass="txtEditNombre" TextMode="MultiLine"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					</td>
            </tr>
			<tr >
                <td> Fecha_Recepcion </td>                
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:dd/MM/yyyy hh:mm}") %>'  CssClass="txtEdit"  />
				<asp:Button runat="server" ID="btcexFecha_Recepcion" Text="."/>
				<ajax:CalendarExtender runat="server" ID="cexFecha_Recepcion" TargetControlID="Fecha_RecepcionTextBox" PopupButtonID="btcexFecha_Recepcion" />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqFecha_Recepcion" runat="server" 
                    ControlToValidate="Fecha_RecepcionTextBox"
                    ErrorMessage="El campo Fecha_Recepcion es obligatorio" 
                    Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato_Oferente"/>
					
				</td>
            </tr>
			<tr style="display:none">
                <td> Com_Contrato_Id </td>                
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr style="display:none">
                <td> Per_Personal_Id_Recibe </td>                
				<td><asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Comentario </td>                
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  CssClass="txtEditNombre"  />
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
				<td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombre" TextMode="MultiLine" /></td>
							</tr>
			<tr >
                <td> Fecha_Recepcion </td>
				<td><asp:TextBox ID="Fecha_RecepcionTextBox" runat="server" Text='<%# Bind("Fecha_Recepcion","{0:dd/MM/yyyy hh:mm}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Com_Contrato_Id </td>
				<td><asp:TextBox ID="Com_Contrato_IdTextBox" runat="server" Text='<%# Bind("Com_Contrato_Id") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr style="display:none">
                <td> Per_Personal_Id_Recibe </td>
				<td><asp:TextBox ID="Per_Personal_Id_RecibeTextBox" runat="server" Text='<%# Bind("Per_Personal_Id_Recibe") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
							</tr>
			<tr >
                <td> Comentario </td>
				<td><asp:TextBox ID="ComentarioTextBox" runat="server" Text='<%# Bind("Comentario") %>'  ReadOnly="true"  CssClass="txtItemNombre" /></td>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="vgCom_Contrato_Oferente"/>
    </asp:Panel>
	<%--[X] FormView de Com_Contrato_Oferente --%>

    </asp:Panel>
	<%--[X] GridView de Com_Contrato_Oferente --%>

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
			<asp:ControlParameter ControlID="tbFechaIni" Name="p_Fecha_Crea_Ini" PropertyName="Text" Type="DateTime" />
		<asp:ControlParameter ControlID="tbFechaFin" Name="p_Fecha_Crea_Fin" PropertyName="Text" Type="DateTime" />
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

<%--[O]INICIO Fuentes de datos de Com_Contrato_DocTec --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_DocTec" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_DocTec">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_DocTec_GetByCom_Contrato_Id" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByCom_Contrato_Id" 
        TypeName="FEL.COM.BO_Com_Contrato_DocTec">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="fvCom_Contrato" Name="p_Com_Contrato_Id" PropertyName="SelectedValue" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvCom_Contrato_DocTec_GetById" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetById" 
        TypeName="FEL.COM.BO_Com_Contrato_DocTec">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
	<%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvCom_Contrato_DocTec" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Contrato_DocTec"
        DataObjectTypeName="Com_Contrato_DocTec"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvCom_Contrato_DocTec_Inserted" 
        onupdated="odsfvCom_Contrato_DocTec_Updated" 
		ondeleted="odsfvCom_Contrato_DocTec_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvCom_Contrato_DocTec" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
<%--[X] FIN Fuentes de datos de Com_Contrato_DocTec --%>

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
			<asp:ControlParameter ControlID="fvCom_Contrato" Name="p_Com_Contrato_Id" PropertyName="SelectedValue" Type="Int32" />
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
