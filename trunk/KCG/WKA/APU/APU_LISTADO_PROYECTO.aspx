<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_PROYECTO.aspx.cs" 
    Inherits="APU_APU_LISTADO_PROYECTO" 
    meta:resourcekey="Tit_Apu_Listado_ProyectoRecursoKCG" %>

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
                ID="pnlgvApuListadoRubro"
                meta:resourcekey="Rec_Apu_Listado_ProyectoRecursoKCG">
                
               <Koala:KGridBase
                    ID="gvApuListadoProyecto" 
                    runat="server" 
                    AllowPaging="True"  
                    AutoGenerateColumns="False"
                    DataKeyNames="Id" 
                    PageSize="20"
                    DataSourceID="odsGvApuListadoProyecto" 
                    AllowSorting="True"    
                                                
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                            DataField="Estado" 
                            meta:resourcekey="BoundEstadoRecursoKCG" 
                            SortExpression="Estado" >
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
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
                            <itemstyle wrap="True" width="80mm"  />
                        </asp:BoundField>                        
                        <asp:BoundField 
                            DataField="Codigo_Institucion" 
                            meta:resourcekey="BoundCodigo_InstitucionRecursoKCG"
                            SortExpression="Codigo_Institucion" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField> 
                        <asp:BoundField 
                            DataField="Tipo_Nombre" 
                            meta:resourcekey="BoundTipo_NombreRecursoKCG"
                            SortExpression="Tipo_Nombre" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="False" horizontalalign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Lugar_Nombre" 
                            meta:resourcekey="BoundApu_Lugar_NombreRecursoKCG"
                            SortExpression="Apu_Lugar_Nombre" >
                            <itemstyle wrap="False" />
                        </asp:BoundField>                     
                        <asp:BoundField 
                            DataField="Area" 
                            meta:resourcekey="BoundAreaRecursoKCG"
                            SortExpression="Area" />
                        <asp:BoundField 
                            DataField="Porcentaje_Costo_Indirecto_Otros" 
                            meta:resourcekey="BoundPorcentaje_Costo_Indirecto_OtrosRecursoKCG"
                            SortExpression="Porcentaje_Costo_Indirecto_Otros" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" horizontalalign="Right"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Indirecto_Otros" 
                            meta:resourcekey="BoundCosto_Indirecto_OtrosRecursoKCG"
                            SortExpression="Costo_Indirecto_Otros" 
                            dataformatstring="{0:N4}">
                            <headerstyle wrap="False"  />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Total" 
                            meta:resourcekey="BoundCosto_TotalRecursoKCG"
                            SortExpression="Costo_Total"
                            dataformatstring="{0:N4}" >
                            <headerstyle wrap="False" />
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>                            
                        <asp:BoundField 
                            DataField="Coordinador_Per_Personal_Nombre" 
                            meta:resourcekey="BoundCoordinador_Per_Personal_NombreRecursoKCG"
                            SortExpression="Coordinador_Per_Personal_Nombre" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="True"  />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tecnico_Per_Personal_Nombre" 
                            meta:resourcekey="BoundTecnico_Per_Personal_NombreRecursoKCG"
                            SortExpression="Tecnico_Per_Personal_Nombre" >
                            <headerstyle wrap="True" />
                            <itemstyle wrap="True" />
                        </asp:BoundField>   
                        <asp:BoundField 
                            DataField="Apu_Presupuesto_Estado_Nombre" 
                            meta:resourcekey="BoundApu_Presupuesto_Estado_NombreRecursoKCG"
                            SortExpression="Apu_Presupuesto_Estado_Nombre" >
                            <itemstyle horizontalalign="Left" />
                        </asp:BoundField>                  
                        <asp:BoundField 
                            DataField="Porcentaje_Costo_Indirecto" 
                            HeaderText="Porcentaje_Costo_Indirecto"
                            SortExpression="Porcentaje_Costo_Indirecto" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Porcentaje_Costo_Otros" 
                            HeaderText="Porcentaje_Costo_Otros"
                            SortExpression="Porcentaje_Costo_Otros" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Coordinador_Per_Personal_Id" 
                            HeaderText="Coordinador_Per_Personal_Id"
                            SortExpression="Coordinador_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Tecnico_Per_Personal_Id" 
                            HeaderText="Tecnico_Per_Personal_Id"
                            SortExpression="Tecnico_Per_Personal_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Int_Sucursal_Id" 
                            HeaderText="Int_Sucursal_Id" 
                            SortExpression="Int_Sucursal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Moneda_Id" 
                            HeaderText="Int_Moneda_Id" 
                            SortExpression="Int_Moneda_Id" 
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
                            DataField="Apu_Lugar_id" 
                            HeaderText="Apu_Lugar_id" 
                            SortExpression="Apu_Lugar_id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Lugar_Codigo" 
                            HeaderText="Apu_Lugar_Codigo" 
                            SortExpression="Apu_Lugar_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_provincia_id" 
                            HeaderText="Apu_provincia_id" 
                            SortExpression="Apu_provincia_id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Provincia_Codigo" 
                            HeaderText="Apu_Provincia_Codigo"
                            SortExpression="Apu_Provincia_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Provincia_Nombre" 
                            HeaderText="Apu_Provincia_Nombre"
                            SortExpression="Apu_Provincia_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Codigo" 
                            HeaderText="Int_Sucursal_Codigo"
                            SortExpression="Int_Sucursal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Sucursal_Nombre" 
                            HeaderText="Int_Sucursal_Nombre"
                            SortExpression="Int_Sucursal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Coordinador_Per_Personal_Codigo" 
                            HeaderText="Coordinador_Per_Personal_Codigo"
                            SortExpression="Coordinador_Per_Personal_Codigo" 
                            Visible="False"/>                       
                        <asp:BoundField 
                            DataField="Tecnico_Per_Personal_Codigo" 
                            HeaderText="Tecnico_Per_Personal_Codigo"
                            SortExpression="Tecnico_Per_Personal_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Int_Moneda_Codigo" 
                            HeaderText="Int_Moneda_Codigo" 
                            SortExpression="Int_Moneda_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Moneda_Nombre" 
                            HeaderText="Int_Moneda_Nombre" 
                            SortExpression="Int_Moneda_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rubro_Costo_Equipo" 
                            HeaderText="Rubro_Costo_Equipo" 
                            SortExpression="Rubro_Costo_Equipo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rubro_Costo_Mano_Obra" 
                            HeaderText="Rubro_Costo_Mano_Obra"
                            SortExpression="Rubro_Costo_Mano_Obra" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rubro_Costo_Material" 
                            HeaderText="Rubro_Costo_Material"
                            SortExpression="Rubro_Costo_Material" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Rubro_Costo_Transporte" 
                            HeaderText="Rubro_Costo_Transporte"
                            SortExpression="Rubro_Costo_Transporte" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Equipo" 
                            HeaderText="Costo_Equipo" 
                            SortExpression="Costo_Equipo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Mano_Obra" 
                            HeaderText="Costo_Mano_Obra" 
                            SortExpression="Costo_Mano_Obra" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Material" 
                            HeaderText="Costo_Material" 
                            SortExpression="Costo_Material" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Transporte" 
                            HeaderText="Costo_Transporte" 
                            SortExpression="Costo_Transporte" 
                            Visible="False"/>
                        <asp:BoundField     
                            DataField="Costo_Directo" 
                            HeaderText="Costo_Directo" 
                            SortExpression="Costo_Directo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Indirecto" 
                            HeaderText="Costo_Indirecto" 
                            SortExpression="Costo_Indirecto" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Costo_Otros" 
                            HeaderText="Costo_Otros" 
                            SortExpression="Costo_Otros" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Costo_Metro_Cuadrado" 
                            HeaderText="Costo_Metro_Cuadrado"
                            SortExpression="Costo_Metro_Cuadrado" 
                            Visible="False"/>                 
                        <asp:BoundField 
                            DataField="Etapa_Nombre" 
                            HeaderText="Etapa_Nombre" 
                            SortExpression="Etapa_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
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
                        <asp:Panel
                            runat="server"
                            ID="Rec_Botones_Generales"
                            GroupingText="General"
                            Font-Bold="true">
                            <table>
                                <tr>
                                    <td>
                                        <koala:KFiltro 
                                            ID="kftFiltro" 
                                            runat="server" 
                                            Contenedor="APU_LISTADO_PROYECTO" 
                                            Objeto="APU_PROYECTO" 
                                            IndiceScope ="Scope"
                                            Orden="1"
                                            ObjectDataSourceID="odsGvApuListadoProyecto"
                                            PaginacionFina="true"/>
                                    </td>  
                               
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Apu_Proyecto_Nuevo" 
                                            runat="server" 
                                            OnClick="Btn_Apu_Proyecto_Nuevo_Click" />
                                    </td>
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Apu_Listado_Proyecto_Proyecto" 
                                            runat="server" 
                                            OnClick="Btn_Apu_Listado_Proyecto_Proyecto_Click" />
                                    </td>  
                                    <%--<td>
                                        <asp:Button 
                                            ID="Btn_Clonar" 
                                            runat="server" 
                                            OnClick="Btn_Clonar_Click"/>
                                    </td>                                                                      
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Historico" 
                                            runat="server" 
                                            OnClick="Btn_Historico_Click"/>
                                    </td>       --%>                                  
                                </tr>
                            </table>                     
                        </asp:Panel>                    
                    </td>
                    <td>
                        <asp:Panel
                            runat="server"
                            ID="Rec_Apu_Reportes"
                            style="white-space:nowrap"
                            GroupingText="Reportes"
                            Font-Bold="true">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Tecnica" 
                                            runat="server" 
                                             meta:resourcekey="Btn_Reporte_TecnicaRecursoKCG"
                                            OnClick="Btn_Reporte_Tecnica_Click" />
                                    </td>                
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Rubro" 
                                            runat="server" 
                                             meta:resourcekey="Btn_Reporte_RubroRecursoKCG"
                                            OnClick="Btn_Reporte_Rubro_Click" />
                                    </td>   
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Basico" 
                                            runat="server" 
                                             meta:resourcekey="Btn_Reporte_BasicoRecursoKCG"
                                            OnClick="Btn_Reporte_Basico_Click" />
                                    </td>     
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Material" 
                                            runat="server" 
                                             meta:resourcekey="Btn_Reporte_MaterialRecursoKCG"
                                            OnClick="Btn_Reporte_Material_Click" />
                                    </td>
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Insumo" 
                                            runat="server" 
                                            meta:resourcekey="Btn_Reporte_InsumoRecursoKCG"
                                            OnClick="Btn_Reporte_Insumo_Click" />
                                    </td>      
                                    <td>
                                        <asp:Button 
                                            ID="Btn_Reporte_Memoria_Tecnica" 
                                            runat="server" 
                                            meta:resourcekey="Btn_Reporte_Memoria_TecnicaRecursoKCG"
                                            OnClick="Btn_Reporte_Memoria_Tecnica_Click" />
                                    </td>                                   
                                </tr>
                            </table>            
                        </asp:Panel>
                    </td>
                </tr>
            </table>                                                                         
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGvApuListadoProyecto" 
        runat="server"  
        OldValuesParameterFormatString="original_{0}"        
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Proyecto">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Int_sucursal_Id" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Hasta" 
                Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter 
                Name="Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Fecha_Creacion_Desde"
                Type="DateTime" />
            <asp:Parameter 
                Name="Fecha_Creacion_Hasta"
                Type="DateTime" />
            <asp:Parameter 
                Name="Coordinador_Per_Personal_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Tecnico_Per_Personal_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Lugar_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Provincia_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Presupuesto_Estado" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>