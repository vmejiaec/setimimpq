<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="SEG_ROL_ELEMENTO.aspx.cs" 
    Inherits="SEG_SEG_ROL_ELEMENTO" 
    meta:resourcekey="Tit_Seg_Rol_ElementoRecursoKCG"
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
    
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeEliminar.ascx" 
    TagName="wucMensajeEliminar"
    TagPrefix="koala" %>

<%@ Register 
    Src="../WebUserControls/wucMensajeActualizar.ascx" 
    TagName="wucMensajeActualizar"
    TagPrefix="koala" %>
    
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <table>
        <tr valign="top">
            <td>
       <asp:UpdatePanel ID="udpMst" 
        runat="server"
        >
        <ContentTemplate>
            
    <asp:Panel ID="pnlRec_Seg_Rol_Elemento_Roles"
        runat="server" meta:resourcekey="Rec_Seg_Rol_Elemento_RolesRecursoKCG">
    
    
        
    <koala:KGrid ID="gvMstSegRol" 
        runat="server"  
        AllowPaging="true"
        AllowSorting="true"
        SelectedIndex="0"
        AutoGenerateColumns="False" 
        DataSourceID="odsGvMstSegRol"
        DataKeyNames="Id">
        
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" />
        
        <Columns>
            <asp:CommandField ButtonType="Button" 
                SelectText="..." 
                ShowSelectButton="True" />
            
            <asp:BoundField DataField="Codigo" 
                HeaderText="Codigo" 
                SortExpression="Codigo_int">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Nombre" 
                HeaderText="Nombre" 
                SortExpression="Nombre" >
                <ItemStyle Width="200px" />
            </asp:BoundField> 
            
            <asp:BoundField DataField="Id" 
                HeaderText="Id" 
                SortExpression="Id" visible="false" >
                
            </asp:BoundField>   
        </Columns>
    </koala:KGrid>
    
    </asp:Panel>
    
    
    
        </ContentTemplate>
    </asp:UpdatePanel>
    
            </td>
                    
            <td>
            
            <asp:UpdatePanel ID="udpBotones" runat="server">
                <ContentTemplate>
 
                <asp:Panel ID="pnlRec_AccesosRecursoKCG"
                    runat="server"
                    meta:resourcekey="Rec_AccesosRecursoKCG">
                    
                    <asp:Button ID="btnRol" 
                        runat="server" 
                        meta:resourcekey="Btn_Seg_Rol_Elemento_RolRecursoKCG" />
                        
                    <asp:Button ID="btnElemento" 
                        runat="server"
                        PostBackUrl="~/DIC/DIC_CON_ELEMENTO.aspx" 
                        meta:resourcekey="Btn_Seg_Rol_Elemento_ElementoRecursoKCG" />
                        
                    <asp:Button ID="btnEtiqueta" 
                        runat="server" 
                        PostBackUrl="~/VER/VER_ETIQUETA.aspx"
                        meta:resourcekey="Btn_Seg_Rol_Elemento_EtiquetaRecursoKCG" />
                    
                </asp:Panel>      
                 <koala:KNavegacion 
                    ID="navMst"
                    runat="server"
                    GridViewID="gvMstSegRol"  />
                </ContentTemplate>
               
            </asp:UpdatePanel>
           
            
            </td>
            
        </tr>
      
        
    </table>
    
    <asp:ObjectDataSource ID="odsGvMstSegRol" 
        runat="server" 
        SelectMethod="Get" TypeName="FEL.SEG.BO_Seg_Rol">
        <SelectParameters>
            <%--<asp:Parameter Name="sortExpression" Type="String" />--%>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
     
    <script type="text/javascript">
        function ItemSelected_Etiquetas( source, eventArgs ) 
        {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');                                                                   

            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[0];
            
            var dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_dic_con_elemento_nombre" );
            dic_con_elemento_nombre.value = temp[1];
            
            var Dic_Rotulo_id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Rotulo_id");
            Dic_Rotulo_id.value = temp[2];
            
            var Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Rotulo_Nombre");
            Dic_Rotulo_Nombre.value = temp[3];
            
             var Dic_Contenedor_Id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Contenedor_Id" );
             Dic_Contenedor_Id.value = temp[4];
            
             var dic_contenedor_nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_dic_contenedor_nombre" );
             dic_contenedor_nombre.value = temp[6];                                                                        
         }
         
         function ItemSelected_Contenedor( source, eventArgs )
         {
            var valor = eventArgs.get_value();
            var temp = new Array();
            temp = valor.split('||');
            
            var Dic_Contenedor_Id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Contenedor_Id" );
            Dic_Contenedor_Id.value = temp[0];
            
            var Dic_Con_Elemento_Id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Con_Elemento_Id" );
            Dic_Con_Elemento_Id.value = temp[1];
            
            var dic_con_elemento_nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_dic_con_elemento_nombre" );
            dic_con_elemento_nombre.value = temp[2];
            
            var Dic_Rotulo_id = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Rotulo_id");
            Dic_Rotulo_id.value = temp[3];
            
            var Dic_Rotulo_Nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Dic_Rotulo_Nombre");
            Dic_Rotulo_Nombre.value = temp[4];
            
            var Ver_etiqueta_nombre = $get("ctl00_ContentPlaceHolder1_fvDetSegRolElemento_Ver_etiqueta_nombre");
            Ver_etiqueta_nombre.value = temp[5];
         } 
     </script>
     
     <asp:Panel ID="Rec_Seg_Rol_Elemento_Elementos" 
        runat="server" meta:resourcekey="Rec_Seg_Rol_Elemento_ElementosRecursoKCG">
     
     <asp:UpdatePanel ID="UpdatePanel1" 
        runat="server"
        UpdateMode="Conditional">
        <ContentTemplate>
    
    <asp:FormView ID="fvDetSegRolElemento" 
        runat="server" 
        DataSourceID="odsFvDetSegRolElemento"
        DefaultMode="Insert">
        <EditItemTemplate>
            <table>
                <tr>
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
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <asp:Label ID="lbldic_contenedor_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_contenedor_nombre" 
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG"
                            runat="server" 
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="rfvdic_contenedor_nombre"
                            runat="server" 
                            ControlToValidate="dic_contenedor_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcedic_contenedor_nombre"
                            TargetControlID="rfvdic_contenedor_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx1"
                            ID="AutoCompleteExtender1" 
                            TargetControlID="dic_contenedor_nombre"
                            ServicePath="~/SEG/SEG_ROL_ELEMENTO.aspx" 
                            ServiceMethod="GetContenedor"
                            MinimumPrefixLength="0" 
                            CompletionInterval="0"
                            EnableCaching="true"
                            CompletionSetCount="1000"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Contenedor" ><%----%>
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
                                            var behavior = $find('AutoCompleteEx1');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                    
                                        <%-- Expand from 0px to the appropriate size while fading in --%>
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx1')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx1')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_etiqueta_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Ver_etiqueta_nombre"
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG" 
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="rfvVer_etiqueta_nombre"
                            runat="server" 
                            ControlToValidate="Ver_etiqueta_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceVer_etiqueta_nombre"
                            TargetControlID="rfvVer_etiqueta_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_ROL_ELEMENTO.aspx" 
                            ServiceMethod="GetEtiqueta"
                            MinimumPrefixLength="0" 
                            CompletionInterval="0"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Etiquetas" ><%----%>
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
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender> 
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbldic_con_elemento_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_con_elemento_nombre"
                            Width="400px"
                            TabIndex="-1" 
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("dic_con_elemento_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            Width="400px"
                            TabIndex="-1" 
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr align="left">
                    <td colspan="2">                                        
                        <asp:Button ID="UpdateButton" 
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
                        <koala:wucMensajeActualizar ID="WucMensajeActualizar1" runat="server" />
                    </td>
                </tr>
                
                
            </table>
            
            
            <div style="display:none">
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Tool_dic_rotulo_id" runat="server" Text='<%# Bind("Tool_dic_rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_Id" runat="server" Text='<%# Bind("Dic_Contenedor_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div>
            
        
            <asp:TextBox ID="estado_Nombre" Visible="false" runat="server" Text='<%# Bind("estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_codigo" Visible="false" runat="server" Text='<%# Bind("seg_rol_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_nombre" Visible="false" runat="server" Text='<%# Bind("seg_rol_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_con_elemento_codigo" Visible="false" runat="server" Text='<%# Bind("dic_con_elemento_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_contenedor_codigo" Visible="false" runat="server" Text='<%# Bind("dic_contenedor_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Ver_etiqueta_nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo_int" Visible="false" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" Visible="false" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" Visible="false" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
              
        </EditItemTemplate>
        
        <InsertItemTemplate>
             <table>
                <tr>
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
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <asp:Label ID="lbldic_contenedor_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_contenedor_nombre" 
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG"
                            runat="server" 
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="rfvdic_contenedor_nombre"
                            runat="server" 
                            ControlToValidate="dic_contenedor_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vcedic_contenedor_nombre"
                            TargetControlID="rfvdic_contenedor_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx1"
                            ID="AutoCompleteExtender1" 
                            TargetControlID="dic_contenedor_nombre"
                            ServicePath="~/SEG/SEG_ROL_ELEMENTO.aspx" 
                            ServiceMethod="GetContenedor"
                            MinimumPrefixLength="0" 
                            CompletionInterval="0"
                            EnableCaching="true"
                            CompletionSetCount="1000"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Contenedor" ><%----%>
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
                                            var behavior = $find('AutoCompleteEx1');
                                            if (!behavior._height) {
                                                var target = behavior.get_completionList();
                                                behavior._height = target.offsetHeight - 2;
                                                target.style.height = '0px';
                                            }" />                                                    
                                        <%-- Expand from 0px to the appropriate size while fading in --%>
                                        <Parallel Duration=".4">
                                            <FadeIn />
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx1')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx1')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_etiqueta_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Ver_etiqueta_nombre"
                            Width="400px"
                            CssClass="TEXTO_COMBOPER_KCG" 
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                        
                        <asp:RequiredFieldValidator ID="rfvVer_etiqueta_nombre"
                            runat="server" 
                            ControlToValidate="Ver_etiqueta_nombre"
                            ValidationGroup="I"
                            ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.ErrorMessage").ToString() %>'
                            Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ2RecursoKCG.Text").ToString() %>'/> 
                        <AjaxControlToolkit:ValidatorCalloutExtender 
                            runat="Server" 
                            ID="vceVer_etiqueta_nombre"
                            TargetControlID="rfvVer_etiqueta_nombre"/>
                        <AjaxControlToolkit:AutoCompleteExtender
                            runat="server" 
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1" 
                            TargetControlID="Ver_etiqueta_nombre"
                            ServicePath="~/SEG/SEG_ROL_ELEMENTO.aspx" 
                            ServiceMethod="GetEtiqueta"
                            MinimumPrefixLength="0" 
                            CompletionInterval="0"
                            EnableCaching="true"
                            CompletionSetCount="500"
                            CompletionListCssClass="autocomplete_completionListElement" 
                            CompletionListItemCssClass="autocomplete_listItem" 
                            CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                            OnClientItemSelected="ItemSelected_Etiquetas" ><%----%>
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
                                            <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                                        </Parallel>
                                    </Sequence>
                                </OnShow>
                                <OnHide>
                                    <%-- Collapse down to 0px and fade out --%>
                                    <Parallel Duration=".4">
                                        <FadeOut />
                                        <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                                    </Parallel>
                                </OnHide>
                            </Animations>
                        </AjaxControlToolkit:AutoCompleteExtender> 
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbldic_con_elemento_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_con_elemento_nombre"
                            Width="400px"
                            TabIndex="-1" 
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("dic_con_elemento_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            Width="400px"
                            TabIndex="-1" 
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
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
            
            
            <div style="display:none">
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Tool_dic_rotulo_id" runat="server" Text='<%# Bind("Tool_dic_rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_Id" runat="server" Text='<%# Bind("Dic_Contenedor_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div>
            
        
            <asp:TextBox ID="estado_Nombre" Visible="false" runat="server" Text='<%# Bind("estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_codigo" Visible="false" runat="server" Text='<%# Bind("seg_rol_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_nombre" Visible="false" runat="server" Text='<%# Bind("seg_rol_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_con_elemento_codigo" Visible="false" runat="server" Text='<%# Bind("dic_con_elemento_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_contenedor_codigo" Visible="false" runat="server" Text='<%# Bind("dic_contenedor_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Ver_etiqueta_nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo_int" Visible="false" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" Visible="false" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" Visible="false" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
           
        </InsertItemTemplate>
        
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("CodigoRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Codigo"
                            TabIndex="-1"
                            ReadOnly="true" 
                            runat="server" 
                            Text='<%# Bind("Codigo") %>'
                            ToolTip='<%# GetLocalResourceObject("CodigoRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>                
                <tr>
                    <td>
                        <asp:Label ID="lbldic_contenedor_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_contenedor_nombre"
                            TabIndex="-1"
                            ReadOnly="true" 
                            Width="400px"
                            runat="server" 
                            Text='<%# Bind("dic_contenedor_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_contenedor_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblVer_etiqueta_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Ver_etiqueta_nombre"
                            TabIndex="-1"
                            ReadOnly="true"
                            Width="400px" 
                            runat="server" 
                            Text='<%# Bind("Ver_etiqueta_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Ver_etiqueta_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbldic_con_elemento_nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="dic_con_elemento_nombre"
                            TabIndex="-1"
                            ReadOnly="true"
                            Width="400px" 
                            runat="server" 
                            Text='<%# Bind("dic_con_elemento_nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("dic_con_elemento_nombreRecursoKCG.ToolTip").ToString() %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDic_Rotulo_Nombre" 
                            runat="server" 
                            Text='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.Text").ToString() %>'>
                         </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Rotulo_Nombre"
                            TabIndex="-1"
                            ReadOnly="true"
                            Width="400px" 
                            runat="server" 
                            Text='<%# Bind("Dic_Rotulo_Nombre") %>'
                            ToolTip='<%# GetLocalResourceObject("Dic_Rotulo_NombreRecursoKCG.ToolTip").ToString() %>'>
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
                        <koala:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />
                    </td>
                </tr>
            </table>
            
            <div style="display:none">
                <asp:TextBox ID="Seg_Rol_Id" runat="server" Text='<%# Bind("Seg_Rol_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Con_Elemento_Id" runat="server" Text='<%# Bind("Dic_Con_Elemento_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Rotulo_id" runat="server" Text='<%# Bind("Dic_Rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Tool_dic_rotulo_id" runat="server" Text='<%# Bind("Tool_dic_rotulo_id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Dic_Contenedor_Id" runat="server" Text='<%# Bind("Dic_Contenedor_Id") %>'>
                </asp:TextBox>
                <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>'>
                </asp:TextBox>
            </div>
            
        
            <asp:TextBox ID="estado_Nombre" Visible="false" runat="server" Text='<%# Bind("estado_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_codigo" Visible="false" runat="server" Text='<%# Bind("seg_rol_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="seg_rol_nombre" Visible="false" runat="server" Text='<%# Bind("seg_rol_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_con_elemento_codigo" Visible="false" runat="server" Text='<%# Bind("dic_con_elemento_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Codigo" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Dic_Rotulo_Nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Dic_Rotulo_Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="dic_contenedor_codigo" Visible="false" runat="server" Text='<%# Bind("dic_contenedor_codigo") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Tool_Ver_etiqueta_nombre" Visible="false" runat="server" Text='<%# Bind("Tool_Ver_etiqueta_nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Codigo_int" Visible="false" runat="server" Text='<%# Bind("Codigo_int") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Nombre" Visible="false" runat="server" Text='<%# Bind("Nombre") %>'>
            </asp:TextBox>
            <asp:TextBox ID="Estado" Visible="false" runat="server" Text='<%# Bind("Estado") %>'>
            </asp:TextBox>
        
        </ItemTemplate>
    </asp:FormView>
    
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="gvMstSegRol"
          EventName="SelectedIndexChanged"/>
        <asp:AsyncPostBackTrigger ControlID="navMst"
          EventName="Navegar"/>
        <asp:AsyncPostBackTrigger ControlID="gvDetSegRolElemento"
          EventName="SelectedIndexChanged"/>
    </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvDetSegRolElemento" 
        runat="server" 
        DeleteMethod="Delete"
        ConflictDetection="CompareAllValues"
        InsertMethod="Insert" 
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById"
        TypeName="FEL.SEG.BO_Seg_Rol_Elemento" 
        UpdateMethod="Update"
        SortParameterName="sortExpression">
        
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
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
    
    <asp:UpdatePanel ID="UpdatePanel3" 
        runat="server">
        <ContentTemplate>
    
    <koala:KNavegacion 
        ID="nav"
        runat="server"
        GridViewID="gvDetSegRolElemento" />
    
    
    <koala:KFiltro ID="kftFiltro" 
        runat="server" 
        Contenedor="SEG_ROL_ELEMENTO" 
        Objeto="SEG_ROL_ELEMENTO" 
        IndiceScope ="Scope"
        Orden="1" ObjectDataSourceID="odsGvDetSegRolElemento"/>
    
    <koala:KGrid ID="gvDetSegRolElemento" 
        runat="server" 
        AllowPaging="True"
        AllowSorting="True" 
        DataKeyNames="Id,Seg_Rol_Id"
        AutoGenerateColumns="False"
        DataSourceID="odsGvDetSegRolElemento">
        
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
        <SelectedRowStyle CssClass="selectedrowstyle" />
        
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            
            <asp:BoundField DataField="Codigo" 
                meta:resourcekey="BoundCodigoRecursoKCG"
                SortExpression="Codigo_int">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>   
            <asp:BoundField DataField="Ver_etiqueta_nombre" 
                meta:resourcekey="BoundVer_etiqueta_nombreRecursoKCG"
                SortExpression="Ver_etiqueta_nombre" >
                <ItemStyle Width="150px" />
            </asp:BoundField>   
            <asp:BoundField DataField="dic_contenedor_nombre" 
                meta:resourcekey="Bounddic_contenedor_nombreRecursoKCG"
                SortExpression="dic_contenedor_nombre" >
                <ItemStyle Width="150px" />
            </asp:BoundField>   
            <asp:BoundField DataField="dic_con_elemento_nombre" 
                meta:resourcekey="Bounddic_con_elemento_nombreRecursoKCG"
                SortExpression="dic_con_elemento_nombre" >
                <ItemStyle Width="150px" />
            </asp:BoundField>   
            
            <asp:BoundField DataField="Dic_Rotulo_Nombre" 
                meta:resourcekey="BoundDic_Rotulo_NombreRecursoKCG"
                SortExpression="Dic_Rotulo_Nombre"  >
                <ItemStyle Width="150px" />
            </asp:BoundField>   
            
            
            <asp:BoundField DataField="Seg_Rol_Id" Visible="false" HeaderText="Seg_Rol_Id" SortExpression="Seg_Rol_Id" />
            
            <%--<asp:BoundField DataField="Dic_Con_Elemento_Id" HeaderText="Dic_Con_Elemento_Id"
                SortExpression="Dic_Con_Elemento_Id" />
            <asp:BoundField DataField="estado_Nombre" HeaderText="estado_Nombre" SortExpression="estado_Nombre" />
            <asp:BoundField DataField="seg_rol_codigo" HeaderText="seg_rol_codigo" SortExpression="seg_rol_codigo" />
            <asp:BoundField DataField="seg_rol_nombre" HeaderText="seg_rol_nombre" SortExpression="seg_rol_nombre" />
            <asp:BoundField DataField="dic_con_elemento_codigo" HeaderText="dic_con_elemento_codigo"
                SortExpression="dic_con_elemento_codigo" />
            <asp:BoundField DataField="Dic_Rotulo_id" HeaderText="Dic_Rotulo_id" SortExpression="Dic_Rotulo_id" />
            <asp:BoundField DataField="Dic_Rotulo_Codigo" HeaderText="Dic_Rotulo_Codigo" SortExpression="Dic_Rotulo_Codigo" />
            <asp:BoundField DataField="Tool_dic_rotulo_id" HeaderText="Tool_dic_rotulo_id" SortExpression="Tool_dic_rotulo_id" />
            <asp:BoundField DataField="Tool_Dic_Rotulo_Codigo" HeaderText="Tool_Dic_Rotulo_Codigo"
                SortExpression="Tool_Dic_Rotulo_Codigo" />
            <asp:BoundField DataField="Tool_Dic_Rotulo_Nombre" HeaderText="Tool_Dic_Rotulo_Nombre"
                SortExpression="Tool_Dic_Rotulo_Nombre" />
            <asp:BoundField DataField="Dic_Contenedor_Id" HeaderText="Dic_Contenedor_Id" SortExpression="Dic_Contenedor_Id" />
            <asp:BoundField DataField="dic_contenedor_codigo" HeaderText="dic_contenedor_codigo"
                SortExpression="dic_contenedor_codigo" />
            <asp:BoundField DataField="Tool_Ver_etiqueta_nombre" HeaderText="Tool_Ver_etiqueta_nombre"
                SortExpression="Tool_Ver_etiqueta_nombre" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Codigo_int" HeaderText="Codigo_int" SortExpression="Codigo_int" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />--%>
        </Columns>
    </koala:KGrid>
    
    </ContentTemplate>
   <%-- <Triggers>
        <asp:AsyncPostBackTrigger ControlID="gvMstSegRol"
          EventName="SelectedIndexChanged"/>
        <asp:AsyncPostBackTrigger ControlID="navMst"
          EventName="Navegar"/>
    </Triggers>--%>
    </asp:UpdatePanel>
    
    </asp:Panel>
    
    <asp:ObjectDataSource ID="odsGvDetSegRolElemento" 
        runat="server"  
        SelectMethod="GetByRol"
        TypeName="FEL.SEG.BO_Seg_Rol_Elemento" >
       
        <SelectParameters>
            <asp:SessionParameter Name="s" 
                SessionField="Scope" 
                Type="Object" />
            <asp:ControlParameter ControlID="gvMstSegRol" 
                Name="seg_Rol_Id" 
                PropertyName="SelectedDataKey.Values[Id]"
                Type="String" />
        </SelectParameters>
        
    </asp:ObjectDataSource>
    
</asp:Content>

