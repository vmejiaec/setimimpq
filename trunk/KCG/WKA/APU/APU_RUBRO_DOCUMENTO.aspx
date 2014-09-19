<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_RUBRO_DOCUMENTO.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"  
    Inherits="APU_APU_RUBRO_DOCUMENTO" 
    meta:resourcekey="Tit_Apu_Rubro_DocumentoRecursoKCG" %>

<%@ Register 
        Src="../WebUserControls/wucMensajeActualizar.ascx" 
        TagName="wucMensajeActualizar"
        TagPrefix="uc1" %>
        
<%@ Register 
        Src="../WebUserControls/wucMensajeEliminar.ascx" 
        TagName="wucMensajeEliminar"
        TagPrefix="uc2" %>

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
    <asp:FormView 
            ID="fvApuRubroDocumento" 
            runat="server" 
            DataSourceID="odsFvApuRubroDocumento"
            DefaultMode="Insert">
            
            <EditItemTemplate>
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento"
                    meta:resourcekey="Rec_Apu_Rubro_Documento_RubroRecursoKCG">
                    
                    <table>
                        <tr>
                            <td
                                colspan="2"
                                align="right">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblRubro"                                        
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
                                    Width="300px"
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
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento2"
                    meta:resourcekey="Rec_Apu_Rubro_DocumentoRecursoKCG">
                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    TabIndex="-1"
                                    runat="server" 
                                    Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                        
                                    ReadOnly="true"                                    
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'
                                    ID="lblPath"                                        
                                    runat="server">
                                </asp:Label>
                            </td>                            
                            <td>
                                <asp:FileUpload 
                                    ID="fupApuRubroDocumento"  
                                    Width="470px"  
                                    CssClass ="TEXTO_EDICION_KCG"                                
                                    runat="server"                                                                   
                                    Tooltip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'/>                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblNombre"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                                <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    Width="470px"
                                    TabIndex="-1"
                                    Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    ReadOnly="true"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label
                                    Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                    ID="lblDescipcion"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Descripcion" 
                                    runat="server"         
                                    Style="text-transform:uppercase"
                                    Width="470px"
                                    Height="50px"
                                    Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                    TextMode="MultiLine"                            
                                    CssClass="TEXTO_EDICION_KCG"
                                    Text='<%# Bind("Descripcion") %>'>
                                </asp:TextBox>
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
                                    ID="UpdateCancelButton" 
                                    runat="server"
                                    CausesValidation="False" 
                                    CommandName="Cancel"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>
                                 <%--<uc1:wucMensajeActualizar 
                                    ID="WucMensajeActualizar1" 
                                    runat="server" /> --%>                     
                            </td>
                        </tr>
                    </table>                    
                </asp:Panel>          
                            
                <%--Ids--%>       
                            
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Path_Nombre" 
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Path_Nombre") %>'>
                </asp:TextBox>
                
                <%--Oculto--%>
                
                <asp:TextBox 
                    ID="Estado" 
                    runat="server"
                    Visible="false" 
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>
                    
                <asp:TextBox 
                    ID="Ruta" 
                    runat="server"                     
                    Visible="false"             
                    Text='<%# Bind("Ruta") %>'>
                </asp:TextBox>                
            </EditItemTemplate>
            
            <InsertItemTemplate>
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento"
                    meta:resourcekey="Rec_Apu_Rubro_Documento_RubroRecursoKCG">
                    
                    <table>
                        <tr>
                            <td
                                colspan="2"
                                align="right">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblRubro"                                        
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
                                    Width="300"
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
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento2"
                    meta:resourcekey="Rec_Apu_Rubro_DocumentoRecursoKCG">
                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"    
                                    Visible="false"
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    TabIndex="-1"
                                    Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Visible="false"
                                    ReadOnly="true"                                    
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'
                                    ID="lblPath"                                        
                                    runat="server">
                                </asp:Label>
                            </td>                            
                            <td>
                                <asp:FileUpload 
                                    ID="fupApuRubroDocumento"                                     
                                    runat="server"
                                    CssClass ="TEXTO_EDICION_KCG"
                                    Width="470px"
                                    Tooltip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'/>
                                <asp:RequiredFieldValidator
                                    ID="RqfuRubroDocumento" 
                                    runat="server" 
                                    ControlToValidate="fupApuRubroDocumento"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'/>
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="fupApuRubroDocuemntoReqE"
                                    TargetControlID="RqfuRubroDocumento" />
                            </td>
                        </tr>                            
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblNombre"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                                <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    Width="470px"    
                                    TabIndex="-1"                                
                                    Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    ReadOnly="true"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>                        
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label
                                    Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                    ID="lblDescipcion"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Descripcion" 
                                    runat="server"
                                    Style="text-transform:uppercase"
                                    Width="470px"
                                    Height="50px"       
                                    Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'  
                                    TextMode="MultiLine"                            
                                    CssClass="TEXTO_EDICION_KCG"
                                    Text='<%# Bind("Descripcion") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td
                                colspan="2"
                                align="left">
                                <asp:Button 
                                    ID="InsertButton" 
                                    runat="server" 
                                    CausesValidation="True" 
                                    CommandName="Insert"
                                    ValidationGroup="I"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InsertarRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>
                                 <asp:Button 
                                    ID="InsertCancelButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="Cancel"
                                    ValidationGroup="I"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>                                             
                            </td>                                
                        </tr>
                    </table>                    
                </asp:Panel>          
                            
                <%--Ids--%>       
                            
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Path_Nombre" 
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Path_Nombre") %>'>
                </asp:TextBox>
                
                <%--Oculto--%>
                
                <asp:TextBox 
                    ID="Estado" 
                    runat="server"
                    Visible="false" 
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>    
                 
                <asp:TextBox 
                    ID="Ruta" 
                    runat="server"                     
                    Visible="false"             
                    Text='<%# Bind("Ruta") %>'>
                </asp:TextBox>
                     
            </InsertItemTemplate>
            
            <ItemTemplate>
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento"
                    meta:resourcekey="Rec_Apu_Rubro_Documento_RubroRecursoKCG">
                    
                    <table>
                        <tr>
                            <td
                                colspan="2"
                                align="right">
                                <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label>
                            </td>                        
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblRubro"                                        
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
                                    Width="300"
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
                <asp:Panel
                    runat="server"
                    ID="pnlfvApuRubroDocumento2"
                    TabIndex="-1"
                    meta:resourcekey="Rec_Apu_Rubro_DocumentoRecursoKCG">
                    
                    <table>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"                                            
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo"                                     
                                    runat="server" 
                                    TabIndex="-1"
                                    Tooltip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                       
                                    ReadOnly="true"                                       
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("RutaRecursoKCG.Text").ToString() %>'
                                    ID="lblPath"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Ruta" 
                                    runat="server" 
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    Width="470px"
                                    Height="50px"
                                    TabIndex="-1"
                                    Tooltip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'
                                    TextMode="MultiLine"
                                    ReadOnly="true"                                        
                                    Text='<%# Bind("Ruta") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblNombre"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                                <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    Width="470px"       
                                    TabIndex="-1"                             
                                    Tooltip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                      
                                    ReadOnly="true"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Label
                                    Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                    ID="lblDescipcion"                                        
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Descripcion" 
                                    runat="server"  
                                    CssClass ="TEXTO_LECTURA_KCG"                                          
                                    Width="470px"
                                    Height="50px"
                                    TabIndex="-1"
                                    Tooltip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                    TextMode="MultiLine"                                  
                                    ReadOnly="true"
                                    Text='<%# Bind("Descripcion") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td
                                colspan="2"
                                align="left">
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
                                    ID="DeleteButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="Delete"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_EliminarRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_DeleteRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <asp:Button 
                                    ID="NewButton" 
                                    runat="server" 
                                    CausesValidation="False" 
                                    CommandName="New"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_NuevoRecursoKCG.AccesKey").ToString() %>'  
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_NewRecursoKCG.ToolTip").ToString() %>'>
                                </asp:Button>
                                <%--<uc2:wucMensajeEliminar 
                                    ID="WucMensajeEliminar1" 
                                    runat="server" />        --%>              
                            </td>
                        </tr>
                    </table>                    
                </asp:Panel>   
                
                <%--Ids--%>       
                            
                <asp:TextBox 
                    ID="Apu_Rubro_Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Apu_Rubro_Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Id" 
                    runat="server" 
                    style="display:none"
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <asp:TextBox 
                    ID="Path_Nombre" 
                    runat="server"
                    style="display:none"
                    Text='<%# Bind("Path_Nombre") %>'>
                </asp:TextBox>
                
                <%--Oculto--%>
                
                <asp:TextBox 
                    ID="Estado" 
                    runat="server"
                    Visible="false" 
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>
            </ItemTemplate>
            
        </asp:FormView>
        <table>
            <tr>
                <td>
                    <koala:KNavegacion 
                        ID="nav"
                        runat="server"
                        GridViewID="gvApuRubroDocumento"
                        FormViewID="FormView1" 
                        OnNavegar="nav_Siguiente"/>                                       
                </td>
                <td>                                                                
                    <asp:Button 
                        ID="btn_Apu_Rubro_Documento_Ver" 
                        runat="server" 
                        OnClick="btn_Apu_Rubro_Documento_Ver_Click" />                                                
                </td>
                <td>
                    <asp:Button 
                        ID="btn_Apu_rubro_documento_tecnica" 
                        runat="server" 
                        OnClick="btn_Apu_rubro_documento_tecnica_Click" />                    
                </td>
            </tr>
        </table>
         
    <asp:ObjectDataSource 
        ID="odsFvApuRubroDocumento" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Rubro_Documento"
        UpdateMethod="Update">
        <SelectParameters>
            <asp:SessionParameter
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Id" 
                Type="String" />
            <asp:Parameter 
                Name="par_servidor_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <%--<asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>--%>
            <asp:Button 
                ID="Seleccionar" 
                runat="server" 
                Visible="False" />
            <asp:Button 
                ID="Atras" 
                runat="server" 
                Visible="False" />
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    
    <%--<asp:UpdatePanel 
        ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>--%>
            <koala:KFiltro 
                ID="kftFiltro" 
                runat="server" 
                Contenedor="APU_RUBRO_DOCUMENTO" 
                Objeto="APU_RUBRO_DOCUMENTO" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsGvApuRubroDocumento"/>                        

            <asp:Panel
                runat="server"
                ID="pnlgvApuRubroDocumento"
                meta:resourcekey="Rec_Listado_Apu_DocumentoRecursoKCG">
                
                <koala:KGrid 
                    ID="gvApuRubroDocumento" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False"                                          
                    DataKeyNames="Id"
                    DataSourceID="odsGvApuRubroDocumento"                     
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
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
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG" 
                            SortExpression="Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <itemstyle width="80mm"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Ruta" 
                            meta:resourcekey="BoundRutaRecursoKCG"
                            SortExpression="Ruta" >
                            <itemstyle width="80mm" />
                        </asp:BoundField>   
                        <asp:BoundField 
                            DataField="Path_Nombre" 
                            meta:resourcekey="BoundPath_NombreRecursoKCG"
                            SortExpression="Path_Nombre" > 
                            <itemstyle width="80mm"/>
                        </asp:BoundField>              
                        <asp:BoundField 
                            DataField="Apu_Rubro_Id" 
                            HeaderText="Apu_Rubro_Id" 
                            SortExpression="Apu_Rubro_Id"
                            Visible="False" />                        
                        <asp:BoundField 
                            DataField="Descripcion" 
                            HeaderText="Descripcion" 
                            SortExpression="Descripcion" 
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
                            DataField="Apu_Rubro_Unidad" 
                            HeaderText="Apu_Rubro_Unidad" 
                            SortExpression="Apu_Rubro_Unidad"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id"
                            Visible="False" />               
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado"
                            Visible="False" />
                    </Columns>
                </koala:KGrid>            
            </asp:Panel>            
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>

    <asp:ObjectDataSource 
        ID="odsGvApuRubroDocumento" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Documento">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Rubro_Id" 
                QueryStringField="Apu_Rubro_Id"
                Type="String" />
            <asp:Parameter 
                Name="par_servidor_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

