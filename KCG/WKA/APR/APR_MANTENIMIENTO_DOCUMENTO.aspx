<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="APR_MANTENIMIENTO_DOCUMENTO.aspx.cs" 
    Inherits="APR_APR_MANTENIMIENTO_DOCUMENTO" 
    meta:resourcekey="Tit_Apr_Mantenimiento_DocumentoRecursoKCG" 
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
        meta:resourcekey="Rec_Apr_Mantenimiento_DocumentoRecursoKCG" >
   <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
      <ContentTemplate>

   <koala:KGrid
     ID="gvAprMantenimientoDocumento" 
     runat="server" 
     AllowPaging="True"
     AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'
     AutoGenerateColumns="False" 
     DataSourceID="odsAprMantenimientoDocumento" AllowSorting="True" DataKeyNames="Id">
     <AlternatingRowStyle CssClass="alternatingrowstyle" />
     <HeaderStyle CssClass="headerstyle" />
     <PagerStyle CssClass="pagerstyle" />
        <Columns>
            <asp:BoundField 
                DataField="Codigo" 
                meta:resourcekey="BoundCodigoRecursoKCG" 
                SortExpression="Codigo_int" />
            <asp:BoundField 
                DataField="Abreviatura" 
                meta:resourcekey="BoundAbreviaturaRecursoKCG" 
                SortExpression="Abreviatura" />
            <asp:BoundField 
                DataField="Nombre" 
                meta:resourcekey="BoundNombreRecursoKCG"
                SortExpression="Nombre" />
            <asp:BoundField 
                DataField="Dic_campo_Nombre" 
                meta:resourcekey="BoundDic_Campo_NombreRecursoKCG"
                SortExpression="Dic_campo_Nombre" />
            <asp:BoundField 
                DataField="Dic_Objeto_nombre" 
                meta:resourcekey="BoundDic_Objeto_NombreRecursoKCG"
                SortExpression="Dic_Objeto_nombre" />
            <asp:BoundField 
                DataField="Dic_Modulo_Nombre" 
                meta:resourcekey="BoundDic_Modulo_NombreRecursoKCG" 
                SortExpression="Dic_Modulo_Nombre" />
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
                DataField="Estado_Nombre" 
                HeaderText="Estado_Nombre" 
                SortExpression="Estado_Nombre" 
                Visible="False" />
            <asp:BoundField 
                DataField="Descripcion" 
                HeaderText="Descripcion" 
                SortExpression="Descripcion" 
                Visible="False" />
            <asp:BoundField 
                DataField="Estado" 
                HeaderText="Estado" 
                SortExpression="Estado" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_campo_Codigo" 
                HeaderText="Dic_campo_Codigo" 
                SortExpression="Dic_campo_Codigo" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Modulo_Id" 
                HeaderText="Dic_Modulo_Id" 
                SortExpression="Dic_Modulo_Id" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Campo_id" 
                HeaderText="Dic_Campo_id" 
                SortExpression="Dic_Campo_id" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Objeto_codigo" 
                HeaderText="Dic_Objeto_codigo" 
                SortExpression="Dic_Objeto_codigo" 
                Visible="False" />
            <asp:BoundField 
                DataField="Dic_Modulo_Codigo" 
                HeaderText="Dic_Modulo_Codigo" 
                SortExpression="Dic_Modulo_Codigo" 
                Visible="False" />
        </Columns>
    </koala:KGrid>
      </ContentTemplate>
       <Triggers>
           <asp:AsyncPostBackTrigger 
               ControlID="gvAprMantenimientoDocumento" 
               EventName="SelectedIndexChanged" />
           </Triggers>
      
    </asp:UpdatePanel>
      <asp:ObjectDataSource 
            ID="odsAprMantenimientoDocumento" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByMantenimiento" 
            TypeName="FEL.APR.BO_Apr_Documento">
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
    <table >
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="APR_MANTENIMIENTO_DOCUMENTO" 
                    Objeto="APR_MANTENIMIENTO_DOCUMENTO" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsAprMantenimientoDocumento"/>
                 <asp:Button 
                    ID="btnAprMantenimientoDocumento" 
                    runat="server" 
                    meta:resourcekey="Btn_Apr_Mantenimiento_DocumentoRecursoKCG" OnClick="btnAprMantenimientoDocumento_Click"  />
             
                </td>
            </tr>
        </table>
    
   
     </asp:Panel>   
  

    
</asp:Content>

