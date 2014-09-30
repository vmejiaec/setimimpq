<%@ Control Language="C#" 
    AutoEventWireup="true" 
    CodeFile="SesionKCG.ascx.cs" 
    Inherits="WebUserControls_SesionKCG" %>
    
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="ajaxToolkit" %>


<asp:LinkButton ID="LnkSesion" runat="server" CssClass="textoSession" TabIndex ="-1" OnClick="LnkSesion_Click" />


<ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender2" runat="server" 
    TargetControlID="LnkSesion"
    ConfirmText= "Esta seguro de cambiar los parametros de sesión" 
    DisplayModalPopupID="ModalPopupExtender1"/>
<br />

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" 
    runat="server" 
    TargetControlID="LnkSesion" 
    PopupControlID="PNL" 
    OkControlID="ButtonOk" 
    CancelControlID="ButtonCancel"
    DropShadow="true"
    BackgroundCssClass="modalBackground"
     />
<asp:Panel ID="PNL" 
    runat="server" 
    style="display:none; width:200px; background-color:White; border-width:2px; border-color:Black; border-style:solid; padding:20px;">
    <div style="text-align:center;">
    Esta seguro de cambiar los parametros de sesión?
    </div>
    <br /><br />
    <div style="text-align:right;">
        <asp:Button ID="ButtonOk" runat="server" Text="Aceptar" />
        <asp:Button ID="ButtonCancel" runat="server" Text="Cancelar" />
    </div>
</asp:Panel>