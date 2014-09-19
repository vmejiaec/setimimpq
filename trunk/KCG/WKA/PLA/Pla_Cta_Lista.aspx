﻿<%@ Page Title="" Language="C#" MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" CodeFile="Pla_Cta_Lista.aspx.cs" Inherits="PLA_Pla_Cta_Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="panCol2">
    <asp:Panel runat = "server" ID="pgvPla_Partida" GroupingText="Listado de Partidas">
    <asp:GridView ID="gvPla_Partida" runat="server" AutoGenerateColumns="False" 
        DataSourceID="odsPla_Partida" DataKeyNames="Id" AllowPaging="True">
            <AlternatingRowStyle CssClass="alternatingrowstyle" />
            <HeaderStyle CssClass="headerstyle" />
            <PagerStyle CssClass="pagerstyle" />
            <SelectedRowStyle CssClass="selectedrowstyle" />
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible = "false" />
            <asp:BoundField DataField="Codigo" HeaderText="Codigo" SortExpression="Codigo" ItemStyle-CssClass="gvColCodigo" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" ItemStyle-CssClass="gvColString"/>
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" ItemStyle-CssClass="gvColCodigo"/>
        </Columns>
    </asp:GridView>
    </asp:Panel>
    </div>
    <div class = "panCol2">
    <asp:Panel runat="server" ID="pfvPla_Partida" GroupingText="Editar la Partida">
    <asp:FormView ID="fvPla_Pardida" runat="server" DataSourceID="odsfvPla_Partida">
        <EditItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            Codigo:
            <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Nombre:
            <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Estado:
            <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            Codigo:
            <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Nombre:
            <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Estado:
            <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            Codigo:
            <asp:Label ID="CodigoLabel" runat="server" Text='<%# Bind("Codigo") %>' />
            <br />
            Nombre:
            <asp:Label ID="NombreLabel" runat="server" Text='<%# Bind("Nombre") %>' />
            <br />
            Estado:
            <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
            <br />
            <asp:LinkButton ID="EditButton"
                            Text="Edit"
                            CommandName="Edit"
                            RunAt="server" CausesValidation="False"/>
            &nbsp;<asp:LinkButton ID="DeleteButton" RunAt="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton"
                            Text="New"
                            CommandName="New"
                            RunAt="server" CausesValidation="False"/>
        </ItemTemplate>
    </asp:FormView>
    </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="odsPla_Partida" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
        TypeName="FEL.PLA.BO_Pla_Partida">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsfvPla_Partida" runat="server" 
        SelectMethod="GetById"         
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        UpdateMethod="Update"
        TypeName="FEL.PLA.BO_Pla_Partida"
        DataObjectTypeName="Pla_Partida"
        ConflictDetection = "CompareAllValues"
        OldValuesParameterFormatString="original_{0}">
        <InsertParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="n" Type="Object"  />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:ControlParameter ControlID="gvPla_Partida" Name="p_Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

