<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="AUD_MANTENIMIENTO_PAR_AUDITORIA.aspx.cs" 
    Inherits="DIC_Aud_Mantenimiento_Par_Auditoria" 
    meta:resourcekey="Tit_Aud_Mantenimiento_Par_AuditoriaResource1" 
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
            ID="odsAud_Mantenimiento_Par_Auditoria" 
            runat="server" 
            OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetByMantenimiento" 
            TypeName="FEL.DIC.BO_Dic_Objeto">
        <SelectParameters>
            <asp:SessionParameter 
                Name="s" 
                SessionField="Scope" 
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:UpdatePanel 
        ID="UpdatePanel1" 
        runat="server" 
        UpdateMode="Conditional">
            <ContentTemplate>
            <asp:Panel 
            ID="Panel1" 
            runat="server"
            meta:resourcekey="Rec_Aud_Mantenimiento_Par_AuditoriaResource1" >
                <koala:KGrid 
                    ID="gvAud_Mantenimiento_Par_Auditoria" 
                    runat="server" 
                    AllowPaging="True"
                    AllowSorting="True" 
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id"
                    AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' 
                    DataSourceID="odsAud_Mantenimiento_Par_Auditoria" PageSize="15">
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
                        DataField="Numero" 
                        meta:resourcekey="BoundNumeroResource1" 
                        SortExpression="Numero" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Nombre" 
                        meta:resourcekey="BoundDic_Modulo_NombreResource1" 
                        SortExpression="Dic_Modulo_Nombre" />
                    <asp:BoundField 
                        DataField="Dic_Modulo_Id" 
                        HeaderText="Dic_Modulo_Id" 
                        SortExpression="Dic_Modulo_Id"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
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
                        DataField="Dic_Modulo_Codigo" 
                        HeaderText="Dic_Modulo_Codigo" 
                        SortExpression="Dic_Modulo_Codigo"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Maximo" 
                        HeaderText="Maximo" 
                        SortExpression="Maximo" 
                        Visible="False" />
                </Columns>
            </koala:KGrid >
                </asp:Panel>
            
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
            ControlID="gvAud_Mantenimiento_Par_Auditoria"
            EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
       <table align="left">
            <tr align="left">
                <td>
                <koala:KFiltro ID="kftFiltro" 
                    runat="server" 
                    Contenedor="AUD_MANTENIMIENTO_PAR_AUDITORIA" 
                    Objeto="AUD_MANTENIMIENTO_PAR_AUDITORIA" 
                    IndiceScope ="Scope"
                    Orden="1" ObjectDataSourceID="odsAud_Mantenimiento_Par_Auditoria"/>
              <asp:Button 
                ID="Btn_Aud_Mantenimiento_Par_Auditoria" 
                runat="server" 
                meta:resourcekey="Btn_Aud_Mantenimiento_Par_AuditoriaResource1" OnClick="Btn_Aud_Mantenimiento_Par_Auditoria_Click" 
                />
             
                </td>
            </tr>
        </table>
    
</asp:Content>

