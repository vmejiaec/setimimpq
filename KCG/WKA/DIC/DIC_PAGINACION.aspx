<%@ Page Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_PAGINACION.aspx.cs" 
    Inherits="DIC_DIC_PAGINACION" 
    meta:resourcekey="Tit_Dic_PaginacionRecursoKCG"%>

<%@ Register Assembly="KoalaWebControls" 
    Namespace="Koala.KoalaWebControls" 
    TagPrefix="koala" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
     <asp:UpdatePanel 
    ID="uplDicPaginacion" 
    runat="server" 
    UpdateMode="Conditional">
    <ContentTemplate>
    
    
    <asp:Panel 
        runat="server" 
        ID="pnlDatos" 
        meta:resourcekey="Rec_Dic_PaginacionRecursoKCG">
    
    <asp:FormView ID="FvDicPaginacion" runat="server" DataSourceID="odsFvDicPaginacion" DefaultMode="Insert">
        <EditItemTemplate>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr align="left">
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
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            meta:resourceKey="CodigoRecursoKCG"></asp:Label>
                    </td>
                        
                    <td>
                        <asp:TextBox ID="Codigo" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Codigo") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPar_Servidor_Nombre" 
                            runat="server" 
                            meta:resourceKey="Par_Servidor_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Par_Servidor_Codigo" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Par_Servidor_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Par_Servidor_Nombre" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Par_Servidor_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblDic_Modulo_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Modulo_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Dic_Modulo_Codigo" 
                            ReadOnly="True"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Dic_Modulo_Nombre" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblDic_Objeto_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Objeto_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Dic_Objeto_Codigo" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Dic_Objeto_Nombre" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                   
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblSecuencia" 
                            runat="server" 
                            meta:resourceKey="SecuenciaRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Secuencia" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Secuencia") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblId_Inicial" 
                            runat="server" 
                            meta:resourceKey="Id_InicialRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Id_Inicial" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Id_Inicial") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblId_Final" 
                            runat="server" 
                            meta:resourceKey="Id_FinalRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Id_Final" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Id_Final") %>'></asp:TextBox>
                    </td>
                </tr>
            </table>
            
           <%--IDs--%>
           
            <asp:TextBox ID="Par_Servidor_Id" 
                runat="server" 
                Text='<%# Bind("Par_Servidor_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Dic_Objeto_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Dic_Modulo_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Modulo_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            
            
            <%--Campos no visibles--%>
            
            <asp:TextBox ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'
                Visible="False">
            </asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'
                Visible="False">
            </asp:TextBox><br />
                      

        </InsertItemTemplate>
        <ItemTemplate>
            <table>
                <tr align="left">
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
                        <asp:Label ID="lblCodigo" 
                            runat="server" 
                            meta:resourceKey="CodigoRecursoKCG"></asp:Label>
                    </td>
                        
                    <td>
                        <asp:TextBox ID="Codigo" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Codigo") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblPar_Servidor_Nombre" 
                            runat="server" 
                            meta:resourceKey="Par_Servidor_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Par_Servidor_Codigo" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Par_Servidor_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Par_Servidor_Nombre" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Par_Servidor_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblDic_Modulo_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Modulo_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Dic_Modulo_Codigo" 
                            ReadOnly="True"
                            runat="server" 
                            Text='<%# Bind("Dic_Modulo_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Dic_Modulo_Nombre" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Dic_Modulo_Nombre") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblDic_Objeto_Nombre" 
                            runat="server" 
                            meta:resourceKey="Dic_Objeto_NombreRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Dic_Objeto_Codigo" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Dic_Objeto_Codigo") %>'></asp:TextBox>
                        <asp:TextBox ID="Dic_Objeto_Nombre" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Dic_Objeto_Nombre") %>'></asp:TextBox>
                   
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblSecuencia" 
                            runat="server" 
                            meta:resourceKey="SecuenciaRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Secuencia" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Secuencia") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblId_Inicial" 
                            runat="server" 
                            meta:resourceKey="Id_InicialRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Id_Inicial" 
                            runat="server"
                            ReadOnly="True" 
                            Text='<%# Bind("Id_Inicial") %>'></asp:TextBox>
                    </td>
                </tr>
                
                <tr align="left">
                    <td>
                        <asp:Label ID="lblId_Final" 
                            runat="server" 
                            meta:resourceKey="Id_FinalRecursoKCG"></asp:Label>
                    </td>
                    
                    <td>
                        <asp:TextBox ID="Id_Final" 
                            runat="server"
                            ReadOnly="True"  
                            Text='<%# Bind("Id_Final") %>'></asp:TextBox>
                    </td>
                </tr>
            </table>
            
           <%--IDs--%>
           
            <asp:TextBox ID="Par_Servidor_Id" 
                runat="server" 
                Text='<%# Bind("Par_Servidor_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Dic_Objeto_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Objeto_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Id" 
                runat="server" 
                Text='<%# Bind("Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            <asp:TextBox ID="Dic_Modulo_Id" 
                runat="server" 
                Text='<%# Bind("Dic_Modulo_Id") %>'
                Style="visibility:hidden">
            </asp:TextBox>
            
            
            <%--Campos no visibles--%>
            
            <asp:TextBox ID="Nombre" 
                runat="server" 
                Text='<%# Bind("Nombre") %>'
                Visible="False">
            </asp:TextBox>
            
            <asp:TextBox ID="Estado" 
                runat="server" 
                Text='<%# Bind("Estado") %>'
                Visible="False">
            </asp:TextBox><br />
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
    
    <asp:ObjectDataSource ID="odsFvDicPaginacion" 
        runat="server" 
        ConflictDetection="CompareAllValues"
        OldValuesParameterFormatString="original{0}" 
        SelectMethod="GetById" 
        SortParameterName="sortExpression"
        TypeName="FEL.DIC.BO_Dic_Paginacion">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
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
                Contenedor="DIC_PAGINACION" 
                Objeto="DIC_PAGINACION" 
                IndiceScope="Scope"
                Orden="1" ObjectDataSourceID="odsGvDicPaginacion"/>
    
    <asp:Panel
        runat="server" 
        ID="pnlGridView" 
        meta:resourcekey="Rec_Listado_Dic_PaginacionRecursoKCG">
    <koala:KGrid ID="KGrid1" 
        runat="server" 
        AllowPaging="True"
        AllowSorting="True"
        AutoGenerateColumns="False"
        DataKeyNames="Id" 
        DataSourceID="odsGvDicPaginacion">
        
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
        
        <Columns>
            <asp:CommandField ButtonType="Button" SelectText="..." ShowSelectButton="True" />
            <asp:BoundField DataField="Codigo" meta:resourcekey="BoundCodigoRecursoKCG" SortExpression="Codigo_int" />
            <asp:BoundField DataField="Par_Servidor_Nombre" meta:resourcekey="BoundPar_Servidor_NombreRecursoKCG"
                SortExpression="Par_Servidor_Nombre" />
            <asp:BoundField DataField="Dic_Objeto_Nombre" meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" SortExpression="Dic_Objeto_Nombre" />
            <asp:BoundField DataField="Secuencia" meta:resourcekey="BoundSecuenciaRecursoKCG" SortExpression="Secuencia" />
            <asp:BoundField DataField="Id_Inicial" meta:resourcekey="BoundId_InicialRecursoKCG" SortExpression="Id_Inicial" />
            <asp:BoundField DataField="Id_Final" meta:resourcekey="BoundId_FinalRecursoKCG" SortExpression="Id_Final" />
            
            <asp:BoundField DataField="Dic_Modulo_Codigo" HeaderText="Dic_Modulo_Codigo" SortExpression="Dic_Modulo_Codigo" Visible="False" />
            <asp:BoundField DataField="Par_Servidor_Codigo" HeaderText="Par_Servidor_Codigo"
                SortExpression="Par_Servidor_Codigo" Visible="False" />
            <asp:BoundField DataField="Dic_Objeto_Codigo" HeaderText="Dic_Objeto_Codigo" SortExpression="Dic_Objeto_Codigo" Visible="False" />
            <asp:BoundField DataField="Par_Servidor_Id" HeaderText="Par_Servidor_Id" SortExpression="Par_Servidor_Id" Visible="False" />
            <asp:BoundField DataField="Dic_Objeto_Id" HeaderText="Dic_Objeto_Id" SortExpression="Dic_Objeto_Id" Visible="False" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" Visible="False" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Estado_Nombre" HeaderText="Estado_Nombre" SortExpression="Estado_Nombre" Visible="False" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" Visible="False" />
            <asp:BoundField DataField="Dic_Modulo_Nombre" HeaderText="Dic_Modulo_Nombre" SortExpression="Dic_Modulo_Nombre" Visible="False" />
            <asp:BoundField DataField="Dic_Modulo_Id" HeaderText="Dic_Modulo_Id" SortExpression="Dic_Modulo_Id" Visible="False" />
        </Columns>
    </koala:KGrid>
    </asp:Panel>
    </ContentTemplate>
    </asp:UpdatePanel>
    <asp:ObjectDataSource ID="odsGvDicPaginacion" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="Get" TypeName="FEL.DIC.BO_Dic_Paginacion">
        <SelectParameters>
            <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    
    
    
</asp:Content>

