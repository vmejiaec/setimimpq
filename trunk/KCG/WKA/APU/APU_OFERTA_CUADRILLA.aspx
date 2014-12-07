<%@ Import namespace="Koala.KoalaWebControls"%>
<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_CUADRILLA.aspx.cs" 
    Inherits="APU_APU_OFERTA_CUADRILLA" 
    meta:resourcekey="Tit_Apu_Oferta_CuadrillaRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <asp:UpdatePanel ID="uppApuOfertaCuadrilla" 
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
        
    
    <asp:FormView ID="fvMaestroApuOferta" 
        runat="server" 
        DataSourceID="odsFvMaestroApuOferta"
        DataKeyNames="Cuadrilla_Sumatoria,Cuadrilla_Coeficiente_sumatoria">
        
        <EditItemTemplate>
        </EditItemTemplate>
        
        <InsertItemTemplate>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="Rec_Apu_Oferta_Cuadrilla_Oferta"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Cuadrilla_OfertaRecursoKCG">
                <table style="white-space:nowrap">
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                runat="server"
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo" 
                                ReadOnly="true"
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
                                Text='<%# GetLocalResourceObject("EstadoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Estado_Nombre"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>' 
                                ToolTip='<%# GetLocalResourceObject("EstadoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Directo"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Directo"
                                Style="text-align:right"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Directo","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="lblMonedaSimbolo"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCosto_Indirecto"
                                runat="server"
                                Text='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Indirecto"
                                Style="text-align:right"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Indirecto","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_IndirectoRecursoKCG.ToolTip").ToString() %>'>
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
                                Text='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Costo_Total"
                                Style="text-align:right"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Costo_Total","{0:N2}") %>'
                                ToolTip='<%# GetLocalResourceObject("Costo_TotalRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("Int_Moneda_Simbolo") %>'>
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl_Mano_Obra"
                                runat="server"
                                Text="Costo Mano Obra">
                            </asp:Label>
                        </td>
                        <td>                            
                            <asp:TextBox ID="Costo_Mano_Obra"                                
                                style="display:none"
                                runat="server"                                 
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>'
                                 BackColor="255,255,192">
                            </asp:TextBox>
                            <asp:TextBox ID="txtCosto_MO"                                
                                onfocus="this.blur()" 
                                TabIndex="-1"
                                runat="server"
                                Text='<%# Bind("Costo_Mano_Obra","{0:N2}") %>'
                                Style="text-align:right" 
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
            
            <asp:TextBox 
                ID="Etapa_Nombre"
                runat="server"
                Style="text-align:right"
                Visible="false"                              
                Text='<%# Bind("Etapa_Nombre") %>'>
            </asp:TextBox>
            
            
        </ItemTemplate>
    </asp:FormView>
    <asp:Panel 
        ID="Panel1" 
        runat="server" 
        GroupingText="-">
        <table>
            <tr>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Cuadrilla_Listado"
                        runat="server"
                        meta:resourcekey="Btn_Apu_Oferta_Cuadrilla_ListadoRecursoKCG" />
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Cuadrilla_Reporte" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Cuadrilla_ReporteRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Cuadrilla_Reporte_Click" /> 
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Cuadrilla_FormPoli" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Cuadrilla_FormPoliRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Cuadrilla_FormPoli_Click" /> 
                </td>
            </tr>
        </table>
    </asp:Panel>                     
        <asp:Panel ID="pnl_Listado"
            runat="server"
            meta:resourcekey="Rec_Apu_Oferta_CuadrillaRecursoKCG">
            <table>
                <tr>    
                    <td>
                        <koala:KGrid   
                            ID="Gv_Apu_Oferta_Cuadrilla_Diferencia" 
                            runat="server" 
                            AutoGenerateColumns="False"
                            RowStyle-BackColor="turquoise"
                            DataSourceID="odsGv_Apu_Oferta_Cuadrilla_Diferencia" 
                            DataKeyNames="Id"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                            <AlternatingRowStyle CssClass="alternatingrowstyle" />
                            <HeaderStyle CssClass="headerstyle" />
                            <PagerStyle CssClass="pagerstyle" />
                            <SelectedRowStyle CssClass="selectedrowstyle" />
                            <Columns>
                                <asp:BoundField 
                                    DataField="Apu_Cuadrilla_Nombre" 
                                    meta:resourcekey="BoundApu_Cuadrilla_NombreRecursoKCG"
                                    SortExpression="Apu_Cuadrilla_Nombre" >
                                    <ItemStyle Width="159mm" Wrap="False" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="costo_total" 
                                    meta:resourcekey="Boundcosto_totalRecursoKCG"
                                    SortExpression="costo_total" 
                                    DataFormatString="{0:N2}" >
                                    <ItemStyle HorizontalAlign="Right" Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Hora" 
                                    HeaderText="Costo Hora"
                                    SortExpression="Costo_Hora" DataFormatString="{0:N4}" >
                                    <ItemStyle HorizontalAlign="Center" Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Numero_trabajadores" 
                                    HeaderText="Nro. Trabajadores"
                                    SortExpression="Numero_trabajadores" 
                                    DataFormatString="{0:N4}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Coeficiente" 
                                    meta:resourcekey="BoundCoeficienteRecursoKCG"
                                    SortExpression="Coeficiente" DataFormatString="{0:N3}" >
                                    <ItemStyle HorizontalAlign="Right" Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Apu_Oferta_Id" 
                                    HeaderText="Apu_Oferta_Id" 
                                    SortExpression="Apu_Oferta_Id" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Apu_Oferta_Codigo" 
                                    HeaderText="Apu_Oferta_Codigo" 
                                    SortExpression="Apu_Oferta_Codigo" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Apu_Oferta_Nombre" 
                                    HeaderText="Apu_Oferta_Nombre" 
                                    SortExpression="Apu_Oferta_Nombre" 
                                    Visible="False" />
                                <asp:BoundField 
                                    DataField="Apu_Oferta_Etapa" 
                                    HeaderText="Apu_Oferta_Etapa" 
                                    SortExpression="Apu_Oferta_Etapa" 
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
                            ID="odsGv_Apu_Oferta_Cuadrilla_Diferencia" 
                            runat="server" 
                            OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetByOferta" 
                            TypeName="FEL.APU.BO_Apu_Oferta_Cuadrilla_Diferencia" 
                            ConflictDetection="CompareAllValues">
                            <SelectParameters>
                                <asp:SessionParameter 
                                    Name="s" 
                                    SessionField="Scope" 
                                    Type="Object" />
                                <asp:QueryStringParameter 
                                    Name="Apu_Oferta_Id" 
                                    QueryStringField="Apu_Oferta_Id" 
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <koala:KGrid ID="gvDetalleApuOfertaCuadrilla" 
                            Width="100%"
                            runat="server" 
                            AllowPaging="True" 
                            AutoGenerateColumns="False" 
                            PageSize="20"
                            DataSourceID="odsGvDetalleApuOfertaCuadrilla">                        
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
                                    dataformatstring="{0:N2}">
                                    <headerstyle wrap="False" />
                                    <ItemStyle HorizontalAlign="Right" width="70px" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Costo_Hora" 
                                    HeaderText="Costo Hora"
                                    SortExpression="Costo_Hora"
                                    dataformatstring="{0:N4}">
                                    <headerstyle wrap="true" />
                                    <ItemStyle HorizontalAlign="Right" width="70px" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Numero_trabajadores" 
                                    HeaderText="Nro. Trabajadores"
                                    SortExpression="Numero_trabajadores"
                                    DataFormatString="{0:N4}" >
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField 
                                    DataField="Coeficiente" 
                                    meta:resourcekey="BoundCoeficienteRecursoKCG"
                                    SortExpression="Coeficiente" DataFormatString="{0:N3}" >
                                    <itemstyle horizontalalign="Right" width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Id" 
                                    Visible="False"
                                    SortExpression="Id" />
                            </Columns>
                        </koala:KGrid>
                    </td>
                </tr>
                <tr style="display:none">
                    <td
                        align="right">
                        <asp:TextBox 
                            ID="CuadrillaSumatoria"
                            style="text-align:right"
                            Width="70px"
                            runat="server"
                            BackColor="255,255,192"
                            ReadOnly="true" />
                        <asp:TextBox 
                            ID="CuadrillaCoeficienteSumatoria"
                            style="text-align:right"
                            Width="70px"
                            runat="server"
                            ReadOnly="true" />
                    </td>
                </tr>
            </table>
        </asp:Panel>    
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsFvMaestroApuOferta" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByIdResumido" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Oferta">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Oferta_Id" 
                QueryStringField="Apu_Oferta_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
    
    <asp:ObjectDataSource 
        ID="odsGvDetalleApuOfertaCuadrilla" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.APU.BO_Apu_Oferta_Cuadrilla">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Oferta_Id" 
                QueryStringField="Apu_Oferta_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

