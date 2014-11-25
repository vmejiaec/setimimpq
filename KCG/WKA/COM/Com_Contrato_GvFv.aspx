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
	$('#ctl00_ContentPlaceHolder1_fvCom_Contrato_Pla_Doc_Valor_SolicitaTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
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
                        <asp:ListItem Text = "Código" Value="Codigo" ></asp:ListItem>
			            <asp:ListItem Text = "Nombre" Value="Pla_Tarea_Nombre" ></asp:ListItem>
                        <asp:ListItem Text = "Código Sercop" Value="Codigo_Sercop" ></asp:ListItem>
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
			<asp:BoundField DataField="Codigo_Sercop"           HeaderText="Codigo Sercop"   SortExpression="Codigo_Sercop" />            
            <asp:BoundField DataField="Pla_Doc_CPC_Codigo"      HeaderText="Codigo CPC"     SortExpression="Pla_Doc_CPC_Codigo" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Pla_Doc_PAC_Linea"       HeaderText="Linea PAC"      SortExpression="Pla_Doc_PAC_Linea" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Estado"                  HeaderText="Estado"         SortExpression="Estado" ItemStyle-HorizontalAlign="Center" />

            <asp:BoundField DataField="Com_Procedimiento_Tipo"  HeaderText="Tipo"           SortExpression="Com_Procedimiento_Tipo" ItemStyle-HorizontalAlign="Center" Visible = "false" />
            <asp:BoundField DataField="Fecha_Cierre_Rec_Ofertas" HeaderText="Fecha Cierre"   DataFormatString="{0:d}" SortExpression="Fecha_Cierre_Rec_Ofertas" Visible = "false" />            
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
<script type="text/javascript" >
    function acxPer_Personal_Nombre_AdminTextBox_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_Id_AdminTextBox');
        xId.value = params[0];
    }
    function acxPer_Personal_Nombre_Resp_ExpTextBox_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Per_Personal_Resp_ExpTextBox');
        xId.value = params[0];
    }
    function acxPar_Razon_Social_Numero_ContratistaTextBox_Click(source, eventArgs) {
        //alert(" Key : " + eventArgs.get_text() + "  Value :  " + eventArgs.get_value());
        var params = new Array();
        params = eventArgs.get_value().split('||');
        // 0 Id
        var xId = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Par_Razon_Social_Id_ContratistaTextBox');
        xId.value = params[0];
        // 2 Id
        var xNombre = document.getElementById('ctl00_ContentPlaceHolder1_fvCom_Contrato_Par_Razon_Social_Nombre_ContratistaTextBox');
        xNombre.value = params[2];
    }
    //

