<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_OFERTA_INDICE.aspx.cs" 
    Inherits="APU_APU_OFERTA_INDICE" 
    meta:resourcekey="Tit_Apu_Oferta_IndiceRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <asp:UpdatePanel ID="uppApuOfertaIndice"
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>

    <asp:FormView ID="fvMaestroApuOferta" 
        runat="server" 
        DataSourceID="odsFvMaestroApuOferta"
        DataKeyNames="Indice_Sumatoria,Coeficiente_Sumatoria">
        
        <EditItemTemplate>
        </EditItemTemplate>
        
        <InsertItemTemplate>
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="Rec_Apu_Oferta_Indice_Oferta"
                runat="server"
                meta:resourcekey="Rec_Apu_Oferta_Indice_OfertaRecursoKCG">
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
                                ToolTip='<%# GetLocalResourceObject("Costo_DirectoRecursoKCG.ToolTip").ToString() %>'
                                BackColor="255,255,192" >
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
                </table>
            </asp:Panel>
        </ItemTemplate>
    </asp:FormView>
    <asp:Panel 
        ID="pnl_Botones" 
        runat="server"
        GroupingText="-" >
        <table>
            <tr>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Cuadrilla"
                        runat="server"
                        meta:resourcekey="Btn_Apu_Oferta_Indice_CuadrillaRecursoKCG" />
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Oferta_Listado"
                        runat="server"
                        meta:resourcekey="Btn_Apu_Oferta_Indice_Oferta_ListadoRecursoKCG" />  
                </td>
                <td>
                    <asp:Button 
                        ID="BtnOferta" 
                        runat="server"                   
                        OnClick="BtnOferta_Click"
                        meta:resourcekey="Btn_Apu_OfertaRecursoKCG" />     
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Reporte" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Indice_ReporteRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Indice_Reporte_Click" />  
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Equipo" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Indice_EquipoRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Indice_Equipo_Click" />  
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Material" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Indice_MaterialRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Indice_Material_Click" />  
                </td>
                <td>
                    <asp:Button 
                        ID="Btn_Apu_Oferta_Indice_Transporte" 
                        runat="server" 
                        meta:resourcekey="Btn_Apu_Oferta_Indice_TransporteRecursoKCG"
                        OnClick="Btn_Apu_Oferta_Indice_Transporte_Click" />  
                </td>
            </tr>
        </table>
    </asp:Panel>                    

    <asp:Panel ID="Rec_Apu_Oferta_Indice_Oferta"
        runat="server"
        meta:resourcekey="Rec_Apu_Oferta_Indice_OfertaRecursoKCG">  
        <table>
            <tr>
                <td>
                    <koala:KGrid 
                        ID="GridView1" 
                        runat="server" 
                        RowStyle-BackColor="turquoise"
                        AutoGenerateColumns="False" 
                        DataSourceID="odsgv2ApuOfertaIndice"
                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                            <AlternatingRowStyle CssClass="alternatingrowstyle" />
                            <HeaderStyle CssClass="headerstyle" />
                            <PagerStyle CssClass="pagerstyle" />
                            <SelectedRowStyle CssClass="selectedrowstyle" />
                        <Columns>
                            <asp:BoundField 
                                DataField="Apu_Indice_Nombre" 
                                meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                SortExpression="Apu_Indice_Nombre" >
                                <itemstyle wrap="False" width="600px"/>
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="costo_total" 
                                meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                SortExpression="Costo_Total" 
                                dataformatstring="{0:N2}">
                                <headerstyle wrap="False" />
                                <itemstyle horizontalalign="Right" width="70px" />
                            </asp:BoundField>
                            <asp:BoundField     
                                DataField="coeficiente" 
                                meta:resourcekey="BoundCoeficienteRecursoKCG"
                                SortExpression="Coeficiente" dataformatstring="{0:N3}">
                                <itemstyle horizontalalign="Right" width="70px" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Letra" 
                                meta:resourcekey="BoundLetraRecursoKCG"
                                SortExpression="Letra" >
                                <itemstyle horizontalalign="Center" />
                            </asp:BoundField>
                            <asp:BoundField 
                                DataField="Apu_Oferta_Id" 
                                HeaderText="Apu_Oferta_Id" 
                                SortExpression="Apu_Oferta_Id"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Apu_Oferta_Codigo" 
                                HeaderText="Apu_Oferta_Codigo" 
                                SortExpression="Apu_Oferta_Codigo"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Apu_Oferta_Nombre" 
                                HeaderText="Apu_Oferta_Nombre" 
                                SortExpression="Apu_Oferta_Nombre"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Apu_Oferta_Etapa" 
                                HeaderText="Apu_Oferta_Etapa" 
                                SortExpression="Apu_Oferta_Etapa"
                                Visible="false" />                                
                            <asp:BoundField 
                                DataField="Apu_Indice_Codigo" 
                                HeaderText="Apu_Indice_Codigo" 
                                SortExpression="Apu_Indice_Codigo"
                                Visible="false" />                         
                            <asp:BoundField 
                                DataField="Id" 
                                HeaderText="Id" 
                                SortExpression="Id"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Codigo" 
                                HeaderText="Codigo" 
                                SortExpression="Codigo"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Codigo_int" 
                                HeaderText="Codigo_int" 
                                SortExpression="Codigo_int"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Nombre" 
                                HeaderText="Nombre" 
                                SortExpression="Nombre"
                                Visible="false" />
                            <asp:BoundField 
                                DataField="Estado" 
                                HeaderText="Estado" 
                                SortExpression="Estado"
                                Visible="false" />
                        </Columns>
                    </koala:KGrid>                                            
                </td>
            </tr>
            <tr>
                <td>
                    <koala:KGrid ID="gvDetalleApuOfertaIndice" 
                        Width="100%"
                        runat="server"
                        AllowSorting="False" 
                        AllowPaging="False" 
                        AutoGenerateColumns="False" 
                        DataSourceID="odsGvDetalleApuOfertaIndice"
                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <PagerStyle CssClass="pagerstyle" />
                        <SelectedRowStyle CssClass="selectedrowstyle" />
                        <Columns>
                            <asp:BoundField DataField="Apu_Indice_Nombre" 
                                meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                SortExpression="Apu_Indice_Nombre" >
                                <itemstyle wrap="False" width="600px"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="Costo_Total" 
                                meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                SortExpression="Costo_Total" 
                                dataformatstring="{0:N2}">
                                <headerstyle wrap="False" />
                                <itemstyle horizontalalign="Right" width="70px" />
                            </asp:BoundField>   
                            <asp:BoundField DataField="Coeficiente" 
                                meta:resourcekey="BoundCoeficienteRecursoKCG"
                                SortExpression="Coeficiente" dataformatstring="{0:N3}">
                                <itemstyle horizontalalign="Right" width="70px" />
                            </asp:BoundField>  
                            <asp:BoundField DataField="Letra" 
                                meta:resourcekey="BoundLetraRecursoKCG"
                                SortExpression="Letra" >
                                <itemstyle horizontalalign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Id" 
                                Visible="False"
                                SortExpression="Id" />
                        </Columns>
                    </koala:KGrid>
                </td>
            </tr>
            <tr>
                <td
                    align="right" style="display:none">
                    <asp:TextBox 
                        ID="IndiceSumatoria"
                        runat="server"
                        Width="70px"
                        Style="text-align:right"
                        BackColor="255,255,192"
                        ReadOnly="true">
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="CoeficienteSumatoria"
                        runat="server"
                        Width="69px"
                        Style="text-align:right"
                        ReadOnly="true">
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="TextBox1" 
                        Width="30px"
                        BorderColor="white"
                        BorderStyle="Solid"
                        ReadOnly="true"
                        runat="server"
                        Text="">
                    </asp:TextBox>
                </td>
            </tr>
        </table>  
    </asp:Panel>
    </ContentTemplate>    
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvMaestroApuOferta" 
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
        
    <asp:ObjectDataSource ID="odsGvDetalleApuOfertaIndice" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.APU.BO_Apu_Oferta_Indice">
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
        ID="odsgv2ApuOfertaIndice" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByOferta" 
        TypeName="FEL.APU.BO_Apu_Oferta_Diferencia">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="apu_oferta_id" 
                QueryStringField="Apu_Oferta_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

