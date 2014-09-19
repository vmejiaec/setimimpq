<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_INDICE.aspx.cs" 
    Inherits="APU_APU_PROYECTO_INDICE" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Proyecto_IndiceRecursoKCG" %>
    
  <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:UpdatePanel ID="uppFv" 
        runat="server" >
        <ContentTemplate>
            <asp:FormView ID="fvMaestroApuProyecto" 
                runat="server" 
                DataSourceID="odsFvMaestroApuProyecto" 
                DataKeyNames="Indice_Sumatoria,Coeficiente_Sumatoria">
                
                <EditItemTemplate>
                   
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    
                </InsertItemTemplate>
                
                <ItemTemplate>
                    <asp:Panel ID="pnlProyecto" 
                        runat="server"
                        meta:resourcekey="Rec_Apu_Proyecto_Indice_ProyectoRecursoKCG">
                        <table>
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
                                        runat="server" 
                                        TabIndex="-1"
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
                                        Width="400px"
                                        TabIndex="-1"
                                        runat="server" 
                                        TextMode="MultiLine"
                                        Height="50px"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Nombre") %>'
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label ID="lbl_Estado"
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
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        runat="server" 
                                        BackColor="255,255,192"
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
                        </table>
                    </asp:Panel>
                    <asp:TextBox
                        ID="Etapa_Nombre"
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Etapa_Nombre") %>'>
                    </asp:TextBox>
                </ItemTemplate>
            </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel> 
        
    <asp:Button 
        ID="Btn_Apu_Proyecto_Indice_Cuadrilla"
        runat="Server"
        meta:resourcekey="Btn_Apu_Proyecto_Indice_CuadrillaRecursoKCG" />
    
    <asp:Button 
        ID="Btn_Apu_Proyecto_Indice_Listado"
        runat="Server"
        meta:resourcekey="Btn_Apu_ProyectoRecursoKCG"         
        OnClick="Btn_Apu_Proyecto_Indice_Listado_Click" />    
        
    <asp:Button 
        ID="Btn_Reporte_Indice" 
        runat="server" 
        meta:resourcekey="Btn_Apu_Proyecto_Indice_ReporteRecursoKCG"          
        OnClick="Btn_Reporte_Indice_Click" /> 
    
    <asp:Button
        ID="Btn_Equipo"
        runat="server"
        meta:resourcekey="Btn_Apu_Proyecto_Indice_EquipoRecursoKCG"
        OnClick="Btn_Equipo_Click" />
        
    <asp:Button
        ID="Btn_Material"
        runat="server"
        meta:resourcekey="Btn_Apu_Proyecto_Indice_MaterialRecursoKCG"
        OnClick="Btn_Material_click" />
        
    <asp:Button
        ID="Btn_Transporte"
        runat="server"
        meta:resourcekey="Btn_Apu_Proyecto_Indice_TransporteRecursoKCG"
        OnClick="Btn_Transporte_Click" />
        
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    
    <asp:ObjectDataSource 
        ID="odsFvMaestroApuProyecto" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
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
            <asp:Panel ID="pnlIndices"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Indice_IndiceRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <koala:KGrid 
                                ID="GridView1" 
                                runat="server" 
                                RowStyle-BackColor="turquoise"
                                AutoGenerateColumns="False" 
                                DataSourceID="odsgv2ApuProyectoIndice"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                                    <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                    <HeaderStyle CssClass="headerstyle" />
                                    <PagerStyle CssClass="pagerstyle" />
                                    <SelectedRowStyle CssClass="selectedrowstyle" />
                                <Columns>
                                    <asp:BoundField 
                                        DataField="Apu_Indice_Nombre" 
                                        meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                        SortExpression="Apu_Indice_Nombre">
                                        <itemstyle wrap="False" width="700px"/>
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="costo_total" 
                                        meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                        SortExpression="Costo_Total" 
                                        dataformatstring="{0:N4}">
                                        <headerstyle wrap="False" />
                                        <itemstyle horizontalalign="Right" width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField 
                                        DataField="Coeficiente" 
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
                                        DataField="Apu_Proyecto_Id" 
                                        HeaderText="Apu_Proyecto_Id" 
                                        SortExpression="Apu_Proyecto_Id"
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_proyecto_Codigo" 
                                        HeaderText="Apu_proyecto_Codigo"
                                        SortExpression="Apu_proyecto_Codigo"
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_proyecto_Nombre" 
                                        HeaderText="Apu_proyecto_Nombre"
                                        SortExpression="Apu_proyecto_Nombre"
                                        Visible="False" />
                                    <asp:BoundField 
                                        DataField="Apu_proyecto_Etapa" 
                                        HeaderText="Apu_proyecto_Etapa" 
                                        SortExpression="Apu_proyecto_Etapa"
                                        Visible="False" />                                    
                                    <asp:BoundField 
                                        DataField="Apu_Indice_Codigo" 
                                        HeaderText="Apu_Indice_Codigo" 
                                        SortExpression="Apu_Indice_Codigo"
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
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <koala:KGrid 
                                ID="gvApuProtectoIndice"       
                                runat="server"         
                                AutoGenerateColumns="False"                         
                                DataSourceID="odsGvDetalleApuProyectoIndice"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>        
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="selectedrowstyle" />
                                
                                <Columns>
                                    <asp:BoundField DataField="Apu_Indice_Nombre" 
                                        meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                                        SortExpression="Apu_Indice_Nombre">
                                        <itemstyle wrap="False" width="700px"/>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Costo_Total" 
                                        meta:resourcekey="BoundCosto_TotalRecursoKCG"
                                        SortExpression="Costo_Total" 
                                        dataformatstring="{0:N4}">
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
                                    <asp:BoundField DataField="Nombre" 
                                        Visible="False" SortExpression="Nombre" />            
                                </Columns>
                            </koala:KGrid>
                        </td>
                    </tr>
                    <tr>
                        <td
                            align="right">
                            <asp:TextBox 
                                ID="IndiceSumatoria"
                                Width="70px"
                                Style="text-align:right"
                                runat="server"
                                BackColor="255,255,192">
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="CoeficienteSumatoria"
                                Width="69px"
                                Style="text-align:right"
                                runat="server">
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
    <asp:ObjectDataSource ID="odsGvDetalleApuProyectoIndice" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get"         
        TypeName="FEL.APU.BO_Apu_Proyecto_Indice">
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
    <asp:ObjectDataSource 
        ID="odsgv2ApuProyectoIndice" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByProyecto" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Diferencia">
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

