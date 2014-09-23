<%@ Page Title="" Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="Pla_Cta_Lista.aspx.cs" 
Inherits="PLA_Pla_Cta_Lista" %>

  <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="panCol2">
    <asp:Panel runat = "server" ID="pgvPla_Partida" GroupingText="Listado de Partidas">
    
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

    <asp:Panel runat="server" GroupingText="Partidas">
    <asp:GridView ID="gvPla_Partida" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id" AllowPaging="True" DataSourceID="odsgvPla_Partida" 
        SelectedRowStyle-CssClass="selectedrowstyle" AlternatingRowStyle-CssClass="alternatingrowstyle" 
        HeaderStyle-CssClass="headerstyle" PagerStyle-CssClass="pagerstyle">
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
    <div class = "panCol2">
    <asp:Panel runat="server" ID="pfvPla_Partida" GroupingText="Crear, Editar o Borar una Partida">
    <koala:FormViewSetim ID="fvPla_Pardida" runat="server" DataSourceID="odsfvPla_Partida" 
            oniteminserting="fvPla_Pardida_ItemInserting" 
            onitemdeleted="fvPla_Pardida_ItemDeleted" 
            oniteminserted="fvPla_Pardida_ItemInserted" 
            onitemupdated="fvPla_Pardida_ItemUpdated">
        <EditItemTemplate>
            <table>
            <tr>
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
            <tr>
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' /></td>
            </tr>
            </table>
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" />
            &nbsp;
            <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
            <tr>
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
            <tr>
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' /></td>
            </tr>
            </table>
            <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insertar" />
            &nbsp;
            <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table>
            <tr>
                <td>Id:</td>
                <td><asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' Enabled="false" /></td>
            </tr>
            <tr>
                <td>Codigo:</td>
                <td><asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' Enabled="false" /></td>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' Enabled="false" /></td>
            </tr>
            <tr>
                <td>Estado:</td>
                <td><asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' Enabled="false" /></td>
            </tr>
            </table>
            <asp:Button ID="EditButton" RunAt="server"  CausesValidation="False" CommandName="Edit" Text="Editar" />
            &nbsp;
            <asp:Button ID="DeleteButton" RunAt="server" CausesValidation="False" CommandName="Delete" Text="Borrar" />
            &nbsp;
            <asp:Button ID="NewButton" RunAt="server" CausesValidation="False" CommandName="New" Text="Nuevo" />
        </ItemTemplate>
    </koala:FormViewSetim>
        <asp:Label ID="lbFvMsgError" runat="server" Text=":" CssClass="FvMensajeError"></asp:Label>
    </asp:Panel>
    </div>

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
        onupdated="odsfvPla_Partida_Updated">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Partida" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="o" Type="Object" />
            <asp:Parameter Name="n" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

