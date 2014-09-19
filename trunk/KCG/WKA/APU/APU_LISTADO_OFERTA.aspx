<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LISTADO_OFERTA.aspx.cs" 
    Inherits="APU_APU_LISTADO_OFERTA" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Listado_OfertaRecursoKCG" %>   
    
    
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
            ID="Panel1" 
            runat="server"
            meta:resourcekey="Rec_Apu_Listado_OfertaRecursoKCG">
            <koala:KGridBase 
                ID="gvapu_listado_oferta" 
                runat="server" 
                SelectedIndex="0"
                AutoGenerateColumns="False"
                AllowPaging="True"
                DataKeyNames="Id" 
                AllowSorting="True"               
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataSourceID="odsgvapu_listado_oferta" MostrarPaginacionSiempre="True">
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
                        DataField="Estado" 
                        meta:resourcekey="BoundEstadoRecursoKCG" 
                        SortExpression="Estado" >
                        <itemstyle horizontalalign="Center"  />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"  
                        SortExpression="Codigo" >
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"  
                        SortExpression="Nombre" >
                        <itemstyle wrap="False" width="40mm" />
                    </asp:BoundField>     
                    <asp:BoundField 
                        DataField="Codigo_Institucion" 
                        meta:resourcekey="BoundCodigo_InstitucionRecursoKCG"  
                        SortExpression="Codigo_Institucion" >
                        <itemstyle wrap="False" />
                    </asp:BoundField>   
                    <asp:BoundField 
                        DataField="Tipo_Nombre" 
                        meta:resourcekey="BoundTipo_NombreRecursoKCG"  
                        SortExpression="Tipo_Nombre" >
                        <itemstyle wrap="False" horizontalalign="Right"/>
                    </asp:BoundField>                
                    <asp:BoundField 
                        DataField="Apu_Lugar_Nombre" 
                        Visible = "false"
                        meta:resourcekey="BoundApu_Lugar_NombreRecursoKCG" 
                        SortExpression="Apu_Lugar_Nombre" >
                        <itemstyle wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Area" 
                        meta:resourcekey="BoundAreaRecursoKCG"  
                        SortExpression="Area" 
                        Visible = "false"
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        Visible = "false"
                        DataField="Costo_Indirecto_Otros" 
                        meta:resourcekey="BoundCosto_Indirecto_OtrosRecursoKCG" 
                        SortExpression="Costo_Indirecto_Otros" 
                        dataformatstring="{0:N4}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Costo_Total" 
                        meta:resourcekey="BoundCosto_TotalRecursoKCG"  
                        SortExpression="Costo_Total" 
                        ItemStyle-Width="120"
                        dataformatstring="{0:N2}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Porcentaje_Costo_Indirecto_Otros" 
                        meta:resourcekey="BoundPorcentaje_Costo_Indirecto_OtrosRecursoKCG" 
                        SortExpression="Porcentaje_Costo_Indirecto_Otros" 
                        ItemStyle-Width="50"
                        dataformatstring="{0:N2}">
                        <itemstyle horizontalalign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Fecha_Creacion" 
                        dataformatstring="{0:g}"
                        ItemStyle-Width="105"
                        meta:resourcekey="BoundFecha_CreacionRecursoKCG"  
                        SortExpression="Fecha_Creacion" >
                        <itemstyle wrap="True" horizontalalign="Right" />
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
                        <headerstyle wrap="True" />
                        <itemstyle wrap="True" /> 
                    </asp:BoundField>                  
                    <asp:BoundField 
                        DataField="Porcentaje_Costo_Indirecto" 
                        HeaderText="Porcentaje_Costo_Indirecto"
                        SortExpression="Porcentaje_Costo_Indirecto" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Porcentaje_Costo_Otros" 
                        HeaderText="Porcentaje_Costo_Otros"
                        SortExpression="Porcentaje_Costo_Otros" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Id" 
                        HeaderText="Creacion_Per_Personal_Id"
                        SortExpression="Creacion_Per_Personal_Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Contratista" 
                        HeaderText="Contratista"
                        SortExpression="Contratista" 
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
                        DataField="Tecnico_Per_Personal_Id" 
                        HeaderText="Tecnico_Per_Personal_Id"
                        SortExpression="Tecnico_Per_Personal_Id" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Id" 
                        HeaderText="Int_Sucursal_Id" 
                        SortExpression="Int_Sucursal_Id" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Id" 
                        HeaderText="Int_Moneda_Id" 
                        SortExpression="Int_Moneda_Id" Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Lugar_id" 
                        HeaderText="Apu_Lugar_id" 
                        SortExpression="Apu_Lugar_id" Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Lugar_Codigo" 
                        HeaderText="Apu_Lugar_Codigo" 
                        SortExpression="Apu_Lugar_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_provincia_id" 
                        HeaderText="Apu_provincia_id" 
                        SortExpression="Apu_provincia_id" Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Provincia_Codigo" 
                        HeaderText="Apu_Provincia_Codigo"
                        SortExpression="Apu_Provincia_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Provincia_Nombre" 
                        HeaderText="Apu_Provincia_Nombre"
                        SortExpression="Apu_Provincia_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Codigo" 
                        HeaderText="Int_Sucursal_Codigo"
                        SortExpression="Int_Sucursal_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Sucursal_Nombre" 
                        HeaderText="Int_Sucursal_Nombre"
                        SortExpression="Int_Sucursal_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Codigo" 
                        HeaderText="Int_Empresa_Codigo" 
                        SortExpression="Int_Empresa_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Nombre" 
                        HeaderText="Int_Empresa_Nombre" 
                        SortExpression="Int_Empresa_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Codigo" 
                        HeaderText="Creacion_Per_Personal_Codigo"
                        SortExpression="Creacion_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Creacion_Per_Personal_Nombre" 
                        HeaderText="Creacion_Per_Personal_Nombre"
                        SortExpression="Creacion_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Update_Per_Personal_Codigo" 
                        HeaderText="Update_Per_Personal_Codigo"
                        SortExpression="Update_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Update_Per_Personal_Nombre" 
                        HeaderText="Update_Per_Personal_Nombre"
                        SortExpression="Update_Per_Personal_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Tecnico_Per_Personal_Codigo" 
                        HeaderText="Tecnico_Per_Personal_Codigo"
                        SortExpression="Tecnico_Per_Personal_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Codigo" 
                        HeaderText="Int_Moneda_Codigo" 
                        SortExpression="Int_Moneda_Codigo" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Nombre" 
                        HeaderText="Int_Moneda_Nombre" 
                        SortExpression="Int_Moneda_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Moneda_Simbolo" 
                        HeaderText="Int_Moneda_Simbolo" 
                        SortExpression="Int_Moneda_Simbolo" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Equipo" 
                        HeaderText="Costo_Equipo" 
                        SortExpression="Costo_Equipo" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Mano_Obra" 
                        HeaderText="Costo_Mano_Obra" 
                        SortExpression="Costo_Mano_Obra" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Material" 
                        HeaderText="Costo_Material" 
                        SortExpression="Costo_Material" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Transporte" 
                        HeaderText="Costo_Transporte" 
                        SortExpression="Costo_Transporte" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Directo" 
                        HeaderText="Costo_Directo" 
                        SortExpression="Costo_Directo" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Indirecto" 
                        HeaderText="Costo_Indirecto" 
                        SortExpression="Costo_Indirecto" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Otros" 
                        HeaderText="Costo_Otros" 
                        SortExpression="Costo_Otros" Visible="False" />
                    <asp:BoundField 
                        DataField="Costo_Metro_Cuadrado" 
                        HeaderText="Costo_Metro_Cuadrado"
                        SortExpression="Costo_Metro_Cuadrado" Visible="False" />
                    <asp:BoundField 
                        DataField="Indice_Sumatoria" 
                        HeaderText="Indice_Sumatoria" 
                        SortExpression="Indice_Sumatoria" Visible="False" />
                    <asp:BoundField 
                        DataField="Coeficiente_Sumatoria" 
                        HeaderText="Coeficiente_Sumatoria"
                        SortExpression="Coeficiente_Sumatoria" Visible="False" />
                    <asp:BoundField 
                        DataField="Cuadrilla_Sumatoria" 
                        HeaderText="Cuadrilla_Sumatoria"
                        SortExpression="Cuadrilla_Sumatoria" Visible="False" />
                    <asp:BoundField 
                        DataField="Cuadrilla_Coeficiente_Sumatoria" 
                        HeaderText="Cuadrilla_Coeficiente_Sumatoria"
                        SortExpression="Cuadrilla_Coeficiente_Sumatoria" Visible="False" />
                    <asp:BoundField 
                        DataField="Suma_Porcentaje_Indice_Transporte" 
                        HeaderText="Suma_Porcentaje_Indice_Transporte"
                        SortExpression="Suma_Porcentaje_Indice_Transporte" Visible="False" />
                    <asp:BoundField 
                        DataField="Etapa_Nombre" 
                        HeaderText="Etapa_Nombre" 
                        SortExpression="Etapa_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre" Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" Visible="False" />
                    <asp:BoundField 
                        DataField="Etapa" 
                        HeaderText="Etapa" 
                        SortExpression="Etapa" Visible="False" />
                </Columns>
            </koala:KGridBase >
          </asp:Panel>          
        </ContentTemplate>        
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="gvapu_listado_oferta"
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <table>
        <tr>
            <td> 
                <asp:Panel 
                    runat="server"
                    Font-Bold="true"                    
                    ID="Rec_Botones_Generales"
                    meta:resourcekey="Rec_Apu_Listado_Oferta_GeneralRecursoKCG">                
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_LISTADO_OFERTA" 
                        Objeto="APU_OFERTA" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_listado_oferta"
                        PaginacionFina="true" />    
                    <asp:Button 
                        ID="Btn_Apu_Listado_Oferta_Nuevo" 
                        runat="server"                                       
                        OnClick="Btn_Apu_Listado_Oferta_Nuevo_Click" />  
                    <asp:Button 
                        ID="BtnOferta" 
                        runat="server"                   
                        OnClick="BtnOferta_Click"/> 
                    <asp:Button 
                        ID="BtnClonarOferta" 
                        runat="server"                   
                        OnClick="BtnClonarOferta_Click"/>                                                                                      
                </asp:Panel>        
            </td>  
            <td>       
                <asp:Panel 
                    ID="pnlformula" 
                    runat="server" 
                    Font-Bold="true"
                    meta:resourcekey="Rec_Apu_Listado_Oferta_ReportesRecursoKCG">
                    <asp:Button 
                        ID="Btn_Reporte_Rubro" 
                        runat="server" 
                        Text="Rubro" 
                        OnClick="Btn_Reporte_Rubro_Click" />                        
                    <asp:Button 
                        ID="Btn_Reporte_Basico" 
                        runat="server" 
                        Text="Basico" 
                        OnClick="Btn_Reporte_Basico_Click" />                                                                                    
                    <asp:Button 
                        ID="Btn_Reporte_Material" 
                        runat="server" 
                        Text="Material" 
                        OnClick="Btn_Reporte_Material_Click" />
                    <asp:Button 
                        ID="Btn_Reporte_Insumo" 
                        runat="server" 
                        Text="Insumo" 
                        OnClick="Btn_Reporte_Insumo_Click" />
                    <asp:Button 
                        ID="Btn_Reporte_Proyecto_Oferta" 
                        runat="server" 
                        Text="Proyecto-Oferta" 
                        OnClick="Btn_Reporte_Proyecto_Oferta_Click" />                    
                </asp:Panel>
            </td>
        </tr>
    </table>     
    <asp:ObjectDataSource 
        ID="odsgvapu_listado_oferta" 
        runat="server"         
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Oferta">
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
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter 
                Name="Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Contratista" 
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
            <asp:Parameter Name="Apu_Presupuesto_Estado" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

