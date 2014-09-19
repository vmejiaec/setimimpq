<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CODIGO.aspx.cs" 
    Inherits="DIC_DIC_CODIGO" 
    meta:resourcekey="Tit_CodigoRecursoKCG"
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
                ID="fvDicCodigo" 
                runat="server" 
                DataSourceID="odsFVDicCodigo" 
                DefaultMode="Insert" 
                OnModeChanging="fvDicCodigo_ModeChanging">
                    <EditItemTemplate>
                        <asp:Panel
                            runat="server"
                            id="pnlCabecera"
                            meta:resourcekey="Rec_CodigoRecursoKCG">
                                <table>
                                    <tr  align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Label1" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server"                                                                                                 
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
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
                                        <td>
                                            <asp:Label 
                                                ID="lblModulo" 
                                                runat="server" 
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                AssociatedControlID="Dic_Modulo_Nombre"
                                                Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Codigo" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"  
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button3" 
                                                runat="server" 
                                                CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx;Filtro:Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar:Dic_Objeto_Id|Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                                CommandName="Zoom" 
                                                Text="..."/>                                            
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator1"
                                                ControlToValidate="Dic_Modulo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender1"
                                                TargetControlID="RequiredFieldValidator1" />
                                       </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjeto" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Codigo" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                            </asp:TextBox> 
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG"
                                                Width="400px"  
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                    ID="Button1" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_Objeto.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar: Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />                                            
                                             <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator3"
                                                ControlToValidate="Dic_Objeto_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender3"
                                                TargetControlID="RequiredFieldValidator3" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjetoRecurso" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Codigo" 
                                                runat="server" 
                                                ReadOnly="true"
                                                TabIndex="-1" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                Width="400px" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button2" 
                                                runat="server" 
                                                CommandArgument="RutaDestino: ~/DIC/DIC_Campo.aspx; Filtro: Dic_Campo_Codigo|Dic_Campo_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Modulo_Codigo|Dic_Modulo_Nombre;"
                                                CommandName="Zoom" 
                                                Text="..." />                                           
                                             <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="Dic_Campo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        </td>
                                    </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel 
                            ID="pnlPrincipal"
                            runat="server"
                            meta:resourcekey="Rec_Codigo_OrdenRecursoKCG">
                                <table>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblTipo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>' >
                                           </asp:Label>  
                                        </td>
                                        <td style="white-space:nowrap">                                            
                                            <asp:DropDownList 
                                                ID="Tipo" 
                                                runat="server"
                                                AutoPostBack="true"
                                                DataSourceID="odsTipo" 
                                                DataTextField="Nombre"
                                                CssClass="TEXTO_EDICION_KCG"
                                                ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>' 
                                                DataValueField="Dic_Dominio_Dominio" 
                                                SelectedValue='<%# Bind("Tipo") %>'
                                                OnSelectedIndexChanged="Tipo_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource 
                                                ID="odsTipo" 
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
                                                        Name="s" 
                                                        SessionField="Scope" 
                                                        Type="Object" />
                                                    <asp:Parameter 
                                                        DefaultValue="DIC_CODIGO" 
                                                        Name="Dic_Objeto_Nombre" 
                                                        Type="String" />
                                                    <asp:Parameter 
                                                        DefaultValue="TIPO" 
                                                        Name="Dic_Campo_Nombre" 
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>                                       
                                            <asp:Label 
                                                ID="lblOrden" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                           </asp:Label>                                         
                                            <asp:TextBox 
                                                ID="Orden" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                style="text-align:right"
                                                ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Orden") %>'>
                                            </asp:TextBox>
                                            <asp:RequiredFieldValidator 
                                                 runat="server" 
                                                 ID="rvorden"
                                                 ControlToValidate="Orden"
                                                 ValidationGroup="I"
                                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                 runat="Server"  
                                                 ID="ValidatorCalloutExtender6"
                                                 TargetControlID="rvorden" />  
                                        </td>
                                    </tr>
                                    <tr align="left">
                                            <td colspan="4">
                                            <!--PANEL  NUMERO  UNO  (SECUENCIA) -->
                                                <asp:Panel 
                                                    runat="server" Visible ="true"
                                                    Id="pnlDatos1">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                    ID="lblSecuencia" 
                                                                    runat="server" 
                                                                    Text='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.Text").ToString() %>'>
                                                               </asp:Label>  
                                                                </td>
                                                                <td>
                                                                   <asp:TextBox 
                                                                        ID="Dic_Secuencia_Codigo" 
                                                                        runat="server" 
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Dic_Secuencia_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Dic_Secuencia_Nombre" 
                                                                        runat="server" 
                                                                        CssClass="TEXTO_EDICION_KCG"
                                                                        Width="308px" 
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Dic_Secuencia_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button4" 
                                                                        runat="server"                                                                                    
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_SECUENCIA.aspx; Filtro: Dic_Secuencia_Codigo|Dic_Secuencia_Nombre;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  DOS   (CONSTANTE) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos2" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblConstante" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("ConstanteRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label>  
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox 
                                                                        ID="Constante" 
                                                                        runat="server" 
                                                                        CssClass="TEXTO_EDICION_KCG"
                                                                        ToolTip='<%# GetLocalResourceObject("ConstanteRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Constante") %>'>
                                                                     </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  TRES  (FUNCION) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos3" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                            ID="lblFuncion" 
                                                                            runat="server" 
                                                                            Text='<%# GetLocalResourceObject("FuncionRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label> 
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Funcion" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        ToolTip='<%# GetLocalResourceObject("FuncionRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Funcion") %>'>
                                                                    </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  CUATRO  (CAMPOS  A RELACIONAR) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos4" Visible ="true">
                                                        <table>
                                                            <tr >
                                                                <td>
                                                                    <asp:Label 
                                                                        ID="lblCampoRelacion" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList 
                                                                        ID="Act_Dic_Campo_Id" 
                                                                        runat="server"
                                                                        ToolTip='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        DataSourceID="odsreferencia" 
                                                                        DataTextField="Nombre"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        DataValueField="Id"
                                                                        SelectedValue = '<% # Bind("Act_Dic_Campo_Id")%>'
                                                                        OnSelectedIndexChanged="Tipo_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:ObjectDataSource 
                                                                        ID="odsreferencia" 
                                                                        runat="server" 
                                                                        OldValuesParameterFormatString="original_{0}"
                                                                        SelectMethod="GetByObjeto" 
                                                                        TypeName="FEL.DIC.BO_Dic_Campo" 
                                                                        OnSelecting="odsreferencia_Selecting">
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
                                                                                DefaultValue="" 
                                                                                Name="Dic_Objeto_Id" 
                                                                                Type="String" />
                                                                        </SelectParameters>
                                                                    </asp:ObjectDataSource>                                                           
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblModuloReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"   
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button5" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; NoGuardar: Ref_Dic_Objeto_Id|Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Campo_Id|Ref_dic_Campo_Codigo|Ref_Dic_Objeto_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                 <asp:Label 
                                                                        ID="lblObjetoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"    
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                     <asp:Button 
                                                                        ID="Button6" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; NoGuardar: Ref_Dic_Campo_Id|Ref_dic_Campo_Codigo|Ref_Dic_Campo_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                        ID="lblCampoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_dic_Campo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"   
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_dic_Campo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Campo_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG"  
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Campo_Nombre") %>'>
                                                                    </asp:TextBox> 
                                                                     <asp:Button 
                                                                        ID="Button7" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Ref_dic_Campo_Codigo|Ref_Dic_Campo_Nombre|Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                
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
                                             <uc2:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                                         </td>
                                    </tr>
                                </table>
                        </asp:Panel>    
                        
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Id"                             
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Modulo_Id" 
                            Style="display:none"                            
                            runat="server" 
                            Text='<%# Bind("Ref_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Campo_Id"                             
                            Style="display:none" 
                            runat="server" 
                            Text='<%# Bind("Ref_Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Secuencia_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Dic_Secuencia_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Objeto_Id" 
                            runat="server"                            
                            Style="display:none"  
                            Text='<%# Bind("Ref_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        
                        <!--CAMPOS  OCULTOS -->
                        
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox> 
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>                      
                        <asp:TextBox 
                            ID="Tipo_nombre" 
                            runat="server"
                            CssClass="TEXTO_EDICION_KCG"
                            Visible="false"
                            Text='<%# Bind("Tipo_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Act_Dic_Campo_Nombre" 
                            runat="server" 
                            Visible="false"                            
                            Text='<%# Bind("Act_Dic_Campo_Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Act_Dic_Campo_Codigo" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Act_Dic_Campo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Objeto_Nombre") %>'>
                        </asp:TextBox>                        
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Panel
                            runat="server"
                            id="pnlCabecera"
                            meta:resourcekey="Rec_CodigoRecursoKCG">
                                <table>
                                    <tr  align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server" 
                                                Visible="false"                                                                                               
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
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
                                        <td>
                                            <asp:Label 
                                                ID="lblModulo" 
                                                runat="server" 
                                                AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                                AssociatedControlID="Dic_Modulo_Nombre"
                                                Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Codigo" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"   
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                Width="400px" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                              ID="Button3" 
                                              runat="server" 
                                              CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx;Filtro:Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar:Dic_Objeto_Id|Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                              CommandName="Zoom" 
                                              Text="..."/>                                            
                                            <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator1"
                                                ControlToValidate="Dic_Modulo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/>                                             
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender1"
                                                TargetControlID="RequiredFieldValidator1" />
                                       </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjeto" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Codigo" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"   
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                            </asp:TextBox> 
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG" 
                                                Width="400px" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                    ID="Button1" 
                                                    runat="server" 
                                                    CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Modulo_Codigo|Dic_Modulo_Nombre; NoGuardar: Dic_Campo_Id|Dic_Campo_Codigo|Dic_Campo_Nombre;"
                                                    CommandName="Zoom" 
                                                    Text="..." />                                            
                                             <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator3"
                                                ControlToValidate="Dic_Objeto_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender3"
                                                TargetControlID="RequiredFieldValidator3" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjetoRecurso" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Codigo" 
                                                runat="server" 
                                                TabIndex="-1"
                                                ReadOnly="true" 
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Nombre" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG"  
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button2" 
                                                runat="server" 
                                                CommandArgument="RutaDestino: ~/DIC/DIC_Campo.aspx; Filtro: Dic_Campo_Codigo|Dic_Campo_Nombre|Dic_Objeto_Codigo|Dic_Objeto_Nombre|Dic_Modulo_Codigo|Dic_Modulo_Nombre;"
                                                CommandName="Zoom" 
                                                Text="..." />                                           
                                             <asp:RequiredFieldValidator 
                                                runat="server" 
                                                ID="RequiredFieldValidator5"
                                                ControlToValidate="Dic_Campo_Nombre"
                                                ValidationGroup="I"
                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                runat="Server"  ID="ValidatorCalloutExtender5"
                                                TargetControlID="RequiredFieldValidator5" />
                                        </td>
                                    </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel 
                            ID="pnlPrincipal"
                            runat="server"
                            meta:resourcekey="Rec_Codigo_OrdenRecursoKCG">
                                <table>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblTipo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>' >
                                           </asp:Label>  
                                        </td>
                                        <td style="white-space:nowrap">                                            
                                            <asp:DropDownList 
                                                ID="Tipo" 
                                                runat="server"
                                                AutoPostBack="true"
                                                DataSourceID="odsTipo" 
                                                DataTextField="Nombre"
                                                CssClass="TEXTO_EDICION_KCG"
                                                ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'
                                                DataValueField="Dic_Dominio_Dominio" 
                                                SelectedValue='<%# Bind("Tipo") %>'                                                
                                                OnSelectedIndexChanged="Tipo_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource 
                                                ID="odsTipo" 
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
                                                        Name="s" 
                                                        SessionField="Scope" 
                                                        Type="Object" />
                                                    <asp:Parameter 
                                                        DefaultValue="DIC_CODIGO" 
                                                        Name="Dic_Objeto_Nombre" 
                                                        Type="String" />
                                                    <asp:Parameter 
                                                        DefaultValue="TIPO" 
                                                        Name="Dic_Campo_Nombre" 
                                                        Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>                                       
                                            <asp:Label 
                                                ID="lblOrden" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                           </asp:Label>                                          
                                            <asp:TextBox 
                                                ID="Orden" 
                                                runat="server"
                                                CssClass="TEXTO_EDICION_KCG"
                                                style="text-align:rigth"
                                                ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>' 
                                                Text='<%# Bind("Orden") %>'>
                                            </asp:TextBox>  
                                            <asp:RequiredFieldValidator 
                                                 runat="server" 
                                                 ID="rvorden"
                                                 ControlToValidate="Orden"
                                                 ValidationGroup="I"
                                                 ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                 Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/> 
                                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                                 runat="Server"  
                                                 ID="ValidatorCalloutExtender6"
                                                 TargetControlID="rvorden" />
                                        </td>
                                    </tr>
                                    <tr align="left">
                                            <td colspan="4">
                                            <!--PANEL  NUMERO  UNO  (SECUENCIA) -->
                                                <asp:Panel 
                                                    runat="server" Visible ="true"
                                                    Id="pnlDatos1">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                    ID="lblSecuencia" 
                                                                    runat="server" 
                                                                    Text='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.Text").ToString() %>'>
                                                               </asp:Label>  
                                                                </td>
                                                                <td>
                                                                   <asp:TextBox 
                                                                        ID="Dic_Secuencia_Codigo" 
                                                                        runat="server" 
                                                                        ReadOnly="true"
                                                                        TabIndex="-1" 
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Dic_Secuencia_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Dic_Secuencia_Nombre" 
                                                                        runat="server" 
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        Width="308px"
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Dic_Secuencia_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button4" 
                                                                        runat="server"                                                                                    
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_SECUENCIA.aspx; Filtro: Dic_Secuencia_Codigo|Dic_Secuencia_Nombre;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  DOS   (CONSTANTE) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos2" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblConstante" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("ConstanteRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label>  
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox 
                                                                        ID="Constante" 
                                                                        runat="server" 
                                                                        CssClass="TEXTO_EDICION_KCG"
                                                                        ToolTip='<%# GetLocalResourceObject("ConstanteRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Constante") %>'>
                                                                     </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  TRES  (FUNCION) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos3" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                            ID="lblFuncion" 
                                                                            runat="server" 
                                                                            Text='<%# GetLocalResourceObject("FuncionRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label> 
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Funcion" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        ToolTip='<%# GetLocalResourceObject("FuncionRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Funcion") %>'>
                                                                    </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  CUATRO  (CAMPOS  A RELACIONAR) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos4" Visible ="true">
                                                        <table>
                                                            <tr >
                                                                <td>
                                                                    <asp:Label 
                                                                        ID="lblCampoRelacion" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList 
                                                                        ID="Act_Dic_Campo_Id" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG"
                                                                        ToolTip='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        DataSourceID="odsreferencia" 
                                                                        DataTextField="Nombre" 
                                                                        DataValueField="Id"
                                                                        SelectedValue = '<% # Bind("Act_Dic_Campo_Id")%>'
                                                                        OnSelectedIndexChanged="Tipo_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    <asp:ObjectDataSource 
                                                                        ID="odsreferencia" 
                                                                        runat="server" 
                                                                        OldValuesParameterFormatString="original_{0}"
                                                                        SelectMethod="GetByObjeto" 
                                                                        TypeName="FEL.DIC.BO_Dic_Campo" 
                                                                        OnSelecting="odsreferencia_Selecting">
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
                                                                                DefaultValue="" 
                                                                                Name="Dic_Objeto_Id" 
                                                                                Type="String" />
                                                                        </SelectParameters>
                                                                    </asp:ObjectDataSource>                                                            
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblModuloReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1" 
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'  
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button5" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; NoGuardar: Ref_Dic_Objeto_Id|Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Campo_Id|Ref_dic_Campo_Codigo|Ref_Dic_Objeto_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                 <asp:Label 
                                                                        ID="lblObjetoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG"
                                                                        Width="400px"  
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                     <asp:Button 
                                                                        ID="Button6" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; NoGuardar: Ref_Dic_Campo_Id|Ref_dic_Campo_Codigo|Ref_Dic_Campo_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                        ID="lblCampoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_dic_Campo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1" 
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_dic_Campo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Campo_Nombre" 
                                                                        runat="server"
                                                                        CssClass="TEXTO_EDICION_KCG" 
                                                                        Width="400px" 
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>' 
                                                                        Text='<%# Bind("Ref_Dic_Campo_Nombre") %>'>
                                                                    </asp:TextBox> 
                                                                     <asp:Button 
                                                                        ID="Button7" 
                                                                        runat="server" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Ref_dic_Campo_Codigo|Ref_Dic_Campo_Nombre|Ref_Dic_Objeto_Codigo|Ref_Dic_Objeto_Nombre|Ref_Dic_Modulo_Codigo|Ref_Dic_Modulo_Nombre; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                
                                            </td>
                                    </tr>
                                    
                                </table>
                        </asp:Panel> 

                        <!--PANEL DE LOS BOTONES -->
                                                <asp:Panel
                                                    runat="server" 
                                                    id="pnlBotones">
                                                    <table>
                                                        <tr align="left">
                                                            <td>
                                                             <asp:Button 
                                                                ID="InsertButton" 
                                                                runat="server" 
                                                                CausesValidation="True" 
                                                                CommandName="Insert"
                                                                ValidationGroup="I"
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.Text").ToString() %>'
                                                                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_InsertRecursoKCG.ToolTip").ToString() %>'>
                                                                </asp:Button>
                                                                <asp:Button 
                                                                    ID="InsertCancelButton" 
                                                                    runat="server" 
                                                                    CausesValidation="False" 
                                                                    CommandName="Cancel"
                                                                    Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                                                                    ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>'>
                                                                </asp:Button>
                                                           </td>
                                                      </tr>
                                                    </table>
                                                </asp:Panel>

                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Id" 
                            Visible="true"
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Modulo_Id" 
                            Style="display:none"
                            Visible="true"
                            runat="server" 
                            Text='<%# Bind("Ref_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Id" 
                            runat="server" 
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Campo_Id" 
                            Visible="true"
                            Style="display:none" 
                            runat="server" 
                            Text='<%# Bind("Ref_Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server" 
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Secuencia_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Dic_Secuencia_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Objeto_Id" 
                            runat="server"
                            Visible="true"
                            Style="display:none"  
                            Text='<%# Bind("Ref_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            runat="server" 
                            Visible="true"
                            Style="display:none" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        
                        <!--CAMPOS  OCULTOS -->
                        
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox> 
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>                      
                        <asp:TextBox 
                            ID="Tipo_nombre" 
                            runat="server"                            
                            Visible="false"
                            Text='<%# Bind("Tipo_nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Act_Dic_Campo_Nombre" 
                            runat="server" 
                            Visible="false"                            
                            Text='<%# Bind("Act_Dic_Campo_Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Act_Dic_Campo_Codigo" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Act_Dic_Campo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Objeto_Nombre") %>'>
                        </asp:TextBox>                       
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Panel
                            runat="server"
                            id="pnlCabecera"
                            meta:resourcekey="Rec_CodigoRecursoKCG">
                                <table>
                                    <tr  align="right">
                                        <td colspan="2">
                                            <asp:Label 
                                                ID="Estado_nombre" 
                                                runat="server" 
                                                Text='<%# Bind("Estado_nombre") %>'>
                                            </asp:Label>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblCodigo" 
                                                runat="server"                                                                  
                                                Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
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
                                        <td>
                                            <asp:Label 
                                                ID="lblModulo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Codigo" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Modulo_Nombre" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button3" 
                                                runat="server" 
                                                Enabled="false" 
                                                CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx;Filtro:Dic_Modulo_Id;"
                                                CommandName="Zoom" 
                                                Text="..."/>                                           
                                       </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjeto" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Codigo" 
                                                runat="server"
                                                ReadOnly="true"  
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Objeto_Codigo") %>'>
                                            </asp:TextBox> 
                                            <asp:TextBox 
                                                ID="Dic_Objeto_Nombre" 
                                                runat="server"
                                                ReadOnly="true" 
                                                TabIndex="-1"
                                                Width="400px"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Objeto_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button1" 
                                                runat="server"
                                                Enabled="false"  
                                                CommandArgument="RutaDestino: ~/DIC/DIC_Objeto.aspx; Filtro: Dic_Objeto_Id;"
                                                CommandName="Zoom" 
                                                Text="..." />                                           
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblObjetoRecurso" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                            </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Codigo" 
                                                runat="server" 
                                                ReadOnly="true" 
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Campo_Codigo") %>'>
                                            </asp:TextBox>
                                            <asp:TextBox 
                                                ID="Dic_Campo_Nombre" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1"
                                                Width="400px"  
                                                ToolTip='<%# GetLocalResourceObject("Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Dic_Campo_Nombre") %>'>
                                            </asp:TextBox>
                                            <asp:Button 
                                                ID="Button2" 
                                                runat="server" 
                                                Enabled="false" 
                                                CommandArgument="RutaDestino: ~/DIC/DIC_Campo.aspx; Filtro: Dic_Campo_Id;"
                                                CommandName="Zoom" 
                                                Text="..." />                                           
                                        </td>
                                    </tr>
                                </table>
                        </asp:Panel>
                        <asp:Panel 
                            ID="pnlPrincipal"
                            runat="server"
                            meta:resourcekey="Rec_Codigo_OrdenRecursoKCG">
                                <table>
                                    <tr align="left">
                                        <td>
                                            <asp:Label 
                                                ID="lblTipo" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("TipoRecursoKCG.Text").ToString() %>' >
                                           </asp:Label>  
                                        </td>
                                        <td style="white-space:nowrap">
                                            <asp:TextBox 
                                                ID="Tipo_nombre" 
                                                runat="server"
                                                ReadOnly="true" 
                                                TabIndex="-1"
                                                ToolTip='<%# GetLocalResourceObject("TipoRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Tipo_nombre") %>'>
                                            </asp:TextBox>                                                                                                                        
                                            <asp:Label 
                                                ID="lblOrden" 
                                                runat="server" 
                                                Text='<%# GetLocalResourceObject("OrdenRecursoKCG.Text").ToString() %>'>
                                           </asp:Label>                                          
                                            <asp:TextBox 
                                                ID="Orden" 
                                                runat="server"
                                                ReadOnly="true"
                                                TabIndex="-1" 
                                                style="text-align:right"
                                                ToolTip='<%# GetLocalResourceObject("OrdenRecursoKCG.ToolTip").ToString() %>'
                                                Text='<%# Bind("Orden") %>'>
                                            </asp:TextBox>  
                                        </td>
                                    </tr>
                                    <tr align="left">
                                            <td colspan="4">
                                            <!--PANEL  NUMERO  UNO  (SECUENCIA) -->
                                                <asp:Panel 
                                                    runat="server" Visible ="true"
                                                    Id="pnlDatos1">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                    ID="lblSecuencia" 
                                                                    runat="server" 
                                                                    Text='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.Text").ToString() %>'>
                                                               </asp:Label>  
                                                                </td>
                                                                <td>
                                                                   <asp:TextBox 
                                                                        ID="Dic_Secuencia_Codigo" 
                                                                        runat="server" 
                                                                        ReadOnly="true" 
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Dic_Secuencia_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Dic_Secuencia_Nombre" 
                                                                        runat="server" 
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        Width="308px" 
                                                                        ToolTip='<%# GetLocalResourceObject("Dic_Secuencia_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Dic_Secuencia_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button4" 
                                                                        runat="server"  
                                                                        Enabled="false"                                                                                   
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_SECUENCIA.aspx; Filtro: Dic_Secuencia_Id;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  DOS   (CONSTANTE) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos2" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblConstante" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("ConstanteRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label>  
                                                                </td>
                                                                <td>
                                                                     <asp:TextBox 
                                                                        ID="Constante" 
                                                                        runat="server" 
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("ConstanteRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Constante") %>'>
                                                                     </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  TRES  (FUNCION) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos3" Visible ="true">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                            ID="lblFuncion" 
                                                                            runat="server" 
                                                                            Text='<%# GetLocalResourceObject("FuncionRecursoKCG.Text").ToString() %>'>
                                                                     </asp:Label> 
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Funcion" 
                                                                        runat="server"
                                                                        ReadOnly="true" 
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("FuncionRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Funcion") %>'>
                                                                    </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                <!--PANEL  NUMERO  CUATRO (CAMPOS  A RELACIONAR) -->
                                                <asp:Panel 
                                                    runat="server"
                                                    Id="pnlDatos4" Visible ="true">
                                                        <table>
                                                            <tr >
                                                                <td>
                                                                    <asp:Label 
                                                                        ID="lblCampoRelacion" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                         ID="Act_Dic_Campo_Nombre" 
                                                                         runat="server"
                                                                         ReadOnly="true" 
                                                                         TabIndex="-1"
                                                                         Width="400px"
                                                                         ToolTip='<%# GetLocalResourceObject("Act_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                         Text='<%# Bind("Act_Dic_Campo_Nombre") %>'>
                                                                    </asp:TextBox>                                                                                                                                                                                         
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                     <asp:Label 
                                                                        ID="lblModuloReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"  
                                                                        TabIndex="-1" 
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Modulo_Nombre" 
                                                                        runat="server"
                                                                        ReadOnly="true"  
                                                                        TabIndex="-1"
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Modulo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Modulo_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:Button 
                                                                        ID="Button5" 
                                                                        runat="server" 
                                                                        Enabled="false" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_MODULO.aspx; Filtro: Ref_Dic_Modulo_Id; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                 <asp:Label 
                                                                        ID="lblObjetoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                                                                    </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Objeto_Nombre" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Objeto_Nombre") %>'>
                                                                    </asp:TextBox>
                                                                     <asp:Button 
                                                                        ID="Button6" 
                                                                        runat="server" 
                                                                        Enabled="false" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_OBJETO.aspx; Filtro: Ref_Dic_Objeto_Id; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />                                                                    
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                <asp:Label 
                                                                        ID="lblCampoReferencia" 
                                                                        runat="server" 
                                                                        Text='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.Text").ToString() %>'>
                                                                </asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:TextBox 
                                                                        ID="Ref_dic_Campo_Codigo" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_CodigoRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_dic_Campo_Codigo") %>'>
                                                                    </asp:TextBox>
                                                                    <asp:TextBox 
                                                                        ID="Ref_Dic_Campo_Nombre" 
                                                                        runat="server"
                                                                        ReadOnly="true"
                                                                        TabIndex="-1"
                                                                        Width="400px"
                                                                        ToolTip='<%# GetLocalResourceObject("Ref_Dic_Campo_NombreRecursoKCG.ToolTip").ToString() %>'
                                                                        Text='<%# Bind("Ref_Dic_Campo_Nombre") %>'>
                                                                    </asp:TextBox> 
                                                                     <asp:Button 
                                                                        ID="Button7" 
                                                                        runat="server" 
                                                                        Enabled="false" 
                                                                        CommandArgument="RutaDestino: ~/DIC/DIC_CAMPO.aspx; Filtro: Ref_dic_Campo_Id; Alias:Ref;"
                                                                        CommandName="Zoom" 
                                                                        Text="..." />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                </asp:Panel>
                                                
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
                        </asp:Panel> 
                        <%--Id's--%>
                        
                        <asp:TextBox 
                            ID="Id"                             
                            Style="display:none"
                            runat="server" 
                            Text='<%# Bind("Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Modulo_Id"
                            runat="server" 
                            Style="display:none"                                                        
                            Text='<%# Bind("Ref_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Campo_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Campo_Id"
                            runat="server"                             
                            Style="display:none"                              
                            Text='<%# Bind("Ref_Dic_Campo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Act_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Secuencia_Id" 
                            runat="server"                            
                            Style="display:none" 
                            Text='<%# Bind("Dic_Secuencia_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Ref_Dic_Objeto_Id" 
                            runat="server"                            
                            Style="display:none"  
                            Text='<%# Bind("Ref_Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            runat="server"                             
                            Style="display:none" 
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                        </asp:TextBox>
                        
                        <!--CAMPOS  OCULTOS -->
                        
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Objeto_Codigo") %>'>
                        </asp:TextBox> 
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Codigo" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Act_Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>                      
                        <asp:TextBox 
                            ID="Tipo" 
                            runat="server"                            
                            Visible="false"
                            Text='<%# Bind("Tipo") %>'>
                        </asp:TextBox>                        
                       <%-- <asp:TextBox 
                            ID="Act_Dic_Campo_Nombre" 
                            runat="server" 
                            Visible="false"                            
                            Text='<%# Bind("Act_Dic_Campo_Nombre") %>'>
                        </asp:TextBox>--%>                       
                        <asp:TextBox 
                            ID="Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Estado" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Modulo_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>                        
                        <asp:TextBox 
                            ID="Act_Dic_Campo_Codigo" 
                            runat="server"
                            Visible="false"
                            Text='<%# Bind("Act_Dic_Campo_Codigo") %>'>
                        </asp:TextBox>
                        <asp:TextBox 
                            ID="Act_Dic_Objeto_Nombre" 
                            runat="server"
                            Visible="false" 
                            Text='<%# Bind("Act_Dic_Objeto_Nombre") %>'>
                        </asp:TextBox>                         
                    </ItemTemplate>
            </asp:FormView>
        </ContentTemplate>
           <Triggers>
                <asp:AsyncPostBackTrigger 
                    ControlID="gvDicCodigo" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsFVDicCodigo" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Codigo"
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
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="gvDicCodigo"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="DIC_CODIGO" 
                            Objeto="DIC_CODIGO" 
                            IndiceScope ="Scope"
                            Orden="1"
                            ObjectDataSourceID="odsGVDicCodigo"/>
                    </td>
                </tr>
            </table>
            <asp:Panel
                runat="server"
                id="pnlDatosGrid"
                meta:resourcekey="Rec_Listado_Dic_CodigoRecursoKCG">
                <koala:KGrid 
                    ID="gvDicCodigo" 
                    runat="server" 
                    AllowPaging="True" 
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataKeyNames="Id" 
                    DataSourceID="odsGVDicCodigo" 
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
                            <itemstyle horizontalalign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Modulo_Nombre" 
                            meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG" 
                            SortExpression="Dic_Modulo_Nombre">
                            <itemstyle width="80mm" Wrap="True"/>                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Objeto_Nombre" 
                            meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" 
                            SortExpression="Dic_Objeto_Nombre" >
                            <itemstyle width="80mm" Wrap="True"/>                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Campo_Nombre" 
                            meta:resourcekey="BoundDic_Campo_NombreRecursoKCG" 
                            SortExpression="Dic_Campo_Nombre" >
                            <itemstyle width="80mm" Wrap="True"/>                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo" 
                            meta:resourcekey="BoundTipoRecursoKCG"  
                            SortExpression="Tipo" >
                            <itemstyle horizontalalign="Center"/>                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Orden" 
                            meta:resourcekey="BoundOrdenRecursoKCG"   
                            SortExpression="Orden" >
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Secuencia_Nombre" 
                            meta:resourcekey="BoundDic_Secuencia_NombreRecursoKCG"   
                            SortExpression="Dic_Secuencia_Nombre" >
                            <itemstyle width="80mm" Wrap="True"/>                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Constante" 
                            meta:resourcekey="BoundConstanteRecursoKCG"    
                            SortExpression="Constante" >
                            <itemstyle width="80mm" Wrap="True"/>                                                
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Funcion" 
                            meta:resourcekey="BoundFuncionRecursoKCG"     
                            SortExpression="Funcion" >
                            <itemstyle width="80mm" Wrap="True"/>                                                
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Act_Dic_Campo_Codigo" 
                            meta:resourcekey="BoundAct_Dic_Campo_CodigoRecursoKCG"     
                            SortExpression="Act_Dic_Campo_Codigo" >
                            <itemstyle width="80mm" Wrap="True"/>                                                                        
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Ref_Dic_Objeto_Nombre" 
                            meta:resourcekey="BoundRef_Dic_Objeto_NombreRecursoKCG"     
                            SortExpression="Ref_Dic_Objeto_Nombre" >
                            <itemstyle width="80mm" Wrap="True"/>                                                
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Ref_Dic_Campo_Nombre" 
                            meta:resourcekey="BoundRef_Dic_Campo_NombreRecursoKCG"     
                            SortExpression="Ref_Dic_Campo_Nombre" >
                            <itemstyle width="80mm" Wrap="True"/>                                                
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Ref_Dic_Objeto_Codigo" 
                            HeaderText="Ref_Dic_Objeto_Codigo"
                            SortExpression="Ref_Dic_Objeto_Codigo" 
                            Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Act_Dic_Objeto_Codigo" 
                            HeaderText="Act_Dic_Objeto_Codigo"
                            SortExpression="Act_Dic_Objeto_Codigo" 
                            Visible="False" >
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Modulo_Codigo" 
                            HeaderText="Act_Dic_Modulo_Codigo"
                            SortExpression="Act_Dic_Modulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_Dic_Modulo_Id" 
                            HeaderText="Ref_Dic_Modulo_Id" 
                            SortExpression="Ref_Dic_Modulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Campo_Id" 
                            HeaderText="Dic_Campo_Id" 
                            SortExpression="Dic_Campo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_nombre" 
                            HeaderText="Tipo_nombre" 
                            SortExpression="Tipo_nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Modulo_Id" 
                            HeaderText="Act_Dic_Modulo_Id" 
                            SortExpression="Act_Dic_Modulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Modulo_Codigo" 
                            HeaderText="Dic_Modulo_Codigo" 
                            SortExpression="Dic_Modulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_Dic_Modulo_Nombre" 
                            HeaderText="Ref_Dic_Modulo_Nombre"
                            SortExpression="Ref_Dic_Modulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Codigo" 
                            HeaderText="Dic_Objeto_Codigo" 
                            SortExpression="Dic_Objeto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_Dic_Campo_Id" 
                            HeaderText="Ref_Dic_Campo_Id" 
                            SortExpression="Ref_Dic_Campo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_nombre" 
                            HeaderText="Estado_nombre" 
                            SortExpression="Estado_nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Modulo_Id" 
                            HeaderText="Dic_Modulo_Id" 
                            SortExpression="Dic_Modulo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Campo_Nombre" 
                            HeaderText="Act_Dic_Campo_Nombre"
                            SortExpression="Act_Dic_Campo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Objeto_Id" 
                            HeaderText="Act_Dic_Objeto_Id" 
                            SortExpression="Act_Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Secuencia_Id" 
                            HeaderText="Dic_Secuencia_Id" 
                            SortExpression="Dic_Secuencia_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_Dic_Modulo_Codigo" 
                            HeaderText="Ref_Dic_Modulo_Codigo"
                            SortExpression="Ref_Dic_Modulo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Nombre" 
                            HeaderText="Nombre" 
                            SortExpression="Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Modulo_Nombre" 
                            HeaderText="Act_Dic_Modulo_Nombre"
                            SortExpression="Act_Dic_Modulo_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_Dic_Objeto_Id" 
                            HeaderText="Ref_Dic_Objeto_Id" 
                            SortExpression="Ref_Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Id" 
                            HeaderText="Dic_Objeto_Id" 
                            SortExpression="Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Secuencia_Codigo" 
                            HeaderText="Dic_Secuencia_Codigo"
                            SortExpression="Dic_Secuencia_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Ref_dic_Campo_Codigo" 
                            HeaderText="Ref_dic_Campo_Codigo"
                            SortExpression="Ref_dic_Campo_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Campo_Id" 
                            HeaderText="Act_Dic_Campo_Id" 
                            SortExpression="Act_Dic_Campo_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Act_Dic_Objeto_Nombre" 
                            HeaderText="Act_Dic_Objeto_Nombre"
                            SortExpression="Act_Dic_Objeto_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Campo_Codigo" 
                            HeaderText="Dic_Campo_Codigo" 
                            SortExpression="Dic_Campo_Codigo" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVDicCodigo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Codigo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

