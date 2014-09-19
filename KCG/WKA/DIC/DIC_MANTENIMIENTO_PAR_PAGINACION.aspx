<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_MANTENIMIENTO_PAR_PAGINACION.aspx.cs" 
    Inherits="DIC_DIC_MANTENIMIENTO_PAR_PAGINACION" 
    Title="Untitled Page" %>


<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<asp:UpdatePanel ID="upnObjetoMantenimineto" runat="server" UpdateMode="Conditional">
<ContentTemplate>

<koala:KFiltro ID="kftFiltro" 
    runat="server" 
    Contenedor="DIC_MANTENIMIENTO_PAR_PAGINACION" 
    Objeto="DIC_OBJETO" 
    IndiceScope ="Scope"
    Orden="1" ObjectDataSourceID="odsGvMantenimiento"/> 

<asp:Panel ID="Rec_Dic_Mantenimiento_Par_Paginacion" 
    runat="server"
     meta:resourcekey="Rec_Dic_Mantenimiento_Par_PaginacionRecursoKCG">
    
    <koala:KGrid ID="GridView1" 
        runat="server" 
        AllowPaging="True"
        AllowSorting="True"
        AutoGenerateColumns="False"
        DataSourceID="odsGvMantenimiento" 
        PageSize="15">
        
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        
        <Columns>
            <asp:CommandField ButtonType="Button" 
                SelectText="..." 
                ShowSelectButton="True" />
            <asp:BoundField DataField="Codigo" 
                 meta:resourcekey="BoundCodigoRecursoKCG" SortExpression="Codigo_int" />
            <asp:BoundField DataField="Nombre" 
                meta:resourcekey="BoundNombreRecursoKCG" SortExpression="Nombre" />
            <asp:BoundField DataField="Numero" 
               meta:resourcekey="BoundNumeroRecursoKCG" SortExpression="Numero" />
            <asp:BoundField DataField="Dic_Modulo_Nombre" 
                meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG" SortExpression="Dic_Modulo_Nombre" />
            <asp:BoundField DataField="Dic_Modulo_Id" 
                HeaderText="Dic_Modulo_Id" SortExpression="Dic_Modulo_Id" Visible="False"/>
            <asp:BoundField DataField="Estado_Nombre" 
                HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" Visible="False"/>
            <asp:BoundField DataField="Id" 
                HeaderText="Id" SortExpression="Id" Visible="False"/>
            <asp:BoundField DataField="Estado" 
                HeaderText="Estado" SortExpression="Estado" Visible="False"/>
            <asp:BoundField DataField="Dic_Modulo_Codigo" 
                HeaderText="Dic_Modulo_Codigo" SortExpression="Dic_Modulo_Codigo" Visible="False"/>
        </Columns>
    </koala:KGrid>    
</asp:Panel>
</ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="Btn_Dic_Mantenimiento_Par_Paginacion" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
        
    <asp:Button ID="Btn_Dic_Mantenimiento_Par_Paginacion" 
        runat="server" OnClick="Btn_Dic_Mantenimiento_Par_Paginacion_Click"
        meta:resourcekey="Btn_Dic_Mantenimiento_Par_PaginacionRecursoKCG" /><br />
    
    <asp:ObjectDataSource ID="odsGvMantenimiento" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByMantenimiento1" 
        OnSelected="OdsGv_Selected"
        TypeName="FEL.DIC.BO_Dic_Objeto">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

