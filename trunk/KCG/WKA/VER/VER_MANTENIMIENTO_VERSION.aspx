<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="VER_MANTENIMIENTO_VERSION.aspx.cs" 
    Inherits="VER_VER_MANTENIMIENTO_VERSION" 
    meta:resourcekey="Tit_Ver_Mantenimiento_VersionRecursoKCG" 
    Theme="EstiloKCG"
    StylesheetTheme="EstiloKCG" %>
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
            meta:resourcekey="Rec_Ver_Mantenimiento_VersionRecursoKCG">
          <asp:ObjectDataSource 
              ID="odsGVVerMantenimientoVersion" 
              runat="server" 
              OldValuesParameterFormatString="original_{0}"
              SelectMethod="GetByMantenimiento" 
              TypeName="FEL.VER.BO_Ver_Version">
              <SelectParameters>
                  <asp:SessionParameter 
                      Name="s" 
                      SessionField="Scope" 
                      Type="Object" />
              </SelectParameters>
          </asp:ObjectDataSource>
        </asp:Panel>
    <asp:UpdatePanel 
    ID="UpdatePanel1" 
    runat="server" 
    UpdateMode="Conditional">
        <ContentTemplate>
         <koala:KGrid 
                 ID="gvMantenimientoVersion" 
                 runat="server" 
                 AllowPaging="True" 
                 AutoGenerateColumns="False" 
                 AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                 DataSourceID="odsGVVerMantenimientoVersion" AllowSorting="True" DataKeyNames="Id" PageSize="15">
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
             <Columns>
                 <asp:BoundField 
                     DataField="Codigo" 
                     meta:resourcekey="BoundCodigoRecursoKCG"
                     SortExpression="Codigo_int" />
                 <asp:BoundField 
                     DataField="Nombre" 
                     meta:resourcekey="BoundNombreRecursoKCG" 
                     SortExpression="Nombre" />
                 <asp:BoundField 
                     DataField="Abreviatura" 
                     meta:resourcekey="BoundAbreviaturaRecursoKCG"
                     SortExpression="Abreviatura" />
                 <asp:BoundField 
                     DataField="Descripcion" 
                     meta:resourcekey="BoundDescripcionRecursoKCG"
                     SortExpression="Descripcion" />
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
                         DataField="Predeterminada" 
                         HeaderText="Predeterminada" 
                         SortExpression="Predeterminada"
                         Visible="False" />
                     <asp:BoundField 
                         DataField="Ruta_Imagen" 
                         HeaderText="Ruta_Imagen" 
                         SortExpression="Ruta_Imagen"
                         Visible="False" />
                     <asp:BoundField 
                         DataField="Predeterminada_Nombre" 
                         HeaderText="Predeterminada_Nombre"
                         SortExpression="Predeterminada_Nombre" 
                         Visible="False" />
                     <asp:BoundField 
                         DataField="Estado_Nombre" 
                         HeaderText="Estado_Nombre" 
                         SortExpression="Estado_Nombre"
                         Visible="False" />
             </Columns>        
     </koala:KGrid >        
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvMantenimientoVersion" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <table align="left">
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="VER_MANTENIMIENTO_VERSION" 
                    Objeto="VER_MANTENIMIENTO_VERSION" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsGVVerMantenimientoVersion"/>
                 <asp:Button 
                    ID="BtnParMantenimientoMensaje" 
                    runat="server" 
                    meta:resourcekey="Btn_Ver_Mantenimiento_VersionRecursoKCG" 
                    OnClick="BtnParMantenimientoMensaje_Click" 
                    />
             
                </td>
            </tr>
        </table>
   
   

</asp:Content>

