<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_RUBRO_TECNICA.aspx.cs" 
    Inherits="APU_APU_PROYECTO_RUBRO_TECNICA" 
    meta:resourcekey="Tit_Apu_Proyecto_Rubro_TecnicaRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>
    
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="uc2" %>   
    
    <%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %> 


<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">

    <asp:FormView ID="FvApuRubroTecnica" 
        runat="server" 
        DataSourceID="odsApuProyectoRubroTecnica" 
        DefaultMode="ReadOnly">
        <EditItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Tecnica_FijoRecursoKCG">
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblEquipo_Apu_Indice_Codigo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Proyecto_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                Width="300px"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlEspecificaciones"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_TecnicaRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="2">
                             <asp:Label 
                                ID="lblEstado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                             </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Rubro_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Rubro_Nombre"
                                Width="375px" 
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Unidad" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <asp:Image ID="imgImagen" 
                                runat="server" 
                                ImageUrl='<%#Eval("Path_Imagen") %>' 
                                ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>' 
                                BorderStyle="Solid" 
                                Height="400px"
                                ImageAlign="AbsMiddle" 
                                Width="400px"/>
                            <br />    
                            <asp:FileUpload ID="fupApuProyectoRubroTecnica"
                                Style="text-transform:uppercase"
                                CssClass="TEXTOKCG" 
                                runat="server"
                                ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.ToolTip").ToString() %>'/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblDefinicion" 
                                runat="server"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
                                AssociatedControlID="Definicion"
                                Text='<%# GetLocalResourceObject("DefinicionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Definicion"
                                Style="text-transform:uppercase"
                                CssClass ="TEXTO_EDICION_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px" 
                                runat="server" 
                                Text='<%# Bind("Definicion") %>'
                                ToolTip='<%# GetLocalResourceObject("DefinicionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblEspecificacion" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("EspecificacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Especificacion"
                                Style="text-transform:uppercase"
                                CssClass ="TEXTO_EDICION_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px"  
                                runat="server" 
                                Text='<%# Bind("Especificacion") %>'
                                ToolTip='<%# GetLocalResourceObject("EspecificacionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblMedicion" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("MedicionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Medicion"
                                Style="text-transform:uppercase"
                                CssClass ="TEXTO_EDICION_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px"  
                                runat="server"
                                Text='<%# Bind("Medicion") %>'
                                ToolTip='<%# GetLocalResourceObject("MedicionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr align="right">
                        <td colspan="2" >
                         <asp:Button 
                            ID="UpdateButton" 
                            runat="server"
                            ValidationGroup="I" 
                            CausesValidation="True" 
                            CommandName="Update"
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                            ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>' >
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
                         <%--<uc2:wucMensajeActualizar ID= "wucMensajeActualizar1" runat="server" />--%>
                      
                        </td>
                    </tr>   
                    
                </table>
            </asp:Panel>
        
            
            <%--IDs--%>

            <asp:TextBox ID="Id"
                 Visible="false"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>

            <%--Campos Ocultos--%>
            <asp:TextBox ID="Origen_Imagen" 
                Visible="false"                                  
                runat="server" 
                Text='<%# Bind("Origen_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Path_Origen_Imagen"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Path_Origen_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Codigo" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Path_Imagen" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Path_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Imagen"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Imagen") %>'>
            </asp:TextBox>
            
        </EditItemTemplate>
        <InsertItemTemplate>
           
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Panel ID="pnlProyecto" 
                runat="server" 
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_Tecnica_FijoRecursoKCG">
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblEquipo_Apu_Indice_Codigo" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Proyecto_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Proyecto_Nombre"
                                Width="300px"
                                TabIndex="-1"
                                ReadOnly="true" 
                                runat="server" 
                                Text='<%# Bind("Apu_Proyecto_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Proyecto_NombreRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="pnlEspecificaciones"
                runat="server"
                meta:resourcekey="Rec_Apu_Proyecto_Rubro_TecnicaRecursoKCG">
                <table>
                    <tr align="right">
                        <td colspan="2">
                             <asp:Label 
                                ID="lblEstado_Nombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                             </asp:Label>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Nombre" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox ID="Apu_Rubro_Codigo"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_CodigoRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:TextBox ID="Apu_Rubro_Nombre"
                                Width="375px" 
                                TabIndex="-1"
                                ReadOnly="true"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblApu_Rubro_Unidad" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Apu_Rubro_Unidad" 
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Apu_Rubro_Unidad") %>'
                                ToolTip='<%# GetLocalResourceObject("Apu_Rubro_UnidadRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <asp:Image ID="imgImagen" 
                                runat="server" 
                                ImageUrl='<%#Eval("Path_Imagen") %>' 
                                ToolTip='<%# GetLocalResourceObject("ImagenRecursoKCG.Text").ToString() %>' 
                                BorderStyle="Solid" 
                                Height="400px"
                                TabIndex="-1"
                                ImageAlign="AbsMiddle" 
                                Width="400px"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblDefinicion" 
                                runat="server"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>' 
                                AssociatedControlID="Definicion"
                                Text='<%# GetLocalResourceObject("DefinicionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Definicion"
                                Style="text-transform:uppercase"
                                ReadOnly="True"
                                TabIndex="-1"
                                CssClass ="TEXTO_LECTURA_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px" 
                                runat="server" 
                                Text='<%# Bind("Definicion") %>'
                                ToolTip='<%# GetLocalResourceObject("DefinicionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblEspecificacion" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("EspecificacionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Especificacion"
                                Style="text-transform:uppercase"
                                ReadOnly="True"
                                TabIndex="-1"
                                CssClass ="TEXTO_LECTURA_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px"  
                                runat="server" 
                                Text='<%# Bind("Especificacion") %>'
                                ToolTip='<%# GetLocalResourceObject("EspecificacionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lblMedicion" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("MedicionRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Medicion"
                                Style="text-transform:uppercase"
                                ReadOnly="True"
                                TabIndex="-1"
                                CssClass ="TEXTO_LECTURA_KCG"
                                TextMode="MultiLine"
                                Width="400px"
                                Height="50px"  
                                runat="server"
                                Text='<%# Bind("Medicion") %>'
                                ToolTip='<%# GetLocalResourceObject("MedicionRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr align="right">
                        <td colspan="2" >
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
            </asp:Panel>
        
            
            <%--IDs--%>

            <asp:TextBox ID="Id"
                 Visible="false"
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Rubro_Id" 
                Style="display:none"
                runat="server" 
                Text='<%# Bind("Apu_Rubro_Id") %>'>
            </asp:TextBox>

            <%--Campos Ocultos--%>
            <asp:TextBox ID="Origen_Imagen" 
                Visible="false"                                  
                runat="server" 
                Text='<%# Bind("Origen_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Path_Origen_Imagen"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Path_Origen_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Proyecto_Rubro_Codigo" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Apu_Proyecto_Rubro_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Path_Imagen" 
                Visible="false"
                runat="server" 
                Text='<%# Bind("Path_Imagen") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Imagen"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Imagen") %>'>
            </asp:TextBox>
        </ItemTemplate>
    </asp:FormView>
    <table>
        <tr>
            <td>
                <asp:Button 
                    ID="Btn_Apu_Proyecto_Rubro_Tecnica_Documento" 
                    runat="server" 
                    OnClick="Btn_Apu_Proyecto_Rubro_Tecnica_Documento_Click" />
            </td>
            <td>
                <asp:Button 
                    ID="btn_Apu_Proyecto_Rubro"
                    meta:resourcekey="Btn_Apu_Proyecto_Rubro_Tecnica_RubroRecursoKCG"
                    runat="server" />
            </td>
            <td>
                <asp:Button 
                    ID="btn_Apu_Proyecto"                    
                    runat="server"
                    meta:resourcekey="Btn_Apu_ProyectoRecursoKCG" 
                    OnClick="btn_Apu_Proyecto_Click" />
            </td>
        </tr>
    </table>                          
    <asp:ObjectDataSource ID="odsApuProyectoRubroTecnica" 
        runat="server" 
        UpdateMethod = "Update"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetByProyectoRubro"
        TypeName="FEL.APU.BO_Apu_Proyecto_Rubro_Tecnica" 
        ConflictDetection="CompareAllValues" 
        SortParameterName="SortExpression">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter Name="par_servidor_id" Type="String" />
            <asp:QueryStringParameter Name="Apu_Proyecto_Rubro_Id" 
                QueryStringField="Apu_Proyecto_Rubro_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>

