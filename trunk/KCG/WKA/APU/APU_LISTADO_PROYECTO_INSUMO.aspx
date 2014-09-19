<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_PROYECTO_INSUMO.aspx.cs" 
    Inherits="APU_APU_LISTADO_PROYECTO_INSUMO" 
    meta:resourcekey="Tit_Apu_Proyecto_InsumoRecursoKCG" %>
    
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
                ID="Rec_Apu_Proyecto_Insumo_Listado"
                meta:resourcekey="Rec_Apu_Proyecto_Insumo_ListadoRecursoKCG">
                
                <koala:KGridBase 
                    ID="gvApuListadoProyectoInsumo" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    PageSize="20"
                    DataKeyNames="Id,Tipo,Apu_Proyecto_Id,Apu_Proyecto_Etapa" 
                    DataSourceID="odsgvApuListadoProyectoInsumo" 
                    AllowSorting="True"
                    SelectedIndex="0"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True" >
                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                    <HeaderStyle CssClass="headerstyle" />
                    <PagerStyle CssClass="pagerstyle" />
                    <SelectedRowStyle CssClass="selectedrowstyle" />
                    
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" 
                            SelectText="..." 
                            ShowSelectButton="True" />
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            meta:resourcekey="BoundTipo_NombreRecursoKCG" 
                            SortExpression="Tipo_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>
                         <asp:BoundField 
                            DataField="Apu_Insumo_Nombre" 
                            meta:resourcekey="BoundApu_Insumo_NombreRecursoKCG"
                            SortExpression="Apu_Insumo_Nombre" >
                             <headerstyle wrap="False" />
                             <itemstyle wrap="False" width="80mm" />
                         </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Parametros" 
                            meta:resourcekey="BoundCosto_ParametrosRecursoKCG"
                            SortExpression="Costo_Parametros" 
                            dataformatstring="{0:N4}">
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Proyecto" 
                            meta:resourcekey="BoundCosto_ProyectoRecursoKCG"
                            SortExpression="Costo_Proyecto" 
                            dataformatstring="{0:N4}">
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Right"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            meta:resourcekey="BoundApu_Proyecto_NombreRecursoKCG"
                            SortExpression="Apu_Proyecto_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" width="80mm" />
                        </asp:BoundField>                                             
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>   
                        <asp:BoundField 
                            DataField="Apu_Insumo_Codigo" 
                            HeaderText="Apu_Insumo_Codigo"
                            SortExpression="Apu_Insumo_Codigo"
                            Visible="False" />  
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
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
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
                            DataField="Tipo" 
                            HeaderText="Tipo" 
                            SortExpression="Tipo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int"/>
                        <asp:BoundField 
                            DataField="Apu_Insumo_Id" 
                            HeaderText="Apu_Insumo_Id" 
                            SortExpression="Apu_Insumo_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                    </Columns>
                </Koala:KGridBase>
            </asp:Panel>     
            <table>
                <tr
                    align="left">
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_LISTADO_PROYECTO_INSUMO" 
                            Objeto="APU_PROYECTO_INSUMO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgvApuListadoProyectoInsumo"
                            PaginacionFina="true"/>
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Insumo_Insumo" 
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Insumo_Insumo_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Insumo_Proyecto"
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Insumo_Proyecto_Click" />
                    </td>
                </tr>
            </table>               
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource 
        ID="odsgvApuListadoProyectoInsumo" 
        runat="server"         
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Insumo">
        <SelectParameters>
            <asp:SessionParameter
                DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Int_sucursal_id" 
                QueryStringField="Int_sucursal_id"
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Hasta" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Codigo" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Nombre" 
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

