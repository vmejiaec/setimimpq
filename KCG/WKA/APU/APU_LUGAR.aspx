<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APU_LUGAR.aspx.cs" 
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG"
    Inherits="APU_APU_LUGAR"  
    meta:resourcekey="Tit_Apu_LugarRecursoKCG" %>
    
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
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">                    
                    
                function checkSelectedValuePredeterminada()
                    { 
                        var DropDownList1 = $get("ctl00_ContentPlaceHolder1_fvApuLugar_DropDownList1");
                        var Predeterminada   = $get("ctl00_ContentPlaceHolder1_fvApuLugar_Predeterminada");
                                        
                        Predeterminada.value = DropDownList1.options[DropDownList1.selectedIndex].value;
                    }
            
            </script>
            <asp:Panel
                runat="server"
                ID="pnlfvApuLugar"
                meta:resourcekey="Rec_Apu_LugarRecursoKCG">  
                      
                <asp:FormView 
                    ID="fvApuLugar" 
                    runat="server"                     
                    DataSourceID="odsFvApuLugar"    
                    DefaultMode="Insert">
                
                    <EditItemTemplate>
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
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"
                                    runat="server">
                                </asp:Label>              
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Codigo"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                 
                                    runat="server"
                                    TabIndex="-1"
                                    ReadOnly="true"                                    
                                    Text='<%# Bind("Codigo") %>'>                            
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                    ID="lblNombre" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    runat="server">
                                </asp:Label>
                            </td>  
                            <td
                                colspan="2">
                                <asp:TextBox 
                                    ID="Nombre" 
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    runat="server"
                                    Width="400px"
                                    Height="50px"
                                    TextMode ="MultiLine" 
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Style="text-transform:uppercase"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>   
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="UsuarioReq"
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="UsuarioReqE"
                                    TargetControlID="UsuarioReq" />                     
                            </td>                  
                        </tr>   
                        <tr>
                            <td>
                                <asp:Label                                    
                                    ID="lblProvincia"                                 
                                    runat="server"
                                    Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'>
                                </asp:Label>
                            </td>
                            <td
                                colspan="5"
                                align="left">
                                <asp:TextBox 
                                    ID="Apu_Provincia_Codigo"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Provincia_CodigoRecursoKCG.Text").ToString() %>'                                
                                    runat="server"
                                    CssClass="TEXTO_EDICION_KCG"                                    
                                    Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Provincia_Nombre" 
                                    Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'                                
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"                                    
                                    Style="text-transform:uppercase"
                                    Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                </asp:TextBox> 
                                <asp:Button 
                                    ID="btn_Zoom_Provincia" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/APU/APU_PROVINCIA.aspx; Filtro: Apu_Provincia_Codigo|Apu_Provincia_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." /> 
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="CodigoReq"
                                    ControlToValidate="Apu_Provincia_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" 
                                    ID="CodigoReqE"
                                    TargetControlID="CodigoReq" />
                            </td>
                        </tr>         
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'
                                    ID="lblPredeterminada"                                 
                                    runat="server">
                                </asp:Label>                        
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Predeterminada" 
                                    runat="server" 
                                    style="display:none"                                        
                                    Text='<%# Bind("Predeterminada") %>'>
                                </asp:TextBox>                            
                                <asp:DropDownList 
                                    ID="DropDownList1" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataSourceID="odsPredeterminada"
                                    DataTextField="Nombre"    
                                    DataValueField="Dic_Dominio_Dominio" 
                                    OnDataBound="Predeterminada_DataBound">
                                </asp:DropDownList>
                                <%--<asp:DropDownList 
                                    ID="DropDownList1" 
                                    runat="server" 
                                    TabIndex="-1"
                                    DataSourceID="odsPredeterminada"
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Visible="true"
                                    DataValueField="Dic_Dominio_Dominio" 
                                    SelectedValue='<%# Bind("Predeterminada") %>'>
                                </asp:DropDownList>--%>
                                <asp:ObjectDataSource 
                                    ID="odsPredeterminada" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="APU_LUGAR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="PREDETERMINADA" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>                                    
                            </td>
                        </tr>     
                        <tr>
                            <td
                                colspan="2">
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
                                                               
                        <asp:TextBox 
                            ID="Predeterminada_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Predeterminada_Nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Id") %>'>
                        </asp:TextBox>
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
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
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"    
                                    Visible="false"
                                    runat="server">
                                </asp:Label>              
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Codigo"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                 
                                    runat="server" 
                                    Visible="false"
                                    ReadOnly="true"
                                    CssClass="TEXTO_EDICION_KCG"
                                    Text='<%# Bind("Codigo") %>'>                            
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                    ID="lblNombre" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    runat="server">
                                </asp:Label>
                            </td>  
                            <td
                                colspan="2">
                                <asp:TextBox 
                                    ID="Nombre" 
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    runat="server"
                                    Width="400px"
                                    Height="50px"
                                    TextMode ="MultiLine" 
                                    CssClass="TEXTO_EDICION_KCG" 
                                    Style="text-transform:uppercase"
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>   
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="UsuarioReq"
                                    ControlToValidate="Nombre"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" ID="UsuarioReqE"
                                    TargetControlID="UsuarioReq" />                     
                            </td>                  
                        </tr>   
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblProvincia"                                 
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td
                                style="white-space:nowrap">
                                <asp:TextBox 
                                    ID="Apu_Provincia_Codigo"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Provincia_CodigoRecursoKCG.Text").ToString() %>'                                
                                    runat="server"                                     
                                    CssClass="TEXTO_EDICION_KCG"
                                    Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Provincia_Nombre" 
                                    Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'                                
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"                               
                                    Style="text-transform:uppercase"
                                    Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                </asp:TextBox>  
                                <asp:Button 
                                    ID="Button3" 
                                    runat="server" 
                                    CommandArgument="RutaDestino: ~/APU/APU_PROVINCIA.aspx; Filtro: Apu_Provincia_Codigo|Apu_Provincia_Nombre;"
                                    CommandName="Zoom" 
                                    Text="..." />
                                <asp:RequiredFieldValidator 
                                    runat="server" 
                                    ID="CodigoReq"
                                    ControlToValidate="Apu_Provincia_Codigo"
                                    ValidationGroup="I"
                                    ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                <AjaxControlToolkit:ValidatorCalloutExtender 
                                    runat="Server" ID="CodigoReqE"
                                    TargetControlID="CodigoReq" />
                            </td>
                        </tr>         
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'
                                    ID="lblPredeterminada"                                 
                                    runat="server">
                                </asp:Label>                        
                            </td>
                            <td>
                                <asp:TextBox 
                                    ID="Predeterminada" 
                                    runat="server" 
                                    style="display:none"                                        
                                    Text='<%# Bind("Predeterminada") %>'>
                                </asp:TextBox>                            
                                <asp:DropDownList 
                                    ID="DropDownList1" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataSourceID="odsPredeterminada"
                                    DataTextField="Nombre"    
                                    DataValueField="Dic_Dominio_Dominio" 
                                    OnDataBound="Predeterminada_DataBound">
                                </asp:DropDownList>
                                <%--<asp:DropDownList 
                                    ID="Predeterminada" 
                                    runat="server" 
                                    TabIndex="-1"
                                    DataSourceID="odsPredeterminada"
                                    DataTextField="Nombre"
                                    CssClass="TEXTO_EDICION_KCG" 
                                    DataValueField="Dic_Dominio_Dominio" 
                                    SelectedValue='<%# Bind("Predeterminada") %>'>
                                </asp:DropDownList>--%>
                                <asp:ObjectDataSource 
                                    ID="odsPredeterminada" 
                                    runat="server" 
                                    OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetByObjetoCampo" 
                                    TypeName="FEL.VER.BO_Ver_Dominio">
                                    <SelectParameters>
                                        <asp:Parameter 
                                            DefaultValue="Nombre" 
                                            Name="sortExpression" 
                                            Type="String" />
                                        <asp:SessionParameter 
                                            DefaultValue="" 
                                            Name="s" 
                                            SessionField="Scope" 
                                            Type="Object" />
                                        <asp:Parameter 
                                            DefaultValue="APU_LUGAR" 
                                            Name="Dic_Objeto_Nombre" 
                                            Type="String" />
                                        <asp:Parameter 
                                            DefaultValue="PREDETERMINADA" 
                                            Name="Dic_Campo_Nombre" 
                                            Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>                                    
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
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_CancelarRecursoKCG.AccesKey").ToString() %>' 
                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                 </asp:Button>                      
                            </td>                        
                        </tr>   
                        </table>
                                                               
                        <asp:TextBox 
                            ID="Predeterminada_Nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Predeterminada_Nombre") %>'>
                        </asp:TextBox>
                       
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Id" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Apu_Provincia_Id") %>'>
                        </asp:TextBox>
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
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
                                    Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'
                                    ID="lblCodigo"                                     
                                    runat="server">
                                </asp:Label>              
                            </td>
                            <td>
                                <asp:TextBox
                                    ID="Codigo"
                                    TabIndex="-1"
                                    ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'                                 
                                    runat="server"                                    
                                    ReadOnly="true"                                    
                                    Text='<%# Bind("Codigo") %>'>                            
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label 
                                    Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>' 
                                    ID="lblNombre" 
                                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                    AssociatedControlID="Nombre" 
                                    runat="server">
                                </asp:Label>
                            </td>  
                            <td>
                                <asp:TextBox 
                                    ID="Nombre" 
                                    ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                    runat="server"  
                                    Width="400px"
                                    Height="50px"
                                    TextMode ="MultiLine" 
                                    CssClass ="TEXTO_LECTURA_KCG"
                                    TabIndex="-1"           
                                    ReadOnly="true"                        
                                    Text='<%# Bind("Nombre") %>'>
                                </asp:TextBox>
                            </td>                  
                        </tr>   
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'
                                    ID="lblProvincia"                                 
                                    runat="server">
                                </asp:Label>
                            </td>
                            <td
                                colspan="3">
                                <asp:TextBox 
                                    ID="Apu_Provincia_Codigo"
                                    ToolTip='<%# GetLocalResourceObject("Apu_Provincia_CodigoRecursoKCG.Text").ToString() %>'                                
                                    runat="server"
                                    TabIndex="-1"
                                    ReadOnly="true"  
                                    Text='<%# Bind("Apu_Provincia_Codigo") %>'>
                                </asp:TextBox>
                                <asp:TextBox 
                                    ID="Apu_Provincia_Nombre" 
                                    Tooltip='<%# GetLocalResourceObject("Apu_Provincia_NombreRecursoKCG.Text").ToString() %>'                                
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    Text='<%# Bind("Apu_Provincia_Nombre") %>'>
                                </asp:TextBox>                                                  
                            </td>
                        </tr>         
                        <tr>
                            <td>
                                <asp:Label
                                    Text='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.Text").ToString() %>'
                                    ID="lblPredeterminada"                                 
                                    runat="server">
                                </asp:Label>                        
                            </td>
                            <td>  
                                <asp:TextBox 
                                    ID="Predeterminada_Nombre" 
                                    runat="server" 
                                    TabIndex="-1"
                                    ReadOnly="true"
                                    ToolTip='<%# GetLocalResourceObject("PredeterminadaRecursoKCG.ToolTip").ToString() %>'                                    
                                    Text='<%# Bind("Predeterminada_Nombre") %>'>
                                </asp:TextBox> 
                                <%--<asp:TextBox 
                                    ID="Predeterminada" 
                                    runat="server" 
                                    style="display:none"                                        
                                    Text='<%# Bind("Predeterminada") %>'>
                                </asp:TextBox>--%>                            
                                <%--<asp:DropDownList 
                                    ID="DropDownList1" 
                                    runat="server" 
                                    CssClass="TEXTO_EDICION_KCG"
                                    DataSourceID="odsPredeterminada"
                                    DataTextField="Nombre"    
                                    DataValueField="Dic_Dominio_Dominio" 
                                    OnDataBound="Predeterminada_DataBound">
                                </asp:DropDownList>--%>                                                                                          
                            </td>
                        </tr>
                        <tr>
                            <td
                                colspan="3">
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
                        
                        <%--Ids--%>
                        
                        <asp:TextBox 
                            ID="Int_Empresa_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Int_Empresa_Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Apu_Provincia_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Apu_Provincia_Id") %>'>
                        </asp:TextBox>
                        
                        <%--Oculto--%>
                                                               
                        <asp:TextBox 
                            ID="Predeterminada" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Predeterminada") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Int_empresa_Codigo" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_empresa_Codigo") %>'>
                        </asp:TextBox>             
                                            
                        <asp:TextBox 
                            ID="Int_Empresa_nombre" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Int_Empresa_nombre") %>'>
                        </asp:TextBox>
                                        
                        <asp:TextBox 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        
                    </ItemTemplate>
            
                </asp:FormView>
                <koala:KNavegacion 
                    ID="nav"
                    runat="server"
                    GridViewID="gvApuLugar"
                    FormViewID="FormView1" 
                    OnNavegar="nav_Siguiente" />
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvApuLugar" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFvApuLugar" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        TypeName="FEL.APU.BO_Apu_Lugar"
        UpdateMethod="Update" 
        SortParameterName="sortExpression">
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
                Contenedor="APU_LUGAR" 
                Objeto="APU_LUGAR" 
                IndiceScope ="Scope"
                Orden="1"
                ObjectDataSourceID="odsGvApuLugar"/>

            <asp:Panel
                runat="server" 
                ID="pnlgvApuProvincia" 
                meta:resourcekey="Rec_Listado_Apu_LugarRecursoKCG">
                
                <koala:KGrid
                    ID="gvApuLugar" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGvApuLugar"
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
                            <itemstyle width="80mm" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Provincia_Nombre" 
                            meta:resourcekey="BoundApu_Provincia_NombreRecursoKCG"
                            SortExpression="Apu_Provincia_Nombre" />
                        <asp:BoundField 
                            DataField="Predeterminada_Nombre" 
                            meta:resourcekey="BoundPredeterminada_NombreRecursoKCG"
                            SortExpression="Predeterminada_Nombre" >
                            <itemstyle horizontalalign="Center" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Apu_Provincia_Codigo" 
                            HeaderText="Apu_Provincia_Codigo"
                            SortExpression="Apu_Provincia_Codigo" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Int_Empresa_Id" 
                            HeaderText="Int_Empresa_Id" 
                            SortExpression="Int_Empresa_Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Int_empresa_Codigo" 
                            HeaderText="Int_empresa_Codigo" 
                            SortExpression="Int_empresa_Codigo" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Apu_Provincia_Id" 
                            HeaderText="Apu_Provincia_Id" 
                            SortExpression="Apu_Provincia_Id" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Int_Empresa_nombre" 
                            HeaderText="Int_Empresa_nombre" 
                            SortExpression="Int_Empresa_nombre" 
                            Visible="False"/>
                        <asp:BoundField 
                            DataField="Predeterminada" 
                            HeaderText="Predeterminada" 
                            SortExpression="Predeterminada" 
                            Visible="False"/>                        
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False"/>                        
                    </Columns>
                </koala:KGrid>            
            </asp:Panel>            
        </ContentTemplate>
    </asp:UpdatePanel>    
    <asp:ObjectDataSource 
        ID="odsGvApuLugar" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByEmpresa" 
        TypeName="FEL.APU.BO_Apu_Lugar">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

