<%@ Page Title="" Language="C#" 
MasterPageFile="~/MasterReportes.Master" 
AutoEventWireup="true" 
CodeBehind="COM_Com_Contrato_Control.aspx.cs" 
Inherits="WKA_Rep.COM.COM_Com_Contrato_Control" %>

 <%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" 
namespace="Microsoft.Reporting.WebForms" 
tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
        <tr>
            <td>Selecciona el año:</td>
            <td>
                <asp:DropDownList ID="ddlAnio" runat="server" AutoPostBack="true" 
                    onselectedindexchanged="ddlAnio_SelectedIndexChanged">
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        </table>
    </div>

    <div>    
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
            Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
            WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt"
            Height="480px" Width="825px">
            <LocalReport ReportPath="COM\Rep_Com_Contrato_Control.rdlc" 
                EnableExternalImages="true">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
    
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="GetByAnio" 
            TypeName="REL.COM.RO_Com_Contrato_Perfil" 
            OldValuesParameterFormatString="original_{0}" >            
            <SelectParameters>
                <asp:SessionParameter Name="s" SessionField="Scope" Type="Object" />
                
                <asp:ControlParameter ControlID="ddlAnio" Name="p_Anio" PropertyName="SelectedValue" Type="String" />
                
            </SelectParameters>
        </asp:ObjectDataSource>    
    </div>
</asp:Content>
