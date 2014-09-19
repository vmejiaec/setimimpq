<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="DIC_METADATOS.aspx.cs" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"
    Inherits="DIC_DIC_METADATOS" 
    meta:resourcekey="Tit_Dic_MetadatosRecursoKCG" %>    

<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:PlaceHolder 
        ID="plh" 
        runat="server">
        <asp:Panel
            runat="server"
            Id="Pnl_Dic_Metadatos_XSD"
            GroupingText="Seleccionar el XSD">
            Escoja el Archivo
            <asp:FileUpload 
                ID="fulFicheroXsd"  
                runat="server">
            </asp:FileUpload> 
            <br />
            <asp:Button 
                ID="btnFicheroXsd" 
                runat="server" 
                Text="Cargar"/> 
            <br />
        </asp:Panel>        
    </asp:PlaceHolder>
    <asp:Panel
        runat="server"
        Id="Pnl_Dic_Metadatos_Inf_Objeto"
        GroupingText="Seleccione el Objeto">
        Nombre Objeto: 
        <asp:DropDownList 
            ID="ddlDicObjeto" 
            runat="server"
            CssClass="TEXTO_EDICION_KCG" 
            AutoPostBack="true">
        </asp:DropDownList>
        <br />
        Modulo:
        <asp:DropDownList 
            ID="ddlModulo" 
            runat="server" 
            DataSourceID="odsModulo" 
            DataTextField="Nombre"
            CssClass="TEXTO_EDICION_KCG" 
            DataValueField="Id">
        </asp:DropDownList>
        <br />
        <asp:ObjectDataSource 
            ID="odsModulo" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="Get" 
            TypeName="FEL.DIC.BO_Dic_Modulo">
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
            </SelectParameters>
        </asp:ObjectDataSource>
        Número:
        <asp:TextBox 
            ID="txbNumero" 
            runat="server">
        </asp:TextBox>
        <br />
        <asp:Button 
            ID="btnInsertGrid" 
            runat="server" 
            Text="Insertar"/>
        <asp:Button 
            ID="Button1" 
            runat="server" 
            Text="Prueba"/>
    </asp:Panel>
    <asp:Panel
        runat="server"
        Id="Pnl_Dic_Metadatos_Campos"
        GroupingText="Listado de Campos a Insertar">
        <asp:GridView 
            ID="grvCamposNuevos" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataKeyNames="Id">
            <AlternatingRowStyle CssClass="alternatingrowstyle" />
            <HeaderStyle CssClass="headerstyle" />
            <PagerStyle CssClass="pagerstyle" />
            <Columns>
                <asp:TemplateField 
                    HeaderText="Nombre" 
                    SortExpression="Nombre">
                    <ItemTemplate>
                        <asp:Label 
                            ID="Nombre" 
                            runat="server" 
                            Text='<%# Bind("Nombre") %>'>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField 
                    HeaderText="Tipo Dato" 
                    SortExpression="Tipo_Dato">
                    <ItemTemplate>                    
                        <asp:DropDownList 
                            ID="Tipo_Dato" 
                            runat="server"
                            CssClass="TEXTO_EDICION_KCG" 
                            DataSourceID="odsTipoDato" 
                            DataTextField="Nombre"
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
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField 
                    HeaderText="Tipo Constraint" 
                    SortExpression="Tipo_Constraint">
                    <ItemTemplate>
                        <asp:DropDownList  
                            ID="Tipo_Constraint" 
                            SelectedValue='<%# Bind("Tipo_Constraint") %>' 
                            CssClass="TEXTO_EDICION_KCG"
                            runat="server"
                            AppendDataBoundItems="true" 
                            DataSourceID="odsTipoConstraint"
                            DataTextField="Nombre" 
                            DataValueField="Dic_Dominio_Dominio">
                            <asp:ListItem Value="">
                                Seleccione...
                            </asp:ListItem>
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
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField 
                    HeaderText="Filtro" 
                    SortExpression="Filtro">
                    <ItemTemplate>
                        <asp:DropDownList 
                            ID="Filtro" 
                            runat="server" 
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
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>    
    </asp:Panel>    
</asp:Content>