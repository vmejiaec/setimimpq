<%@Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master"
    AutoEventWireup="true" 
    CodeFile="DIC_MANTENIMIENTO_ROTULO.aspx.cs" 
    Inherits="DIC_DIC_MANTENIMIENTO_ROTULO"
    meta:resourcekey="Tit_Dic_Mantenimiento_RotuloResource1" 
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
  
        <asp:ObjectDataSource 
            ID="odsGVMantenimientoRotulo" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByMantenimiento" 
            TypeName="FEL.DIC.BO_Dic_Rotulo">
  <SelectParameters>
     <asp:SessionParameter 
            Name="s" 
            SessionField="Scope" 
            Type="Object" />
      <asp:Parameter Name="ver_version_id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" 
              meta:resourcekey="Rec_Dic_Mantenimiento_RotuloResource1" >
           <koala:KGrid
                    ID="gvDicMantenimientoRotulo" 
                    runat="server" 
                    AllowPaging="True" 
                    AllowSorting="True"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id" 
                    DataSourceID="odsGVMantenimientoRotulo" 
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>'>
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                <HeaderStyle CssClass="headerstyle" />
                <PagerStyle CssClass="pagerstyle" />
                <Columns>
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoResource1" 
                        SortExpression="Codigo_int" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreResource1" 
                        SortExpression="Nombre" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_nombre" 
                        HeaderText="Estado_nombre" 
                        SortExpression="Estado_nombre"
                        Visible="False" />
                </Columns>
            </koala:KGrid>   
            </asp:Panel>
          
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvDicMantenimientoRotulo" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
   <table align="left">
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="DIC_MANTENIMIENTO_ROTULO" 
                    Objeto="DIC_MANTENIMIENTO_ROTULO" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsGVMantenimientoRotulo"/>
                 <asp:Button 
                    ID="Btn_Dic_Mantenimiento_Rotulo" 
                    runat="server" 
                    meta:resourcekey="Btn_Dic_Mantenimiento_RotuloResource1" OnClick="Btn_Dic_Mantenimiento_Rotulo_Click"
                />
             
                </td>
            </tr>
        </table>
    
</asp:Content>

