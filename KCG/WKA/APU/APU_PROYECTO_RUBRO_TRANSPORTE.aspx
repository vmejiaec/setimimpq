<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_TRANSPORTE.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO_TRANSPORTE" 
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_TransporteRecursoKCG" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>
    
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
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:FormView 
                ID="fvApuProyectoRubroTransporte" 
                runat="server"
                DataSourceID="odsfvApuProyectoRubroTransporte" 
                DefaultMode = "Insert">
                
                <EditItemTemplate>
                    
                </EditItemTemplate>        
                        
                <InsertItemTemplate>
                    <%--Panel de Proyecto--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte_Proyecto"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_Transporte_ProyectoRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"  
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'   
                                        ReadOnly="true"                                                                                                                                
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>                                
                        </table>                      
                    </asp:Panel>
                    <%--Panel de Rubro--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte_Rubro"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_Transporte_RubroRecursoKCG">
                        <table>                            
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                        ID="Label2"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        Width="580px"
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblUnidad"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>                                    
                            </tr>
                        </table>                        
                    </asp:Panel>
                    <%--Panel de Transporte de Material--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_TransporteRecursoKCG">
                        <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>                                    
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblMaterialNombre"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Material_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblMaterialUnidad"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Unidad" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.Text").ToString() %>'
                                        ID="lblCostoUnitarioTransporte"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="costo_unitario_transporte" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("costo_unitario_transporte","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        Text='<%# Bind("int_moneda_simbolo") %>'
                                        ID="lblint_moneda_simbolo2"                                                                                  
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'
                                        ID="Label7"                                   
                                        runat="server">
                                    </asp:Label>                                
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="Cantidad" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'
                                        ID="Label8"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="costo_total" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("costo_total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        Text='<%# Bind("int_moneda_simbolo") %>'
                                        ID="lblint_moneda_simbolo1"                                
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                
                    <%--Ids--%>               
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Rubro_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                    </asp:TextBox>
                        
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Nombre" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Costo_Parcial" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
                    </asp:TextBox>                    
                    
                    <asp:TextBox 
                        ID="costo_unitario" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_unitario") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Costo_Otros" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
                    </asp:TextBox>

                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Rubro_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="costo_total_transporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_total_transporte") %>'>
                    </asp:TextBox>    
                </InsertItemTemplate>                
                <ItemTemplate>
                    <%--Panel de Proyecto--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte_Proyecto"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_Transporte_ProyectoRecursoKCG">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigo"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Codigo" 
                                        runat="server"  
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>'   
                                        ReadOnly="true"                                                                                                                                
                                        Text='<%# Bind("Apu_Proyecto_Codigo") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Proyecto_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                                    </asp:TextBox>                                        
                                </td>
                            </tr>                                
                        </table>                      
                    </asp:Panel>
                    <%--Panel de Rubro--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte_Rubro"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_Transporte_RubroRecursoKCG">
                        <table>                            
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblCodigoRubro"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Width="570px"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="Label3"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>                                    
                            </tr>
                        </table>                        
                    </asp:Panel>
                    <%--Panel de Transporte de Material--%>
                    <asp:Panel
                        runat="server"
                        ID="Rec_Apu_Proyecto_Rubro_Transporte"
                        meta:resourcekey="Rec_Apu_Proyecto_Rubro_TransporteRecursoKCG">
                        <table>
                            <tr>
                                <td
                                    colspan="2"
                                    align="right">
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>                                    
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'
                                        ID="Label1"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td
                                    style="white-space:nowrap">
                                    <asp:TextBox 
                                        ID="Apu_Material_Codigo" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ReadOnly="true"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="Label5"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Unidad" 
                                        runat="server" 
                                        TabIndex="-1"
                                        Tooltip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="400px"
                                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.Text").ToString() %>'
                                        ID="Label6"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="costo_unitario_transporte" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("costo_unitario_transporte","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        Text='<%# Bind("int_moneda_simbolo") %>'
                                        ID="Label9"                                
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'
                                        ID="Label7"                                   
                                        runat="server">
                                    </asp:Label>                                
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="Cantidad" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'
                                        ID="Label8"                                   
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        style="text-align:right"
                                        ID="costo_total" 
                                        TabIndex="-1"
                                        runat="server" 
                                        Tooltip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("costo_total","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        Text='<%# Bind("int_moneda_simbolo") %>'
                                        ID="lblint_moneda_simbolo1"                                
                                        runat="server">
                                    </asp:Label>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                
                    <%--Ids--%>               
                    
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Rubro_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
                    </asp:TextBox>
                        
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                                        
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Id" 
                        runat="server" 
                        Style="display:none"
                        Text='<%# Bind("Apu_Proyecto_Id") %>'>
                    </asp:TextBox>
                    
                    <%--Ocultos--%>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Etapa" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Etapa") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_Update" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Update") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_Creacion" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_Creacion") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Nombre" 
                        runat="server"
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Costo_Parcial" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Costo_Parcial") %>'>
                    </asp:TextBox>                    
                    
                    <asp:TextBox 
                        ID="costo_unitario" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_unitario") %>'>
                    </asp:TextBox>             
                    
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Material_Costo_Otros" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Costo_Otros") %>'>
                    </asp:TextBox>

                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Apu_Proyecto_Rubro_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Codigo") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="Fecha_UpdateTransporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Fecha_UpdateTransporte") %>'>
                    </asp:TextBox>
                    
                    <asp:TextBox 
                        ID="costo_total_transporte" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_total_transporte") %>'>
                    </asp:TextBox>              
                </ItemTemplate>
                
            </asp:FormView>
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvApuProyectoRubroTransporte"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente"/> 
                    </td>                    
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuProyectoRubroTransporte" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsfvApuProyectoRubroTransporte" 
        runat="server" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Material" 
        ConflictDetection="CompareAllValues">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_PROYECTO_RUBRO_TRANSPORTE" 
                Objeto="APU_PROYECTO_RUBRO_MATERIAL" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvApuProyectoRubroTransporte"/>
                
            <asp:Button 
                ID="Btn_Rubro" 
                runat="server" 
                OnClick="Btn_Rubro_Click" />
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Transporte_ListadoRecursoKCG"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Transporte_ListadoRecursoKCG">
                
                <Koala:KGrid 
                    ID="gvApuProyectoRubroTransporte" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsgvApuProyectoRubroTransporte"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' SelectedIndex="0" >
                                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                                <HeaderStyle CssClass="headerstyle" />
                                <PagerStyle CssClass="pagerstyle" />
                                <SelectedRowStyle CssClass="selectedrowstyle" />
                    
                    <Columns>
                        <asp:CommandField 
                            ButtonType="Button" SelectText="..." 
                            ShowSelectButton="True" />
                         <asp:BoundField 
                            DataField="Apu_Material_Codigo" 
                            meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                            SortExpression="Apu_Material_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                            SortExpression="Apu_Material_Nombre" >  
                            <itemstyle width="80mm"  />
                        </asp:BoundField> 
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            meta:resourcekey="BoundApu_Material_UnidadRecursoKCG" 
                            SortExpression="Apu_Rubro_Unidad" > 
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="costo_unitario_transporte" 
                            meta:resourcekey="Boundcosto_unitario_transporteRecursoKCG"
                            SortExpression="costo_unitario_transporte" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Cantidad" 
                            meta:resourcekey="BoundCantidadRecursoKCG"
                            SortExpression="Cantidad" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>  
                        <asp:BoundField 
                            DataField="costo_total_transporte" 
                            meta:resourcekey="Boundcosto_totalRecursoKCG"
                            SortExpression="costo_total_transporte" 
                            dataformatstring="{0:N4}">
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>                       
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Etapa" 
                            HeaderText="Apu_Proyecto_Etapa" 
                            SortExpression="Apu_Proyecto_Etapa" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Material_Id" 
                            HeaderText="Apu_Material_Id" 
                            SortExpression="Apu_Material_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Nombre" 
                            HeaderText="UpdateTransporte_Per_Personal_Nombre"
                            SortExpression="UpdateTransporte_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Rubro_Id" 
                            HeaderText="Apu_Proyecto_Rubro_Id"
                            SortExpression="Apu_Proyecto_Rubro_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False"/>
                        <asp:BoundField     
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Material_Costo_Parcial" 
                            HeaderText="Apu_Material_Costo_Parcial"
                            SortExpression="Apu_Material_Costo_Parcial" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="costo_unitario" 
                            HeaderText="costo_unitario" 
                            SortExpression="costo_unitario" 
                            Visible="False"/>                       
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Apu_Material_Costo_Otros" 
                            HeaderText="Apu_Material_Costo_Otros"
                            SortExpression="Apu_Material_Costo_Otros" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            HeaderText="Apu_Material_Unidad"
                            SortExpression="Apu_Material_Unidad" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Id" 
                            HeaderText="UpdateTransporte_Per_Personal_Id"
                            SortExpression="UpdateTransporte_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField     
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False"/>
                        <asp:BoundField     
                            DataField="Apu_Proyecto_Rubro_Codigo" 
                            HeaderText="Apu_Proyecto_Rubro_Codigo"
                            SortExpression="Apu_Proyecto_Rubro_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Codigo" 
                            HeaderText="UpdateTransporte_Per_Personal_Codigo"
                            SortExpression="UpdateTransporte_Per_Personal_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Fecha_UpdateTransporte" 
                            HeaderText="Fecha_UpdateTransporte"
                            SortExpression="Fecha_UpdateTransporte" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Nombre" 
                            HeaderText="Apu_Proyecto_Nombre"
                            SortExpression="Apu_Proyecto_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Codigo" 
                            HeaderText="Apu_Proyecto_Codigo"
                            SortExpression="Apu_Proyecto_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Proyecto_Id" 
                            HeaderText="Apu_Proyecto_Id" 
                            SortExpression="Apu_Proyecto_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="costo_total_transporte" 
                            HeaderText="costo_total_transporte"
                            SortExpression="costo_total_transporte" 
                            Visible="False"/>                                             
                    </Columns>
                </Koala:KGrid>
            </asp:Panel>        
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource 
        ID="odsgvApuProyectoRubroTransporte" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Material">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter  
                Name="Apu_Proyecto_Rubro_Id"
                QueryStringField="Apu_Proyecto_Rubro_Id"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

