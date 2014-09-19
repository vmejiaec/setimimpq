<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_PROYECTO_RUBRO_INSUMO.aspx.cs" 
    Inherits="APU_APU_LISTADO_PROYECTO_RUBRO_INSUMO" 
    meta:resourcekey="Tit_Apu_Listado_Proyecto_Rubro_InsumoRecursoKCG" %>
    
<%@ Register 
        Assembly="AjaxControlToolkit" 
        Namespace="AjaxControlToolkit" 
        TagPrefix="AjaxControlToolkit" %>

<%@ Register 
        tagprefix="koala" 
        assembly="KoalaWebControls" 
        namespace="Koala.KoalaWebControls" %>
    
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
            <asp:TextBox 
                ID="NumRegistros"
                runat="server" 
                style="display:none">
            </asp:TextBox>
            <asp:TextBox 
                ID="Pagina" 
                runat="server"
                style="display:none">
            </asp:TextBox>
            
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Proyecto_Rubro_Insumo"
                meta:resourcekey="Rec_Apu_Listado_Proyecto_Rubro_InsumoRecursoKCG">
                
                <Koala:KGridBase
                    ID="gvApuListadoProyectoRubroInsumo" 
                    runat="server" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id,Apu_Proyecto_Id,Tipo" 
                    DataSourceID="odsApuListadoProyectoRubroInsumo" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    PageSize="15"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True">
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="selectedrowstyle" />
                    
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" 
                            ButtonType="Button" 
                            SelectText="..." />
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            meta:resourcekey="BoundTipo_NombreRecursoKCG"
                            SortExpression="Tipo_Nombre" >
                            <itemstyle wrap="False" />
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Apu_Insumo_Nombre" 
                            meta:resourcekey="BoundApu_Insumo_NombreRecursoKCG"
                            SortExpression="Apu_Insumo_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="500px" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            meta:resourcekey="BoundApu_Rubro_CodigoRecursoKCG"
                            SortExpression="Apu_Rubro_Codigo" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG"
                            SortExpression="Apu_Rubro_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="500px" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            meta:resourcekey="BoundApu_Proyecto_NombreRecursoKCG"
                            SortExpression="Apu_Proyecto_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="500px" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Etapa" 
                            meta:resourcekey="BoundApu_Proyecto_EtapaRecursoKCG"
                            SortExpression="Apu_Proyecto_Etapa" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Codigo" 
                            HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo" 
                            HeaderText="Tipo" 
                            SortExpression="Tipo" 
                            Visible="False"/>     
                        <asp:BoundField 
                            DataField="Apu_Insumo_Codigo" 
                            HeaderText="Apu_Insumo_Codigo"
                            SortExpression="Apu_Insumo_Codigo"
                            Visible="False" /> 
                        <asp:BoundField 
                            DataField="Costo_Insumo" 
                            HeaderText="Costo_Insumo"
                            SortExpression="Costo_Insumo" 
                            Visible="False"/>                  
                        <asp:BoundField 
                            DataField="Apu_Insumo_Id" 
                            HeaderText="Apu_Insumo_Id" 
                            SortExpression="Apu_Insumo_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False"/>                                                
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Campo_Nombre" 
                            HeaderText="Campo_Nombre" 
                            SortExpression="Campo_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                    </Columns>
                </Koala:KGridBase>            
            </asp:Panel>  
            <table>
                <tr>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_LISTADO_PROYECTO_RUBRO_INSUMO" 
                            Objeto="APU_PROYECTO_RUBRO_INSUMO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsApuListadoProyectoRubroInsumo"
                            PaginacionFina="true"/>
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Rubro_Insumo_Insumo" 
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Rubro_Insumo_Insumo_Click"/>
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Rubro_Insumo_Rubro" 
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Rubro_Insumo_Rubro_Click"/>
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Rubro_Insumo_Proyecto" 
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Rubro_Insumo_Proyecto_Click"/>
                    </td>
                </tr>
            </table>       
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsApuListadoProyectoRubroInsumo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Insumo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Int_sucursal_id" 
                QueryStringField="Int_sucursal_id"
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Codigo" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Rubro_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Insumo_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Tipo" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>

