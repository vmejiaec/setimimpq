<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucIdiomas.ascx.cs" Inherits="wucIdiomas" %>

<asp:DropDownList ID="ddlIdiomas" 
    CssClass="controlIdioma" 
    runat="server" 
    AutoPostBack="True"
    DataTextField="Nombre"
    DataValueField="Id"
    TabIndex="-1" 
    OnSelectedIndexChanged="ddlIdiomas_SelectedIndexChanged">
</asp:DropDownList>
 