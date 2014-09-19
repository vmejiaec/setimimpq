<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PRESUPUESTO_PROVISIONAL.aspx.cs" 
    Inherits="APU_APU_PRESUPUESTO_PROVISIONAL" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Presupuesto_ProvisionalRecursoKCG" %>   
    
<%@ Register 
        Assembly="AjaxControlToolkit" 
        Namespace="AjaxControlToolkit" 
        TagPrefix="AjaxControlToolkit" %>
    
<%@ Register tagprefix="koala" 
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
            <asp:Panel 
                ID="pnl_Listado" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Presupuesto_ProvisionalRecursoKCG">
                <koala:KGrid
                    ID="Gv_Apu_Presupuesto_Provisional" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataSourceID="odsGv_Apu_Presupuesto_Provisional">                    
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
                            DataField="Origen_Nombre" 
                            meta:resourcekey="BoundOrigen_NombreRecursoKCG" 
                            SortExpression="Origen_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="20mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Codigo_Institucional" 
                            meta:resourcekey="BoundCodigo_InstitucionalRecursoKCG"
                            SortExpression="Codigo_Institucional">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Origen_Codigo" 
                            meta:resourcekey="BoundApu_Origen_CodigoRecursoKCG"
                            SortExpression="Apu_Origen_Codigo">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Origen_Nombre" 
                            meta:resourcekey="BoundApu_Origen_NombreRecursoKCG" 
                            SortExpression="Apu_Origen_Nombre">
                            <ItemStyle HorizontalAlign="Left" Width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_TotalRecursoKCG"
                            SortExpression="Costo_Total" DataFormatString="{0:N4}">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Origen_Id" 
                            HeaderText="Apu_Origen_Id" 
                            SortExpression="Apu_Origen_Id"
                            Visible="False" />
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
                            DataField="Equipo_Apu_Indice_Id" 
                            HeaderText="Equipo_Apu_Indice_Id"
                            SortExpression="Equipo_Apu_Indice_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="ManoObra_Apu_Indice_Id" 
                            HeaderText="ManoObra_Apu_Indice_Id"
                            SortExpression="ManoObra_Apu_Indice_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Porcentaje_Costo_Indirecto" 
                            HeaderText="Porcentaje_Costo_Indirecto"
                            SortExpression="Porcentaje_Costo_Indirecto" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Mano_Obra_Id" 
                            HeaderText="Apu_Mano_Obra_Id" 
                            SortExpression="Apu_Mano_Obra_Id"
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
                            DataField="Fecha_Indices_Def" 
                            HeaderText="Fecha_Indices_Def" 
                            SortExpression="Fecha_Indices_Def"
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
                            DataField="Tipo" 
                            HeaderText="Tipo" 
                            SortExpression="Tipo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Indice_Sumatoria" 
                            HeaderText="Indice_Sumatoria" 
                            SortExpression="Indice_Sumatoria"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Coeficiente_Sumatoria" 
                            HeaderText="Coeficiente_Sumatoria"
                            SortExpression="Coeficiente_Sumatoria" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Cuadrilla_Sumatoria" 
                            HeaderText="Cuadrilla_Sumatoria"
                            SortExpression="Cuadrilla_Sumatoria" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Cuadrilla_Coeficiente_Sumatoria" 
                            HeaderText="Cuadrilla_Coeficiente_Sumatoria"
                            SortExpression="Cuadrilla_Coeficiente_Sumatoria" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Suma_Porcentaje_Indice_Transporte" 
                            HeaderText="Suma_Porcentaje_Indice_Transporte"
                            SortExpression="Suma_Porcentaje_Indice_Transporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Cadena_Indice" 
                            HeaderText="Cadena_Indice" 
                            SortExpression="Cadena_Indice"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Cadena_Cuadrilla" 
                            HeaderText="Cadena_Cuadrilla" 
                            SortExpression="Cadena_Cuadrilla"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            HeaderText="Tipo_Nombre" 
                            SortExpression="Tipo_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo" 
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
                </koala:KGrid>
                <table>
                    <tr>                    
                        <td>
                            <koala:KFiltro 
                                ID="kftFiltro" 
                                runat="server" 
                                Contenedor="APU_PRESUPUESTO_PROVISIONAL" 
                                Objeto="Apu_Presupuesto" 
                                IndiceScope ="Scope"
                                Orden="1"
                                ObjectDataSourceID="odsGv_Apu_Presupuesto_Provisional" />
                        </td>
                        <td>
                            <asp:Button
                                ID="Btn_Presupuesto"
                                runat="server"
                                meta:resourcekey="BTN_Apu_Presupuesto_PresupuestoRecursoKCG"
                                OnClick="Btn_Presupuesto_Click" />
                        </td>
                        <td>
                            <asp:Button
                                ID="Btn_Formula_Polimnomica"
                                runat="server"
                                meta:resourcekey="Btn_Apu_Presupuesto_FormulaRecursoKCG"
                                OnClick="Btn_Formula_Polimnomica_Click" />
                        </td>
                        <td>
                            <asp:Button
                                ID="Btn_Cuadrilla"
                                runat="server"
                                meta:resourcekey="Btn_Apu_Presupuesto_CuadrillaRecursoKCG"
                                OnClick="Btn_Cuadrilla_Click" />
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource 
                    ID="odsGv_Apu_Presupuesto_Provisional" 
                    runat="server" 
                    ConflictDetection="CompareAllValues"
                    OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetBySucursal" 
                    TypeName="FEL.APU.BO_Apu_Presupuesto">
                    <SelectParameters>
                        <asp:SessionParameter 
                            Name="s" SessionField="Scope" 
                            Type="Object" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

