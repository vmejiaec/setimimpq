<%@ Page Language="C#" 
    MasterPageFile="~/PAS/KCGInicioSesion.master" 
    AutoEventWireup="true" 
    CodeFile="PAR_ACCESO.aspx.cs" 
    Inherits="PAS_PAR_ACCESO" 
    Title="Ingreso al sistema" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" 
Namespace="AjaxControlToolkit" 
TagPrefix="cc1" %>

<asp:Content ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <div style="width:100%" align="center">
    
    <table width="781" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td >
            </td>
            <td >
                 <table height="258" border="0" cellpadding="0" cellspacing="0">
                    <tr height="120" valign="middle" align="center">
                        <td colspan="3" >
                            <asp:Image ID="imgLogoFolsal" runat="server" />
                        </td>
                    </tr>
                    <tr width="728" height="229">
                        <td align="center">
                            <table>
                                <tr align="center" >
                                    <td>
                                        <asp:UpdatePanel ID="UpdatePanel1"
                                            runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:Panel ID="Rec_Usuario"
                                                runat="server" 
                                                Width="300px" 
                                                Wrap="False">
                                                <table>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Lab_Txt_Usuario" 
                                                                runat="server" 
                                                                AssociatedControlID="Txt_Usuario">
                                                            </asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="Txt_Usuario"
                                                                runat="server" MaxLength="50" Width="150px" >
                                                            </asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" ID="UsuarioReq"
                                                                ControlToValidate="Txt_Usuario"
                                                                Display="None"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                                            <cc1:ValidatorCalloutExtender runat="Server" 
                                                                ID="UsuarioReqE"
                                                                TargetControlID="UsuarioReq" /></td>
                                                    </tr>      
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Lab_Txt_Contrasenia" runat="server" 
                                                                AssociatedControlID="Txt_Contrasenia">
                                                            </asp:Label>
                                                        </td>
                                                        <td align="left">
                                                            <asp:TextBox ID="Txt_Contrasenia" 
                                                                runat="server" MaxLength="60" TextMode="Password" Width="150px" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator runat="server" 
                                                                ID="ContraseniaReq"
                                                                ControlToValidate="Txt_Contrasenia"
                                                                Display="None"
                                                                ErrorMessage='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.ErrorMessage").ToString() %>'
                                                                Text='<%# HttpContext.GetLocalResourceObject("~/KOALA.master", "MSJ1RecursoKCG.Text").ToString() %>'/>
                                                            <cc1:ValidatorCalloutExtender runat="Server" 
                                                                ID="ContraseniaReqE"
                                                                TargetControlID="ContraseniaReq"/>
                                                            
                                                            </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="center">
                                                            <asp:Label ID="Mensaje" 
                                                                runat="server" 
                                                                EnableViewState="False"
                                                                >
                                                            </asp:Label>
                                                        </td>  
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="right">
                                                        <asp:Button ID="Btn_Conectarse" runat="server" 
                                                            OnClick="Btn_Conectarse_Click"  
                                                        />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                            
                                        <asp:UpdateProgress 
                                            ID="UpdateProgress1" 
                                            runat="server" 
                                            AssociatedUpdatePanelID="UpdatePanel1" 
                                            DisplayAfter="1">
                                            <ProgressTemplate>
                                                <div style="vertical-align:middle; text-align:center;">
                                                    <img src="../imagenes/ajaximagenes/cargando.gif" />&nbsp;</div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                        <asp:Panel ID="Rec_Sesion" runat="server" 
                                            Width="300px" 
                                            Wrap="False" 
                                            Enabled="False" 
                                            Visible="False" >
                                            <table>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="Lab_Cmb_Rol" runat="server" 
                                                        AssociatedControlID="Cmb_Rol">
                                                        </asp:Label>
                                                    </td>
                                                    <td align="left" style="width: 177px">
                                                        <asp:DropDownList ID="Cmb_Rol" runat="server" >
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
                                                    </td>
                                                    <td align="left" style="width: 177px">
                                                        <asp:CheckBox ID="Chk_Recordar_Seleccion" runat="server" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="right">
                                                        <asp:Button ID="Btn_Aceptar" runat="server" 
                                                            OnClick="Btn_Aceptar_Click"  
                                                        />
                                                        <asp:Button ID="Btn_Cancelar" runat="server" 
                                                            OnClick="Btn_Cancelar_Click"  
                                                        />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Btn_Conectarse" 
                                            EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    </td>
                                </tr>
                            
                            </table>
                              
                        </td>
                    </tr>
                   
                    <tr height="29" >
                        <td valign="middle">                     
                        </td>
                    </tr>
                 </table>
            </td>
            <td >
                </td>
        </tr>
       
        <tr>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
        </tr>
        
        <tr>
            <td colspan="3">
                </td>
        </tr>
        
       

    </table>
        
<cc1:updatepanelanimationextender id="UpdatePanelAnimationExtender1" 
    runat="server" 
    TargetControlID="UpdatePanel1">
    <Animations>
        <OnUpdating>
            <Sequence>
                <Parallel duration="0">
                    <EnableAction AnimationTarget="Btn_Conectarse" Enabled="false" />
                </Parallel>
                <Parallel duration="0">
                    <EnableAction AnimationTarget="Txt_Usuario" Enabled="false" />
                </Parallel>
                <Parallel duration="0">
                    <EnableAction AnimationTarget="Txt_Contrasenia" Enabled="false" />
                </Parallel>
            </Sequence>
        </OnUpdating>     
    </Animations>
</cc1:updatepanelanimationextender>
    
    
    </div>

</asp:Content>

