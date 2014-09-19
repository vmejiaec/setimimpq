<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_PAR_PAGINACION.aspx.cs" 
    Inherits="DIC_DIC_PAR_PAGINACION" 
    meta:resourcekey="Tit_Dic_par_PaginacionRecursoKCG"
    StylesheetTheme="EstiloKCG"
    Theme="EstiloKCG" %>

<%@ Register Assembly="KoalaWebControls" 
    Namespace="Koala.KoalaWebControls" 
    TagPrefix="koala" %>
    
<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <asp:UpdatePanel 
    ID="uplDicParPaginacion" 
    runat="server" 
    UpdateMode="Conditional">
    <ContentTemplate>
    
    <asp:Panel 
        runat="server" 
        ID="pnlDatos" 
        meta:resourcekey="Rec_Dic_Par_PaginacionRecursoKCG">
    <asp:FormView ID="fvDicParPaginacion" 
        runat="server" 
        DataSourceID="odsFvDicParPaginacion" DefaultMode="Insert" 
        DataKeyNames="Dic_Objeto_Nombre,Dic_Objeto_Id,Par_Servidor_Id,Limite_registros,Numero_usuarios,Umbral">
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
                            ID="lblCodigo" 
                            runat="server" 
                            meta:resourceKey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            CssClass="TEXTO_EDICION_KCG"
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblParServidor" 
                            runat="server" 
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                            AssociatedControlID="Par_Servidor_Codigo"
                            meta:resourceKey="Par_Servidor_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox CssClass="TEXTO_EDICION_KCG" 
                            ID="Par_Servidor_Codigo" 
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Codigo") %>'> </asp:TextBox>
            
                        <asp:TextBox CssClass="TEXTO_EDICION_KCG" 
                            ID="Par_Servidor_Nombre" 
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Nombre") %>'> </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Modulo_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Modulo_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Modulo_Codigo"
                            CssClass="TEXTO_EDICION_KCG" 
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'></asp:TextBox>
                        
                        <asp:TextBox ID="Dic_Modulo_Nombre" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Objeto_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Objeto_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Objeto_Codigo" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox>
            
                        <asp:TextBox ID="Dic_Objeto_Nombre" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblLimite_registros" 
                            runat="server" 
                            meta:resourceKey="Limite_registrosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Limite_registros" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Limite_registros") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblNumero_usuarios" 
                            runat="server" 
                            meta:resourceKey="Numero_usuariosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Numero_usuarios" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Numero_usuarios") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblUmbral" 
                            runat="server" 
                            meta:resourceKey="UmbralRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Umbral" 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server" 
                            Text='<%# Bind("Umbral") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td colspan="2">
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
                         
                         <asp:Button ID="bntGenerar" 
                            runat="server" 
                            Text="Generar"
                            CausesValidation="True" OnClick="bntGenerar_Click">
                         </asp:Button>
                         
                    </td>
                </tr>
            </table>
            
            <%--IDs--%>
        
            <asp:TextBox ID="Par_Servidor_Id" 
                runat="server" 
                Text='<%# Bind("Par_Servidor_Id") %>' 
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Objeto_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'
                Style="visibility:hidden"> </asp:TextBox>
                
            <asp:TextBox ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Modulo_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Modulo_Id") %>'
                Style="visibility:hidden"></asp:TextBox>
            
            <%--No visibles--%>        
            
            <asp:TextBox ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>' 
                Visible="False"></asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'
                Visible="False"></asp:TextBox>

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
                            ID="lblCodigo" 
                            runat="server" 
                            meta:resourceKey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblParServidor" 
                            runat="server" 
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                            AssociatedControlID="Par_Servidor_Codigo"
                            meta:resourceKey="CodigoRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Par_Servidor_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Codigo") %>'> </asp:TextBox>
            
                        <asp:TextBox ID="Par_Servidor_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Nombre") %>'> </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Modulo_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Modulo_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Modulo_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'></asp:TextBox>
                        
                        <asp:TextBox ID="Dic_Modulo_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Objeto_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Objeto_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Objeto_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox>
            
                        <asp:TextBox ID="Dic_Objeto_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblLimite_registros" 
                            runat="server" 
                            meta:resourceKey="Limite_registrosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Limite_registros" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Limite_registros") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblNumero_usuarios" 
                            runat="server" 
                            meta:resourceKey="Numero_usuariosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Numero_usuarios" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Numero_usuarios") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblUmbral" 
                            runat="server" 
                            meta:resourceKey="UmbralRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Umbral" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Umbral") %>'></asp:TextBox>
                    </td>
                </tr>
            </table>
            
            <%--IDs--%>
        
            <asp:TextBox ID="Par_Servidor_Id" 
                runat="server" 
                Text='<%# Bind("Par_Servidor_Id") %>' 
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Objeto_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'
                Style="visibility:hidden"> </asp:TextBox>
                
            <asp:TextBox ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Modulo_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Modulo_Id") %>'
                Style="visibility:hidden"></asp:TextBox>
            
            <%--No visibles--%>        
            
            <asp:TextBox ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>' 
                Visible="False"></asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'
                Visible="False"></asp:TextBox>
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
                            ID="lblCodigo" 
                            runat="server" 
                            meta:resourceKey="CodigoRecursoKCG">
                        </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="Codigo" 
                            runat="server" 
                            ReadOnly="true" 
                            Text='<%# Bind("Codigo") %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblParServidor" 
                            runat="server" 
                            AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_InicioRecursoKCG.AccesKey").ToString() %>'
                            AssociatedControlID="Par_Servidor_Codigo"
                            meta:resourceKey="Par_Servidor_CodigoRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Par_Servidor_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Codigo") %>'> </asp:TextBox>
            
                        <asp:TextBox ID="Par_Servidor_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Par_Servidor_Nombre") %>'> </asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Modulo_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Modulo_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Modulo_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'></asp:TextBox>
                        
                        <asp:TextBox ID="Dic_Modulo_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblDic_Objeto_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Objeto_NombreRecursoKCG"> </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Dic_Objeto_Codigo" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox>
            
                        <asp:TextBox ID="Dic_Objeto_Nombre" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblLimite_registros" 
                            runat="server" 
                            meta:resourceKey="Limite_registrosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Limite_registros" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Limite_registros") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblNumero_usuarios" 
                            runat="server" 
                            meta:resourceKey="Numero_usuariosRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Numero_usuarios" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Numero_usuarios") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label 
                            ID="lblUmbral" 
                            runat="server" 
                            meta:resourceKey="UmbralRecursoKCG"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Umbral" 
                            ReadOnly="true"
                            runat="server" 
                            Text='<%# Bind("Umbral") %>'></asp:TextBox>
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
                        <%--<uc2:wucMensajeEliminar ID="WucMensajeEliminar1" runat="server" />--%>
                    </td>
            </tr>
            </table>
            
            <%--IDs--%>
        
            <asp:TextBox ID="Par_Servidor_Id" 
                runat="server" 
                Text='<%# Bind("Par_Servidor_Id") %>' 
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Objeto_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'
                Style="visibility:hidden"> </asp:TextBox>
                
            <asp:TextBox ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'
                Style="visibility:hidden"></asp:TextBox>
                
            <asp:TextBox ID="Dic_Modulo_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Modulo_Id") %>'
                Style="visibility:hidden"></asp:TextBox>
            
            <%--No visibles--%>        
            
            <asp:TextBox ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>' 
                Visible="False"></asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'
                Visible="False"></asp:TextBox>
                
            <br />
            
            <%--Botones--%>
            
            <%--<asp:Button ID="EditButton" 
                runat="server" 
                CausesValidation="False" CommandName="Edit"
                Text="Edit"></asp:Button>--%>
                
        </ItemTemplate>
    </asp:FormView>
    </asp:Panel>
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="KGrid1" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsFvDicParPaginacion" runat="server" OldValuesParameterFormatString="original{0}"
        SelectMethod="GetById" TypeName="FEL.DIC.BO_Dic_Par_Paginacion" UpdateMethod="Update" ConflictDetection="CompareAllValues" SortParameterName="sortExpression">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />


    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server">
        <ContentTemplate>
            <asp:Button 
                ID="Atras" 
                runat="server"
                Text="Atras" 
                Visible="False" AccessKey="B" />
            <asp:Button 
                ID="Seleccionar" 
                runat="server"
                Text="Seleccionar"  
                Visible="False" AccessKey="S" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:UpdatePanel 
        ID="UpdatePanel2" 
        runat="server">
        <ContentTemplate>
            <koala:KFiltro ID="kftFiltro" 
                runat="server" 
                Contenedor="DIC_PAR_PAGINACION" 
                Objeto="DIC_PAR_PAGINACION" 
                IndiceScope="Scope"
                Orden="1" ObjectDataSourceID="odsGvDicParPaginacion"/>
        
           <asp:Panel
                runat="server" 
                ID="pnlGridView" 
                meta:resourcekey="Rec_ListadoDic_Par_PaginacionRecursoKCG">

            <koala:KGrid ID="KGrid1" 
                runat="server"
                DataKeyNames="Id" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False"
                DataSourceID="odsGvDicParPaginacion">
                
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                        
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
                    <asp:BoundField DataField="Codigo" meta:resourcekey="BoundCodigoRecursoKCG" SortExpression="Codigo_int" />
                    <asp:BoundField DataField="Par_Servidor_Nombre" meta:resourcekey="BoundPar_Servidor_NombreRecursoKCG"
                        SortExpression="Par_Servidor_Nombre" />
                    <asp:BoundField DataField="Dic_Objeto_Nombre" meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" SortExpression="Dic_Objeto_Nombre" />
                    <asp:BoundField DataField="Limite_registros" meta:resourcekey="BoundLimite_registrosRecursoKCG" SortExpression="Limite_registros" />
                    <asp:BoundField DataField="Numero_usuarios" meta:resourcekey="BoundNumero_usuariosRecursoKCG" SortExpression="Numero_usuarios" />
                    <asp:BoundField DataField="Umbral" meta:resourcekey="BoundUmbralRecursoKCG" SortExpression="Umbral" />    
                    <asp:BoundField DataField="Dic_Modulo_Nombre" 
                        meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG"
                        SortExpression="Dic_Modulo_Nombre"/>
                     
                     <%--No visibles--%>      
                    <asp:BoundField DataField="Dic_Modulo_Codigo" 
                        Visible="False" 
                        HeaderText="Dic_Modulo_Codigo" 
                        SortExpression="Dic_Modulo_Codigo"/>
                    <asp:BoundField DataField="Par_Servidor_Codigo" Visible="False" HeaderText="Par_Servidor_Codigo"
                        SortExpression="Par_Servidor_Codigo" />
                    <asp:BoundField DataField="Par_Servidor_Id" Visible="False" HeaderText="Par_Servidor_Id" SortExpression="Par_Servidor_Id" />
                    <asp:BoundField DataField="Dic_Objeto_Id" Visible="False" HeaderText="Dic_Objeto_Id" SortExpression="Dic_Objeto_Id" />
                    <asp:BoundField DataField="Nombre" Visible="False" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Id" Visible="False" HeaderText="Id" SortExpression="Id" />
                    <asp:BoundField DataField="Estado_Nombre" Visible="False" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" />
                    <asp:BoundField DataField="Estado" Visible="False" HeaderText="Estado" SortExpression="Estado" />
                    <asp:BoundField DataField="Dic_Modulo_Id" Visible="False" HeaderText="Dic_Modulo_Id" SortExpression="Dic_Modulo_Id" />
                    <asp:BoundField DataField="Dic_Objeto_Codigo" Visible="False" HeaderText="Dic_Objeto_Codigo" SortExpression="Dic_Objeto_Codigo" />
                </Columns>
            </koala:KGrid>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:ObjectDataSource ID="odsGvDicParPaginacion" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" 
        TypeName="FEL.DIC.BO_Dic_Par_Paginacion">
        
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
        
    </asp:ObjectDataSource>
    

    
</asp:Content>

