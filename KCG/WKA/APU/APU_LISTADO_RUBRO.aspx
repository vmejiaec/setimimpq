<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_RUBRO.aspx.cs" 
    Inherits="APU_APU_LISTADO_RUBRO" 
    meta:resourcekey="Tit_Apu_Listado_RubroRecursoKCG" %>

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
                ID="elem_PagActual"
                runat="server" 
                style="display:none">
            </asp:TextBox>
             <asp:TextBox 
                ID="elem_NumRegis"
                runat="server" 
                style="display:none">
            </asp:TextBox>
            <asp:TextBox 
                ID="elem_Id"
                runat="server" 
                style="display:none">
            </asp:TextBox>
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
                ID="pnlApuListadoRubro"
                meta:resourcekey="Rec_Apu_Listado_RubroRecursoKCG">
                <Koala:KGridBase
                    ID="gvApuListadoRubro" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    PageSize="20"
                    DataKeyNames="Id" 
                    DataSourceID="odsGvApuListadoRubro" 
                    AllowSorting="True"
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
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG"
                            SortExpression="Codigo_int" >
                            <itemstyle horizontalalign="Right" /> 
                        </asp:BoundField> 
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <itemstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Unidad" 
                            meta:resourcekey="BoundUnidadRecursoKCG"
                            SortExpression="Unidad" >
                           <itemstyle horizontalalign="Center" /> 
                        </asp:BoundField> 
                        <asp:BoundField 
                            DataField="Costo_Total"
                            meta:resourcekey="BoundCosto_TotalRecursoKCG"
                            SortExpression="Costo_Total" 
                            dataformatstring="{0:N4}" >
                          <headerstyle wrap="True" />
                         <itemstyle horizontalalign="Right" />
                        </asp:BoundField>    
                        <asp:BoundField 
                            DataField="Costo_Directo" 
                            meta:resourcekey="BoundCosto_DirectoRecursoKCG"
                            SortExpression="Costo_Directo" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                           <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_rubro_equipo_costo_total" 
                            meta:resourcekey="BoundApu_rubro_equipo_costo_totalRecursoKCG"
                            SortExpression="Apu_rubro_equipo_costo_total" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                         <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_rubro_mano_obra_costo_total" 
                            meta:resourcekey="BoundApu_rubro_mano_obra_costo_totalRecursoKCG"
                            SortExpression="Apu_rubro_mano_obra_costo_total" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                         <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_rubro_material_costo_total" 
                            meta:resourcekey="BoundApu_rubro_material_costo_totalRecursoKCG"
                            SortExpression="Apu_rubro_material_costo_total" 
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="True" />
                         <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                         <asp:BoundField 
                            DataField="Apu_rubro_transporte_costo_total" 
                            meta:resourcekey="BoundApu_rubro_transporte_costo_totalRecursoKCG"
                            SortExpression="Apu_rubro_transporte_costo_total"
                            dataformatstring="{0:N4}" >
                           <headerstyle wrap="True" />
                           <itemstyle horizontalalign="Right" />
                         </asp:BoundField>
                         <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            meta:resourcekey="BoundUpdate_Per_Personal_NombreRecursoKCG"
                            SortExpression="Update_Per_Personal_Nombre" >
                             <headerstyle wrap="True" />
                             <itemstyle wrap="True" />
                         </asp:BoundField>
                         <asp:BoundField 
                            DataField="Fecha_Update" 
                            meta:resourcekey="BoundFecha_UpdateRecursoKCG"
                            SortExpression="Fecha_Update" >
                             <headerstyle wrap="True" />
                             <itemstyle wrap="True" />
                         </asp:BoundField>                    
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Id" 
                            HeaderText="Int_Moneda_Id" 
                            SortExpression="Int_Moneda_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Mano_Obra" 
                            HeaderText="Rendimiento_Mano_Obra"
                            SortExpression="Rendimiento_Mano_Obra"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo" 
                            HeaderText="Rendimiento_Equipo" 
                            SortExpression="Rendimiento_Equipo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Especial" 
                            HeaderText="Especial" 
                            SortExpression="Especial"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Disponible" 
                            HeaderText="Disponible" 
                            SortExpression="Disponible"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id"
                            Visible="False" />                       
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_id" 
                            HeaderText="Apu_Subtitulo_id" 
                            SortExpression="Apu_Subtitulo_id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Codigo" 
                            HeaderText="Int_Sucursal_Codigo"
                            SortExpression="Int_Sucursal_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Nombre" 
                            HeaderText="Int_Sucursal_Nombre"
                            SortExpression="Int_Sucursal_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Codigo" 
                            HeaderText="Apu_Subtitulo_Codigo"
                            SortExpression="Apu_Subtitulo_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Subtitulo_Nombre" 
                            HeaderText="Apu_Subtitulo_Nombre"
                            SortExpression="Apu_Subtitulo_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_id" 
                            HeaderText="Apu_Titulo_id" 
                            SortExpression="Apu_Titulo_id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Codigo" 
                            HeaderText="Apu_Titulo_Codigo" 
                            SortExpression="Apu_Titulo_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Titulo_Nombre" 
                            HeaderText="Apu_Titulo_Nombre" 
                            SortExpression="Apu_Titulo_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Codigo" 
                            HeaderText="Int_Moneda_Codigo" 
                            SortExpression="Int_Moneda_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Nombre" 
                            HeaderText="Int_Moneda_Nombre" 
                            SortExpression="Int_Moneda_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo"
                            Visible="False" />                       
                        <asp:BoundField 
                            DataField="Rendimiento_Mano_Obra_Hora" 
                            HeaderText="Rendimiento_Mano_Obra_Hora"
                            SortExpression="Rendimiento_Mano_Obra_Hora"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Rendimiento_Equipo_Hora" 
                            HeaderText="Rendimiento_Equipo_Hora"
                            SortExpression="Rendimiento_Equipo_Hora"
                            Visible="False" />                  
                        <asp:BoundField 
                            DataField="Apu_rubro_material_ultima_fecha_update" 
                            HeaderText="Apu_rubro_material_ultima_fecha_update"
                            SortExpression="Apu_rubro_material_ultima_fecha_update"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_rubro_transporte_ultima_fecha_update" 
                            HeaderText="Apu_rubro_transporte_ultima_fecha_update"
                            SortExpression="Apu_rubro_transporte_ultima_fecha_update"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_rubro_mano_obra_ultima_fecha_update" 
                            HeaderText="Apu_rubro_mano_obra_ultima_fecha_update"
                            SortExpression="Apu_rubro_mano_obra_ultima_fecha_update"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_rubro_equipo_ultima_fecha_update" 
                            HeaderText="Apu_rubro_equipo_ultima_fecha_update"
                            SortExpression="Apu_rubro_equipo_ultima_fecha_update"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Costo_Indirecto" 
                            HeaderText="Costo_Indirecto" 
                            SortExpression="Costo_Indirecto"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Disponible_Nombre" 
                            HeaderText="Disponible_Nombre" 
                            SortExpression="Disponible_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Especial_Nombre" 
                            HeaderText="Especial_Nombre" 
                            SortExpression="Especial_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado"
                            Visible="False" />
                    </Columns>
                </Koala:KGridBase>          
            </asp:Panel>      
            <table>
                <tr>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="APU_LISTADO_RUBRO" 
                            Objeto="Apu_Rubro" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGvApuListadoRubro"
                            PaginacionFina="true"/>
                        <asp:Button 
                            ID="btnApuListadoRubroTecnica" 
                            runat="server" 
                            OnClick="btnApuListadoRubroTecnica_Click" />
                        <asp:Button 
                            ID="btnApuListadoRubroNuevo" 
                            runat="server"
                            PostBackUrl="~/APU/Apu_Rubro.aspx" />                                                                     
                        <asp:Button 
                            ID="Btn_Apu_Listado_Rubro_Reporte" 
                            runat="server" 
                            OnClick="Btn_Apu_Listado_Rubro_Reporte_Click" />
                        <asp:Button 
                            ID="Btn_Apu_Listado_Rubro_Rubro" 
                            runat="server" 
                            OnClick="Btn_Apu_Listado_Rubro_Rubro_Click" />
                        <asp:Button 
                            ID="BtnReporteListadoApu" 
                            runat="server" 
                            Text="Reporte de Listado General" 
                            OnClick="BtnReporteListadoApu_Click"/>
                    </td>
                </tr>                      
            </table>                         
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGvApuListadoRubro" 
        runat="server"
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Rubro">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />           
            <asp:Parameter 
                Name="Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Hasta" 
                Type="String" />
            <asp:Parameter 
                Name="Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Subtitulo_Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Subtitulo_Codigo_Hasta" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Subtitulo_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Titulo_Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Titulo_Codigo_Hasta" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Titulo_Nombre" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

