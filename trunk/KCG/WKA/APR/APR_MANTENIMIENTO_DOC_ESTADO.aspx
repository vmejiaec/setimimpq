<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APR_MANTENIMIENTO_DOC_ESTADO.aspx.cs" 
    Inherits="APR_APR_MANTENIMIENTO_DOC_ESTADO" 
    meta:resourcekey="Tit_Apr_Mantenimiento_Doc_EstadoRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG"  
%>
<%@ Register tagprefix="koala" 
    assembly="KoalaWebControls" 
    namespace="Koala.KoalaWebControls" %>
<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    <asp:Panel 
        ID="Panel1" 
        runat="server"
        meta:resourcekey="Rec_Apr_Mantenimiento_Doc_EstadoRecursoKCG" 
       >
    <koala:KGrid
        ID="gvAprMantenimientoEstado" 
        runat="server" 
        AllowPaging="True" 
        AutoGenerateColumns="False"
        DataSourceID="odsAprMantenimientoEstado" 
        AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
        AllowSorting="True">
        <AlternatingRowStyle CssClass="alternatingrowstyle" />
        <HeaderStyle CssClass="headerstyle" />
        <PagerStyle CssClass="pagerstyle" />
            <Columns>
                <asp:BoundField 
                    DataField="Codigo" 
                    meta:resourcekey="BoundCodigoRecursoKCG" 
                    SortExpression="Codigo_int" />
                <asp:BoundField 
                    DataField="Apr_Estado_Dominio" 
                    meta:resourcekey="BoundApr_Estado_DominioRecursoKCG"  
                    SortExpression="Apr_Estado_Dominio" />
                <asp:BoundField 
                        DataField="Apr_Estado_Nombre" 
                         meta:resourcekey="BoundApr_estado_NombreRecursoKCG" 
                        SortExpression="Apr_Estado_Nombre" />
                <asp:BoundField 
                    DataField="Nombre" 
                    meta:resourcekey="BoundApr_estado_NombreRecursoKCG"  
                    SortExpression="Nombre" Visible="False" />
                <asp:BoundField 
                    DataField="Apr_Documento_nombre" 
                    meta:resourcekey="BoundApr_documento_NombreRecursoKCG" 
                    SortExpression="Apr_Documento_nombre" />
                <asp:BoundField 
                    DataField="Dic_Campo_Nombre" 
                    meta:resourcekey="BoundDic_Campo_NombreRecursoKCG" 
                    SortExpression="Dic_Campo_Nombre" />
                <asp:BoundField 
                    DataField="Dic_Objeto_Nombre" 
                    meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG" 
                    SortExpression="Dic_Objeto_Nombre" />
                <asp:BoundField 
                        DataField="Descripcion" 
                        HeaderText="Descripcion" 
                        SortExpression="Descripcion" >
                    <itemstyle width="80mm" />
                </asp:BoundField>
                <asp:BoundField 
                        DataField="Apr_Documento_Id" 
                        HeaderText="Apr_Documento_Id" 
                        SortExpression="Apr_Documento_Id"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Campo_Codigo" 
                        HeaderText="Dic_Campo_Codigo" 
                        SortExpression="Dic_Campo_Codigo"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Campo_Constraint" 
                        HeaderText="Dic_Campo_Constraint"
                        SortExpression="Dic_Campo_Constraint" 
                        Visible="False" />
                <asp:BoundField 
                        DataField="Apr_Estado_Codigo" 
                        HeaderText="Apr_Estado_Codigo" 
                        SortExpression="Apr_Estado_Codigo"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Apr_Documento_codigo" 
                        HeaderText="Apr_Documento_codigo"
                        SortExpression="Apr_Documento_codigo" 
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Objeto_Id" 
                        HeaderText="Dic_Objeto_Id" 
                        SortExpression="Dic_Objeto_Id"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                <asp:BoundField 
                        DataField="Apr_Estado_Id" 
                        HeaderText="Apr_Estado_Id" 
                        SortExpression="Apr_Estado_Id"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Objeto_Codigo" 
                        HeaderText="Dic_Objeto_Codigo" 
                        SortExpression="Dic_Objeto_Codigo"
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Campo_Tipo_Dato" 
                        HeaderText="Dic_Campo_Tipo_Dato"
                        SortExpression="Dic_Campo_Tipo_Dato" 
                        Visible="False" />
                <asp:BoundField 
                        DataField="Dic_Campo_Id" 
                        HeaderText="Dic_Campo_Id" 
                        SortExpression="Dic_Campo_Id"
                        Visible="False" />
            </Columns>
        </koala:KGrid>
        <asp:ObjectDataSource 
                ID="odsAprMantenimientoEstado" 
                runat="server" 
                OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetByMantenimiento" 
                TypeName="FEL.APR.BO_Apr_Doc_Estado">
            <SelectParameters>
                <asp:SessionParameter 
                    Name="s" 
                    SessionField="Scope" 
                    Type="Object" />
                <asp:Parameter 
                    Name="ver_version_id" 
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <table align="left">
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="APR_MANTENIMIENTO_DOC_ESTADO" 
                    Objeto="APR_MANTENIMIENTO_DOC_ESTADO" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsAprMantenimientoEstado"/>
                <asp:Button 
                    ID="Btn_Apr_Mantenimiento_Doc_EstadoRecursoKCG" 
                    runat="server" 
                    meta:resourcekey="Btn_Apr_Mantenimiento_Doc_EstadoRecursoKCG" OnClick="Btn_Apr_Mantenimiento_Doc_EstadoRecursoKCG_Click"  
                     />
             
                </td>
            </tr>
        </table>
       
        </asp:Panel>
</asp:Content>

