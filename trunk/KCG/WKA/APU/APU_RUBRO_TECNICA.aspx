<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_RUBRO_TECNICA.aspx.cs" 
    Inherits="APU_APU_RUBRO_TECNICA" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Apu_Rubro_TecnicaRecursoKCG" %>

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
    <%--<asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>--%> 
            <asp:FormView 
                ID="fvApuRubroTecnica" 
                runat="server" 
                DataSourceID="odsFvApuRubroTecnica">
                
                <EditItemTemplate>                
                    <asp:Panel
                        runat="server"
                        ID="pnlfvApuRubroTecnica"
                        meta:resourcekey="Rec_Apu_Rubro_TecnicaRecursoKCG">
                        
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
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblRubro"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td >
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"
                                        TabIndex="-1"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400px"
                                        Height="50px"
                                        ReadOnly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblApuRubroUnidad"                                        
                                        runat="server">
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
                            <tr align="center">
                                <td colspan="2">
                                    <asp:Image 
                                        ID="imgImagen" 
                                        runat="server"                                        
                                        ImageUrl='<%#Eval("Path_Imagen") %>' 
                                        BorderStyle="Solid" 
                                        ImageAlign="AbsMiddle" 
                                        Width="400px"      
                                        TabIndex="-1"                                  
                                        ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>'/>
                                                 
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>'
                                        ID="lblNombreImagen"                                        
                                        TabIndex="-1"
                                        runat="server">
                                        
                                    </asp:Label>
                                </td>
                                <td>                               
                                    <asp:TextBox 
                                        ID="Imagen" 
                                        runat="server"                                         
                                        Width="400px"
                                        Height="50px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Imagen") %>'>
                                    </asp:TextBox>                                                                                         
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.Text").ToString() %>'
                                        ID="lblPathImagen"  
                                        TabIndex="-1"                                      
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:FileUpload 
                                        ID="fupApuRubroTecnica"                                                                               
                                        Width="400px"                                                                                
                                        runat="server"
                                        ToolTip='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.ToolTip").ToString() %>'/>                                                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("DefinicionRecursoKCG.Text").ToString() %>'
                                        ID="lblDefinicion"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                    <asp:TextBox 
                                        ID="Definicion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DefinicionRecursoKCG.ToolTip").ToString() %>'
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Definicion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("EspecificacionRecursoKCG.Text").ToString() %>'
                                        ID="lblEspecificaciones"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                     <asp:TextBox 
                                        ID="Especificacion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("EspecificacionRecursoKCG.ToolTip").ToString() %>'
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Especificacion") %>'>
                                     </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("MedicionRecursoKCG.Text").ToString() %>'
                                        ID="lblMedicion"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                    <asp:TextBox 
                                        ID="Medicion" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("MedicionRecursoKCG.ToolTip").ToString() %>'
                                        Style="text-transform:uppercase"
                                        Text='<%# Bind("Medicion") %>'>
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
                                </td>                                              
                            </tr>
                        </table>
                        
                        <%--Ids--%>                       
                        
                        <asp:TextBox 
                            ID="Apu_Rubro_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Rubro_Id") %>'>                        
                        </asp:TextBox>     
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
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
                            ID="Path_Imagen" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Path_Imagen") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Origen_Imagen" 
                            runat="server" 
                            Visible="false"                      
                            Text='<%# Bind("Origen_Imagen") %>'>
                        </asp:TextBox>                        
                    </asp:Panel>                                
                </EditItemTemplate>
                
                <InsertItemTemplate>
                    
                </InsertItemTemplate>                
                
                <ItemTemplate>
                    <asp:Panel
                        runat="server"
                        ID="pnlfvApuRubroTecnica"
                        meta:resourcekey="Rec_Apu_Rubro_TecnicaRecursoKCG">
                        
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
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'
                                        ID="lblRubro"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Codigo" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Apu_Rubro_Codigo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Nombre" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Width="400"
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Text='<%# Bind("Apu_Rubro_Nombre") %>'>
                                    </asp:TextBox>
                                </td>                                
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'
                                        ID="lblApuRubroUnidad"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Apu_Rubro_Unidad" 
                                        runat="server"                                         
                                        ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Text='<%# Bind("Apu_Rubro_Unidad") %>'>
                                    </asp:TextBox>
                                </td>                            
                            </tr>
                            <tr align="center">
                                <td colspan="2">
                                    <asp:Image 
                                        ID="imgImagen" 
                                        runat="server"                                        
                                        ImageUrl='<%#Eval("Path_Imagen") %>' 
                                        BorderStyle="Solid" 
                                        Height="400"
                                        ImageAlign="AbsMiddle" 
                                        Width="400"                                        
                                        ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>'/>
                                                 
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>'
                                        ID="lblNombreImagen"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>                               
                                    <asp:TextBox 
                                        ID="Imagen" 
                                        runat="server"                                         
                                        Width="400px"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.ToolTip").ToString() %>'
                                        ReadOnly="true"
                                        Text='<%# Bind("Imagen") %>'>
                                    </asp:TextBox>                                                                                         
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.Text").ToString() %>'
                                        ID="lblPathImagen"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Origen_Imagen" 
                                        runat="server" 
                                        Width="400px"
                                        CssClass="TEXTO_LECTURA_KCG" 
                                        Height="50px"
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("Ruta_ImagenRecursoKCG.ToolTip").ToString() %>'                                                                                
                                        Text='<%# Bind("Origen_Imagen") %>'>
                                    </asp:TextBox>                                                                                                  
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("DefinicionRecursoKCG.Text").ToString() %>'
                                        ID="lblDefinicion"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                    <asp:TextBox 
                                        ID="Definicion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="400px"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("DefinicionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Definicion") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("EspecificacionRecursoKCG.Text").ToString() %>'
                                        ID="lblEspecificaciones"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                     <asp:TextBox 
                                        ID="Especificacion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Width="400px"
                                        Height="50px"
                                        TextMode="MultiLine"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("EspecificacionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Especificacion") %>'>
                                     </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label
                                        Text='<%# GetLocalResourceObject("MedicionRecursoKCG.Text").ToString() %>'
                                        ID="lblMedicion"                                        
                                        runat="server">
                                    </asp:Label>
                                </td>                            
                                <td>
                                    <asp:TextBox 
                                        ID="Medicion" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Width="400px"
                                        CssClass="TEXTO_LECTURA_KCG"
                                        Height="50px"
                                        TabIndex="-1"
                                        TextMode="MultiLine"
                                        ToolTip='<%# GetLocalResourceObject("MedicionRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Medicion") %>'>
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
                                </td>                               
                            </tr>
                        </table>
                        
                        <%--Ids--%>                       
                        
                        <asp:TextBox 
                            ID="Apu_Rubro_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Rubro_Id") %>'>                        
                        </asp:TextBox>     
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <%--Ocultos--%>
                        
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
                            ID="Path_Imagen" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Path_Imagen") %>'>
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
                    </asp:Panel>                    
                </ItemTemplate>
                
            </asp:FormView> 
            <table>
                <tr>
                    <td>
                        <asp:Button 
                            ID="Rec_Apu_Rubro_Tecnica_Documento" 
                            runat="server" 
                            OnClick="Rec_Apu_Rubro_Tecnica_Documento_Click" />
                    </td>       
                    <td>
                        <asp:Button 
                            ID="btn_Apu_rubro_tecnica_rubro" 
                            runat="server" 
                            OnClick="btn_Apu_rubro_tecnica_rubro_Click" />
                    </td>                 
                </tr>
            </table>           
        
    <asp:ObjectDataSource 
        ID="odsFvApuRubroTecnica" 
        runat="server"
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetByRubro" 
        TypeName="FEL.APU.BO_Apu_Rubro_Tecnica" 
        SortParameterName="sortExpression" 
        ConflictDetection="CompareAllValues" 
        UpdateMethod="Update">
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

