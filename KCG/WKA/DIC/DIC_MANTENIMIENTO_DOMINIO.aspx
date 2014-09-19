<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master"
    AutoEventWireup="true" 
    CodeFile="DIC_MANTENIMIENTO_DOMINIO.aspx.cs" 
    Inherits="DIC_DIC_MANTENIMIENTO_DOMINIO" 
    meta:resourcekey="Tit_Dic_Mantenimiento_DominioResource1"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"  
    %>
 <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
<asp:Content 
        ID="Content1" 
        ContentPlaceHolderID="ContentPlaceHolder1" 
        Runat="Server">
        <asp:ObjectDataSource 
                ID="odsGVDicMantenimientoDominio" 
                runat="server"
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetByMantenimiento" 
                TypeName="FEL.DIC.BO_Dic_Dominio">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
             <asp:Panel 
             ID="Panel1" 
             runat="server" 
             meta:resourcekey="Rec_Dic_Mantenimiento_DominioResource1">
              
    <koala:KGrid
            ID="gvDicMantenimiento" 
            runat="server" 
            AllowPaging="True" 
            DataSourceID="odsGVDicMantenimientoDominio" 
            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            PageSize="15">
         <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <Columns>
            <asp:BoundField 
                DataField="Codigo" 
                meta:resourcekey="BoundCodigoResource1" 
                SortExpression="Codigo_int" />
            <asp:BoundField 
                DataField="Dominio" 
                meta:resourcekey="BoundDominioResource1" 
                SortExpression="Dominio" />
            <asp:BoundField 
                DataField="Dic_Modulo_Codigo" 
                meta:resourcekey="BoundNombreResource1" 
                SortExpression="Dic_Modulo_Codigo" />
            <asp:BoundField 
                DataField="Dic_Campo_Nombre" 
                meta:resourcekey="BoundDic_Campo_NombreResource1" 
                SortExpression="Dic_Campo_Nombre" />
            <asp:BoundField 
                DataField="Dic_Objeto_Nombre" 
                meta:resourcekey="BoundDic_Objeto_NombreResource1" 
                SortExpression="Dic_Objeto_Nombre" />
            <asp:BoundField 
                DataField="Dic_Modulo_Nombre" 
                meta:resourcekey="BoundDic_Modulo_NombreResource1" 
                SortExpression="Dic_Modulo_Nombre" />
            <asp:BoundField 
                DataField="Dic_Objeto_Codigo" 
                HeaderText="Dic_Objeto_Codigo" 
                SortExpression="Dic_Objeto_Codigo"
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Campo_Codigo" 
                HeaderText="Dic_Campo_Codigo" 
                SortExpression="Dic_Campo_Codigo"
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Objeto_Id" 
                HeaderText="Dic_Objeto_Id" 
                SortExpression="Dic_Objeto_Id"
                Visible="False" />
            <asp:BoundField 
                DataField="Nombre" 
                HeaderText="Nombre" 
                SortExpression="Nombre" 
                Visible="False" />
            <asp:BoundField 
                DataField="Id" 
                HeaderText="Id" 
                SortExpression="Id" 
                Visible="False" />
            <asp:BoundField 
                DataField="Estado_Nombre" 
                HeaderText="Estado_Nombre" 
                SortExpression="Estado_Nombre"
                Visible="False" />
            <asp:BoundField 
                DataField="Estado" 
                HeaderText="Estado" 
                SortExpression="Estado" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Modulo_Id" 
                HeaderText="Dic_Modulo_Id" 
                SortExpression="Dic_Modulo_Id"
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Campo_Id" 
                HeaderText="Dic_Campo_Id" 
                SortExpression="Dic_Campo_Id"
                Visible="False" />
        </Columns>
    </koala:KGrid>
         </asp:Panel> 
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicMantenimiento" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
     <table align="left">
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="DIC_MANTENIMIENTO_DOMINIO" 
                    Objeto="DIC_MANTENIMIENTO_DOMINIO" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsGVDicMantenimientoDominio"/>
                <asp:Button 
                    ID="btnEjecutarProceso" 
                    runat="server"
                    meta:resourcekey="Btn_Dic_Mantenimiento_DominioResource1" OnClick="btnEjecutarProceso_Click" 
                />
             
                </td>
            </tr>
        </table>
    
</asp:Content>

