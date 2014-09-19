<%@ Page Language="C#" AutoEventWireup="true" CodeFile="browse.aspx.cs" Inherits="WKC.VER.browse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Escoger Directorio</title>
    <link rel="stylesheet" href="../UTIL/ESTILOS/EstilosOCP.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HyperLink ID="upLink" runat="server" CssClass="LINKLABEL"><img src="../Images/up.gif" /></asp:HyperLink>
        <br />
        <asp:Label ID="txtCurrentDir" runat="server"  CssClass="TEXTBOX" ></asp:Label>
        <asp:Button ID="btnCerrar" runat="server" OnClick="btnCerrar_Click" Text="Cerrar" CssClass="BUTTON" /><br />
        <br />
        <asp:Label ID="txtListing" runat="server"  CssClass="TEXTBOX" ></asp:Label></div>
        
    </form>
</body>
</html>
