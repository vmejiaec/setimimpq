<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_PROYECTO_RUBRO.aspx.cs" 
    Inherits="APU_APU_LISTADO_PROYECTO_RUBRO" 
    meta:resourcekey="Tit_Apu_Listado_Proyecto_RubroRecursoKCG" %>
    
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
                ID="Rec_Apu_Proyecto_Rubro_Listado"
                meta:resourcekey="Rec_Apu_Listado_Proyecto_RubroRecursoKCG">                
                <koala:KGridBase 
                    ID="gvApuListadoProyectoRubro" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    DataKeyNames="Id,Apu_Rubro_Id,Apu_Proyecto_Id,Estado" 
                    DataSourceID="odsgvApuListadoProyectoRubro"
                    PageSize="15"
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
                            <itemstyle wrap="True" width="500px" />
                        </asp:BoundField>    
                        <asp:BoundField 
                            DataField="Costo_Unitario" 
                            meta:resourcekey="BoundCosto_UnitarioRecursoKCG"
                            SortExpression="Costo_Unitario"
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />                 
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_rubro_Costo_Total" 
                            meta:resourcekey="BoundApu_rubro_Costo_TotalRecursoKCG"                             
                            SortExpression="Apu_rubro_Costo_Total" 
                            dataformatstring="{0:N4}">
                            <itemstyle wrap="True" horizontalalign="Right"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            meta:resourcekey="BoundApu_Proyecto_NombreRecursoKCG"
                            SortExpression="Apu_Proyecto_Nombre" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="True" width="500px"/>
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Etapa" 
                            HeaderText="Apu_Proyecto_Etapa"                             
                            SortExpression="Apu_Proyecto_Etapa"
                            Visible="False" /> 
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            HeaderText="Costo_Total"                             
                            SortExpression="Costo_Total"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Codigo" 
                            HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Material_costo_total" 
                            HeaderText="Material_costo_total"
                            SortExpression="Material_costo_total" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rendimiento_mano_obra_hora1" 
                            HeaderText="Rendimiento_mano_obra_hora1"
                            SortExpression="Rendimiento_mano_obra_hora1" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Material_ultima_fecha_update" 
                            HeaderText="Material_ultima_fecha_update"
                            SortExpression="Material_ultima_fecha_update" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo" 
                            HeaderText="Rendimiento_Equipo" 
                            SortExpression="Rendimiento_Equipo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_id" 
                            HeaderText="Apu_Subtitulo_id" 
                            SortExpression="Apu_Subtitulo_id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                        <asp:BoundField     
                            DataField="Rendimiento_Mano_Obra_Hora" 
                            HeaderText="Rendimiento_Mano_Obra_Hora"
                            SortExpression="Rendimiento_Mano_Obra_Hora" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Mano_obra_costo_total" 
                            HeaderText="Mano_obra_costo_total"
                            SortExpression="Mano_obra_costo_total" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rendimiento_Mano_Obra" 
                            HeaderText="Rendimiento_Mano_Obra"
                            SortExpression="Rendimiento_Mano_Obra" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Titulo_id" 
                            HeaderText="Apu_Titulo_id" 
                            SortExpression="Apu_Titulo_id" 
                            Visible="False"/>                        
                        <asp:BoundField     
                            DataField="Apu_Subtitulo_Codigo" 
                            HeaderText="Apu_Subtitulo_Codigo"
                            SortExpression="Apu_Subtitulo_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Transporte_ultima_fecha_update" 
                            HeaderText="Transporte_ultima_fecha_update"
                            SortExpression="Transporte_ultima_fecha_update" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Mano_obra_ultima_fecha_update" 
                            HeaderText="Mano_obra_ultima_fecha_update"
                            SortExpression="Mano_obra_ultima_fecha_update" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rendimiento_equipo_hora1" 
                            HeaderText="Rendimiento_equipo_hora1"
                            SortExpression="Rendimiento_equipo_hora1" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Equipo_ultima_fecha_update" 
                            HeaderText="Equipo_ultima_fecha_update"
                            SortExpression="Equipo_ultima_fecha_update" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo_Hora" 
                            HeaderText="Rendimiento_Equipo_Hora"
                            SortExpression="Rendimiento_Equipo_Hora" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Titulo_Nombre" 
                            HeaderText="Apu_Titulo_Nombre" 
                            SortExpression="Apu_Titulo_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Transporte_costo_total" 
                            HeaderText="Transporte_costo_total"
                            SortExpression="Transporte_costo_total" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Nombre" 
                            HeaderText="Apu_Subtitulo_Nombre"
                            SortExpression="Apu_Subtitulo_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Titulo_Codigo" 
                            HeaderText="Apu_Titulo_Codigo" 
                            SortExpression="Apu_Titulo_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Equipo_costo_total" 
                            HeaderText="Equipo_costo_total" 
                            SortExpression="Equipo_costo_total" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Cantidad" 
                            HeaderText="Cantidad" 
                            SortExpression="Cantidad" 
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
                            Contenedor="APU_LISTADO_PROYECTO_RUBRO" 
                            Objeto="APU_PROYECTO_RUBRO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsgvApuListadoProyectoRubro"
                            PaginacionFina="true"/>
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Rubro_Proyecto" 
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Rubro_Proyecto_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Proyecto_Rubro_Rubro"
                            runat="server" 
                            OnClick="Btn_Apu_Proyecto_Rubro_Rubro_Click" />
                    </td>
                </tr>
            </table>                         
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource 
        ID="odsgvApuListadoProyectoRubro" 
        runat="server"        
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal"         
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Int_Sucursal_id" 
                QueryStringField="Int_Sucursal_id"
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Codigo" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Proyecto_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Rubro_Codigo" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Rubro_Nombre" 
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

