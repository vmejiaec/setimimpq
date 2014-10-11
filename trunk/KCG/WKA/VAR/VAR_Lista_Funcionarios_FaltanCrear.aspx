<%@ Page Title="" 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="VAR_Lista_Funcionarios_FaltanCrear.aspx.cs" 
Inherits="VAR_VAR_Lista_Funcionarios_FaltanCrear" %>

<%@ Register tagprefix="koala" 
assembly="KoalaWebControls" 
namespace="Koala.KoalaWebControls" %>

<%@ Register Assembly="AjaxControlToolkit" 
Namespace="AjaxControlToolkit" 
TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel runat="server" ID="udpGridView">
<ContentTemplate>
    <%--Filtro--%>
    <asp:Panel runat ="server" ID="pBuscar" GroupingText ="Buscar" DefaultButton="btFiltrar">
        <asp:Label ID="lbFiltro" runat="server" Text="Filtro"></asp:Label>
        <asp:TextBox ID="tbFiltro" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:TextBox ID="tbFiltroId_Poa" runat="server" CssClass="filtroID"></asp:TextBox>
        <asp:Button runat="server" ID="btFiltrar" Text="..." Visible="true" onclick="btFiltrar_Click" style="display:none" />
        <asp:DropDownList ID="ddlFiltro" runat="server" AutoPostBack="true" onselectedindexchanged="ddlFiltro_SelectedIndexChanged">
            <asp:ListItem Text = "Todos" Value="Todos" ></asp:ListItem>
			<asp:ListItem Text = "Nombre" Value="Nombre" ></asp:ListItem>
		</asp:DropDownList>
    </asp:Panel>
    <%--Listado--%>
    <asp:Panel runat="server" ID="pcabecera" GroupingText="Funcionarios que no están creados en el sistema">
        <asp:GridView ID="gvFuncionarios" runat="server" AllowPaging="True" 
            SelectedRowStyle-CssClass="selectedrowstyle" 
		    AlternatingRowStyle-CssClass="alternatingrowstyle" 
            HeaderStyle-CssClass="headerstyle" 
		    PagerStyle-CssClass="pagerstyle" AutoGenerateColumns="False" 
            DataKeyNames="Persona_Codigo"
            DataSourceID="odsFuncionarios" >                
            <Columns>
                <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
                <asp:BoundField DataField="Area_Codigo" HeaderText="Area Codigo" />
                <asp:BoundField DataField="Area_Nombre" HeaderText="Area Nombre" ItemStyle-Width="200px" />
                <asp:BoundField DataField="Persona_Codigo" HeaderText="Persona Codigo" />
                <asp:BoundField DataField="Persona_Nombre" HeaderText="Persona Nombre" />
                <asp:BoundField DataField="Persona_Cargo" HeaderText="Cargo" ItemStyle-Width="180px" />
                <asp:BoundField DataField="Persona_Usuario" HeaderText="Usuario" />
                <asp:BoundField DataField="Persona_Password" HeaderText="Password" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <%--FormView--%>
    <asp:Panel runat="server" ID="Panel2" GroupingText="Funcionario seleccionado para crear en el sistema">
        <asp:FormView ID="fvFuncionarioACrear" runat="server" 
            DataSourceID="odsFuncionarioACrear">
            <ItemTemplate>
            <table>
            <tr>
            <td>Area_Codigo:</td>
            <td><asp:TextBox ID="Area_CodigoLabel" runat="server" Text='<%# Bind("Area_Codigo") %>' CssClass="txtEdit"/></td>
            </tr>
            <tr>
            <td>Area_Nombre:</td>
            <td><asp:TextBox ID="Area_NombreLabel" runat="server" Text='<%# Bind("Area_Nombre") %>' Width="350px"  CssClass="txtEdit"/></td>
            </tr>
            <tr>
            <td>Persona_Codigo:</td>
            <td><asp:TextBox ID="Persona_CodigoLabel" runat="server" Text='<%# Bind("Persona_Codigo") %>' CssClass="txtEdit" /></td>
            </tr>
            <tr>
            <td>Persona_Nombre:</td>
            <td><asp:TextBox ID="Persona_NombreLabel" runat="server" Text='<%# Bind("Persona_Nombre") %>' Width="350px"  CssClass="txtEdit"/></td>
            </tr>     
            <tr>
            <td>Persona_Cargo:</td>
            <td><asp:TextBox ID="Persona_CargoLabel" runat="server" Text='<%# Bind("Persona_Cargo") %>' Width="350px"  CssClass="txtEdit"/></td>
            </tr> 
            </tr>     
            <tr>
            <td> Persona_Usuario:</td>
            <td><asp:TextBox ID="Persona_UsuarioLabel" runat="server" Text='<%# Bind("Persona_Usuario") %>'  CssClass="txtEdit"/></td>
            </tr>
            </tr>     
            <tr>
            <td>Persona_Password:</td>
            <td><asp:TextBox ID="Persona_PasswordLabel" runat="server" Text='<%# Bind("Persona_Password") %>'  CssClass="txtEdit"/></td>
            </tr>  
            </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:Button ID="btCrearFuncionario" runat="server" 
            Text="Crear Funcionario en el Sistema" onclick="btCrearFuncionario_Click" />
    </asp:Panel>
    <%--Info--%>
    <asp:Panel runat="server" ID="Panel3" GroupingText="Resultado de la creación del usuario">
        <table>
        <tr>
        <td>Razón Social Id:</td>
        <td><asp:TextBox ID="tbRazonId" runat="server"></asp:TextBox> </td>
        <td><asp:Button ID="btIrAPantallaRazonSocial" runat="server" Text="Consultar" 
                onclick="btIrAPantallaRazonSocial_Click" /></td>
        </tr>
        <tr>
        <td>Persona Id:</td>
        <td><asp:TextBox ID="tbPersonaId" runat="server"></asp:TextBox></td>
        <td><asp:Button ID="btIrAPantallaPersona" runat="server" Text="Consultar" 
                onclick="btIrAPantallaPersona_Click" /></td>
        </tr>
        <tr>
        <td>Usuario Id:</td>
        <td><asp:TextBox ID="tbUsuarioId" runat="server"></asp:TextBox></td>
        <td><asp:Button ID="btIrAPantallaUsuario" runat="server" Text="Consultar" 
                onclick="btIrAPantallaUsuario_Click" /></td>
        </tr>
        </table>
        <asp:Label ID="lbMensame" runat="server" Text=">"></asp:Label>
    </asp:Panel>
</ContentTemplate>
</asp:UpdatePanel>

<%--Fuentes de Datos--%>
<asp:ObjectDataSource ID="odsFuncionarios" runat="server" 
    SelectMethod="GetByFaltanEnRazonSocial" 
    TypeName="FEL.VAR.BO_V_INT_Funcionario_Area">
    <SelectParameters>
        <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsGetByLikePersona_Nombre" runat="server" 
    SelectMethod="GetByLikePersona_Nombre" 
    TypeName="FEL.VAR.BO_V_INT_Funcionario_Area">
    <SelectParameters>
        <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        <asp:ControlParameter ControlID="tbFiltro" Name="p_Persona_Nombre" PropertyName="Text" Type="string" />
    </SelectParameters>
</asp:ObjectDataSource>

<asp:ObjectDataSource ID="odsFuncionarioACrear" runat="server" 
    SelectMethod="GetByPersona_Codigo" 
    TypeName="FEL.VAR.BO_V_INT_Funcionario_Area">
    <SelectParameters>
        <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        <asp:ControlParameter ControlID="gvFuncionarios" Name="p_Persona_Codigo" 
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

</asp:Content>

