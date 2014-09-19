<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="FIS_LISTADO_FISCALIZACION.aspx.cs" 
    Inherits="FIS_FIS_LISTADO_FISCALIZACION" 
    meta:resourcekey="Tit_Fis_Listado_FiscalizacionRecursoKCG" %>

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
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Fis_Listado_FiscalizacionRecursoKCG" >
                <Koala:KGridBase
                    ID="Gv_Fis_Fiscalizacion" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGv_Fis_Fiscalizacion"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True">
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
                            DataField="Apu_Origen_Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG" 
                            SortExpression="Apu_Origen_Codigo">
                            <itemstyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Codigo_Institucion" 
                            meta:resourcekey="BoundCodigo_InstitucionRecursoKCG" 
                            SortExpression="Codigo_Institucion">
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" width="80mm" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="SubProyecto_Costos" 
                            meta:resourcekey="BoundSubproyecto_CostosRecursoKCG"
                            SortExpression="SubProyecto_Costos" >
                            <itemstyle wrap="False" width="80mm" Horizontalalign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundMontoRecursoKCG" 
                            SortExpression="Costo_Total" DataFormatString = "{0:N4}">
                            <itemstyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            meta:resourcekey="BoundEstado_NombreRecursoKCG" 
                            SortExpression="Estado_Nombre">
                            <itemstyle Width="40mm" Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Ini_Contrato" 
                            meta:resourcekey="BoundFecha_Ini_ContratoRecursoKCG" 
                            SortExpression="Fecha_Ini_Contrato"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <itemstyle Width="40mm" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Plazo_Contrato" 
                            meta:resourcekey="BoundPlazo_ContratoRecursoKCG" 
                            SortExpression="Plazo_Contrato">
                            <itemstyle Width="40mm" Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fecha_Fin_Contrato" 
                            meta:resourcekey="BoundFecha_Fin_ContratoRecursoKCG" 
                            SortExpression="Fecha_Fin_Contrato"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <itemstyle Width="40mm" HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Contratista_Per_Personal_Nombre" 
                            meta:resourcekey="BoundContratistaRecursoKCG" 
                            SortExpression="Contratista_Per_Personal_Nombre">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Fiscalizador_Per_Personal_Nombre" 
                            meta:resourcekey="BoundFiscalizadorRecursoKCG" 
                            SortExpression="Fiscalizador_Per_Personal_Nombre">
                            <ItemStyle Width="80mm" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Origen_Id" 
                            HeaderText="Apu_Origen_Id" 
                            SortExpression="Apu_Origen_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Origen_Codigo" 
                            HeaderText="Apu_Origen_Codigo" 
                            SortExpression="Apu_Origen_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Origen_Nombre" 
                            meta:resourcekey="BoundApu_Origen_NombreRecursoKCG"  
                            SortExpression="Apu_Origen_Nombre" Visible="False">
                            <itemstyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Origen" 
                            HeaderText="Origen" 
                            SortExpression="Origen" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Directo" 
                            HeaderText="Costo_Directo" 
                            SortExpression="Costo_Directo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            HeaderText="Costo_Total" 
                            SortExpression="Costo_Total"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Indirecto" 
                            HeaderText="Costo_Indirecto" 
                            SortExpression="Costo_Indirecto"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Costo_Otros" 
                            HeaderText="Costo_Otros" 
                            SortExpression="Costo_Otros"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fiscalizador_Per_Personal_Id" 
                            HeaderText="Fiscalizador_Per_Personal_Id"
                            SortExpression="Fiscalizador_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Contratista_Per_Personal_Id" 
                            HeaderText="Contratista_Per_Personal_Id"
                            SortExpression="Contratista_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Indices_Base" 
                            HeaderText="Fecha_Indices_Base" 
                            SortExpression="Fecha_Indices_Base"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Proyecto" 
                            HeaderText="Proyecto" 
                            SortExpression="Proyecto"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Contrato" 
                            HeaderText="Tipo_Contrato" 
                            SortExpression="Tipo_Contrato"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Cierre" 
                            HeaderText="Fecha_Cierre" 
                            SortExpression="Fecha_Cierre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_APU" 
                            HeaderText="Fecha_APU" 
                            SortExpression="Fecha_APU"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Valor_Anticipo" 
                            HeaderText="Valor_Anticipo" 
                            SortExpression="Valor_Anticipo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Anticipo" 
                            HeaderText="Porcentaje_Anticipo"
                            SortExpression="Porcentaje_Anticipo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Coordinador_1" 
                            HeaderText="Coordinador_1" 
                            SortExpression="Coordinador_1"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Coordinador_2" 
                            HeaderText="Coordinador_2" 
                            SortExpression="Coordinador_2"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Lugar" 
                            HeaderText="Lugar" 
                            SortExpression="Lugar" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Consultor" 
                            HeaderText="Consultor" 
                            SortExpression="Consultor"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Area_M2" 
                            HeaderText="Area_M2" 
                            SortExpression="Area_M2"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Indice_Def" 
                            HeaderText="Fecha_Indice_Def" 
                            SortExpression="Fecha_Indice_Def"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Base" 
                            HeaderText="Publicacion_Base" 
                            SortExpression="Publicacion_Base"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Publicacion_Base_Def" 
                            HeaderText="Publicacion_Base_Def"
                            SortExpression="Publicacion_Base_Def" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Proyecto_Costos" 
                            HeaderText="Proyecto_Costos" 
                            SortExpression="Proyecto_Costos"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Programa_Costos" 
                            HeaderText="Programa_Costos" 
                            SortExpression="Programa_Costos"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Contrato_Costos" 
                            HeaderText="Tipo_Contrato_Costos"
                            SortExpression="Tipo_Contrato_Costos" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ubicacion_Costos" 
                            HeaderText="Ubicacion_Costos" 
                            SortExpression="Ubicacion_Costos"
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
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fiscalizador_Per_Personal_Codigo" 
                            HeaderText="Fiscalizador_Per_Personal_Codigo"
                            SortExpression="Fiscalizador_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Contratista_Per_Personal_Codigo" 
                            HeaderText="Contratista_Per_Personal_Codigo"
                            SortExpression="Contratista_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Fiscalizacion" 
                            HeaderText="Tipo_Fiscalizacion" 
                            SortExpression="Tipo_Fiscalizacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Fiscalizacion_Nombre" 
                            HeaderText="Tipo_Fiscalizacion_Nombre"
                            SortExpression="Tipo_Fiscalizacion_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Jefe_Fiscalizacion" 
                            HeaderText="Jefe_Fiscalizacion" 
                            SortExpression="Jefe_Fiscalizacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Jefe_Fiscalizacion_Nombre" 
                            HeaderText="Jefe_Fiscalizacion_Nombre"
                            SortExpression="Jefe_Fiscalizacion_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Origen_Nombre" 
                            HeaderText="Origen_Nombre" 
                            SortExpression="Origen_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo_int" 
                            HeaderText="Codigo_int" 
                            SortExpression="Codigo_int"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                    </Columns>
                </Koala:KGridBase>                
                <table>
                    <tr>
                        <td>
                            <koala:KFiltro 
                                ID="kftFiltro" 
                                runat="server" 
                                Contenedor="FIS_LISTADO_FISCALIZACION" 
                                Objeto="Fis_Fiscalizacion" 
                                IndiceScope ="Scope"
                                Orden="1"
                                ObjectDataSourceID="odsGv_Fis_Fiscalizacion"
                                PaginacionFina="true"/>
                        </td>
                        <td>
                            <asp:Button 
                                ID="Btn_Fis_Presupuesto" 
                                runat="server" 
                                meta:resourcekey="Btn_Fis_PresupuestoRecursoKCG"
                                OnClick="Btn_Fis_Presupuesto_Click" />
                        </td>
                        <td>
                            <asp:Button
                                ID="Btn_Reporte"
                                runat="server"
                                meta:resourcekey="Btn_R_Fis_Listado_FiscalizacionRecursoKCG"
                                OnClick="Btn_Reporte_Click" />
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource 
                    ID="odsGv_Fis_Fiscalizacion" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetBySucursal" 
                    TypeName="FEL.FIS.BO_Fis_Fiscalizacion">
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
                            Name="Codigo_Institucion" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Nombre_Proyecto" 
                            Type="String" />
                        <asp:Parameter Name="Estado" Type="String" />
                        <asp:Parameter 
                            Name="Contratista" 
                            Type="String" />
                        <asp:Parameter 
                            Name="Fiscalizador" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