</script>
</div>
<%--[X]FIN Javascript para manegar los campos de autocompletar --%>

    <%--[O] Barra del Reportes --%>
    <asp:Panel runat="server" ID="pReportes" GroupingText="Reportes">
        <table>
        <tr>
            <td><asp:Button ID="btReportePerfil" runat="server" Text="Perfil de Proyecto" onclick="btReportePerfil_Click" /></td>
            <td>
                <p class="pTextoPagina">
                Para imprimir el perfil de proyecto 
                primero busque en la lista superior, luego seleccione pulsando el botón [...] y revise que contenga 
                la información requerida en los detalles del formulario.
                </p>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btReporteControl" runat="server" 
                    Text="Seguimiento de Proyectos" onclick="btReporteControl_Click" /></td>
            <td>
                <p class="pTextoPagina">
                El reporte de Seguimiento de Proyectos
                </p>
            </td>
        </tr>
        </table>
    </asp:Panel>
    <%--[X] Barra del Reportes --%>

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
                        <td>Categoria - PAC:</td>
                        <td>
                            <asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                            <asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="70px" />
                        </td>
			        </tr>
                    <tr>
                        <td>Código Sercop: </td>
                        <td>
                            <asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>' CssClass="txtEdit" />
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
                        <ajax:AutoCompleteExtender 
                            runat="server" ID= "acxPer_Personal_Nombre_AdminTextBox"
                            BehaviorID= "acxBIDPer_Personal_Nombre_AdminTextBox"
                            TargetControlID= "Per_Personal_Nombre_AdminTextBox"
                            ServiceMethod= "acxPer_Personal_GetByLikeNombre_List"
                            UseContextKey="True" 
                            ContextKey=""
                            CompletionInterval="0"
                            MinimumPrefixLength="3"
                            OnClientItemSelected= "acxPer_Personal_Nombre_AdminTextBox_Click"
                        />
                        <label class="pTextoPagina"> Ingresar al menos 3 letras. </label>
                    </td>
			    </tr>
                <tr >
                    <td> Presupuesto_Ref </td>
				    <td>
                        <asp:TextBox ID="Pla_Doc_Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Valor_Solicita") %>'  
                           ReadOnly="true" CssClass="txtItemValor" />
                        <label class="pTextoPagina"> Valor solicitado por el área requirente. </label>
                    </td>
			    </tr>
                <tr  style="display:none">
                    <td> Valor_Suma_Movs </td>
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
                <tr>
                    <td>Proc_Tipo</td>
                    <td>
                        <asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  
                            CssClass="txtItem" Width ="40px" /> 
                    </td>
                </tr>
			    <tr >
                    <td> Procedimiento </td>
				    <td>
                        <asp:DropDownList ID="ddlCom_Procedimiento_Nombre" runat="server" DataSourceID="odsgvCom_Procedimiento" CssClass="txtEdit" Width="470px"
                                DataTextField="Nombre"
                                DataValueField="Id"
                                SelectedValue='<%# Bind("Com_Procedimiento_Id") %>'>
                        </asp:DropDownList>
                    </td> 
			    </tr>
                <tr>
                    <td>Descripción:</td>
                    <td>
                        <asp:TextBox ID="Com_Procedimiento_DescTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Desc") %>'  
                            CssClass="txtEditNombre" Width="465px" />
                    </td>
                </tr>
                <tr >
                    <td> Cierre Ofertas </td>
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
                        <ajax:AutoCompleteExtender 
                            runat="server" ID= "acxPer_Personal_Nombre_Resp_ExpTextBox"
                            BehaviorID= "acxBIDPer_Personal_Nombre_Resp_ExpTextBox"
                            TargetControlID= "Per_Personal_Nombre_Resp_ExpTextBox"
                            ServiceMethod= "acxPer_Personal_GetByLikeNombre_List"
                            UseContextKey="True" 
                            ContextKey=""
                            CompletionInterval="0"
                            MinimumPrefixLength="3"
                            OnClientItemSelected= "acxPer_Personal_Nombre_Resp_ExpTextBox_Click"
                        />
                        <label class="pTextoPagina"> Ingresar al menos 3 letras. </label>
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

            <asp:Panel runat ="server" ID="pn05" GroupingText="5. Seguimiento">
                <table>
                    <tr >
                        <td> Estado_Portal </td>
				        <td>
				        <asp:DropDownList ID="Estado_PortalDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Portal"   
                                DataTextField="Nombre" 
                                DataValueField="Dominio" 
                                SelectedValue='<%# Bind("Estado_Portal") %>'>
                        </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td> Estado_Contratacion </td>
				        <td><asp:TextBox ID="Estado_ContratacionTextBox" runat="server" Text='<%# Bind("Estado_Contratacion") %>'  CssClass="txtEdit"  Width="600px"/>
                        </td>
					</tr>
                </table>
                <table>
			        <tr >
                        <td> Fecha_Inicio_Elabora_Pliegos </td>                
				        <td><asp:TextBox ID="Fecha_Inicio_Elabora_PliegosTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Elabora_Pliegos","{0:d}") %>'  CssClass="txtEdit"  />
				        <asp:Button runat="server" ID="btcexFecha_Inicio_Elabora_Pliegos" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Inicio_Elabora_Pliegos" TargetControlID="Fecha_Inicio_Elabora_PliegosTextBox" PopupButtonID="btcexFecha_Inicio_Elabora_Pliegos" />
				        <%--Validador--%>
                            <asp:RequiredFieldValidator ID="rqFecha_Inicio_Elabora_Pliegos" runat="server" 
                            ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox"
                            ErrorMessage="Fecha_Inicio_Elabora_Pliegos obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Inicio_Elabora_Pliegos" runat="server" 
                            ErrorMessage="Fecha no válida" 
                            ControlToValidate="Fecha_Inicio_Elabora_PliegosTextBox" 
                            Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				        </td>

                        <td> Fecha_Publicacion_Portal </td>                
				        <td><asp:TextBox ID="Fecha_Publicacion_PortalTextBox" runat="server" Text='<%# Bind("Fecha_Publicacion_Portal","{0:d}") %>'  CssClass="txtEdit"  />
				        <asp:Button runat="server" ID="btcexFecha_Publicacion_Portal" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Publicacion_Portal" TargetControlID="Fecha_Publicacion_PortalTextBox" PopupButtonID="btcexFecha_Publicacion_Portal" />
				        <%--Validador--%>
                            <asp:RequiredFieldValidator ID="rqFecha_Publicacion_Portal" runat="server" 
                            ControlToValidate="Fecha_Publicacion_PortalTextBox"
                            ErrorMessage="Fecha_Publicacion_Portal obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Publicacion_Portal" runat="server" 
                            ErrorMessage="Fecha no válida" 
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
                            ErrorMessage="Fecha_Calificaciones obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Calificaciones" runat="server" 
                            ErrorMessage="Fecha no válida" 
                            ControlToValidate="Fecha_CalificacionesTextBox" 
                            Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				        </td>

                        <td> Fecha_Estimada_Adjudicacion </td>                
				        <td><asp:TextBox ID="Fecha_Estimada_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Estimada_Adjudicacion","{0:d}") %>'  CssClass="txtEdit"  />
				        <asp:Button runat="server" ID="btcexFecha_Estimada_Adjudicacion" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Estimada_Adjudicacion" TargetControlID="Fecha_Estimada_AdjudicacionTextBox" PopupButtonID="btcexFecha_Estimada_Adjudicacion" />
				        <%--Validador--%>
                            <asp:RequiredFieldValidator ID="rqFecha_Estimada_Adjudicacion" runat="server" 
                            ControlToValidate="Fecha_Estimada_AdjudicacionTextBox"
                            ErrorMessage="Fecha_Estimada_Adjudicacion obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Estimada_Adjudicacion" runat="server" 
                            ErrorMessage="Fecha no válida" 
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
                            ErrorMessage="Fecha_Adjudicacion obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Adjudicacion" runat="server" 
                            ErrorMessage="Fecha no válida" 
                            ControlToValidate="Fecha_AdjudicacionTextBox" 
                            Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				        </td>
                        <td> Fecha_Juridico </td>                
				        <td><asp:TextBox ID="Fecha_JuridicoTextBox" runat="server" Text='<%# Bind("Fecha_Juridico","{0:d}") %>'  CssClass="txtEdit"  />
				        <asp:Button runat="server" ID="btcexFecha_Juridico" Text="."/>
				        <ajax:CalendarExtender runat="server" ID="cexFecha_Juridico" TargetControlID="Fecha_JuridicoTextBox" PopupButtonID="btcexFecha_Juridico" />
				        <%--Validador--%>
                            <asp:RequiredFieldValidator ID="rqFecha_Juridico" runat="server" 
                            ControlToValidate="Fecha_JuridicoTextBox"
                            ErrorMessage="Fecha_Juridico obligatorio" 
                            Text="X" Display="Dynamic" ValidationGroup="vgCom_Contrato"/>
					        <asp:RangeValidator ID="rvFecha_Juridico" runat="server" 
                            ErrorMessage="Fecha no válida" 
                            ControlToValidate="Fecha_JuridicoTextBox" 
                            Type="Date" MinimumValue="01/01/2000" MaximumValue="01/01/2020" ValidationGroup="vgCom_Contrato"/>
				        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn06" GroupingText="6. Datos del Contrato">
                <table>			    
			        <tr style="display:none">
                        <td> Par_Razon_Social_Id_Contratista </td>
				        <td><asp:TextBox ID="Par_Razon_Social_Id_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Id_Contratista") %>'  
                            CssClass="txtItem" /></td>
			        </tr>
                    <tr >
                        <td> RUC del Contratista </td>
				        <td>
                            <asp:TextBox ID="Par_Razon_Social_Numero_ContratistaTextBox" runat="server" Text='<%# Bind("Par_Razon_Social_Numero_Contratista") %>'  
                                 CssClass="txtEdit" />
                            <label class="pTextoPagina"> Ingresar al menos 3 dígitos. (000 indica ninguno)</label>
                            <asp:RegularExpressionValidator ID="revRUC" runat="server" 
                                ErrorMessage="RUC no válido" 
                                ValidationExpression="^[0-2][0-9][0-69]\d{7}[0][0][1-9]$"
                                ControlToValidate ="Par_Razon_Social_Numero_ContratistaTextBox"
                                ValidationGroup="vgCom_Contrato"
                            />
                            <ajax:AutoCompleteExtender 
                                runat="server" ID= "acxPar_Razon_Social_Numero_ContratistaTextBox"
                                BehaviorID= "acxBIDPar_Razon_Social_Numero_ContratistaTextBox"
                                TargetControlID= "Par_Razon_Social_Numero_ContratistaTextBox"
                                ServiceMethod= "acxPar_Razon_Social_GetByLikeNumero_List"
                                UseContextKey="True" 
                                ContextKey=""
                                CompletionInterval="0"
                                MinimumPrefixLength="3"
                                OnClientItemSelected= "acxPar_Razon_Social_Numero_ContratistaTextBox_Click"
                            />
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
                        <td>Categoria - PAC:</td>
                        <td>
                            <asp:TextBox ID="Pla_Doc_CPC_CodigoTextBox" runat="server" Text='<%# Bind("Pla_Doc_CPC_Codigo") %>'  ReadOnly="true"  CssClass="txtItem" Width="80px" />
                            <asp:TextBox ID="Pla_Doc_PAC_LineaTextBox" runat="server" Text='<%# Bind("Pla_Doc_PAC_Linea") %>'  ReadOnly="true"  CssClass="txtItem" Width="70px" />
                        </td>
			        </tr>
                    <tr>
                        <td>Código Sercop: </td>
                        <td>
                            <asp:TextBox ID="Codigo_SercopTextBox" runat="server" Text='<%# Bind("Codigo_Sercop") %>'  ReadOnly="true"  CssClass="txtItem" />
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
                        <asp:TextBox ID="Pla_Doc_Valor_SolicitaTextBox" runat="server" Text='<%# Bind("Pla_Doc_Valor_Solicita") %>'  
                           ReadOnly="true" CssClass="txtItemValor" />
                        <label class="pTextoPagina"> Valor solicitado por el área requirente. </label>
                    </td>
			    </tr>
                <tr  style="display:none">
                    <td> Valor_Suma_Movs </td>
				    <td>
                        <asp:TextBox ID="Valor_Suma_MovsTextBox" runat="server" Text='<%# Bind("Valor_Suma_Movs") %>'  
                           ReadOnly="true" CssClass="txtItemValor" />
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
                    <td> Procedimiento </td>
				    <td>
                        <asp:TextBox ID="Com_Procedimiento_NombreTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Nombre") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" Width="465px"/>
                        <asp:TextBox ID="Com_Procedimiento_TipoTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Tipo") %>'  
                            ReadOnly="true"  CssClass="txtItem" Width ="40px" />
                    </td>
			    </tr>
                <tr>
                    <td>Descripción:</td>
                    <td>
                        <asp:TextBox ID="Com_Procedimiento_DescTextBox" runat="server" Text='<%# Bind("Com_Procedimiento_Desc") %>'  
                            ReadOnly="true"  CssClass="txtItemNombre" Width="465px" />
                    </td>
                </tr>
                <tr >
                    <td> Cierre Ofertas </td>
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

            <asp:Panel runat ="server" ID="pn05" GroupingText="5. Seguimiento">
                <table>
                    <tr >
                        <td> Estado_Portal </td>
				        <td>
				        <asp:DropDownList ID="Estado_PortalDropDownList" runat="server" DataSourceID="odsDominio_Com_Contrato_Estado_Portal"  Enabled="false" CssClass="txtItemDDL" 
                                DataTextField="Nombre" 
                                DataValueField="Dominio" 
                                SelectedValue='<%# Bind("Estado_Portal") %>'>
                        </asp:DropDownList>
                        </td>
                    </tr>
			        <tr >
                        <td> Estado_Contratacion </td>
				        <td><asp:TextBox ID="Estado_ContratacionTextBox" runat="server" Text='<%# Bind("Estado_Contratacion") %>'  ReadOnly="true"  CssClass="txtItem"  Width="600px"/>
                        </td>
					</tr>
                </table>
                <table>
			        <tr >
                        <td> Fecha_Inicio_Elabora_Pliegos </td>
				        <td><asp:TextBox ID="Fecha_Inicio_Elabora_PliegosTextBox" runat="server" Text='<%# Bind("Fecha_Inicio_Elabora_Pliegos","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
						
                        <td> Fecha_Publicacion_Portal </td>
				        <td><asp:TextBox ID="Fecha_Publicacion_PortalTextBox" runat="server" Text='<%# Bind("Fecha_Publicacion_Portal","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
					</tr>
			        <tr >
                        <td> Fecha_Calificaciones </td>
				        <td><asp:TextBox ID="Fecha_CalificacionesTextBox" runat="server" Text='<%# Bind("Fecha_Calificaciones","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
						
                        <td> Fecha_Estimada_Adjudicacion </td>
				        <td><asp:TextBox ID="Fecha_Estimada_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Estimada_Adjudicacion","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
					</tr>
			        <tr >
                        <td> Fecha_Adjudicacion </td>
				        <td><asp:TextBox ID="Fecha_AdjudicacionTextBox" runat="server" Text='<%# Bind("Fecha_Adjudicacion","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
						
                        <td> Fecha_Juridico </td>
				        <td><asp:TextBox ID="Fecha_JuridicoTextBox" runat="server" Text='<%# Bind("Fecha_Juridico","{0:d}") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
			        </tr>
                </table>
            </asp:Panel>

            <asp:Panel runat ="server" ID="pn06" GroupingText="6. Datos del Contrato">
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
    <asp:Panel ID="Panel1" runat="server" GroupingText="Documentación Técnica:" CssClass="panCol2" Width="500px">
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
				<td>
                    <asp:DropDownList ID="ddlTiene" runat="server" SelectedValue='<%# Bind("Tiene") %>'>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>..</asp:ListItem>
                    </asp:DropDownList>
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
				<td>
                    <asp:DropDownList ID="ddlTiene" runat="server" SelectedValue='<%# Bind("Tiene") %>'>
                        <asp:ListItem>SI</asp:ListItem>
                        <asp:ListItem>NO</asp:ListItem>
                        <asp:ListItem>..</asp:ListItem>
                    </asp:DropDownList>
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
    <asp:Panel runat="server" ID="pfvCom_Contrato_Oferente" GroupingText="Oferente" >
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

    <%--[O] Barra del Reportes --%>
    <asp:Panel runat="server" ID="Panel3" GroupingText="Reportes de Ofertas">
        <table>
        <tr>
            <td><asp:Button ID="btReciboOferta" runat="server" Text="Recibo de Oferta" onclick="btReciboOferta_Click" /></td>
            <td>
                <p class="pTextoPagina">Recibo de la entrega del sobre de una oferta técnica.</p>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btActaOfertas" runat="server" Text="Acta de Ofertas" onclick="btActaOfertas_Click" /></td>
            <td>
                <p class="pTextoPagina">Acta de cierre de presentación de ofertas.</p>
            </td>
        </tr>
        <tr>
            <td><asp:Button ID="btCuadroOfertas" runat="server" Text="Cuadro de Ofertas" 
                    onclick="btCuadroOfertas_Click"  /></td>
            <td>
                <p class="pTextoPagina">Cuadro de las ofertas presentadas.</p>
            </td>
        </tr>
        </table>
    </asp:Panel>
    <%--[X] Barra del Reportes --%>

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
    <asp:ObjectDataSource ID="odsgvCom_Contrato_GetByPla_Doc_Codigo" runat="server" 
        SortParameterName = "sortExpression"
        SelectMethod="GetByPla_Doc_Codigo" 
        TypeName="FEL.COM.BO_Com_Contrato">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Pla_Doc_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
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
			<asp:ControlParameter ControlID="gvCom_Contrato" Name="p_Com_Contrato_Id" PropertyName="SelectedValue" Type="Int32" />
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

<%--[O]INICIO Fuentes de datos de Com_Procedimiento --%>
<div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvCom_Procedimiento" runat="server" 
        SelectMethod="Get" 
        SortParameterName = "sortExpression"
        TypeName="FEL.COM.BO_Com_Procedimiento" >
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</div>
<%--[O]FIN Fuentes de datos de Com_Procedimiento --%>


</asp:Content>
