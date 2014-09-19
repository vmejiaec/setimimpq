<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_PROYECTO_COORDINADOR.aspx.cs" 
    Inherits="APU_APU_PROYECTO_COORDINADOR" 
    meta:resourcekey="Tit_Apu_Proyecto_CoordinadorRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>

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
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>  
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <asp:UpdatePanel ID="uppFv"
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
        
        <asp:TextBox 
            ID="NumRegistros"
            runat="server" 
            style="display:none">
        </asp:TextBox>
        <asp:TextBox 
            ID="Pagina" 
            runat="server"
            style="display:none">
        </asp:TextBox>    

    <asp:FormView ID="fvApuProyecto" 
        runat="server" 
        DataSourceID="odsFvApuProyecto" 
        DefaultMode="Insert" DataKeyNames="Id,Codigo,Nombre">
        <EditItemTemplate>
            <asp:Panel ID="Rec_Apu_Proyecto_Coordinador"
                runat="server"
                meta:ResourceKey="Rec_Apu_Proyecto_CoordinadorRecursoKCG">
            
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCodigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("EtapaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="true" 
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("EtapaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                        
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-transform:uppercase"
                                runat="server"
                                Width="350px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="rfvNombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceValidator"
                                TargetControlID="rfvNombre"/>
                        </td>
                    </tr>
                    <tr align="right" >
                        <td colspan="4">
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
                         <uc1:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        
        
            <%--IDs--%>
            <asp:TextBox ID="Coordinador_Per_Personal_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_provincia_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Area"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Area") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Otros" 
               Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
            </asp:TextBox>
            
            
            <%--Ocultos--%>
            <asp:TextBox ID="Codigo_Institucion"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Codigo_Institucion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Nombre") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Int_Sucursal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Equipo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Equipo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Mano_Obra" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Mano_Obra") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Material" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Material") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Directo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Directo") %>'>
            </asp:TextBox>  
            <asp:TextBox ID="Costo_Indirecto" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Costo_Total" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Metro_Cuadrado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Indice_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Suma_Porcentaje_Indice_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>     
        </EditItemTemplate>
        
        <InsertItemTemplate>
            <asp:Panel ID="Rec_Apu_Proyecto_Coordinador"
                runat="server"
                meta:ResourceKey="Rec_Apu_Proyecto_CoordinadorRecursoKCG">
            
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCodigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                runat="server" 
                                TabIndex="-1"
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("EtapaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="true" 
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("EtapaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                        
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Nombre"
                                CssClass="TEXTO_EDICION_KCG"
                                Style="text-transform:uppercase"
                                runat="server"
                                Width="350px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="rfvNombre" 
                                runat="server"                                                
                                ValidationGroup="I"
                                ControlToValidate="Nombre" 
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceValidator"
                                TargetControlID="rfvNombre"/>
                        </td>
                    </tr>
                    <tr align="right" >
                        <td colspan="4">
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
        
        
           <%--IDs--%>
            <asp:TextBox ID="Coordinador_Per_Personal_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_provincia_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Area"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Area") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Otros" 
               Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
            </asp:TextBox>
            
            
            <%--Ocultos--%>
            <asp:TextBox ID="Codigo_Institucion"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Codigo_Institucion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Nombre") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Int_Sucursal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Equipo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Equipo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Mano_Obra" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Mano_Obra") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Material" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Material") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Directo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Directo") %>'>
            </asp:TextBox>  
            <asp:TextBox ID="Costo_Indirecto" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Costo_Total" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Metro_Cuadrado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Indice_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Suma_Porcentaje_Indice_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>     
        </InsertItemTemplate>
        
        <ItemTemplate>
            <asp:Panel ID="Rec_Apu_Proyecto_Coordinador"
                runat="server"
                meta:ResourceKey="Rec_Apu_Proyecto_CoordinadorRecursoKCG">
            
                <table>
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblCodigo"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Codigo"
                                ReadOnly="true"
                                TabIndex="-1"
                                runat="server" 
                                Text='<%# Bind("Codigo") %>'
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>' >
                            </asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lblEtapa_Nombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("EtapaRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Etapa_Nombre"
                                ReadOnly="true"
                                TabIndex="-1" 
                                runat="server" 
                                Text='<%# Bind("Etapa_Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("EtapaRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                        
                    <tr align="left">
                        <td>
                            <asp:Label ID="lblNombre"
                                runat="server"  
                                Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Nombre"
                                ReadOnly="true"
                                Style="text-transform:uppercase"
                                runat="server"
                                CssClass ="TEXTO_LECTURA_KCG"
                                TabIndex="-1"
                                Width="350px"
                                Height="50px"
                                TextMode="MultiLine"
                                Text='<%# Bind("Nombre") %>'
                                ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="right" >
                        <td colspan="4">
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
                            <uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" /> 
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        
        
        
        
         <%--IDs--%>
            <asp:TextBox ID="Coordinador_Per_Personal_Id"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_provincia_id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Apu_provincia_id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Id") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Area"
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Area") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto" 
                Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Otros" 
               Style="display:none" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Otros") %>'>
            </asp:TextBox>
            
            
            <%--Ocultos--%>
            <asp:TextBox ID="Codigo_Institucion"
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Codigo_Institucion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Creacion" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Creacion") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Etapa" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Etapa") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Fecha_Update" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Fecha_Update") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Lugar_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Lugar_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Apu_Provincia_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Apu_Provincia_Nombre") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Int_Sucursal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Sucursal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Sucursal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Empresa_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Empresa_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Creacion_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Creacion_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Update_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Update_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coordinador_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coordinador_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tecnico_Per_Personal_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Tecnico_Per_Personal_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Codigo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Int_Moneda_Simbolo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Int_Moneda_Simbolo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Equipo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Equipo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Mano_Obra" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Mano_Obra") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Material" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Material") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Directo" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Directo") %>'>
            </asp:TextBox>  
            <asp:TextBox ID="Costo_Indirecto" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Otros") %>'>
            </asp:TextBox> 
            <asp:TextBox ID="Costo_Total" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Total") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Metro_Cuadrado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Metro_Cuadrado") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Porcentaje_Costo_Indirecto_Otros" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Porcentaje_Costo_Indirecto_Otros") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Indice_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Indice_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Cuadrilla_Coeficiente_Sumatoria" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Cuadrilla_Coeficiente_Sumatoria") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Suma_Porcentaje_Indice_Transporte" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Suma_Porcentaje_Indice_Transporte") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado_Nombre" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado_Nombre") %>'>
            </asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                Visible="false" 
                runat="server" 
                Text='<%# Bind("Estado") %>'>
            </asp:TextBox>     
            
        </ItemTemplate>
    </asp:FormView>
    <koala:KNavegacion 
        ID="nav"
        runat="server"                         
        GridViewID="gvApuProyecto"
        OnNavegar="nav_Siguiente" />

    
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="gvApuProyecto" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvApuProyecto" 
        runat="server" 
        DeleteMethod="Delete"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        ConflictDetection="CompareAllValues"
        TypeName="FEL.APU.BO_Apu_Proyecto" 
        UpdateMethod="Update"
        SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:UpdatePanel ID="uppBotones" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="btnRegresar" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AtrasRecursoKCG.ToolTip").ToString() %>'  
                Visible="False" />
            <asp:Button 
                ID="btnResponderZoom" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_SeleccionRecursoKCG.ToolTip").ToString() %>' 
                Visible="False" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdatePanel ID="uppGv"
        runat="server">
        <ContentTemplate>
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="APU_PROYECTO_COORDINADOR" 
            Objeto="APU_PROYECTO" 
            IndiceScope ="Scope"
            Orden="1" 
            ObjectDataSourceID="odsGvApuProyecto"
            PaginacionFina="true"/>
        <asp:Button 
            ID="Btn_Apu_Proyecto_Coordinador_Rubro"
            runat="server"
            meta:resourcekey="Btn_Apu_Proyecto_Coordinador_RubroRecursoKCG" />                      
    <asp:Panel 
        ID="Rec_Apu_Proyecto_Coordinador_Listado"
        runat="server"
        meta:ResourceKey="Rec_Apu_Proyecto_Coordinador_ListadoRecursoKCG">
    <koala:KGridBase 
        ID="gvApuProyecto" 
        runat="server" 
        AllowPaging="True" 
        AutoGenerateColumns="False"
        DataSourceID="odsGvApuProyecto"
        DataKeyNames="Id"
        AllowSorting="True"
        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' MostrarPaginacionSiempre="True">
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" />
        <Columns>
            <asp:CommandField ButtonType="Button" 
                SelectText="..." 
                ShowSelectButton="True" />
            <asp:BoundField DataField="Etapa_Nombre" 
                meta:resourcekey="BoundEtapaRecursoKCG"
                SortExpression="Etapa_Nombre" />
            <asp:BoundField DataField="Codigo" 
                meta:resourcekey="BoundCodigoRecursoKCG"
                SortExpression="Codigo" >
                <itemstyle horizontalalign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Codigo_Institucion" 
                meta:resourcekey="BoundCodigo_InstitucionRecursoKCG"
                SortExpression="Codigo_Institucion" >
                <itemstyle wrap="True" horizontalalign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Nombre" 
                SortExpression="Nombre"
                meta:resourcekey="BoundNombreRecursoKCG">                                
                <itemstyle width="80mm" />
            </asp:BoundField>            
            <asp:BoundField DataField="Coordinador_Per_Personal_Nombre" 
                meta:resourcekey="BoundCoordinador_Per_Personal_NombreRecursoKCG"
                SortExpression="Coordinador_Per_Personal_Nombre" />            
            <asp:BoundField 
                DataField="Id" 
                Visible="False"
                SortExpression="Id" /> 
            <asp:BoundField 
                DataField="Area" 
                HeaderText="Area" 
                Visible="False"
                SortExpression="Area" />
            <asp:BoundField 
                DataField="Porcentaje_Costo_Indirecto" 
                HeaderText="Porcentaje_Costo_Indirecto"
                Visible="False"
                SortExpression="Porcentaje_Costo_Indirecto" />
            <asp:BoundField 
                DataField="Porcentaje_Costo_Otros" 
                HeaderText="Porcentaje_Costo_Otros"
                Visible="False"
                SortExpression="Porcentaje_Costo_Otros" />
            <asp:BoundField 
                DataField="Fecha_Creacion" 
                HeaderText="Fecha_Creacion" 
                Visible="False"
                SortExpression="Fecha_Creacion" />
            <asp:BoundField 
                DataField="Coordinador_Per_Personal_Id" 
                HeaderText="Coordinador_Per_Personal_Id"
                Visible="False"
                SortExpression="Coordinador_Per_Personal_Id" />                
            <asp:BoundField 
                DataField="Tecnico_Per_Personal_Id" 
                HeaderText="Tecnico_Per_Personal_Id"
                Visible="False"
                SortExpression="Tecnico_Per_Personal_Id" />
            <asp:BoundField 
                DataField="Etapa" 
                HeaderText="Etapa" 
                Visible="False"
                SortExpression="Etapa" />
            <asp:BoundField 
                DataField="Int_Sucursal_Id" 
                HeaderText="Int_Sucursal_Id" 
                Visible="False"
                SortExpression="Int_Sucursal_Id" />
            <asp:BoundField 
                DataField="Int_Moneda_Id" 
                HeaderText="Int_Moneda_Id" 
                Visible="False"
                SortExpression="Int_Moneda_Id" />
            <asp:BoundField 
                DataField="Fecha_Update" 
                HeaderText="Fecha_Update" 
                Visible="False"
                SortExpression="Fecha_Update" />
            <asp:BoundField 
                DataField="Creacion_Per_Personal_Id" 
                HeaderText="Creacion_Per_Personal_Id"
                Visible="False"
                SortExpression="Creacion_Per_Personal_Id" />
            <asp:BoundField 
                DataField="Update_Per_Personal_Id" 
                HeaderText="Update_Per_Personal_Id"
                Visible="False"
                SortExpression="Update_Per_Personal_Id" />
            <asp:BoundField 
                DataField="Apu_Lugar_id" 
                HeaderText="Apu_Lugar_id" 
                Visible="False"
                SortExpression="Apu_Lugar_id" />
            <asp:BoundField 
                DataField="Apu_Lugar_Codigo" 
                HeaderText="Apu_Lugar_Codigo" 
                Visible="False"
                SortExpression="Apu_Lugar_Codigo" />
            <asp:BoundField 
                DataField="Apu_Lugar_Nombre" 
                HeaderText="Apu_Lugar_Nombre" 
                Visible="False"
                SortExpression="Apu_Lugar_Nombre" />
            <asp:BoundField 
                DataField="Apu_provincia_id" 
                HeaderText="Apu_provincia_id" 
                Visible="False"
                SortExpression="Apu_provincia_id" />
            <asp:BoundField 
                DataField="Apu_Provincia_Codigo" 
                HeaderText="Apu_Provincia_Codigo"
                Visible="False"
                SortExpression="Apu_Provincia_Codigo" />
            <asp:BoundField 
                DataField="Apu_Provincia_Nombre" 
                HeaderText="Apu_Provincia_Nombre"
                Visible="False"
                SortExpression="Apu_Provincia_Nombre" />
            <asp:BoundField 
                DataField="Int_Sucursal_Codigo" 
                HeaderText="Int_Sucursal_Codigo"
                Visible="False"
                SortExpression="Int_Sucursal_Codigo" />
            <asp:BoundField 
                DataField="Int_Sucursal_Nombre" 
                HeaderText="Int_Sucursal_Nombre"
                Visible="False"
                SortExpression="Int_Sucursal_Nombre" />
            <asp:BoundField 
                DataField="Int_Empresa_Id" 
                HeaderText="Int_Empresa_Id" 
                Visible="False"
                SortExpression="Int_Empresa_Id" />
            <asp:BoundField 
                DataField="Int_Empresa_Codigo" 
                HeaderText="Int_Empresa_Codigo" 
                Visible="False"
                SortExpression="Int_Empresa_Codigo" />
            <asp:BoundField 
                DataField="Int_Empresa_Nombre" 
                HeaderText="Int_Empresa_Nombre" 
                Visible="False"
                SortExpression="Int_Empresa_Nombre" />
            <asp:BoundField 
                DataField="Creacion_Per_Personal_Codigo" 
                HeaderText="Creacion_Per_Personal_Codigo"
                Visible="False"
                SortExpression="Creacion_Per_Personal_Codigo" />
            <asp:BoundField 
                DataField="Creacion_Per_Personal_Nombre" 
                HeaderText="Creacion_Per_Personal_Nombre"
                Visible="False"
                SortExpression="Creacion_Per_Personal_Nombre" />
            <asp:BoundField 
                DataField="Update_Per_Personal_Codigo" 
                HeaderText="Update_Per_Personal_Codigo"
                Visible="False"
                SortExpression="Update_Per_Personal_Codigo" />
            <asp:BoundField 
                DataField="Update_Per_Personal_Nombre" 
                HeaderText="Update_Per_Personal_Nombre"
                Visible="False"
                SortExpression="Update_Per_Personal_Nombre" />
            <asp:BoundField 
                DataField="Coordinador_Per_Personal_Codigo" 
                HeaderText="Coordinador_Per_Personal_Codigo"
                Visible="False"
                SortExpression="Coordinador_Per_Personal_Codigo" />            
            <asp:BoundField 
                DataField="Tecnico_Per_Personal_Codigo" 
                HeaderText="Tecnico_Per_Personal_Codigo"
                Visible="False"
                SortExpression="Tecnico_Per_Personal_Codigo" />
            <asp:BoundField 
                DataField="Tecnico_Per_Personal_Nombre" 
                HeaderText="Tecnico_Per_Personal_Nombre"
                Visible="False"
                SortExpression="Tecnico_Per_Personal_Nombre" />
            <asp:BoundField 
                DataField="Int_Moneda_Codigo" 
                HeaderText="Int_Moneda_Codigo" 
                Visible="False"
                SortExpression="Int_Moneda_Codigo" />
            <asp:BoundField 
                DataField="Int_Moneda_Nombre" 
                HeaderText="Int_Moneda_Nombre" 
                Visible="False"
                SortExpression="Int_Moneda_Nombre" />
            <asp:BoundField 
                DataField="Int_Moneda_Simbolo" 
                HeaderText="Int_Moneda_Simbolo" 
                Visible="False"
                SortExpression="Int_Moneda_Simbolo" />
            <asp:BoundField 
                DataField="Costo_Equipo" 
                HeaderText="Costo_Equipo" 
                Visible="False"
                SortExpression="Costo_Equipo" />
            <asp:BoundField 
                DataField="Costo_Mano_Obra" 
                HeaderText="Costo_Mano_Obra" 
                Visible="False"
                SortExpression="Costo_Mano_Obra" />
            <asp:BoundField 
                DataField="Costo_Material" 
                HeaderText="Costo_Material" 
                Visible="False"
                SortExpression="Costo_Material" />
            <asp:BoundField 
                DataField="Costo_Transporte" 
                HeaderText="Costo_Transporte" 
                Visible="False"
                SortExpression="Costo_Transporte" />
            <asp:BoundField 
                DataField="Costo_Directo" 
                HeaderText="Costo_Directo" 
                Visible="False"
                SortExpression="Costo_Directo" />
            <asp:BoundField 
                DataField="Costo_Indirecto" 
                HeaderText="Costo_Indirecto" 
                Visible="False"
                SortExpression="Costo_Indirecto" />
            <asp:BoundField 
                DataField="Costo_Otros" 
                HeaderText="Costo_Otros" 
                Visible="False"
                SortExpression="Costo_Otros" />
            <asp:BoundField 
                DataField="Costo_Total" 
                HeaderText="Costo_Total" 
                Visible="False"
                SortExpression="Costo_Total" />
            <asp:BoundField 
                DataField="Costo_Metro_Cuadrado" 
                HeaderText="Costo_Metro_Cuadrado"
                Visible="False"
                SortExpression="Costo_Metro_Cuadrado" />
            <asp:BoundField 
                DataField="Costo_Indirecto_Otros" 
                HeaderText="Costo_Indirecto_Otros"
                Visible="False"
                SortExpression="Costo_Indirecto_Otros" />
            <asp:BoundField 
                DataField="Porcentaje_Costo_Indirecto_Otros" 
                HeaderText="Porcentaje_Costo_Indirecto_Otros"
                Visible="False"
                SortExpression="Porcentaje_Costo_Indirecto_Otros" />
            <asp:BoundField 
                DataField="Indice_Sumatoria" 
                HeaderText="Indice_Sumatoria" 
                Visible="False"
                SortExpression="Indice_Sumatoria" />
            <asp:BoundField 
                DataField="Coeficiente_Sumatoria" 
                HeaderText="Coeficiente_Sumatoria"
                Visible="False"
                SortExpression="Coeficiente_Sumatoria" />
            <asp:BoundField 
                DataField="Cuadrilla_Sumatoria" 
                HeaderText="Cuadrilla_Sumatoria"
                Visible="False"
                SortExpression="Cuadrilla_Sumatoria" />
            <asp:BoundField 
                DataField="Cuadrilla_Coeficiente_Sumatoria" 
                HeaderText="Cuadrilla_Coeficiente_Sumatoria"
                Visible="False"
                SortExpression="Cuadrilla_Coeficiente_Sumatoria" />
            <asp:BoundField 
                DataField="Suma_Porcentaje_Indice_Transporte" 
                HeaderText="Suma_Porcentaje_Indice_Transporte"
                Visible="False"
                SortExpression="Suma_Porcentaje_Indice_Transporte" />            
            <asp:BoundField 
                DataField="Estado_Nombre" 
                HeaderText="Estado_Nombre" 
                Visible="False"
                SortExpression="Estado_Nombre" />
            <asp:BoundField 
                DataField="Cadena_Indice" 
                HeaderText="Cadena_Indice" 
                Visible="False"
                SortExpression="Cadena_Indice" />
            <asp:BoundField 
                DataField="Cadena_Cuadrilla" 
                HeaderText="Cadena_Cuadrilla" 
                Visible="False"
                SortExpression="Cadena_Cuadrilla" />           
            <asp:BoundField 
                DataField="Codigo" 
                HeaderText="Codigo" 
                Visible="False"
                SortExpression="Codigo" />
            <asp:BoundField 
                DataField="Codigo_int" 
                HeaderText="Codigo_int" 
                Visible="False"
                SortExpression="Codigo_int" />            
            <asp:BoundField 
                DataField="Estado"                 
                HeaderText="Estado" 
                Visible="False"
                SortExpression="Estado" />           
        </Columns>
    </koala:KGridBase>
    </asp:Panel>    
            </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource ID="odsGvApuProyecto" 
        runat="server" 
        SelectMethod="GetBySucursal" 
        TypeName="FEL.APU.BO_Apu_Proyecto" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:QueryStringParameter 
                Name="Int_sucursal_id" 
                QueryStringField="Int_sucursal_id"
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Desde" 
                Type="String" />
            <asp:Parameter 
                Name="Codigo_Hasta" 
                Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter 
                Name="Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Fecha_Creacion_Desde" 
                Type="DateTime"
                DefaultValue="01/01/1900" />
            <asp:Parameter 
                Name="Fecha_Creacion_Hasta" 
                Type="DateTime"
                DefaultValue="01/06/2078" />
            <asp:Parameter 
                Name="Coordinador_Per_Personal_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Tecnico_Per_Personal_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Lugar_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Provincia_Nombre" 
                Type="String" />
            <asp:Parameter 
                Name="Apu_Presupuesto_Estado" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
</asp:Content>

