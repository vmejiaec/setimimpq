<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_INDICE_EQUIPO.aspx.cs" 
    Inherits="APU_APU_INDICE_EQUIPO"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" 
    meta:resourcekey="Tit_Apu_Indice_EquipoRecursoKCG" %>
    
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
            <asp:Panel
            runat="server"
            ID="pnlDatos"
            meta:resourcekey="Rec_Apu_Indice_EquipoRecursoKCG">
            <asp:FormView 
                ID="fv_apu_indice_equipo" 
                runat="server"                  
                DataSourceID="odsapu_indice_equipo"
                DefaultMode="Insert">
                <EditItemTemplate>
                <table>
                    <tr align="right">
                        <td colspan="2">
                            <asp:Label 
                                ID="lblestadonombre" 
                                runat="server" 
                                Text='<%# Bind("Estado_Nombre") %>'>
                            </asp:Label> 
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblcodigo" 
                                runat="server"                                 
                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                            </asp:Label>                                                 
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Codigo" 
                                runat="server"  
                                TabIndex="-1"                               
                                ReadOnly="true"                                                                                                  
                                ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                Text='<%# Bind("Codigo") %>'>
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                           <asp:Label 
                                ID="lblapuindicecodigo" 
                                runat="server"
                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                AssociatedControlID="Apu_Indice_Codigo"                                           
                                Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>                                                                                                                      
                            </asp:Label>                                 
                        </td>
                        <td style="white-space:nowrap">
                            <asp:TextBox 
                                ID="Apu_Indice_Codigo" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG" 
                                ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                Text='<%# Bind("Apu_Indice_Codigo") %>'>
                            </asp:TextBox>
                            <asp:TextBox 
                                ID="Apu_Indice_Nombre" 
                                runat="server"
                                CssClass="TEXTO_EDICION_KCG"
                                width="200px" 
                                ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                                Text='<%# Bind("Apu_Indice_Nombre") %>'>
                            </asp:TextBox>
                            <asp:Button 
                                ID="Button3" 
                                runat="server" 
                                CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: Apu_Indice_Codigo|Apu_Indice_Nombre;"
                                CommandName="Zoom" 
                                Text="..." />  
                            <asp:RequiredFieldValidator 
                                ID="rvapuindicecodigo"
                                runat="server" 
                                ControlToValidate="Apu_Indice_Codigo"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender3"
                                TargetControlID="rvapuindicecodigo"/>
                            <asp:RequiredFieldValidator 
                                ID="rvapuindicenombre"
                                runat="server" 
                                ControlToValidate="Apu_Indice_Nombre"
                                ValidationGroup="I"
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="ValidatorCalloutExtender2"
                                TargetControlID="rvapuindicenombre"/>                               
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            <asp:Label 
                                ID="lblporcentaje" 
                                runat="server" 
                                Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>                                           
                            </asp:Label>    
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="Porcentaje" 
                                runat="server" 
                                
                                CssClass="TEXTO_EDICION_KCG"
                                style="text-align:right"
                                ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>' 
                                Text='<%# Bind("Porcentaje") %>'>
                            </asp:TextBox>%
                            <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje" 
                                    runat="server"
                                    TargetControlID="Porcentaje"
                                    Mask="999.99"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True" />

                                <AjaxControlToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator2" 
                                    runat="server"
                                    ControlExtender="meePorcentaje"
                                    ControlToValidate="Porcentaje"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.01"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/> 
                                                     
                        </td>
                    </tr>                  
                    <tr align="left">
                        <td colspan="2" >
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
                          <uc2:wucMensajeActualizar 
                            ID="WucMensajeActualizar1" 
                            runat="server" />
                        </td>
                    </tr>                                
                </table>
                
                <%--Id's--%>
                <asp:TextBox 
                    ID="Int_Empresa_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Int_Empresa_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server"
                    Style="display:none"
                    Visible="true" 
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>     
               
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_empresa_Codigo" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Int_empresa_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Empresa_nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Int_Empresa_nombre") %>'>
                </asp:TextBox> 
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr align="right">
                            <td colspan="2">
                                <asp:Label 
                                    ID="lblestadonombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                </asp:Label> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblcodigo" 
                                    runat="server" 
                                    visible="false" 
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'> 
                                </asp:Label>                                                 
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    ReadOnly="true"
                                    visible="false"                                   
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                               <asp:Label 
                                    ID="lblapuindicecodigo" 
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Apu_Indice_Codigo"                                           
                                    Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>                                                                                                                      
                                </asp:Label>                                 
                            </td>
                            <td style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Indice_Codigo" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Apu_Indice_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Indice_Nombre" 
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    width="200px"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Apu_Indice_Nombre") %>'>
                                </asp:TextBox>
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: Apu_Indice_Codigo|Apu_Indice_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />  
                                <asp:RequiredFieldValidator 
                                    ID="rvapuindicecodigo"
                                    runat="server" 
                                    ControlToValidate="Apu_Indice_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender3"
                                    TargetControlID="rvapuindicecodigo"/> 
                                <asp:RequiredFieldValidator 
                                    ID="rvapuindicenombre2"
                                    runat="server" 
                                    ControlToValidate="Apu_Indice_Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender2"
                                    TargetControlID="rvapuindicenombre2"/>   
                                
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label 
                                    ID="lblporcentaje" 
                                    runat="server" 
                                     Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>                                           
                                </asp:Label>    
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Porcentaje" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Porcentaje") %>'>
                                </asp:TextBox>%
                                
                                <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meePorcentaje" 
                                    runat="server"
                                    TargetControlID="Porcentaje"
                                    Mask="999.99"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True" />

                                <AjaxControlToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator2" 
                                    runat="server"
                                    ControlExtender="meePorcentaje"
                                    ControlToValidate="Porcentaje"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.01"
                                    MaximumValue="100.00" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ25RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ24RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />  
                                  
                                  <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/> 
                                           
                            </td>
                        </tr>
                        <tr align="left">
                            <td colspan="2" >
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
                <%--Id's--%>
                <asp:TextBox 
                    ID="Int_Empresa_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Int_Empresa_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server"
                    Style="display:none"
                    Visible="true" 
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>     
               
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_empresa_Codigo" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Int_empresa_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Empresa_nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Int_Empresa_nombre") %>'>
                </asp:TextBox>                 
                </InsertItemTemplate>
                <ItemTemplate>
                <table>
                <tr align="right">
                    <td colspan="2">
                        <asp:Label 
                            ID="lblestadonombre" 
                            runat="server" 
                            Text='<%# Bind("Estado_Nombre") %>'>
                        </asp:Label> 
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="lblcodigo" 
                            runat="server"                             
                            Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                        </asp:Label>                                                 
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server"   
                            TabIndex="-1"                          
                            ReadOnly="true"                                                                
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td>
                       <asp:Label 
                            ID="lblapuindicecodigo" 
                            runat="server"                                                                       
                            Text='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.Text").ToString() %>'>                                                                                                                      
                        </asp:Label>                                 
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Apu_Indice_Codigo" 
                            runat="server"  
                            TabIndex="-1" 
                            ReadOnly="true"                          
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_CodigoRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("Apu_Indice_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Apu_Indice_Nombre" 
                            runat="server"
                            TabIndex="-1"  
                            ReadOnly="true"   
                            width="200px"                         
                            ToolTip='<%# GetLocalResourceObject("Apu_Indice_NombreRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("Apu_Indice_Nombre") %>'>
                        </asp:TextBox>
                        <asp:Button 
                            ID="Button3" 
                            runat="server" 
                            CommandArgument="RutaDestino: ~/APU/APU_INDICE.aspx; Filtro: Apu_Indice_Codigo|Apu_Indice_Nombre;"
                            CommandName="Zoom" 
                            Text="..." Enabled="false"/>                               
                    </td>
                </tr>
                <tr align="left">
                    <td>
                        <asp:Label 
                            ID="lblporcentaje" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("PorcentajeRecursoKCG.Text").ToString() %>'>                                           
                        </asp:Label>    
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Porcentaje" 
                            runat="server"  
                            TabIndex="-1" 
                            ReadOnly="true"  
                            style="text-align:right"                         
                            ToolTip='<%# GetLocalResourceObject("PorcentajeRecursoKCG.ToolTip").ToString() %>' 
                            Text='<%# Bind("Porcentaje") %>'>
                        </asp:TextBox>%                        
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="2">
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
                       <uc1:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                    </td>
                </tr>  
                </table>
                <%--Id's--%>
                <asp:TextBox 
                    ID="Int_Empresa_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Int_Empresa_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Apu_Indice_Id" 
                    runat="server" 
                    Style="display:none"
                    Visible="true"
                    Text='<%# Bind("Apu_Indice_Id") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Id" 
                    runat="server"
                    Style="display:none"
                    Visible="true" 
                    Text='<%# Bind("Id") %>'>
                </asp:TextBox>
                
                <%--CAMPOS NO VISIBLES--%>     
               
                <asp:TextBox 
                    ID="Estado_Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Estado_Nombre") %>'>
                </asp:TextBox>                
                <asp:TextBox 
                    ID="Nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Nombre") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_empresa_Codigo" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Int_empresa_Codigo") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Estado" 
                    runat="server" 
                    visible="false"
                    Text='<%# Bind("Estado") %>'>
                </asp:TextBox>
                <asp:TextBox 
                    ID="Int_Empresa_nombre" 
                    runat="server" 
                    Visible="false"
                    Text='<%# Bind("Int_Empresa_nombre") %>'>
                </asp:TextBox>     
                </ItemTemplate>
            </asp:FormView>  
            <koala:KNavegacion ID="nav"
                runat="server"
                GridViewID="gvapu_indice_equipos"
                FormViewID="FormView1" OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_indice_equipos" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>                  
    <asp:ObjectDataSource 
        ID="odsapu_indice_equipo" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Indice_Equipo"
        UpdateMethod="Update">
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
            <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="APU_INDICE_EQUIPO" 
            Objeto="APU_INDICE_EQUIPO" 
            IndiceScope ="Scope"
            Orden="1"
            ObjectDataSourceID="odsgvapu_indice_equipos" />
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Indice_EquipoRecursoKCG">                 
                <koala:KGrid  
                ID="gvapu_indice_equipos" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                DataKeyNames="Id" 
                DataSourceID="odsgvapu_indice_equipos">                
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
                        DataField="Apu_Indice_Nombre" 
                        meta:resourcekey="BoundApu_Indice_NombreRecursoKCG"
                        SortExpression="Apu_Indice_Nombre" >
                        <headerstyle width="300px" />
                    </asp:BoundField>                        
                    <asp:BoundField 
                        DataField="Porcentaje" 
                        meta:resourcekey="BoundPorcentajeRecursoKCG"
                        SortExpression="Porcentaje" 
                        dataformatstring="{0:N4}" >
                        <itemstyle horizontalalign="Right" /> 
                        </asp:BoundField>
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_Id" 
                        HeaderText="Int_Empresa_Id" 
                        SortExpression="Int_Empresa_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Codigo" 
                        HeaderText="Apu_Indice_Codigo" 
                        SortExpression="Apu_Indice_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        HeaderText="Nombre" 
                        SortExpression="Nombre" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Apu_Indice_Id" 
                        HeaderText="Apu_Indice_Id" 
                        SortExpression="Apu_Indice_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_empresa_Codigo" 
                        HeaderText="Int_empresa_Codigo" 
                        SortExpression="Int_empresa_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Int_Empresa_nombre" 
                        HeaderText="Int_Empresa_nombre" 
                        SortExpression="Int_Empresa_nombre"
                        Visible="False" />
                 </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
                ID="odsgvapu_indice_equipos" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetByEmpresa" 
                TypeName="FEL.APU.BO_Apu_Indice_Equipo">
                <SelectParameters>
                    <asp:SessionParameter 
                        Name="s" 
                        SessionField="Scope" 
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource> 
</asp:Content>

