<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_CAMPO.aspx.cs" 
    Inherits="DIC_DIC_CAMPO"  
    meta:resourcekey="Tit_CampoRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="uc1" %>
<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
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
        ID="udpFVDicCampo" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">         
                function ItemSelected_Objeto( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var txtDic_Id = $get("ctl00_ContentPlaceHolder1_txtDic_Id");
                    txtDic_Id.value = temp[0];   
                    var Dic_Objeto_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicCampo_Dic_Objeto_Codigo");
                    Dic_Objeto_Codigo.value = temp[1];                                                                               
                    var Dic_Objeto_Nombre = $get("ctl00_ContentPlaceHolder1_fvDicCampo_Dic_Objeto_Nombre");
                    Dic_Objeto_Nombre.value = temp[2];               
                }  
            
                function ItemSelected_Objeto_Nombre( source, eventArgs ) 
                { 
                    var valor = eventArgs.get_value();
                    var temp = new Array();
                    temp = valor.split('||');                       

                    var Dic_Objeto_Id = $get("ctl00_ContentPlaceHolder1_fvDicCampo_Dic_Objeto_Id");
                    Dic_Objeto_Id.value = temp[0];   
                    var Dic_Objeto_Codigo = $get("ctl00_ContentPlaceHolder1_fvDicCampo_Dic_Objeto_Codigo");
                    Dic_Objeto_Codigo.value = temp[1];
                }
            </script>
            <asp:Panel 
                ID="pnlFiltro" 
                runat="server" 
                Width="600px"
                meta:resourcekey="Rec_Dic_Campo_ObjetoRecursoKCG"
                DefaultButton="btnConsultar">
                <table>
                    <tr>
                        <td>
                            <asp:Label 
                                ID="lbl_Dic_Objeto_Nombre" 
                                runat="server"
                                Text='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.Text").ToString() %>'>
                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="DicObjetoNombre" 
                                ValidationGroup="S" 
                                runat="server"
                                Width="400px"
                                CssClass="TEXTO_EDICION_KCG"
                                ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'>
                            </asp:TextBox>
                            <asp:RequiredFieldValidator 
                                ID="rfvDicObjetoNombre"
                                runat="server" 
                                ControlToValidate="DicObjetoNombre"
                                ValidationGroup="S"            
                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                            <AjaxControlToolkit:ValidatorCalloutExtender 
                                runat="Server" 
                                ID="vceDicObjetoNombre"
                                TargetControlID="rfvDicObjetoNombre"/>
                            <AjaxControlToolkit:AutoCompleteExtender
                                runat="server" 
                                BehaviorID="AutoCompleteEx"
                                ID="autoComplete1" 
                                TargetControlID="DicObjetoNombre"
                                ServicePath="~/DIC/DIC_CAMPO.aspx" 
                                ServiceMethod="Get_Objeto"
                                MinimumPrefixLength="0" 
                                CompletionInterval="500"
                                EnableCaching="true"
                                CompletionSetCount="20"
                                CompletionListCssClass="autocomplete_completionListElement" 
                                CompletionListItemCssClass="autocomplete_listItem" 
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                OnClientItemSelected="ItemSelected_Objeto" >
                                <Animations>
                                    <OnShow>
                                        <Sequence>
                                            <%-- Make the completion list transparent and then show it --%>
                                            <OpacityAction Opacity="0" />
                                            <HideAction Visible="true" />                                                    
                                            <%--Cache the original size of the completion list the first time
                                                the animation is played and then set it to zero --%>
                                            <ScriptAction Script="
                                                // Cache the size and setup the initial size
                                                var behavior = $find('AutoCompleteEx');
                                                if (!behavior._height) {
                                                    var target = behavior.get_completionList();
                                                    behavior._height = target.offsetHeight - 2;
                                                    target.style.height = '0px';
                                                }" />                                                    
                                            <%-- Expand from 0px to the appropriate size while fading in --%>
                                            <Parallel Duration=".4">
                                                <FadeIn />
                                                <Length 
                                                    PropertyKey="height" 
                                                    StartValue="0" 
                                                    EndValueScript="$find('AutoCompleteEx')._height" />
                                            </Parallel>
                                        </Sequence>
                                    </OnShow>
                                    <OnHide>
                                        <%-- Collapse down to 0px and fade out --%>
                                        <Parallel Duration=".4">
                                            <FadeOut />
                                            <Length 
                                                PropertyKey="height" 
                                                StartValueScript="$find('AutoCompleteEx')._height" 
                                                EndValue="0" />
                                        </Parallel>
                                    </OnHide>
                                </Animations>
                            </AjaxControlToolkit:AutoCompleteExtender>   
                            <asp:Button 
                                ID="btnConsultar" 
                                runat="server" 
                                CausesValidation="true" 
                                ValidationGroup="S"
                                meta:resourcekey="Btn_Dic_Campo_ConsultarRecursoKCG" />     
                        </td>
                    </tr>
                </table> 
                <asp:TextBox 
                    ID="txtDic_Id"                             
                    runat="server" 
                    Style="display:none" >
                </asp:TextBox>                                                                
            </asp:Panel>
            <asp:Panel 
                runat="server" 
                ID="pnlDatos" 
                meta:resourcekey="Rec_CampoRecursoKCG">                
                <asp:FormView 
                    ID="fvDicCampo" 
                    runat="server" 
                    DataSourceID="odsFVDicCampo" 
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        <table>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label
                                        ID="Label1" 
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
                                        ID="Label16" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("FiltroRecursoKCG.Text").ToString() %>'>                                                
                                    </asp:Label>
                                </td>
                                <td >
                                    <asp:DropDownList 
                                        ID="ddlfiltro" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("FiltroRecursoKCG.ToolTip").ToString() %>'                                                                                       
                                        DataSourceID="odsfiltro" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        SelectedValue='<%# Bind("Filtro") %>'
                                        DataValueField="Dic_Dominio_Dominio">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsfiltro" 
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="FILTRO" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                                              
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label                                         
                                        ID="Label2" 
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
                                        Width="447px"
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server" 
                                        ID="rvNombre"
                                        ControlToValidate="Nombre"
                                        ValidationGroup="I"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rvNombre" />
                                </td>
                            </tr>                            
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label5" 
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
                                        ToolTip='<%# GetLocalResourceObject("Dic_Objeto_CodigoRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Nombre" 
                                        runat="server" 
                                        Width="400px"   
                                        ReadOnly="true"                                     
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>' >
                                    </asp:TextBox>                                                                                                                  
                                </td>                            
                            </tr>
                            <tr align="left">
                                 <td>
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                 </td>   
                                 <td>
                                    <asp:DropDownList 
                                        ID="ddlTipoDato" 
                                        runat="server"
                                        CssClass="TEXTO_EDICION_KCG" 
                                        DataSourceID="odsTipoDato" 
                                        DataTextField="Nombre"
                                        ToolTip='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.ToolTip").ToString() %>'
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Bind("Tipo_Dato") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipoDato" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio" 
                                        SortParameterName="sortExpression">
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="TIPO_DATO" 
                                                Name="dic_campo_nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                    
                                 </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label6" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.Text").ToString() %>'>                                                                                 
                                    </asp:Label>
                                  </td>
                                  <td>
                                    <asp:DropDownList
                                        ID="ddlTipoConstraint" 
                                        CssClass="TEXTO_EDICION_KCG"
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.ToolTip").ToString() %>'
                                        DataSourceID="odsTipoConstraint"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Tipo_Constraint") %>' >
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipoConstraint" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        SortParameterName="sortExpression" 
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="TIPO_CONSTRAINT" 
                                                Name="dic_campo_nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Button 
                                       ID="UpdateButton" 
                                       runat="server" 
                                       CausesValidation="True" 
                                       CommandName="Update"
                                       ValidationGroup="I"
                                       AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_ActualizarRecursoKCG.AccesKey").ToString() %>'
                                       Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.Text").ToString() %>'
                                       ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_UpdateRecursoKCG.ToolTip").ToString() %>'>
                                    </asp:Button>
                                    <asp:Button 
                                       ID="Button4" 
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
                            ID="Dic_Objeto_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox                                 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server"                                 
                            Style="display:none"
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                       
                       <%--Ocultos--%>
                       
                       <asp:TextBox 
                            Visible="false"
                            ID="Tipo_Dato_nombre" 
                            runat="server" 
                            Text='<%# Bind("Tipo_Dato_nombre") %>'>
                       </asp:TextBox>
                                     
                       <asp:TextBox 
                            Visible="false"
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox 
                            ID="Filtro_Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Filtro_Nombre") %>'>
                        </asp:TextBox>
                                                                                                            
                        <asp:TextBox 
                            Visible="false"
                            ID="Tipo_Constraint_nombre" 
                            runat="server" 
                            Text='<%# Bind("Tipo_Constraint_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox                                                 
                            ID="Dic_Modulo_Codigo" 
                            runat="server"   
                            Visible="false"                     
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Dic_Modulo_Nombre"                         
                            runat="server" 
                            Visible="false"                        
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>                    
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Label 
                                        ID="Estado_Nombre" 
                                        runat="server" 
                                        Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                               </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        Visible="false"
                                        ID="Label1" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        Visible="false"
                                        ReadOnly="true"
                                        ID="Codigo" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Codigo") %>'>
                                    </asp:TextBox>                                            
                                </td>
                             </tr>
                             <tr align="left">                                        
                                <td>
                                    <asp:Label                                                 
                                        ID="Label15" 
                                        runat="server"
                                        Text='<%# GetLocalResourceObject("FiltroRecursoKCG.Text").ToString() %>'>                                        
                                    </asp:Label>
                                </td>
                                <td>   
                                    <asp:DropDownList 
                                        ID="ddlfiltro" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("FiltroRecursoKCG.ToolTip").ToString() %>'                                                                                       
                                        DataSourceID="odsfiltro" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        SelectedValue='<%# Bind("Filtro") %>'
                                        DataValueField="Dic_Dominio_Dominio">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsfiltro" 
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="FILTRO" 
                                                Name="Dic_Campo_Nombre" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>                   
                                                                                
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'
                                        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                                        AssociatedControlID="Nombre" >
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        runat="server" 
                                        Width="447px"
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>' 
                                        CssClass="TEXTO_EDICION_KCG">
                                   </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        runat="server"
                                        ValidationGroup="U" 
                                        ID="rvNombre"
                                        ControlToValidate="Nombre"
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server"  ID="arvGeneral"
                                        TargetControlID="rvNombre" />
                                </td>
                            </tr>                            
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label5" 
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
                                        Text='<%# Bind("Dic_Objeto_Codigo") %>' >
                                    </asp:TextBox>
                                    <asp:TextBox 
                                        ID="Dic_Objeto_Nombre" 
                                        runat="server" 
                                        Width="400px"   
                                        CssClass="TEXTO_EDICION_KCG"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>' >
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator 
                                        ID="rfvDic_Objeto_Nombre"
                                        runat="server" 
                                        ControlToValidate="Dic_Objeto_Nombre"
                                        ValidationGroup="I"            
                                        ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                                        Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                                    <AjaxControlToolkit:ValidatorCalloutExtender 
                                        runat="Server" 
                                        ID="vceDic_Objeto_Nombre"
                                        TargetControlID="rfvDic_Objeto_Nombre"/>
                                    <AjaxControlToolkit:AutoCompleteExtender
                                        runat="server" 
                                        BehaviorID="AutoCompleteEx_Objeto"
                                        ID="autoComplete_Objeto" 
                                        TargetControlID="Dic_Objeto_Nombre"
                                        ServicePath="~/DIC/DIC_CAMPO.aspx" 
                                        ServiceMethod="Get_Objeto_Nombre"
                                        MinimumPrefixLength="0" 
                                        CompletionInterval="500"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionListCssClass="autocomplete_completionListElement" 
                                        CompletionListItemCssClass="autocomplete_listItem" 
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        OnClientItemSelected="ItemSelected_Objeto_Nombre" >
                                        <Animations>
                                            <OnShow>
                                                <Sequence>
                                                    <%-- Make the completion list transparent and then show it --%>
                                                    <OpacityAction Opacity="0" />
                                                    <HideAction Visible="true" />                                                    
                                                    <%--Cache the original size of the completion list the first time
                                                        the animation is played and then set it to zero --%>
                                                    <ScriptAction Script="
                                                        // Cache the size and setup the initial size
                                                        var behavior = $find('AutoCompleteEx_Objeto');
                                                        if (!behavior._height) {
                                                            var target = behavior.get_completionList();
                                                            behavior._height = target.offsetHeight - 2;
                                                            target.style.height = '0px';
                                                        }" />                                                    
                                                    <%-- Expand from 0px to the appropriate size while fading in --%>
                                                    <Parallel Duration=".4">
                                                        <FadeIn />
                                                        <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx_Objeto')._height" />
                                                    </Parallel>
                                                </Sequence>
                                            </OnShow>
                                            <OnHide>
                                                <%-- Collapse down to 0px and fade out --%>
                                                <Parallel Duration=".4">
                                                    <FadeOut />
                                                    <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx_Objeto')._height" EndValue="0" />
                                                </Parallel>
                                            </OnHide>
                                        </Animations>
                                    </AjaxControlToolkit:AutoCompleteExtender>    
                                    <asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        CommandArgument="rutaDestino: ~/DIC/DIC_OBJETO.aspx; 
                                                        filtro: Dic_Objeto_Nombre;"
                                        CommandName="Zoom" 
                                        Text="..." />                                                                              
                                </td>
                            </tr>
                            <tr align="left">
                                 <td>
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                 </td>   
                                 <td>
                                    <asp:DropDownList 
                                        ID="ddlTipoDato" 
                                        runat="server" 
                                        ToolTip='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.ToolTip").ToString() %>'                                                                                       
                                        DataSourceID="odsTipoDato" 
                                        DataTextField="Nombre"
                                        CssClass="TEXTO_EDICION_KCG"
                                        DataValueField="Dic_Dominio_Dominio" 
                                        SelectedValue='<%# Bind("Tipo_Dato") %>'>
                                     </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipoDato" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        TypeName="FEL.VER.BO_Ver_Dominio" 
                                        SortParameterName="sortExpression">
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="TIPO_DATO" 
                                                Name="dic_campo_nombre" 
                                                Type="String" />
                                         </SelectParameters>
                                     </asp:ObjectDataSource>                                     
                                 </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label6" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList
                                        ID="ddlTipoConstraint" 
                                        runat="server"
                                        ToolTip='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.ToolTip").ToString() %>'
                                        CssClass="TEXTO_EDICION_KCG" 
                                        DataSourceID="odsTipoConstraint"
                                        DataTextField="Nombre" 
                                        DataValueField="Dic_Dominio_Dominio"
                                        SelectedValue='<%# Bind("Tipo_Constraint") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource 
                                        ID="odsTipoConstraint" 
                                        runat="server" 
                                        OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetByObjetoCampo" 
                                        SortParameterName="sortExpression" 
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
                                                DefaultValue="DIC_CAMPO" 
                                                Name="Dic_Objeto_Nombre" 
                                                Type="String" />
                                            <asp:Parameter 
                                                DefaultValue="TIPO_CONSTRAINT" 
                                                Name="dic_campo_nombre" 
                                                Type="String" />
                                          </SelectParameters>
                                      </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr align="left">
                                <td colspan="2">
                                   <asp:Button 
                                       ID="InsertButton" 
                                       runat="server" 
                                       CausesValidation="True" 
                                       CommandName="Insert"
                                       ValidationGroup="U" 
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
                            ID="Dic_Objeto_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox                                 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server"                                 
                            Style="display:none"
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                        </asp:TextBox>
                       
                       <%--Ocultos--%>
                       
                       <asp:TextBox 
                            Visible="false"
                            ID="Tipo_Dato_nombre" 
                            runat="server" 
                            Text='<%# Bind("Tipo_Dato_nombre") %>'>
                       </asp:TextBox>
                                     
                       <asp:TextBox 
                            Visible="false"
                            ID="Estado" 
                            runat="server" 
                            Text='<%# Bind("Estado") %>'>
                       </asp:TextBox>
                       
                       <asp:TextBox 
                            ID="Filtro_Nombre" 
                            Visible="false"
                            runat="server" 
                            Text='<%# Bind("Filtro_Nombre") %>'>
                        </asp:TextBox>
                                                                                                            
                        <asp:TextBox 
                            Visible="false"
                            ID="Tipo_Constraint_nombre" 
                            runat="server" 
                            Text='<%# Bind("Tipo_Constraint_nombre") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox                                                 
                            ID="Dic_Modulo_Codigo" 
                            runat="server"   
                            Visible="false"                     
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Dic_Modulo_Nombre"                         
                            runat="server" 
                            Visible="false"                        
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table>
                            <tr align="left">
                                <td colspan="2">
                                    <asp:Label 
                                    ID="Estado_Nombre" 
                                    runat="server" 
                                    Text='<%# Bind("Estado_Nombre") %>'>
                                    </asp:Label>
                               </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label1" 
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
                            <tr>                                    
                                <td>                                        
                                    <asp:Label 
                                        ID="Label7" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("FiltroRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>                          
                                </td>
                                <td>  
                                    <asp:TextBox 
                                        ID="Filtro_Nombre"                                 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"                                         
                                        ToolTip='<%# GetLocalResourceObject("FiltroRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Filtro_Nombre") %>'>
                                    </asp:TextBox>                                           
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label2" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("NombreRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox 
                                        ID="Nombre" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        runat="server"
                                        Width="447px" 
                                        ToolTip='<%# GetLocalResourceObject("NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Nombre") %>'>
                                    </asp:TextBox>
                                </td>
                            </tr>                            
                            <tr align="left">
                                <td>
                                    <asp:Label 
                                        ID="Label5" 
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
                                        Width="400px"   
                                        ReadOnly="true"                                     
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Dic_Objeto_NombreRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Dic_Objeto_Nombre") %>' >
                                    </asp:TextBox>
                                    <asp:Button 
                                        ID="Button2" 
                                        runat="server" 
                                        Enabled="false" 
                                        CommandArgument="rutaDestino: ~/DIC/DIC_OBJETO.aspx; filtro: Dic_Objeto_Id;"
                                        CommandName="Zoom" 
                                        Text="..." />
                                </td>
                            
                            </tr>
                            <tr align="left">
                                 <td>
                                    <asp:Label 
                                        ID="Label4" 
                                        runat="server"  
                                        Text='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                 </td>   
                                 <td>
                                    <asp:TextBox                                                 
                                        ID="Tipo_Dato_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Tipo_DatoRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Tipo_Dato_Nombre") %>'>
                                    </asp:TextBox>
                    
                                 </td>
                            </tr>
                            <tr align="left">
                                  <td>
                                    <asp:Label 
                                        ID="Label6" 
                                        runat="server" 
                                        Text='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.Text").ToString() %>'>
                                    </asp:Label>
                                  </td>
                                  <td>
                                    <asp:TextBox                                                 
                                        ID="Tipo_Constraint_Nombre" 
                                        runat="server" 
                                        ReadOnly="true"
                                        TabIndex="-1"
                                        ToolTip='<%# GetLocalResourceObject("Tipo_ConstraintRecursoKCG.ToolTip").ToString() %>'
                                        Text='<%# Bind("Tipo_Constraint_Nombre") %>'>
                                    </asp:TextBox>
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
                                    <uc1:wucMensajeEliminar 
                                        ID="WucMensajeEliminar1" 
                                        runat="server" />
                               </td>
                            </tr>
                        </table>
                            
                       <%--Id's--%>
                       
                       <asp:TextBox 
                            ID="Dic_Objeto_Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Dic_Objeto_Id") %>'>
                       </asp:TextBox>    
                                              
                       <asp:TextBox                                                                 
                            ID="Id" 
                            runat="server" 
                            Style="display:none"
                            Text='<%# Bind("Id") %>'>
                       </asp:TextBox> 
                       
                       <asp:TextBox 
                            ID="Dic_Modulo_Id" 
                            runat="server"                                 
                            Style="display:none"
                            Text='<%# Bind("Dic_Modulo_Id") %>'>
                       </asp:TextBox> 
                         
                       <%--Ocultos--%>                      
                      
                       <asp:TextBox 
                            ID="Filtro"                                 
                            runat="server" 
                            Visible="false" 
                            Text='<%# Bind("Filtro") %>'>
                        </asp:TextBox>
                        
                       <asp:TextBox                                 
                            ID="Tipo_Dato" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo_Dato") %>'>
                       </asp:TextBox>      
                            
                       <asp:TextBox                                 
                            ID="Estado" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Estado") %>'>
                       </asp:TextBox>   
                                 
                       <asp:TextBox                
                            ID="Tipo_Constraint" 
                            runat="server" 
                            Visible="false"
                            Text='<%# Bind("Tipo_Constraint") %>'>
                        </asp:TextBox> 
                        
                        <asp:TextBox                                                 
                            ID="Dic_Modulo_Codigo" 
                            runat="server"   
                            Visible="false"                     
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'>
                        </asp:TextBox>
                        
                        <asp:TextBox 
                            ID="Dic_Modulo_Nombre"                         
                            runat="server" 
                            Visible="false"                        
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'>
                        </asp:TextBox>                         
                    </ItemTemplate>
                </asp:FormView>
            </asp:Panel>
        </ContentTemplate> 
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="GridView1" 
                EventName="SelectedIndexChanged" />
        </Triggers>   
    </asp:UpdatePanel>       
    <asp:ObjectDataSource 
        ID="odsFVDicCampo" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        DeleteMethod="Delete" 
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" 
        SortParameterName="sortExpression" 
        TypeName="FEL.DIC.BO_Dic_Campo"
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
        ID="UpdatePanel1" 
        runat="server">
            <ContentTemplate>
                <asp:Button 
                    ID="Atras" 
                    runat="server"                     
                    Visible="False"/>
                <asp:Button 
                    ID="Seleccionar" 
                    runat="server"                     
                    Visible="False"/>
            </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <koala:KNavegacion 
                            ID="nav"
                            runat="server"
                            GridViewID="GridView1"
                            FormViewID="FormView1" 
                            OnNavegar="nav_Siguiente" />
                    </td>
                    <td>
                        <koala:KFiltro 
                            ID="kftFiltro" 
                            runat="server" 
                            Contenedor="DIC_CAMPO" 
                            Objeto="DIC_CAMPO" 
                            IndiceScope ="Scope"
                            Orden="1" 
                            ObjectDataSourceID="odsGVDicCampo"/>
                    </td>
                </tr>
            </table>            
            <asp:Panel
                runat="server" 
                ID="pnlGridView" 
                meta:resourcekey="Rec_ListadoRecursoKCG">                
                <koala:KGrid 
                    ID="GridView1" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True" 
                    AutoGenerateColumns="False"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
                    DataSourceID="odsGVDicCampo"                     
                    DataKeyNames="Id,Dic_Objeto_id">                    
                        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                        <HeaderStyle CssClass="headerstyle" />
                        <PagerStyle CssClass="pagerstyle" />
                        <SelectedRowStyle CssClass="selectedrowstyle" />
                    <Columns>
                        <asp:CommandField 
                            ShowSelectButton="True" 
                            ButtonType="Button" 
                            SelectText="..." />
                        <asp:BoundField 
                            DataField="Codigo" 
                            meta:resourcekey="BoundCodigoRecursoKCG"
                            SortExpression="Codigo_int" >
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Nombre" 
                            meta:resourcekey="BoundNombreRecursoKCG"
                            SortExpression="Nombre" >
                            <ItemStyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo_Dato_Nombre" 
                            meta:resourcekey="BoundTipo_Dato_NombreRecursoKCG"
                            SortExpression="Tipo_Dato_Nombre">                             
                            <Itemstyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Tipo_Constraint_Nombre"
                            meta:resourcekey="BoundTipo_Constraint_NombreRecursoKCG"
                            SortExpression="Tipo_Constraint_Nombre">                            
                            <Itemstyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Filtro_Nombre"
                            meta:resourcekey="BoundFiltroRecursoKCG"
                            SortExpression="Filtro_Nombre" >
                            <ItemStyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Modulo_Nombre" 
                            meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"
                            SortExpression="Dic_Modulo_Nombre">
                            <ItemStyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Objeto_Nombre" 
                            meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG"
                            SortExpression="Dic_Objeto_Nombre" >
                            <ItemStyle width="80mm" wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Filtro" 
                            HeaderText="Filtro" 
                            SortExpression="Filtro"
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Modulo_Codigo" 
                            HeaderText="Dic_Modulo_Codigo" 
                            SortExpression="Dic_Modulo_Codigo" 
                            Visible="False">                            
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Dic_Objeto_Codigo" 
                            HeaderText="Dic_Objeto_Codigo" 
                            SortExpression="Dic_Objeto_Codigo" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Objeto_Id" 
                            HeaderText="Dic_Objeto_Id" 
                            SortExpression="Dic_Objeto_Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Dato" 
                            meta:resourcekey="BoundTipo_DatoRecursoKCG"
                            SortExpression="Tipo_Dato" 
                            Visible="False">                            
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Id" 
                            HeaderText="Id" 
                            SortExpression="Id" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Estado_Nombre" 
                            HeaderText="Estado_Nombre" 
                            SortExpression="Estado_Nombre" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Tipo_Constraint" 
                            meta:resourcekey="BoundTipo_ConstraintRecursoKCG"
                            SortExpression="Tipo_Constraint" 
                            Visible="False" >                            
                        </asp:BoundField>
                        <asp:BoundField 
                            DataField="Estado" 
                            HeaderText="Estado" 
                            SortExpression="Estado" 
                            Visible="False" />
                        <asp:BoundField 
                            DataField="Dic_Modulo_Id" 
                            HeaderText="Dic_Modulo_Id" 
                            SortExpression="Dic_Modulo_Id" 
                            Visible="False" />
                    </Columns>
                </koala:KGrid>
            </asp:Panel> 
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource 
        ID="odsGVDicCampo" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByObjeto" 
        TypeName="FEL.DIC.BO_Dic_Campo">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter 
                ControlID="txtDic_Id" 
                Name="Dic_Objeto_Id" 
                PropertyName="Text"
            Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>    
</asp:Content>