<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Partida_GvFv.aspx.cs" 
Inherits="PLA_Pla_Partida_GvFv" %>

  <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>
    <div class="panCol2">
    <asp:Panel runat = "server" ID="pgvPla_Partida" GroupingText="Listado de Partidas">
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
    <asp:Panel runat="server" GroupingText="Partidas">
    <asp:GridView ID="gvPla_Partida" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Partida" 
        SelectedRowStyle-CssClass="selectedrowstyle" AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" PagerStyle-CssClass="pagerstyle" 
            onselectedindexchanged="gvPla_Partida_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible = "false" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ItemStyle-CssClass="gvColCodigo" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ItemStyle-CssClass="gvColString"/>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="false"/>
        </Columns>
    </asp:GridView>
    </asp:Panel>
    </asp:Panel>
    </div>
    <%--FormView--%>
    <div class = "panCol2">
    <asp:Panel runat="server" ID="pfvPla_Partida" GroupingText="Crear, Editar o Borar una Partida">
    <koala:FormViewSetim ID="fvPla_Pardida" runat="server" DataSourceID="odsfvPla_Partida" 
            oniteminserting="fvPla_Pardida_ItemInserting" 
            onitemdeleted="fvPla_Pardida_ItemDeleted" 
            oniteminserted="fvPla_Pardida_ItemInserted" 
            onitemupdated="fvPla_Pardida_ItemUpdated">
        <EditItemTemplate>
            <asp:Panel runat="server" ID ="panelEditTemplate" DefaultButton="UpdateButton">
            <table>
            <tr style="display:none" >
                <td>Id:</td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' /></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' /></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td>
            </tr>
            <tr style="display:none" >
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' /></td>
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
            <tr style="display:none" >
                <td>Id:</td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' /></td>
            </tr>
            <tr>
                <td>Código:</td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                    <%--Validadores--%>
                    <asp:RequiredFieldValidator ID="rqCodigo" runat="server" 
                    ControlToValidate="CodigoTextBox"
                    ErrorMessage="El campo Código es obligatorio" 
                    Text="X" Display="Dynamic"/>                    
<%--                    <asp:RegularExpressionValidator ID="revCodigo" runat="server" 
                    ControlToValidate="CodigoTextBox"
                    ErrorMessage="El código debe ser de 8 dígitos"
                    Text="X" Display="Dynamic" 
                    ValidationExpression="\d{8}"/>--%>
                </td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' /></td>
                    <%--Validadores--%>
                    <asp:RequiredFieldValidator ID="rqNombre" runat="server" 
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="El campo Nombre es obligatorio" 
                    Text="X" Display="Dynamic"/>  
            </tr>
            <tr style="display:none" >
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' /></td>
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
            <tr style="display:none" >
                <td>Id:</td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' ReadOnly="true" /></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' ReadOnly="true" /></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' ReadOnly="true" /></td>
            </tr>
            <tr style="display:none" >
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' ReadOnly="true" /></td>
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
    <%--Objetos de Datos para el GridView --%>
    <asp:ObjectDataSource ID="odsgvPla_Partida" runat="server" 
        SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Partida">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Partida_ByCodigo" runat="server" 
        SelectMethod="GetByLikeCodigo" 
        TypeName="FEL.PLA.BO_Pla_Partida">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="tbFiltro" Name="p_Codigo" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Partida_ByNombre" runat="server" 
        SelectMethod="GetByLikeNombre" 
        TypeName="FEL.PLA.BO_Pla_Partida">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="tbFiltro" Name="p_Nombre" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsgvPla_Partida_ById" runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.PLA.BO_Pla_Partida">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="tbFiltroId" Name="p_Id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--Objetos de Datos para el FormView --%>
    <asp:ObjectDataSource ID="odsfvPla_Partida" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="InsertINT" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Partida"
        DataObjectTypeName="Pla_Partida"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="o" 
        oninserted="odsfvPla_Partida_Inserted" 
        onupdated="odsfvPla_Partida_Updated" ondeleted="odsfvPla_Partida_Deleted">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Partida" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>


