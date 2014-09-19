
<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master"
    AutoEventWireup="true" 
    CodeFile="DIC_SECUENCIA.aspx.cs" 
    Inherits="DIC_DIC_SECUENCIA" 
    meta:resourcekey="Tit_Dic_RotuloRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
 
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
    
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
                meta:resourcekey="Rec_SecuenciaRecursoKCG"> 
                <asp:FormView 
                    ID="fvDicSecuencia" 
                    runat="server" 
                    DataSourceID="odsFVDicSecuencia"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td colspan="4" align="right" >
                                    <asp:Label
                                        ID="Estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                 </td>
                            </tr>
                            <tr align="left">
                                <td colspan="1"> 
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                                    
                                    </asp:Label>
                                </td>  
                                <td colspan="3" >
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                 
                                </td> 
                            </tr>
                            <tr align="left">  
                                <td colspan="1">
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Nombre"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">                                         
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox> 
                                    <asp:RequiredFieldValidator 
                                       ID="RequiredFieldValidator1" 
                                       runat="server" 
                                       ControlToValidate="Nombre"
                                       ValidationGroup="I"
                                       ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                       Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>                                                
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                       runat="server" 
                                       ID="vcNombre"
                                       TargetControlID="RequiredFieldValidator1">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>           
                                </td> 
                            </tr>           
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblValorMinimo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>                                            
                                    <asp:TextBox 
                                        ID="Valor_Minimo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.ToolTip").ToString() %>' 
                                        Text='<%# Bind("Valor_Minimo") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                       ID="RequiredFieldValidator2" 
                                       runat="server" 
                                       ControlToValidate="Valor_Minimo"
                                       ValidationGroup="I"
                                       ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                       Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>                                                
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender8"
                                        TargetControlID="RequiredFieldValidator2">
                                       </AjaxControlToolkit:ValidatorCalloutExtender>   
                                    <asp:RegularExpressionValidator
                                        ID="revMinimo" 
                                        runat="server"
                                        ControlToValidate="Valor_Minimo" 
                                        ValidationGroup="I"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="revMinimo">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>   
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblValorMaximo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor_Maximo" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="135px"
                                        style="text-align:right" 
                                        ToolTip='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Maximo") %>'>
                                    </asp:TextBox>                                                                            
                                    <asp:CompareValidator 
                                        ID="CompareValidator1" 
                                        runat="server" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>' 
                                        ControlToCompare="Valor_Minimo" 
                                        ControlToValidate="Valor_Maximo" 
                                        Operator="GreaterThan" 
                                        Type="Integer">
                                    </asp:CompareValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="CompareValidator1">
                                    </AjaxControlToolkit:ValidatorCalloutExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblIncremento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("IncrementoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:TextBox 
                                        ID="Incremento" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("IncrementoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Incremento") %>'>
                                    </asp:TextBox>                                            
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator4" 
                                        runat="server" 
                                        ControlToValidate="Incremento"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>                                                
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender10"
                                        TargetControlID="RequiredFieldValidator4">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                    <asp:RegularExpressionValidator
                                        ID="revIncremento" 
                                        runat="server"
                                        ValidationGroup="I"
                                        ControlToValidate="Incremento" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender6"
                                        TargetControlID="revIncremento">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>          
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblValorActual" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:TextBox 
                                        ID="Valor_Actual" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Actual") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator5" 
                                        runat="server" 
                                        ControlToValidate="Valor_Actual"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender11"
                                        TargetControlID="RequiredFieldValidator5">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                    <asp:RegularExpressionValidator
                                        ID="revActual" 
                                        runat="server"
                                        ControlToValidate="Valor_Actual"
                                        ValidationGroup="I" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender7"
                                        TargetControlID="revActual">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                </td>
                            </tr> 
                            <tr align="left">
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
                                    <uc1:wucMensajeActualizar ID="WucMensajeActualizar2" runat="server" />
                                </td>
                            </tr>
                        </table>
                                     
                        <!--CAMPOS  NO VISIBLES  -->  
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"                                
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox
                                ID="Estado" 
                                runat="server"                                 
                                Visible="false"
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td colspan="4" align="right" >
                                    <asp:Label
                                        ID="Estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="1"> 
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Visible="false"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td colspan="3" >
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        Visible="false"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                 
                                </td> 
                            </tr>
                            <tr align="left">  
                                <td colspan="1">
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Nombre"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3" >                                         
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        CssClass="TEXTO_EDICION_KCG" 
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox> 
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator1" 
                                        runat="server" 
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="vcNombre"
                                        TargetControlID="RequiredFieldValidator1">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>           
                                </td> 
                            </tr>           
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="lblValorMinimo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor_Minimo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Minimo") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                       ID="RequiredFieldValidator2" 
                                       runat="server" 
                                       ControlToValidate="Valor_Minimo"
                                       ValidationGroup="I"
                                       ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                       Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender8"
                                        TargetControlID="RequiredFieldValidator2">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>   
                                    <asp:RegularExpressionValidator
                                        ID="revMinimo" 
                                        runat="server"
                                        ControlToValidate="Valor_Minimo" 
                                        ValidationGroup="I"
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender4"
                                        TargetControlID="revMinimo">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>   
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblValorMaximo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor_Maximo" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG"
                                        Width="135px" 
                                        ToolTip='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Maximo") %>'>
                                    </asp:TextBox>                                     
                                    <asp:CompareValidator 
                                        ID="CompareValidator1" 
                                        runat="server" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>' 
                                        ControlToCompare="Valor_Minimo" 
                                        ControlToValidate="Valor_Maximo" 
                                        Operator="GreaterThan" 
                                        Type="Integer">
                                    </asp:CompareValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender5"
                                        TargetControlID="CompareValidator1">
                                    </AjaxControlToolkit:ValidatorCalloutExtender> 
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblIncremento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("IncrementoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:TextBox 
                                        ID="Incremento" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("IncrementoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Incremento") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator4" 
                                        runat="server" 
                                        ControlToValidate="Incremento"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender10"
                                        TargetControlID="RequiredFieldValidator4">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                    <asp:RegularExpressionValidator
                                        ID="revIncremento" 
                                        runat="server"
                                        ValidationGroup="I"
                                        ControlToValidate="Incremento" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender6"
                                        TargetControlID="revIncremento">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>          
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblValorActual" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:TextBox 
                                        ID="Valor_Actual" 
                                        runat="server" 
                                        style="text-align:right"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        ToolTip='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Actual") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="RequiredFieldValidator5" 
                                        runat="server" 
                                        ControlToValidate="Valor_Actual"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'>
                                    </asp:RequiredFieldValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender11"
                                        TargetControlID="RequiredFieldValidator5">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                    <asp:RegularExpressionValidator
                                        ID="revActual" 
                                        runat="server"
                                        ControlToValidate="Valor_Actual"
                                        ValidationGroup="I" 
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ4RecursoKCG.Text").ToString() %>'
                                        ValidationExpression="^\d{1,7}$">
                                    </asp:RegularExpressionValidator>
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="server" 
                                        ID="ValidatorCalloutExtender7"
                                        TargetControlID="revActual">
                                    </AjaxControlToolkit:ValidatorCalloutExtender>  
                                </td>
                            </tr>                                        
                            <tr align="left">
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
                        
                        <!--CAMPOS  NO VISIBLES  -->  
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"
                                Visible="false"
                                Text='<%# Bind("Id") %>'>
                            </asp:TextBox>
                            <asp:TextBox
                                ID="Estado" 
                                runat="server"                                 
                                Visible="false"
                                Text='<%# Bind("Estado") %>'>
                            </asp:TextBox>                      
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td colspan="4" align="right" >
                                    <asp:Label
                                        ID="Estado_nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="1"> 
                                    <asp:Label 
                                        ID="lblCodigo" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>  
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Codigo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                 
                                </td> 
                            </tr>
                            <tr align="left">  
                                <td colspan="1">
                                    <asp:Label 
                                        ID="lblNombre" 
                                        runat="server"
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Nombre"
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td colspan="3">
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="400px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox> 
                                </td> 
                            </tr>           
                            <tr align="left">
                                <td >
                                    <asp:Label 
                                        ID="lblValorMinimo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor_Minimo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Valor_MinimoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Minimo") %>'>
                                    </asp:TextBox>
                                </td>
                                <td>
                                    <asp:Label 
                                        ID="lblValorMaximo" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Valor_Maximo" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        Width="135px"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Valor_MaximoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Maximo") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblIncremento" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("IncrementoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left" >
                                    <asp:TextBox 
                                        ID="Incremento" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("IncrementoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Incremento") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label 
                                        ID="lblValorActual" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox 
                                        ID="Valor_Actual" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        style="text-align:right"
                                        ToolTip='<%# GetLocalResourceObject("Valor_ActualRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Valor_Actual") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                                        
                            <tr align="left">
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
                                    
                        <!--CAMPOS  NO VISIBLES  -->  
                            <asp:TextBox 
                                ID="Id" 
                                runat="server" 
                                style="display:none"                                
                                Text='<%# Bind("Id") %>'>
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
        <Triggers>
          <asp:AsyncPostBackTrigger 
            ControlID="gvDicSecuencia" 
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVDicSecuencia" 
        runat="server" 
        DeleteMethod="Delete"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Secuencia" 
        UpdateMethod="Update" 
        ConflictDetection="CompareAllValues">
        <SelectParameters>
           <asp:SessionParameter 
               Name="s" 
               SessionField="Scope" 
               Type="Object" />
           <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel3" 
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
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
        <koala:KFiltro 
            ID="kftFiltro" 
            runat="server" 
            Contenedor="DIC_CONTENEDOR" 
            Objeto="DIC_CONTENEDOR" 
            IndiceScope ="Scope"
            Orden="1" 
            ObjectDataSourceID="odsGVDicSecuencia"/>                
            <asp:Panel 
                runat="server" 
                ID="pnlDatos1"
                meta:resourcekey="Rec_ListadoRecursoKCG">            
                <koala:KGrid
                ID="gvDicSecuencia" 
                runat="server" 
                AllowPaging="True" 
                AutoGenerateColumns="False"
                DataKeyNames="Id" 
                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                DataSourceID="odsGVDicSecuencia" 
                AllowSorting="True">
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
                        SortExpression="Codigo">
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG" 
                        SortExpression="Nombre" >
                        <ItemStyle Width="80mm" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Valor_Minimo" 
                        meta:resourcekey="BoundValor_MinimoRecursoKCG" 
                        SortExpression="Valor_Minimo" >
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Valor_Maximo" 
                        meta:resourcekey="BoundValor_MaximoRecursoKCG" 
                        SortExpression="Valor_Maximo" >
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Incremento"  
                        meta:resourcekey="BoundIncrementoRecursoKCG" 
                        SortExpression="Incremento" >
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField 
                        DataField="Valor_Actual" 
                        meta:resourcekey="BoundValor_ActualRecursoKCG" 
                        SortExpression="Valor_Actual" >
                        <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
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
                        DataField="Estado_nombre" 
                        HeaderText="Estado_nombre" 
                        SortExpression="Estado_nombre" 
                        Visible="False" />
                </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
            ID="odsGVDicSecuencia" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="Get" 
            TypeName="FEL.DIC.BO_Dic_Secuencia">
        <SelectParameters>
            <asp:SessionParameter 
            Name="s" 
            SessionField="Scope" 
            Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

