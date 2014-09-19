<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_RUBRO_INSUMO.aspx.cs" 
    Inherits="APU_APU_LISTADO_RUBRO_INSUMO" 
    meta:resourcekey="Tit_Apu_Rubro_InsumoRecursoKCG" %>

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
                ID="Rec_Apu_Rubro_Insumo_Listado"
                meta:resourcekey="Rec_Apu_Rubro_Insumo_ListadoRecursoKCG">                
                <koala:KGridBase 
                    ID="gvApuListadoRubroInsumo" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    PageSize="20"
                    DataKeyNames="Id,Tipo,Apu_Rubro_Id,Apu_Insumo_Id" 
                    AllowSorting="True"
                    DataSourceID="odsgvApuListadoRubroInsumo"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True" >
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle"/>                    
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="..." 
                            ShowSelectButton="True" />                        
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            meta:resourcekey="BoundTipo_NombreRecursoKCG"
                            SortExpression="Tipo_Nombre" >
                            <itemstyle wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Insumo_Codigo" 
                            meta:resourcekey="BoundApu_Insumo_CodigoRecursoKCG"
                            SortExpression="Apu_Insumo_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Insumo_Nombre" 
                            meta:resourcekey="BoundApu_Insumo_NombreRecursoKCG" 
                            SortExpression="Apu_Insumo_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="costo" 
                            meta:resourcekey="BoundcostoRecursoKCG"
                            SortExpression="costo" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG"
                            SortExpression="Cantidad" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>    
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            meta:resourcekey="BoundApu_Rubro_NombreRecursoKCG"
                            SortExpression="Apu_Rubro_Nombre" >
                            <itemstyle wrap="False" width="80mm" />
                        </asp:BoundField>                    
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_sucursal_Id1" 
                            HeaderText="Int_sucursal_Id1" 
                            SortExpression="Int_sucursal_Id1" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Tipo" 
                            HeaderText="Tipo" 
                            SortExpression="Tipo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id"
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Insumo_Id" 
                            HeaderText="Apu_Insumo_Id" 
                            SortExpression="Apu_Insumo_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False"/>
                    </Columns>
                </Koala:KGridBase>
            </asp:Panel>       
            <table>
                <tr
                    align="right">
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_LISTADO_RUBRO_INSUMO" 
                            Objeto="APU_RUBRO_INSUMO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgvApuListadoRubroInsumo"
                            PaginacionFina="true"/>
                        <asp:Button 
                            ID="Btn_Apu_Rubro_Insumo_Insumo" 
                            runat="server" 
                            OnClick="Btn_Apu_Rubro_Insumo_Insumo_Click" />   
                        <asp:Button 
                            ID="Btn_Apu_Rubro_Insumo_Rubro" 
                            runat="server" 
                            OnClick="Btn_Apu_Rubro_Insumo_Rubro_Click" />
                    </td>
                </tr>
            </table>     
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource                
        ID="odsgvApuListadoRubroInsumo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Rubro_Insumo" 
        ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Apu_Rubro_Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Rubro_Codigo_Hasta" 
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
            <asp:Parameter 
                Name="Apu_Subtitulo_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Titulo_Nombre" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>