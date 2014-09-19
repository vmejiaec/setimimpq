<%@ Control 
    Language="C#" 
    AutoEventWireup="true" 
    CodeFile="wucMensajeEliminar.ascx.cs" 
    Inherits="WebUserControls_wucMensajeEliminar" %>
<%@ Register 
    Assembly="AjaxControlToolkit" 
    Namespace="AjaxControlToolkit" 
    TagPrefix="AjaxControlToolkit" %>

<AjaxControlToolkit:ConfirmButtonExtender 
    ID="ConfirmButtonExtender2" 
    runat="server" 
    TargetControlID="DeleteButton"
    ConfirmText= "Esta seguro de insertar los parametros de sesión" 
    DisplayModalPopupID="ModalPopupExtender1"/>
    <br />
<AjaxControlToolkit:ModalPopupExtender ID="ModalPopupExtender1" 
     runat="server" 
     TargetControlID="DeleteButton" 
     PopupControlID="PNL" 
     OkControlID="ButtonOk" 
     CancelControlID="ButtonCancel"
     DropShadow="true" />
     <%--BackgroundCssClass="modalBackground"--%>
<asp:Panel 
    ID="PNL" 
    runat="server" 
    style="display:none; width:200px; background-color:White; border-width:2px; border-color:Black; border-style:solid; padding:20px;">
        <div style="text-align:center;">
            <asp:Label 
                ID="Label1" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ11RecursoKCG.Text").ToString() %>'>
            </asp:Label>      
        </div>
        <br />
        <br />
        <div style="text-align:center;">
            <asp:Button 
                ID="ButtonOk" 
                runat="server" 
               Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AceptarRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_AceptarRecursoKCG.ToolTip").ToString() %>' />
            <asp:Button 
                ID="ButtonCancel" 
                runat="server" 
                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.Text").ToString() %>'
                ToolTip='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "Btn_CancelRecursoKCG.ToolTip").ToString() %>' />
         </div>
</asp:Panel>