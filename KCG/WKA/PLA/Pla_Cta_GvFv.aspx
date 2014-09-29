<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Cta_GvFv.aspx.cs" 
Inherits="PLA_Pla_Cta_GvFv" %>

  <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>
    <div class="panCol3">
    <asp:Panel runat="server" ID="pcabAnio" GroupingText="Año">
        <asp:Label ID="lbFiltroAnio" runat="server" Text="Seleccionar el año:"></asp:Label>
        <asp:DropDownList ID="ddlFiltroAnio" runat="server" AutoPostBack="true">
<%--            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>--%>
        </asp:DropDownList>
    </asp:Panel>
    <asp:Panel runat = "server" ID="pgvPla_Cta" GroupingText="Listado de Cuentas">
    <%--Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <asp:Label ID="lbFiltro" runat="server" Text="Filtro"></asp:Label>
        <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
            <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			<asp:ListItem Text = "Codigo" Value="Codigo" ></asp:ListItem>
			<asp:ListItem Text = "Nombre" Value="Nombre" ></asp:ListItem>
			</asp:DropDownList>
    </asp:Panel>
    <%--GridView--%>
    <asp:Panel runat="server" GroupingText="Registros">
    <asp:GridView ID="gvPla_Cta" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Cta_GetByAnio" 
        SelectedRowStyle-CssClass="selectedrowstyle" 
        AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" 
        PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Cta_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
			<asp:BoundField DataField="Id" HeaderText="Id" Visible = "false"  />
			<asp:BoundField DataField="Anio" HeaderText="Anio"   />
			<asp:BoundField DataField="Codigo" HeaderText="Codigo"   />
			<asp:BoundField DataField="Nivel" HeaderText="Nivel"   />
			<asp:BoundField DataField="Nombre" HeaderText="Nombre"   />
			<asp:BoundField DataField="Descripcion" HeaderText="Descripcion"   />
			<asp:BoundField DataField="Estado" HeaderText="Estado"  Visible="false" />
			</Columns>
    </asp:GridView>
    </asp:Panel>
    </asp:Panel>
    </div>
    <%--FormView--%>
    <div class = "panCol2">
    <asp:Panel runat="server" ID="pfvPla_Cta" GroupingText="Crear, Editar o Borar un Registro">
    <koala:FormViewSetim ID="fvPla_Cta" runat="server" DataSourceID="odsfvPla_Cta"
            oniteminserting="fvPla_Cta_ItemInserting" 
            onitemdeleted="fvPla_Cta_ItemDeleted" 
            oniteminserted="fvPla_Cta_ItemInserted" 
            onitemupdated="fvPla_Cta_ItemUpdated" 
            ondatabound="fvPla_Cta_DataBound" 
            onprerender="fvPla_Cta_PreRender">
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
			<table>
			<tr style="display:none">
                <td> Id </td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>'  CssClass="txtEdit"  />
				</td>
            </tr>
			<tr >
                <td> Anio </td>
                <td>
                <asp:DropDownList ID="ddlAnio" runat="server" SelectedValue='<%# Bind("Anio") %>' >
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                </asp:DropDownList>
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
                <td> Nivel </td>
                <td><asp:TextBox ID="NivelTextBox" runat="server" Text='<%# Bind("Nivel") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNivel" runat="server" 
                    ControlToValidate="NivelTextBox"
                    ErrorMessage="El campo Nivel es obligatorio" 
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
                <td> Descripcion </td>
                <td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
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
                <td> Anio </td>
                <td><asp:TextBox ID="AnioTextBox" runat="server" Text='<%# Bind("Anio") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqAnio" runat="server" 
                    ControlToValidate="AnioTextBox"
                    ErrorMessage="El campo Anio es obligatorio" 
                    Text="X" Display="Dynamic"/>
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
                <td> Nivel </td>
                <td><asp:TextBox ID="NivelTextBox" runat="server" Text='<%# Bind("Nivel") %>'  CssClass="txtEdit"  />
				<%--Validador--%>
                    <asp:RequiredFieldValidator ID="rqNivel" runat="server" 
                    ControlToValidate="NivelTextBox"
                    ErrorMessage="El campo Nivel es obligatorio" 
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
                <td> Descripcion </td>
                <td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  CssClass="txtEditDescripcion" TextMode="MultiLine"  />
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
                <td> Anio </td>
                <td><asp:TextBox ID="AnioTextBox" runat="server" Text='<%# Bind("Anio") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Codigo </td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Nivel </td>
                <td><asp:TextBox ID="NivelTextBox" runat="server" Text='<%# Bind("Nivel") %>'  ReadOnly="true"  CssClass="txtItem" /></td>
            </tr>
			<tr >
                <td> Nombre </td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>'  ReadOnly="true"  CssClass="txtItemNombreLargo" TextMode="MultiLine" /></td>
            </tr>
			<tr >
                <td> Descripcion </td>
                <td><asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>'  ReadOnly="true"  CssClass="txtItemDescripcion" TextMode="MultiLine" /></td>
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
    </div>
    <%--Fuente de datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Cta" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
	<%--Fuente de datos para los procesos genéricos --%>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetByAnio" runat="server" 
        SelectMethod="GetByAnio" 
        TypeName="FEL.PLA.BO_Pla_Cta" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="ddlFiltroAnio" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetByAnioLikeCodigo" runat="server" 
        SelectMethod="GetByAnioLikeCodigo" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="ddlFiltroAnio" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetByAnioLikeNombre" runat="server" 
        SelectMethod="GetByAnioLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="ddlFiltroAnio" Name="p_Anio" PropertyName="SelectedValue" Type="string" />
		    <asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetByLikeCodigo" runat="server" 
        SelectMethod="GetByLikeCodigo" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Cta_GetByLikeNombre" runat="server" 
        SelectMethod="GetByLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Cta">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
			<asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="string" />
		</SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Cta" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Cta"
        DataObjectTypeName="Pla_Cta"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o"
        oninserted="odsfvPla_Cta_Inserted" 
        onupdated="odsfvPla_Cta_Updated" 
		ondeleted="odsfvPla_Cta_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Cta" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
