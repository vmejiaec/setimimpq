<%@ Page 
    Language="C#" 
    MasterPageFile="~/KOALA.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_MANTENIMIENTO_MENSAJE.aspx.cs" 
    Inherits="PAR_PAR_MANTENIMIENTO_MENSAJE" 
    Title="Untitled Page" 
    Theme="EstiloKCG"
    meta:resourcekey="Tit_Par_Mantenimiento_MensajeRecursoKCG"
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
        ID="odsParMantenimientoMensaje" 
        runat="server" 
        OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetByMantenimiento" 
        TypeName="FEL.PAR.BO_Par_Mensaje">
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
            meta:resourcekey="Rec_Par_Mantenimiento_MensajeRecursoKCG" >
        
            <koala:KGrid 
                ID="gvParMantenimientoMensaje" 
                runat="server" 
                AllowPaging="True" 
                AllowSorting="True"
                AutoGenerateColumns="False" 
                DataSourceID="odsParMantenimientoMensaje" 
                 AccessKey='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Tec_GridRecursoKCG.AccesKey").ToString() %>' OnSelectedIndexChanged="gvParMantenimientoMensaje_SelectedIndexChanged">
                <AlternatingRowStyle CssClass="alternatingrowstyle" />
                            <HeaderStyle CssClass="headerstyle" />
                            <PagerStyle CssClass="pagerstyle" />
                <Columns>
                    <asp:BoundField 
                        DataField="Codigo" 
                        meta:resourcekey="BoundCodigoRecursoKCG"
                        SortExpression="Codigo_int" />
                    <asp:BoundField 
                        DataField="Tipo" 
                        meta:resourcekey="BoundTipoRecursoKCG"
                        SortExpression="Tipo" />
                    <asp:BoundField 
                        DataField="Nombre" 
                        meta:resourcekey="BoundNombreRecursoKCG"
                        SortExpression="Nombre" />
                    <asp:BoundField 
                        DataField="Id" 
                        HeaderText="Id" 
                        SortExpression="Id" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Tipo_Nombre" 
                        HeaderText="Tipo_Nombre" 
                        SortExpression="Tipo_Nombre"
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado" 
                        HeaderText="Estado" 
                        SortExpression="Estado" 
                        Visible="False" />
                    <asp:BoundField 
                        DataField="Estado_Nombre" 
                        HeaderText="Estado_Nombre" 
                        SortExpression="Estado_Nombre"
                        Visible="False" />
                </Columns>
            </koala:KGrid >
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger 
                ControlID="gvParMantenimientoMensaje" 
                EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
    <table align="left">
        <tr align="left">
            <td>
            <koala:KFiltro ID="kftFiltro" 
            runat="server" 
            Contenedor="PAR_MANTENIMIENTO_MENSAJE" 
            Objeto="PAR_MANTENIMIENTO_MENSAJE" 
            IndiceScope ="Scope"
            Orden="1" ObjectDataSourceID="odsParMantenimientoMensaje"/>
            <asp:Button 
                ID="BtnParMantenimientoMensaje" 
                runat="server" 
                meta:resourcekey="Btn_Par_Mantenimiento_MensajeRecursoKCG" OnClick="BtnParMantenimientoMensaje_Click"/>
            </td>
        </tr>
    </table>
    
</asp:Content>

