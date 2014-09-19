<%@ Page 
Language="C#" 
MasterPageFile="~/KOALA.master" 
AutoEventWireup="true" 
CodeFile="APU_RUBRO_TRANSPORTE.aspx.cs" 
Inherits="APU_APU_RUBRO_TRANSPORTE" 
meta:resourcekey="Tit_Apu_Rubro_TransporteRecursoKCG" 
Theme="EstiloKCG"
StylesheetTheme="EstiloKCG" %>

<%@ Register Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
    
<%@ Register Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>
    
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
    runat="server"
    UpdateMode="Conditional">
        <ContentTemplate>                            
            <asp:FormView 
                ID="fvapu_rubro_transporte" 
                runat="server" 
                DataSourceID="odsapu_rubro_transporte"
                DefaultMode="Insert">
                <EditItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Rubro_Transporte_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Rubro_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="500px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubrounidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                    </table>                    
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="pnltransporte"
                        meta:resourcekey="Rec_Apu_Rubro_TransporteRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterial" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server"  
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Width="400px"  
                                        CssClass="TEXTO_LECTURA_KCG"                                     
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterialunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Unidad" 
                                        runat="server"                                                                                
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lbltarifa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_unitario_transporte" 
                                        runat="server"                                         
                                        ReadOnly="true"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_unitario_transporte","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblint_moneda_simboloc" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                                                                                              
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>        
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_total_transporte" 
                                        runat="server" 
                                        style="text-align:right"                                        
                                        ReadOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_total_transporte","{0:N4}") %>'>
                                    </asp:TextBox>
                                    <asp:Label 
                                        ID="lblint_moneda_simbolo" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>    
                                </td>
                            </tr>
                           <%-- <tr align="left">
                                <td colspan="2" >
                                    <asp:Button 
                                        ID="UpdateButton" 
                                        runat="server" 
                                        CausesValidation="True" 
                                        CommandName="Update"
                                        ValidationGroup="U"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                        ID="UpdateCancelButton" 
                                        runat="server" 
                                        CausesValidation="False" 
                                        CommandName="Cancel"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                        ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                  <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>   
                            </tr>--%>
                        </table> 
                    </asp:Panel> 
                    
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none" 
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>        
                   
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
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
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
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
                        ID="costo_unitario" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("costo_unitario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
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
                        ID="costo_total" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_total") %>'>
                    </asp:TextBox>       
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Rubro_Transporte_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Apu_Rubro_Codigo"
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        TabIndex="-1"
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"       
                                        TabIndex="-1"                                  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="500px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubrounidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"     
                                        TabIndex="-1"                                   
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                    </table>                    
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="pnltransporte"
                        meta:resourcekey="Rec_Apu_Rubro_TransporteRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterial" 
                                        runat="server"                                         
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server"    
                                        TabIndex="-1"                                     
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Width="400px"  
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterialunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Unidad" 
                                        runat="server"   
                                        TabIndex="-1"                                      
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lbltarifa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_unitario_transporte" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        readOnly="true"
                                        ToolTip='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_unitario_transporte","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblcostounitario" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                                                          
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server" 
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>        
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                                   
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_total_transporte" 
                                        runat="server"      
                                        TabIndex="-1"                                   
                                        ReadOnly="true"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_total_transporte","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblint_moneda_simbolo" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>   
                                </td>
                            </tr>
                        </table> 
                    </asp:Panel>  
                    <%--<table>   
                    <tr align="left">
                        <td colspan="2">
                            <asp:Button 
                                ID="InsertButton" 
                                runat="server" 
                                CausesValidation="True" 
                                CommandName="Insert"
                                ValidationGroup="I"
                                AccessKey="I"
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                        </td>   
                        <td>
                            <asp:Button 
                                ID="InsertCancelButton" 
                                runat="server" 
                                CausesValidation="False" 
                                CommandName="Cancel"
                                AccessKey="C"
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                            </asp:Button>
                        </td>
                    </tr>
                </table>--%>
                    
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none" 
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>        
                   
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
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
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
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
                        ID="costo_unitario" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("costo_unitario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
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
                        ID="costo_total" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_total") %>'>
                    </asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        id="Panel1"
                        meta:resourcekey="Rec_Apu_Rubro_Transporte_RubroRecursoKCG">
                        <table>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubro" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"       
                                        TabIndex="-1"                                  
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"        
                                        TabIndex="-1"                                 
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Width="500px"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblrubrounidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"   
                                        TabIndex="-1"                                      
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                    </table>                    
                    </asp:Panel> 
                    <asp:Panel
                        runat="server"
                        id="pnltransporte"
                        meta:resourcekey="Rec_Apu_Rubro_TransporteRecursoKCG">
                        <table>
                            <tr  align="right">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="lblestadonombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterial" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Nombre" 
                                        runat="server" 
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_NombreRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        Width="400px"  
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Material_Nombre") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblmaterialunidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Material_Unidad" 
                                        runat="server" 
                                        TabIndex="-1"                                        
                                        ToolTip='<%# GetLocalResourceObject("Apu_Material_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Apu_Material_Unidad") %>'>
                                    </asp:TextBox>    
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lbltarifa" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_unitario_transporte" 
                                        runat="server"
                                        TabIndex="-1"
                                        ReadOnly="true"     
                                        style="text-align:right"                                                                             
                                        ToolTip='<%# GetLocalResourceObject("costo_unitario_transporteRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_unitario_transporte","{0:N4}") %>'>
                                    </asp:TextBox> 
                                    <asp:Label 
                                        ID="lblint_moneda_simbolo" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>                                                                          
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcantidad" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("CantidadRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Cantidad" 
                                        runat="server"     
                                        TabIndex="-1"
                                        style="text-align:right"                                    
                                        ToolTip='<%# GetLocalResourceObject("CantidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Cantidad","{0:N4}") %>'>
                                    </asp:TextBox>        
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblcostototal" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("costo_totalRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="costo_total_transporte" 
                                        runat="server"  
                                        TabIndex="-1"
                                        ReadOnly="true"   
                                        style="text-align:right"                                    
                                        ToolTip='<%# GetLocalResourceObject("costo_totalRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("costo_total_transporte","{0:N4}") %>'>
                                    </asp:TextBox>    
                                    <asp:Label 
                                        ID="lblmonedacosto" 
                                        runat="server"                                         
                                        Text='<%# Bind("int_moneda_simbolo") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                        </table> 
                        
                    </asp:Panel> 
                                     
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Apu_Material_Id" 
                        runat="server"
                        Visible="true"
                        Style="display:none" 
                        Text='<%# Bind("Apu_Material_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Update_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Update_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="UpdateTransporte_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("UpdateTransporte_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Rubro_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Apu_Rubro_Id") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Id" 
                        runat="server" 
                        Visible="true"
                        Style="display:none"
                        Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
                    </asp:TextBox>
                    <%--CAMPOS NO VISIBLES--%>        
                   
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Estado_Nombre") %>'>
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
                        ID="Update_Per_Personal_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
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
                        ID="costo_unitario" 
                        runat="server"
                        Visible="false"  
                        Text='<%# Bind("costo_unitario") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Apu_Material_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Apu_Material_Codigo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Creacion_Per_Personal_Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Nombre" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="int_moneda_simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("int_moneda_simbolo") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Codigo") %>'>
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
                        ID="costo_total" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("costo_total") %>'>
                    </asp:TextBox>   
                </ItemTemplate>
            </asp:FormView>
            <koala:KNavegacion ID="nav"
                    runat="server"
                    GridViewID="gvapu_rubro_transporte"
                    FormViewID="FormView1" OnNavegar="nav_Siguiente" />            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_rubro_transporte" 
                EventName="SelectedIndexChanged" />
        </Triggers>        
    </asp:UpdatePanel> 
    <asp:ObjectDataSource 
        ID="odsapu_rubro_transporte" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.APU.BO_Apu_Rubro_Material">
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
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
                Visible="False" />
        </ContentTemplate> 
    </asp:UpdatePanel>  
    <asp:UpdatePanel
        ID="UpdatePanel3" 
        runat="server">        
        <ContentTemplate>
        <table>
            <tr align="left">
                <td>
                    <koala:KFiltro 
                        ID="kftFiltro" 
                        runat="server" 
                        Contenedor="APU_RUBRO_TRANSPORTE" 
                        Objeto="APU_RUBRO_MATERIAL" 
                        IndiceScope ="Scope"
                        Orden="1"
                        ObjectDataSourceID="odsgvapu_rubro_transporte" />                                                       
                </td>
                <td>
                    <asp:Button 
                        ID="BtnRubro" 
                        runat="server"                        
                        OnClick="BtnRubro_Click"/> 
                </td>
            </tr>
        </table>            
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_Rubro_TransporteRecursoKCG">
                <koala:KGrid
                    ID="gvapu_rubro_transporte" 
                    runat="server"
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"   
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                  
                    DataKeyNames="Id" 
                    DataSourceID="odsgvapu_rubro_transporte">
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
                            DataField="Apu_Material_Codigo" 
                            meta:resourcekey="BoundApu_Material_CodigoRecursoKCG"
                            SortExpression="Apu_Material_Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Nombre" 
                            meta:resourcekey="BoundApu_Material_NombreRecursoKCG"
                            SortExpression="Apu_Material_Nombre" >
                            <itemstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Material_Unidad" 
                            meta:resourcekey="BoundApu_Material_UnidadRecursoKCG"
                            SortExpression="Apu_Material_Unidad" >
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
                            DataField="costo_total" 
                            HeaderText="costo_total"
                            SortExpression="costo_total" Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Codigo" 
                            HeaderText="Creacion_Per_Personal_Codigo"
                            SortExpression="Creacion_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Codigo" 
                            HeaderText="Codigo" 
                            SortExpression="Codigo_int" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Update" 
                            HeaderText="Fecha_Update" 
                            SortExpression="Fecha_Update"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Material_Id" 
                            HeaderText="Apu_Material_Id" 
                            SortExpression="Apu_Material_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_Creacion" 
                            HeaderText="Fecha_Creacion" 
                            SortExpression="Fecha_Creacion"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Nombre" 
                            HeaderText="UpdateTransporte_Per_Personal_Nombre"
                            SortExpression="UpdateTransporte_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Id" 
                            HeaderText="Update_Per_Personal_Id"
                            SortExpression="Update_Per_Personal_Id" 
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Codigo" 
                            HeaderText="Update_Per_Personal_Codigo"
                            SortExpression="Update_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Update_Per_Personal_Nombre" 
                            HeaderText="Update_Per_Personal_Nombre"
                            SortExpression="Update_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Codigo" 
                            HeaderText="Apu_Rubro_Codigo" 
                            SortExpression="Apu_Rubro_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Nombre" 
                            HeaderText="Apu_Rubro_Nombre" 
                            SortExpression="Apu_Rubro_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="costo_unitario" 
                            HeaderText="costo_unitario" 
                            SortExpression="costo_unitario"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Nombre" 
                            HeaderText="Creacion_Per_Personal_Nombre"
                            SortExpression="Creacion_Per_Personal_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Id" 
                            HeaderText="UpdateTransporte_Per_Personal_Id"
                            SortExpression="UpdateTransporte_Per_Personal_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="int_moneda_simbolo" 
                            HeaderText="int_moneda_simbolo" 
                            SortExpression="int_moneda_simbolo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="UpdateTransporte_Per_Personal_Codigo" 
                            HeaderText="UpdateTransporte_Per_Personal_Codigo"
                            SortExpression="UpdateTransporte_Per_Personal_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Fecha_UpdateTransporte" 
                            HeaderText="Fecha_UpdateTransporte"
                            SortExpression="Fecha_UpdateTransporte" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Creacion_Per_Personal_Id" 
                            HeaderText="Creacion_Per_Personal_Id"
                            SortExpression="Creacion_Per_Personal_Id" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>   
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_rubro_transporte" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Material">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Rubro_Id" 
                QueryStringField="Apu_Rubro_Id" 
                Type="String" />
        </SelectParameters>
            </asp:ObjectDataSource>
</asp:Content>

