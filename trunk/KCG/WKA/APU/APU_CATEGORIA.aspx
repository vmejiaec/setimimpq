<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_CATEGORIA.aspx.cs" 
    Inherits="APU_APU_CATEGORIA" 
    meta:resourcekey="Tit_Apu_CategoriaRecursoKCG"
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
        UpdateMode="always">
        <ContentTemplate>
            <asp:Panel
              runat="server"
              ID="pnlDatos"
              meta:resourcekey="Rec_Apu_CategoriaRecursoKCG">
                <asp:FormView 
                    ID="fvapu_categoria" 
                    runat="server"                      
                    DataSourceID="odsapu_categoria" 
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
                                    Readonly="true"   
                                    TabIndex="-1"                                                                 
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>                                
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG" 
                                    width="200px"
                                    style="text-transform:uppercase"
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                    ID="rqvNombre"
                                    runat="server" 
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="caValidator"
                                    TargetControlID="rqvNombre"/>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostodiario"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>                            
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server" 
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                    CssClass="TEXTO_EDICION_KCG"
                                    Style="text-align:right"
                                    Text='<%# Bind("Costo_Diario") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label1" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                    <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meeCosto_Diario" 
                                    runat="server"
                                    TargetControlID="Costo_Diario"
                                    Mask="9,999,999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True" />
                                <%--<AjaxControlToolkit:MaskedEditValidator 
                                    ID="MaskedEditValidator2" 
                                    runat="server"
                                    ControlExtender="meeCosto_Diario"
                                    ControlToValidate="Costo_Diario"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />--%>                                    
                                  <%--<AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/>--%> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostohora"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td> 
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Hora" 
                                    runat="server" 
                                    ReadOnly="true"  
                                    tabindex="-1"                                  
                                    ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                    Style="text-align:right"
                                    Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label2" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                          
                            </td>
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
                                  <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                </td>
                            </tr>                         
                    </table> 
                    
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <%--CAMPOS NO VISIBLES--%>
                                           
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>  
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                     
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                                    Visible="false"
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Codigo" 
                                    runat="server" 
                                    Readonly="true" 
                                    Visible="false"                                    
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
                                    runat="server"
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre"                                           
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>  
                             </td>                                                             
                             <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG" 
                                    style="text-transform:uppercase"
                                    width="200px"
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                                <asp:RequiredFieldValidator 
                                        ID="rqvNombre"
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender                                          
                                        ID="caValidator"
                                        runat="Server"
                                        TargetControlID="rqvNombre"/>
                            </td>
                        </tr> 
                        <tr align="left">
                            <td style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostodiario"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                </asp:Label>  
                            </td>
                            <td>                             
                                <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server" 
                                    Style="text-align:right"                                                                                     
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>'
                                    CssClass="TEXTO_EDICION_KCG"
                                    Text='<%# Bind("Costo_Diario") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label1" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                <AjaxControlToolkit:MaskedEditExtender 
                                    ID="meeCosto_Diario" 
                                    runat="server"
                                    TargetControlID="Costo_Diario"
                                    Mask="9,999,999,999,999.9999"
                                    MessageValidatorTip="false"
                                    OnFocusCssClass="MaskedEditFocus"
                                    OnInvalidCssClass="MaskedEditError"
                                    MaskType="Number"
                                    InputDirection="RightToLeft"
                                    AcceptNegative="None"
                                    DisplayMoney="None"
                                    ErrorTooltipEnabled="False"
                                    ClearMaskOnLostFocus="True"
                                    />

                                <%--<AjaxControlToolkit:MaskedEditValidator ID="MaskedEditValidator2" runat="server"
                                    ControlExtender="meeCosto_Diario"
                                    ControlToValidate="Costo_Diario"
                                    IsValidEmpty="False"
                                    EmptyValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    InvalidValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MaximumValueMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                    MinimumValue="0.0001"
                                    MaximumValue="9999999999999.9999" 
                                    Display="Dynamic"
                                    EmptyValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    InvalidValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    MaximumValueBlurredMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>' 
                                    MinimumValueBlurredText='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                    ValidationGroup="I" />--%>  
                                  
                                  <%--<AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="ValidatorCalloutExtender1"
                                    TargetControlID="MaskedEditValidator2"/>--%> 
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostohora"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                </asp:Label>  
                            </td>
                            <td>                              
                                <asp:TextBox 
                                    ID="Costo_Hora" 
                                    runat="server" 
                                    Style="text-align:right"
                                    ReadOnly="true" 
                                    tabindex="-1"                                   
                                    ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label2" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>
                                
                                
                                <script type="text/javascript">
                                       
                                Sys.Application.add_load(page_load);
                                Sys.Application.add_unload(page_unload);
                                
                                var Costo_Diario = null;
                                var Costo_Hora = null; 
                                
                                function page_load(sender, e){
                                Costo_Diario = $get("ctl00_ContentPlaceHolder1_fvapu_categoria_Costo_Diario");
                                
                                
                                Costo_Hora = $get("ctl00_ContentPlaceHolder1_fvapu_categoria_Costo_Hora");
                               

                                $addHandler(Costo_Diario, "change", datos_onchange);
                                                                        
                                }
                                
                                function page_unload(sender, e){
                                $removeHandler(Costo_Diario, "change", datos_onchange);                               
                                
                                }
                                
                                function datos_onchange(sender, e){
                                Sumar();
                                }
                                
                                function Sumar()
                                {
                                var costoHoraCalculado = 0.00;                                  
                                
                                var numCosto_Diario = Number.parseLocale(Costo_Diario.value);                                
                                
                                if(!isNaN(numCosto_Diario)) 
                                    
                                   costoHoraCalculado= numCosto_Diario / 8;
                                   costoHoraCalculado = Redondear(costoHoraCalculado,4);
                                   
                                Costo_Hora.value = costoHoraCalculado.localeFormat("N4");                                
                                                                          
                                function Redondear(x,numeroDecimales) {
	                                                return (Math.round(x*Math.pow(10,numeroDecimales)))/Math.pow(10,numeroDecimales);                                
                                
                                }  
                                }
                            </script>                            
                            </td>                       
                    </table> 
                    <table>   
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
                    </table> 
                    
                    <%--Id's--%>
                    <asp:TextBox 
                        ID="Int_Empresa_Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <%--CAMPOS NO VISIBLES--%>
                                           
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>                     
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>  
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        Visible="False"                        
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
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
                                    Readonly="true" 
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Codigo") %>'>
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr align="left">
                            <td>
                                <asp:Label
                                    ID="lblnombre"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>                                
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    runat="server" 
                                    ReadOnly="true"    
                                    width="200px"
                                    TabIndex="-1"
                                    style="text-transform:uppercase"                                
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>                              
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostodiario"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>                            
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Diario" 
                                    runat="server"
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Costo_DiarioRecursoKCG.ToolTip").ToString() %>' 
                                    Text='<%# Bind("Costo_Diario","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label1" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                               
                            </td>
                        </tr>
                        <tr align="left">
                            <td  style="white-space:nowrap">
                                <asp:Label
                                    ID="lblcostohora"
                                    runat="server"                                                                               
                                    Text='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td> 
                            <td>
                                <asp:TextBox 
                                    ID="Costo_Hora" 
                                    runat="server" 
                                    ReadOnly="true"
                                    TabIndex="-1"
                                    style="text-align:right"
                                    ToolTip='<%# GetLocalResourceObject("Costo_HoraRecursoKCG.ToolTip").ToString() %>'
                                    Text='<%# Bind("Costo_Hora","{0:N4}") %>'>
                                </asp:TextBox>
                                <asp:Label 
                                    ID="label2" 
                                    runat="server"                                     
                                    Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                                </asp:Label>                                
                            </td>
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
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Int_Empresa_Id") %>'>
                    </asp:TextBox> 
                    <asp:TextBox 
                        ID="Id" 
                        runat="server" 
                        style="display:none"
                        Visible="true"
                        Text='<%# Bind("Id") %>'>
                    </asp:TextBox>
                    
                     <%--CAMPOS NO VISIBLES--%>
                                           
                    <asp:TextBox 
                        ID="Int_Empresa_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Int_Empresa_Nombre") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Int_Empresa_Codigo" 
                        runat="server" 
                        Visible="false"
                        Text='<%# Bind("Int_Empresa_Codigo") %>'>
                    </asp:TextBox>                        
                    <asp:TextBox 
                        ID="Estado" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado") %>'>
                    </asp:TextBox>  
                    <asp:TextBox 
                        ID="Estado_Nombre" 
                        runat="server" 
                        Visible="false" 
                        Text='<%# Bind("Estado_Nombre") %>'>
                    </asp:TextBox>
                    <asp:TextBox 
                        ID="Int_Moneda_Simbolo" 
                        runat="server" 
                        visible="false"
                        Text='<%# Bind("Int_Moneda_Simbolo") %>'>
                    </asp:TextBox>
                    </ItemTemplate>
                </asp:FormView>                
            </asp:Panel>
            <koala:KNavegacion 
                ID="nav"
                runat="server"
                GridViewID="gvapu_categoria"
                FormViewID="FormView1" 
                OnNavegar="nav_Siguiente" />
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvapu_categoria" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource
        ID="odsapu_categoria" 
        runat="server" 
        ConflictDetection="CompareAllValues" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.APU.BO_Apu_Categoria" 
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
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
                Name="Int_Sucursal_Id" 
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
                Contenedor="APU_CATEGORIA" 
                Objeto="Apu_Categoria" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsgvapu_categoria"/>
            <asp:Panel 
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Apu_CategoriaRecursoKCG">
                <koala:KGrid 
                    ID="gvapu_categoria" 
                    runat="server"
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'                
                    DataKeyNames="Id"
                    DataSourceID="odsgvapu_categoria">               
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
                            Visible="True"
                            SortExpression="Codigo" >
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG" 
                            SortExpression="Nombre" >
                            <itemstyle wrap="true" Width="80mm"/>
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Diario" 
                            meta:resourcekey="BoundCosto_DiarioRecursoKCG" 
                            SortExpression="Costo_Diario" 
                            dataformatstring="{0:N4}">
                            <itemstyle wrap="False" horizontalalign="Right" />
                            </asp:BoundField>
                        <asp:BoundField 
                            DataField="Costo_Hora" 
                            meta:resourcekey="BoundCosto_HoraRecursoKCG" 
                            SortExpression="Costo_Hora" 
                            dataformatstring="{0:N4}">
                            <itemstyle wrap="False" horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Int_Empresa_Codigo" 
                            HeaderText="Int_Empresa_Codigo" 
                            SortExpression="Int_Empresa_Codigo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Nombre" 
                            HeaderText="Int_Empresa_Nombre" 
                            SortExpression="Int_Empresa_Nombre"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Int_Moneda_Simbolo" 
                            HeaderText="Int_Moneda_Simbolo" 
                            SortExpression="Int_Moneda_Simbolo"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre"
                            Visible="False" />
                    </Columns>
                </koala:KGrid>            
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsgvapu_categoria" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.APU.BO_Apu_Categoria">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:Parameter 
                Name="Int_Sucursal_Id" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

