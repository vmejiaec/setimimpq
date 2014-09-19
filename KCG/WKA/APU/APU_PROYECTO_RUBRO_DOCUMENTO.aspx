<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_DOCUMENTO.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_PROYECTO_RUBRO_DOCUMENTO"     
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_DocumentoRecursoKCG" %>
    
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
        ID="fvApuProyectoRubroDocumento" 
        runat="server" 
        DataSourceID="odsFvApuProyectoRubroDocumento"
        DefaultMode="Insert">
        
        <EditItemTemplate>
            <%--Panel de Proyecto--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_apu_Proyecto_Rubro_Documento_Proyecto"
                meta:resourcekey="Rec_apu_Proyecto_Rubro_Documento_ProyectoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.Text").ToString() %>'
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
                        <td>
                            <asp:TextBox 
                                ID="Apu_Proyecto_Nombre" 
                                runat="server" 
                                Width="300px"
                                TabIndex="-1"
                                Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                            </asp:TextBox>                                        
                        </td>
                    </tr>                                
                </table>                      
            </asp:Panel>
            <%--Panel de Rubro--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento_Rubro"
                 meta:resourcekey="Rec_Apu_Proyecto_Rubro_Documento_RubroRecursoKCG">
                <table>
                    <tr>
                        <td
                            colspan="2"
                            align="right">
                            <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>                                    
                        </td>                                    
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
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
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre" 
                                runat="server"
                                TabIndex="-1"
                                Width="300px" 
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
                                Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                            </asp:TextBox>
                        </td>                                    
                    </tr>
                </table>                        
            </asp:Panel>
            <%--Panel de Docuemento--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_DocumentoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                ID="Label4"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Codigo" 
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
                                ID="Label5"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload 
                                ID="fuCargarArchivo" 
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                Tooltip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                ID="Label6"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Nombre" 
                                runat="server" 
                                Width="400px"
                                style="text-transform:uppercase"
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                ID="Label7"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Descripcion" 
                                runat="server" 
                                style="text-transform:uppercase"
                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                CssClass="TEXTO_EDICION_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px"
                                Text='<%# Bind("Descripcion") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
                <table>
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
                             <uc1:wucMensajeActualizar 
                                ID="WucMensajeActualizar1" 
                                runat="server" />                      
                        </td>
                    </tr>
                </table>                                                   
            </asp:Panel>
            
            <%--Ids--%>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>
            
            <asp:TextBox 
                ID="Ruta" 
                runat="server"
                visible="false"                                                                           
                Text='<%# Bind("Ruta") %>'>
            </asp:TextBox>    
            
            <asp:TextBox 
                ID="Estado_Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Codigo" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>                       
            
            <asp:TextBox 
                ID="Estado" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <%--Panel de Proyecto--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_apu_Proyecto_Rubro_Documento_Proyecto"
                meta:resourcekey="Rec_apu_Proyecto_Rubro_Documento_ProyectoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.Text").ToString() %>'
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
                        <td>
                            <asp:TextBox 
                                ID="Apu_Proyecto_Nombre" 
                                runat="server" 
                                TabIndex="-1"
                                Width="300px"
                                Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                            </asp:TextBox>                                        
                        </td>
                    </tr>                                
                </table>                      
            </asp:Panel>
            <%--Panel de Rubro--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento_Rubro"
                 meta:resourcekey="Rec_Apu_Proyecto_Rubro_Documento_RubroRecursoKCG">
                <table>
                    <tr>
                        <td
                            colspan="2"
                            align="right">
                            <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>                                    
                        </td>                                    
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
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
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre" 
                                runat="server" 
                                TabIndex="-1"
                                Width="300px"
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
                                Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                            </asp:TextBox>
                        </td>                                    
                    </tr>
                </table>                        
            </asp:Panel>
            <%--Panel de Docuemento--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_DocumentoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                ID="Label4"    
                                Visible="false"                                                                          
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Codigo" 
                                runat="server" 
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
                                ID="Label5"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload 
                                ID="fuCargarArchivo" 
                                Width="400px"
                                Tooltip='<%# GetLocalResourceObject("RutaRecursoKCG.ToolTip").ToString() %>'
                                CssClass="TEXTO_EDICION_KCG"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                ID="Label6"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Nombre" 
                                runat="server" 
                                Width="400px"     
                                style="text-transform:uppercase"                                   
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                ID="Label7"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Descripcion" 
                                runat="server" 
                                Width="400px"
                                Height="50px"
                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'
                                CssClass="TEXTO_EDICION_KCG"
                                style="text-transform:uppercase"
                                TextMode="MultiLine"
                                Text='<%# Bind("Descripcion") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
                <table>
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
                ID="Apu_Proyecto_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>
            
            <asp:TextBox 
                ID="Ruta" 
                runat="server" 
                visible="false"
                Text='<%# Bind("Ruta") %>'>
            </asp:TextBox>  
            
            <asp:TextBox 
                ID="Estado_Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Codigo" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>                       
            
            <asp:TextBox 
                ID="Estado" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>                  
        </InsertItemTemplate>
        
        <ItemTemplate>
            <%--Panel de Proyecto--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_apu_Proyecto_Rubro_Documento_Proyecto"
                meta:resourcekey="Rec_apu_Proyecto_Rubro_Documento_ProyectoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.Text").ToString() %>'
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
                        <td>
                            <asp:TextBox 
                                ID="Apu_Proyecto_Nombre" 
                                runat="server" 
                                TabIndex="-1"
                                Width="300px"
                                Tooltip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'>
                            </asp:TextBox>                                        
                        </td>
                    </tr>                                
                </table>                      
            </asp:Panel>
            <%--Panel de Rubro--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento_Rubro"
                 meta:resourcekey="Rec_Apu_Proyecto_Rubro_Documento_RubroRecursoKCG">
                <table>
                    <tr>
                        <td
                            colspan="2"
                            align="right">
                            <asp:Label 
                                ID="Label1" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label>                                    
                        </td>                                    
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.Text").ToString() %>'
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
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Apu_Rubro_Nombre" 
                                runat="server" 
                                TabIndex="-1"
                                Width="300px"
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
                                Tooltip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                ReadOnly="true"
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                            </asp:TextBox>
                        </td>                                    
                    </tr>
                </table>                        
            </asp:Panel>
            <%--Panel de Docuemento--%>
            <asp:Panel
                runat="server"
                ID="pnlRec_Apu_Proyecto_Rubro_Documento"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_DocumentoRecursoKCG">
                <table>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                ID="Label4"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Codigo" 
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
                                ID="Label5"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Ruta" 
                                runat="server" 
                                Width="400px"
                                Height="50px"
                                style="text-transform:uppercase"
                                TextMode="MultiLine"                                
                                ReadOnly="TRUE"
                                TabIndex="-1"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Ruta") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                ID="Label6"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Nombre" 
                                runat="server" 
                                Width="400px"
                                style="text-transform:uppercase"
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'                                            
                                ReadOnly="true"
                                Text='<%# Bind("Nombre") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label
                                Text='<%# GetLocalResourceObject("DescripcionRecursoKCG.Text").ToString() %>'
                                ID="Label7"                                   
                                runat="server">
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Descripcion" 
                                runat="server" 
                                Width="400px"
                                Height="50px"
                                style="text-transform:uppercase"
                                ToolTip='<%# GetLocalResourceObject("DescripcionRecursoKCG.ToolTip").ToString() %>'                                            
                                ReadOnly="true"
                                TextMode="MultiLine"
                                CssClass="TEXTO_LECTURA_KCG"
                                Text='<%# Bind("Descripcion") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                </table> 
                <table>
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
                            <uc2:wucMensajeEliminar 
                                ID="WucMensajeEliminar1" 
                                runat="server" />                      
                        </td>
                    </tr>
                </table>                                                   
            </asp:Panel>
            
            <%--Ids--%>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Rubro_Id" 
                runat="server" 
                Style="display:none"
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>
            
            <%--Ocultos--%>                    
            
            <asp:TextBox 
                ID="Estado_Nombre" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox 
                ID="Apu_Proyecto_Rubro_Codigo" 
                runat="server" 
                Visible="false"
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>                       
            
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
                    GridViewID="gvApuProyectoRubroDocumento"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente"/>
            </td>
            <td>
                <asp:Button 
                    ID="Btn_Apu_Proyecto_Rubro_Documento_Ver" 
                    runat="server" OnClick="Btn_Apu_Proyecto_Rubro_Documento_Ver_Click" />
            </td>
            <td>
                <asp:Button 
                ID="Btn_Apu_Proyecto_Rubro_Tecnica" 
                runat="server" OnClick="Btn_Apu_Proyecto_Rubro_Tecnica_Click" 
                Text ="Especificaciones Técnicas"/>
            </td>
                            
        </tr>
    </table>
            
    <asp:ObjectDataSource 
        ID="odsfvApuProyectoRubroDocumento" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Documento"
        UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert">
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
   
    <asp:Button 
        ID="Seleccionar" 
        runat="server" 
        Visible="False" />
    <asp:Button 
        ID="Atras" 
        runat="server" 
        Visible="False" />  
     
    <koala:KFiltro 
        ID="kftFiltro" 
        runat="server" 
        Contenedor="APU_PROYECTO_RUBRO_DOCUMENTO" 
        Objeto="APU_PROYECTO_RUBRO_DOCUMENTO" 
        IndiceScope ="Scope"
        Orden="1"
        ObjectDataSourceID="odsgvApuProyectoRubroDocumento"/>
          
    <asp:Panel
        runat="server"
        ID="pnlRec_Apu_Proyecto_Rubro_Documento_Listado"
        meta:resourcekey="Rec_Apu_Proyecto_Rubro_Documento_ListadoRecursoKCG">
        
        <koala:KGrid
            ID="gvApuProyectoRubroDocumento" 
            runat="server" 
            AllowPaging="True"
            AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataKeyNames="Id" 
            DataSourceID="odsgvApuProyectoRubroDocumento"
            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' >
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
                    SortExpression="Codigo_int" />    
                <asp:BoundField 
                    DataField="Nombre" 
                    meta:resourcekey="BoundNombreRecursoKCG" 
                    SortExpression="Nombre" />    
                <asp:BoundField 
                    DataField="Ruta" 
                    meta:resourcekey="BoundRutaRecursoKCG" 
                    SortExpression="Ruta" />  
                <asp:BoundField 
                    DataField="Path_Nombre" 
                    meta:resourcekey="BoundPath_NombreRecursoKCG"
                    SortExpression="Path_Nombre" > 
                    <itemstyle width="80mm"/>
                </asp:BoundField>                              
                <asp:BoundField 
                    DataField="Apu_Rubro_Codigo" 
                    HeaderText="Apu_Rubro_Codigo" 
                    SortExpression="Apu_Rubro_Codigo" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Proyecto_Nombre" 
                    HeaderText="Apu_Proyecto_Nombre"
                    SortExpression="Apu_Proyecto_Nombre" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Proyecto_Id" 
                    HeaderText="Apu_Proyecto_Id" 
                    SortExpression="Apu_Proyecto_Id" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Id" 
                    HeaderText="Id" 
                    SortExpression="Id" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Proyecto_Rubro_Id" 
                    HeaderText="Apu_Proyecto_Rubro_Id"
                    SortExpression="Apu_Proyecto_Rubro_Id" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Estado_Nombre" 
                    HeaderText="Estado_Nombre" 
                    SortExpression="Estado_Nombre" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Proyecto_Rubro_Codigo" 
                    HeaderText="Apu_Proyecto_Rubro_Codigo"
                    SortExpression="Apu_Proyecto_Rubro_Codigo" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Descripcion" 
                    HeaderText="Descripcion" 
                    SortExpression="Descripcion" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Proyecto_Codigo" 
                    HeaderText="Apu_Proyecto_Codigo"
                    SortExpression="Apu_Proyecto_Codigo" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Estado" 
                    HeaderText="Estado" 
                    SortExpression="Estado" 
                    Visible="False"/>                        
                <asp:BoundField 
                    DataField="Apu_Rubro_Unidad" 
                    HeaderText="Apu_Rubro_Unidad" 
                    SortExpression="Apu_Rubro_Unidad" 
                    Visible="False"/>                        
                <asp:BoundField 
                    DataField="Apu_Rubro_Nombre" 
                    HeaderText="Apu_Rubro_Nombre" 
                    SortExpression="Apu_Rubro_Nombre" 
                    Visible="False"/>
                <asp:BoundField 
                    DataField="Apu_Rubro_Id" 
                    HeaderText="Apu_Rubro_Id" 
                    SortExpression="Apu_Rubro_Id" 
                    Visible="False"/>                        
            </Columns>                                    
        </koala:KGrid>
    </asp:Panel>                                
        
    <asp:ObjectDataSource 
        ID="odsgvApuProyectoRubroDocumento" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Documento">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Apu_Rubro_Id" 
                QueryStringField="Apu_Proyecto_Rubro_Id"
                Type="String" />
            <asp:Parameter 
                Name="par_servidor_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>

