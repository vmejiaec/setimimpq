<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="INT_MANTENIMIENTO_SUCURSAL.aspx.cs" 
    Inherits="INT_INT_MANTENIMIENTO_SUCURSAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Int_Mantenimiento_SucursalRecursoKCG" %>   
    
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
          <asp:Panel 
            ID="Panel1" 
            runat="server"
            meta:resourcekey="Rec_Int_Mantenimiento_SucursalRecursoKCG">
            <koala:KGrid 
                ID="gvint_mant_sucursal" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                DataSourceID="odsint_mant_sucursal" 
                DataKeyNames="Id">                 
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <SelectedRowStyle CssClass="selectedrowstyle" />
                <Columns>
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"
                        SortExpression="Codigo_int" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"
                        SortExpression="Nombre" />
                    <asp:BoundField 
                        DataField="Abreviatura" 
                        meta:resourcekey="BoundAbreviaturaRecursoKCG"
                        SortExpression="Abreviatura" />
                    <asp:BoundField 
                        DataField="Descripcion" 
                        meta:resourcekey="BoundDescripcionRecursoKCG"
                        SortExpression="Descripcion" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Codigo" 
                        HeaderText="Int_Moneda_Codigo" 
                        SortExpression="Int_Moneda_Codigo" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_nombre" 
                        HeaderText="Int_Empresa_nombre" 
                        SortExpression="Int_Empresa_nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Numero" 
                        HeaderText="Numero" 
                        SortExpression="Numero" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_empresa_Codigo" 
                        HeaderText="Int_empresa_Codigo" 
                        SortExpression="Int_empresa_Codigo" 
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
                        DataField="Int_Moneda_Nombre" 
                        HeaderText="Int_Moneda_Nombre" 
                        SortExpression="Int_Moneda_Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Id" 
                        HeaderText="Int_Moneda_Id" 
                        SortExpression="Int_Moneda_Id" 
                        Visible="False" />
                </Columns>
            </koala:KGrid >
          </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="gvint_mant_sucursal"
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <table>
        <tr align="left">
            <td>
                <koala:KFiltro 
                    ID="kftFiltro" 
                    runat="server" 
                    Contenedor="INT_MANTENIMIENTO_SUCURSAL" 
                    Objeto="INT_MANTENIMIENTO_SUCURSAL" 
                    IndiceScope ="Scope"
                    Orden="1"
                    ObjectDataSourceID="odsint_mant_sucursal" />
                <%--<asp:Button 
                    ID="btn_Int_Mantenimiento_Sucursal" 
                    runat="server"                     
                    OnClick="Btn_Int_Mantenimiento_Sucursal" 
                    Text="Ejecutar Proceso"/>--%>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource 
        ID="odsint_mant_sucursal" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByMantenimiento" 
        TypeName="FEL.INT.BO_Int_Sucursal">
        <SelectParameters>
           <asp:SessionParameter 
               Name="s" 
               SessionField="Scope" 
               Type="Object" />
            <asp:Parameter Name="int_empresa_id" Type="String" />
           </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

