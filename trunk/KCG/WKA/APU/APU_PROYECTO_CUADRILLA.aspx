<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_CUADRILLA.aspx.cs" 
    Inherits="APU_APU_PROYECTO_CUADRILLA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Proyecto_CuadrillaRecursoKCG" %>
    
  <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <asp:UpdatePanel ID="uppFv" 
    runat="server" 
    UpdateMode="Conditional">
        <ContentTemplate>
    <asp:FormView ID="fvMaestroApuProyecto" 
        runat="server" 
        DataSourceID="odsFvMaestroApuProyecto" 
        DataKeyNames="Cuadrilla_Sumatoria,Cuadrilla_Coeficiente_sumatoria, Costo_Mano_Obra">
        <EditItemTemplate>
        </EditItemTemplate>
        
        <InsertItemTemplate>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Cuadrilla_ProyectoRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                runat="server"
                                Text='<%#GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                TabIndex="-1" 
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:TextBox ID="Nombre" 
                                ReadOnly="true" 
                                TabIndex="-1" 
                                Width="400px"
                                Height="50px"
                                runat="server"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG" 
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblEstado_Nombre"
                                runat="server"
                                Text="Estado">
                            </asp:Label>
                            
                        </td>
                        <td>
                            <asp:TextBox ID="Estado_Nombre" 
                                ReadOnly="true"
                                TabIndex="-1" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'
                                ToolTip='<%#GetLocalResourceObject("Estado_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Directo"
                                runat="server"
                                Text='<%#GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Directo"
                                Style="text-align:right"
                                TabIndex="-1" 
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Directo","{0:N4}") %>'
                                ToolTip='<%#GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Moneda"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label> 
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Indirecto"
                                runat="server"
                                Text='<%#GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Indirecto"
                                Style="text-align:right"
                                TabIndex="-1"  
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Costo_Indirecto","{0:N4}") %>'
                                ToolTip='<%#GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label1"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Total"
                                runat="server"
                                Text='<%#GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Costo_Total"
                                Style="text-align:right"
                                TabIndex="-1" 
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Total","{0:N4}") %>'
                                ToolTip='<%#GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lbl_CostoManoObra"
                                runat="server"
                                Text="Costo Mano Obra">
                            </asp:Label>
                        </td>
                        <td>                            
                            <asp:TextBox ID="Costo_Mano_Obra"
                                Style="text-align:right"
                                TabIndex="-1" 
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>' 
                                BackColor="255,255,192">
                            </asp:TextBox>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Button 
        ID="Btn_Apu_Proyecto_Cuadrilla_Listado"
        runat="server"
        meta:resourcekey="Btn_Apu_ProyectoRecursoKCG" 
        OnClick="Btn_Apu_Proyecto_Cuadrilla_Listado_Click" />
        
    <asp:Button 
        ID="Btn_Reporte_Cuadrilla" 
        runat="server" 
        Text="Reporte" 
        OnClick="Btn_Reporte_Cuadrilla_Click" />
        
    <asp:Button
        ID="Btn_Formula_Polinomica"
        runat="server"
        meta:resourcekey="Btn_Apu_Proyecto_Cuadrilla_FormPoliRecursoKCG"
        OnClick="Btn_Formula_Polinomica_Click" />
        
    <asp:ObjectDataSource ID="odsFvMaestroApuProyecto" 
        runat="server" 
        SelectMethod="GetById" 
        TypeName="FEL.APU.BO_Apu_Proyecto" 
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Id" 
                QueryStringField="Apu_Proyecto_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:UpdatePanel 
        ID="uppGv" 
        runat="server">
        <ContentTemplate>
            <asp:Panel 
                ID="pnlIndices"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_CuadrillaRecursoKCG">
                <table>
                    <tr>
                        <td>                            
                            <koala:KGrid
                                ID="Gv_Apu_Proyecto_Cuadrilla_Diferencia" 
                                runat="server"                                
                                RowStyle-BackColor="turquoise"
                                AutoGenerateColumns="False" 
                                DataKeyNames="Id" 
                                DataSourceID="odsGv_Apu_Proyecto_Cuadrilla_Diferencia"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                    <HeaderStyle CssClass="headerstyle" />
                                    <PagerStyle CssClass="pagerstyle" />
                                    <SelectedRowStyle CssClass="selectedrowstyle" />
                                <Columns>
                                    <asp:BoundField 
                                        DataField="Apu_Cuadrilla_Nombre" 
                                        meta:resourcekey="BoundApu_Cuadrilla_NombreRecursoKCG"
                                        SortExpression="Apu_Cuadrilla_Nombre">
                                        <ItemStyle Width="159mm" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Costo_Total" 
                                        meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                        SortExpression="Costo_Total"
                                        dataformatstring="{0:N4}">
                                        <headerstyle wrap="False" />
                                        <ItemStyle HorizontalAlign="Right" width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Costo_Hora" 
                                        meta:resourcekey="BoundCosto_HoraRecursoKCG"
                                        SortExpression="Costo_Hora"
                                        dataformatstring="{0:N4}">
                                        <headerstyle wrap="False" />
                                        <ItemStyle HorizontalAlign="Right" width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Numero_trabajadores" 
                                        meta:resourcekey="BoundNumero_trabajadoresRecursoKCG"
                                        SortExpression="Numero_trabajadores" dataformatstring="{0:N4}">
                                        <ItemStyle HorizontalAlign="Right" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Coeficiente" 
                                        meta:resourcekey="BoundCoeficienteRecursoKCG"
                                        SortExpression="Coeficiente" dataformatstring="{0:N4}">                                       
                                        <ItemStyle HorizontalAlign="Right" Width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Apu_Proyecto_Id" 
                                        HeaderText="Apu_Proyecto_Id" 
                                        SortExpression="Apu_Proyecto_Id"
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_Proyecto_Codigo" 
                                        HeaderText="Apu_Proyecto_Codigo"
                                        SortExpression="Apu_Proyecto_Codigo" 
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_Proyecto_Nombre" 
                                        HeaderText="Apu_Proyecto_Nombre"
                                        SortExpression="Apu_Proyecto_Nombre" 
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_Proyecto_Etapa" 
                                        HeaderText="Apu_Proyecto_Etapa" 
                                        SortExpression="Apu_Proyecto_Etapa"
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_Cuadrilla_Codigo" 
                                        HeaderText="Apu_Cuadrilla_Codigo"
                                        SortExpression="Apu_Cuadrilla_Codigo" 
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
                            <asp:ObjectDataSource 
                                ID="odsGv_Apu_Proyecto_Cuadrilla_Diferencia" 
                                runat="server"
                                OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetByProyecto" 
                                TypeName="FEL.APU.BO_Apu_Proyecto_Cuadrilla_Diferencia">
                                <SelectParameters>
                                    <asp:SessionParameter 
                                        Name="s" 
                                        SessionField="Scope" Type="Object" />
                                    <asp:QueryStringParameter 
                                        Name="apu_proyecto_id" 
                                        QueryStringField="apu_proyecto_id"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <koala:KGrid ID="gvDetalleApuProyectoCuadrilla"
                                runat="server" 
                                AllowPaging="True" 
                                AllowSorting="True" 
                                AutoGenerateColumns="False" 
                                DataSourceID="odsDetalleApuProyectoCuadrilla"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                    <HeaderStyle CssClass="headerstyle" />
                                    <PagerStyle CssClass="pagerstyle" />
                                    <SelectedRowStyle CssClass="selectedrowstyle" />                        
                                    <Columns>
                                        <asp:BoundField DataField="Apu_Cuadrilla_Nombre" 
                                            meta:resourcekey="BoundApu_Cuadrilla_NombreRecursoKCG"
                                            SortExpression="Apu_Cuadrilla_Nombre">
                                            <itemstyle wrap="False" width="600px" />
                                        </asp:BoundField>                
                                        <asp:BoundField DataField="Costo_Total" 
                                            meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                            SortExpression="Costo_Total" 
                                            dataformatstring="{0:N4}">
                                            <headerstyle wrap="False" />
                                            <itemstyle horizontalalign="Right" width="70px" /> 
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Costo_Hora" 
                                            meta:resourcekey="BoundCosto_HoraRecursoKCG"
                                            SortExpression="Costo_Hora" 
                                            dataformatstring="{0:N4}">
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Numero_trabajadores" 
                                            meta:resourcekey="BoundNumero_trabajadoresRecursoKCG"
                                            SortExpression="Numero_trabajadores" dataformatstring="{0:N4}">
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Coeficiente" 
                                            meta:resourcekey="BoundCoeficienteRecursoKCG"
                                            SortExpression="Coeficiente" dataformatstring="{0:N3}">
                                            <itemstyle horizontalalign="Right" width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Prueba" 
                                            HeaderText="Prueba"
                                            SortExpression="Prueba"
                                            Visible="False" >
                                            <itemstyle horizontalalign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                            </koala:KGrid>
                        </td>
                    </tr>
                    <tr>
                        <td
                            align="right">
                            <asp:TextBox 
                                ID="CuadrillaSumatoria"
                                Style="text-align:right"                                
                                Width="70px"
                                runat="server"
                                ReadOnly="true"
                                BackColor="255,255,192">
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="TextBox1" 
                                Width="70px"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="TextBox2" 
                                Width="105px"
                                BorderColor="white"
                                BorderStyle="Solid"
                                ReadOnly="true"
                                runat="server"
                                Text="">
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="CuadrillaCoeficienteSumatoria"
                                Style="text-align:right"
                                Width="70px"
                                runat="server"
                                ReadOnly="true">
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsDetalleApuProyectoCuadrilla" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Cuadrilla">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="apu_proyecto_id" 
                QueryStringField="Apu_Proyecto_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>

