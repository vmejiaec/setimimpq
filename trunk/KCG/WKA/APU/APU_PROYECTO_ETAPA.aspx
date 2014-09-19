<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_ETAPA.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_PROYECTO_ETAPA" 
    meta:resourcekey="Tit_Apu_Proyecto_EtapaRecursoKCG" %>
    
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
            <asp:Panel
                runat="server"
                ID="Rec_Apu_Proyecto_Etapa"
                meta:resourcekey="Rec_Apu_Proyecto_EtapaRecursoKCG">
                
                <asp:FormView 
                    ID="fvApuProyectoEtapa" 
                    runat="server" 
                    DataSourceID="odsfvApuProyectoEtapa" 
                    DefaultMode="Edit">                
                    
                    <EditItemTemplate>                    
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblEtapa" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("EtapaRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="DropDownList1" 
                                        runat="server" 
                                        DataSourceID="odsProyectoEtapa"
                                        ToolTip='<%# GetLocalResourceObject("EtapaRecursoKCG.ToolTip").ToString() %>'
                                        DataTextField="Nombre" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Bind("Etapa") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsProyectoEtapa" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Etapa_Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                DefaultValue="" 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="APU_PROYECTO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="ETAPA" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>                                                                                       
                            </tr>
                            <tr>
                                <td
                                    colspan="2"
                                    align="left">
                                    <asp:Button 
                                        ID="UpdateButton" 
                                        runat="server"
                                        ValidationGroup="I" 
                                        CausesValidation="True" 
                                        CommandName="Update"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="Btn_Apu_Proyecto_Cancelar" 
                                        runat="server" 
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>' 
                                        OnClick="Btn_Apu_Proyecto_Cancelar_Click" >                                        
                                    </asp:Button>                                                              
                                </td>                        
                            </tr>
                        </table>
                        
                        <%--Ids--%>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Lugar_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Id"
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_provincia_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_provincia_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Codigo_Institucion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo_Institucion") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Area" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Area") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto" 
                            runat="server" 
                            Visible="false"                            
                            Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Equipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Equipo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Mano_Obra" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Mano_Obra") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Material" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Material") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Directo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Directo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Total" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Total") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Costo_Metro_Cuadrado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Indice_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Indice_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Suma_Porcentaje_Indice_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Etapa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Etapa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>                     
                        
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>                        
                    </EditItemTemplate>
                    
                    <InsertItemTemplate>
                        
                    </InsertItemTemplate>
                    
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label 
                                        ID="lblEtapa" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("EtapaRecursoKCG.Text").ToString() %>'> 
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList 
                                        ID="DropDownList1" 
                                        runat="server" 
                                        DataSourceID="odsProyectoEtapa"
                                        ToolTip='<%# GetLocalResourceObject("EtapaRecursoKCG.ToolTip").ToString() %>'
                                        DataTextField="Nombre" 
                                        Enabled="false"
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Bind("Etapa") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsProyectoEtapa" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio">
                                        <SelectParameters>
                                            <asp:Parameter 
                                                DefaultValue="Etapa_Nombre" 
                                                Name="sortExpression" 
                                                Type="String" />
                                            <asp:SessionParameter 
                                                DefaultValue="" 
                                                Name="s" 
                                                SessionField="Scope" 
                                                Type="Object" />
                                            <asp:Parameter 
                                                DefaultValue="APU_PROYECTO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="ETAPA" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>                                                                                       
                            </tr>
                            <tr>
                                <td
                                    colspan="2">                                    
                                    <asp:Button 
                                        ID="EditButton" 
                                        runat="server"
                                        CausesValidation="False" 
                                        CommandName="Edit"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EditarRecursoKCG.AccesKey").ToString() %>'  
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_EditRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="Btn_Listado" 
                                        runat="server"                               
                                        Text='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Etapa_ProyectoRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# GetLocalResourceObject("Btn_Apu_Proyecto_Etapa_ProyectoRecursoKCG.ToolTip").ToString() %>' 
                                        OnClick="Btn_Oferta_Click" > 
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                        
                        <%--Ids--%>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Update_Per_Personal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Lugar_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Id"
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Sucursal_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Moneda_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_provincia_id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_provincia_id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
                        <asp:TextBox 
                            ID="Codigo_Institucion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo_Institucion") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Area" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Area") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto" 
                            runat="server" 
                            Visible="false"                            
                            Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Fecha_Creacion" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Creacion") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Fecha_Update" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Fecha_Update") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Lugar_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Lugar_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Sucursal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Sucursal_Nombre") %>'>
                        </asp:TextBox>                        
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Codigo" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Creacion_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Update_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coordinador_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Tecnico_Per_Personal_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Moneda_Simbolo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Equipo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Equipo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Mano_Obra" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Mano_Obra") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Material" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Material") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Directo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Directo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Total" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Total") %>'>
                        </asp:TextBox>
                       
                        <asp:TextBox 
                            ID="Costo_Metro_Cuadrado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Porcentaje_Costo_Indirecto_Otros" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Indice_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Indice_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Cuadrilla_Coeficiente_Sumatoria" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Suma_Porcentaje_Indice_Transporte" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Etapa_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Etapa_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:TextBox>             
                        
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                                                
                </asp:FormView>
            </asp:Panel>            
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsfvApuProyectoEtapa" 
        runat="server" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        TypeName="FEL.APU.BO_Apu_Proyecto" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues" 
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
    
</asp:Content>

