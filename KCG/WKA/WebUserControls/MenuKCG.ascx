<%@ Control 
    Language="C#" 
    AutoEventWireup="true" 
    CodeFile="MenuKCG.ascx.cs" 
    Inherits="MenuKCG" %>

<asp:TextBox 
    ID="TextBox1"
    Height="40px"
    Width="44px"
    TabIndex="-1"
    BackColor="Transparent"
    BorderColor="transparent"
    BorderStyle="None"
    ReadOnly="true"
    runat="server"
    Text="" >
</asp:TextBox>
<asp:Menu
    ID="SegMenuKCG" 
    runat="server" 
    Orientation="Vertical">
</asp:Menu>
<asp:ImageButton 
    ID="ImgBtn_Refrescar" 
    runat="server" 
    Height="14px"
    ImageUrl="~/imagenes_acceso/actualizar.gif"
    ToolTip="Refrescar Menú"    
    Width="14px" />