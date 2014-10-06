<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="Scripts/autoNumeric-2.0-BETA.js" type="text/javascript"></script>


</head>
<body>
    <form id="form1" runat="server">

<script type="text/javascript">
    function PonerFormatoNumericoACamposFV() {
        alert(" Key : " + '<%= TextBox1.ClientID %>');
        $('#FormView1_ValorTextBox').autoNumeric('init', { aSep: '.', aDec: ',' });
    }
</script>

        <asp:ScriptManager ID="ScriptManager1" runat="server" ScriptMode="Auto" EnableScriptLocalization="true" EnableScriptGlobalization="true" AsyncPostBackTimeout="500" >
        </asp:ScriptManager>

    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(PonerFormatoNumericoACamposFV);
    </script>

<asp:UpdatePanel runat="server" ID="udp">
<ContentTemplate>

    <div>
        <asp:Label runat="server" ID="lbNumero" Text="Ingrese un número"></asp:Label>
        <asp:TextBox runat ="server" ID="mosh" Text="0"></asp:TextBox>
        <script type="text/javascript">
            $('#mosh').autoNumeric('init');            
        </script>
        <asp:TextBox runat ="server" ID="TextBox1" Text="1,23" ></asp:TextBox>
        <script type="text/javascript">
            $('#TextBox1').autoNumeric('init', { aSep: '.', aDec: ',' });
        </script>



        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="Id" DataSourceID="odsGridMov">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" 
                    SortExpression="Codigo" />
                <asp:BoundField DataField="Pla_Poa_Id" HeaderText="Pla_Poa_Id" 
                    SortExpression="Pla_Poa_Id" Visible="False" />
                <asp:BoundField DataField="Pla_Doc_Id" HeaderText="Pla_Doc_Id" 
                    SortExpression="Pla_Doc_Id" Visible="False" />
                <asp:BoundField DataField="Orden" HeaderText="Orden" SortExpression="Orden" />
                <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                <asp:BoundField DataField="Estado" HeaderText="Estado" 
                    SortExpression="Estado" />
                <asp:BoundField DataField="Pla_Tarea_Id" HeaderText="Pla_Tarea_Id" 
                    SortExpression="Pla_Tarea_Id" Visible="False" />
                <asp:BoundField DataField="Pla_Tarea_Nombre" HeaderText="Pla_Tarea_Nombre" 
                    SortExpression="Pla_Tarea_Nombre" />
                <asp:BoundField DataField="Pla_Partida_Id" HeaderText="Pla_Partida_Id" 
                    SortExpression="Pla_Partida_Id" Visible="False" />
                <asp:BoundField DataField="Pla_Partida_Codigo" HeaderText="Pla_Partida_Codigo" 
                    SortExpression="Pla_Partida_Codigo" />
                <asp:BoundField DataField="Pla_Partida_Nombre" HeaderText="Pla_Partida_Nombre" 
                    SortExpression="Pla_Partida_Nombre" />
                <asp:BoundField DataField="Pla_Doc_Tipo" HeaderText="Pla_Doc_Tipo" 
                    SortExpression="Pla_Doc_Tipo" />
                <asp:BoundField DataField="Pla_Doc_Fecha" HeaderText="Pla_Doc_Fecha" 
                    SortExpression="Pla_Doc_Fecha" />
            </Columns>
        </asp:GridView>


        <asp:ObjectDataSource ID="odsGridMov" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="Get" 
            TypeName="FEL.PLA.BO_Pla_Mov">
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            </SelectParameters>
        </asp:ObjectDataSource>


        <asp:FormView ID="FormView1" runat="server" DataSourceID="odsMov">
            <EditItemTemplate>
                Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                Codigo:
                <asp:TextBox ID="CodigoTextBox" runat="server" Text='<%# Bind("Codigo") %>' />
                <br />
                Pla_Poa_Id:
                <asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Poa_Id") %>' />
                <br />
                Pla_Doc_Id:
                <asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Id") %>' />
                <br />
                Orden:
                <asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>' />
                <br />


                Valor:
                <asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>' />


                <br />
                Estado:
                <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                <br />
                Pla_Tarea_Id:
                <asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Id") %>' />
                <br />
                Pla_Tarea_Nombre:
                <asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Nombre") %>' />
                <br />
                Pla_Partida_Id:
                <asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Id") %>' />
                <br />
                Pla_Partida_Codigo:
                <asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Codigo") %>' />
                <br />
                Pla_Partida_Nombre:
                <asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Nombre") %>' />
                <br />
                Pla_Doc_Tipo:
                <asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Tipo") %>' />
                <br />
                Pla_Doc_Fecha:
                <asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Fecha") %>' />
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
                Pla_Poa_Id:
                <asp:TextBox ID="Pla_Poa_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Poa_Id") %>' />
                <br />
                Pla_Doc_Id:
                <asp:TextBox ID="Pla_Doc_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Id") %>' />
                <br />
                Orden:
                <asp:TextBox ID="OrdenTextBox" runat="server" Text='<%# Bind("Orden") %>' />
                <br />
                Valor:
                <asp:TextBox ID="ValorTextBox" runat="server" Text='<%# Bind("Valor") %>' />
                <br />
                Estado:
                <asp:TextBox ID="EstadoTextBox" runat="server" Text='<%# Bind("Estado") %>' />
                <br />
                Pla_Tarea_Id:
                <asp:TextBox ID="Pla_Tarea_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Id") %>' />
                <br />
                Pla_Tarea_Nombre:
                <asp:TextBox ID="Pla_Tarea_NombreTextBox" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Nombre") %>' />
                <br />
                Pla_Partida_Id:
                <asp:TextBox ID="Pla_Partida_IdTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Id") %>' />
                <br />
                Pla_Partida_Codigo:
                <asp:TextBox ID="Pla_Partida_CodigoTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Codigo") %>' />
                <br />
                Pla_Partida_Nombre:
                <asp:TextBox ID="Pla_Partida_NombreTextBox" runat="server" 
                    Text='<%# Bind("Pla_Partida_Nombre") %>' />
                <br />
                Pla_Doc_Tipo:
                <asp:TextBox ID="Pla_Doc_TipoTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Tipo") %>' />
                <br />
                Pla_Doc_Fecha:
                <asp:TextBox ID="Pla_Doc_FechaTextBox" runat="server" 
                    Text='<%# Bind("Pla_Doc_Fecha") %>' />
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
                Pla_Poa_Id:
                <asp:Label ID="Pla_Poa_IdLabel" runat="server" 
                    Text='<%# Bind("Pla_Poa_Id") %>' />
                <br />
                Pla_Doc_Id:
                <asp:Label ID="Pla_Doc_IdLabel" runat="server" 
                    Text='<%# Bind("Pla_Doc_Id") %>' />
                <br />
                Orden:
                <asp:Label ID="OrdenLabel" runat="server" Text='<%# Bind("Orden") %>' />
                <br />
                Valor:
                <asp:Label ID="ValorLabel" runat="server" Text='<%# Bind("Valor") %>' />
                <br />
                Estado:
                <asp:Label ID="EstadoLabel" runat="server" Text='<%# Bind("Estado") %>' />
                <br />
                Pla_Tarea_Id:
                <asp:Label ID="Pla_Tarea_IdLabel" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Id") %>' />
                <br />
                Pla_Tarea_Nombre:
                <asp:Label ID="Pla_Tarea_NombreLabel" runat="server" 
                    Text='<%# Bind("Pla_Tarea_Nombre") %>' />
                <br />
                Pla_Partida_Id:
                <asp:Label ID="Pla_Partida_IdLabel" runat="server" 
                    Text='<%# Bind("Pla_Partida_Id") %>' />
                <br />
                Pla_Partida_Codigo:
                <asp:Label ID="Pla_Partida_CodigoLabel" runat="server" 
                    Text='<%# Bind("Pla_Partida_Codigo") %>' />
                <br />
                Pla_Partida_Nombre:
                <asp:Label ID="Pla_Partida_NombreLabel" runat="server" 
                    Text='<%# Bind("Pla_Partida_Nombre") %>' />
                <br />
                Pla_Doc_Tipo:
                <asp:Label ID="Pla_Doc_TipoLabel" runat="server" 
                    Text='<%# Bind("Pla_Doc_Tipo") %>' />
                <br />
                Pla_Doc_Fecha:
                <asp:Label ID="Pla_Doc_FechaLabel" runat="server" 
                    Text='<%# Bind("Pla_Doc_Fecha") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="odsMov" runat="server" DataObjectTypeName="Pla_Mov" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetById" 
            TypeName="FEL.PLA.BO_Pla_Mov" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                <asp:ControlParameter ControlID="GridView1" Name="p_Id" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="o" Type="Object" />
                <asp:Parameter Name="n" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</ContentTemplate>
</asp:UpdatePanel>


    </form>
</body>
</html>
